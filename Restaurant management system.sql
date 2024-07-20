use restaurant_management_system;
CREATE TABLE `owner` (
  `Owner ID` int(11) NOT NULL,
  `OwnerName` varchar(45) DEFAULT NULL,
  `TelephoneNumber` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Owner ID`)
) ;
CREATE TABLE `restaurant` (
  `Restaurant ID` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `Location` varchar(45) DEFAULT NULL,
  `Owner ID` int(11) NOT NULL,
  PRIMARY KEY (`Restaurant ID`,`Owner ID`),
  KEY `Onwer ID_idx` (`Owner ID`),
  CONSTRAINT `Owner ID` FOREIGN KEY (`Owner ID`) REFERENCES `owner` (`Owner ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ;
CREATE TABLE `branches` (
  `Branch ID` int(11) NOT NULL,
  `City` varchar(45) DEFAULT NULL,
  `TelephoneNumber` varchar(45) DEFAULT NULL,
  `Number of Employee` varchar(45) DEFAULT NULL,
  `Restaurant ID` int(11) NOT NULL,
  `Branch NO` int(11) NOT NULL,
  PRIMARY KEY (`Branch ID`,`Restaurant ID`,`Branch NO`),
  KEY `Restaurant ID_idx` (`Restaurant ID`),
  CONSTRAINT `Restaurant ID` FOREIGN KEY (`Restaurant ID`) REFERENCES `restaurant` (`Restaurant ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ;
CREATE TABLE `employee` (
  `Employee ID` int(11) NOT NULL,
  `Job role` varchar(45) DEFAULT NULL,
  `Employee Name` varchar(45) DEFAULT NULL,
  `Branch ID` int(11) NOT NULL,
  PRIMARY KEY (`Employee ID`,`Branch ID`),
  KEY `Branch ID_idx` (`Branch ID`),
  CONSTRAINT `Branch ID` FOREIGN KEY (`Branch ID`) REFERENCES `branches` (`Branch ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ;
CREATE TABLE `dishes` (
  ` Dish ID` int(11) NOT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Branch NO` int(11) NOT NULL,
  PRIMARY KEY (` Dish ID`,`Branch NO`),
  KEY `Branch NO_idx` (`Branch NO`),
  CONSTRAINT `Branch NO` FOREIGN KEY (`Branch NO`) REFERENCES `branches` (`Branch ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ;
CREATE TABLE `order` (
  `Order NO` int(11) NOT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Delivery Time` time DEFAULT NULL,
  `Customer ID` int(11) NOT NULL,
  PRIMARY KEY (`Order NO`,`Customer ID`),
  KEY `Customer ID_idx` (`Customer ID`),
  CONSTRAINT `Customer ID` FOREIGN KEY (`Customer ID`) REFERENCES `customer` (`Customer ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ;
CREATE TABLE `customer` (
  `Customer ID` int(11) NOT NULL,
  `Telephone Number` varchar(45) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Customer ID`)
) ;
