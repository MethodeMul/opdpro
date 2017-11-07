CREATE DATABASE  IF NOT EXISTS `msf` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `msf`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: msf
-- ------------------------------------------------------
-- Server version	5.5.10

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
-- Temporary table structure for view `bed_status`
--

DROP TABLE IF EXISTS `bed_status`;
/*!50001 DROP VIEW IF EXISTS `bed_status`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `bed_status` (
  `location_id` tinyint NOT NULL,
  `tent` tinyint NOT NULL,
  `bed` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `last_update` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `concept_dic`
--

DROP TABLE IF EXISTS `concept_dic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_dic` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`type`,`code`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_dic`
--

LOCK TABLES `concept_dic` WRITE;
/*!40000 ALTER TABLE `concept_dic` DISABLE KEYS */;
INSERT INTO `concept_dic` VALUES (1,'symptom','1','headache'),(2,'symptom','2','fever'),(3,'symptom','3','nausea/vomiting'),(4,'symptom','4','diarrhea'),(5,'symptom','5','weakness'),(6,'symptom','6','hiccup'),(7,'symptom','7','body pain'),(8,'symptom','8','abdominal pain'),(9,'symptom','9','respiratory disorder'),(10,'symptom','10','dehydratation'),(11,'symptom','11','red eye'),(12,'symptom','12','hemorragic symptoms'),(13,'general','1','conscious'),(14,'general','2','confused/agitated'),(15,'general','3','unconscious'),(16,'general','4','deceased'),(17,'status','1','walking'),(18,'status','2','bedridden'),(19,'status','3','terminal'),(20,'pain','1','-'),(21,'pain','2','+ PCM'),(22,'pain','3','++ tramadol'),(23,'pain','4','+++ morphine'),(24,'intake','1','normal food'),(25,'intake','2','normal food with support'),(26,'intake','3','liquid only'),(27,'intake','4','liquid only with support'),(28,'intake','5','IV treatment'),(29,'drug','1','prometazine'),(30,'drug','2','metoclopramide'),(31,'drug','3','loperamide'),(32,'drug','4','vit A, B, C'),(33,'drug','5','chlorpromazine'),(34,'outcome','1','cured'),(35,'outcome','2','escaped'),(36,'outcome','3','dead'),(37,'test','1','negative'),(38,'test','2','positive'),(39,'test','3','inconclusive'),(40,'tent','8','C1'),(41,'tent','2','C2'),(42,'tent','3','C3'),(43,'tent','4','C4'),(50,'intake','6','none'),(51,'intake','10','with support'),(52,'tent','11','C9');
/*!40000 ALTER TABLE `concept_dic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `last_patient_status`
--

DROP TABLE IF EXISTS `last_patient_status`;
/*!50001 DROP VIEW IF EXISTS `last_patient_status`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `last_patient_status` (
  `status_id` tinyint NOT NULL,
  `patient_id` tinyint NOT NULL,
  `location_id` tinyint NOT NULL,
  `general` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `pain` tinyint NOT NULL,
  `intake` tinyint NOT NULL,
  `lab_request` tinyint NOT NULL,
  `last_visit` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `last_testresult`
--

DROP TABLE IF EXISTS `last_testresult`;
/*!50001 DROP VIEW IF EXISTS `last_testresult`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `last_testresult` (
  `id` tinyint NOT NULL,
  `patient_id` tinyint NOT NULL,
  `test_date` tinyint NOT NULL,
  `result` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `last_zetesdc_msf`
--

DROP TABLE IF EXISTS `last_zetesdc_msf`;
/*!50001 DROP VIEW IF EXISTS `last_zetesdc_msf`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `last_zetesdc_msf` (
  `DateTime` tinyint NOT NULL,
  `DeviceID` tinyint NOT NULL,
  `Version` tinyint NOT NULL,
  `OperatorID` tinyint NOT NULL,
  `PatientID` tinyint NOT NULL,
  `PatientID_Input` tinyint NOT NULL,
  `BedLocationID` tinyint NOT NULL,
  `BedlocationID_Input` tinyint NOT NULL,
  `DC_General` tinyint NOT NULL,
  `DC_Status` tinyint NOT NULL,
  `DC_Pain` tinyint NOT NULL,
  `DC_Intake` tinyint NOT NULL,
  `DC_Symptomatology1` tinyint NOT NULL,
  `DC_Symptomatology2` tinyint NOT NULL,
  `DC_ExtraDrugs` tinyint NOT NULL,
  `DC_Laboratory` tinyint NOT NULL,
  `DC_BedStatus` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `location_status`
--

DROP TABLE IF EXISTS `location_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_status` (
  `location_id` int(4) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `cleaning` tinyint(1) NOT NULL DEFAULT '0',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`location_id`),
  KEY `location_id` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_status`
--

LOCK TABLES `location_status` WRITE;
/*!40000 ALTER TABLE `location_status` DISABLE KEYS */;
INSERT INTO `location_status` VALUES (201,0,1,'2014-10-16 08:36:45'),(202,1,0,'2014-10-15 12:31:24'),(203,1,0,'2014-10-15 12:31:24'),(204,1,0,'2014-10-22 21:01:43'),(205,1,0,'2014-10-15 12:31:24'),(206,0,0,'2014-10-22 21:01:43'),(207,1,0,'2014-10-15 12:31:24'),(208,1,0,'2014-10-15 12:31:24'),(209,1,1,'2014-10-15 12:31:24'),(210,1,0,'2014-10-15 12:31:24'),(211,1,0,'2014-10-15 12:31:24'),(212,1,0,'2014-10-15 12:31:24'),(213,1,0,'2014-10-15 12:31:25'),(214,1,0,'2014-10-15 12:31:25'),(215,1,0,'2014-10-15 12:31:25'),(216,1,0,'2014-10-15 12:31:25'),(217,1,0,'2014-10-15 12:31:25'),(218,1,0,'2014-10-15 12:31:25'),(219,1,0,'2014-10-15 12:31:25'),(220,1,0,'2014-10-15 12:31:25'),(221,1,0,'2014-10-15 12:31:25'),(222,1,0,'2014-10-15 12:31:25'),(223,1,0,'2014-10-15 12:31:25'),(224,1,0,'2014-10-15 12:31:25'),(225,1,0,'2014-10-15 12:31:25'),(226,1,0,'2014-10-15 12:31:25'),(227,1,0,'2014-10-15 12:31:25'),(228,1,0,'2014-10-15 12:31:25'),(229,1,0,'2014-10-21 12:14:21'),(230,1,0,'2014-10-15 12:31:25'),(301,1,0,'2014-10-15 12:31:25'),(302,0,0,'2014-10-15 12:31:25'),(303,1,0,'2014-10-15 12:31:25'),(304,1,0,'2014-10-15 12:31:25'),(305,1,0,'2014-10-15 12:31:25'),(306,1,0,'2014-10-15 12:31:25'),(307,1,1,'2014-10-22 06:38:22'),(308,1,0,'2014-10-15 12:31:25'),(309,1,0,'2014-10-15 12:31:25'),(310,1,0,'2014-10-15 12:31:25'),(311,1,0,'2014-10-15 12:31:25'),(312,1,0,'2014-10-15 12:31:25'),(313,1,0,'2014-10-15 12:31:25'),(314,1,0,'2014-10-15 12:31:25'),(315,1,0,'2014-10-15 12:31:26'),(316,1,0,'2014-10-27 15:14:56'),(317,1,0,'2014-10-27 15:14:56'),(318,1,0,'2014-10-27 15:14:56'),(319,1,0,'2014-10-27 15:14:56'),(320,1,0,'2014-10-27 15:14:57'),(321,1,0,'2014-10-27 15:14:57'),(322,1,0,'2014-10-27 15:14:57'),(323,1,0,'2014-10-27 15:14:57'),(324,1,0,'2014-10-27 15:14:57'),(325,1,0,'2014-10-27 15:14:57'),(326,1,0,'2014-10-27 15:14:57'),(327,1,0,'2014-10-27 15:14:57'),(328,1,0,'2014-10-27 15:14:57'),(329,1,0,'2014-10-27 15:14:57'),(330,1,0,'2014-10-27 15:14:57'),(401,1,0,'2014-10-15 12:31:26'),(402,1,0,'2014-10-15 12:31:26'),(403,1,0,'2014-10-15 12:31:26'),(404,0,0,'2014-10-22 21:03:58'),(405,1,0,'2014-10-15 12:31:26'),(406,1,0,'2014-10-15 12:31:26'),(407,1,0,'2014-10-15 12:31:26'),(408,1,0,'2014-10-15 12:31:26'),(409,1,0,'2014-10-15 12:31:26'),(410,1,0,'2014-10-15 12:31:26'),(411,1,0,'2014-10-15 12:31:26'),(412,1,0,'2014-10-15 12:31:26'),(413,1,0,'2014-10-15 12:31:26'),(414,1,0,'2014-10-15 12:31:26'),(415,1,0,'2014-10-15 12:31:26'),(416,1,0,'2017-03-10 14:50:58'),(417,1,0,'2017-03-10 14:50:58'),(418,1,0,'2017-03-10 14:50:58'),(419,1,0,'2017-03-10 14:50:58'),(420,1,0,'2017-03-10 14:50:58'),(801,1,1,'2014-10-15 12:31:23'),(802,1,1,'2014-10-21 14:37:57'),(803,1,1,'2014-10-22 12:30:59'),(804,1,0,'2014-10-22 06:34:24'),(805,1,0,'2014-10-21 14:48:50'),(806,1,1,'2014-10-22 06:37:56'),(807,1,0,'2014-10-15 12:31:23'),(808,0,0,'2014-10-23 12:02:26'),(809,1,0,'2014-10-15 12:31:23'),(810,1,0,'2014-10-22 06:42:15'),(1101,1,0,'2015-04-08 18:11:04'),(1102,1,1,'2015-04-07 21:12:08'),(1103,0,0,'2015-04-08 18:05:27'),(1104,1,1,'2015-04-07 21:07:41'),(1105,1,0,'2015-04-08 17:01:08'),(1106,1,0,'2014-10-23 08:46:30'),(1107,0,0,'2015-04-08 18:11:04'),(1108,1,0,'2015-04-07 21:13:37'),(1109,1,0,'2014-10-23 08:46:30'),(1110,1,0,'2014-10-23 08:46:30'),(1111,1,0,'2014-10-23 08:46:30'),(1112,1,0,'2014-10-23 08:46:30'),(1113,1,0,'2014-10-23 08:46:30'),(1114,0,1,'2014-10-23 10:12:47'),(1115,1,0,'2014-10-23 08:46:30'),(1116,1,0,'2014-10-23 08:46:30'),(1117,1,0,'2014-10-23 08:46:30'),(1118,1,0,'2014-10-23 08:46:30'),(1119,1,0,'2014-10-23 08:46:30'),(1120,1,0,'2014-10-23 09:15:40'),(1121,1,0,'2014-10-23 08:46:30'),(1122,1,0,'2014-10-23 12:18:56'),(1123,1,0,'2014-10-23 08:46:30'),(1124,1,0,'2014-10-23 08:46:30'),(1125,1,0,'2014-10-23 08:46:30'),(1126,1,0,'2014-10-23 08:46:30'),(1127,1,0,'2014-10-23 08:46:30'),(1128,1,0,'2014-10-23 08:46:30'),(1129,1,0,'2014-10-23 08:46:30'),(1130,1,0,'2014-10-23 08:46:30');
/*!40000 ALTER TABLE `location_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `location_watsan_info`
--

DROP TABLE IF EXISTS `location_watsan_info`;
/*!50001 DROP VIEW IF EXISTS `location_watsan_info`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `location_watsan_info` (
  `location_id` tinyint NOT NULL,
  `tent` tinyint NOT NULL,
  `bed` tinyint NOT NULL,
  `patient_id` tinyint NOT NULL,
  `surname` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `last_update` tinyint NOT NULL,
  `status` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `loginuser`
--

DROP TABLE IF EXISTS `loginuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loginuser` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `dateCreation` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='store the users allowed to connect to the database';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginuser`
--

LOCK TABLES `loginuser` WRITE;
/*!40000 ALTER TABLE `loginuser` DISABLE KEYS */;
INSERT INTO `loginuser` VALUES (2,'msfuser','2cabaf754fa7b15f44ae77c16fea1dbbbb18ab1e','Main user','2015-04-03 22:51:46');
/*!40000 ALTER TABLE `loginuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `overview`
--

DROP TABLE IF EXISTS `overview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `overview` (
  `tent` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `bed` int(5) unsigned NOT NULL,
  `patient_id` int(11) unsigned NOT NULL,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `age` int(5) unsigned NOT NULL,
  `condtn` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `walking` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pain` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nausea` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `reflux` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fever` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `water` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ORS` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sheet` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `eating` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `liquid` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `cleaning` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `overview`
--

LOCK TABLES `overview` WRITE;
/*!40000 ALTER TABLE `overview` DISABLE KEYS */;
INSERT INTO `overview` VALUES ('A',32,11111146,'Mia',37,'normal',0,1,0,0,'< 37.5',1,0,1,1,'blood',1),('A',1,11122361,'Pepe',34,'normal',1,0,1,0,'>= 37.5  < 38.5',0,0,1,1,' ',0),('A',5,25364723,'Laura',25,'unresponsive',0,1,1,1,'>= 38.5',0,1,0,0,'stool',1),('B',10,26374711,'Peter',78,'dead',0,1,0,0,'',0,0,0,0,' ',0),('B',7,37485977,'Maria',23,'normal',1,1,1,1,'>= 38.5',0,0,1,0,'vomit',1),('A',23,46758655,'Marc',45,'dead',0,0,0,0,'',0,0,0,0,' ',0);
/*!40000 ALTER TABLE `overview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_drugs`
--

DROP TABLE IF EXISTS `patient_drugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_drugs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status_id` int(11) unsigned NOT NULL,
  `drug_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `patient_id` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_drugs`
--

LOCK TABLES `patient_drugs` WRITE;
/*!40000 ALTER TABLE `patient_drugs` DISABLE KEYS */;
INSERT INTO `patient_drugs` VALUES (1,4,'3'),(3,1,'1'),(4,2,'2'),(7,3,'4'),(8,6,'1'),(9,7,'1'),(10,8,'1'),(11,9,'1'),(12,9,'2'),(17,11,'1'),(18,11,'2'),(19,15,'1'),(20,16,'1'),(21,18,'2'),(22,18,'3'),(23,19,'5'),(24,20,'1'),(25,20,'2'),(26,21,'2'),(27,21,'3'),(28,22,'3'),(29,23,'3'),(30,24,'3'),(31,30,'3'),(32,31,'3'),(33,31,'4'),(40,35,'3'),(41,35,'4'),(42,36,'3'),(43,36,'4'),(44,37,'3'),(45,37,'4'),(46,38,'3'),(47,38,'4'),(48,39,'1'),(49,40,'1'),(50,42,'2'),(51,42,'3'),(52,43,'2'),(53,43,'3'),(54,45,'1'),(55,45,'3'),(56,46,'1'),(57,48,'1'),(58,48,'5'),(59,50,'2'),(60,50,'4'),(61,51,'2'),(62,51,'4'),(63,52,'3'),(64,53,'1'),(65,53,'2'),(66,53,'3'),(67,54,'1'),(68,55,'1'),(69,55,'2'),(70,55,'3'),(71,56,'1'),(72,56,'2'),(73,56,'3'),(74,57,'1'),(75,57,'3'),(76,58,'1'),(77,58,'2'),(78,58,'3'),(79,59,'1'),(80,59,'2'),(81,59,'3'),(82,62,'1'),(83,63,'1'),(84,65,'3'),(85,65,'4'),(86,67,'1'),(87,67,'2'),(88,67,'3'),(89,68,'1'),(90,69,'3'),(91,70,'1'),(92,71,'1'),(93,71,'2'),(94,72,'1'),(95,72,'2'),(96,73,'1'),(97,73,'2'),(98,75,'1'),(99,75,'2');
/*!40000 ALTER TABLE `patient_drugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_emr`
--

DROP TABLE IF EXISTS `patient_emr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_emr` (
  `patient_id` int(11) unsigned NOT NULL,
  `moh_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `surname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `age` int(3) unsigned NOT NULL,
  `sex` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adm_date` date NOT NULL,
  `sym_date` date NOT NULL,
  `datecr` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`patient_id`),
  UNIQUE KEY `patient_id_copy1_UNIQUE` (`moh_id`),
  KEY `patient_id` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_emr`
--

LOCK TABLES `patient_emr` WRITE;
/*!40000 ALTER TABLE `patient_emr` DISABLE KEYS */;
INSERT INTO `patient_emr` VALUES (11111146,'LIBELWA348576','Angela','Channing',12,'f','2014-10-19','2014-10-09','2014-10-03 16:09:00'),(11122361,NULL,'John','Kane',25,'m','2014-10-07','2014-10-06','2014-10-07 14:08:06'),(11133374,'LIBXXH6758','Anna','Graham',32,'f','2014-10-26','2014-10-14','2014-10-26 15:43:59'),(12312633,NULL,'Sylvie','Hocke',30,'f','2014-10-23','2014-10-21','2014-10-23 10:37:15'),(12313441,NULL,'Anna','Kendrick',26,'m','2014-10-07','2014-10-07','2014-10-08 12:22:58'),(12314249,NULL,'Wim','Deneweth',23,'m','2015-09-15','2014-10-21','2014-10-23 08:49:17'),(12348908,NULL,'Toni','Kross',34,'m','2014-10-22','2014-10-21','2014-10-22 20:19:37'),(23456721,NULL,'Patrice','Lumumba',33,'m','2014-10-16','2014-10-14','2014-10-16 10:18:36'),(34567867,NULL,'Estefania','Gomez',27,'f','2014-10-19','2014-10-18','2014-10-19 17:24:24'),(43345357,NULL,'Lola','Van Damme',60,'f','2014-10-08','2014-10-09','2014-10-08 12:08:19'),(45678916,NULL,'Rafa','Nadal',42,'m','2014-10-26','2014-10-17','2014-10-19 17:28:36'),(55555536,NULL,'Peter','Sellers',37,'m','2014-10-16','2014-10-14','2014-10-16 07:15:26'),(77777731,'LIBELWA312345','Felix','Neuman',51,'m','2014-10-26','2014-10-15','2014-10-21 14:30:43');
/*!40000 ALTER TABLE `patient_emr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `patient_full_emr`
--

DROP TABLE IF EXISTS `patient_full_emr`;
/*!50001 DROP VIEW IF EXISTS `patient_full_emr`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `patient_full_emr` (
  `tent` tinyint NOT NULL,
  `bed` tinyint NOT NULL,
  `patient_id` tinyint NOT NULL,
  `moh_id` tinyint NOT NULL,
  `surname` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `age` tinyint NOT NULL,
  `sex` tinyint NOT NULL,
  `adm_date` tinyint NOT NULL,
  `sym_date` tinyint NOT NULL,
  `general` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `pain` tinyint NOT NULL,
  `intake` tinyint NOT NULL,
  `symptoms` tinyint NOT NULL,
  `extra_drugs` tinyint NOT NULL,
  `lab_test` tinyint NOT NULL,
  `last_visit` tinyint NOT NULL,
  `test_1_date` tinyint NOT NULL,
  `test_2_date` tinyint NOT NULL,
  `test_n-1_date` tinyint NOT NULL,
  `test_n_date` tinyint NOT NULL,
  `test_1_result` tinyint NOT NULL,
  `test_2_result` tinyint NOT NULL,
  `test_n-1_result` tinyint NOT NULL,
  `test_n_result` tinyint NOT NULL,
  `outcome` tinyint NOT NULL,
  `exit_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `patient_history`
--

DROP TABLE IF EXISTS `patient_history`;
/*!50001 DROP VIEW IF EXISTS `patient_history`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `patient_history` (
  `patient_id` tinyint NOT NULL,
  `tent` tinyint NOT NULL,
  `bed` tinyint NOT NULL,
  `general` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `pain` tinyint NOT NULL,
  `intake` tinyint NOT NULL,
  `symptoms` tinyint NOT NULL,
  `extra_drugs` tinyint NOT NULL,
  `lab_test` tinyint NOT NULL,
  `update_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `patient_history_asc`
--

DROP TABLE IF EXISTS `patient_history_asc`;
/*!50001 DROP VIEW IF EXISTS `patient_history_asc`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `patient_history_asc` (
  `patient_id` tinyint NOT NULL,
  `tent` tinyint NOT NULL,
  `bed` tinyint NOT NULL,
  `general` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `pain` tinyint NOT NULL,
  `intake` tinyint NOT NULL,
  `symptoms` tinyint NOT NULL,
  `extra_drugs` tinyint NOT NULL,
  `lab_test` tinyint NOT NULL,
  `update_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `patient_labtest`
--

DROP TABLE IF EXISTS `patient_labtest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_labtest` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) unsigned NOT NULL,
  `test_date` date NOT NULL,
  `result` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `patient_id` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_labtest`
--

LOCK TABLES `patient_labtest` WRITE;
/*!40000 ALTER TABLE `patient_labtest` DISABLE KEYS */;
INSERT INTO `patient_labtest` VALUES (1,11111146,'2014-10-01','2'),(2,11111146,'2014-10-02','1'),(3,11111146,'2014-10-03','2'),(4,11111146,'2014-10-04','2'),(5,23456721,'2014-10-04','2'),(6,11111146,'2014-10-14','1'),(7,55555536,'2014-10-15','2'),(10,12348908,'2014-10-16','2'),(13,77777731,'2014-10-19','2'),(14,77777731,'2014-10-20','2'),(15,77777731,'2014-10-21','3'),(18,34567867,'2014-10-20','1');
/*!40000 ALTER TABLE `patient_labtest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_outcome`
--

DROP TABLE IF EXISTS `patient_outcome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_outcome` (
  `patient_id` int(11) unsigned NOT NULL,
  `outcome` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `exit_date` date NOT NULL,
  PRIMARY KEY (`patient_id`),
  KEY `patient_id` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_outcome`
--

LOCK TABLES `patient_outcome` WRITE;
/*!40000 ALTER TABLE `patient_outcome` DISABLE KEYS */;
INSERT INTO `patient_outcome` VALUES (11111146,'2','2014-10-18'),(55555536,'1','2014-10-22');
/*!40000 ALTER TABLE `patient_outcome` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_status`
--

DROP TABLE IF EXISTS `patient_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_status` (
  `status_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) unsigned NOT NULL,
  `location_id` int(4) unsigned DEFAULT NULL,
  `general` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pain` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intake` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lab_request` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_visit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`status_id`),
  KEY `patient_id` (`status_id`),
  KEY `location_id` (`location_id`),
  KEY `status_id` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_status`
--

LOCK TABLES `patient_status` WRITE;
/*!40000 ALTER TABLE `patient_status` DISABLE KEYS */;
INSERT INTO `patient_status` VALUES (1,11111146,801,'3','2','2','1','1','2014-10-08 22:00:59'),(2,11111146,801,'1','2','2','3','0','2014-10-08 23:02:03'),(3,11122361,204,'2','3','4','4','0','2014-10-10 22:00:00'),(4,11133374,802,'1','2','2','3','0','2014-10-08 23:02:03'),(6,11111146,801,'2','2','2','2','0','2014-10-15 13:45:28'),(7,11111146,802,'3','3','2','2','0','2014-10-15 16:17:34'),(8,55555536,201,'1','1','1','1','0','2014-10-16 07:18:00'),(9,55555536,201,'1','2','2','1','0','2014-10-16 08:36:45'),(10,12313441,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-16 12:21:51'),(11,12313441,803,'1','1','2','1','2','2014-10-16 12:26:36'),(15,23456721,803,'1','1','1','1','1','2014-10-16 12:49:13'),(16,23456721,803,'1','1','1','1','1','2014-10-16 12:51:59'),(18,23456721,304,'1','1','1','2','2','2014-10-16 12:57:37'),(19,23456721,305,'2','2','2','2','2','2014-10-16 13:02:25'),(20,23456721,302,'1','2','2','4','1','2014-10-16 15:03:34'),(21,11111146,802,'1','1','3','2','1','2014-10-17 18:17:02'),(22,11111146,802,'1','1','1','2','2','2014-10-17 18:19:36'),(23,11111146,802,'1','1','1','1','1','2014-10-17 18:22:48'),(24,11111146,802,'1','1','1','1','1','2014-10-17 18:24:11'),(26,34567867,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-19 17:24:24'),(27,45678916,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-19 17:28:36'),(29,77777731,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-21 14:30:43'),(30,11111146,802,'1','1','1','1','1','2014-10-21 14:37:57'),(31,11111146,805,'1','2','2','3','1','2014-10-21 14:40:43'),(35,11111146,803,'1','2','2','3','1','2014-10-21 14:48:50'),(36,11111146,803,'1','2','1','3','2','2014-10-22 06:29:18'),(37,11111146,803,'1','2','2','3','1','2014-10-21 14:48:50'),(38,11111146,804,'1','2','1','3','2','2014-10-22 06:31:30'),(39,11111146,803,'1','1','2','1','2','2014-10-22 06:34:24'),(40,11111146,803,'1','1','2','1','1','2014-10-22 06:36:36'),(41,34567867,810,'4',' ',' ',' ',' ','2014-10-22 06:42:15'),(42,11111146,803,'2','1','1','2','2','2014-10-22 12:29:33'),(43,11111146,815,'2','1','1','2','2','2014-10-22 12:30:59'),(44,12348908,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-22 20:19:37'),(45,11122361,206,'2','2','2','3','0','2014-10-22 21:01:43'),(46,43345357,404,'1','1','1','2','0','2014-10-22 21:03:58'),(48,12314249,NULL,'2','1','1','3','0','2014-10-23 08:44:53'),(49,12314249,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-23 08:49:17'),(50,12314249,1122,'1','1','2','1','1','2014-10-23 08:55:12'),(51,12314249,1122,'1','1','2','1','1','2014-10-23 08:58:46'),(52,12314249,1120,'3','2','3','5','1','2014-10-23 09:10:45'),(53,12314249,1114,'1','3','3','3','0','2014-10-23 09:15:40'),(54,12314249,NULL,'1','1','1','1','1','2014-10-23 09:22:42'),(55,12314249,1114,'1','3','3','3','0','2014-10-23 09:24:15'),(56,12314249,1114,'1','3','3','3','0','2014-10-23 09:36:23'),(57,12314249,1114,'1','2','4','1','1','2014-10-23 09:59:27'),(58,12314249,1114,'1','3','3','3','0','2014-10-23 09:36:42'),(59,12314249,1114,'1','3','3','3','0','2014-10-23 10:07:04'),(61,12312633,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-23 10:37:15'),(62,101,812,'1','1','1','1','0','2014-10-23 11:43:09'),(63,11111146,808,'1','3','3','3','0','2014-10-23 12:02:26'),(65,12313441,1102,'3','2','3','6','1','2014-10-23 12:18:56'),(66,11133374,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-26 15:43:59'),(67,12312633,1108,'1','2','1','2','0','2015-04-04 10:15:13'),(68,12313441,1103,'3','3','2','5','0','2015-04-08 03:03:35'),(69,12313441,1102,'3','2','3','5','1','2015-04-07 21:10:06'),(70,12312633,1101,'2','1','2','1','0','2015-04-07 21:13:37'),(71,12312633,1101,'3','3','2','1','0','2015-04-08 16:29:42'),(72,12312633,1105,'3','3','2','1','0','2015-04-08 16:58:22'),(73,12312633,1101,'3','3','2','1','0','2015-04-08 17:01:08'),(74,12313441,1103,'2','2','3','3','0','2015-04-08 18:05:27'),(75,12312633,1107,'3','3','2','1','0','2015-04-08 18:11:04');
/*!40000 ALTER TABLE `patient_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_symptoms`
--

DROP TABLE IF EXISTS `patient_symptoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_symptoms` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status_id` int(11) unsigned NOT NULL,
  `symptom_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=269 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_symptoms`
--

LOCK TABLES `patient_symptoms` WRITE;
/*!40000 ALTER TABLE `patient_symptoms` DISABLE KEYS */;
INSERT INTO `patient_symptoms` VALUES (4,4,'1'),(5,4,'3'),(6,4,'8'),(7,4,'10'),(8,4,'12'),(10,3,'7'),(11,3,'2'),(19,1,'1'),(20,2,'2'),(23,6,'1'),(24,6,'7'),(25,7,'1'),(26,7,'2'),(27,7,'7'),(28,8,'1'),(29,8,'2'),(30,8,'7'),(31,9,'1'),(32,9,'2'),(33,9,'3'),(34,9,'4'),(35,9,'7'),(36,10,'3'),(37,10,'5'),(38,11,'1'),(39,11,'2'),(40,11,'10'),(41,11,'11'),(42,15,'1'),(43,15,'2'),(44,15,'10'),(45,16,'1'),(46,16,'2'),(47,16,'10'),(48,18,'3'),(49,18,'4'),(50,18,'12'),(51,19,'5'),(52,19,'6'),(53,19,'14'),(54,19,'15'),(55,20,'1'),(56,20,'2'),(57,20,'10'),(58,20,'11'),(59,21,'2'),(61,21,'4'),(62,21,'13'),(63,21,'14'),(64,22,'3'),(65,22,'4'),(66,22,'12'),(67,22,'13'),(68,23,'3'),(69,23,'4'),(70,23,'13'),(71,24,'3'),(72,24,'4'),(73,24,'13'),(80,26,'3'),(81,26,'5'),(82,26,'8'),(83,27,'1'),(84,27,'2'),(85,27,'3'),(86,27,'4'),(87,29,'4'),(88,29,'7'),(89,29,'10'),(90,30,'3'),(91,30,'4'),(92,30,'13'),(93,31,'3'),(94,31,'4'),(95,31,'5'),(96,31,'13'),(109,35,'3'),(110,35,'4'),(111,35,'5'),(112,35,'13'),(113,36,'3'),(114,36,'4'),(115,36,'5'),(116,36,'13'),(117,37,'3'),(118,37,'4'),(119,37,'5'),(120,37,'13'),(121,38,'3'),(122,38,'4'),(123,38,'5'),(124,38,'13'),(125,39,'1'),(126,39,'10'),(127,40,'1'),(128,40,'10'),(129,42,'3'),(130,42,'4'),(131,42,'11'),(132,42,'12'),(133,43,'3'),(134,43,'4'),(135,43,'11'),(136,43,'12'),(137,44,'4'),(138,44,'5'),(139,44,'8'),(140,44,'10'),(141,45,'2'),(142,45,'3'),(143,45,'12'),(144,45,'13'),(145,46,'1'),(146,46,'2'),(147,46,'10'),(152,48,'1'),(153,48,'4'),(154,48,'10'),(155,48,'13'),(156,49,'1'),(157,49,'2'),(158,49,'4'),(159,50,'1'),(160,50,'2'),(161,50,'3'),(162,50,'10'),(163,50,'13'),(164,51,'1'),(165,51,'2'),(166,51,'3'),(167,51,'10'),(168,51,'13'),(169,52,'6'),(170,52,'14'),(171,52,'15'),(172,53,'4'),(173,53,'5'),(174,53,'6'),(175,53,'13'),(176,53,'14'),(177,53,'15'),(178,54,'4'),(179,54,'10'),(180,54,'13'),(181,55,'4'),(182,55,'5'),(183,55,'6'),(184,55,'13'),(185,55,'14'),(186,55,'15'),(187,56,'4'),(188,56,'5'),(189,56,'6'),(190,56,'13'),(191,56,'14'),(192,56,'15'),(193,57,'1'),(194,57,'4'),(195,57,'6'),(196,57,'11'),(197,57,'13'),(198,57,'14'),(199,58,'4'),(200,58,'5'),(201,58,'6'),(202,58,'13'),(203,58,'14'),(204,58,'15'),(205,59,'4'),(206,59,'5'),(207,59,'6'),(208,59,'13'),(209,59,'14'),(210,59,'15'),(211,61,'2'),(212,61,'3'),(213,61,'4'),(214,62,'1'),(215,62,'2'),(216,62,'10'),(217,63,'3'),(218,63,'5'),(219,63,'10'),(220,63,'11'),(221,65,'4'),(222,65,'6'),(223,65,'13'),(224,65,'14'),(225,66,'4'),(226,66,'5'),(227,66,'7'),(228,67,'2'),(229,67,'4'),(230,67,'5'),(231,67,'11'),(232,67,'12'),(233,68,'1'),(234,68,'2'),(235,68,'10'),(236,69,'4'),(237,69,'13'),(238,69,'15'),(239,70,'1'),(240,70,'3'),(241,70,'10'),(242,70,'12'),(243,71,'1'),(244,71,'2'),(245,71,'3'),(246,71,'11'),(247,71,'14'),(248,72,'1'),(249,72,'2'),(250,72,'3'),(251,72,'11'),(252,72,'14'),(253,73,'1'),(254,73,'2'),(255,73,'3'),(256,73,'11'),(257,73,'14'),(258,74,'1'),(259,74,'2'),(260,74,'3'),(261,74,'5'),(262,74,'10'),(263,74,'14'),(264,75,'1'),(265,75,'2'),(266,75,'3'),(267,75,'11'),(268,75,'14');
/*!40000 ALTER TABLE `patient_symptoms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `patients_not_visited`
--

DROP TABLE IF EXISTS `patients_not_visited`;
/*!50001 DROP VIEW IF EXISTS `patients_not_visited`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `patients_not_visited` (
  `tent` tinyint NOT NULL,
  `bed` tinyint NOT NULL,
  `last_visit` tinyint NOT NULL,
  `patient_id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `surname` tinyint NOT NULL,
  `age` tinyint NOT NULL,
  `sex` tinyint NOT NULL,
  `adm_date` tinyint NOT NULL,
  `sym_date` tinyint NOT NULL,
  `datecr` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `record`
--

DROP TABLE IF EXISTS `record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` int(11) DEFAULT NULL,
  `what` int(11) NOT NULL,
  `who` int(11) NOT NULL,
  `when` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `where` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `upd_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record`
--

LOCK TABLES `record` WRITE;
/*!40000 ALTER TABLE `record` DISABLE KEYS */;
INSERT INTO `record` VALUES (3,48,2,1,'2017wk26','OPDMasisi','2017-07-02 18:19:55'),(4,33,2,2,'2017wk26','OPDMasisi','2017-07-02 18:19:55'),(34,10,1,1,'2017wk26','OPDMasisi','2017-07-02 18:19:55'),(35,25,6,3,'2017wk26','OPDMasisi','2017-07-02 18:19:56'),(36,100,5,3,'2017wk26','OPDMasisi','2017-07-02 18:19:56'),(66,55,3,1,'2017wk26','OPDMasisi','2017-07-02 18:19:55'),(67,3,2,1,'2017wk27','OPDMasisi','2017-07-02 17:47:40'),(68,2,2,2,'2017wk27','OPDMasisi','2017-07-02 17:47:40'),(69,7,1,1,'2017wk27','OPDMasisi','2017-07-02 17:47:40'),(70,4,1,2,'2017wk27','OPDMasisi','2017-07-02 17:47:40');
/*!40000 ALTER TABLE `record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tinyint_asc`
--

DROP TABLE IF EXISTS `tinyint_asc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tinyint_asc` (
  `value` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tinyint_asc`
--

LOCK TABLES `tinyint_asc` WRITE;
/*!40000 ALTER TABLE `tinyint_asc` DISABLE KEYS */;
INSERT INTO `tinyint_asc` VALUES (0),(1),(2),(3),(4),(5),(6),(7),(8),(9),(10);
/*!40000 ALTER TABLE `tinyint_asc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_msf_patients`
--

DROP TABLE IF EXISTS `vw_msf_patients`;
/*!50001 DROP VIEW IF EXISTS `vw_msf_patients`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_msf_patients` (
  `PatientID` tinyint NOT NULL,
  `BedLocationID` tinyint NOT NULL,
  `DC_General` tinyint NOT NULL,
  `DC_Status` tinyint NOT NULL,
  `DC_Pain` tinyint NOT NULL,
  `DC_Intake` tinyint NOT NULL,
  `DC_Symptomatology1` tinyint NOT NULL,
  `DC_Symptomatology2` tinyint NOT NULL,
  `DC_extraDrugs` tinyint NOT NULL,
  `DC_Laboratory` tinyint NOT NULL,
  `PatientName` tinyint NOT NULL,
  `PatientAge` tinyint NOT NULL,
  `PatientSex` tinyint NOT NULL,
  `PatientTextInfo` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `what`
--

DROP TABLE IF EXISTS `what`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `what` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upd_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `what`
--

LOCK TABLES `what` WRITE;
/*!40000 ALTER TABLE `what` DISABLE KEYS */;
INSERT INTO `what` VALUES (1,'Malaria','dis',NULL,'2017-07-01 15:37:34'),(2,'Cholera','dis',NULL,'2017-07-01 15:37:34'),(3,'Measles','dis',NULL,'2017-07-01 15:37:34'),(4,'Trauma','dis',NULL,'2017-07-01 15:37:34'),(5,'Malaria Test','test',NULL,'2017-07-01 17:37:34'),(6,'Malaria Positive','result',NULL,'2017-07-01 17:37:34');
/*!40000 ALTER TABLE `what` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `who`
--

DROP TABLE IF EXISTS `who`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `who` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upd_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `who`
--

LOCK TABLES `who` WRITE;
/*!40000 ALTER TABLE `who` DISABLE KEYS */;
INSERT INTO `who` VALUES (1,'<5y','age',NULL,'2017-07-01 15:38:11'),(2,'>=5y','age',NULL,'2017-07-01 15:38:11'),(3,'undefined','age',NULL,'2017-07-01 17:38:11');
/*!40000 ALTER TABLE `who` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zetesdc_msf`
--

DROP TABLE IF EXISTS `zetesdc_msf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zetesdc_msf` (
  `DateTime` datetime DEFAULT NULL,
  `DeviceID` varchar(20) DEFAULT NULL,
  `Version` varchar(10) DEFAULT NULL,
  `OperatorID` varchar(10) DEFAULT NULL,
  `PatientID` int(8) DEFAULT NULL,
  `PatientID_Input` varchar(1) DEFAULT NULL,
  `BedLocationID` int(4) DEFAULT NULL,
  `BedlocationID_Input` varchar(1) DEFAULT NULL,
  `DC_General` varchar(1) DEFAULT NULL,
  `DC_Status` varchar(1) DEFAULT NULL,
  `DC_Pain` varchar(1) DEFAULT NULL,
  `DC_Intake` varchar(1) DEFAULT NULL,
  `DC_Symptomatology1` varchar(9) DEFAULT NULL,
  `DC_Symptomatology2` varchar(9) DEFAULT NULL,
  `DC_ExtraDrugs` varchar(9) DEFAULT NULL,
  `DC_Laboratory` varchar(1) DEFAULT NULL,
  `DC_BedStatus` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zetesdc_msf`
--

LOCK TABLES `zetesdc_msf` WRITE;
/*!40000 ALTER TABLE `zetesdc_msf` DISABLE KEYS */;
INSERT INTO `zetesdc_msf` VALUES ('2014-10-09 01:02:03','fd2334','v23',NULL,11133374,'s',132,'s','1','2','2','3','101000','010101','11001','0',''),('2014-10-09 01:02:03','fd2334','v23',NULL,11122246,'s',132,'s','1','2','2','3','111000','110000','11000','0',''),('2014-10-09 00:00:59','fd2334','v23',NULL,11111146,'s',132,'s','1','2','2','1','100000','100000','10000','1','1'),('2014-10-09 00:00:59','fd2334','v23',NULL,11111146,'s',132,'s','3','2','2','1','100000','100000','10000','1',''),('2014-10-09 00:00:59','fd2334','v23',NULL,11111146,'s',132,'s','3','2','2','1','100000','100000','10000','1','2'),('2014-10-15 15:45:28','fd355','v24',NULL,11111146,'s',132,'s','2','2','2','2','100000','100000','10000','0',NULL),('2014-10-15 18:17:34','fd355','v24',NULL,11111146,'s',102,'s','3','3','2','2','110000','100000','10000','0',NULL),('2014-10-16 09:18:00','fd355','v24',NULL,55555536,'s',201,'s','1','1','1','1','110000','100000','10000','0',NULL),('2014-10-16 10:36:45','fd355','v24',NULL,55555536,'s',201,'s','1','2','2','1','111100','100000','11000','0',NULL),('2014-10-16 14:21:51','001                 ','00.01     ','          ',11111146,'M',102,' ','4','2','4','5','000001000','000010000','011110000','1',' '),('2014-10-16 14:26:36','001                 ','00.01     ','          ',12345672,'S',1234,'S','1','1','2','1','110000000','110000000','110000000','2',' '),('2014-10-16 14:36:10','001                 ','00.01     ','          ',12345672,' ',1234,'M',' ',' ',' ',' ','         ','         ','         ',' ','1'),('2014-10-16 14:36:33','001                 ','00.01     ','          ',12345672,' ',1234,'S',' ',' ',' ',' ','         ','         ','         ',' ','2'),('2014-10-16 14:38:31','001                 ','00.01     ','          ',12345672,'S',1234,'S',' ',' ',' ',' ','         ','         ','         ',' ',' '),('2014-10-16 14:49:13','001                 ','00.01     ','          ',23456721,'S',1234,'S','1','1','1','1','110000000','100000000','100000000','1',' '),('2014-10-16 14:51:59','001                 ','00.01     ','          ',23456721,'S',1234,'S','1','1','1','1','110000000','100000000','100000000','1',' '),('2014-10-16 14:53:34','001                 ','00.01     ','          ',12345672,' ',1234,'S',' ',' ',' ',' ','         ','         ','         ',' ','1'),('2014-10-16 14:57:37','001                 ','00.01     ','          ',23456721,'S',1234,'S','1','1','1','2','001100000','001000000','011000000','2',' '),('2014-10-16 14:58:13','001                 ','00.01     ','          ',12345672,' ',1234,'S',' ',' ',' ',' ','         ','         ','         ',' ','1'),('2014-10-16 15:02:25','001                 ','00.01     ','          ',23456721,'S',1234,'S','2','2','2','2','000011000','000011000','000010000','2',' '),('2014-10-16 17:03:34','001                 ','00.01     ','          ',23456721,'S',1234,'S','1','2','2','4','110000000','110000000','110000000','1',' '),('2014-10-17 20:17:02','001                 ','00.01     ','          ',11111146,'M',102,'M','1','1','3','2','011100000','000110000','011000000','1',' '),('2014-10-17 20:19:36','001                 ','00.01     ','          ',11111146,'M',102,'M','1','1','1','2','001100000','001100000','001000000','2',' '),('2014-10-17 20:22:48','001                 ','00.01     ','          ',11111146,'M',102,'M','1','1','1','1','001100000','000100000','001000000','1',' '),('2014-10-17 20:24:11','001                 ','00.01     ','          ',11111146,'M',102,'M','1','1','1','1','001100000','000100000','001000000','1',' '),('2014-10-21 16:37:57','001                 ','00.25     ','          ',11111146,'M',102,' ','1','1','1','1','001100000','000100000','001000000','1',' '),('2014-10-21 16:40:43','001                 ','00.25     ','          ',11111146,'M',105,'M','1','2','2','3','001110000','000100000','001100000','1',' '),('2014-10-21 16:48:50','001                 ','00.25     ','          ',11111146,'M',103,'M','1','2','2','3','001110000','000100000','001100000','1',' '),('2014-10-22 08:29:18','001                 ','00.25     ','          ',11111146,'M',103,'M','1','2','1','3','001110000','000100000','001100000','2',' '),('2014-10-21 16:48:50','001                 ','00.25     ','          ',11111146,'M',103,'M','1','2','2','3','001110000','000100000','001100000','1',' '),('2014-10-22 08:31:30','001                 ','00.25     ','          ',11111146,'M',104,'M','1','2','1','3','001110000','000100000','001100000','2',' '),('2014-10-22 08:34:24','001                 ','00.25     ','          ',11111146,'M',103,'M','1','1','2','1','100000000','100000000','100000000','2',' '),('2014-10-22 08:36:36','001                 ','00.25     ','          ',11111146,'M',103,'M','1','1','2','1','100000000','100000000','100000000','1',' '),('2014-10-22 08:37:56','001                 ','00.25     ','          ',0,' ',106,'M',' ',' ',' ',' ','         ','         ','         ',' ','2'),('2014-10-22 08:38:22','001                 ','00.25     ','          ',0,' ',307,'M',' ',' ',' ',' ','         ','         ','         ',' ','2'),('2014-10-22 08:39:13','001                 ','00.25     ','          ',0,' ',103,'M',' ',' ',' ',' ','         ','         ','         ',' ','1'),('2014-10-22 08:42:15','001                 ','00.25     ','          ',34567867,'M',110,'M','4',' ',' ',' ','         ','         ','         ',' ',' '),('2014-10-22 14:29:33','001                 ','00.25     ','          ',11111146,'M',103,'M','2','1','1','2','001100000','011000000','011000000','2',' '),('2014-10-22 14:30:59','001                 ','00.25     ','          ',11111146,'M',115,'M','2','1','1','2','001100000','011000000','011000000','2',' '),('2014-10-22 14:37:02','001                 ','00.25     ','          ',0,' ',1234,'M',' ',' ',' ',' ','         ','         ','         ',' ','2'),('2014-10-22 23:01:43','001                 ','00.28     ','          ',11122361,'M',206,'M','2','2','2','3','011000000','001100000','101000000','0',' '),('2014-10-22 23:03:58','001                 ','00.28     ','          ',43345357,'M',404,'M','1','1','1','2','110000000','100000000','100000000','0',' '),('2014-10-23 10:44:53','001                 ','00.28     ','          ',12314249,'S',0,' ','2','1','1','3','100100000','100100000','100010000','0',' '),('2014-10-23 10:55:12','001                 ','00.28     ','          ',12314249,'S',1122,'S','1','1','2','1','111000000','100100000','010100000','1',' '),('2014-10-23 10:58:46','001                 ','00.28     ','          ',12314249,'S',1122,'S','1','1','2','1','111000000','100100000','010100000','1',' '),('2014-10-23 10:59:57','001                 ','00.28     ','          ',0,' ',1122,'S',' ',' ',' ',' ','         ','         ','         ',' ','2'),('2014-10-23 11:10:45','001                 ','00.28     ','          ',12314249,'S',1120,'S','3','2','3','5','000001000','000011000','001000000','1',' '),('2014-10-23 11:15:40','001                 ','00.28     ','          ',12314249,'M',1114,'M','1','3','3','3','000111000','000111000','111000000','0',' '),('2014-10-23 11:22:42','001                 ','00.28     ','          ',12314249,'S',0,' ','1','1','1','1','000100000','100100000','100000000','1',' '),('2014-10-23 11:24:15','001                 ','00.28     ','          ',12314249,'S',1114,' ','1','3','3','3','000111000','000111000','111000000','0',' '),('2014-10-23 11:36:23','001                 ','00.28     ','          ',12314249,'S',1114,' ','1','3','3','3','000111000','000111000','111000000','0',' '),('2014-10-23 11:59:27','001                 ','00.28     ','          ',12314249,'M',1114,'M','1','2','4','1','100101000','010110000','101000000','1',' '),('2014-10-23 11:36:42','001                 ','00.28     ','          ',12314249,'S',1114,' ','1','3','3','3','000111000','000111000','111000000','0',' '),('2014-10-23 12:07:04','001                 ','00.28     ','          ',12314249,'S',1114,' ','1','3','3','3','000111000','000111000','111000000','0',' '),('2014-10-23 11:44:11','001                 ','00.28     ','          ',12345672,'M',0,' ','4',' ',' ',' ','         ','         ','         ',' ',' '),('2014-10-23 12:12:47','001                 ','00.28     ','          ',0,' ',1114,'S',' ',' ',' ',' ','         ','         ','         ',' ','2'),('2014-10-23 13:43:09','001                 ','00.28     ','          ',101,'M',112,'M','1','1','1','1','110000000','100000000','100000000','0',' '),('2014-10-23 13:53:09','001                 ','00.28     ','          ',0,' ',7777,'M',' ',' ',' ',' ','         ','         ','         ',' ','1'),('2014-10-23 14:02:26','001                 ','00.28     ','          ',11111146,'M',108,'M','1','3','3','3','001010000','110000000','100000000','0',' '),('2014-10-23 14:17:24','001                 ','00.28     ','          ',12314148,'M',1122,'M','4',' ',' ',' ','         ','         ','         ',' ',' '),('2014-10-23 14:18:56','001                 ','00.28     ','          ',12345672,'M',1122,'M','3','2','3','6','000101000','000110000','001100000','1',' '),('2014-10-27 11:21:43','002                 ','00.28     ','          ',12313542,'S',1108,'S','1','1','1','1','100000000','100000000','100000000','0',' '),('2015-04-04 12:15:13','020                 ','01.00     ','          ',12312633,'S',1108,'M','1','2','1','2','010110000','011000000','011000000','0',' '),('2015-04-07 23:03:35','020                 ','01.00     ','          ',12313441,'S',1103,'S','3','3','2','5','110000000','100000000','100000000','0',' '),('2015-04-07 17:07:41','020                 ','01.00     ','          ',NULL,' ',1104,'S',' ',' ',' ',' ','         ','         ','         ',' ','2'),('2015-04-07 17:10:06','020                 ','01.00     ','          ',12313441,'S',1102,'S','3','2','3','5','000100000','000101000','001000000','1',' '),('2015-04-07 17:12:08','020                 ','01.00     ','          ',NULL,' ',1102,'S',' ',' ',' ',' ','         ','         ','         ',' ','1'),('2015-04-07 17:13:37','020                 ','01.00     ','          ',12312633,'S',1101,'S','2','1','2','1','101000000','101000000','100000000','0',' '),('2015-04-08 12:29:42','020                 ','01.00     ','          ',12312633,'S',1101,' ','3','3','2','1','111000000','010010000','110000000','0',' '),('2015-04-08 12:58:22','020                 ','01.00     ','          ',12312633,'S',1105,'M','3','3','2','1','111000000','010010000','110000000','0',' '),('2015-04-08 13:01:08','020                 ','01.00     ','          ',12312633,'S',1101,'M','3','3','2','1','111000000','010010000','110000000','0',' '),('2015-04-08 14:05:27','020                 ','01.00     ','          ',12313441,'S',1103,' ','2','2','3','3','111010000','100010000','000000000','0',' '),('2015-04-08 14:11:04','020                 ','01.00     ','          ',12312633,'M',1107,'M','3','3','2','1','111000000','010010000','110000000','0',' ');
/*!40000 ALTER TABLE `zetesdc_msf` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER update_patient_status AFTER INSERT ON zetesdc_msf
FOR EACH ROW
  BEGIN

	SET @new_status_id = NULL;
	SET @current_location_id = NULL;
	SELECT location_id FROM msf.last_patient_status WHERE last_patient_status.patient_id = NEW.patientID INTO @current_location_id;
	IF NEW.BedLocationID <> '' && NEW.BedLocationID IS NOT NULL THEN
		SET @LocationID = NEW.BedLocationID;
	ELSE
		SET @LocationID = @current_location_id;
	END IF;

	
	IF NEW.DC_BedStatus <> '' && NEW.DC_BedStatus IS NOT NULL THEN
		CASE NEW.DC_BedStatus
			WHEN 1 THEN
				INSERT INTO `msf`.`location_status` (`location_id`, `status`, `last_update`) VALUES (@LocationID, NEW.DC_BedStatus, NEW.DateTime)
				ON DUPLICATE KEY UPDATE `status` = NEW.DC_BedStatus, `last_update` = NEW.DateTime;
			WHEN 2 THEN
				INSERT INTO `msf`.`location_status` (`location_id`, `cleaning`, `last_update`) VALUES (@LocationID, 1, NEW.DateTime)
				ON DUPLICATE KEY UPDATE `cleaning` = 1, `last_update` = NEW.DateTime;
		END CASE;
	ELSE
		
		
		INSERT INTO `msf`.`patient_status`
			(`patient_id`,
			`location_id`,
			`general`,
			`status`,
			`pain`,
			`intake`,
			`lab_request`,
			`last_visit`)
			VALUES
			   (NEW.patientID,
				@LocationID,
				NEW.DC_General,
				NEW.DC_Status,
				NEW.DC_Pain,
				NEW.DC_Intake,
				NEW.DC_Laboratory,
				NEW.DateTime);
	
		
		SET @index = 1;
		SELECT status_id FROM msf.patient_status order by status_id desc limit 1 INTO @new_status_id;

		set @string = CONCAT(NEW.DC_Symptomatology1, NEW.DC_Symptomatology2);
		SET @index = 1;
		SET @len= LENGTH(@string);
		WHILE @index<= @len
		DO
			set @char = SUBSTRING(@string, @index, 1);
			
			IF @char = '1' THEN
				INSERT INTO `msf`.`patient_symptoms`
					(`status_id`, `symptom_id`) VALUES (@new_status_id, @index);
			END IF;
			SET @index = @index + 1;
		END WHILE;
		set @string = NEW.DC_ExtraDrugs;
		SET @index = 1;
		SET @len= LENGTH(@string);
		WHILE @index<= @len
		DO
			set @char = SUBSTRING(@string, @index, 1);
			
			IF @char = '1' THEN
				INSERT INTO `msf`.`patient_drugs`
					(`status_id`, `drug_id`) VALUES (@new_status_id, @index);
			END IF;
			SET @index = @index + 1;
		END WHILE;

		IF @LocationID <> '' && @LocationID IS NOT NULL THEN
			
			IF @current_location_id IS NOT NULL && @current_location_id <> @LocationID THEN
				INSERT INTO `msf`.`location_status` (`location_id`, `status`, `last_update`) VALUES (@current_location_id, 1, NEW.DateTime)
					ON DUPLICATE KEY UPDATE `status` = 1, `last_update` = NEW.DateTime;
			END IF;
			INSERT INTO `msf`.`location_status` (`location_id`, `status`, `last_update`) VALUES (@LocationID, 0, NEW.DateTime)
				ON DUPLICATE KEY UPDATE `status` = 0, `last_update` = NEW.DateTime;
		END IF;
	END IF;

  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `bed_status`
--

/*!50001 DROP TABLE IF EXISTS `bed_status`*/;
/*!50001 DROP VIEW IF EXISTS `bed_status`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bed_status` AS select distinct `location_status`.`location_id` AS `location_id`,`concept_dic`.`name` AS `tent`,cast(substr(`location_status`.`location_id`,-(2),2) as unsigned) AS `bed`,(case (`location_status`.`status` + (2 * `location_status`.`cleaning`)) when 0 then 'O' when 1 then 'A' when 2 then 'OC' when 3 then 'AC' else 'A' end) AS `status`,`location_status`.`last_update` AS `last_update` from (`location_status` join `concept_dic` on(((`concept_dic`.`type` = 'tent') and (`concept_dic`.`code` = cast(substr(lpad(`location_status`.`location_id`,4,'0'),1,2) as unsigned))))) order by `concept_dic`.`name`,cast(substr(`location_status`.`location_id`,-(2),2) as unsigned) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `last_patient_status`
--

/*!50001 DROP TABLE IF EXISTS `last_patient_status`*/;
/*!50001 DROP VIEW IF EXISTS `last_patient_status`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `last_patient_status` AS select `t1`.`status_id` AS `status_id`,`t1`.`patient_id` AS `patient_id`,`t1`.`location_id` AS `location_id`,`t1`.`general` AS `general`,`t1`.`status` AS `status`,`t1`.`pain` AS `pain`,`t1`.`intake` AS `intake`,`t1`.`lab_request` AS `lab_request`,`t1`.`last_visit` AS `last_visit` from (`patient_status` `t1` left join `patient_status` `t2` on(((`t1`.`patient_id` = `t2`.`patient_id`) and (`t1`.`last_visit` < `t2`.`last_visit`)))) where isnull(`t2`.`last_visit`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `last_testresult`
--

/*!50001 DROP TABLE IF EXISTS `last_testresult`*/;
/*!50001 DROP VIEW IF EXISTS `last_testresult`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `last_testresult` AS select `t1`.`id` AS `id`,`t1`.`patient_id` AS `patient_id`,`t1`.`test_date` AS `test_date`,`concept_dic`.`name` AS `result` from ((`patient_labtest` `t1` left join `patient_labtest` `t2` on(((`t1`.`patient_id` = `t2`.`patient_id`) and (`t1`.`test_date` < `t2`.`test_date`)))) join `concept_dic` on(((`concept_dic`.`type` = 'test') and (`concept_dic`.`code` = `t1`.`result`)))) where isnull(`t2`.`test_date`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `last_zetesdc_msf`
--

/*!50001 DROP TABLE IF EXISTS `last_zetesdc_msf`*/;
/*!50001 DROP VIEW IF EXISTS `last_zetesdc_msf`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `last_zetesdc_msf` AS select `t1`.`DateTime` AS `DateTime`,`t1`.`DeviceID` AS `DeviceID`,`t1`.`Version` AS `Version`,`t1`.`OperatorID` AS `OperatorID`,`t1`.`PatientID` AS `PatientID`,`t1`.`PatientID_Input` AS `PatientID_Input`,`t1`.`BedLocationID` AS `BedLocationID`,`t1`.`BedlocationID_Input` AS `BedlocationID_Input`,`t1`.`DC_General` AS `DC_General`,`t1`.`DC_Status` AS `DC_Status`,`t1`.`DC_Pain` AS `DC_Pain`,`t1`.`DC_Intake` AS `DC_Intake`,`t1`.`DC_Symptomatology1` AS `DC_Symptomatology1`,`t1`.`DC_Symptomatology2` AS `DC_Symptomatology2`,`t1`.`DC_ExtraDrugs` AS `DC_ExtraDrugs`,`t1`.`DC_Laboratory` AS `DC_Laboratory`,`t1`.`DC_BedStatus` AS `DC_BedStatus` from (`zetesdc_msf` `t1` left join `zetesdc_msf` `t2` on(((`t1`.`PatientID` = `t2`.`PatientID`) and (`t1`.`DateTime` < `t2`.`DateTime`)))) where isnull(`t2`.`DateTime`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `location_watsan_info`
--

/*!50001 DROP TABLE IF EXISTS `location_watsan_info`*/;
/*!50001 DROP VIEW IF EXISTS `location_watsan_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `location_watsan_info` AS select lpad(`bed_status`.`location_id`,4,'0') AS `location_id`,`bed_status`.`tent` AS `tent`,`bed_status`.`bed` AS `bed`,`last_patient_status`.`patient_id` AS `patient_id`,`patient_emr`.`surname` AS `surname`,`patient_emr`.`name` AS `name`,`location_status`.`last_update` AS `last_update`,'needs cleaning' AS `status` from (((`bed_status` left join `last_patient_status` on((`last_patient_status`.`location_id` = `bed_status`.`location_id`))) left join `patient_emr` on((`last_patient_status`.`patient_id` = `patient_emr`.`patient_id`))) left join `location_status` on((`location_status`.`location_id` = `bed_status`.`location_id`))) where (`location_status`.`cleaning` = 1) order by lpad(`bed_status`.`location_id`,4,'0') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `patient_full_emr`
--

/*!50001 DROP TABLE IF EXISTS `patient_full_emr`*/;
/*!50001 DROP VIEW IF EXISTS `patient_full_emr`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patient_full_emr` AS select `tn`.`name` AS `tent`,cast(substr(`last_patient_status`.`location_id`,-(2),2) as unsigned) AS `bed`,`patient_emr`.`patient_id` AS `patient_id`,`patient_emr`.`moh_id` AS `moh_id`,`patient_emr`.`surname` AS `surname`,`patient_emr`.`name` AS `name`,`patient_emr`.`age` AS `age`,`patient_emr`.`sex` AS `sex`,`patient_emr`.`adm_date` AS `adm_date`,`patient_emr`.`sym_date` AS `sym_date`,`g`.`name` AS `general`,`s`.`name` AS `status`,`p`.`name` AS `pain`,`i`.`name` AS `intake`,group_concat(distinct `sym`.`name` separator ', ') AS `symptoms`,group_concat(distinct `d`.`name` separator ', ') AS `extra_drugs`,if(`last_patient_status`.`lab_request`,'Y','N') AS `lab_test`,`last_patient_status`.`last_visit` AS `last_visit`,NULL AS `test_1_date`,NULL AS `test_2_date`,NULL AS `test_n-1_date`,NULL AS `test_n_date`,NULL AS `test_1_result`,NULL AS `test_2_result`,NULL AS `test_n-1_result`,NULL AS `test_n_result`,`o`.`name` AS `outcome`,`patient_outcome`.`exit_date` AS `exit_date` from ((((((((((((`patient_emr` left join `last_patient_status` on((`last_patient_status`.`patient_id` = `patient_emr`.`patient_id`))) left join `patient_outcome` on((`patient_outcome`.`patient_id` = `patient_emr`.`patient_id`))) left join `patient_symptoms` on((`patient_symptoms`.`status_id` = `last_patient_status`.`status_id`))) left join `patient_drugs` on((`patient_drugs`.`status_id` = `last_patient_status`.`status_id`))) left join `concept_dic` `tn` on(((`tn`.`type` = 'tent') and (`tn`.`code` = cast(substr(lpad(`last_patient_status`.`location_id`,4,'0'),1,2) as unsigned))))) left join `concept_dic` `g` on(((`g`.`type` = 'general') and (`g`.`code` = `last_patient_status`.`general`)))) left join `concept_dic` `s` on(((`s`.`type` = 'status') and (`s`.`code` = `last_patient_status`.`status`)))) left join `concept_dic` `p` on(((`p`.`type` = 'pain') and (`p`.`code` = `last_patient_status`.`pain`)))) left join `concept_dic` `i` on(((`i`.`type` = 'intake') and (`i`.`code` = `last_patient_status`.`intake`)))) left join `concept_dic` `o` on(((`o`.`type` = 'outcome') and (`o`.`code` = `patient_outcome`.`outcome`)))) left join `concept_dic` `sym` on(((`sym`.`type` = 'symptom') and (`sym`.`code` = `patient_symptoms`.`symptom_id`)))) left join `concept_dic` `d` on(((`d`.`type` = 'drug') and (`d`.`code` = `patient_drugs`.`drug_id`)))) group by `patient_emr`.`patient_id` order by `sym`.`name`,`d`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `patient_history`
--

/*!50001 DROP TABLE IF EXISTS `patient_history`*/;
/*!50001 DROP VIEW IF EXISTS `patient_history`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patient_history` AS select `patient_status`.`patient_id` AS `patient_id`,`tn`.`name` AS `tent`,cast(substr(`patient_status`.`location_id`,-(2),2) as unsigned) AS `bed`,`g`.`name` AS `general`,`s`.`name` AS `status`,`p`.`name` AS `pain`,`i`.`name` AS `intake`,group_concat(distinct `sym`.`name` separator ', ') AS `symptoms`,group_concat(distinct `d`.`name` separator ', ') AS `extra_drugs`,if(`patient_status`.`lab_request`,'Y','N') AS `lab_test`,`patient_status`.`last_visit` AS `update_date` from (((((((((`patient_status` left join `patient_symptoms` on((`patient_symptoms`.`status_id` = `patient_status`.`status_id`))) left join `patient_drugs` on((`patient_drugs`.`status_id` = `patient_status`.`status_id`))) left join `concept_dic` `tn` on(((`tn`.`type` = 'tent') and (`tn`.`code` = cast(substr(lpad(`patient_status`.`location_id`,4,'0'),1,2) as unsigned))))) left join `concept_dic` `g` on(((`g`.`type` = 'general') and (`g`.`code` = `patient_status`.`general`)))) left join `concept_dic` `s` on(((`s`.`type` = 'status') and (`s`.`code` = `patient_status`.`status`)))) left join `concept_dic` `p` on(((`p`.`type` = 'pain') and (`p`.`code` = `patient_status`.`pain`)))) left join `concept_dic` `i` on(((`i`.`type` = 'intake') and (`i`.`code` = `patient_status`.`intake`)))) left join `concept_dic` `sym` on(((`sym`.`type` = 'symptom') and (`sym`.`code` = `patient_symptoms`.`symptom_id`)))) left join `concept_dic` `d` on(((`d`.`type` = 'drug') and (`d`.`code` = `patient_drugs`.`drug_id`)))) group by `patient_status`.`last_visit` order by `patient_status`.`last_visit` desc,`sym`.`name`,`d`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `patient_history_asc`
--

/*!50001 DROP TABLE IF EXISTS `patient_history_asc`*/;
/*!50001 DROP VIEW IF EXISTS `patient_history_asc`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patient_history_asc` AS select `patient_status`.`patient_id` AS `patient_id`,`tn`.`name` AS `tent`,cast(substr(`patient_status`.`location_id`,-(2),2) as unsigned) AS `bed`,`g`.`name` AS `general`,`s`.`name` AS `status`,`p`.`name` AS `pain`,`i`.`name` AS `intake`,group_concat(distinct `sym`.`name` separator ', ') AS `symptoms`,group_concat(distinct `d`.`name` separator ', ') AS `extra_drugs`,if(`patient_status`.`lab_request`,'Y','N') AS `lab_test`,`patient_status`.`last_visit` AS `update_date` from (((((((((`patient_status` left join `patient_symptoms` on((`patient_symptoms`.`status_id` = `patient_status`.`status_id`))) left join `patient_drugs` on((`patient_drugs`.`status_id` = `patient_status`.`status_id`))) left join `concept_dic` `tn` on(((`tn`.`type` = 'tent') and (`tn`.`code` = cast(substr(lpad(`patient_status`.`location_id`,4,'0'),1,2) as unsigned))))) left join `concept_dic` `g` on(((`g`.`type` = 'general') and (`g`.`code` = `patient_status`.`general`)))) left join `concept_dic` `s` on(((`s`.`type` = 'status') and (`s`.`code` = `patient_status`.`status`)))) left join `concept_dic` `p` on(((`p`.`type` = 'pain') and (`p`.`code` = `patient_status`.`pain`)))) left join `concept_dic` `i` on(((`i`.`type` = 'intake') and (`i`.`code` = `patient_status`.`intake`)))) left join `concept_dic` `sym` on(((`sym`.`type` = 'symptom') and (`sym`.`code` = `patient_symptoms`.`symptom_id`)))) left join `concept_dic` `d` on(((`d`.`type` = 'drug') and (`d`.`code` = `patient_drugs`.`drug_id`)))) group by `patient_status`.`last_visit` order by `patient_status`.`last_visit`,`sym`.`name`,`d`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `patients_not_visited`
--

/*!50001 DROP TABLE IF EXISTS `patients_not_visited`*/;
/*!50001 DROP VIEW IF EXISTS `patients_not_visited`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patients_not_visited` AS select distinct `t2`.`tent` AS `tent`,`t2`.`bed` AS `bed`,ifnull(`t2`.`last_visit`,'Never visited') AS `last_visit`,`t1`.`patient_id` AS `patient_id`,`t1`.`name` AS `name`,`t1`.`surname` AS `surname`,`t1`.`age` AS `age`,`t1`.`sex` AS `sex`,`t1`.`adm_date` AS `adm_date`,`t1`.`sym_date` AS `sym_date`,`t1`.`datecr` AS `datecr` from (`patient_emr` `t1` left join `patient_full_emr` `t2` on((`t1`.`patient_id` = `t2`.`patient_id`))) where ((ifnull(`t2`.`last_visit`,'2014-10-01 00:00:00') < (case when (now() < concat(curdate(),' 13:59:00')) then concat(curdate(),' 08:00:00') else concat(curdate(),' 14:00:00') end)) and isnull(`t2`.`outcome`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_msf_patients`
--

/*!50001 DROP TABLE IF EXISTS `vw_msf_patients`*/;
/*!50001 DROP VIEW IF EXISTS `vw_msf_patients`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_msf_patients` AS select `patient_emr`.`patient_id` AS `PatientID`,`last_zetesdc_msf`.`BedLocationID` AS `BedLocationID`,`last_zetesdc_msf`.`DC_General` AS `DC_General`,`last_zetesdc_msf`.`DC_Status` AS `DC_Status`,`last_zetesdc_msf`.`DC_Pain` AS `DC_Pain`,`last_zetesdc_msf`.`DC_Intake` AS `DC_Intake`,`last_zetesdc_msf`.`DC_Symptomatology1` AS `DC_Symptomatology1`,`last_zetesdc_msf`.`DC_Symptomatology2` AS `DC_Symptomatology2`,`last_zetesdc_msf`.`DC_ExtraDrugs` AS `DC_extraDrugs`,`last_zetesdc_msf`.`DC_Laboratory` AS `DC_Laboratory`,concat(`patient_emr`.`name`,' ',`patient_emr`.`surname`) AS `PatientName`,`patient_emr`.`age` AS `PatientAge`,`patient_emr`.`sex` AS `PatientSex`,concat('Tent: ',ifnull(`bed_status`.`tent`,' '),'   Bed: ',ifnull(`bed_status`.`bed`,' '),'\n','List of symptoms: ',ifnull(`patient_history_asc`.`symptoms`,'none'),'\nOnset of symptoms: ',convert(`patient_emr`.`sym_date` using utf8),'\nDate admission: ',convert(`patient_emr`.`adm_date` using utf8),'\nLast test date: ',ifnull(`last_testresult`.`test_date`,' '),'   Result: ',ifnull(`last_testresult`.`result`,' '),'\nLast visit: ',ifnull(`last_zetesdc_msf`.`DateTime`,'Never visited')) AS `PatientTextInfo` from ((((`patient_emr` left join `last_zetesdc_msf` on((`last_zetesdc_msf`.`PatientID` = `patient_emr`.`patient_id`))) left join `patient_history_asc` on((`patient_history_asc`.`patient_id` = `patient_emr`.`patient_id`))) left join `bed_status` on((`last_zetesdc_msf`.`BedLocationID` = `bed_status`.`location_id`))) left join `last_testresult` on((`last_testresult`.`patient_id` = `patient_emr`.`patient_id`))) group by `patient_emr`.`patient_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-02 18:22:29
