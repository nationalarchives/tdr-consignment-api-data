package uk.gov.nationalarchives
// AUTO-GENERATED Slick data model
/** Stand-alone Slick data model for immediate use */
object Tables extends {
  val profile = slick.jdbc.MySQLProfile
} with Tables

/** Slick data model trait for extension, choice of backend or usage in the cake pattern. (Make sure to initialize this late.) */
trait Tables {
  val profile: slick.jdbc.JdbcProfile
  import profile.api._
  import slick.model.ForeignKeyAction
  // NOTE: GetResult mappers for plain SQL are only generated for tables where Slick knows how to map the types of all columns.
  import slick.jdbc.{GetResult => GR}

  /** DDL for all tables. Call .create to execute. */
  lazy val schema: profile.SchemaDescription = Array(Avmetadata.schema, Body.schema, Clientfilemetadata.schema, Consignment.schema, Consignmentmetadata.schema, Consignmentproperty.schema, Ffidmetadata.schema, File.schema, Filemetadata.schema, Fileproperty.schema, FlywaySchemaHistory.schema, Series.schema, User.schema).reduceLeft(_ ++ _)
  @deprecated("Use .schema instead of .ddl", "3.0")
  def ddl = schema

  /** Entity class storing rows of table Avmetadata
   *  @param software Database column Software SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param value Database column Value SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param softwareversion Database column SoftwareVersion SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param databaseversion Database column DatabaseVersion SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param result Database column Result SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param datetime Database column Datetime SqlType(TIMESTAMP)
   *  @param fileid Database column FileId SqlType(BIGINT), AutoInc, PrimaryKey */
  case class AvmetadataRow(software: Option[String] = None, value: Option[String] = None, softwareversion: Option[String] = None, databaseversion: Option[String] = None, result: Option[String] = None, datetime: java.sql.Timestamp, fileid: Option[Long] = None)
  /** GetResult implicit for fetching AvmetadataRow objects using plain SQL queries */
  implicit def GetResultAvmetadataRow(implicit e0: GR[Option[String]], e1: GR[java.sql.Timestamp], e2: GR[Option[Long]]): GR[AvmetadataRow] = GR{
    prs => import prs._
    val r = (<<?[Long], <<?[String], <<?[String], <<?[String], <<?[String], <<?[String], <<[java.sql.Timestamp])
    import r._
    AvmetadataRow.tupled((_2, _3, _4, _5, _6, _7, _1)) // putting AutoInc last
  }
  /** Table description of table AVMetadata. Objects of this class serve as prototypes for rows in queries. */
  class Avmetadata(_tableTag: Tag) extends profile.api.Table[AvmetadataRow](_tableTag, Some("consignmentapi"), "AVMetadata") {
    def * = (software, value, softwareversion, databaseversion, result, datetime, Rep.Some(fileid)) <> (AvmetadataRow.tupled, AvmetadataRow.unapply)
    /** Maps whole row to an option. Useful for outer joins. */
    def ? = ((software, value, softwareversion, databaseversion, result, Rep.Some(datetime), Rep.Some(fileid))).shaped.<>({r=>import r._; _6.map(_=> AvmetadataRow.tupled((_1, _2, _3, _4, _5, _6.get, _7)))}, (_:Any) =>  throw new Exception("Inserting into ? projection not supported."))

    /** Database column Software SqlType(VARCHAR), Length(255,true), Default(None) */
    val software: Rep[Option[String]] = column[Option[String]]("Software", O.Length(255,varying=true), O.Default(None))
    /** Database column Value SqlType(VARCHAR), Length(255,true), Default(None) */
    val value: Rep[Option[String]] = column[Option[String]]("Value", O.Length(255,varying=true), O.Default(None))
    /** Database column SoftwareVersion SqlType(VARCHAR), Length(255,true), Default(None) */
    val softwareversion: Rep[Option[String]] = column[Option[String]]("SoftwareVersion", O.Length(255,varying=true), O.Default(None))
    /** Database column DatabaseVersion SqlType(VARCHAR), Length(255,true), Default(None) */
    val databaseversion: Rep[Option[String]] = column[Option[String]]("DatabaseVersion", O.Length(255,varying=true), O.Default(None))
    /** Database column Result SqlType(VARCHAR), Length(255,true), Default(None) */
    val result: Rep[Option[String]] = column[Option[String]]("Result", O.Length(255,varying=true), O.Default(None))
    /** Database column Datetime SqlType(TIMESTAMP) */
    val datetime: Rep[java.sql.Timestamp] = column[java.sql.Timestamp]("Datetime")
    /** Database column FileId SqlType(BIGINT), AutoInc, PrimaryKey */
    val fileid: Rep[Long] = column[Long]("FileId", O.AutoInc, O.PrimaryKey)

    /** Foreign key referencing File (database name AVMetadata_ibfk_1) */
    lazy val fileFk = foreignKey("AVMetadata_ibfk_1", fileid, File)(r => r.fileid, onUpdate=ForeignKeyAction.Restrict, onDelete=ForeignKeyAction.Restrict)
  }
  /** Collection-like TableQuery object for table Avmetadata */
  lazy val Avmetadata = new TableQuery(tag => new Avmetadata(tag))

  /** Entity class storing rows of table Body
   *  @param name Database column Name SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param code Database column Code SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param description Database column Description SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param bodyid Database column BodyId SqlType(BIGINT), AutoInc, PrimaryKey */
  case class BodyRow(name: Option[String] = None, code: Option[String] = None, description: Option[String] = None, bodyid: Option[Long] = None)
  /** GetResult implicit for fetching BodyRow objects using plain SQL queries */
  implicit def GetResultBodyRow(implicit e0: GR[Option[String]], e1: GR[Option[Long]]): GR[BodyRow] = GR{
    prs => import prs._
    val r = (<<?[Long], <<?[String], <<?[String], <<?[String])
    import r._
    BodyRow.tupled((_2, _3, _4, _1)) // putting AutoInc last
  }
  /** Table description of table Body. Objects of this class serve as prototypes for rows in queries. */
  class Body(_tableTag: Tag) extends profile.api.Table[BodyRow](_tableTag, Some("consignmentapi"), "Body") {
    def * = (name, code, description, Rep.Some(bodyid)) <> (BodyRow.tupled, BodyRow.unapply)
    /** Maps whole row to an option. Useful for outer joins. */
    def ? = ((name, code, description, Rep.Some(bodyid))).shaped.<>({r=>import r._; _4.map(_=> BodyRow.tupled((_1, _2, _3, _4)))}, (_:Any) =>  throw new Exception("Inserting into ? projection not supported."))

