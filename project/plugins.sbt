addSbtPlugin("com.eed3si9n" % "sbt-assembly" % "0.14.10")
addSbtPlugin("com.jsuereth" % "sbt-pgp" % "2.0.1")
addSbtPlugin("org.scalastyle" %% "scalastyle-sbt-plugin" % "1.0.0")
addSbtPlugin("io.github.davidmweber" % "flyway-sbt" % "6.1.4")
addSbtPlugin("org.xerial.sbt" % "sbt-sonatype" % "3.8.1")
libraryDependencies ++= Seq(
  "mysql" % "mysql-connector-java" % "8.0.19"
)
addSbtPlugin("com.github.tototoshi" % "sbt-slick-codegen" % "1.4.0")
addSbtPlugin("com.github.gseitz" % "sbt-release" % "1.0.13")