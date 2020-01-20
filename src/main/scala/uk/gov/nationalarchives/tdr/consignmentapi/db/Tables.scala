package uk.gov.nationalarchives.tdr.consignmentapi.db
// AUTO-GENERATED Slick data model
/** Stand-alone Slick data model for immediate use */
object Tables extends {
  val profile = slick.jdbc.PostgresProfile
} with Tables

/** Slick data model trait for extension, choice of backend or usage in the cake pattern. (Make sure to initialize this late.) */
trait Tables {
  val profile: slick.jdbc.JdbcProfile
  import profile.api._
  import slick.model.ForeignKeyAction
  // NOTE: GetResult mappers for plain SQL are only generated for tables where Slick knows how to map the types of all columns.
  import slick.jdbc.{GetResult => GR}

  /** DDL for all tables. Call .create to execute. */
  lazy val schema: profile.SchemaDescription = Array(Avmetadata.schema, Body.schema, Clientfilemetadata.schema, Consignment.schema, Consignmentmetadata.schema, Consignmentproperty.schema, Ffidmetadata.schema, File.schema, Filemetadata.schema, Fileproperty.schema, Series.schema, User.schema).reduceLeft(_ ++ _)
  @deprecated("Use .schema instead of .ddl", "3.0")
  def ddl = schema

  /** Entity class storing rows of table Avmetadata
   *  @param fileid Database column FileId SqlType(BIGINT), PrimaryKey
   *  @param software Database column Software SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param value Database column Value SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param softwareversion Database column SoftwareVersion SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param databaseversion Database column DatabaseVersion SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param result Database column Result SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param datetime Database column Datetime SqlType(TIMESTAMP) */
  case class AvmetadataRow(fileid: Long, software: Option[String] = None, value: Option[String] = None, softwareversion: Option[String] = None, databaseversion: Option[String] = None, result: Option[String] = None, datetime: java.sql.Timestamp)
  /** GetResult implicit for fetching AvmetadataRow objects using plain SQL queries */
  implicit def GetResultAvmetadataRow(implicit e0: GR[Long], e1: GR[Option[String]], e2: GR[java.sql.Timestamp]): GR[AvmetadataRow] = GR{
    prs => import prs._
    AvmetadataRow.tupled((<<[Long], <<?[String], <<?[String], <<?[String], <<?[String], <<?[String], <<[java.sql.Timestamp]))
  }
  /** Table description of table AVMetadata. Objects of this class serve as prototypes for rows in queries. */
  class Avmetadata(_tableTag: Tag) extends profile.api.Table[AvmetadataRow](_tableTag, "AVMetadata") {
    def * = (fileid, software, value, softwareversion, databaseversion, result, datetime) <> (AvmetadataRow.tupled, AvmetadataRow.unapply)
    /** Maps whole row to an option. Useful for outer joins. */
    def ? = ((Rep.Some(fileid), software, value, softwareversion, databaseversion, result, Rep.Some(datetime))).shaped.<>({r=>import r._; _1.map(_=> AvmetadataRow.tupled((_1.get, _2, _3, _4, _5, _6, _7.get)))}, (_:Any) =>  throw new Exception("Inserting into ? projection not supported."))

    /** Database column FileId SqlType(BIGINT), PrimaryKey */
    val fileid: Rep[Long] = column[Long]("FileId", O.PrimaryKey)
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

    /** Foreign key referencing File (database name AVMetadata_ibfk_1) */
    lazy val fileFk = foreignKey("AVMetadata_ibfk_1", fileid, File)(r => r.fileid, onUpdate=ForeignKeyAction.NoAction, onDelete=ForeignKeyAction.NoAction)
  }
  /** Collection-like TableQuery object for table Avmetadata */
  lazy val Avmetadata = new TableQuery(tag => new Avmetadata(tag))

  /** Entity class storing rows of table Body
   *  @param bodyid Database column BodyId SqlType(BIGINT), PrimaryKey
   *  @param name Database column Name SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param code Database column Code SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param description Database column Description SqlType(VARCHAR), Length(255,true), Default(None) */
  case class BodyRow(bodyid: Long, name: Option[String] = None, code: Option[String] = None, description: Option[String] = None)
  /** GetResult implicit for fetching BodyRow objects using plain SQL queries */
  implicit def GetResultBodyRow(implicit e0: GR[Long], e1: GR[Option[String]]): GR[BodyRow] = GR{
    prs => import prs._
    BodyRow.tupled((<<[Long], <<?[String], <<?[String], <<?[String]))
  }
  /** Table description of table Body. Objects of this class serve as prototypes for rows in queries. */
  class Body(_tableTag: Tag) extends profile.api.Table[BodyRow](_tableTag, "Body") {
    def * = (bodyid, name, code, description) <> (BodyRow.tupled, BodyRow.unapply)
    /** Maps whole row to an option. Useful for outer joins. */
    def ? = ((Rep.Some(bodyid), name, code, description)).shaped.<>({r=>import r._; _1.map(_=> BodyRow.tupled((_1.get, _2, _3, _4)))}, (_:Any) =>  throw new Exception("Inserting into ? projection not supported."))

