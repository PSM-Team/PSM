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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblanswers`
--

INSERT INTO `tblanswers` VALUES (1,'2015-01341-MN-0',95),(2,'2015-01341-MN-0',17),(3,'2015-01341-MN-0',46),(4,'2015-01341-MN-0',65),(5,'2015-01341-MN-0',69),(6,'2015-01341-MN-0',74),(7,'2015-01341-MN-0',82),(8,'2015-01341-MN-0',90),(9,'2015-01341-MN-0',33),(10,'2015-01341-MN-0',61),(11,'2014-01341-MN-0',93),(12,'2014-01341-MN-0',25),(13,'2014-01341-MN-0',31),(14,'2014-01341-MN-0',88),(15,'2014-01341-MN-0',57),(16,'2014-01341-MN-0',5),(17,'2014-01341-MN-0',13),(18,'2014-01341-MN-0',44),(19,'2014-01341-MN-0',72),(20,'2014-01341-MN-0',84),(21,'4',2),(22,'4',72),(23,'4',8),(24,'4',10),(25,'4',85),(26,'4',19),(27,'4',31),(28,'4',94),(29,'4',58),(30,'4',25),(31,'5',95),(32,'5',2),(33,'5',37),(34,'5',6),(35,'5',53),(36,'5',85),(37,'5',33),(38,'5',82),(39,'5',60),(40,'5',41),(41,'2015-01216-MN-0',85),(42,'2015-01216-MN-0',2),(43,'2015-01216-MN-0',65),(44,'2015-01216-MN-0',14),(45,'2015-01216-MN-0',17),(46,'2015-01216-MN-0',33),(47,'2015-01216-MN-0',69),(48,'2015-01216-MN-0',46),(49,'2015-01216-MN-0',79),(50,'2015-01216-MN-0',51);

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
  `strFirstPic` tinytext,
  `strSecondPic` tinytext,
  `strThirdPic` tinytext,
  `intItemCat` int(11) NOT NULL,
  PRIMARY KEY (`intItemID`),
  KEY `strItemSNum_idx` (`strItemSNum`),
  KEY `intItemCat_idx` (`intItemCat`),
  CONSTRAINT `intItemCat` FOREIGN KEY (`intItemCat`) REFERENCES `tblcategories` (`intCatID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `strItemSNum` FOREIGN KEY (`strItemSNum`) REFERENCES `tbluser` (`strSNum`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblitem`
--

INSERT INTO `tblitem` VALUES (46,'Book 1',200,'2015-01341-MN-0','2017-09-27','Book 1 Desc','pass',NULL,NULL,NULL,1),(47,'extra rice',69,'2015-01341-MN-0','2017-09-27','slightly used','kanin123',NULL,NULL,NULL,3),(48,'lapis',7,'2015-01341-MN-0','2017-09-27','matulis','pencil',NULL,NULL,NULL,2),(50,'Ultimate Cook Book',2000,'1','2017-09-29','Limited Edition','password',NULL,NULL,NULL,1),(51,'Encyclopedia',2500,'1','2017-09-29','Encyclopedia','ency',NULL,NULL,NULL,1),(55,'Graham Balls',5,'2','2017-09-29','balls made of graham','grab',NULL,NULL,NULL,3),(57,'Cartolina',2,'2','2017-09-29','Green','carti',NULL,NULL,NULL,2),(58,'Operating Systems',312,'5','2017-09-30','OS Book for IT','osit',NULL,NULL,NULL,1),(81,'1',1,'5','2017-10-02','1','1','5-q5ISpJGSZXIPQiDGmNoU-1.jpg','blank.jpg','blank.jpg',4),(82,'2',2,'5','2017-10-02','2','2','blank.jpg','5-8Md7npcTvHJmgcOjxx1U-2.jpg','blank.jpg',4),(83,'3',3,'5','2017-10-02','3','3','blank.jpg','blank.jpg','5-YuQmuxMn1gdouslCv9M0-3.jpg',4),(84,'12',12,'5','2017-10-02','12','12','5-d8WrSvV149UNnG1H4DH8-1.jpg','5-d8WrSvV149UNnG1H4DH8-2.jpg','blank.jpg',4),(85,'13',13,'5','2017-10-02','Ginger, curly hair hangs over a skinny, anguished face. Round green eyes, set appealingly within their sockets, watch delicately over the armies they\'ve defended for so long.\nA tattoo resembling an eagle claw is prominently featured on the left side of his neck leaves a delightful memory of heroic liberations.\n\nThis is the face of Bruce Afton, a true dreamer among giants. He stands seductively among others, despite his brawny frame.\n\nThere\'s something ambiguous about him, perhaps it\'s a feeling of arogance or perhaps it\'s simply a feeling of indifference. But nonetheless, people tend to salute him in the streets, while befriending his friends to get closer to him.\n\nRed, perfectly groomed hair tight in a ponytail reveals a strong, lively face. Glistening amber eyes, set low within their sockets, watch vigorously over the homes they\'ve fought for for so long.\nA sword left a mark reaching from the left side of the forehead , first running towards thin lips and ending on his right cheekbone leaves a painful burden of a new life.\n\nThis is the face of Alen Dawnwing, a true hero among wood elves. He stands ordinary among others, despite his slim frame.\n\nThere\'s something charming about him, perhaps it\'s a feeling of guilt or perhaps it\'s simply his company. But nonetheless, people tend to befriend him, while trying to avoid him.\n\nRed, perfectly groomed hair tight in a ponytail reveals a strong, lively face. Glistening amber eyes, set low within their sockets, watch vigorously over the homes they\'ve fought for for so long.\nA sword left a mark reaching from the left side of the forehead , first running towards thin lips and ending on his right cheekbone leaves a painful burden of a new life.\n\nThis is the face of Alen Dawnwing, a true hero among wood elves. He stands ordinary among others, despite his slim frame.\n\nThere\'s something charming about him, perhaps it\'s a feeling of guilt or perhaps it\'s simply his company. But nonetheless, people tend to befriend him, while trying to avoid him.\n','13','5-2U0iQXVjHVqrKUAVOlE4-1.jpg','blank.jpg','5-2U0iQXVjHVqrKUAVOlE4-3.jpg',4),(86,'23',23,'5','2017-10-02','23','23','blank.jpg','5-ZEUmVvDn4NV0BXyq9PiV-2.jpg','5-ZEUmVvDn4NV0BXyq9PiV-3.jpg',4),(87,'123',123,'5','2017-10-02','123','123','5-jgdip48W5IO9hGJ0MGsA-1.jpg','5-jgdip48W5IO9hGJ0MGsA-2.jpg','5-jgdip48W5IO9hGJ0MGsA-3.jpg',4),(88,'Node JS',1000,'2015-01216-MN-0','2017-10-02','Node.js is an open-source, cross-platform JavaScript run-time environment for executing JavaScript code server-side. Historically, JavaScript was used primarily for client-side scripting, in which scripts written in JavaScript are embedded in a webpage\'s HTML, to be run client-side by a JavaScript engine in the user\'s web browser. Node.js enables JavaScript to be used for server-side scripting, and runs scripts server-side to produce dynamic web page content before the page is sent to the user\'s web browser. Consequently, Node.js has become one of the foundational elements of the \"JavaScript everywhere\" paradigm,[5] allowing web application development to unify around a single programming language, rather than rely on a different language for writing server side scripts.  Though .js is the conventional filename extension for JavaScript code, the name \"Node.js\" does not refer to a particular file in this context and is merely the name of the product. Node.js has an event-driven architecture capable of asynchronous I/O. These design choices aim to optimize throughput and scalability in Web applications with many input/output operations, as well as for real-time Web applications (e.g., real-time communication programs and browser games).[6]  The Node.js distributed development project, governed by the Node.js Foundation,[7] is facilitated by the Linux Foundation\'s Collaborative Projects program.[8]','node','2015-01216-MN-0-HnmIv231CYZC3cNZdvU8-1.jpg','2015-01216-MN-0-HnmIv231CYZC3cNZdvU8-2.jpg','2015-01216-MN-0-HnmIv231CYZC3cNZdvU8-3.jpg',1),(89,'MySQL',2300,'2015-01216-MN-0','2017-10-02','MySQL (officially pronounced as /maɪ ˌɛskjuːˈɛl/ \"My S-Q-L\",[6]) is an open-source relational database management system (RDBMS).[7] Its name is a combination of \"My\", the name of co-founder Michael Widenius\'s daughter,[8] and \"SQL\", the abbreviation for Structured Query Language. The MySQL development project has made its source code available under the terms of the GNU General Public License, as well as under a variety of proprietary agreements. MySQL was owned and sponsored by a single for-profit firm, the Swedish company MySQL AB, now owned by Oracle Corporation.[9] For proprietary use, several paid editions are available, and offer additional functionality.  MySQL is a central component of the LAMP open-source web application software stack (and other \"AMP\" stacks). LAMP is an acronym for \"Linux, Apache, MySQL, Perl/PHP/Python\". Applications that use the MySQL database include: TYPO3, MODx, Joomla, WordPress, phpBB, MyBB, and Drupal. MySQL is also used in many high-profile, large-scale websites, including Google[10][11] (though not for searches), Facebook,[12][13][14] Twitter,[15] Flickr,[16] and YouTube.[17]','sql','2015-01216-MN-0-IWDv1ikRc6f6Q07iqxHOD78RpxtCHGMhZi0QuZwI2Q2xMFVLwd-1.jpg','2015-01216-MN-0-IWDv1ikRc6f6Q07iqxHOD78RpxtCHGMhZi0QuZwI2Q2xMFVLwd-2.jpg','2015-01216-MN-0-IWDv1ikRc6f6Q07iqxHOD78RpxtCHGMhZi0QuZwI2Q2xMFVLwd-3.jpg',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltransaction`
--

INSERT INTO `tbltransaction` VALUES (1,47,'2014-01341-MN-0','2017-09-27','Finished','2017-10-02'),(2,46,'2014-01341-MN-0','2017-09-27','Finished','2017-09-27'),(3,48,'1','2017-09-27','Finished','2017-10-02'),(4,50,'2','2017-09-29','Finished','2017-09-29'),(5,51,'2','2017-09-29','Finished','2017-10-02'),(6,58,'1','2017-09-30','Finished','2017-10-02'),(10,57,'1','2017-10-01','Finished','2017-10-02'),(11,55,'1','2017-10-01','Finished','2017-10-02'),(12,87,'1','2017-10-02','Ongoing',NULL);

--
-- Table structure for table `tbluser`
--

DROP TABLE IF EXISTS `tbluser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbluser` (
  `strSNum` varchar(45) NOT NULL,
  `strName` varchar(45) NOT NULL,
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

INSERT INTO `tbluser` VALUES ('0','Zero User','0@gmail.com',NULL,'0','not verified',0,0,'normal'),('1','One User','1@gmail.com','1','1','verified',1,1,'normal'),('2','Two User','2@gmail.com',NULL,'2','verified',0,0,'normal'),('2014-01341-MN-0','xd x. dy','xd@yahoo.com','','xdxdxd','verified',0,0,'normal'),('2015-01216-MN-0','Jon Ervin B. Balmaceda','balmacedajonervin@gmail.com','09236835707','password','verified',0,0,'normal'),('2015-01341-MN-0','Vince Miguel D. Oreta','vincemiguel14@yahoo.com','09199754119','xdadmin','verified',0,0,'normal'),('3','Three User','3@gmail,com',NULL,'3','verified',0,0,'normal'),('4','4','4','4','4','unregistered',0,0,'normal'),('5','5','5','5','5','verified',0,0,'normal'),('Admin','Admin User','admin@gmail.com',NULL,'admin','verified',0,0,'admin');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
