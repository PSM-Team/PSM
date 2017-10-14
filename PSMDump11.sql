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
  `strAnswerSNum` char(15) NOT NULL,
  `intAnswer` int(3) NOT NULL,
  PRIMARY KEY (`intAnswerID`),
  KEY `strAnswerSNum_idx` (`strAnswerSNum`),
  KEY `intAnswer_idx` (`intAnswer`),
  CONSTRAINT `intAnswer` FOREIGN KEY (`intAnswer`) REFERENCES `tblchoices` (`intChID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `strAnswerSNum` FOREIGN KEY (`strAnswerSNum`) REFERENCES `tbluser` (`strSNum`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblanswers`
--

INSERT INTO `tblanswers` VALUES (1,'2015-01216-MN-0',2),(2,'2015-01216-MN-0',33),(3,'2015-01216-MN-0',82),(4,'2015-01216-MN-0',63),(5,'2015-01216-MN-0',65),(6,'2015-01216-MN-0',6),(7,'2015-01216-MN-0',38),(8,'2015-01216-MN-0',69),(9,'2015-01216-MN-0',41),(10,'2015-01216-MN-0',95),(11,'2015-02839-MN-0',11),(12,'2015-02839-MN-0',14),(13,'2015-02839-MN-0',32),(14,'2015-02839-MN-0',46),(15,'2015-02839-MN-0',53),(16,'2015-02839-MN-0',41),(17,'2015-02839-MN-0',63),(18,'2015-02839-MN-0',74),(19,'2015-02839-MN-0',79),(20,'2015-02839-MN-0',90),(21,'2015-05757-MN-0',89),(22,'2015-05757-MN-0',73),(23,'2015-05757-MN-0',13),(24,'2015-05757-MN-0',25),(25,'2015-05757-MN-0',45),(26,'2015-05757-MN-0',72),(27,'2015-05757-MN-0',34),(28,'2015-05757-MN-0',30),(29,'2015-05757-MN-0',80),(30,'2015-05757-MN-0',58),(31,'2015-04790-MN-0',93),(32,'2015-04790-MN-0',69),(33,'2015-04790-MN-0',1),(34,'2015-04790-MN-0',85),(35,'2015-04790-MN-0',77),(36,'2015-04790-MN-0',73),(37,'2015-04790-MN-0',61),(38,'2015-04790-MN-0',57),(39,'2015-04790-MN-0',33),(40,'2015-04790-MN-0',13),(41,'2015-04593-MN-0',89),(42,'2015-04593-MN-0',13),(43,'2015-04593-MN-0',17),(44,'2015-04593-MN-0',49),(45,'2015-04593-MN-0',21),(46,'2015-04593-MN-0',53),(47,'2015-04593-MN-0',45),(48,'2015-04593-MN-0',57),(49,'2015-04593-MN-0',61),(50,'2015-04593-MN-0',41);

--
-- Table structure for table `tblcategories`
--

DROP TABLE IF EXISTS `tblcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcategories` (
  `intCatID` int(1) NOT NULL,
  `strCatName` varchar(30) NOT NULL,
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
  `intChID` int(3) NOT NULL,
  `intChQuestionID` int(2) NOT NULL,
  `strChoice` varchar(100) NOT NULL,
  `boolCorrect` int(1) NOT NULL,
  PRIMARY KEY (`intChID`),
  KEY `intChQuestionID_idx` (`intChQuestionID`),
  CONSTRAINT `intChQuestionID` FOREIGN KEY (`intChQuestionID`) REFERENCES `tblquestions` (`intQuestionID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `strItemSNum` char(15) NOT NULL,
  `datPostDate` date NOT NULL,
  `txtItemDesc` varchar(250) DEFAULT NULL,
  `strOrderPass` varchar(45) NOT NULL,
  `strFirstPic` varchar(100) DEFAULT NULL,
  `strSecondPic` varchar(100) DEFAULT NULL,
  `strThirdPic` varchar(100) DEFAULT NULL,
  `intItemCat` int(1) NOT NULL,
  PRIMARY KEY (`intItemID`),
  KEY `strItemSNum_idx` (`strItemSNum`),
  KEY `intItemCat_idx` (`intItemCat`),
  CONSTRAINT `intItemCat` FOREIGN KEY (`intItemCat`) REFERENCES `tblcategories` (`intCatID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `strItemSNum` FOREIGN KEY (`strItemSNum`) REFERENCES `tbluser` (`strSNum`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblitem`
--

INSERT INTO `tblitem` VALUES (6,'DC Comics Issue 7',80,'2015-02839-MN-0','2017-10-10','The Reverse Flash','flash','2015-02839-MN-0-jzMyBJKa9QzixKEsZ6YVnYQ4UCrJg9AI2fwSLgUsJEtQrfV5mj-1.jpg','blank.jpg','blank.jpg',1),(7,'Beats Headset Black (Used)',570,'2015-01216-MN-0','2017-10-10','Best lit earphones in manila','beats','2015-01216-MN-0-on6bBsDEHOYc6OPO0NaXJhnyjvrURVN6XjbaPU4fcIY33fgeRf-1.jpg','blank.jpg','blank.jpg',4),(12,'Photoshop & Lightroom HandBook for Dummies 2',361.3,'2015-01216-MN-0','2017-10-10','volume 2','photoshop','2015-01216-MN-0-gLI77rVC03NpECHbQkWQpwAyTbl4mBYJ9aif9pMewHZti5JfBz-1.jpg','blank.jpg','blank.jpg',1),(13,'x',1,'2015-01216-MN-0','2017-10-13','x','x','2015-01216-MN-0-nHPuKBz3N060BRhtfTdMHGNkCJS2m890ovLe7kk1A4g13QwBfe-1.jpg','blank.jpg','blank.jpg',4),(14,'c',1,'2015-01216-MN-0','2017-10-13','c','c','2015-01216-MN-0-aoO4JPa9ldnd4XfZp78m97MSb6eXt33ru8WkhKrlADR7HlzjxL-1.jpg','blank.jpg','blank.jpg',4),(15,'z',1,'2015-01216-MN-0','2017-10-13','z','z','2015-01216-MN-0-PvsU1GgngxebzNRZLGWiFeAJZceYDkHu5YxyKN8FNCo5Z49SYT-1.jpg','blank.jpg','blank.jpg',4),(16,'v',1,'2015-01216-MN-0','2017-10-13','v','v','2015-01216-MN-0-nG7NSIEUGEJdxj6t0VAUiFqFpjvJxlQlsPt9MnYeB9gEWOjIRV-1.jpg','blank.jpg','blank.jpg',4),(17,'a',1,'2015-05757-MN-0','2017-10-13','a','a','2015-05757-MN-0-P1cL59jozPRXzyOpbNzyXtor4jhRdzifxMUFefeG4S12pZqtuT-1.jpg','blank.jpg','blank.jpg',4),(18,'q',1,'2015-05757-MN-0','2017-10-14','q','q','2015-05757-MN-0-RpwK4ywmxdu7pziWnoA83tgRt0puWjXJI4R9ogYDjXvMTh0Qji-1.jpg','2015-05757-MN-0-RpwK4ywmxdu7pziWnoA83tgRt0puWjXJI4R9ogYDjXvMTh0Qji-2.jpg','blank.jpg',4),(19,'q',1,'2015-05757-MN-0','2017-10-14','q','q','2015-05757-MN-0-mFR050gIsbuN6Ioybv0T7U8QVj8wLPQjeWkymodC206XbWAvVI-1.jpg','2015-05757-MN-0-mFR050gIsbuN6Ioybv0T7U8QVj8wLPQjeWkymodC206XbWAvVI-2.jpg','blank.jpg',4),(20,'q',1,'2015-05757-MN-0','2017-10-14','q','q','2015-05757-MN-0-66ZwDCygnvMuQbm0ydKB2LUI8xelk9sHvOXXiS0tbcyg7h3r4E-1.jpg','2015-05757-MN-0-66ZwDCygnvMuQbm0ydKB2LUI8xelk9sHvOXXiS0tbcyg7h3r4E-2.jpg','blank.jpg',4),(21,'Wallpapers',1,'2015-05757-MN-0','2017-10-14','wallpapers for walls','wall','2015-05757-MN-0-0EKPgHtrVaYLGlfNqYLs8ctR5WeY6vWrpq7bu19zaDcEeQObCD-1.jpg','blank.jpg','blank.jpg',4),(22,'Dream Big',325.089,'2015-01216-MN-0','2017-10-14','Dream Big!','dream','2015-01216-MN-0-PWKjbpXIrOICvOY8ij65tcubf2qIbsKphY4TMDklIoM7On6OsS-1.jpg','blank.jpg','blank.jpg',4),(23,'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',1,'2015-05757-MN-0','2017-10-14','h','h','2015-05757-MN-0-7sujcl0mBT4zM4QEa29WzWsMslxIOszi9c7CkTDW8RgVJmdQBh-1.jpg','blank.jpg','blank.jpg',4);

--
-- Table structure for table `tblquestions`
--

DROP TABLE IF EXISTS `tblquestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblquestions` (
  `intQuestionID` int(2) NOT NULL,
  `strQuestion` varchar(150) NOT NULL,
  `boolUsed` int(1) NOT NULL,
  PRIMARY KEY (`intQuestionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblquestions`
--

INSERT INTO `tblquestions` VALUES (1,'Where is the Obelisk located at?',0),(2,'How many wings does the main building have?',0),(3,'Who is the national hero that has a \"tahanan\" in our Sintang Paaralan?',0),(4,'Who is Ted Pylon?',0),(5,'Where is the UFO/Watertank located at in PUP?',0),(6,'The favorite mall of students when there are no professors',0),(7,'What does \"FEWA\" mean?',0),(8,'How many basketball courts does PUP Sta. Mesa have?',0),(9,'How many 7/11 branches are there near PUP Sta. Mesa?',0),(10,'What is the first name of PUP?',0),(11,'What year did PUP officially become a university?',0),(12,'What would you do if there is a shortage of chairs in your room?',0),(13,'Who is the \"Einstein\" of PUP Sta. Mesa?',0),(14,'Who is the current president of PUP?',0),(15,'How many characters does the student number have (excluding dashes)?',0),(16,'What is the real name of the event \"Kikiam run\"?',0),(17,'How many floors does the PUP main building have?',0),(18,'What does \"Virgin\" sell?',0),(19,'Currently, what does \"Intramuros\" behold inside?',0),(20,'Other than the FEWA, what is the other famous food from PUP?',0),(21,'Where is the most presentable comfort room located at in PUP Sta. Mesa?',0),(22,'How long do you have to wait until you could safely assume that your professor is absent?',0),(23,'What is the latest end of classes in PUP?',0),(24,'When you were a freshie, how long did the line go during registration?',0);

--
-- Table structure for table `tblreport`
--

DROP TABLE IF EXISTS `tblreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblreport` (
  `intReportID` int(11) NOT NULL AUTO_INCREMENT,
  `intReportItemID` int(11) NOT NULL,
  `strReportSNum` char(15) NOT NULL,
  PRIMARY KEY (`intReportID`),
  KEY `intReportItemID_idx` (`intReportItemID`),
  KEY `strReportSNum_idx` (`strReportSNum`),
  CONSTRAINT `intReportItemID` FOREIGN KEY (`intReportItemID`) REFERENCES `tblitem` (`intItemID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `strReportSNum` FOREIGN KEY (`strReportSNum`) REFERENCES `tbluser` (`strSNum`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblreport`
--


--
-- Table structure for table `tbltransaction`
--

DROP TABLE IF EXISTS `tbltransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltransaction` (
  `intTransID` int(11) NOT NULL AUTO_INCREMENT,
  `intTransItemID` int(11) NOT NULL,
  `strBuyerSNum` char(15) NOT NULL,
  `datDateStarted` date NOT NULL,
  `strTransStatus` varchar(20) NOT NULL,
  `datDateFinished` date DEFAULT NULL,
  PRIMARY KEY (`intTransID`),
  KEY `intTransItemID_idx` (`intTransItemID`),
  KEY `strBuyerSNum_idx` (`strBuyerSNum`),
  CONSTRAINT `intTransItemID` FOREIGN KEY (`intTransItemID`) REFERENCES `tblitem` (`intItemID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `strBuyerSNum` FOREIGN KEY (`strBuyerSNum`) REFERENCES `tbluser` (`strSNum`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltransaction`
--

INSERT INTO `tbltransaction` VALUES (7,6,'2015-01216-MN-0','2017-10-13','Finished','2017-10-14'),(14,17,'2015-01216-MN-0','2017-10-13','Ongoing',NULL);

--
-- Table structure for table `tbluser`
--

DROP TABLE IF EXISTS `tbluser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbluser` (
  `strSNum` char(15) NOT NULL,
  `strName` varchar(100) NOT NULL,
  `strEmail` varchar(45) NOT NULL,
  `txtContact` varchar(250) DEFAULT NULL,
  `strPassword` varchar(50) NOT NULL,
  `strStatus` varchar(20) NOT NULL,
  `intCommend` int(6) NOT NULL,
  `intReport` int(6) NOT NULL,
  `strProfilePicture` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`strSNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` VALUES ('2015-01216-MN-0','Jon Ervin Balmaceda','balmacedajonervin@gmail.com','09236835707','pass','verified',1,1,'2015-01216-MN-0-9IgX6O3wQVTG6nvB2R4objMKZXKA0SqgSSWmqyiv6RMvwgwd2X-dp.jpg'),('2015-02839-MN-0','John Homer Cadena','homercadena@gmail.com','09237745678','pass','banned',1,10000000,'2015-02839-MN-0-Io8H97ODqCbKMgZBoNajhXlCK2WIlDa5T53NnEBioB5p1fa8Hn-dp.jpg'),('2015-04593-MN-0','Jethro Jhay Samson','Jethro1@yahoo.com','09051386658','pass','unregistered',0,0,'blank.jpg'),('2015-04790-MN-0','EJ Dorosan','ejd@gmail.com','09199754119','pass','rejected',0,0,'blank.jpg'),('2015-05757-MN-0','John Carlo Doronila','doronilajc@gmail.com','09199754119','pass','not verified',1,0,'2015-05757-MN-0-4JSu45e8kQhuLjNEn5qnph7jHxMEy4IflLqm96KW5GL5PAXJqC-dp.jpg'),('admin','Admin User','psm.sup.adm@gmail.com','psm.sup.adm@gmail.com','admin','admin',0,0,NULL);

--
-- Dumping events for database 'dbpsm'
--

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