    /** Database column BodyId SqlType(BIGINT), PrimaryKey */
    val bodyid: Rep[Long] = column[Long]("BodyId", O.PrimaryKey)
    /** Database column Name SqlType(VARCHAR), Length(255,true), Default(None) */
    val name: Rep[Option[String]] = column[Option[String]]("Name", O.Length(255,varying=true), O.Default(None))
    /** Database column Code SqlType(VARCHAR), Length(255,true), Default(None) */
    val code: Rep[Option[String]] = column[Option[String]]("Code", O.Length(255,varying=true), O.Default(None))
    /** Database column Description SqlType(VARCHAR), Length(255,true), Default(None) */
    val description: Rep[Option[String]] = column[Option[String]]("Description", O.Length(255,varying=true), O.Default(None))
  }
  /** Collection-like TableQuery object for table Body */
  lazy val Body = new TableQuery(tag => new Body(tag))

  /** Entity class storing rows of table Clientfilemetadata
   *  @param fileid Database column FileId SqlType(BIGINT), PrimaryKey
   *  @param originalpath Database column OriginalPath SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param checksum Database column Checksum SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param checksumtype Database column ChecksumType SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param lastmodified Database column LastModified SqlType(TIMESTAMP)
   *  @param createddate Database column CreatedDate SqlType(TIMESTAMP)
   *  @param filesize Database column Filesize SqlType(DECIMAL), Default(None)
   *  @param datetime Database column Datetime SqlType(TIMESTAMP) */
  case class ClientfilemetadataRow(fileid: Long, originalpath: Option[String] = None, checksum: Option[String] = None, checksumtype: Option[String] = None, lastmodified: java.sql.Timestamp, createddate: java.sql.Timestamp, filesize: Option[scala.math.BigDecimal] = None, datetime: java.sql.Timestamp)
  /** GetResult implicit for fetching ClientfilemetadataRow objects using plain SQL queries */
  implicit def GetResultClientfilemetadataRow(implicit e0: GR[Long], e1: GR[Option[String]], e2: GR[java.sql.Timestamp], e3: GR[Option[scala.math.BigDecimal]]): GR[ClientfilemetadataRow] = GR{
    prs => import prs._
    ClientfilemetadataRow.tupled((<<[Long], <<?[String], <<?[String], <<?[String], <<[java.sql.Timestamp], <<[java.sql.Timestamp], <<?[scala.math.BigDecimal], <<[java.sql.Timestamp]))
  }
  /** Table description of table ClientFileMetadata. Objects of this class serve as prototypes for rows in queries. */
  class Clientfilemetadata(_tableTag: Tag) extends profile.api.Table[ClientfilemetadataRow](_tableTag, "ClientFileMetadata") {
    def * = (fileid, originalpath, checksum, checksumtype, lastmodified, createddate, filesize, datetime) <> (ClientfilemetadataRow.tupled, ClientfilemetadataRow.unapply)
    /** Maps whole row to an option. Useful for outer joins. */
    def ? = ((Rep.Some(fileid), originalpath, checksum, checksumtype, Rep.Some(lastmodified), Rep.Some(createddate), filesize, Rep.Some(datetime))).shaped.<>({r=>import r._; _1.map(_=> ClientfilemetadataRow.tupled((_1.get, _2, _3, _4, _5.get, _6.get, _7, _8.get)))}, (_:Any) =>  throw new Exception("Inserting into ? projection not supported."))

    /** Database column FileId SqlType(BIGINT), PrimaryKey */
    val fileid: Rep[Long] = column[Long]("FileId", O.PrimaryKey)
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

    /** Foreign key referencing File (database name ClientFileMetadata_ibfk_1) */
    lazy val fileFk = foreignKey("ClientFileMetadata_ibfk_1", fileid, File)(r => r.fileid, onUpdate=ForeignKeyAction.NoAction, onDelete=ForeignKeyAction.NoAction)
  }
  /** Collection-like TableQuery object for table Clientfilemetadata */
  lazy val Clientfilemetadata = new TableQuery(tag => new Clientfilemetadata(tag))

