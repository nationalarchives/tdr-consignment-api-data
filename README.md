## Consigment API Database Migrations

### Adding a migration script

* Add a sql file to `lambda/src/main/resources/db/migration` with a prefix of `V\d__something.sql`
* Version bump in build.sbt
* This will trigger a Jenkins job which will:
    * Run a lambda which updates the database within that environment.
    * Use slick codegen to generate slick files based on the database schema.
    * Deploy this code to Sonatype Nexus.
