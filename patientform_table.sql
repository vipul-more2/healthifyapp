CREATE TABLE `testdb`.`20210696_patientform` (
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `ppsn` varchar(255) DEFAULT NULL,
  `gender` varchar(25) DEFAULT NULL,
  `employment` varchar(255) DEFAULT NULL,
  `income` int DEFAULT NULL,
  `age` int DEFAULT NULL,
  `allergynote` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `eircode` varchar(255) DEFAULT NULL,
  `patientid` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`patientid`)
)