package migration

import org.flywaydb.core.Flyway

class Main {

  def runMigration(): Int = {
    val flyway = Flyway.configure()
      .dataSource(sys.env("DB_URL"), sys.env("DB_USER"), sys.env("DB_PASSWORD"))
      .load()

    flyway.migrate()
  }

}
