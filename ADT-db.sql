SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`tblTypeOfService`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tblTypeOfService` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`tblTypeOfService` (
  `typeOfServiceID` INT NOT NULL AUTO_INCREMENT ,
  `typeOfService` VARCHAR(45) NULL ,
  `description` VARCHAR(45) NULL ,
  PRIMARY KEY (`typeOfServiceID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblClientSource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tblClientSource` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`tblClientSource` (
  `sourceId` INT NOT NULL AUTO_INCREMENT ,
  `sourceName` INT NULL ,
  `description` VARCHAR(45) NULL ,
  PRIMARY KEY (`sourceId`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblClientSupportDetails`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tblClientSupportDetails` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`tblClientSupportDetails` (
  `clientSupportId` INT NOT NULL ,
  `clientSupport` VARCHAR(45) NULL ,
  PRIMARY KEY (`clientSupportId`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblCurrentStatus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tblCurrentStatus` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`tblCurrentStatus` (
  `currentStatusID` INT NOT NULL AUTO_INCREMENT ,
  `currentStatus` VARCHAR(45) NULL ,
  PRIMARY KEY (`currentStatusID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblARTPatientMasterInformation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tblARTPatientMasterInformation` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`tblARTPatientMasterInformation` (
  `artId` INT UNSIGNED NOT NULL ,
  `firstName` VARCHAR(45) NULL ,
  `lastName` VARCHAR(45) NULL ,
  `surname` VARCHAR(45) NULL ,
  `sex` VARCHAR(10) NULL ,
  `age` INT NULL ,
  `dateTherapyStarted` DATETIME NULL ,
  `weightOnStart` INT NULL ,
  `otherDiseaseConditions` TEXT NULL ,
  `ADRorSideEffects` TEXT NULL ,
  `pregnant` BIT NULL ,
  `otherDrugs` TEXT NULL ,
  `typeOfService` INT NOT NULL ,
  `address` VARCHAR(45) NULL ,
  `clientSourceId` INT NOT NULL ,
  `cotrimoxazole` BIT NULL ,
  `tb` BIT NULL ,
  `artStartDate` DATETIME NULL ,
  `dateOfBirth` DATETIME NULL ,
  `placeOfBirth` VARCHAR(45) NULL ,
  `cellPhone` VARCHAR(45) NULL ,
  `alternateContact` VARCHAR(45) NULL ,
  `smokes` BIT NULL ,
  `drinks` BIT NULL ,
  `clientSupportedBy` INT NOT NULL ,
  `currentStatus` INT NOT NULL ,
  PRIMARY KEY (`artId`) ,
  INDEX `fk_tblARTPatientMasterInformation_tblServices_idx` (`typeOfService` ASC) ,
  INDEX `fk_tblARTPatientMasterInformation_tblClientSource1_idx` (`clientSourceId` ASC) ,
  INDEX `fk_tblARTPatientMasterInformation_tblClientSupportDetails1_idx` (`clientSupportedBy` ASC) ,
  INDEX `fk_tblARTPatientMasterInformation_tblCurrentStatus1_idx` (`currentStatus` ASC) ,
  UNIQUE INDEX `surname_UNIQUE` (`surname` ASC) ,
  CONSTRAINT `fk_tblARTPatientMasterInformation_tblServices`
    FOREIGN KEY (`typeOfService` )
    REFERENCES `mydb`.`tblTypeOfService` (`typeOfServiceID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblARTPatientMasterInformation_tblClientSource1`
    FOREIGN KEY (`clientSourceId` )
    REFERENCES `mydb`.`tblClientSource` (`sourceId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblARTPatientMasterInformation_tblClientSupportDetails1`
    FOREIGN KEY (`clientSupportedBy` )
    REFERENCES `mydb`.`tblClientSupportDetails` (`clientSupportId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblARTPatientMasterInformation_tblCurrentStatus1`
    FOREIGN KEY (`currentStatus` )
    REFERENCES `mydb`.`tblCurrentStatus` (`currentStatusID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblRegimenCategory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tblRegimenCategory` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`tblRegimenCategory` (
  `categoryID` INT NOT NULL AUTO_INCREMENT ,
  `categoryName` VARCHAR(45) NULL ,
  PRIMARY KEY (`categoryID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblStatus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tblStatus` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`tblStatus` (
  `statusID` INT NOT NULL AUTO_INCREMENT ,
  `status` VARCHAR(45) NULL ,
  PRIMARY KEY (`statusID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblRegimen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tblRegimen` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`tblRegimen` (
  `regimenCode` VARCHAR(10) NOT NULL ,
  `regimen` VARCHAR(255) NULL ,
  `line` SMALLINT NULL ,
  `remarks` VARCHAR(255) NULL ,
  `show` BIT NULL ,
  `regimenCategory` INT NOT NULL ,
  `statusID` INT NOT NULL ,
  PRIMARY KEY (`regimenCode`) ,
  INDEX `fk_tblRegimen_tblRegimenCategory1_idx` (`regimenCategory` ASC) ,
  INDEX `fk_tblRegimen_tblStatus1_idx` (`statusID` ASC) ,
  CONSTRAINT `fk_tblRegimen_tblRegimenCategory1`
    FOREIGN KEY (`regimenCategory` )
    REFERENCES `mydb`.`tblRegimenCategory` (`categoryID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblRegimen_tblStatus1`
    FOREIGN KEY (`statusID` )
    REFERENCES `mydb`.`tblStatus` (`statusID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblRegimeChangeReasons`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tblRegimeChangeReasons` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`tblRegimeChangeReasons` (
  `changeID` INT NOT NULL AUTO_INCREMENT ,
  `reasonForChange` VARCHAR(100) NULL ,
  PRIMARY KEY (`changeID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblRegimenHistory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tblRegimenHistory` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`tblRegimenHistory` (
  `regimenHistoryId` INT NOT NULL AUTO_INCREMENT ,
  `artID` INT UNSIGNED NOT NULL ,
  `tblRegimenId` VARCHAR(10) NOT NULL ,
  `eventDate` DATETIME NULL DEFAULT now() ,
  `reasonForChange` INT NOT NULL ,
  PRIMARY KEY (`regimenHistoryId`) ,
  INDEX `fk_tblRegimenHistory_tblRegimen1_idx` (`tblRegimenId` ASC) ,
  INDEX `fk_tblRegimenHistory_tblARTPatientMasterInformation1_idx` (`artID` ASC) ,
  INDEX `fk_tblRegimenHistory_tblRegimeChangeReasons1_idx` (`reasonForChange` ASC) ,
  CONSTRAINT `fk_tblRegimenHistory_tblRegimen1`
    FOREIGN KEY (`tblRegimenId` )
    REFERENCES `mydb`.`tblRegimen` (`regimenCode` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblRegimenHistory_tblARTPatientMasterInformation1`
    FOREIGN KEY (`artID` )
    REFERENCES `mydb`.`tblARTPatientMasterInformation` (`artId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblRegimenHistory_tblRegimeChangeReasons1`
    FOREIGN KEY (`reasonForChange` )
    REFERENCES `mydb`.`tblRegimeChangeReasons` (`changeID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblVisitType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tblVisitType` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`tblVisitType` (
  `idvisit` INT NOT NULL AUTO_INCREMENT ,
  `visitType` VARCHAR(45) NULL ,
  PRIMARY KEY (`idvisit`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblVisit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tblVisit` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`tblVisit` (
  `visitID` INT NOT NULL ,
  `eventDate` DATETIME NULL DEFAULT now() ,
  `dateOfNextAppointment` DATETIME NULL ,
  `visitType` INT NOT NULL ,
  `patientID` INT NULL ,
  PRIMARY KEY (`visitID`) ,
  INDEX `fk_tblAppointments_visit1_idx` (`visitType` ASC) ,
  CONSTRAINT `fk_tblAppointments_visit1`
    FOREIGN KEY (`visitType` )
    REFERENCES `mydb`.`tblVisitType` (`idvisit` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblWeightHeightBSAHistory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tblWeightHeightBSAHistory` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`tblWeightHeightBSAHistory` (
  `bsaCode` INT NOT NULL AUTO_INCREMENT ,
  `eventDate` DATETIME NULL DEFAULT now() ,
  `weight` INT NULL ,
  `height` INT NULL ,
  `bsa` INT NULL ,
  `artID` INT UNSIGNED NOT NULL ,
  PRIMARY KEY (`bsaCode`) ,
  INDEX `fk_tblWeightHeightBSAHistory_tblARTPatientMasterInformation_idx` (`artID` ASC) ,
  CONSTRAINT `fk_tblWeightHeightBSAHistory_tblARTPatientMasterInformation1`
    FOREIGN KEY (`artID` )
    REFERENCES `mydb`.`tblARTPatientMasterInformation` (`artId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblDrugUnit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tblDrugUnit` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`tblDrugUnit` (
  `drugUnitID` INT NOT NULL AUTO_INCREMENT ,
  `unitName` VARCHAR(45) NULL ,
  PRIMARY KEY (`drugUnitID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TypeOfCommodity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`TypeOfCommodity` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`TypeOfCommodity` (
  `idTypeOfCommodity` INT NOT NULL AUTO_INCREMENT ,
  `commodityName` VARCHAR(45) NULL ,
  `description` VARCHAR(45) NULL ,
  PRIMARY KEY (`idTypeOfCommodity`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblStockTransactionType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tblStockTransactionType` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`tblStockTransactionType` (
  `transactionType` INT NOT NULL ,
  `description` VARCHAR(45) NULL ,
  `reportTitle` VARCHAR(45) NULL ,
  PRIMARY KEY (`transactionType`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblDrugSource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tblDrugSource` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`tblDrugSource` (
  `sourceCode` INT NOT NULL AUTO_INCREMENT ,
  `sourceName` VARCHAR(45) NULL ,
  PRIMARY KEY (`sourceCode`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblRegion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tblRegion` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`tblRegion` (
  `regionCode` INT NOT NULL AUTO_INCREMENT ,
  `region` VARCHAR(45) NULL ,
  PRIMARY KEY (`regionCode`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblGenericName`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tblGenericName` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`tblGenericName` (
  `genId` INT NOT NULL AUTO_INCREMENT ,
  `genericName` VARCHAR(50) NULL ,
  PRIMARY KEY (`genId`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblPhysicalDrug`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tblPhysicalDrug` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`tblPhysicalDrug` (
  `arvDrugId` VARCHAR(50) NOT NULL ,
  `drugUnit` INT NOT NULL ,
  `packSize` VARCHAR(45) NULL ,
  `description` VARCHAR(45) NULL ,
  `minimumLevel` INT NULL ,
  `maximumLevel` INT NULL ,
  `reorderLEvel` INT NULL ,
  `tblPhysicalDrugcol` VARCHAR(45) NULL ,
  `genericName` INT NOT NULL ,
  PRIMARY KEY (`arvDrugId`) ,
  INDEX `fk_tblPhysicalDrug_tblDrugUnit1_idx` (`drugUnit` ASC) ,
  INDEX `fk_tblPhysicalDrug_tblGenericName1_idx` (`genericName` ASC) ,
  CONSTRAINT `fk_tblPhysicalDrug_tblDrugUnit1`
    FOREIGN KEY (`drugUnit` )
    REFERENCES `mydb`.`tblDrugUnit` (`drugUnitID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblPhysicalDrug_tblGenericName1`
    FOREIGN KEY (`genericName` )
    REFERENCES `mydb`.`tblGenericName` (`genId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblDosage`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tblDosage` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`tblDosage` (
  `dose` VARCHAR(20) NOT NULL ,
  `value` FLOAT NULL ,
  `frequency` INT NULL ,
  `upsize_ts` TIMESTAMP NULL ,
  PRIMARY KEY (`dose`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblIndication`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tblIndication` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`tblIndication` (
  `indicationCode` VARCHAR(10) NOT NULL ,
  `indicationName` VARCHAR(45) NULL ,
  PRIMARY KEY (`indicationCode`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblPatientTransaction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tblPatientTransaction` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`tblPatientTransaction` (
  `transactionCode` INT NOT NULL AUTO_INCREMENT ,
  `patientID` INT UNSIGNED NOT NULL ,
  `appointmentID` INT NOT NULL ,
  `drugId` VARCHAR(50) NOT NULL ,
  `arvQuantity` INT NULL ,
  `dosage` VARCHAR(20) NOT NULL ,
  `duration` VARCHAR(45) NULL ,
  `comment` TEXT NULL ,
  `indication` INT NULL ,
  `indicationCode` VARCHAR(10) NULL ,
  `operator` VARCHAR(20) NOT NULL ,
  `SOH` FLOAT NULL ,
  `pillCount` SMALLINT NULL ,
  `adherence` FLOAT NULL ,
  `daysLate` VARCHAR(45) NULL ,
  PRIMARY KEY (`transactionCode`) ,
  INDEX `fk_tblPatientTransaction_tblARTPatientMasterInformation1_idx` (`patientID` ASC) ,
  INDEX `fk_tblPatientTransaction_tblAppointments1_idx` (`appointmentID` ASC) ,
  INDEX `fk_tblPatientTransaction_tblPhysicalDrug1_idx` (`drugId` ASC) ,
  INDEX `fk_tblPatientTransaction_tblDosage1_idx` (`dosage` ASC) ,
  INDEX `fk_tblPatientTransaction_tblIndication1_idx` (`indicationCode` ASC) ,
  CONSTRAINT `fk_tblPatientTransaction_tblARTPatientMasterInformation1`
    FOREIGN KEY (`patientID` )
    REFERENCES `mydb`.`tblARTPatientMasterInformation` (`artId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblPatientTransaction_tblAppointments1`
    FOREIGN KEY (`appointmentID` )
    REFERENCES `mydb`.`tblVisit` (`visitID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblPatientTransaction_tblPhysicalDrug1`
    FOREIGN KEY (`drugId` )
    REFERENCES `mydb`.`tblPhysicalDrug` (`arvDrugId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblPatientTransaction_tblDosage1`
    FOREIGN KEY (`dosage` )
    REFERENCES `mydb`.`tblDosage` (`dose` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblPatientTransaction_tblIndication1`
    FOREIGN KEY (`indicationCode` )
    REFERENCES `mydb`.`tblIndication` (`indicationCode` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblDistricts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tblDistricts` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`tblDistricts` (
  `districtCode` INT NOT NULL ,
  `districtName` VARCHAR(45) NULL ,
  `regionId` INT NOT NULL ,
  PRIMARY KEY (`districtCode`) ,
  INDEX `fk_tblDistricts_tblRegion1_idx` (`regionId` ASC) ,
  CONSTRAINT `fk_tblDistricts_tblRegion1`
    FOREIGN KEY (`regionId` )
    REFERENCES `mydb`.`tblRegion` (`regionCode` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblHealthFacility`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tblHealthFacility` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`tblHealthFacility` (
  `mflCode` INT NOT NULL ,
  `facilityName` VARCHAR(45) NULL ,
  `districtCode` INT NOT NULL ,
  PRIMARY KEY (`mflCode`) ,
  INDEX `fk_tblHealthFacility_tblDistricts1_idx` (`districtCode` ASC) ,
  CONSTRAINT `fk_tblHealthFacility_tblDistricts1`
    FOREIGN KEY (`districtCode` )
    REFERENCES `mydb`.`tblDistricts` (`districtCode` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblOrganization`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tblOrganization` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`tblOrganization` (
  `organizationCode` INT NOT NULL ,
  `organization` VARCHAR(45) NULL ,
  `adultAge` INT NULL DEFAULT 15 ,
  `maxPatients` INT NULL DEFAULT 150 ,
  `districtCode` INT NOT NULL ,
  `gokSupport` BIT NULL ,
  `msfSupport` BIT NULL ,
  `pepfarSupport` BIT NULL ,
  `artServices` BIT NULL ,
  `pmtctServices` BIT NULL ,
  `pepServices` BIT NULL ,
  PRIMARY KEY (`organizationCode`) ,
  INDEX `fk_tblOrganization_tblDistricts1_idx` (`districtCode` ASC) ,
  CONSTRAINT `fk_tblOrganization_tblDistricts1`
    FOREIGN KEY (`districtCode` )
    REFERENCES `mydb`.`tblDistricts` (`districtCode` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblDrugPhysicalTran`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tblDrugPhysicalTran` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`tblDrugPhysicalTran` (
  `stockTransactionNumber` INT NOT NULL AUTO_INCREMENT ,
  `tranBatch` VARCHAR(20) NOT NULL ,
  `arvDrugId` VARCHAR(50) NOT NULL ,
  `transactionType` INT NOT NULL ,
  `transactionDate` DATETIME NULL DEFAULT now() ,
  `bookQuantity` INT NULL ,
  `expiryDate` DATETIME NULL ,
  `remarks` VARCHAR(255) NULL ,
  `physicalQuantity` INT NULL ,
  `unitCost` DECIMAL(10) NULL ,
  PRIMARY KEY (`stockTransactionNumber`) ,
  INDEX `fk_tblDrugPhysicalTran_tblPhysicalDrug1_idx` (`arvDrugId` ASC) ,
  INDEX `fk_tblDrugPhysicalTran_tblStockTransactionType1_idx` (`transactionType` ASC) ,
  CONSTRAINT `fk_tblDrugPhysicalTran_tblPhysicalDrug1`
    FOREIGN KEY (`arvDrugId` )
    REFERENCES `mydb`.`tblPhysicalDrug` (`arvDrugId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblDrugPhysicalTran_tblStockTransactionType1`
    FOREIGN KEY (`transactionType` )
    REFERENCES `mydb`.`tblStockTransactionType` (`transactionType` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblDrugsInRegimen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tblDrugsInRegimen` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`tblDrugsInRegimen` (
  `drugsInRegimenId` INT NOT NULL AUTO_INCREMENT ,
  `combinations` VARCHAR(45) NULL ,
  `regimenCode` VARCHAR(10) NOT NULL ,
  PRIMARY KEY (`drugsInRegimenId`) ,
  INDEX `fk_tblDrugsInRegimen_tblRegimen1_idx` (`regimenCode` ASC) ,
  CONSTRAINT `fk_tblDrugsInRegimen_tblRegimen1`
    FOREIGN KEY (`regimenCode` )
    REFERENCES `mydb`.`tblRegimen` (`regimenCode` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblDrugBrandName`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tblDrugBrandName` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`tblDrugBrandName` (
  `arvDrugsID` VARCHAR(50) NOT NULL ,
  `brandName` VARCHAR(50) NULL ,
  PRIMARY KEY (`arvDrugsID`) )
ENGINE = InnoDB;

USE `mydb` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
