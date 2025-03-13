import com.github.tototoshi.sbt.slick.CodegenPlugin.autoImport.slickCodegenDatabaseUrl
import sbt.Keys.{libraryDependencies, publishTo}
import ReleaseTransformations._
import xerial.sbt.Sonatype.autoImport.sonatypePublishToBundle
import java.io.FileWriter

ThisBuild / scalaVersion     := "2.13.16"
ThisBuild / version := (ThisBuild / version).value
ThisBuild / organization     := "uk.gov.nationalarchives"
ThisBuild / organizationName := "National Archives"

ThisBuild / scmInfo := Some(
  ScmInfo(
    url("https://github.com/nationalarchives/tdr-consignment-api-data"),
    "git@github.com:nationalarchives/tdr-consignment-api-data.git"
  )
)
developers := List(
  Developer(
    id    = "tna-da-bot",
    name  = "TNA Digital Archiving",
    email = "s-GitHubDABot@nationalarchives.gov.uk",
    url   = url("https://github.com/nationalarchives/tdr-consignment-api-data")
  )
)

ThisBuild / description := "Slick classes generated from the database schema for the Transfer Digital Records service"
ThisBuild / licenses := List("MIT" -> new URL("https://choosealicense.com/licenses/mit/"))
ThisBuild / homepage := Some(url("https://github.com/nationalarchives/tdr-consignment-api-data"))

val slickVersion = "3.5.2"

lazy val databasePort = sys.env.getOrElse("DB_PORT", "5432")
lazy val databaseUrl = s"jdbc:postgresql://localhost:$databasePort/consignmentapi"
lazy val databaseUser = "migrations_user"
lazy val databasePassword = "migrations_password"

lazy val setLatestTagOutput = taskKey[Unit]("Generates a changelog file from the last version")

setLatestTagOutput := {
  val fileWriter = new FileWriter(sys.env("GITHUB_OUTPUT"), true)
  fileWriter.write(s"latest-tag=${(ThisBuild / version).value}\n")
  fileWriter.close()
}

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
    slickCodegenDriver := slick.jdbc.PostgresProfile,
    slickCodegenJdbcDriver := "org.postgresql.Driver",
    slickCodegenOutputPackage := "uk.gov.nationalarchives",
    slickCodegenExcludedTables := Seq("schema_version"),
    slickCodegenOutputDir := (Compile / scalaSource).value,
    releaseIgnoreUntrackedFiles := true,
    useGpgPinentry := true,
    publishTo := sonatypePublishToBundle.value,
    publishMavenStyle := true,
    releaseProcess := Seq[ReleaseStep](
      releaseStepTask(lambda / assembly),
      checkSnapshotDependencies,
      inquireVersions,
      runClean,
      runTest,
      setReleaseVersion,
      releaseStepTask(setLatestTagOutput),
      commitReleaseVersion,
      pushChanges,
      releaseStepCommand("publishSigned"),
      releaseStepCommand("sonatypeBundleRelease"),
      setNextVersion,
      commitNextVersion,
      pushChanges
    )
  ).enablePlugins(CodegenPlugin)

val flywayVersion = "11.4.0"

lazy val lambda = (project in file("lambda"))
    .settings(
      name := "tdr-database-migration-lambda",
      libraryDependencies ++= Seq(
        "org.flywaydb" % "flyway-core" % flywayVersion,
        "org.flywaydb" % "flyway-database-postgresql" % flywayVersion,
        "software.amazon.awssdk" % "rds" % "2.29.45",
        "org.postgresql" % "postgresql" % "42.7.5",
        "com.github.pureconfig" %% "pureconfig" % "0.17.8"
      ),
      (assembly / assemblyMergeStrategy) := {
        case PathList("META-INF", "services", xs @ _*) => MergeStrategy.concat
        case PathList("META-INF", xs @ _*) => MergeStrategy.discard
        case _ => MergeStrategy.first
      },
      (assembly / assemblyJarName) := "db-migrations.jar"
    )

enablePlugins(FlywayPlugin)

flywayUrl := s"jdbc:postgresql://localhost:$databasePort/consignmentapi"
flywayUser := "tdr"
flywayPassword := "password"
flywayLocations += "filesystem:lambda/src/main/resources/db/migration"
