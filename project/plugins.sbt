addSbtPlugin("com.eed3si9n" % "sbt-assembly" % "2.1.1")
addSbtPlugin("org.scalastyle" %% "scalastyle-sbt-plugin" % "1.0.0")
addSbtPlugin("io.github.davidmweber" % "flyway-sbt" % "7.4.0")
libraryDependencies ++= Seq(
  "javax.xml.bind" % "jaxb-api" % "2.4.0-b180830.0359",
  "org.postgresql" % "postgresql" % "42.6.0",
  "com.sun.activation" % "javax.activation" % "1.2.0"
)
addSbtPlugin("com.github.tototoshi" % "sbt-slick-codegen" % "2.0.0")
addSbtPlugin("com.github.sbt" % "sbt-release" % "1.1.0")
addSbtPlugin("org.xerial.sbt" % "sbt-sonatype" % "3.9.18")
addSbtPlugin("com.github.sbt" % "sbt-pgp" % "2.2.1")
