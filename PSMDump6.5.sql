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
-- Temporary view structure for view `itemcat`
--

DROP TABLE IF EXISTS `itemcat`;
/*!50001 DROP VIEW IF EXISTS `itemcat`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `itemcat` AS SELECT 
 1 AS `intItemID`,
 1 AS `strItemTitle`,
 1 AS `fltItemPrice`,
 1 AS `strItemSNum`,
 1 AS `datPostDate`,
 1 AS `txtItemDesc`,
 1 AS `strOrderPass`,
 1 AS `intPictureID`,
 1 AS `intItemCat`,
 1 AS `intCatID`,
 1 AS `strCatName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `itemtrans`
--

DROP TABLE IF EXISTS `itemtrans`;
/*!50001 DROP VIEW IF EXISTS `itemtrans`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `itemtrans` AS SELECT 
 1 AS `intItemID`,
 1 AS `strName`,
 1 AS `strItemTitle`,
 1 AS `fltItemPrice`,
 1 AS `strItemSNum`,
 1 AS `datPostDate`,
 1 AS `intItemCat`,
 1 AS `strCatName`,
 1 AS `strTransStatus`,
 1 AS `intTransID`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `lateststatus`
--

DROP TABLE IF EXISTS `lateststatus`;
/*!50001 DROP VIEW IF EXISTS `lateststatus`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `lateststatus` AS SELECT 
 1 AS `intItemID`,
 1 AS `strName`,
 1 AS `strItemTitle`,
 1 AS `fltItemPrice`,
 1 AS `strItemSNum`,
 1 AS `datPostDate`,
 1 AS `intItemCat`,
 1 AS `strCatName`,
 1 AS `strTransStatus`,
 1 AS `intTransID`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!50001 DROP VIEW IF EXISTS `seller`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `seller` AS SELECT 
 1 AS `intItemID`,
 1 AS `strName`,
 1 AS `strItemTitle`,
 1 AS `fltItemPrice`,
 1 AS `strItemSNum`,
 1 AS `datPostDate`,
 1 AS `intItemCat`,
 1 AS `strCatName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `seller2`
--

DROP TABLE IF EXISTS `seller2`;
/*!50001 DROP VIEW IF EXISTS `seller2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `seller2` AS SELECT 
 1 AS `intItemID`,
 1 AS `strName`,
 1 AS `strItemTitle`,
 1 AS `fltItemPrice`,
 1 AS `strItemSNum`,
 1 AS `datPostDate`,
 1 AS `intItemCat`,
 1 AS `strCatName`*/;
SET character_set_client = @saved_cs_client;

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblanswers`
--

INSERT INTO `tblanswers` VALUES (1,'2015-01341-MN-0',95),(2,'2015-01341-MN-0',17),(3,'2015-01341-MN-0',46),(4,'2015-01341-MN-0',65),(5,'2015-01341-MN-0',69),(6,'2015-01341-MN-0',74),(7,'2015-01341-MN-0',82),(8,'2015-01341-MN-0',90),(9,'2015-01341-MN-0',33),(10,'2015-01341-MN-0',61),(11,'2014-01341-MN-0',93),(12,'2014-01341-MN-0',25),(13,'2014-01341-MN-0',31),(14,'2014-01341-MN-0',88),(15,'2014-01341-MN-0',57),(16,'2014-01341-MN-0',5),(17,'2014-01341-MN-0',13),(18,'2014-01341-MN-0',44),(19,'2014-01341-MN-0',72),(20,'2014-01341-MN-0',84);

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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblitem`
--

