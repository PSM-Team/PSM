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
-- Dumping data for table `tblanswers`
--

/*!40000 ALTER TABLE `tblanswers` DISABLE KEYS */;
INSERT INTO `tblanswers` VALUES (1,'2015-01216-MN-0',2),(2,'2015-01216-MN-0',33),(3,'2015-01216-MN-0',82),(4,'2015-01216-MN-0',63),(5,'2015-01216-MN-0',65),(6,'2015-01216-MN-0',6),(7,'2015-01216-MN-0',38),(8,'2015-01216-MN-0',69),(9,'2015-01216-MN-0',41),(10,'2015-01216-MN-0',95),(11,'2015-02839-MN-0',11),(12,'2015-02839-MN-0',14),(13,'2015-02839-MN-0',32),(14,'2015-02839-MN-0',46),(15,'2015-02839-MN-0',53),(16,'2015-02839-MN-0',41),(17,'2015-02839-MN-0',63),(18,'2015-02839-MN-0',74),(19,'2015-02839-MN-0',79),(20,'2015-02839-MN-0',90),(21,'2015-05757-MN-0',89),(22,'2015-05757-MN-0',73),(23,'2015-05757-MN-0',13),(24,'2015-05757-MN-0',25),(25,'2015-05757-MN-0',45),(26,'2015-05757-MN-0',72),(27,'2015-05757-MN-0',34),(28,'2015-05757-MN-0',30),(29,'2015-05757-MN-0',80),(30,'2015-05757-MN-0',58);
/*!40000 ALTER TABLE `tblanswers` ENABLE KEYS */;

--
-- Dumping data for table `tblcategories`
--

/*!40000 ALTER TABLE `tblcategories` DISABLE KEYS */;
INSERT INTO `tblcategories` VALUES (1,'Books'),(2,'School Supplies'),(3,'Food'),(4,'Misc.');
/*!40000 ALTER TABLE `tblcategories` ENABLE KEYS */;

--
-- Dumping data for table `tblchoices`
--

/*!40000 ALTER TABLE `tblchoices` DISABLE KEYS */;
INSERT INTO `tblchoices` VALUES (1,1,'Beside the gym',0),(2,1,'Freedom Park',1),(3,1,'Beside the Chapel',0),(4,1,'Inside the Field',0),(5,2,'5',0),(6,2,'4',1),(7,2,'3',0),(8,2,'6',0),(9,3,'Jose Rizal',0),(10,3,'Gregorio Del Pilar',0),(11,3,'Apolinario Mabini',1),(12,3,'Emilio Aguinaldo',0),(13,4,'A well known professor',0),(14,4,'The mascot of PUP',1),(15,4,'The president of PUP',0),(16,4,'A seller of cooked lunch',0),(17,5,'Beside the Library/NALLRC',1),(18,5,'Beside the main building',0),(19,5,'Inside the lagoon',0),(20,5,'In front of the chapel',0),(21,6,'SM Megamall',0),(22,6,'SM North',0),(23,6,'Market! Market!',0),(24,6,'SM Centerpoint',1),(25,7,'Fish, Egg With Apple',0),(26,7,'Footlong, Egg Wrap Around',1),(27,7,'Fried Espasol with Almond',0),(28,7,'Fried eggplant with Atsara',0),(29,8,'2',0),(30,8,'1',0),(31,8,'4',0),(32,8,'3',1),(33,9,'2',1),(34,9,'1',0),(35,9,'4',0),(36,9,'3',0),(37,10,'Polytechnic University of the Philippines',0),(38,10,'Philippine School of Commerce',1),(39,10,'Polytechnic College',0),(40,10,'Unibersidad de Politekniko',0),(41,11,'1904',1),(42,11,'1910',0),(43,11,'1907',0),(44,11,'1969',0),(45,12,'Sit on the floor',0),(46,12,'Get a chair from other classrooms',1),(47,12,'Just stand',0),(48,12,'Burn more chairs as a protest',0),(49,13,'Emmanuel Malto',0),(50,13,'Angelito Casasis',0),(51,13,'Ruben Madridejos',1),(52,13,'Albert dela Cruz',0),(53,14,'Emanuel de Guzman',1),(54,14,'Perry David Solosa',0),(55,14,'Dante Gueverra',0),(56,14,'Samuel Salvador',0),(57,15,'15',0),(58,15,'10',0),(59,15,'11',0),(60,15,'12',1),(61,16,'Oblation Run',0),(62,16,'Naked Run',0),(63,16,'Pylon Run',1),(64,16,'Fanservice Run',0),(65,17,'6',1),(66,17,'4',0),(67,17,'5',0),(68,17,'7',0),(69,18,'FEWA',1),(70,18,'ID Lace',0),(71,18,'School Supplies',0),(72,18,'Spaghetti',0),(73,19,'Park',0),(74,19,'Lagoon',1),(75,19,'Building',0),(76,19,'Fountain',0),(77,20,'Silog',0),(78,20,'Red Panda',0),(79,20,'Submarine',1),(80,20,'Kalog',0),(81,21,'Inside the main building',0),(82,21,'NALLRC building',1),(83,21,'Inside Charlie del Rosario',0),(84,21,'At the middle of the oval',0),(85,22,'1/3 of the class time',1),(86,22,'1/2 of the class time',0),(87,22,'1/4 of the class time',0),(88,22,'None of the choices',0),(89,23,'11:00 pm',0),(90,23,'9:00 pm',1),(91,23,'10:30 pm',0),(92,23,'8:00 pm',0),(93,24,'Outside PUP',0),(94,24,'1st floor',0),(95,24,'6th floor',1),(96,24,'3rd floor',0);
/*!40000 ALTER TABLE `tblchoices` ENABLE KEYS */;

