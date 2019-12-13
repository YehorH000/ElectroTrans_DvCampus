-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: ElektroTrans
-- ------------------------------------------------------
-- Server version	5.7.27

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
-- Table structure for table `employes`
--

DROP TABLE IF EXISTS `employes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employes` (
  `employe_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Employe ID',
  `position_id` int(10) unsigned NOT NULL COMMENT 'Position ID',
  `date_of_start` date NOT NULL COMMENT 'date of start',
  `employe_name` varchar(40) NOT NULL COMMENT 'employe Name',
  `employe_surname` varchar(40) NOT NULL COMMENT 'employe Surname',
  `dob` date DEFAULT NULL COMMENT 'Date of Birth',
  `salary` int(10) NOT NULL COMMENT 'Employe ID',
  PRIMARY KEY (`employe_id`),
  KEY `PURCHASED_ITEM_POSITION_ID_POSITION_ID` (`position_id`),
  CONSTRAINT `PURCHASED_ITEM_POSITION_ID_POSITION_ID` FOREIGN KEY (`position_id`) REFERENCES `position` (`position_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='employes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employes`
--

LOCK TABLES `employes` WRITE;
/*!40000 ALTER TABLE `employes` DISABLE KEYS */;
INSERT INTO `employes` VALUES (1,1,'2000-05-18','Ivan','Ivanov','1980-10-10',1000),(2,1,'2000-02-18','Peter','Petrov','1980-10-10',1000),(3,1,'2000-09-08','Nicholas','Peters','1980-10-10',1000),(4,2,'2000-11-18','Damian','McLaughlin','1980-10-10',2000),(5,2,'2000-03-18','Basil','Dixon','1980-10-10',1000),(6,2,'2000-06-18','Neal','Wilkins','1980-10-10',2040),(7,3,'2000-11-28','Mark','Byrd','1980-10-10',4562),(8,4,'2000-10-18','Ethan','Atkins','1980-10-10',2558),(9,3,'2000-09-18','Thomas','Ivanov','1980-10-10',4288),(10,5,'2000-01-18','Peter','Harrison','1980-10-10',45245);
/*!40000 ALTER TABLE `employes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position` (
  `position_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Position ID',
  `position_name` varchar(127) NOT NULL COMMENT 'Position Name',
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='Position';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'driver'),(2,'driver'),(3,'driver'),(4,'konductor'),(5,'konductor'),(6,'konductor'),(7,'manager'),(8,'manager'),(9,'cleaner'),(10,'director');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salary` (
  `salary_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Salary ID',
  `date` date NOT NULL COMMENT 'date',
  `employe_id` int(10) unsigned NOT NULL COMMENT 'Employe ID',
  `position_id` int(10) unsigned NOT NULL COMMENT 'Empoye ID',
  PRIMARY KEY (`salary_id`),
  KEY `PURCHASED_ITEM_SALARY_ID_SALARY_SALARY_ID` (`position_id`),
  KEY `PURCHASED_ITEM_SALARY_IDi_SALARY_SALARY_ID` (`employe_id`),
  CONSTRAINT `PURCHASED_ITEM_SALARY_ID_SALARY_SALARY_ID` FOREIGN KEY (`position_id`) REFERENCES `position` (`position_id`) ON DELETE CASCADE,
  CONSTRAINT `PURCHASED_ITEM_SALARY_IDi_SALARY_SALARY_ID` FOREIGN KEY (`employe_id`) REFERENCES `employes` (`employe_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Salary';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
INSERT INTO `salary` VALUES (7,'2019-10-10',1,1),(8,'2018-10-02',3,1),(9,'2017-02-08',4,2);
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trans_for_employe`
--

DROP TABLE IF EXISTS `trans_for_employe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trans_for_employe` (
  `employe_id` int(10) unsigned NOT NULL,
  `transport_id` int(10) unsigned NOT NULL,
  `deily_earnings` int(10) NOT NULL COMMENT 'Deily Earnings',
  `date` date NOT NULL,
  KEY `PURCHASED_ITEM_TAG_PIID_PURCHASED_ITEM_PURCHASED_ITEM_ID` (`employe_id`),
  KEY `PURCHASED_ITEM_TAG_TAG_ID_TAG_TAG_ID` (`transport_id`),
  CONSTRAINT `PURCHASED_ITEM_TAG_PIID_PURCHASED_ITEM_PURCHASED_ITEM_ID` FOREIGN KEY (`employe_id`) REFERENCES `employes` (`employe_id`) ON DELETE CASCADE,
  CONSTRAINT `PURCHASED_ITEM_TAG_TAG_ID_TAG_TAG_ID` FOREIGN KEY (`transport_id`) REFERENCES `transport` (`transport_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Purchased Item Tags';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trans_for_employe`
--

LOCK TABLES `trans_for_employe` WRITE;
/*!40000 ALTER TABLE `trans_for_employe` DISABLE KEYS */;
INSERT INTO `trans_for_employe` VALUES (1,1,1000,'2019-10-10'),(2,2,2000,'2018-10-02'),(3,3,3000,'2017-02-08'),(4,2,1500,'2019-10-10'),(4,2,2000,'2018-10-02'),(4,2,3000,'2017-02-08'),(5,3,4500,'2019-10-10'),(5,3,6000,'2018-10-02'),(5,3,8000,'2017-02-08');
/*!40000 ALTER TABLE `trans_for_employe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transport`
--

DROP TABLE IF EXISTS `transport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transport` (
  `transport_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Transport ID',
  `transport_name` varchar(127) NOT NULL COMMENT 'Transport Name',
  `number` int(10) NOT NULL,
  PRIMARY KEY (`transport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Transport';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport`
--

LOCK TABLES `transport` WRITE;
/*!40000 ALTER TABLE `transport` DISABLE KEYS */;
INSERT INTO `transport` VALUES (1,'bus',1111),(2,'bus',2222),(3,'bus',3333);
/*!40000 ALTER TABLE `transport` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-13 17:07:47