INSERT INTO `tblitem` VALUES (46,'Book 1',200,'2015-01341-MN-0','2017-09-27','Book 1 Desc','pass',NULL,1),(47,'extra rice',69,'2015-01341-MN-0','2017-09-27','slightly used','kanin123',NULL,3),(48,'lapis',7,'2015-01341-MN-0','2017-09-27','matulis','pencil',NULL,2),(49,'Database Administration',500.01,'1','2017-09-27','Database Book','dbbook',NULL,1);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltransaction`
--

INSERT INTO `tbltransaction` VALUES (1,47,'2014-01341-MN-0','2017-09-27','BFinished',NULL),(2,46,'2014-01341-MN-0','2017-09-27','Finished','2017-09-27'),(3,48,'1','2017-09-27','BFinished',NULL);

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

INSERT INTO `tbluser` VALUES ('0','Zero User','F','1999-04-26','Sta. Mesa','1@gmail.com',NULL,'0','not verified',0,0,'normal'),('1','One User','M','1999-04-25','Sta. Mesa','1@gmail.com','1','1','verified',1,1,'normal'),('2014-01341-MN-0','xd x. dy','f','1969-10-01','Sta. Mesa','xd@yahoo.com','','xdxdxd','verified',0,0,'normal'),('2015-01341-MN-0','Vince Miguel D. Oreta','M','1999-06-05','Sta. Mesa','vincemiguel14@yahoo.com','09199754119','xdadmin','verified',0,0,'normal'),('Admin','Admin User','M','1999-04-24','Sta.Mesa','admin@gmail.com',NULL,'admin','verified',0,0,'admin');

--
-- Final view structure for view `itemcat`
--

/*!50001 DROP VIEW IF EXISTS `itemcat`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `itemcat` AS select `tblitem`.`intItemID` AS `intItemID`,`tblitem`.`strItemTitle` AS `strItemTitle`,`tblitem`.`fltItemPrice` AS `fltItemPrice`,`tblitem`.`strItemSNum` AS `strItemSNum`,`tblitem`.`datPostDate` AS `datPostDate`,`tblitem`.`txtItemDesc` AS `txtItemDesc`,`tblitem`.`strOrderPass` AS `strOrderPass`,`tblitem`.`intPictureID` AS `intPictureID`,`tblitem`.`intItemCat` AS `intItemCat`,`tblcategories`.`intCatID` AS `intCatID`,`tblcategories`.`strCatName` AS `strCatName` from (`tblitem` join `tblcategories` on((`tblitem`.`intItemCat` = `tblcategories`.`intCatID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `itemtrans`
--