    /** Database column Name SqlType(VARCHAR), Length(255,true), Default(None) */
    val name: Rep[Option[String]] = column[Option[String]]("Name", O.Length(255,varying=true), O.Default(None))
    /** Database column Code SqlType(VARCHAR), Length(255,true), Default(None) */
    val code: Rep[Option[String]] = column[Option[String]]("Code", O.Length(255,varying=true), O.Default(None))
    /** Database column Description SqlType(VARCHAR), Length(255,true), Default(None) */
    val description: Rep[Option[String]] = column[Option[String]]("Description", O.Length(255,varying=true), O.Default(None))
    /** Database column BodyId SqlType(BIGINT), AutoInc, PrimaryKey */
    val bodyid: Rep[Long] = column[Long]("BodyId", O.AutoInc, O.PrimaryKey)
  }
  /** Collection-like TableQuery object for table Body */
  lazy val Body = new TableQuery(tag => new Body(tag))

  /** Entity class storing rows of table Clientfilemetadata
   *  @param originalpath Database column OriginalPath SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param checksum Database column Checksum SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param checksumtype Database column ChecksumType SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param lastmodified Database column LastModified SqlType(TIMESTAMP)
   *  @param createddate Database column CreatedDate SqlType(TIMESTAMP)
   *  @param filesize Database column Filesize SqlType(DECIMAL), Default(None)
   *  @param datetime Database column Datetime SqlType(TIMESTAMP)
   *  @param fileid Database column FileId SqlType(BIGINT), AutoInc, PrimaryKey */
  case class ClientfilemetadataRow(originalpath: Option[String] = None, checksum: Option[String] = None, checksumtype: Option[String] = None, lastmodified: java.sql.Timestamp, createddate: java.sql.Timestamp, filesize: Option[scala.math.BigDecimal] = None, datetime: java.sql.Timestamp, fileid: Option[Long] = None)
  /** GetResult implicit for fetching ClientfilemetadataRow objects using plain SQL queries */
  implicit def GetResultClientfilemetadataRow(implicit e0: GR[Option[String]], e1: GR[java.sql.Timestamp], e2: GR[Option[scala.math.BigDecimal]], e3: GR[Option[Long]]): GR[ClientfilemetadataRow] = GR{
    prs => import prs._
    val r = (<<?[Long], <<?[String], <<?[String], <<?[String], <<[java.sql.Timestamp], <<[java.sql.Timestamp], <<?[scala.math.BigDecimal], <<[java.sql.Timestamp])
    import r._
    ClientfilemetadataRow.tupled((_2, _3, _4, _5, _6, _7, _8, _1)) // putting AutoInc last
  }
  /** Table description of table ClientFileMetadata. Objects of this class serve as prototypes for rows in queries. */
  class Clientfilemetadata(_tableTag: Tag) extends profile.api.Table[ClientfilemetadataRow](_tableTag, Some("consignmentapi"), "ClientFileMetadata") {
    def * = (originalpath, checksum, checksumtype, lastmodified, createddate, filesize, datetime, Rep.Some(fileid)) <> (ClientfilemetadataRow.tupled, ClientfilemetadataRow.unapply)
    /** Maps whole row to an option. Useful for outer joins. */
    def ? = ((originalpath, checksum, checksumtype, Rep.Some(lastmodified), Rep.Some(createddate), filesize, Rep.Some(datetime), Rep.Some(fileid))).shaped.<>({r=>import r._; _4.map(_=> ClientfilemetadataRow.tupled((_1, _2, _3, _4.get, _5.get, _6, _7.get, _8)))}, (_:Any) =>  throw new Exception("Inserting into ? projection not supported."))

    /** Database column OriginalPath SqlType(VARCHAR), Length(255,true), Default(None) */
    val originalpath: Rep[Option[String]] = column[Option[String]]("OriginalPath", O.Length(255,varying=true), O.Default(None))
    /** Database column Checksum SqlType(VARCHAR), Length(255,true), Default(None) */
    val checksum: Rep[Option[String]] = column[Option[String]]("Checksum", O.Length(255,varying=true), O.Default(None))
    /** Database column ChecksumType SqlType(VARCHAR), Length(255,true), Default(None) */
    val checksumtype: Rep[Option[String]] = column[Option[String]]("ChecksumType", O.Length(255,varying=true), O.Default(None))
    /** Database column LastModified SqlType(TIMESTAMP) */
    val lastmodified: Rep[java.sql.Timestamp] = column[java.sql.Timestamp]("LastModified")
    /** Database column CreatedDate SqlType(TIMESTAMP) */
    val createddate: Rep[java.sql.Timestamp] = column[java.sql.Timestamp]("CreatedDate")
    /** Database column Filesize SqlType(DECIMAL), Default(None) */
    val filesize: Rep[Option[scala.math.BigDecimal]] = column[Option[scala.math.BigDecimal]]("Filesize", O.Default(None))
    /** Database column Datetime SqlType(TIMESTAMP) */
    val datetime: Rep[java.sql.Timestamp] = column[java.sql.Timestamp]("Datetime")
    /** Database column FileId SqlType(BIGINT), AutoInc, PrimaryKey */
    val fileid: Rep[Long] = column[Long]("FileId", O.AutoInc, O.PrimaryKey)

    /** Foreign key referencing File (database name ClientFileMetadata_ibfk_1) */
    lazy val fileFk = foreignKey("ClientFileMetadata_ibfk_1", fileid, File)(r => r.fileid, onUpdate=ForeignKeyAction.Restrict, onDelete=ForeignKeyAction.Restrict)
  }
  /** Collection-like TableQuery object for table Clientfilemetadata */
  lazy val Clientfilemetadata = new TableQuery(tag => new Clientfilemetadata(tag))

