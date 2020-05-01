# Consignment API data

This project is part of [Transfer Digital Records][tdr]. It provides tools for working with the consignment database:

* Database migrations
* Scala code generation

[tdr]: https://github.com/nationalarchives/tdr-dev-documentation

## Database Migrations

### Adding a migration script

* Add a sql file to `lambda/src/main/resources/db/migration` with a prefix of `V\d__something.sql`
* This will trigger a Jenkins job which will:
    * Run a lambda which updates the database within that environment.
    * Use slick codegen to generate slick files based on the database schema.
    * Deploy this code to Sonatype Nexus.

## Code generation

The project uses slick-codegen to generate [Slick] classes based on the database structure

To generate code locally based on the current state of your local database, run `sbt slickCodegen`.

To publish a new version of the consignment-api-db library containing the generated code, build the "TDR Graphql Code
Generation" Jenkins job.

[Slick]: http://scala-slick.org/

## Using updated schema locally

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
