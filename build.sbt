import Dependencies._
import sbt.Keys.libraryDependencies

ThisBuild / scalaVersion     := "2.13.0"
ThisBuild / version          := "0.1.0"
ThisBuild / organization     := "uk.gov.nationalarchives"
ThisBuild / organizationName := "National Archives"

ThisBuild / scmInfo := Some(
  ScmInfo(
    url("https://github.com/nationalarchives/tdr-consignment-api-data"),
    "git@github.com:nationalarchives/tdr-consignment-api-data.git"
  )
)
ThisBuild / developers := List(
  Developer(
    id    = "SP",
    name  = "Sam Palmer",
    email = "sam.palmer@nationalarchives.gov.uk",
    url   = url("http://tdr-transfer-integration.nationalarchives.gov.uk")
  )
)

ThisBuild / description := "Slick classes generated from the database schema for the Transfer Digital Records service"
ThisBuild / licenses := List("MIT" -> new URL("https://choosealicense.com/licenses/mit/"))
ThisBuild / homepage := Some(url("https://github.com/nationalarchives/tdr-consignment-api-data"))

// Remove all additional repository other than Maven Central from POM
ThisBuild / pomIncludeRepository := { _ => false }
ThisBuild / publishTo := sonatypePublishToBundle.value
ThisBuild / publishMavenStyle := true


val slickVersion = "3.3.2"
useGpgPinentry := true


lazy val root = (project in file("."))
  .settings(
    name := "consignment-api-db"


  )

lazy val lambda = (project in file("lambda"))
    .settings(
      name := "tdr-database-migration-lambda",
      libraryDependencies ++= Seq(
        "org.flywaydb" % "flyway-core" % "6.1.4",
        "mysql" % "mysql-connector-java" % "5.1.16"
      ),
      assemblyMergeStrategy in assembly := {
        case PathList("META-INF", xs @ _*) => MergeStrategy.discard
        case _ => MergeStrategy.first
      }

    )

libraryDependencies ++= Seq(
  "org.flywaydb" % "flyway-core" % "6.1.4",
  "mysql" % "mysql-connector-java" % "5.1.16",
  "com.typesafe.slick" %% "slick"  % slickVersion,
  "com.typesafe.slick" %% "slick-hikaricp" % slickVersion,
  "com.typesafe.slick" %% "slick-codegen"  % slickVersion
)

lazy val slick = taskKey[Seq[File]]("gen-tables")

slick := {
  val cp = (dependencyClasspath in Compile).value
  val r = (runner in Compile).value
  val s = streams.value
  val url = "jdbc:mysql://localhost:3306/consignmentapi"
  val jdbcDriver = "com.mysql.jdbc.Driver"
  val slickDriver = "slick.jdbc.MySQLProfile"
  val user = "root"
  val password = "password"
  val pkg = "uk.gov.nationalarchives"
  val outputDir = "src/main/scala"
  r.run("slick.codegen.SourceCodeGenerator",
    cp.files, Array(slickDriver, jdbcDriver, url, outputDir, pkg, user, password),  s.log).failed foreach (sys error _.getMessage)
  val fname = outputDir + "/consignmentapi/Tables.scala"
  Seq(file(fname))
}

enablePlugins(FlywayPlugin)
version := "0.0.1"
name := "flyway-sbt-test1"

flywayUrl := "jdbc:mysql://localhost:3306/consignmentapi"
flywayUser := "root"
flywayPassword := "password"
flywayLocations += "filesystem:lambda/src/main/resources/db/migration"
flywaySchemas += "consignmentapi"