  /** Entity class storing rows of table Consignment
   *  @param consignmentid Database column ConsignmentId SqlType(BIGINT), PrimaryKey
   *  @param seriesid Database column SeriesId SqlType(BIGINT), Default(None)
   *  @param userid Database column UserId SqlType(BIGINT), Default(None)
   *  @param datetime Database column Datetime SqlType(TIMESTAMP) */
  case class ConsignmentRow(consignmentid: Long, seriesid: Option[Long] = None, userid: Option[Long] = None, datetime: java.sql.Timestamp)
  /** GetResult implicit for fetching ConsignmentRow objects using plain SQL queries */
  implicit def GetResultConsignmentRow(implicit e0: GR[Long], e1: GR[Option[Long]], e2: GR[java.sql.Timestamp]): GR[ConsignmentRow] = GR{
    prs => import prs._
    ConsignmentRow.tupled((<<[Long], <<?[Long], <<?[Long], <<[java.sql.Timestamp]))
  }
  /** Table description of table Consignment. Objects of this class serve as prototypes for rows in queries. */
  class Consignment(_tableTag: Tag) extends profile.api.Table[ConsignmentRow](_tableTag, "Consignment") {
    def * = (consignmentid, seriesid, userid, datetime) <> (ConsignmentRow.tupled, ConsignmentRow.unapply)
    /** Maps whole row to an option. Useful for outer joins. */
    def ? = ((Rep.Some(consignmentid), seriesid, userid, Rep.Some(datetime))).shaped.<>({r=>import r._; _1.map(_=> ConsignmentRow.tupled((_1.get, _2, _3, _4.get)))}, (_:Any) =>  throw new Exception("Inserting into ? projection not supported."))

    /** Database column ConsignmentId SqlType(BIGINT), PrimaryKey */
    val consignmentid: Rep[Long] = column[Long]("ConsignmentId", O.PrimaryKey)
    /** Database column SeriesId SqlType(BIGINT), Default(None) */
    val seriesid: Rep[Option[Long]] = column[Option[Long]]("SeriesId", O.Default(None))
    /** Database column UserId SqlType(BIGINT), Default(None) */
    val userid: Rep[Option[Long]] = column[Option[Long]]("UserId", O.Default(None))
    /** Database column Datetime SqlType(TIMESTAMP) */
    val datetime: Rep[java.sql.Timestamp] = column[java.sql.Timestamp]("Datetime")

    /** Foreign key referencing Series (database name Consignment_Series_fkey) */
    lazy val seriesFk = foreignKey("Consignment_Series_fkey", seriesid, Series)(r => Rep.Some(r.seriesid), onUpdate=ForeignKeyAction.NoAction, onDelete=ForeignKeyAction.NoAction)
    /** Foreign key referencing User (database name Consignment_User_fkey) */
    lazy val userFk = foreignKey("Consignment_User_fkey", userid, User)(r => Rep.Some(r.userid), onUpdate=ForeignKeyAction.NoAction, onDelete=ForeignKeyAction.NoAction)
  }
  /** Collection-like TableQuery object for table Consignment */
  lazy val Consignment = new TableQuery(tag => new Consignment(tag))

  /** Entity class storing rows of table Consignmentmetadata
   *  @param metadataid Database column MetadataId SqlType(BIGINT), PrimaryKey
   *  @param consignmentid Database column ConsignmentId SqlType(BIGINT), Default(None)
   *  @param propertyid Database column PropertyId SqlType(BIGINT), Default(None)
   *  @param value Database column Value SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param datetime Database column Datetime SqlType(TIMESTAMP)
   *  @param userid Database column UserId SqlType(BIGINT), Default(None) */
  case class ConsignmentmetadataRow(metadataid: Long, consignmentid: Option[Long] = None, propertyid: Option[Long] = None, value: Option[String] = None, datetime: java.sql.Timestamp, userid: Option[Long] = None)
  /** GetResult implicit for fetching ConsignmentmetadataRow objects using plain SQL queries */
  implicit def GetResultConsignmentmetadataRow(implicit e0: GR[Long], e1: GR[Option[Long]], e2: GR[Option[String]], e3: GR[java.sql.Timestamp]): GR[ConsignmentmetadataRow] = GR{
    prs => import prs._
    ConsignmentmetadataRow.tupled((<<[Long], <<?[Long], <<?[Long], <<?[String], <<[java.sql.Timestamp], <<?[Long]))
  }
  /** Table description of table ConsignmentMetadata. Objects of this class serve as prototypes for rows in queries. */
  class Consignmentmetadata(_tableTag: Tag) extends profile.api.Table[ConsignmentmetadataRow](_tableTag, "ConsignmentMetadata") {
    def * = (metadataid, consignmentid, propertyid, value, datetime, userid) <> (ConsignmentmetadataRow.tupled, ConsignmentmetadataRow.unapply)
    /** Maps whole row to an option. Useful for outer joins. */
    def ? = ((Rep.Some(metadataid), consignmentid, propertyid, value, Rep.Some(datetime), userid)).shaped.<>({r=>import r._; _1.map(_=> ConsignmentmetadataRow.tupled((_1.get, _2, _3, _4, _5.get, _6)))}, (_:Any) =>  throw new Exception("Inserting into ? projection not supported."))

