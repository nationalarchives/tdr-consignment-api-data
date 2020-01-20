-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: consignmentapi
-- ------------------------------------------------------
-- Server version	5.7.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `AVMetadata`
--

DROP TABLE IF EXISTS `AVMetadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AVMetadata` (
  `FileId` bigint(20) NOT NULL,
  `Software` varchar(255) DEFAULT NULL,
  `Value` varchar(255) DEFAULT NULL,
  `SoftwareVersion` varchar(255) DEFAULT NULL,
  `DatabaseVersion` varchar(255) DEFAULT NULL,
  `Result` varchar(255) DEFAULT NULL,
  `Datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`FileId`),
  CONSTRAINT `AVMetadata_ibfk_1` FOREIGN KEY (`FileId`) REFERENCES `File` (`FileId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AVMetadata`
--

LOCK TABLES `AVMetadata` WRITE;
/*!40000 ALTER TABLE `AVMetadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `AVMetadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Body`
--

DROP TABLE IF EXISTS `Body`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Body` (
  `BodyId` bigint(20) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`BodyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Body`
--

LOCK TABLES `Body` WRITE;
/*!40000 ALTER TABLE `Body` DISABLE KEYS */;
/*!40000 ALTER TABLE `Body` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ClientFileMetadata`
--

DROP TABLE IF EXISTS `ClientFileMetadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ClientFileMetadata` (
  `FileId` bigint(20) NOT NULL,
  `OriginalPath` varchar(255) DEFAULT NULL,
  `Checksum` varchar(255) DEFAULT NULL,
  `ChecksumType` varchar(255) DEFAULT NULL,
  `LastModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Filesize` decimal(8,2) DEFAULT NULL,
  `Datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`FileId`),
  CONSTRAINT `ClientFileMetadata_ibfk_1` FOREIGN KEY (`FileId`) REFERENCES `File` (`FileId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ClientFileMetadata`
--

LOCK TABLES `ClientFileMetadata` WRITE;
/*!40000 ALTER TABLE `ClientFileMetadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `ClientFileMetadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Consignment`
--

DROP TABLE IF EXISTS `Consignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Consignment` (
  `ConsignmentId` bigint(20) NOT NULL,
  `SeriesId` bigint(20) DEFAULT NULL,
  `UserId` bigint(20) DEFAULT NULL,
  `Datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ConsignmentId`),
  KEY `Consignment_Series_fkey` (`SeriesId`),
  KEY `Consignment_User_fkey` (`UserId`),
  CONSTRAINT `Consignment_Series_fkey` FOREIGN KEY (`SeriesId`) REFERENCES `Series` (`SeriesId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Consignment_User_fkey` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Consignment`
--

LOCK TABLES `Consignment` WRITE;
/*!40000 ALTER TABLE `Consignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Consignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ConsignmentMetadata`
--

DROP TABLE IF EXISTS `ConsignmentMetadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ConsignmentMetadata` (
  `MetadataId` bigint(20) NOT NULL,
  `ConsignmentId` bigint(20) DEFAULT NULL,
  `PropertyId` bigint(20) DEFAULT NULL,
  `Value` varchar(255) DEFAULT NULL,
  `Datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UserId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`MetadataId`),
  KEY `ConsignmentId` (`ConsignmentId`),
  KEY `PropertyId` (`PropertyId`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `ConsignmentMetadata_ibfk_1` FOREIGN KEY (`ConsignmentId`) REFERENCES `Consignment` (`ConsignmentId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ConsignmentMetadata_ibfk_2` FOREIGN KEY (`PropertyId`) REFERENCES `ConsignmentProperty` (`PropertyId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ConsignmentMetadata_ibfk_3` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ConsignmentMetadata`
--

LOCK TABLES `ConsignmentMetadata` WRITE;
/*!40000 ALTER TABLE `ConsignmentMetadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `ConsignmentMetadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ConsignmentProperty`
--

DROP TABLE IF EXISTS `ConsignmentProperty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ConsignmentProperty` (
  `PropertyId` bigint(20) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Shortname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PropertyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ConsignmentProperty`
--

LOCK TABLES `ConsignmentProperty` WRITE;
/*!40000 ALTER TABLE `ConsignmentProperty` DISABLE KEYS */;
/*!40000 ALTER TABLE `ConsignmentProperty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FFIDMetadata`
--

DROP TABLE IF EXISTS `FFIDMetadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FFIDMetadata` (
  `FileId` bigint(20) NOT NULL,
  `Software` varchar(255) DEFAULT NULL,
  `SoftwareVersion` varchar(255) DEFAULT NULL,
  `DefinitionsVersion` varchar(255) DEFAULT NULL,
  `Method` varchar(255) DEFAULT NULL,
  `Extension` varchar(255) DEFAULT NULL,
  `ExtensionMismatch` varchar(255) DEFAULT NULL,
  `FormatCount` varchar(255) DEFAULT NULL,
  `PUId` bigint(20) DEFAULT NULL,
  `Datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`FileId`),
  CONSTRAINT `FFIDMetadata_ibfk_1` FOREIGN KEY (`FileId`) REFERENCES `File` (`FileId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FFIDMetadata`
--

LOCK TABLES `FFIDMetadata` WRITE;
/*!40000 ALTER TABLE `FFIDMetadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `FFIDMetadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `File`
--

DROP TABLE IF EXISTS `File`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `File` (
  `FileId` bigint(20) NOT NULL,
  `ConsignmentId` bigint(20) DEFAULT NULL,
  `UserId` bigint(20) DEFAULT NULL,
  `Datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`FileId`),
  KEY `ConsignmentId` (`ConsignmentId`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `File_ibfk_1` FOREIGN KEY (`ConsignmentId`) REFERENCES `Consignment` (`ConsignmentId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `File_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `File`
--

LOCK TABLES `File` WRITE;
/*!40000 ALTER TABLE `File` DISABLE KEYS */;
/*!40000 ALTER TABLE `File` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FileMetadata`
--

DROP TABLE IF EXISTS `FileMetadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FileMetadata` (
  `MetadataId` bigint(20) NOT NULL,
  `FileId` bigint(20) DEFAULT NULL,
  `PropertyId` bigint(20) DEFAULT NULL,
  `Value` varchar(255) DEFAULT NULL,
  `Datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UserId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`MetadataId`),
  KEY `FileId` (`FileId`),
  KEY `PropertyId` (`PropertyId`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `FileMetadata_ibfk_1` FOREIGN KEY (`FileId`) REFERENCES `File` (`FileId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FileMetadata_ibfk_2` FOREIGN KEY (`PropertyId`) REFERENCES `FileProperty` (`PropertyId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FileMetadata_ibfk_3` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FileMetadata`
--

LOCK TABLES `FileMetadata` WRITE;
/*!40000 ALTER TABLE `FileMetadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `FileMetadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FileProperty`
--

DROP TABLE IF EXISTS `FileProperty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FileProperty` (
  `PropertyId` bigint(20) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Shortname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PropertyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FileProperty`
--

LOCK TABLES `FileProperty` WRITE;
/*!40000 ALTER TABLE `FileProperty` DISABLE KEYS */;
/*!40000 ALTER TABLE `FileProperty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Series`
--

DROP TABLE IF EXISTS `Series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Series` (
  `SeriesId` bigint(20) NOT NULL,
  `BodyId` bigint(20) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SeriesId`),
  KEY `Series_Body_fkey` (`BodyId`),
  CONSTRAINT `Series_Body_fkey` FOREIGN KEY (`BodyId`) REFERENCES `Body` (`BodyId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Series`
--

LOCK TABLES `Series` WRITE;
/*!40000 ALTER TABLE `Series` DISABLE KEYS */;
/*!40000 ALTER TABLE `Series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `UserId` bigint(20) NOT NULL,
  `BodyId` bigint(20) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `EMail` varchar(255) DEFAULT NULL,
  `PhoneNo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UserId`),
  KEY `User_Body_fkey` (`BodyId`),
  CONSTRAINT `User_Body_fkey` FOREIGN KEY (`BodyId`) REFERENCES `Body` (`BodyId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-20 22:05:15