  /** Entity class storing rows of table Consignment
   *  @param seriesid Database column SeriesId SqlType(BIGINT), Default(None)
   *  @param userid Database column UserId SqlType(BIGINT), Default(None)
   *  @param datetime Database column Datetime SqlType(TIMESTAMP)
   *  @param consignmentid Database column ConsignmentId SqlType(BIGINT), AutoInc, PrimaryKey */
  case class ConsignmentRow(seriesid: Option[Long] = None, userid: Option[Long] = None, datetime: java.sql.Timestamp, consignmentid: Option[Long] = None)
  /** GetResult implicit for fetching ConsignmentRow objects using plain SQL queries */
  implicit def GetResultConsignmentRow(implicit e0: GR[Option[Long]], e1: GR[java.sql.Timestamp]): GR[ConsignmentRow] = GR{
    prs => import prs._
    val r = (<<?[Long], <<?[Long], <<?[Long], <<[java.sql.Timestamp])
    import r._
    ConsignmentRow.tupled((_2, _3, _4, _1)) // putting AutoInc last
  }
  /** Table description of table Consignment. Objects of this class serve as prototypes for rows in queries. */
  class Consignment(_tableTag: Tag) extends profile.api.Table[ConsignmentRow](_tableTag, Some("consignmentapi"), "Consignment") {
    def * = (seriesid, userid, datetime, Rep.Some(consignmentid)) <> (ConsignmentRow.tupled, ConsignmentRow.unapply)
    /** Maps whole row to an option. Useful for outer joins. */
    def ? = ((seriesid, userid, Rep.Some(datetime), Rep.Some(consignmentid))).shaped.<>({r=>import r._; _3.map(_=> ConsignmentRow.tupled((_1, _2, _3.get, _4)))}, (_:Any) =>  throw new Exception("Inserting into ? projection not supported."))

    /** Database column SeriesId SqlType(BIGINT), Default(None) */
    val seriesid: Rep[Option[Long]] = column[Option[Long]]("SeriesId", O.Default(None))
    /** Database column UserId SqlType(BIGINT), Default(None) */
    val userid: Rep[Option[Long]] = column[Option[Long]]("UserId", O.Default(None))
    /** Database column Datetime SqlType(TIMESTAMP) */
    val datetime: Rep[java.sql.Timestamp] = column[java.sql.Timestamp]("Datetime")
    /** Database column ConsignmentId SqlType(BIGINT), AutoInc, PrimaryKey */
    val consignmentid: Rep[Long] = column[Long]("ConsignmentId", O.AutoInc, O.PrimaryKey)

    /** Foreign key referencing Series (database name Consignment_Series_fkey) */
    lazy val seriesFk = foreignKey("Consignment_Series_fkey", seriesid, Series)(r => Rep.Some(r.seriesid), onUpdate=ForeignKeyAction.Restrict, onDelete=ForeignKeyAction.Restrict)
    /** Foreign key referencing User (database name Consignment_User_fkey) */
    lazy val userFk = foreignKey("Consignment_User_fkey", userid, User)(r => Rep.Some(r.userid), onUpdate=ForeignKeyAction.Restrict, onDelete=ForeignKeyAction.Restrict)
  }
  /** Collection-like TableQuery object for table Consignment */
  lazy val Consignment = new TableQuery(tag => new Consignment(tag))

  /** Entity class storing rows of table Consignmentmetadata
   *  @param consignmentid Database column ConsignmentId SqlType(BIGINT), Default(None)
   *  @param propertyid Database column PropertyId SqlType(BIGINT), Default(None)
   *  @param value Database column Value SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param datetime Database column Datetime SqlType(TIMESTAMP)
   *  @param userid Database column UserId SqlType(BIGINT), Default(None)
   *  @param metadataid Database column MetadataId SqlType(BIGINT), AutoInc, PrimaryKey */
  case class ConsignmentmetadataRow(consignmentid: Option[Long] = None, propertyid: Option[Long] = None, value: Option[String] = None, datetime: java.sql.Timestamp, userid: Option[Long] = None, metadataid: Option[Long] = None)
  /** GetResult implicit for fetching ConsignmentmetadataRow objects using plain SQL queries */
  implicit def GetResultConsignmentmetadataRow(implicit e0: GR[Option[Long]], e1: GR[Option[String]], e2: GR[java.sql.Timestamp]): GR[ConsignmentmetadataRow] = GR{
    prs => import prs._
    val r = (<<?[Long], <<?[Long], <<?[Long], <<?[String], <<[java.sql.Timestamp], <<?[Long])
    import r._
    ConsignmentmetadataRow.tupled((_2, _3, _4, _5, _6, _1)) // putting AutoInc last
  }
  /** Table description of table ConsignmentMetadata. Objects of this class serve as prototypes for rows in queries. */
  class Consignmentmetadata(_tableTag: Tag) extends profile.api.Table[ConsignmentmetadataRow](_tableTag, Some("consignmentapi"), "ConsignmentMetadata") {
    def * = (consignmentid, propertyid, value, datetime, userid, Rep.Some(metadataid)) <> (ConsignmentmetadataRow.tupled, ConsignmentmetadataRow.unapply)
    /** Maps whole row to an option. Useful for outer joins. */
    def ? = ((consignmentid, propertyid, value, Rep.Some(datetime), userid, Rep.Some(metadataid))).shaped.<>({r=>import r._; _4.map(_=> ConsignmentmetadataRow.tupled((_1, _2, _3, _4.get, _5, _6)))}, (_:Any) =>  throw new Exception("Inserting into ? projection not supported."))