    /** Database column MetadataId SqlType(BIGINT), PrimaryKey */
    val metadataid: Rep[Long] = column[Long]("MetadataId", O.PrimaryKey)
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

    /** Foreign key referencing Consignment (database name ConsignmentMetadata_ibfk_1) */
    lazy val consignmentFk = foreignKey("ConsignmentMetadata_ibfk_1", consignmentid, Consignment)(r => Rep.Some(r.consignmentid), onUpdate=ForeignKeyAction.NoAction, onDelete=ForeignKeyAction.NoAction)
    /** Foreign key referencing Consignmentproperty (database name ConsignmentMetadata_ibfk_2) */
    lazy val consignmentpropertyFk = foreignKey("ConsignmentMetadata_ibfk_2", propertyid, Consignmentproperty)(r => Rep.Some(r.propertyid), onUpdate=ForeignKeyAction.NoAction, onDelete=ForeignKeyAction.NoAction)
    /** Foreign key referencing User (database name ConsignmentMetadata_ibfk_3) */
    lazy val userFk = foreignKey("ConsignmentMetadata_ibfk_3", userid, User)(r => Rep.Some(r.userid), onUpdate=ForeignKeyAction.NoAction, onDelete=ForeignKeyAction.NoAction)
  }
  /** Collection-like TableQuery object for table Consignmentmetadata */
  lazy val Consignmentmetadata = new TableQuery(tag => new Consignmentmetadata(tag))

  /** Entity class storing rows of table Consignmentproperty
   *  @param propertyid Database column PropertyId SqlType(BIGINT), PrimaryKey
   *  @param name Database column Name SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param description Database column Description SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param shortname Database column Shortname SqlType(VARCHAR), Length(255,true), Default(None) */
  case class ConsignmentpropertyRow(propertyid: Long, name: Option[String] = None, description: Option[String] = None, shortname: Option[String] = None)
  /** GetResult implicit for fetching ConsignmentpropertyRow objects using plain SQL queries */
  implicit def GetResultConsignmentpropertyRow(implicit e0: GR[Long], e1: GR[Option[String]]): GR[ConsignmentpropertyRow] = GR{
    prs => import prs._
    ConsignmentpropertyRow.tupled((<<[Long], <<?[String], <<?[String], <<?[String]))
  }
  /** Table description of table ConsignmentProperty. Objects of this class serve as prototypes for rows in queries. */
  class Consignmentproperty(_tableTag: Tag) extends profile.api.Table[ConsignmentpropertyRow](_tableTag, "ConsignmentProperty") {
    def * = (propertyid, name, description, shortname) <> (ConsignmentpropertyRow.tupled, ConsignmentpropertyRow.unapply)
    /** Maps whole row to an option. Useful for outer joins. */
    def ? = ((Rep.Some(propertyid), name, description, shortname)).shaped.<>({r=>import r._; _1.map(_=> ConsignmentpropertyRow.tupled((_1.get, _2, _3, _4)))}, (_:Any) =>  throw new Exception("Inserting into ? projection not supported."))

    /** Database column PropertyId SqlType(BIGINT), PrimaryKey */
    val propertyid: Rep[Long] = column[Long]("PropertyId", O.PrimaryKey)
    /** Database column Name SqlType(VARCHAR), Length(255,true), Default(None) */
    val name: Rep[Option[String]] = column[Option[String]]("Name", O.Length(255,varying=true), O.Default(None))
    /** Database column Description SqlType(VARCHAR), Length(255,true), Default(None) */
    val description: Rep[Option[String]] = column[Option[String]]("Description", O.Length(255,varying=true), O.Default(None))
    /** Database column Shortname SqlType(VARCHAR), Length(255,true), Default(None) */
    val shortname: Rep[Option[String]] = column[Option[String]]("Shortname", O.Length(255,varying=true), O.Default(None))
  }
  /** Collection-like TableQuery object for table Consignmentproperty */
  lazy val Consignmentproperty = new TableQuery(tag => new Consignmentproperty(tag))