--
-- Dumping data for table `tblitem`
--

/*!40000 ALTER TABLE `tblitem` DISABLE KEYS */;
INSERT INTO `tblitem` VALUES (1,'Dream Big',350.777,'2015-01216-MN-0','2017-10-05','Thirty six year old Vaibhav, the ever-smiling symbol of new age Indians, started his career as a driver. Today, he is the owner of a flourishing taxi service business and is scouting around to buy a Mercedes Benz…not on a loan but with the wealth he has amassed over the years!  How did he get from being a driver to a millionaire? Three simple secrets - he had the courage to dream big, learn about financial planning and implement what he learnt. Now, while you don\'t need anyone to help you to dream big, here is a book that will teach you everything that Vaibhav learnt. All you have to do is find the tenacity to implement it. Everything, from the importance of saving and investing and the need for life and health insurance to various investment products like mutual funds, SIP, PPF etc. that can enable you to build wealth, is explained in this book in simple and jargon free language. It helps you to choose instruments that are most suitable for you and explains why you would be better off without others. Dream B','dream','2015-01216-MN-0-pke89m9j6DNWXU6aa4N7xHTDRu2k1GVL5FBDJ5Tbia3KVNjkTH-1.jpg','2015-01216-MN-0-pke89m9j6DNWXU6aa4N7xHTDRu2k1GVL5FBDJ5Tbia3KVNjkTH-2.jpg','blank.jpg',1),(2,'Hamburger',60,'2015-02839-MN-0','2017-10-07','A hamburger or burger is a sandwich consisting of one or more cooked patties of ground meat, usually beef, placed inside a sliced bread roll or bun. The patty may be pan fried, barbecued, or flame broiled.','burger','2015-02839-MN-0-HNKY2Hc9991xIgotxnVWoADsmN1SPjqrDsl9CHpWJcLrucboID-1.jpg','blank.jpg','blank.jpg',3),(5,'Frixion',75,'2015-02839-MN-0','2017-10-08','Erasable Pen','frixion','2015-02839-MN-0-EziVOKgkR4LbVCymdVQP7bVIfe04bBH8Zpz0xoqv283XyAO2Ax-1.jpg','2015-02839-MN-0-EziVOKgkR4LbVCymdVQP7bVIfe04bBH8Zpz0xoqv283XyAO2Ax-2.jpg','2015-02839-MN-0-EziVOKgkR4LbVCymdVQP7bVIfe04bBH8Zpz0xoqv283XyAO2Ax-3.jpg',2);
/*!40000 ALTER TABLE `tblitem` ENABLE KEYS */;

