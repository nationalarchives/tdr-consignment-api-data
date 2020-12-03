package migration

import org.flywaydb.core.Flyway

class Main {

  def runMigration(): Int = {
    val url = s"${sys.env("DB_URL")}?ssl=true&sslrootcert=${getClass.getResource("/rds-ca-2019-root.pem").getPath}&sslmode=verify-full"
    val flyway = Flyway.configure()
      .dataSource(url, sys.env("DB_USER"), sys.env("DB_PASSWORD"))
      .load()

    flyway.migrate()
  }

}
