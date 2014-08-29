-- MySQL dump 10.13  Distrib 5.5.37, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: hbbs
-- ------------------------------------------------------
-- Server version	5.5.37-1

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
-- Table structure for table `cache_event_listeners`
--

DROP TABLE IF EXISTS `cache_event_listeners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_event_listeners` (
  `eid` int(10) NOT NULL COMMENT 'event name id',
  `oid` int(10) NOT NULL COMMENT 'trigger object id',
  `lid` int(10) NOT NULL COMMENT 'listener name id',
  KEY `eid` (`eid`,`oid`),
  KEY `lid` (`lid`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_event_listeners_austin`
--

DROP TABLE IF EXISTS `cache_event_listeners_austin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_event_listeners_austin` (
  `eid` int(10) NOT NULL COMMENT 'event name id',
  `oid` int(10) NOT NULL COMMENT 'trigger object id',
  `lid` int(10) NOT NULL COMMENT 'listener name id',
  KEY `eid` (`eid`,`oid`),
  KEY `lid` (`lid`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_event_listeners_dallas`
--

DROP TABLE IF EXISTS `cache_event_listeners_dallas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_event_listeners_dallas` (
  `eid` int(10) NOT NULL COMMENT 'event name id',
  `oid` int(10) NOT NULL COMMENT 'trigger object id',
  `lid` int(10) NOT NULL COMMENT 'listener name id',
  KEY `eid` (`eid`,`oid`),
  KEY `lid` (`lid`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_names`
--

DROP TABLE IF EXISTS `cache_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_names` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'cache id',
  `name` varchar(255) NOT NULL COMMENT 'cache key / event name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_tree`
--

DROP TABLE IF EXISTS `cache_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_tree` (
  `pid` int(10) NOT NULL COMMENT 'parent cache id',
  `cid` int(10) NOT NULL COMMENT 'child cache id',
  KEY `pid` (`pid`),
  KEY `cid` (`cid`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_tree_austin`
--

DROP TABLE IF EXISTS `cache_tree_austin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_tree_austin` (
  `pid` int(10) NOT NULL COMMENT 'parent cache id',
  `cid` int(10) NOT NULL COMMENT 'child cache id',
  KEY `pid` (`pid`),
  KEY `cid` (`cid`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_tree_dallas`
--

DROP TABLE IF EXISTS `cache_tree_dallas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_tree_dallas` (
  `pid` int(10) NOT NULL COMMENT 'parent cache id',
  `cid` int(10) NOT NULL COMMENT 'child cache id',
  KEY `pid` (`pid`),
  KEY `cid` (`cid`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-29 12:42:06
