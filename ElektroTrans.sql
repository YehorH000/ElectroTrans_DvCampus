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
  `date_of_start` int(10) unsigned NOT NULL COMMENT 'Date of start work',
  `employe_name` varchar(40) NOT NULL COMMENT 'employe Name',
  `employe_surname` varchar(40) NOT NULL COMMENT 'employe Surname',
  `position_name` varchar(127) NOT NULL COMMENT 'employe position',
  `dob` date DEFAULT NULL COMMENT 'Date of Birth',
  `salary` int(10) NOT NULL COMMENT 'Employe ID',
  PRIMARY KEY (`employe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='employes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employes`
--

LOCK TABLES `employes` WRITE;
/*!40000 ALTER TABLE `employes` DISABLE KEYS */;
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
  `employe_id` int(10) unsigned NOT NULL COMMENT 'Empoye ID',
  `position_name` varchar(127) NOT NULL COMMENT 'Position Name',
  PRIMARY KEY (`position_id`),
  KEY `PURCHASED_ITEM_POSITION_NAME_POSITION_POSITION_NAME` (`employe_id`),
  CONSTRAINT `PURCHASED_ITEM_POSITION_NAME_POSITION_POSITION_NAME` FOREIGN KEY (`employe_id`) REFERENCES `employes` (`employe_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Position';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
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
  `employe_id` int(10) unsigned NOT NULL COMMENT 'Employe ID',
  `position_id` int(10) unsigned NOT NULL COMMENT 'Empoye ID',
  `position_name` varchar(127) NOT NULL COMMENT 'POSITION',
  `year` int(10) NOT NULL COMMENT 'Year`s salary',
  `month` int(10) NOT NULL COMMENT 'Month`s salary',
  `day` int(10) NOT NULL COMMENT 'Day`s salary',
  PRIMARY KEY (`salary_id`),
  KEY `PURCHASED_ITEM_SALARY_ID_SALARY_SALARY_ID` (`position_id`),
  KEY `PURCHASED_ITEM_SALARY_IDi_SALARY_SALARY_ID` (`employe_id`),
  CONSTRAINT `PURCHASED_ITEM_SALARY_ID_SALARY_SALARY_ID` FOREIGN KEY (`position_id`) REFERENCES `position` (`position_id`) ON DELETE CASCADE,
  CONSTRAINT `PURCHASED_ITEM_SALARY_IDi_SALARY_SALARY_ID` FOREIGN KEY (`employe_id`) REFERENCES `employes` (`employe_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salary';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
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
  `data` date NOT NULL COMMENT 'Data',
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
  `nomer` int(10) NOT NULL COMMENT 'Nomer of transport',
  PRIMARY KEY (`transport_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Transport';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport`
--

LOCK TABLES `transport` WRITE;
/*!40000 ALTER TABLE `transport` DISABLE KEYS */;
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

-- Dump completed on 2019-11-30 20:10:57