  /** Entity class storing rows of table Ffidmetadata
   *  @param fileid Database column FileId SqlType(BIGINT), PrimaryKey
   *  @param software Database column Software SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param softwareversion Database column SoftwareVersion SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param definitionsversion Database column DefinitionsVersion SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param method Database column Method SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param extension Database column Extension SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param extensionmismatch Database column ExtensionMismatch SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param formatcount Database column FormatCount SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param puid Database column PUId SqlType(BIGINT), Default(None)
   *  @param datetime Database column Datetime SqlType(TIMESTAMP) */
  case class FfidmetadataRow(fileid: Long, software: Option[String] = None, softwareversion: Option[String] = None, definitionsversion: Option[String] = None, method: Option[String] = None, extension: Option[String] = None, extensionmismatch: Option[String] = None, formatcount: Option[String] = None, puid: Option[Long] = None, datetime: java.sql.Timestamp)
  /** GetResult implicit for fetching FfidmetadataRow objects using plain SQL queries */
  implicit def GetResultFfidmetadataRow(implicit e0: GR[Long], e1: GR[Option[String]], e2: GR[Option[Long]], e3: GR[java.sql.Timestamp]): GR[FfidmetadataRow] = GR{
    prs => import prs._
    FfidmetadataRow.tupled((<<[Long], <<?[String], <<?[String], <<?[String], <<?[String], <<?[String], <<?[String], <<?[String], <<?[Long], <<[java.sql.Timestamp]))
  }
  /** Table description of table FFIDMetadata. Objects of this class serve as prototypes for rows in queries. */
  class Ffidmetadata(_tableTag: Tag) extends profile.api.Table[FfidmetadataRow](_tableTag, "FFIDMetadata") {
    def * = (fileid, software, softwareversion, definitionsversion, method, extension, extensionmismatch, formatcount, puid, datetime) <> (FfidmetadataRow.tupled, FfidmetadataRow.unapply)
    /** Maps whole row to an option. Useful for outer joins. */
    def ? = ((Rep.Some(fileid), software, softwareversion, definitionsversion, method, extension, extensionmismatch, formatcount, puid, Rep.Some(datetime))).shaped.<>({r=>import r._; _1.map(_=> FfidmetadataRow.tupled((_1.get, _2, _3, _4, _5, _6, _7, _8, _9, _10.get)))}, (_:Any) =>  throw new Exception("Inserting into ? projection not supported."))

    /** Database column FileId SqlType(BIGINT), PrimaryKey */
    val fileid: Rep[Long] = column[Long]("FileId", O.PrimaryKey)
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

    /** Foreign key referencing File (database name FFIDMetadata_ibfk_1) */
    lazy val fileFk = foreignKey("FFIDMetadata_ibfk_1", fileid, File)(r => r.fileid, onUpdate=ForeignKeyAction.NoAction, onDelete=ForeignKeyAction.NoAction)
  }
  /** Collection-like TableQuery object for table Ffidmetadata */
  lazy val Ffidmetadata = new TableQuery(tag => new Ffidmetadata(tag))

  /** Entity class storing rows of table File
   *  @param fileid Database column FileId SqlType(BIGINT), PrimaryKey
   *  @param consignmentid Database column ConsignmentId SqlType(BIGINT), Default(None)
   *  @param userid Database column UserId SqlType(BIGINT), Default(None)
   *  @param datetime Database column Datetime SqlType(TIMESTAMP) */
  case class FileRow(fileid: Long, consignmentid: Option[Long] = None, userid: Option[Long] = None, datetime: java.sql.Timestamp)
  /** GetResult implicit for fetching FileRow objects using plain SQL queries */
  implicit def GetResultFileRow(implicit e0: GR[Long], e1: GR[Option[Long]], e2: GR[java.sql.Timestamp]): GR[FileRow] = GR{
    prs => import prs._
    FileRow.tupled((<<[Long], <<?[Long], <<?[Long], <<[java.sql.Timestamp]))
  }
  /** Table description of table File. Objects of this class serve as prototypes for rows in queries. */
  class File(_tableTag: Tag) extends profile.api.Table[FileRow](_tableTag, "File") {
    def * = (fileid, consignmentid, userid, datetime) <> (FileRow.tupled, FileRow.unapply)
    /** Maps whole row to an option. Useful for outer joins. */
    def ? = ((Rep.Some(fileid), consignmentid, userid, Rep.Some(datetime))).shaped.<>({r=>import r._; _1.map(_=> FileRow.tupled((_1.get, _2, _3, _4.get)))}, (_:Any) =>  throw new Exception("Inserting into ? projection not supported."))