/*!50001 DROP VIEW IF EXISTS `itemtrans`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `itemtrans` AS select `seller2`.`intItemID` AS `intItemID`,`seller2`.`strName` AS `strName`,`seller2`.`strItemTitle` AS `strItemTitle`,`seller2`.`fltItemPrice` AS `fltItemPrice`,`seller2`.`strItemSNum` AS `strItemSNum`,`seller2`.`datPostDate` AS `datPostDate`,`seller2`.`intItemCat` AS `intItemCat`,`seller2`.`strCatName` AS `strCatName`,`tbltransaction`.`strTransStatus` AS `strTransStatus`,`tbltransaction`.`intTransID` AS `intTransID` from (`tbltransaction` join `seller2` on((`seller2`.`intItemID` = `tbltransaction`.`intTransItemID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `lateststatus`
--

/*!50001 DROP VIEW IF EXISTS `lateststatus`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `lateststatus` AS select `a`.`intItemID` AS `intItemID`,`a`.`strName` AS `strName`,`a`.`strItemTitle` AS `strItemTitle`,`a`.`fltItemPrice` AS `fltItemPrice`,`a`.`strItemSNum` AS `strItemSNum`,`a`.`datPostDate` AS `datPostDate`,`a`.`intItemCat` AS `intItemCat`,`a`.`strCatName` AS `strCatName`,`a`.`strTransStatus` AS `strTransStatus`,`a`.`intTransID` AS `intTransID` from (`dbpsm`.`itemtrans` `a` join (select max(`trans`.`intTransID`) AS `Latest`,`trans`.`intItemID` AS `intItemID` from (select `seller`.`intItemID` AS `intItemID`,`seller`.`strName` AS `strName`,`seller`.`strItemTitle` AS `strItemTitle`,`seller`.`fltItemPrice` AS `fltItemPrice`,`seller`.`strItemSNum` AS `strItemSNum`,`seller`.`datPostDate` AS `datPostDate`,`seller`.`intItemCat` AS `intItemCat`,`seller`.`strCatName` AS `strCatName`,`dbpsm`.`tbltransaction`.`strTransStatus` AS `strTransStatus`,`dbpsm`.`tbltransaction`.`intTransID` AS `intTransID` from (`dbpsm`.`tbltransaction` join (select `itemcat`.`intItemID` AS `intItemID`,`itemcat`.`strItemTitle` AS `strItemTitle`,`itemcat`.`fltItemPrice` AS `fltItemPrice`,`itemcat`.`strItemSNum` AS `strItemSNum`,`itemcat`.`datPostDate` AS `datPostDate`,`itemcat`.`txtItemDesc` AS `txtItemDesc`,`itemcat`.`strOrderPass` AS `strOrderPass`,`itemcat`.`intPictureID` AS `intPictureID`,`itemcat`.`intItemCat` AS `intItemCat`,`itemcat`.`intCatID` AS `intCatID`,`itemcat`.`strCatName` AS `strCatName`,`dbpsm`.`tbluser`.`strSNum` AS `strSNum`,`dbpsm`.`tbluser`.`strName` AS `strName`,`dbpsm`.`tbluser`.`strGender` AS `strGender`,`dbpsm`.`tbluser`.`datBirthday` AS `datBirthday`,`dbpsm`.`tbluser`.`strBranch` AS `strBranch`,`dbpsm`.`tbluser`.`strEmail` AS `strEmail`,`dbpsm`.`tbluser`.`txtContact` AS `txtContact`,`dbpsm`.`tbluser`.`strPassword` AS `strPassword`,`dbpsm`.`tbluser`.`strStatus` AS `strStatus`,`dbpsm`.`tbluser`.`intCommend` AS `intCommend`,`dbpsm`.`tbluser`.`intReport` AS `intReport`,`dbpsm`.`tbluser`.`strType` AS `strType` from (((select `dbpsm`.`tblitem`.`intItemID` AS `intItemID`,`dbpsm`.`tblitem`.`strItemTitle` AS `strItemTitle`,`dbpsm`.`tblitem`.`fltItemPrice` AS `fltItemPrice`,`dbpsm`.`tblitem`.`strItemSNum` AS `strItemSNum`,`dbpsm`.`tblitem`.`datPostDate` AS `datPostDate`,`dbpsm`.`tblitem`.`txtItemDesc` AS `txtItemDesc`,`dbpsm`.`tblitem`.`strOrderPass` AS `strOrderPass`,`dbpsm`.`tblitem`.`intPictureID` AS `intPictureID`,`dbpsm`.`tblitem`.`intItemCat` AS `intItemCat`,`dbpsm`.`tblcategories`.`intCatID` AS `intCatID`,`dbpsm`.`tblcategories`.`strCatName` AS `strCatName` from (`dbpsm`.`tblitem` join `dbpsm`.`tblcategories` on((`dbpsm`.`tblitem`.`intItemCat` = `dbpsm`.`tblcategories`.`intCatID`))))) `itemcat` join `dbpsm`.`tbluser` on((`itemcat`.`strItemSNum` = `dbpsm`.`tbluser`.`strSNum`)))) `seller` on((`seller`.`intItemID` = `dbpsm`.`tbltransaction`.`intTransItemID`)))) `trans` group by `trans`.`intItemID`) `b`) where ((`a`.`intItemID` = `b`.`intItemID`) and (`a`.`intTransID` = `b`.`Latest`)) order by `a`.`intItemID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `seller`
--

/*!50001 DROP VIEW IF EXISTS `seller`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `seller` AS select `itemcat`.`intItemID` AS `intItemID`,`tbluser`.`strName` AS `strName`,`itemcat`.`strItemTitle` AS `strItemTitle`,`itemcat`.`fltItemPrice` AS `fltItemPrice`,`itemcat`.`strItemSNum` AS `strItemSNum`,`itemcat`.`datPostDate` AS `datPostDate`,`itemcat`.`intItemCat` AS `intItemCat`,`itemcat`.`strCatName` AS `strCatName` from (`itemcat` join `tbluser` on((`itemcat`.`strItemSNum` = `tbluser`.`strSNum`))) order by `itemcat`.`intItemID` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `seller2`
--

/*!50001 DROP VIEW IF EXISTS `seller2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `seller2` AS select `itemcat`.`intItemID` AS `intItemID`,`tbluser`.`strName` AS `strName`,`itemcat`.`strItemTitle` AS `strItemTitle`,`itemcat`.`fltItemPrice` AS `fltItemPrice`,`itemcat`.`strItemSNum` AS `strItemSNum`,`itemcat`.`datPostDate` AS `datPostDate`,`itemcat`.`intItemCat` AS `intItemCat`,`itemcat`.`strCatName` AS `strCatName` from (`itemcat` join `tbluser` on((`itemcat`.`strItemSNum` = `tbluser`.`strSNum`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
