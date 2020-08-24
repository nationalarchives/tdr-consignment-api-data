# Consignment API data

This project is part of [Transfer Digital Records][tdr]. It provides tools for working with the consignment database:

* Database migrations
* Scala code generation

[tdr]: https://github.com/nationalarchives/tdr-dev-documentation

## Database Migrations

### Adding a migration script

* Add a sql file to `lambda/src/main/resources/db/migration` with a prefix of `V\d__something.sql`

The name of the migration should use snake_case, e.g. V123__add_date_column_to_series_table, because Flyway expects this
format when it generates the migration name.

To run migrations locally, run `sbt flywayMigrate`.

### Deployment

Run the following Jenkins jobs:

* TDR Database Migrations Deploy: this builds the migration code and deploys it
  to the Lambda which will run the migrations
* TDR Database Migrations Run: this runs the latest version of the migrations
  lambda

Migrations that have been merged to master will be run automatically on the Integration environment and can be run
manually on other environments by the `TDR Database Migrations Deploy` Jenkins job. The job will:

* Run a lambda which updates the database within that environment.
* Use slick codegen to generate slick files based on the database schema.
* Deploy this code to the S3 release bucket.

## Code generation

The project uses slick-codegen to generate [Slick] classes based on the database structure

[Slick]: http://scala-slick.org/

### Publish generated code

* Run the `TDR Database Migrations Publish` Jenkins job. This publishes a new
  version of the `consignment-api-db` library.

### Using updated schema locally

To use updated schema locally for development, run the following commands:

`sbt slickCodegen`
`sbt publishLocal`

This will place a snapshot version of the built project jar in the local .ivy cache folder: $HOME/.ivy2/local/uk.gov.nationalarchives/consignment-api-db_2.13/[version number]-SNAPSHOT

Other sbt projects that have this project as a dependency can access the local snapshot version by changing the version number in their build.sbt file, for example:

```
... other dependencies...
"uk.gov.nationalarchives" %% "consignment-api-db" % "[version number]-SNAPSHOT"
... other dependences...
```
