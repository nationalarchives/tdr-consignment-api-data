import com.github.tototoshi.sbt.slick.CodegenPlugin.autoImport.slickCodegenDatabaseUrl
import sbt.Keys.libraryDependencies
import sbtrelease.ReleaseStateTransformations.{checkSnapshotDependencies, commitNextVersion, commitReleaseVersion, inquireVersions, pushChanges, runClean, runTest, setNextVersion, setReleaseVersion, tagRelease}
import slick.codegen.SourceCodeGenerator
import slick.{model => m}

ThisBuild / scalaVersion     := "2.13.0"
ThisBuild / version := (version in ThisBuild).value
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

releasePublishArtifactsAction := PgpKeys.publishSigned.value

releaseProcess := Seq[ReleaseStep](
  checkSnapshotDependencies,
  inquireVersions,
  runClean,
  runTest,
  setReleaseVersion,
  commitReleaseVersion,
  tagRelease,
  releaseStepCommandAndRemaining("+publishSigned"),
  releaseStepCommand("sonatypeBundleRelease"),
  setNextVersion,
  commitNextVersion,
  pushChanges
)

lazy val databasePort = sys.env.getOrElse("DB_PORT", "3306")
lazy val databaseUrl = s"jdbc:mysql://localhost:$databasePort/consignmentapi"
lazy val databaseUser = "root"
lazy val databasePassword = "password"

resolvers +=
  "Sonatype OSS Snapshots" at "https://oss.sonatype.org/content/repositories/snapshots"


lazy val root = (project in file("."))
  .settings(

    libraryDependencies ++= Seq(
      "com.typesafe.slick" %% "slick"  % slickVersion,
      "com.typesafe.slick" %% "slick-hikaricp" % slickVersion,
      "com.typesafe.slick" %% "slick-codegen"  % slickVersion
    ),
    name := "consignment-api-db",
    slickCodegenDatabaseUrl := databaseUrl,
    slickCodegenDatabaseUser := databaseUser,
    slickCodegenDatabasePassword := databasePassword,
    slickCodegenDriver := slick.jdbc.MySQLProfile,
    slickCodegenJdbcDriver := "com.mysql.cj.jdbc.Driver",
    slickCodegenOutputPackage := "uk.gov.nationalarchives",
    slickCodegenExcludedTables := Seq("schema_version"),
    slickCodegenCodeGenerator := { (model:  m.Model) =>
      new SourceCodeGenerator(model) {
        override def Table = new Table(_) {
          override def autoIncLastAsOption = true
        }
      }
    },
    slickCodegenOutputDir := (scalaSource in Compile).value

  ).enablePlugins(CodegenPlugin)


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



enablePlugins(FlywayPlugin)

flywayUrl := s"jdbc:mysql://localhost:$databasePort/consignmentapi"
flywayUser := "root"
flywayPassword := "password"
flywayLocations += "filesystem:lambda/src/main/resources/db/migration"
flywaySchemas += "consignmentapi"
