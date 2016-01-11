-- MySQL dump 10.13  Distrib 5.6.24, for osx10.10 (x86_64)
--
-- Host: localhost    Database: sfc_youtube_db
-- ------------------------------------------------------
-- Server version	5.6.24

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
-- Table structure for table `je_translate`
--

DROP TABLE IF EXISTS `je_translate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `je_translate` (
  `japanese` varchar(30) DEFAULT NULL,
  `english` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `je_translate`
--

LOCK TABLES `je_translate` WRITE;
/*!40000 ALTER TABLE `je_translate` DISABLE KEYS */;
INSERT INTO `je_translate` VALUES ('面白い','funny'),('怖い','scary'),('怒り','anger'),('愛','love'),('驚き','surprise'),('悲しい','sad'),('癒し','comfort');
/*!40000 ALTER TABLE `je_translate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ke_translate`
--

DROP TABLE IF EXISTS `ke_translate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ke_translate` (
  `korean` varchar(30) DEFAULT NULL,
  `english` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ke_translate`
--

LOCK TABLES `ke_translate` WRITE;
/*!40000 ALTER TABLE `ke_translate` DISABLE KEYS */;
INSERT INTO `ke_translate` VALUES ('이상한','funny'),('무서운','scary'),('분노','anger'),('사랑','love'),('놀람','surprise'),('슬퍼','sad'),('위로','comfort');
/*!40000 ALTER TABLE `ke_translate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metas`
--

DROP TABLE IF EXISTS `metas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metas` (
  `meta_id` int(11) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metas`
--

LOCK TABLES `metas` WRITE;
/*!40000 ALTER TABLE `metas` DISABLE KEYS */;
INSERT INTO `metas` VALUES (1,'funny'),(2,'scary'),(3,'anger'),(4,'love'),(5,'surprise'),(6,'sad'),(7,'comfort');
/*!40000 ALTER TABLE `metas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_meta`
--

DROP TABLE IF EXISTS `video_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_meta` (
  `video_id` int(11) DEFAULT NULL,
  `meta_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_meta`
--

LOCK TABLES `video_meta` WRITE;
/*!40000 ALTER TABLE `video_meta` DISABLE KEYS */;
INSERT INTO `video_meta` VALUES (1,1),(2,1),(3,1),(4,2),(5,2),(6,3),(7,3),(8,3),(9,4),(10,4),(11,5),(12,5),(13,6),(14,6),(15,7),(16,7),(17,7);
/*!40000 ALTER TABLE `video_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videos` (
  `video_id` int(11) DEFAULT NULL,
  `url` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
INSERT INTO `videos` VALUES (1,'https://www.youtube.com/watch?v=aQYb84mItY4'),(2,'https://www.youtube.com/watch?v=96JlsT6pKPU'),(3,'https://www.youtube.com/watch?v=mWo1ipP2Hg0'),(4,'https://www.youtube.com/watch?v=VJPyY3TdEOc'),(5,'https://www.youtube.com/watch?v=S6XEHO861E4'),(6,'https://www.youtube.com/watch?v=5VN2SY8plLk'),(7,'https://www.youtube.com/watch?v=sukgBXxvggg'),(8,'https://www.youtube.com/watch?v=exAwwKRLUeA'),(9,'https://www.youtube.com/watch?v=dCPmL_MX9d4'),(10,'https://www.youtube.com/watch?v=OtT-eUPMmBg'),(11,'https://www.youtube.com/watch?v=ESco8GybHmw'),(12,'https://www.youtube.com/watch?v=EPPMxGhh3Dc'),(13,'https://www.youtube.com/watch?v=RQKDAdCpCsg'),(14,'https://www.youtube.com/watch?v=WEe9Z0YagOA'),(15,'https://www.youtube.com/watch?v=sUhW-HpbiGM'),(16,'https://www.youtube.com/watch?v=eM1UfDSznpY'),(17,'https://www.youtube.com/watch?v=Uv6akD0vGNU');
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-11 20:31:09
