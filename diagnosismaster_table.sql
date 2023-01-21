CREATE TABLE `testdb`.`20210696_diagnosismaster` (
  `diagnosisId` INT NOT NULL AUTO_INCREMENT,
  `diagnosisname` VARCHAR(45) NULL,
  `diagnosisCategory` VARCHAR(45) NULL,
  `diagnosisDescription` VARCHAR(45) NULL,
  `Severity` VARCHAR(45) NULL,
  `requirement` VARCHAR(45) NULL,
  `levelofassessment` VARCHAR(45) NULL,
  `AdditionalTest` VARCHAR(45) NULL,
  `SpecialNotes` VARCHAR(45) NULL,
  PRIMARY KEY (`diagnosisId`));