    /** Database column ConsignmentId SqlType(BIGINT), Default(None) */
    val consignmentid: Rep[Option[Long]] = column[Option[Long]]("ConsignmentId", O.Default(None))
    /** Database column PropertyId SqlType(BIGINT), Default(None) */
    val propertyid: Rep[Option[Long]] = column[Option[Long]]("PropertyId", O.Default(None))
    /** Database column Value SqlType(VARCHAR), Length(255,true), Default(None) */
    val value: Rep[Option[String]] = column[Option[String]]("Value", O.Length(255,varying=true), O.Default(None))
    /** Database column Datetime SqlType(TIMESTAMP) */
    val datetime: Rep[java.sql.Timestamp] = column[java.sql.Timestamp]("Datetime")
    /** Database column UserId SqlType(BIGINT), Default(None) */
    val userid: Rep[Option[Long]] = column[Option[Long]]("UserId", O.Default(None))
    /** Database column MetadataId SqlType(BIGINT), AutoInc, PrimaryKey */
    val metadataid: Rep[Long] = column[Long]("MetadataId", O.AutoInc, O.PrimaryKey)

    /** Foreign key referencing Consignment (database name ConsignmentMetadata_ibfk_1) */
    lazy val consignmentFk = foreignKey("ConsignmentMetadata_ibfk_1", consignmentid, Consignment)(r => Rep.Some(r.consignmentid), onUpdate=ForeignKeyAction.Restrict, onDelete=ForeignKeyAction.Restrict)
    /** Foreign key referencing Consignmentproperty (database name ConsignmentMetadata_ibfk_2) */
    lazy val consignmentpropertyFk = foreignKey("ConsignmentMetadata_ibfk_2", propertyid, Consignmentproperty)(r => Rep.Some(r.propertyid), onUpdate=ForeignKeyAction.Restrict, onDelete=ForeignKeyAction.Restrict)
    /** Foreign key referencing User (database name ConsignmentMetadata_ibfk_3) */
    lazy val userFk = foreignKey("ConsignmentMetadata_ibfk_3", userid, User)(r => Rep.Some(r.userid), onUpdate=ForeignKeyAction.Restrict, onDelete=ForeignKeyAction.Restrict)
  }
  /** Collection-like TableQuery object for table Consignmentmetadata */
  lazy val Consignmentmetadata = new TableQuery(tag => new Consignmentmetadata(tag))

  /** Entity class storing rows of table Consignmentproperty
   *  @param name Database column Name SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param description Database column Description SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param shortname Database column Shortname SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param propertyid Database column PropertyId SqlType(BIGINT), AutoInc, PrimaryKey */
  case class ConsignmentpropertyRow(name: Option[String] = None, description: Option[String] = None, shortname: Option[String] = None, propertyid: Option[Long] = None)
  /** GetResult implicit for fetching ConsignmentpropertyRow objects using plain SQL queries */
  implicit def GetResultConsignmentpropertyRow(implicit e0: GR[Option[String]], e1: GR[Option[Long]]): GR[ConsignmentpropertyRow] = GR{
    prs => import prs._
    val r = (<<?[Long], <<?[String], <<?[String], <<?[String])
    import r._
    ConsignmentpropertyRow.tupled((_2, _3, _4, _1)) // putting AutoInc last
  }
  /** Table description of table ConsignmentProperty. Objects of this class serve as prototypes for rows in queries. */
  class Consignmentproperty(_tableTag: Tag) extends profile.api.Table[ConsignmentpropertyRow](_tableTag, Some("consignmentapi"), "ConsignmentProperty") {
    def * = (name, description, shortname, Rep.Some(propertyid)) <> (ConsignmentpropertyRow.tupled, ConsignmentpropertyRow.unapply)
    /** Maps whole row to an option. Useful for outer joins. */
    def ? = ((name, description, shortname, Rep.Some(propertyid))).shaped.<>({r=>import r._; _4.map(_=> ConsignmentpropertyRow.tupled((_1, _2, _3, _4)))}, (_:Any) =>  throw new Exception("Inserting into ? projection not supported."))

    /** Database column Name SqlType(VARCHAR), Length(255,true), Default(None) */
    val name: Rep[Option[String]] = column[Option[String]]("Name", O.Length(255,varying=true), O.Default(None))
    /** Database column Description SqlType(VARCHAR), Length(255,true), Default(None) */
    val description: Rep[Option[String]] = column[Option[String]]("Description", O.Length(255,varying=true), O.Default(None))
    /** Database column Shortname SqlType(VARCHAR), Length(255,true), Default(None) */
    val shortname: Rep[Option[String]] = column[Option[String]]("Shortname", O.Length(255,varying=true), O.Default(None))
    /** Database column PropertyId SqlType(BIGINT), AutoInc, PrimaryKey */
    val propertyid: Rep[Long] = column[Long]("PropertyId", O.AutoInc, O.PrimaryKey)
  }
  /** Collection-like TableQuery object for table Consignmentproperty */
  lazy val Consignmentproperty = new TableQuery(tag => new Consignmentproperty(tag))

  /** Entity class storing rows of table Ffidmetadata
   *  @param software Database column Software SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param softwareversion Database column SoftwareVersion SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param definitionsversion Database column DefinitionsVersion SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param method Database column Method SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param extension Database column Extension SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param extensionmismatch Database column ExtensionMismatch SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param formatcount Database column FormatCount SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param puid Database column PUId SqlType(BIGINT), Default(None)
   *  @param datetime Database column Datetime SqlType(TIMESTAMP)
   *  @param fileid Database column FileId SqlType(BIGINT), AutoInc, PrimaryKey */
  case class FfidmetadataRow(software: Option[String] = None, softwareversion: Option[String] = None, definitionsversion: Option[String] = None, method: Option[String] = None, extension: Option[String] = None, extensionmismatch: Option[String] = None, formatcount: Option[String] = None, puid: Option[Long] = None, datetime: java.sql.Timestamp, fileid: Option[Long] = None)
  /** GetResult implicit for fetching FfidmetadataRow objects using plain SQL queries */
  implicit def GetResultFfidmetadataRow(implicit e0: GR[Option[String]], e1: GR[Option[Long]], e2: GR[java.sql.Timestamp]): GR[FfidmetadataRow] = GR{
    prs => import prs._
    val r = (<<?[Long], <<?[String], <<?[String], <<?[String], <<?[String], <<?[String], <<?[String], <<?[String], <<?[Long], <<[java.sql.Timestamp])
    import r._
    FfidmetadataRow.tupled((_2, _3, _4, _5, _6, _7, _8, _9, _10, _1)) // putting AutoInc last
  }
  /** Table description of table FFIDMetadata. Objects of this class serve as prototypes for rows in queries. */
  class Ffidmetadata(_tableTag: Tag) extends profile.api.Table[FfidmetadataRow](_tableTag, Some("consignmentapi"), "FFIDMetadata") {
    def * = (software, softwareversion, definitionsversion, method, extension, extensionmismatch, formatcount, puid, datetime, Rep.Some(fileid)) <> (FfidmetadataRow.tupled, FfidmetadataRow.unapply)
    /** Maps whole row to an option. Useful for outer joins. */
    def ? = ((software, softwareversion, definitionsversion, method, extension, extensionmismatch, formatcount, puid, Rep.Some(datetime), Rep.Some(fileid))).shaped.<>({r=>import r._; _9.map(_=> FfidmetadataRow.tupled((_1, _2, _3, _4, _5, _6, _7, _8, _9.get, _10)))}, (_:Any) =>  throw new Exception("Inserting into ? projection not supported."))

