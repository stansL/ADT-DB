CREATE DATABASE  IF NOT EXISTS `adt_system` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `adt_system`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: adt_system
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `tblappointments`
--

DROP TABLE IF EXISTS `tblappointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblappointments` (
  `idtblAppointments` int(11) NOT NULL,
  `eventDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `daysToNextAppointment` int(11) DEFAULT NULL,
  `dateOfNextAppointment` datetime DEFAULT NULL,
  `visitType` int(11) NOT NULL,
  PRIMARY KEY (`idtblAppointments`),
  KEY `fk_tblAppointments_visit1_idx` (`visitType`),
  CONSTRAINT `fk_tblAppointments_visit1` FOREIGN KEY (`visitType`) REFERENCES `tblvisit` (`idvisit`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblartpatientmasterinformation`
--

DROP TABLE IF EXISTS `tblartpatientmasterinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblartpatientmasterinformation` (
  `artId` int(10) unsigned NOT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `dateTherapyStarted` datetime DEFAULT NULL,
  `weightOnStart` int(11) DEFAULT NULL,
  `otherDiseaseConditions` text,
  `ADRorSideEffects` text,
  `pregnant` bit(1) DEFAULT NULL,
  `otherDrugs` text,
  `typeOfService` int(11) NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `clientSourceId` int(11) NOT NULL,
  `cotrimoxazole` bit(1) DEFAULT NULL,
  `tb` bit(1) DEFAULT NULL,
  `artStartDate` datetime DEFAULT NULL,
  `dateOfBirth` datetime DEFAULT NULL,
  `placeOfBirth` varchar(45) DEFAULT NULL,
  `cellPhone` varchar(45) DEFAULT NULL,
  `alternateContact` varchar(45) DEFAULT NULL,
  `smokes` bit(1) DEFAULT NULL,
  `drinks` bit(1) DEFAULT NULL,
  `clientSupportedBy` int(11) NOT NULL,
  `currentStatus` int(11) NOT NULL,
  PRIMARY KEY (`artId`),
  UNIQUE KEY `surname_UNIQUE` (`surname`),
  KEY `fk_tblARTPatientMasterInformation_tblServices_idx` (`typeOfService`),
  KEY `fk_tblARTPatientMasterInformation_tblClientSource1_idx` (`clientSourceId`),
  KEY `fk_tblARTPatientMasterInformation_tblClientSupportDetails1_idx` (`clientSupportedBy`),
  KEY `fk_tblARTPatientMasterInformation_tblCurrentStatus1_idx` (`currentStatus`),
  CONSTRAINT `fk_tblARTPatientMasterInformation_tblClientSource1` FOREIGN KEY (`clientSourceId`) REFERENCES `tblclientsource` (`sourceId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblARTPatientMasterInformation_tblClientSupportDetails1` FOREIGN KEY (`clientSupportedBy`) REFERENCES `tblclientsupportdetails` (`clientSupportId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblARTPatientMasterInformation_tblCurrentStatus1` FOREIGN KEY (`currentStatus`) REFERENCES `tblcurrentstatus` (`currentStatusID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblARTPatientMasterInformation_tblServices` FOREIGN KEY (`typeOfService`) REFERENCES `tbltypeofservice` (`typeOfServiceID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblclientsource`
--

DROP TABLE IF EXISTS `tblclientsource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblclientsource` (
  `sourceId` int(11) NOT NULL AUTO_INCREMENT,
  `sourceName` int(11) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`sourceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblclientsupportdetails`
--

DROP TABLE IF EXISTS `tblclientsupportdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblclientsupportdetails` (
  `clientSupportId` int(11) NOT NULL,
  `clientSupport` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`clientSupportId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblcurrentstatus`
--

DROP TABLE IF EXISTS `tblcurrentstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcurrentstatus` (
  `currentStatusID` int(11) NOT NULL AUTO_INCREMENT,
  `currentStatus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`currentStatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbldistricts`
--

DROP TABLE IF EXISTS `tbldistricts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldistricts` (
  `districtCode` int(11) NOT NULL,
  `districtName` varchar(45) DEFAULT NULL,
  `regionId` int(11) NOT NULL,
  PRIMARY KEY (`districtCode`),
  KEY `fk_tblDistricts_tblRegion1_idx` (`regionId`),
  CONSTRAINT `fk_tblDistricts_tblRegion1` FOREIGN KEY (`regionId`) REFERENCES `tblregion` (`regionCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbldosage`
--

DROP TABLE IF EXISTS `tbldosage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldosage` (
  `dose` varchar(20) NOT NULL,
  `value` float DEFAULT NULL,
  `frequency` int(11) DEFAULT NULL,
  `upsize_ts` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`dose`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbldrugbrandname`
--

DROP TABLE IF EXISTS `tbldrugbrandname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldrugbrandname` (
  `arvDrugsID` varchar(50) NOT NULL,
  `brandName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`arvDrugsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbldrugphysicaltran`
--

DROP TABLE IF EXISTS `tbldrugphysicaltran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldrugphysicaltran` (
  `stockTransactionNumber` int(11) NOT NULL AUTO_INCREMENT,
  `tranBatch` varchar(20) NOT NULL,
  `arvDrugId` varchar(50) NOT NULL,
  `transactionType` int(11) NOT NULL,
  `transactionDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `bookQuantity` int(11) DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `physicalQuantity` int(11) DEFAULT NULL,
  `unitCost` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`stockTransactionNumber`),
  KEY `fk_tblDrugPhysicalTran_tblPhysicalDrug1_idx` (`arvDrugId`),
  KEY `fk_tblDrugPhysicalTran_tblStockTransactionType1_idx` (`transactionType`),
  CONSTRAINT `fk_tblDrugPhysicalTran_tblPhysicalDrug1` FOREIGN KEY (`arvDrugId`) REFERENCES `tblphysicaldrug` (`arvDrugId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblDrugPhysicalTran_tblStockTransactionType1` FOREIGN KEY (`transactionType`) REFERENCES `tblstocktransactiontype` (`transactionType`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbldrugsinregimen`
--

DROP TABLE IF EXISTS `tbldrugsinregimen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldrugsinregimen` (
  `drugsInRegimenId` int(11) NOT NULL AUTO_INCREMENT,
  `combinations` varchar(45) DEFAULT NULL,
  `regimenCode` varchar(10) NOT NULL,
  PRIMARY KEY (`drugsInRegimenId`),
  KEY `fk_tblDrugsInRegimen_tblRegimen1_idx` (`regimenCode`),
  CONSTRAINT `fk_tblDrugsInRegimen_tblRegimen1` FOREIGN KEY (`regimenCode`) REFERENCES `tblregimen` (`regimenCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbldrugsource`
--

DROP TABLE IF EXISTS `tbldrugsource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldrugsource` (
  `sourceCode` int(11) NOT NULL AUTO_INCREMENT,
  `sourceName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`sourceCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbldrugunit`
--

DROP TABLE IF EXISTS `tbldrugunit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldrugunit` (
  `drugUnitID` int(11) NOT NULL AUTO_INCREMENT,
  `unitName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`drugUnitID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblgenericname`
--

DROP TABLE IF EXISTS `tblgenericname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblgenericname` (
  `genId` int(11) NOT NULL AUTO_INCREMENT,
  `genericName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`genId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblhealthfacility`
--

DROP TABLE IF EXISTS `tblhealthfacility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhealthfacility` (
  `mflCode` int(11) NOT NULL,
  `facilityName` varchar(45) DEFAULT NULL,
  `districtCode` int(11) NOT NULL,
  PRIMARY KEY (`mflCode`),
  KEY `fk_tblHealthFacility_tblDistricts1_idx` (`districtCode`),
  CONSTRAINT `fk_tblHealthFacility_tblDistricts1` FOREIGN KEY (`districtCode`) REFERENCES `tbldistricts` (`districtCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblindication`
--

DROP TABLE IF EXISTS `tblindication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblindication` (
  `indicationCode` varchar(10) NOT NULL,
  `indicationName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`indicationCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblorganization`
--

DROP TABLE IF EXISTS `tblorganization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblorganization` (
  `organizationCode` int(11) NOT NULL,
  `organization` varchar(45) DEFAULT NULL,
  `adultAge` int(11) DEFAULT '15',
  `maxPatients` int(11) DEFAULT '150',
  `districtCode` int(11) NOT NULL,
  `gokSupport` bit(1) DEFAULT NULL,
  `msfSupport` bit(1) DEFAULT NULL,
  `pepfarSupport` bit(1) DEFAULT NULL,
  `artServices` bit(1) DEFAULT NULL,
  `pmtctServices` bit(1) DEFAULT NULL,
  `pepServices` bit(1) DEFAULT NULL,
  PRIMARY KEY (`organizationCode`),
  KEY `fk_tblOrganization_tblDistricts1_idx` (`districtCode`),
  CONSTRAINT `fk_tblOrganization_tblDistricts1` FOREIGN KEY (`districtCode`) REFERENCES `tbldistricts` (`districtCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblpatienttransaction`
--

DROP TABLE IF EXISTS `tblpatienttransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpatienttransaction` (
  `transactionCode` int(11) NOT NULL AUTO_INCREMENT,
  `patientID` int(10) unsigned NOT NULL,
  `appointmentID` int(11) NOT NULL,
  `drugId` varchar(50) NOT NULL,
  `arvQuantity` int(11) DEFAULT NULL,
  `dosage` varchar(20) NOT NULL,
  `duration` varchar(45) DEFAULT NULL,
  `comment` text,
  `indication` int(11) DEFAULT NULL,
  `indicationCode` varchar(10) DEFAULT NULL,
  `operator` varchar(20) NOT NULL,
  `SOH` float DEFAULT NULL,
  `pillCount` smallint(6) DEFAULT NULL,
  `adherence` float DEFAULT NULL,
  `daysLate` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`transactionCode`),
  KEY `fk_tblPatientTransaction_tblARTPatientMasterInformation1_idx` (`patientID`),
  KEY `fk_tblPatientTransaction_tblAppointments1_idx` (`appointmentID`),
  KEY `fk_tblPatientTransaction_tblPhysicalDrug1_idx` (`drugId`),
  KEY `fk_tblPatientTransaction_tblDosage1_idx` (`dosage`),
  KEY `fk_tblPatientTransaction_tblIndication1_idx` (`indicationCode`),
  KEY `fk_tblPatientTransaction_tblSecurity1_idx` (`operator`),
  CONSTRAINT `fk_tblPatientTransaction_tblAppointments1` FOREIGN KEY (`appointmentID`) REFERENCES `tblappointments` (`idtblAppointments`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblPatientTransaction_tblARTPatientMasterInformation1` FOREIGN KEY (`patientID`) REFERENCES `tblartpatientmasterinformation` (`artId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblPatientTransaction_tblDosage1` FOREIGN KEY (`dosage`) REFERENCES `tbldosage` (`dose`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblPatientTransaction_tblIndication1` FOREIGN KEY (`indicationCode`) REFERENCES `tblindication` (`indicationCode`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblPatientTransaction_tblPhysicalDrug1` FOREIGN KEY (`drugId`) REFERENCES `tblphysicaldrug` (`arvDrugId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblPatientTransaction_tblSecurity1` FOREIGN KEY (`operator`) REFERENCES `tblsecurity` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblphysicaldrug`
--

DROP TABLE IF EXISTS `tblphysicaldrug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblphysicaldrug` (
  `arvDrugId` varchar(50) NOT NULL,
  `drugUnit` int(11) NOT NULL,
  `packSize` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `minimumLevel` int(11) DEFAULT NULL,
  `maximumLevel` int(11) DEFAULT NULL,
  `reorderLEvel` int(11) DEFAULT NULL,
  `tblPhysicalDrugcol` varchar(45) DEFAULT NULL,
  `genericName` int(11) NOT NULL,
  PRIMARY KEY (`arvDrugId`),
  KEY `fk_tblPhysicalDrug_tblDrugUnit1_idx` (`drugUnit`),
  KEY `fk_tblPhysicalDrug_tblGenericName1_idx` (`genericName`),
  CONSTRAINT `fk_tblPhysicalDrug_tblDrugUnit1` FOREIGN KEY (`drugUnit`) REFERENCES `tbldrugunit` (`drugUnitID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblPhysicalDrug_tblGenericName1` FOREIGN KEY (`genericName`) REFERENCES `tblgenericname` (`genId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblregimechangereasons`
--

DROP TABLE IF EXISTS `tblregimechangereasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblregimechangereasons` (
  `changeID` int(11) NOT NULL AUTO_INCREMENT,
  `reasonForChange` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`changeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblregimen`
--

DROP TABLE IF EXISTS `tblregimen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblregimen` (
  `regimenCode` varchar(10) NOT NULL,
  `regimen` varchar(255) DEFAULT NULL,
  `line` smallint(6) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `show` bit(1) DEFAULT NULL,
  `regimenCategory` int(11) NOT NULL,
  `statusID` int(11) NOT NULL,
  PRIMARY KEY (`regimenCode`),
  KEY `fk_tblRegimen_tblRegimenCategory1_idx` (`regimenCategory`),
  KEY `fk_tblRegimen_tblStatus1_idx` (`statusID`),
  CONSTRAINT `fk_tblRegimen_tblRegimenCategory1` FOREIGN KEY (`regimenCategory`) REFERENCES `tblregimencategory` (`categoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblRegimen_tblStatus1` FOREIGN KEY (`statusID`) REFERENCES `tblstatus` (`statusID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblregimencategory`
--

DROP TABLE IF EXISTS `tblregimencategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblregimencategory` (
  `categoryID` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblregimenhistory`
--

DROP TABLE IF EXISTS `tblregimenhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblregimenhistory` (
  `regimenHistoryId` int(11) NOT NULL AUTO_INCREMENT,
  `artID` int(10) unsigned NOT NULL,
  `tblRegimenId` varchar(10) NOT NULL,
  `eventDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `reasonForChange` int(11) NOT NULL,
  PRIMARY KEY (`regimenHistoryId`),
  KEY `fk_tblRegimenHistory_tblRegimen1_idx` (`tblRegimenId`),
  KEY `fk_tblRegimenHistory_tblARTPatientMasterInformation1_idx` (`artID`),
  KEY `fk_tblRegimenHistory_tblRegimeChangeReasons1_idx` (`reasonForChange`),
  CONSTRAINT `fk_tblRegimenHistory_tblARTPatientMasterInformation1` FOREIGN KEY (`artID`) REFERENCES `tblartpatientmasterinformation` (`artId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblRegimenHistory_tblRegimeChangeReasons1` FOREIGN KEY (`reasonForChange`) REFERENCES `tblregimechangereasons` (`changeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblRegimenHistory_tblRegimen1` FOREIGN KEY (`tblRegimenId`) REFERENCES `tblregimen` (`regimenCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblregion`
--

DROP TABLE IF EXISTS `tblregion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblregion` (
  `regionCode` int(11) NOT NULL AUTO_INCREMENT,
  `region` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`regionCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblsecurity`
--

DROP TABLE IF EXISTS `tblsecurity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsecurity` (
  `userID` varchar(20) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `authorityLevel` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblstatus`
--

DROP TABLE IF EXISTS `tblstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblstatus` (
  `statusID` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`statusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblstocktransactiontype`
--

DROP TABLE IF EXISTS `tblstocktransactiontype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblstocktransactiontype` (
  `transactionType` int(11) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `reportTitle` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`transactionType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbltypeofservice`
--

DROP TABLE IF EXISTS `tbltypeofservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltypeofservice` (
  `typeOfServiceID` int(11) NOT NULL AUTO_INCREMENT,
  `typeOfService` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`typeOfServiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblvisit`
--

DROP TABLE IF EXISTS `tblvisit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblvisit` (
  `idvisit` int(11) NOT NULL AUTO_INCREMENT,
  `visitType` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idvisit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblweightheightbsahistory`
--

DROP TABLE IF EXISTS `tblweightheightbsahistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblweightheightbsahistory` (
  `bsaCode` int(11) NOT NULL AUTO_INCREMENT,
  `eventDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `weight` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `bsa` int(11) DEFAULT NULL,
  `artID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`bsaCode`),
  KEY `fk_tblWeightHeightBSAHistory_tblARTPatientMasterInformation_idx` (`artID`),
  CONSTRAINT `fk_tblWeightHeightBSAHistory_tblARTPatientMasterInformation1` FOREIGN KEY (`artID`) REFERENCES `tblartpatientmasterinformation` (`artId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `typeofcommodity`
--

DROP TABLE IF EXISTS `typeofcommodity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typeofcommodity` (
  `idTypeOfCommodity` int(11) NOT NULL AUTO_INCREMENT,
  `commodityName` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTypeOfCommodity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'adt_system'
--

--
-- Dumping routines for database 'adt_system'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-10 10:00:04