    /** Database column FileId SqlType(BIGINT), PrimaryKey */
    val fileid: Rep[Long] = column[Long]("FileId", O.PrimaryKey)
    /** Database column ConsignmentId SqlType(BIGINT), Default(None) */
    val consignmentid: Rep[Option[Long]] = column[Option[Long]]("ConsignmentId", O.Default(None))
    /** Database column UserId SqlType(BIGINT), Default(None) */
    val userid: Rep[Option[Long]] = column[Option[Long]]("UserId", O.Default(None))
    /** Database column Datetime SqlType(TIMESTAMP) */
    val datetime: Rep[java.sql.Timestamp] = column[java.sql.Timestamp]("Datetime")

    /** Foreign key referencing Consignment (database name File_ibfk_1) */
    lazy val consignmentFk = foreignKey("File_ibfk_1", consignmentid, Consignment)(r => Rep.Some(r.consignmentid), onUpdate=ForeignKeyAction.NoAction, onDelete=ForeignKeyAction.NoAction)
    /** Foreign key referencing User (database name File_ibfk_2) */
    lazy val userFk = foreignKey("File_ibfk_2", userid, User)(r => Rep.Some(r.userid), onUpdate=ForeignKeyAction.NoAction, onDelete=ForeignKeyAction.NoAction)
  }
  /** Collection-like TableQuery object for table File */
  lazy val File = new TableQuery(tag => new File(tag))

  /** Entity class storing rows of table Filemetadata
   *  @param metadataid Database column MetadataId SqlType(BIGINT), PrimaryKey
   *  @param fileid Database column FileId SqlType(BIGINT), Default(None)
   *  @param propertyid Database column PropertyId SqlType(BIGINT), Default(None)
   *  @param value Database column Value SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param datetime Database column Datetime SqlType(TIMESTAMP)
   *  @param userid Database column UserId SqlType(BIGINT), Default(None) */
  case class FilemetadataRow(metadataid: Long, fileid: Option[Long] = None, propertyid: Option[Long] = None, value: Option[String] = None, datetime: java.sql.Timestamp, userid: Option[Long] = None)
  /** GetResult implicit for fetching FilemetadataRow objects using plain SQL queries */
  implicit def GetResultFilemetadataRow(implicit e0: GR[Long], e1: GR[Option[Long]], e2: GR[Option[String]], e3: GR[java.sql.Timestamp]): GR[FilemetadataRow] = GR{
    prs => import prs._
    FilemetadataRow.tupled((<<[Long], <<?[Long], <<?[Long], <<?[String], <<[java.sql.Timestamp], <<?[Long]))
  }
  /** Table description of table FileMetadata. Objects of this class serve as prototypes for rows in queries. */
  class Filemetadata(_tableTag: Tag) extends profile.api.Table[FilemetadataRow](_tableTag, "FileMetadata") {
    def * = (metadataid, fileid, propertyid, value, datetime, userid) <> (FilemetadataRow.tupled, FilemetadataRow.unapply)
    /** Maps whole row to an option. Useful for outer joins. */
    def ? = ((Rep.Some(metadataid), fileid, propertyid, value, Rep.Some(datetime), userid)).shaped.<>({r=>import r._; _1.map(_=> FilemetadataRow.tupled((_1.get, _2, _3, _4, _5.get, _6)))}, (_:Any) =>  throw new Exception("Inserting into ? projection not supported."))

    /** Database column MetadataId SqlType(BIGINT), PrimaryKey */
    val metadataid: Rep[Long] = column[Long]("MetadataId", O.PrimaryKey)
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