    /** Database column Software SqlType(VARCHAR), Length(255,true), Default(None) */
    val software: Rep[Option[String]] = column[Option[String]]("Software", O.Length(255,varying=true), O.Default(None))
    /** Database column SoftwareVersion SqlType(VARCHAR), Length(255,true), Default(None) */
    val softwareversion: Rep[Option[String]] = column[Option[String]]("SoftwareVersion", O.Length(255,varying=true), O.Default(None))
    /** Database column DefinitionsVersion SqlType(VARCHAR), Length(255,true), Default(None) */
    val definitionsversion: Rep[Option[String]] = column[Option[String]]("DefinitionsVersion", O.Length(255,varying=true), O.Default(None))
    /** Database column Method SqlType(VARCHAR), Length(255,true), Default(None) */
    val method: Rep[Option[String]] = column[Option[String]]("Method", O.Length(255,varying=true), O.Default(None))
    /** Database column Extension SqlType(VARCHAR), Length(255,true), Default(None) */
    val extension: Rep[Option[String]] = column[Option[String]]("Extension", O.Length(255,varying=true), O.Default(None))
    /** Database column ExtensionMismatch SqlType(VARCHAR), Length(255,true), Default(None) */
    val extensionmismatch: Rep[Option[String]] = column[Option[String]]("ExtensionMismatch", O.Length(255,varying=true), O.Default(None))
    /** Database column FormatCount SqlType(VARCHAR), Length(255,true), Default(None) */
    val formatcount: Rep[Option[String]] = column[Option[String]]("FormatCount", O.Length(255,varying=true), O.Default(None))
    /** Database column PUId SqlType(BIGINT), Default(None) */
    val puid: Rep[Option[Long]] = column[Option[Long]]("PUId", O.Default(None))
    /** Database column Datetime SqlType(TIMESTAMP) */
    val datetime: Rep[java.sql.Timestamp] = column[java.sql.Timestamp]("Datetime")
    /** Database column FileId SqlType(BIGINT), AutoInc, PrimaryKey */
    val fileid: Rep[Long] = column[Long]("FileId", O.AutoInc, O.PrimaryKey)

    /** Foreign key referencing File (database name FFIDMetadata_ibfk_1) */
    lazy val fileFk = foreignKey("FFIDMetadata_ibfk_1", fileid, File)(r => r.fileid, onUpdate=ForeignKeyAction.Restrict, onDelete=ForeignKeyAction.Restrict)
  }
  /** Collection-like TableQuery object for table Ffidmetadata */
  lazy val Ffidmetadata = new TableQuery(tag => new Ffidmetadata(tag))

  /** Entity class storing rows of table File
   *  @param consignmentid Database column ConsignmentId SqlType(BIGINT), Default(None)
   *  @param userid Database column UserId SqlType(BIGINT), Default(None)
   *  @param datetime Database column Datetime SqlType(TIMESTAMP)
   *  @param fileid Database column FileId SqlType(BIGINT), AutoInc, PrimaryKey */
  case class FileRow(consignmentid: Option[Long] = None, userid: Option[Long] = None, datetime: java.sql.Timestamp, fileid: Option[Long] = None)
  /** GetResult implicit for fetching FileRow objects using plain SQL queries */
  implicit def GetResultFileRow(implicit e0: GR[Option[Long]], e1: GR[java.sql.Timestamp]): GR[FileRow] = GR{
    prs => import prs._
    val r = (<<?[Long], <<?[Long], <<?[Long], <<[java.sql.Timestamp])
    import r._
    FileRow.tupled((_2, _3, _4, _1)) // putting AutoInc last
  }
  /** Table description of table File. Objects of this class serve as prototypes for rows in queries. */
  class File(_tableTag: Tag) extends profile.api.Table[FileRow](_tableTag, Some("consignmentapi"), "File") {
    def * = (consignmentid, userid, datetime, Rep.Some(fileid)) <> (FileRow.tupled, FileRow.unapply)
    /** Maps whole row to an option. Useful for outer joins. */
    def ? = ((consignmentid, userid, Rep.Some(datetime), Rep.Some(fileid))).shaped.<>({r=>import r._; _3.map(_=> FileRow.tupled((_1, _2, _3.get, _4)))}, (_:Any) =>  throw new Exception("Inserting into ? projection not supported."))

    /** Database column ConsignmentId SqlType(BIGINT), Default(None) */
    val consignmentid: Rep[Option[Long]] = column[Option[Long]]("ConsignmentId", O.Default(None))
    /** Database column UserId SqlType(BIGINT), Default(None) */
    val userid: Rep[Option[Long]] = column[Option[Long]]("UserId", O.Default(None))
    /** Database column Datetime SqlType(TIMESTAMP) */
    val datetime: Rep[java.sql.Timestamp] = column[java.sql.Timestamp]("Datetime")
    /** Database column FileId SqlType(BIGINT), AutoInc, PrimaryKey */
    val fileid: Rep[Long] = column[Long]("FileId", O.AutoInc, O.PrimaryKey)

