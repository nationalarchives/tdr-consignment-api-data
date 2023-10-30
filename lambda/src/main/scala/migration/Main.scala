package migration

import org.flywaydb.core.Flyway
import org.flywaydb.core.api.output.MigrateResult
import pureconfig._
import pureconfig.generic.auto._
import software.amazon.awssdk.auth.credentials.DefaultCredentialsProvider
import software.amazon.awssdk.regions.Region
import software.amazon.awssdk.services.rds.RdsUtilities
import software.amazon.awssdk.services.rds.model.GenerateAuthenticationTokenRequest

class Main {

  case class MigrationConfig(host: String, port: Int, url: String, username: String)

  def runMigration(): MigrateResult = {
    val config = ConfigSource.default.load[MigrationConfig] match {
      case Left(value) => throw new RuntimeException(s"Failed to load database migration config${value.prettyPrint()}")
      case Right(value) => value
    }
    val rdsClient = RdsUtilities.builder().region(Region.EU_WEST_2).build()
    val request = GenerateAuthenticationTokenRequest.builder()
      .credentialsProvider(DefaultCredentialsProvider.builder().build())
      .hostname(config.host)
      .port(config.port)
      .username(config.username)
      .region(Region.EU_WEST_2)
      .build()

    val password = rdsClient.generateAuthenticationToken(request)
    val url = s"${config.url}?ssl=true&sslrootcert=${getClass.getResource("/rds-eu-west-2-bundle.pem").getPath}&sslmode=verify-full"
    val flyway = Flyway.configure()
      .dataSource(url, config.username, password)
      .load()

    flyway.migrate()
  }

}