    /** Foreign key referencing File (database name FileMetadata_ibfk_1) */
    lazy val fileFk = foreignKey("FileMetadata_ibfk_1", fileid, File)(r => Rep.Some(r.fileid), onUpdate=ForeignKeyAction.NoAction, onDelete=ForeignKeyAction.NoAction)
    /** Foreign key referencing Fileproperty (database name FileMetadata_ibfk_2) */
    lazy val filepropertyFk = foreignKey("FileMetadata_ibfk_2", propertyid, Fileproperty)(r => Rep.Some(r.propertyid), onUpdate=ForeignKeyAction.NoAction, onDelete=ForeignKeyAction.NoAction)
    /** Foreign key referencing User (database name FileMetadata_ibfk_3) */
    lazy val userFk = foreignKey("FileMetadata_ibfk_3", userid, User)(r => Rep.Some(r.userid), onUpdate=ForeignKeyAction.NoAction, onDelete=ForeignKeyAction.NoAction)
  }
  /** Collection-like TableQuery object for table Filemetadata */
  lazy val Filemetadata = new TableQuery(tag => new Filemetadata(tag))

  /** Entity class storing rows of table Fileproperty
   *  @param propertyid Database column PropertyId SqlType(BIGINT), PrimaryKey
   *  @param name Database column Name SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param description Database column Description SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param shortname Database column Shortname SqlType(VARCHAR), Length(255,true), Default(None) */
  case class FilepropertyRow(propertyid: Long, name: Option[String] = None, description: Option[String] = None, shortname: Option[String] = None)
  /** GetResult implicit for fetching FilepropertyRow objects using plain SQL queries */
  implicit def GetResultFilepropertyRow(implicit e0: GR[Long], e1: GR[Option[String]]): GR[FilepropertyRow] = GR{
    prs => import prs._
    FilepropertyRow.tupled((<<[Long], <<?[String], <<?[String], <<?[String]))
  }
  /** Table description of table FileProperty. Objects of this class serve as prototypes for rows in queries. */
  class Fileproperty(_tableTag: Tag) extends profile.api.Table[FilepropertyRow](_tableTag, "FileProperty") {
    def * = (propertyid, name, description, shortname) <> (FilepropertyRow.tupled, FilepropertyRow.unapply)
    /** Maps whole row to an option. Useful for outer joins. */
    def ? = ((Rep.Some(propertyid), name, description, shortname)).shaped.<>({r=>import r._; _1.map(_=> FilepropertyRow.tupled((_1.get, _2, _3, _4)))}, (_:Any) =>  throw new Exception("Inserting into ? projection not supported."))

    /** Database column PropertyId SqlType(BIGINT), PrimaryKey */
    val propertyid: Rep[Long] = column[Long]("PropertyId", O.PrimaryKey)
    /** Database column Name SqlType(VARCHAR), Length(255,true), Default(None) */
    val name: Rep[Option[String]] = column[Option[String]]("Name", O.Length(255,varying=true), O.Default(None))
    /** Database column Description SqlType(VARCHAR), Length(255,true), Default(None) */
    val description: Rep[Option[String]] = column[Option[String]]("Description", O.Length(255,varying=true), O.Default(None))
    /** Database column Shortname SqlType(VARCHAR), Length(255,true), Default(None) */
    val shortname: Rep[Option[String]] = column[Option[String]]("Shortname", O.Length(255,varying=true), O.Default(None))
  }
  /** Collection-like TableQuery object for table Fileproperty */
  lazy val Fileproperty = new TableQuery(tag => new Fileproperty(tag))

  /** Entity class storing rows of table Series
   *  @param seriesid Database column SeriesId SqlType(BIGINT), PrimaryKey
   *  @param bodyid Database column BodyId SqlType(BIGINT), Default(None)
   *  @param name Database column Name SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param code Database column Code SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param description Database column Description SqlType(VARCHAR), Length(255,true), Default(None) */
  case class SeriesRow(seriesid: Long, bodyid: Option[Long] = None, name: Option[String] = None, code: Option[String] = None, description: Option[String] = None)
  /** GetResult implicit for fetching SeriesRow objects using plain SQL queries */
  implicit def GetResultSeriesRow(implicit e0: GR[Long], e1: GR[Option[Long]], e2: GR[Option[String]]): GR[SeriesRow] = GR{
    prs => import prs._
    SeriesRow.tupled((<<[Long], <<?[Long], <<?[String], <<?[String], <<?[String]))
  }
  /** Table description of table Series. Objects of this class serve as prototypes for rows in queries. */
  class Series(_tableTag: Tag) extends profile.api.Table[SeriesRow](_tableTag, "Series") {
    def * = (seriesid, bodyid, name, code, description) <> (SeriesRow.tupled, SeriesRow.unapply)
    /** Maps whole row to an option. Useful for outer joins. */
    def ? = ((Rep.Some(seriesid), bodyid, name, code, description)).shaped.<>({r=>import r._; _1.map(_=> SeriesRow.tupled((_1.get, _2, _3, _4, _5)))}, (_:Any) =>  throw new Exception("Inserting into ? projection not supported."))