    /** Foreign key referencing Consignment (database name File_ibfk_1) */
    lazy val consignmentFk = foreignKey("File_ibfk_1", consignmentid, Consignment)(r => Rep.Some(r.consignmentid), onUpdate=ForeignKeyAction.Restrict, onDelete=ForeignKeyAction.Restrict)
    /** Foreign key referencing User (database name File_ibfk_2) */
    lazy val userFk = foreignKey("File_ibfk_2", userid, User)(r => Rep.Some(r.userid), onUpdate=ForeignKeyAction.Restrict, onDelete=ForeignKeyAction.Restrict)
  }
  /** Collection-like TableQuery object for table File */
  lazy val File = new TableQuery(tag => new File(tag))

  /** Entity class storing rows of table Filemetadata
   *  @param fileid Database column FileId SqlType(BIGINT), Default(None)
   *  @param propertyid Database column PropertyId SqlType(BIGINT), Default(None)
   *  @param value Database column Value SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param datetime Database column Datetime SqlType(TIMESTAMP)
   *  @param userid Database column UserId SqlType(BIGINT), Default(None)
   *  @param metadataid Database column MetadataId SqlType(BIGINT), AutoInc, PrimaryKey */
  case class FilemetadataRow(fileid: Option[Long] = None, propertyid: Option[Long] = None, value: Option[String] = None, datetime: java.sql.Timestamp, userid: Option[Long] = None, metadataid: Option[Long] = None)
  /** GetResult implicit for fetching FilemetadataRow objects using plain SQL queries */
  implicit def GetResultFilemetadataRow(implicit e0: GR[Option[Long]], e1: GR[Option[String]], e2: GR[java.sql.Timestamp]): GR[FilemetadataRow] = GR{
    prs => import prs._
    val r = (<<?[Long], <<?[Long], <<?[Long], <<?[String], <<[java.sql.Timestamp], <<?[Long])
    import r._
    FilemetadataRow.tupled((_2, _3, _4, _5, _6, _1)) // putting AutoInc last
  }
  /** Table description of table FileMetadata. Objects of this class serve as prototypes for rows in queries. */
  class Filemetadata(_tableTag: Tag) extends profile.api.Table[FilemetadataRow](_tableTag, Some("consignmentapi"), "FileMetadata") {
    def * = (fileid, propertyid, value, datetime, userid, Rep.Some(metadataid)) <> (FilemetadataRow.tupled, FilemetadataRow.unapply)
    /** Maps whole row to an option. Useful for outer joins. */
    def ? = ((fileid, propertyid, value, Rep.Some(datetime), userid, Rep.Some(metadataid))).shaped.<>({r=>import r._; _4.map(_=> FilemetadataRow.tupled((_1, _2, _3, _4.get, _5, _6)))}, (_:Any) =>  throw new Exception("Inserting into ? projection not supported."))

    /** Database column FileId SqlType(BIGINT), Default(None) */
    val fileid: Rep[Option[Long]] = column[Option[Long]]("FileId", O.Default(None))
    /** Database column PropertyId SqlType(BIGINT), Default(None) */
    val propertyid: Rep[Option[Long]] = column[Option[Long]]("PropertyId", O.Default(None))
    /** Database column Value SqlType(VARCHAR), Length(255,true), Default(None) */
    val value: Rep[Option[String]] = column[Option[String]]("Value", O.Length(255,varying=true), O.Default(None))
    /** Database column Datetime SqlType(TIMESTAMP) */
    val datetime: Rep[java.sql.Timestamp] = column[java.sql.Timestamp]("Datetime")
    /** Database column UserId SqlType(BIGINT), Default(None) */
    val userid: Rep[Option[Long]] = column[Option[Long]]("UserId", O.Default(None))
    /** Database column MetadataId SqlType(BIGINT), AutoInc, PrimaryKey */
    val metadataid: Rep[Long] = column[Long]("MetadataId", O.AutoInc, O.PrimaryKey)

    /** Foreign key referencing File (database name FileMetadata_ibfk_1) */
    lazy val fileFk = foreignKey("FileMetadata_ibfk_1", fileid, File)(r => Rep.Some(r.fileid), onUpdate=ForeignKeyAction.Restrict, onDelete=ForeignKeyAction.Restrict)
    /** Foreign key referencing Fileproperty (database name FileMetadata_ibfk_2) */
    lazy val filepropertyFk = foreignKey("FileMetadata_ibfk_2", propertyid, Fileproperty)(r => Rep.Some(r.propertyid), onUpdate=ForeignKeyAction.Restrict, onDelete=ForeignKeyAction.Restrict)
    /** Foreign key referencing User (database name FileMetadata_ibfk_3) */
    lazy val userFk = foreignKey("FileMetadata_ibfk_3", userid, User)(r => Rep.Some(r.userid), onUpdate=ForeignKeyAction.Restrict, onDelete=ForeignKeyAction.Restrict)
  }
  /** Collection-like TableQuery object for table Filemetadata */
  lazy val Filemetadata = new TableQuery(tag => new Filemetadata(tag))

  /** Entity class storing rows of table Fileproperty
   *  @param name Database column Name SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param description Database column Description SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param shortname Database column Shortname SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param propertyid Database column PropertyId SqlType(BIGINT), AutoInc, PrimaryKey */
  case class FilepropertyRow(name: Option[String] = None, description: Option[String] = None, shortname: Option[String] = None, propertyid: Option[Long] = None)
  /** GetResult implicit for fetching FilepropertyRow objects using plain SQL queries */
  implicit def GetResultFilepropertyRow(implicit e0: GR[Option[String]], e1: GR[Option[Long]]): GR[FilepropertyRow] = GR{
    prs => import prs._
    val r = (<<?[Long], <<?[String], <<?[String], <<?[String])
    import r._
    FilepropertyRow.tupled((_2, _3, _4, _1)) // putting AutoInc last
  }
  /** Table description of table FileProperty. Objects of this class serve as prototypes for rows in queries. */
  class Fileproperty(_tableTag: Tag) extends profile.api.Table[FilepropertyRow](_tableTag, Some("consignmentapi"), "FileProperty") {
    def * = (name, description, shortname, Rep.Some(propertyid)) <> (FilepropertyRow.tupled, FilepropertyRow.unapply)
    /** Maps whole row to an option. Useful for outer joins. */
    def ? = ((name, description, shortname, Rep.Some(propertyid))).shaped.<>({r=>import r._; _4.map(_=> FilepropertyRow.tupled((_1, _2, _3, _4)))}, (_:Any) =>  throw new Exception("Inserting into ? projection not supported."))

