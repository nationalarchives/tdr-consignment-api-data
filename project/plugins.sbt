addSbtPlugin("com.eed3si9n" % "sbt-assembly" % "0.14.10")
addSbtPlugin("org.scalastyle" %% "scalastyle-sbt-plugin" % "1.0.0")
addSbtPlugin("io.github.davidmweber" % "flyway-sbt" % "6.1.4")
libraryDependencies ++= Seq(
  "javax.xml.bind" % "jaxb-api" % "2.4.0-b180830.0359",
  "org.postgresql" % "postgresql" % "42.2.11"
)
addSbtPlugin("com.github.tototoshi" % "sbt-slick-codegen" % "1.4.0")
addSbtPlugin("com.github.gseitz" % "sbt-release" % "1.0.13")
resolvers += Resolver.jcenterRepo
addSbtPlugin("ohnosequences" % "sbt-s3-resolver" % "0.19.0")