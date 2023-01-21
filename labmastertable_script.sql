CREATE TABLE `20210696_labmaster` (
  `labid` int NOT NULL AUTO_INCREMENT,
  `labname` varchar(45) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `description` varchar(155) DEFAULT NULL,
  `accuracy` varchar(45) DEFAULT NULL,
  `level` varchar(45) DEFAULT NULL,
  `atr` varchar(45) DEFAULT NULL,
  `specialnotes` varchar(255) DEFAULT NULL,
  `createdby` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`labid`)
)