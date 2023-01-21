CREATE TABLE `testdb`.`20210696_labmaster` (
  `labid` INT NOT NULL AUTO_INCREMENT,
  `labcategory` VARCHAR(45) NULL,
  `labdescription` VARCHAR(45) NULL,
  `accuracy` VARCHAR(45) NULL,
  `requirement` VARCHAR(45) NULL,
  `levelofassessment` VARCHAR(45) NULL,
  `additionalTest` VARCHAR(45) NULL,
  `SpecialNotes` VARCHAR(45) NULL,
  PRIMARY KEY (`labid`));
