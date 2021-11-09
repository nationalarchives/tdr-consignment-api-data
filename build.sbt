import com.github.tototoshi.sbt.slick.CodegenPlugin.autoImport.slickCodegenDatabaseUrl
import sbt.Keys.libraryDependencies
import ReleaseTransformations._
import scala.sys.process._

import java.nio.charset.StandardCharsets
import java.nio.file.{Files, Paths}

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

s3acl := None
s3sse := true

ThisBuild / publishMavenStyle := true

ThisBuild / publishTo := {
  val prefix = if (isSnapshot.value) "snapshots" else "releases"
  Some(s3resolver.value(s"My $prefix S3 bucket", s3(s"tdr-$prefix-mgmt")))
}

val slickVersion = "3.3.2"

lazy val databasePort = sys.env.getOrElse("DB_PORT", "5432")
lazy val databaseUrl = s"jdbc:postgresql://localhost:$databasePort/consignmentapi"
lazy val databaseUser = "tdr"
lazy val databasePassword = "password"

lazy val generateChangelogFile = taskKey[Unit]("Generates a changelog file from the last version")

generateChangelogFile := {
  val lastTag = "git describe --tags --abbrev=0".!!.replace("\n","")
  val gitLog = s"git log $lastTag..HEAD --oneline".!!
  val folderName = s"${baseDirectory.value}/notes"
  val fileName = s"${version.value}.markdown"
  val fullPath = s"$folderName/$fileName"
  new File(folderName).mkdirs()
  val file = new File(fullPath)
  if(!file.exists()) {
    new File(fullPath).createNewFile
    Files.write(Paths.get(fullPath), gitLog.getBytes(StandardCharsets.UTF_8))
  }
  s"git add $fullPath".!!
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
    slickCodegenOutputDir := (scalaSource in Compile).value,
    ghreleaseRepoOrg := "nationalarchives",
    ghreleaseRepoName := "tdr-consignment-api-data",
    ghreleaseAssets := Seq(file(s"${(lambda / assembly / target).value}/${(lambda /assembly / assemblyJarName).value}")),
    releaseIgnoreUntrackedFiles := true,
    releaseProcess := Seq[ReleaseStep](
      releaseStepTask(lambda / assembly),
      inquireVersions,
      setReleaseVersion,
      releaseStepTask(generateChangelogFile),
      commitReleaseVersion,
      tagRelease,
      pushChanges,
      releaseStepInputTask(githubRelease),
      publishArtifacts,
      setNextVersion,
      commitNextVersion,
      pushChanges
    ),

  ).enablePlugins(CodegenPlugin)


lazy val lambda = (project in file("lambda"))
    .settings(
      name := "tdr-database-migration-lambda",
      libraryDependencies ++= Seq(
        "org.flywaydb" % "flyway-core" % "6.1.4",
        "software.amazon.awssdk" % "rds" % "2.16.16",
        "org.postgresql" % "postgresql" % "42.2.11",
        "com.github.pureconfig" %% "pureconfig" % "0.14.1"
      ),
      assemblyMergeStrategy in assembly := {
        case PathList("META-INF", xs @ _*) => MergeStrategy.discard
        case _ => MergeStrategy.first
      },
      assemblyJarName in assembly := "db-migrations.jar"
    )

enablePlugins(FlywayPlugin)

flywayUrl := s"jdbc:postgresql://localhost:$databasePort/consignmentapi"
flywayUser := "tdr"
flywayPassword := "password"
flywayLocations += "filesystem:lambda/src/main/resources/db/migration"