--
-- Dumping data for table `tblquestions`
--

/*!40000 ALTER TABLE `tblquestions` DISABLE KEYS */;
INSERT INTO `tblquestions` VALUES (1,'Where is the Obelisk located at?',0),(2,'How many wings does the main building have?',0),(3,'Who is the national hero that has a \"tahanan\" in our Sintang Paaralan?',0),(4,'Who is Ted Pylon?',0),(5,'Where is the UFO/Watertank located at in PUP?',0),(6,'The favorite mall of students when there are no professors',0),(7,'What does \"FEWA\" mean?',0),(8,'How many basketball courts does PUP Sta. Mesa have?',0),(9,'How many 7/11 branches are there near PUP Sta. Mesa?',0),(10,'What is the first name of PUP?',0),(11,'What year did PUP officially become a university?',0),(12,'What would you do if there is a shortage of chairs in your room?',0),(13,'Who is the \"Einstein\" of PUP Sta. Mesa?',0),(14,'Who is the current president of PUP?',0),(15,'How many characters does the student number have (excluding dashes)?',0),(16,'What is the real name of the event \"Kikiam run\"?',0),(17,'How many floors does the PUP main building have?',0),(18,'What does \"Virgin\" sell?',0),(19,'Currently, what does \"Intramuros\" behold inside?',0),(20,'Other than the FEWA, what is the other famous food from PUP?',0),(21,'Where is the most presentable comfort room located at in PUP Sta. Mesa?',0),(22,'How long do you have to wait until you could safely assume that your professor is absent?',0),(23,'What is the latest end of classes in PUP?',0),(24,'When you were a freshie, how long did the line go during registration?',0);
/*!40000 ALTER TABLE `tblquestions` ENABLE KEYS */;

--
-- Dumping data for table `tblreport`
--

/*!40000 ALTER TABLE `tblreport` DISABLE KEYS */;
INSERT INTO `tblreport` VALUES (3,5,'2015-01216-MN-0'),(4,5,'2015-05757-MN-0');
/*!40000 ALTER TABLE `tblreport` ENABLE KEYS */;

--
-- Dumping data for table `tbltransaction`
--

/*!40000 ALTER TABLE `tbltransaction` DISABLE KEYS */;
INSERT INTO `tbltransaction` VALUES (1,1,'2015-02839-MN-0','2017-10-06','SFinished',NULL),(2,2,'2015-01216-MN-0','2017-10-07','BFinished',NULL);
/*!40000 ALTER TABLE `tbltransaction` ENABLE KEYS */;

--
-- Dumping data for table `tbluser`
--

/*!40000 ALTER TABLE `tbluser` DISABLE KEYS */;
INSERT INTO `tbluser` VALUES ('2015-01216-MN-0','Jon Ervin Balmaceda','balmacedajonervin@gmail.com','09236835707','pass','verified',0,1,'normal','2015-01216-MN-0-VdGyttE3Nw0pWghGBlLh4ib4k9AmsZIFEJuz1NCPh0XCeFnvgC-dp.jpg'),('2015-02839-MN-0','John Homer Cadena','homercadena@gmail.com','09237745678','pass','verified',1,1,'normal','blank.jpg'),('2015-05757-MN-0','John Carlo Doronila','doronilajc@gmail.com','09199754119','pass','not verified',0,0,'normal','2015-05757-MN-0-YzdiU30Ts8an7Bvbb4AOzME6tdgjjEcnf5sBMbk8ZO8xWEgcgo-dp.jpg'),('admin','Admin User','psm.sup.adm@gmail.com','psm.sup.adm@gmail.com','admin','admin',0,0,'admin',NULL);
/*!40000 ALTER TABLE `tbluser` ENABLE KEYS */;

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
