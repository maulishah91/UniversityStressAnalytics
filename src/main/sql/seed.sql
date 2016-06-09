-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: stressAnalytics
-- ------------------------------------------------------
-- Server version	5.5.49-0ubuntu0.14.04.1

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
-- Current Database: `stressAnalytics`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `stressAnalytics` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `stressAnalytics`;

--
-- Table structure for table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription` (
  `email` varchar(200) DEFAULT NULL,
  `twitter_handle` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription`
--

LOCK TABLES `subscription` WRITE;
/*!40000 ALTER TABLE `subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `universityScore`
--

DROP TABLE IF EXISTS `universityScore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `universityScore` (
  `university` varchar(200) DEFAULT NULL,
  `score` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `universityScore`
--

LOCK TABLES `universityScore` WRITE;
/*!40000 ALTER TABLE `universityScore` DISABLE KEYS */;
INSERT INTO `universityScore` VALUES ('UCLA',10),('USC',35),('Harvard',67),('Stanford',440),('Yale',5),('CMU',76),('UCI',55),('NCSU',40),('UCSB',350),('TAMU',79);
/*!40000 ALTER TABLE `universityScore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `universityStateMapping`
--

DROP TABLE IF EXISTS `universityStateMapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `universityStateMapping` (
  `university` varchar(200) DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `universityStateMapping`
--

LOCK TABLES `universityStateMapping` WRITE;
/*!40000 ALTER TABLE `universityStateMapping` DISABLE KEYS */;
INSERT INTO `universityStateMapping` VALUES ('UCLA','CA'),('USC','CA'),('TAMU','TX'),('UCI','CA'),('NCSU','NC');
/*!40000 ALTER TABLE `universityStateMapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wordCloud`
--

DROP TABLE IF EXISTS `wordCloud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wordCloud` (
  `tagName` varchar(200) DEFAULT NULL,
  `word` varchar(200) DEFAULT NULL,
  `size` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wordCloud`
--

LOCK TABLES `wordCloud` WRITE;
/*!40000 ALTER TABLE `wordCloud` DISABLE KEYS */;
INSERT INTO `wordCloud` VALUES ('ucla','Bruins',50),('ucla','Pauley Pavilion',30),('ucla','Exams',70),('ucla','Powell',40),('ucla','BruinWalk',40),('ucla','Henry Samueli',10),('ucla','Ronald Reagan',40);
/*!40000 ALTER TABLE `wordCloud` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-08 23:54:42
