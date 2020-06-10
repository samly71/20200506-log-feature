-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: log_feature
-- ------------------------------------------------------
-- Server version	5.1.73

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
-- Table structure for table `feature`
--

DROP TABLE IF EXISTS `feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feature` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `file_dir` varchar(64) NOT NULL,
  `warn_log_level` varchar(64) NOT NULL,
  `log_feature` varchar(64) NOT NULL,
  `remarks` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feature`
--

LOCK TABLES `feature` WRITE;
/*!40000 ALTER TABLE `feature` DISABLE KEYS */;
INSERT INTO `feature` VALUES (1,'/var/log/mysql/error.log','critical','Refuse','mysql_criticalæ•°æ®åº“æ—¥å¿—'),(2,'/var/log/mysql/error.log','errors','warn','mysql_criticalæ•°æ®åº“æ—¥å¿—'),(3,'/var/log/mysql/error.log','errors','timeout','mysql_criticalæ•°æ®åº“æ—¥å¿—'),(4,'/var/log/mysql/error.log','errors','error','mysql_criticalæ•°æ®åº“æ—¥å¿—'),(5,'/var/log/syslog','critical','critical medium error','ceph_criticalç¡¬ç›˜åé“'),(6,'/var/ceph/ceph.log','critical','slow request','ceph_æœ‰ç¡¬ç›˜_IOè¿‡é«˜'),(7,'/var/log/messages','critical','fatal','centos_æ—¥å¿—å‘Šè­¦fatal'),(8,'/var/log/messages','errors','error','centos_æ—¥å¿—å‘Šè­¦error'),(9,'var/log/syslog','critical','fatal','ubuntu_æ—¥å¿—å‘Šè­¦fatal'),(10,'var/log/syslog','critical','error','ubuntu_æ—¥å¿—å‘Šè­¦error'),(11,'/var/log/kernel.log','critical','fatal','ubuntu_æ—¥å¿—å‘Šè­¦fatal'),(12,'/var/log/kernel.log','errors','error','ubuntu_æ—¥å¿—å‘Šè­¦error'),(13,'/var/log/syslog','critical','critical','ubuntu_æ—¥å¿—å‘Šè­¦critical'),(14,'/var/log/dmesg','critical','Out of memory','æ—¥å¿—å‘Šè­¦Out of memory'),(15,'/var/log/dmesg','errors','error','æ—¥å¿—å‘Šè­¦error'),(16,'/var/log/dmesg','errors','Error','æ—¥å¿—å‘Šè­¦error'),(17,'/var/log/dmesg','errors','fatal','æ—¥å¿—å‘Šè­¦fatal'),(18,'/var/log/php*.log','critical','error','php å¼‚å¸¸ error'),(19,'/var/log/php*.log','critical','fatal','php å¼‚å¸¸ fatal'),(20,'/var/log/php*.log','critical','fatal','php å¼‚å¸¸ fatal'),(21,'/var/log/apache2/error.log','critical','emerg','apacheå¼‚å¸¸error'),(22,'/var/log/apache2/error.log','critical','error','apacheå¼‚å¸¸error'),(23,'/var/log/nginx/logs/error.log','critical','error','nginxå¼‚å¸¸error'),(24,'/var/log/nginx/logs/error.log','critical','emerg','nginxå¼‚å¸¸emerg');
/*!40000 ALTER TABLE `feature` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-06 12:41:59