    /** Database column Name SqlType(VARCHAR), Length(255,true), Default(None) */
    val name: Rep[Option[String]] = column[Option[String]]("Name", O.Length(255,varying=true), O.Default(None))
    /** Database column Description SqlType(VARCHAR), Length(255,true), Default(None) */
    val description: Rep[Option[String]] = column[Option[String]]("Description", O.Length(255,varying=true), O.Default(None))
    /** Database column Shortname SqlType(VARCHAR), Length(255,true), Default(None) */
    val shortname: Rep[Option[String]] = column[Option[String]]("Shortname", O.Length(255,varying=true), O.Default(None))
    /** Database column PropertyId SqlType(BIGINT), AutoInc, PrimaryKey */
    val propertyid: Rep[Long] = column[Long]("PropertyId", O.AutoInc, O.PrimaryKey)
  }
  /** Collection-like TableQuery object for table Fileproperty */
  lazy val Fileproperty = new TableQuery(tag => new Fileproperty(tag))

  /** Entity class storing rows of table FlywaySchemaHistory
   *  @param installedRank Database column installed_rank SqlType(INT), PrimaryKey
   *  @param version Database column version SqlType(VARCHAR), Length(50,true), Default(None)
   *  @param description Database column description SqlType(VARCHAR), Length(200,true)
   *  @param `type` Database column type SqlType(VARCHAR), Length(20,true)
   *  @param script Database column script SqlType(VARCHAR), Length(1000,true)
   *  @param checksum Database column checksum SqlType(INT), Default(None)
   *  @param installedBy Database column installed_by SqlType(VARCHAR), Length(100,true)
   *  @param installedOn Database column installed_on SqlType(TIMESTAMP)
   *  @param executionTime Database column execution_time SqlType(INT)
   *  @param success Database column success SqlType(BIT) */
  case class FlywaySchemaHistoryRow(installedRank: Int, version: Option[String] = None, description: String, `type`: String, script: String, checksum: Option[Int] = None, installedBy: String, installedOn: java.sql.Timestamp, executionTime: Int, success: Boolean)
  /** GetResult implicit for fetching FlywaySchemaHistoryRow objects using plain SQL queries */
  implicit def GetResultFlywaySchemaHistoryRow(implicit e0: GR[Int], e1: GR[Option[String]], e2: GR[String], e3: GR[Option[Int]], e4: GR[java.sql.Timestamp], e5: GR[Boolean]): GR[FlywaySchemaHistoryRow] = GR{
    prs => import prs._
    val r = (<<[Int], <<?[String], <<[String], <<[String], <<[String], <<?[Int], <<[String], <<[java.sql.Timestamp], <<[Int], <<[Boolean])
    import r._
    FlywaySchemaHistoryRow.tupled((_1, _2, _3, _4, _5, _6, _7, _8, _9, _10)) // putting AutoInc last
  }
  /** Table description of table flyway_schema_history. Objects of this class serve as prototypes for rows in queries.
   *  NOTE: The following names collided with Scala keywords and were escaped: type */
  class FlywaySchemaHistory(_tableTag: Tag) extends profile.api.Table[FlywaySchemaHistoryRow](_tableTag, Some("consignmentapi"), "flyway_schema_history") {
    def * = (installedRank, version, description, `type`, script, checksum, installedBy, installedOn, executionTime, success) <> (FlywaySchemaHistoryRow.tupled, FlywaySchemaHistoryRow.unapply)
    /** Maps whole row to an option. Useful for outer joins. */
    def ? = ((Rep.Some(installedRank), version, Rep.Some(description), Rep.Some(`type`), Rep.Some(script), checksum, Rep.Some(installedBy), Rep.Some(installedOn), Rep.Some(executionTime), Rep.Some(success))).shaped.<>({r=>import r._; _1.map(_=> FlywaySchemaHistoryRow.tupled((_1.get, _2, _3.get, _4.get, _5.get, _6, _7.get, _8.get, _9.get, _10.get)))}, (_:Any) =>  throw new Exception("Inserting into ? projection not supported."))

    /** Database column installed_rank SqlType(INT), PrimaryKey */
    val installedRank: Rep[Int] = column[Int]("installed_rank", O.PrimaryKey)
    /** Database column version SqlType(VARCHAR), Length(50,true), Default(None) */
    val version: Rep[Option[String]] = column[Option[String]]("version", O.Length(50,varying=true), O.Default(None))
    /** Database column description SqlType(VARCHAR), Length(200,true) */
    val description: Rep[String] = column[String]("description", O.Length(200,varying=true))
    /** Database column type SqlType(VARCHAR), Length(20,true)
     *  NOTE: The name was escaped because it collided with a Scala keyword. */
    val `type`: Rep[String] = column[String]("type", O.Length(20,varying=true))
    /** Database column script SqlType(VARCHAR), Length(1000,true) */
    val script: Rep[String] = column[String]("script", O.Length(1000,varying=true))
    /** Database column checksum SqlType(INT), Default(None) */
    val checksum: Rep[Option[Int]] = column[Option[Int]]("checksum", O.Default(None))
    /** Database column installed_by SqlType(VARCHAR), Length(100,true) */
    val installedBy: Rep[String] = column[String]("installed_by", O.Length(100,varying=true))
    /** Database column installed_on SqlType(TIMESTAMP) */
    val installedOn: Rep[java.sql.Timestamp] = column[java.sql.Timestamp]("installed_on")
    /** Database column execution_time SqlType(INT) */
    val executionTime: Rep[Int] = column[Int]("execution_time")
    /** Database column success SqlType(BIT) */
    val success: Rep[Boolean] = column[Boolean]("success")

    /** Index over (success) (database name flyway_schema_history_s_idx) */
    val index1 = index("flyway_schema_history_s_idx", success)
  }
  /** Collection-like TableQuery object for table FlywaySchemaHistory */
  lazy val FlywaySchemaHistory = new TableQuery(tag => new FlywaySchemaHistory(tag))

