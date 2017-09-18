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
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

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
  `boolCorrect` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`intChID`),
  KEY `intChQuestionID_idx` (`intChQuestionID`),
  CONSTRAINT `intChQuestionID` FOREIGN KEY (`intChQuestionID`) REFERENCES `tblquestions` (`intQuestionID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblchoices`
--

INSERT INTO `tblchoices` VALUES (1,1,'1',0),(2,1,'2',1),(3,1,'3',0),(4,1,'4',0),(5,2,'2',0),(6,2,'4',1),(7,2,'6',0),(8,2,'8',0),(9,3,'2',0),(10,3,'4',0),(11,3,'6',1),(12,3,'12',0);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblquestions`
--

INSERT INTO `tblquestions` VALUES (1,'1 plus 1',0),(2,'2 plus 2',0),(3,'3 plus 3',0);

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
  `boolLoggedin` tinyint(1) NOT NULL,
  PRIMARY KEY (`strSNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` VALUES ('1','1','1','1999-04-24','1','1','1','1','unregistered',0,0,'normal',0),('12','John Doe','M','1999-04-24','Main','John@gmail.com','09236835707','12','verified',101,5,'normal',0),('13','Jane Doe','F','1999-05-07','Main','Jane@gmail.com','09236674044','13','verified',20,3,'normal',0),('2','2','2','1999-04-24','2','2','2','2','unregistered',0,0,'normal',0),('2015-01216-MN-0','Jon Balmaceda','M','1999-04-24','Sta. Mesa','balmacedajonervin@gmail.com','09236835707','pass','unregistered',0,0,'normal',0),('5','5','5','1999-04-24','5','5','5','5','unregistered',0,0,'normal',0);
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-18  0:08:47
