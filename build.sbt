import Dependencies._
import sbt.Keys.libraryDependencies

ThisBuild / scalaVersion     := "2.13.0"
ThisBuild / version          := "0.1.0-SNAPSHOT"
ThisBuild / organization     := "nationalarchives"
ThisBuild / organizationName := "tdr"

val slickVersion = "3.3.2"

lazy val root = (project in file("."))
  .settings(
    name := "tdr-database-migrations"
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
  val pkg = "uk.gov.nationalarchives.tdr"
  val outputDir = "src/main/scala"
  r.run("slick.codegen.SourceCodeGenerator",
    cp.files, Array(slickDriver, jdbcDriver, url, outputDir, pkg, user, password),  s.log).failed foreach (sys error _.getMessage)
  val fname = outputDir + "/consignmentapi/Tables.scala"
  Seq(file(fname))
}

