-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: dbhyf
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `tablelessondetails`
--

DROP TABLE IF EXISTS `tablelessondetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tablelessondetails` (
  `lessonDetailsId` int(11) NOT NULL AUTO_INCREMENT,
  `lessonId` int(11) DEFAULT NULL,
  `lessonStudentId` int(11) DEFAULT NULL,
  `lessonAttended` tinyint(1) DEFAULT NULL,
  `lessonAssignment` varchar(100) DEFAULT NULL,
  `lessonFeedback` text,
  PRIMARY KEY (`lessonDetailsId`),
  KEY `lessonId` (`lessonId`,`lessonStudentId`),
  KEY `lessonStudentId` (`lessonStudentId`),
  CONSTRAINT `tablelessondetails_ibfk_1` FOREIGN KEY (`lessonId`) REFERENCES `tablelessons` (`lessonId`),
  CONSTRAINT `tablelessondetails_ibfk_2` FOREIGN KEY (`lessonStudentId`) REFERENCES `tableusers` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablelessondetails`
--

LOCK TABLES `tablelessondetails` WRITE;
/*!40000 ALTER TABLE `tablelessondetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `tablelessondetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tablelessons`
--

DROP TABLE IF EXISTS `tablelessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tablelessons` (
  `lessonId` int(11) NOT NULL AUTO_INCREMENT,
  `lessonDate` date NOT NULL,
  `lessonClass` varchar(30) NOT NULL,
  `lessonLocation` varchar(30) DEFAULT NULL,
  `lessonModule` smallint(6) NOT NULL,
  `lessonMentor1` smallint(6) NOT NULL,
  `lessonMentor2` smallint(6) DEFAULT NULL,
  `lessonMentor3` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`lessonId`),
  KEY `lessonModule` (`lessonModule`),
  CONSTRAINT `tablelessons_ibfk_1` FOREIGN KEY (`lessonModule`) REFERENCES `tablemodules` (`moduleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablelessons`
--

LOCK TABLES `tablelessons` WRITE;
/*!40000 ALTER TABLE `tablelessons` DISABLE KEYS */;
/*!40000 ALTER TABLE `tablelessons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tablemodules`
--

DROP TABLE IF EXISTS `tablemodules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tablemodules` (
  `moduleId` smallint(6) NOT NULL AUTO_INCREMENT,
  `moduleName` varchar(30) NOT NULL,
  `moduleMentor1` smallint(6) DEFAULT NULL,
  `moduleMentor2` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`moduleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablemodules`
--

LOCK TABLES `tablemodules` WRITE;
/*!40000 ALTER TABLE `tablemodules` DISABLE KEYS */;
/*!40000 ALTER TABLE `tablemodules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tableusers`
--

DROP TABLE IF EXISTS `tableusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tableusers` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userFirstName` varchar(30) NOT NULL,
  `userLastName` varchar(30) DEFAULT NULL,
  `userAddress` varchar(30) DEFAULT NULL,
  `userRegisterDate` date DEFAULT NULL,
  `userEmail` varchar(30) NOT NULL,
  `userMobile` varchar(30) DEFAULT NULL,
  `userActive` tinyint(1) DEFAULT NULL,
  `userRole` varchar(30) NOT NULL,
  `userClass` varchar(30) DEFAULT NULL,
  `userPhoto` longblob,
  `userPassword` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tableusers`
--

LOCK TABLES `tableusers` WRITE;
/*!40000 ALTER TABLE `tableusers` DISABLE KEYS */;
INSERT INTO `tableusers` VALUES (1,'Yonas','BW','Rot','2016-11-09','yoni11er@gmail.com','0682379012',1,'Student','4',NULL,'123'),(2,'Wael','HS','Mas','2016-11-05','wael@gmail.com','0682546671',1,'Student','5',NULL,'jahsiua'),(3,'Maartje','m','Ams','2016-11-06','maartje@yahoo.com','068772110',1,'Admin','HYF',NULL,'12377hfhf'),(4,'Daan','hhk','Ams','2016-11-08','daanarts@gmail.com','0689922616',1,'Mentor','HYF',NULL,'jd12344');
/*!40000 ALTER TABLE `tableusers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-09 13:51:31