    /** Database column SeriesId SqlType(BIGINT), PrimaryKey */
    val seriesid: Rep[Long] = column[Long]("SeriesId", O.PrimaryKey)
    /** Database column BodyId SqlType(BIGINT), Default(None) */
    val bodyid: Rep[Option[Long]] = column[Option[Long]]("BodyId", O.Default(None))
    /** Database column Name SqlType(VARCHAR), Length(255,true), Default(None) */
    val name: Rep[Option[String]] = column[Option[String]]("Name", O.Length(255,varying=true), O.Default(None))
    /** Database column Code SqlType(VARCHAR), Length(255,true), Default(None) */
    val code: Rep[Option[String]] = column[Option[String]]("Code", O.Length(255,varying=true), O.Default(None))
    /** Database column Description SqlType(VARCHAR), Length(255,true), Default(None) */
    val description: Rep[Option[String]] = column[Option[String]]("Description", O.Length(255,varying=true), O.Default(None))

    /** Foreign key referencing Body (database name Series_Body_fkey) */
    lazy val bodyFk = foreignKey("Series_Body_fkey", bodyid, Body)(r => Rep.Some(r.bodyid), onUpdate=ForeignKeyAction.NoAction, onDelete=ForeignKeyAction.NoAction)
  }
  /** Collection-like TableQuery object for table Series */
  lazy val Series = new TableQuery(tag => new Series(tag))

  /** Entity class storing rows of table User
   *  @param userid Database column UserId SqlType(BIGINT), PrimaryKey
   *  @param bodyid Database column BodyId SqlType(BIGINT), Default(None)
   *  @param name Database column Name SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param email Database column EMail SqlType(VARCHAR), Length(255,true), Default(None)
   *  @param phoneno Database column PhoneNo SqlType(VARCHAR), Length(255,true), Default(None) */
  case class UserRow(userid: Long, bodyid: Option[Long] = None, name: Option[String] = None, email: Option[String] = None, phoneno: Option[String] = None)
  /** GetResult implicit for fetching UserRow objects using plain SQL queries */
  implicit def GetResultUserRow(implicit e0: GR[Long], e1: GR[Option[Long]], e2: GR[Option[String]]): GR[UserRow] = GR{
    prs => import prs._
    UserRow.tupled((<<[Long], <<?[Long], <<?[String], <<?[String], <<?[String]))
  }
  /** Table description of table User. Objects of this class serve as prototypes for rows in queries. */
  class User(_tableTag: Tag) extends profile.api.Table[UserRow](_tableTag, "User") {
    def * = (userid, bodyid, name, email, phoneno) <> (UserRow.tupled, UserRow.unapply)
    /** Maps whole row to an option. Useful for outer joins. */
    def ? = ((Rep.Some(userid), bodyid, name, email, phoneno)).shaped.<>({r=>import r._; _1.map(_=> UserRow.tupled((_1.get, _2, _3, _4, _5)))}, (_:Any) =>  throw new Exception("Inserting into ? projection not supported."))

    /** Database column UserId SqlType(BIGINT), PrimaryKey */
    val userid: Rep[Long] = column[Long]("UserId", O.PrimaryKey)
    /** Database column BodyId SqlType(BIGINT), Default(None) */
    val bodyid: Rep[Option[Long]] = column[Option[Long]]("BodyId", O.Default(None))
    /** Database column Name SqlType(VARCHAR), Length(255,true), Default(None) */
    val name: Rep[Option[String]] = column[Option[String]]("Name", O.Length(255,varying=true), O.Default(None))
    /** Database column EMail SqlType(VARCHAR), Length(255,true), Default(None) */
    val email: Rep[Option[String]] = column[Option[String]]("EMail", O.Length(255,varying=true), O.Default(None))
    /** Database column PhoneNo SqlType(VARCHAR), Length(255,true), Default(None) */
    val phoneno: Rep[Option[String]] = column[Option[String]]("PhoneNo", O.Length(255,varying=true), O.Default(None))

    /** Foreign key referencing Body (database name User_Body_fkey) */
    lazy val bodyFk = foreignKey("User_Body_fkey", bodyid, Body)(r => Rep.Some(r.bodyid), onUpdate=ForeignKeyAction.NoAction, onDelete=ForeignKeyAction.NoAction)
  }
  /** Collection-like TableQuery object for table User */
  lazy val User = new TableQuery(tag => new User(tag))
}