  /** Entity class storing rows of table Series
   *  @param bodyid Database column BodyId SqlType(BIGINT), Default(None)
   *  @param name Database column Name SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param code Database column Code SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param description Database column Description SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param seriesid Database column SeriesId SqlType(BIGINT), AutoInc, PrimaryKey */
  case class SeriesRow(bodyid: Option[Long] = None, name: Option[String] = None, code: Option[String] = None, description: Option[String] = None, seriesid: Option[Long] = None)
  /** GetResult implicit for fetching SeriesRow objects using plain SQL queries */
  implicit def GetResultSeriesRow(implicit e0: GR[Option[Long]], e1: GR[Option[String]]): GR[SeriesRow] = GR{
    prs => import prs._
    val r = (<<?[Long], <<?[Long], <<?[String], <<?[String], <<?[String])
    import r._
    SeriesRow.tupled((_2, _3, _4, _5, _1)) // putting AutoInc last
  }
  /** Table description of table Series. Objects of this class serve as prototypes for rows in queries. */
  class Series(_tableTag: Tag) extends profile.api.Table[SeriesRow](_tableTag, Some("consignmentapi"), "Series") {
    def * = (bodyid, name, code, description, Rep.Some(seriesid)) <> (SeriesRow.tupled, SeriesRow.unapply)
    /** Maps whole row to an option. Useful for outer joins. */
    def ? = ((bodyid, name, code, description, Rep.Some(seriesid))).shaped.<>({r=>import r._; _5.map(_=> SeriesRow.tupled((_1, _2, _3, _4, _5)))}, (_:Any) =>  throw new Exception("Inserting into ? projection not supported."))

    /** Database column BodyId SqlType(BIGINT), Default(None) */
    val bodyid: Rep[Option[Long]] = column[Option[Long]]("BodyId", O.Default(None))
    /** Database column Name SqlType(VARCHAR), Length(255,true), Default(None) */
    val name: Rep[Option[String]] = column[Option[String]]("Name", O.Length(255,varying=true), O.Default(None))
    /** Database column Code SqlType(VARCHAR), Length(255,true), Default(None) */
    val code: Rep[Option[String]] = column[Option[String]]("Code", O.Length(255,varying=true), O.Default(None))
    /** Database column Description SqlType(VARCHAR), Length(255,true), Default(None) */
    val description: Rep[Option[String]] = column[Option[String]]("Description", O.Length(255,varying=true), O.Default(None))
    /** Database column SeriesId SqlType(BIGINT), AutoInc, PrimaryKey */
    val seriesid: Rep[Long] = column[Long]("SeriesId", O.AutoInc, O.PrimaryKey)

    /** Foreign key referencing Body (database name Series_Body_fkey) */
    lazy val bodyFk = foreignKey("Series_Body_fkey", bodyid, Body)(r => Rep.Some(r.bodyid), onUpdate=ForeignKeyAction.Restrict, onDelete=ForeignKeyAction.Restrict)
  }
  /** Collection-like TableQuery object for table Series */
  lazy val Series = new TableQuery(tag => new Series(tag))

  /** Entity class storing rows of table User
   *  @param bodyid Database column BodyId SqlType(BIGINT), Default(None)
   *  @param name Database column Name SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param email Database column EMail SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param phoneno Database column PhoneNo SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param userid Database column UserId SqlType(BIGINT), AutoInc, PrimaryKey */
  case class UserRow(bodyid: Option[Long] = None, name: Option[String] = None, email: Option[String] = None, phoneno: Option[String] = None, userid: Option[Long] = None)
  /** GetResult implicit for fetching UserRow objects using plain SQL queries */
  implicit def GetResultUserRow(implicit e0: GR[Option[Long]], e1: GR[Option[String]]): GR[UserRow] = GR{
    prs => import prs._
    val r = (<<?[Long], <<?[Long], <<?[String], <<?[String], <<?[String])
    import r._
    UserRow.tupled((_2, _3, _4, _5, _1)) // putting AutoInc last
  }
  /** Table description of table User. Objects of this class serve as prototypes for rows in queries. */
  class User(_tableTag: Tag) extends profile.api.Table[UserRow](_tableTag, Some("consignmentapi"), "User") {
    def * = (bodyid, name, email, phoneno, Rep.Some(userid)) <> (UserRow.tupled, UserRow.unapply)
    /** Maps whole row to an option. Useful for outer joins. */
    def ? = ((bodyid, name, email, phoneno, Rep.Some(userid))).shaped.<>({r=>import r._; _5.map(_=> UserRow.tupled((_1, _2, _3, _4, _5)))}, (_:Any) =>  throw new Exception("Inserting into ? projection not supported."))

    /** Database column BodyId SqlType(BIGINT), Default(None) */
    val bodyid: Rep[Option[Long]] = column[Option[Long]]("BodyId", O.Default(None))
    /** Database column Name SqlType(VARCHAR), Length(255,true), Default(None) */
    val name: Rep[Option[String]] = column[Option[String]]("Name", O.Length(255,varying=true), O.Default(None))
    /** Database column EMail SqlType(VARCHAR), Length(255,true), Default(None) */
    val email: Rep[Option[String]] = column[Option[String]]("EMail", O.Length(255,varying=true), O.Default(None))
    /** Database column PhoneNo SqlType(VARCHAR), Length(255,true), Default(None) */
    val phoneno: Rep[Option[String]] = column[Option[String]]("PhoneNo", O.Length(255,varying=true), O.Default(None))
    /** Database column UserId SqlType(BIGINT), AutoInc, PrimaryKey */
    val userid: Rep[Long] = column[Long]("UserId", O.AutoInc, O.PrimaryKey)

    /** Foreign key referencing Body (database name User_Body_fkey) */
    lazy val bodyFk = foreignKey("User_Body_fkey", bodyid, Body)(r => Rep.Some(r.bodyid), onUpdate=ForeignKeyAction.Restrict, onDelete=ForeignKeyAction.Restrict)
  }
  /** Collection-like TableQuery object for table User */
  lazy val User = new TableQuery(tag => new User(tag))
}
