CREATE DATABASE  IF NOT EXISTS `dbpsm` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dbpsm`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: dbpsm
-- ------------------------------------------------------
-- Server version	5.7.18-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tblanswers`
--

DROP TABLE IF EXISTS `tblanswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblanswers` (
  `intAnswerID` int(11) NOT NULL AUTO_INCREMENT,
  `strAnswerSNum` varchar(45) NOT NULL,
  `intAnswer` int(11) NOT NULL,
  PRIMARY KEY (`intAnswerID`),
  KEY `strAnswerSNum_idx` (`strAnswerSNum`),
  KEY `intAnswer_idx` (`intAnswer`),
  CONSTRAINT `intAnswer` FOREIGN KEY (`intAnswer`) REFERENCES `tblchoices` (`intChID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `strAnswerSNum` FOREIGN KEY (`strAnswerSNum`) REFERENCES `tbluser` (`strSNum`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblanswers`
--

INSERT INTO `tblanswers` VALUES (124,'2',2),(125,'2',10),(126,'2',21),(127,'2',26),(128,'2',53),(129,'2',29),(130,'2',45),(131,'2',69),(132,'2',80),(133,'2',91);

--
-- Table structure for table `tblcategories`
--

DROP TABLE IF EXISTS `tblcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcategories` (
  `intCatID` int(11) NOT NULL,
  `strCatName` varchar(45) NOT NULL,
  PRIMARY KEY (`intCatID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcategories`
--

INSERT INTO `tblcategories` VALUES (1,'Books'),(2,'School Supplies'),(3,'Food'),(4,'Misc.');

--
-- Table structure for table `tblchoices`
--

DROP TABLE IF EXISTS `tblchoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblchoices` (
  `intChID` int(11) NOT NULL AUTO_INCREMENT,
  `intChQuestionID` int(11) NOT NULL,
  `strChoice` varchar(100) NOT NULL,
  `boolCorrect` tinyint(4) NOT NULL,
  PRIMARY KEY (`intChID`),
  KEY `intChQuestionID_idx` (`intChQuestionID`),
  CONSTRAINT `intChQuestionID` FOREIGN KEY (`intChQuestionID`) REFERENCES `tblquestions` (`intQuestionID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblchoices`
--

INSERT INTO `tblchoices` VALUES (1,1,'Beside the gym',0),(2,1,'Freedom Park',1),(3,1,'Beside the Chapel',0),(4,1,'Inside the Field',0),(5,2,'5',0),(6,2,'4',1),(7,2,'3',0),(8,2,'6',0),(9,3,'Jose Rizal',0),(10,3,'Gregorio Del Pilar',0),(11,3,'Apolinario Mabini',1),(12,3,'Emilio Aguinaldo',0),(13,4,'A well known professor',0),(14,4,'The mascot of PUP',1),(15,4,'The president of PUP',0),(16,4,'A seller of cooked lunch',0),(17,5,'Beside the Library/NALLRC',1),(18,5,'Beside the main building',0),(19,5,'Inside the lagoon',0),(20,5,'In front of the chapel',0),(21,6,'SM Megamall',0),(22,6,'SM North',0),(23,6,'Market! Market!',0),(24,6,'SM Centerpoint',1),(25,7,'Fish, Egg With Apple',0),(26,7,'Footlong, Egg Wrap Around',1),(27,7,'Fried Espasol with Almond',0),(28,7,'Fried eggplant with Atsara',0),(29,8,'2',0),(30,8,'1',0),(31,8,'4',0),(32,8,'3',1),(33,9,'2',1),(34,9,'1',0),(35,9,'4',0),(36,9,'3',0),(37,10,'Polytechnic University of the Philippines',0),(38,10,'Philippine School of Commerce',1),(39,10,'Polytechnic College',0),(40,10,'Unibersidad de Politekniko',0),(41,11,'1904',1),(42,11,'1910',0),(43,11,'1907',0),(44,11,'1969',0),(45,12,'Sit on the floor',0),(46,12,'Get a chair from other classrooms',1),(47,12,'Just stand',0),(48,12,'Burn more chairs as a protest',0),(49,13,'Emmanuel Malto',0),(50,13,'Angelito Casasis',0),(51,13,'Ruben Madridejos',1),(52,13,'Albert dela Cruz',0),(53,14,'Emanuel de Guzman',1),(54,14,'Perry David Solosa',0),(55,14,'Dante Gueverra',0),(56,14,'Samuel Salvador',0),(57,15,'15',0),(58,15,'10',0),(59,15,'11',0),(60,15,'12',1),(61,16,'Oblation Run',0),(62,16,'Naked Run',0),(63,16,'Pylon Run',1),(64,16,'Fanservice Run',0),(65,17,'6',1),(66,17,'4',0),(67,17,'5',0),(68,17,'7',0),(69,18,'FEWA',1),(70,18,'ID Lace',0),(71,18,'School Supplies',0),(72,18,'Spaghetti',0),(73,19,'Park',0),(74,19,'Lagoon',1),(75,19,'Building',0),(76,19,'Fountain',0),(77,20,'Silog',0),(78,20,'Red Panda',0),(79,20,'Submarine',1),(80,20,'Kalog',0),(81,21,'Inside the main building',0),(82,21,'NALLRC building',1),(83,21,'Inside Charlie del Rosario',0),(84,21,'At the middle of the oval',0),(85,22,'1/3 of the class time',1),(86,22,'1/2 of the class time',0),(87,22,'1/4 of the class time',0),(88,22,'None of the choices',0),(89,23,'11:00 pm',0),(90,23,'9:00 pm',1),(91,23,'10:30 pm',0),(92,23,'8:00 pm',0),(93,24,'Outside PUP',0),(94,24,'1st floor',0),(95,24,'6th floor',1),(96,24,'3rd floor',0);

--
-- Table structure for table `tblitem`
--

DROP TABLE IF EXISTS `tblitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblitem` (
  `intItemID` int(11) NOT NULL AUTO_INCREMENT,
  `strItemTitle` varchar(50) NOT NULL,
  `fltItemPrice` float NOT NULL,
  `strItemSNum` varchar(45) NOT NULL,
  `datPostDate` date NOT NULL,
  `txtItemDesc` longtext,
  `strOrderPass` varchar(45) NOT NULL,
  `intPictureID` int(11) DEFAULT NULL,
  `intItemCat` int(11) NOT NULL,
  PRIMARY KEY (`intItemID`),
  KEY `strItemSNum_idx` (`strItemSNum`),
  KEY `intItemCat_idx` (`intItemCat`),
  KEY `intPictureID_idx` (`intPictureID`),
  CONSTRAINT `intItemCat` FOREIGN KEY (`intItemCat`) REFERENCES `tblcategories` (`intCatID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `intPictureID` FOREIGN KEY (`intPictureID`) REFERENCES `tblpicture` (`intItemID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `strItemSNum` FOREIGN KEY (`strItemSNum`) REFERENCES `tbluser` (`strSNum`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblitem`
--

INSERT INTO `tblitem` VALUES (1,'Database Vol 17',499.98,'2015-01216-MN-0','2014-09-20','A comprehensive, up-to-date treatment of database technology. This edition features: updated coverage of object-oriented database systems, including a proposal for rapprochement between OO and relational technologies; expanded treatment of distributed databases, including client/server architectures, with an emphasis on database design issues; a comprehensive introduction to all aspects of the relational model - the basis of modern database technology; and new chapters on functional dependencies, views, domains and missing information.','pass',NULL,1),(2,'Kyrie 3',10000,'1','2015-08-21','Kyrie Irving Shoes','word',NULL,4),(3,'Cisco Codex',1500,'1','2016-04-22','Cisco Book for All','cisco',NULL,1),(4,'Adprog',12,'1','2016-08-27','Adprog','adp',NULL,1),(5,'TechDoc',12,'1','2016-12-31','TechDoc','td',NULL,1),(6,'Management',12,'1','2017-04-04','Management','mana',NULL,1),(14,'Blue Panda',35,'2015-01216-MN-0','2017-09-22','Pagkain ako','1234',NULL,3),(39,'Frixion',70,'2015-01216-MN-0','2017-09-22','Erasable Pen','frix',NULL,2),(40,'Chicken Joy',80,'2015-01216-MN-0','2017-09-22','Fresh Chicken from Jabi','jabi123',NULL,3),(41,'Pizza',499,'2015-01216-MN-0','2017-09-22','2 Pizza Promo','pizza',NULL,3),(42,'Sock',12,'2015-01216-MN-0','2017-09-23','In New York I Milly Rock','what',NULL,4);

--
-- Table structure for table `tblpicture`
--

DROP TABLE IF EXISTS `tblpicture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpicture` (
  `intItemID` int(11) NOT NULL,
  `strFirstPic` varchar(45) DEFAULT NULL,
  `strSecondPic` varchar(45) DEFAULT NULL,
  `strThirdPic` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`intItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpicture`
--


--
-- Table structure for table `tblquestions`
--

DROP TABLE IF EXISTS `tblquestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblquestions` (
  `intQuestionID` int(11) NOT NULL AUTO_INCREMENT,
  `strQuestion` varchar(200) NOT NULL,
  `boolUsed` tinyint(4) NOT NULL,
  PRIMARY KEY (`intQuestionID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblquestions`
--

INSERT INTO `tblquestions` VALUES (1,'Where is the Obelisk located at?',0),(2,'How many wings does the main building have?',0),(3,'Who is the national hero that has a \"tahanan\" in our Sintang Paaralan?',0),(4,'Who is Ted Pylon?',0),(5,'Where is the UFO/Watertank located at in PUP?',0),(6,'The favorite mall of students when there are no professors',0),(7,'What does \"FEWA\" mean?',0),(8,'How many basketball courts does PUP Sta. Mesa have?',0),(9,'How many 7/11 branches are there near PUP Sta. Mesa?',0),(10,'What is the first name of PUP?',0),(11,'What year did PUP officially become a university?',0),(12,'What would you do if there is a shortage of chairs in your room?',0),(13,'Who is the \"Einstein\" of PUP Sta. Mesa?',0),(14,'Who is the current president of PUP?',0),(15,'How many characters does the student number have (excluding dashes)?',0),(16,'What is the real name of the event \"Kikiam run\"?',0),(17,'How many floors does the PUP main building have?',0),(18,'What does \"Virgin\" sell?',0),(19,'Currently, what does \"Intramuros\" behold inside?',0),(20,'Other than the FEWA, what is the other famous food from PUP?',0),(21,'Where is the most presentable comfort room located at in PUP Sta. Mesa?',0),(22,'How long do you have to wait until you could safely assume that your professor is absent?',0),(23,'What is the latest end of classes in PUP?',0),(24,'When you were a freshie, how long did the line go during registration?',0);

--
-- Table structure for table `tbltransaction`
--

DROP TABLE IF EXISTS `tbltransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltransaction` (
  `intTransID` int(11) NOT NULL AUTO_INCREMENT,
  `intTransItemID` int(11) NOT NULL,
  `strBuyerSNum` varchar(45) NOT NULL,
  `datDateStarted` date NOT NULL,
  `strTransStatus` varchar(20) NOT NULL,
  `datDateFinished` date DEFAULT NULL,
  PRIMARY KEY (`intTransID`),
  KEY `intTransItemID_idx` (`intTransItemID`),
  KEY `strBuyerSNum_idx` (`strBuyerSNum`),
  CONSTRAINT `intTransItemID` FOREIGN KEY (`intTransItemID`) REFERENCES `tblitem` (`intItemID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `strBuyerSNum` FOREIGN KEY (`strBuyerSNum`) REFERENCES `tbluser` (`strSNum`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltransaction`
--

INSERT INTO `tbltransaction` VALUES (9,1,'1','2017-09-23','Ongoing',NULL);

--
-- Table structure for table `tbluser`
--

DROP TABLE IF EXISTS `tbluser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbluser` (
  `strSNum` varchar(45) NOT NULL,
  `strName` varchar(45) NOT NULL,
  `strGender` varchar(45) NOT NULL,
  `datBirthday` date NOT NULL,
  `strBranch` varchar(45) NOT NULL,
  `strEmail` varchar(45) NOT NULL,
  `txtContact` longtext,
  `strPassword` varchar(45) NOT NULL,
  `strStatus` varchar(45) NOT NULL,
  `intCommend` int(11) NOT NULL,
  `intReport` int(11) NOT NULL,
  `strType` varchar(45) NOT NULL,
  PRIMARY KEY (`strSNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` VALUES ('1','User One','1','0001-01-01','1','1','1','1','unregistered',0,0,'normal'),('2','User Two','2','0002-02-22','2','2','2','2','unregistered',0,0,'normal'),('200','John Doe','M','1999-04-24','Main','John@gmail.com','09236835707','12','verified',101,5,'normal'),('201','Jane Doe','F','1999-05-07','Main','Jane@gmail.com','09236674044','13','verified',20,3,'normal'),('2015-01216-MN-0','Jon Balmaceda','M','1999-04-24','Sta. Mesa','balmacedajonervin@gmail.com','09236835707','pass','unregistered',0,0,'normal'),('3','3','3','0003-03-03','3','3','3','3','unregistered',0,0,'normal'),('4','4','4','0004-04-04','4','4','4','4','unregistered',0,0,'normal'),('5','5','5','0005-05-05','5','5','5','5','unregistered',0,0,'normal');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
