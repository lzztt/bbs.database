-- mysqldump -u root -p --opt --no-data  --default-character-set=utf8 --set-charset hbbs > ~/www.houstonbbs.com/db/schema.my.sql
--
-- MySQL dump 10.13  Distrib 5.5.33, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: hbbs
-- ------------------------------------------------------
-- Server version	5.5.33-1

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
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activities` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `start_time` int(11) unsigned DEFAULT NULL,
  `end_time` int(11) unsigned DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`nid`),
  KEY `start_time` (`start_time`),
  KEY `end_time` (`end_time`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ad_payments`
--

DROP TABLE IF EXISTS `ad_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad_payments` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ad_id` int(10) NOT NULL,
  `amount` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ad_id` (`ad_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ad_types`
--

DROP TABLE IF EXISTS `ad_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad_types` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ads`
--

DROP TABLE IF EXISTS `ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type_id` int(10) NOT NULL,
  `exp_time` int(11) NOT NULL,
  `email` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exp_time` (`exp_time`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nid` int(10) unsigned DEFAULT NULL,
  `uid` int(10) unsigned DEFAULT NULL,
  `tid` int(10) DEFAULT NULL COMMENT 'tag id',
  `body` text,
  `hash` int(10) unsigned DEFAULT NULL COMMENT 'crc32 value for body',
  `create_time` int(11) unsigned DEFAULT NULL,
  `last_modified_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nid` (`nid`),
  KEY `uid` (`uid`),
  KEY `last_modified_time` (`last_modified_time`),
  KEY `tid` (`tid`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB AUTO_INCREMENT=110662 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `config_groups`
--

DROP TABLE IF EXISTS `config_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(31) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `configs`
--

DROP TABLE IF EXISTS `configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL COMMENT 'config group id',
  `var` varchar(31) NOT NULL,
  `val` varchar(31) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `comment` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `var` (`var`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='site configuration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ff_attendees`
--

DROP TABLE IF EXISTS `ff_attendees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ff_attendees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `sex` tinyint(1) NOT NULL,
  `age` tinyint(4) NOT NULL,
  `email` varchar(60) NOT NULL,
  `phone` varchar(60) DEFAULT NULL,
  `guests` tinyint(4) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  `cid` int(10) unsigned DEFAULT NULL COMMENT 'comment id',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0: deleted; 1: show',
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `cid` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=320 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ff_comments`
--

DROP TABLE IF EXISTS `ff_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ff_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `body` text NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ff_counts`
--

DROP TABLE IF EXISTS `ff_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ff_counts` (
  `sid` varchar(32) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`sid`),
  KEY `count` (`count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ff_subscribers`
--

DROP TABLE IF EXISTS `ff_subscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ff_subscribers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(60) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nid` int(10) unsigned DEFAULT NULL,
  `cid` int(10) unsigned DEFAULT NULL,
  `name` varchar(60) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `height` smallint(5) unsigned NOT NULL COMMENT 'height in pixels',
  `width` smallint(5) unsigned NOT NULL COMMENT 'width in pixels',
  PRIMARY KEY (`id`),
  KEY `nid` (`nid`),
  KEY `cid` (`cid`),
  KEY `width` (`width`),
  KEY `height` (`height`)
) ENGINE=InnoDB AUTO_INCREMENT=41742 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `images_deleted`
--

DROP TABLE IF EXISTS `images_deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images_deleted` (
  `id` int(10) unsigned NOT NULL COMMENT 'fid in files table',
  `path` varchar(255) NOT NULL,
  `status` tinyint(4) unsigned DEFAULT NULL COMMENT 'NULL: new, 0: success, 1: error'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lottery_results`
--

DROP TABLE IF EXISTS `lottery_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lottery_results` (
  `uid` int(10) NOT NULL,
  `points` int(10) NOT NULL,
  `time` int(11) NOT NULL,
  `code` varchar(60) NOT NULL,
  KEY `uid` (`uid`),
  KEY `time` (`time`),
  KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lottery_users`
--

DROP TABLE IF EXISTS `lottery_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lottery_users` (
  `uid` int(10) unsigned NOT NULL,
  `username` varchar(60) NOT NULL,
  `points` float unsigned NOT NULL,
  `points1` float unsigned NOT NULL DEFAULT '0',
  `points2` float unsigned NOT NULL DEFAULT '0',
  `points3` float unsigned NOT NULL DEFAULT '0',
  `points4` float unsigned NOT NULL DEFAULT '0',
  `points5` float unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `points` (`points`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mails`
--

DROP TABLE IF EXISTS `mails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mails` (
  `uid` int(10) NOT NULL DEFAULT '0',
  `username` varchar(60) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `unsubscribe` tinyint(4) DEFAULT NULL,
  KEY `status` (`status`),
  KEY `unsubscribe` (`unsubscribe`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `moderators`
--

DROP TABLE IF EXISTS `moderators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moderators` (
  `cid` int(11) unsigned NOT NULL,
  `uid` int(11) unsigned NOT NULL,
  UNIQUE KEY `cid_uid` (`cid`,`uid`),
  KEY `cid` (`cid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `node_yellowpages`
--

DROP TABLE IF EXISTS `node_yellowpages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_yellowpages` (
  `nid` int(10) unsigned NOT NULL,
  `address` varchar(180) DEFAULT NULL,
  `phone` varchar(60) DEFAULT NULL,
  `fax` varchar(60) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `website` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nodes`
--

DROP TABLE IF EXISTS `nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nodes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT NULL,
  `tid` int(10) unsigned DEFAULT NULL COMMENT 'tag id',
  `create_time` int(11) unsigned DEFAULT NULL,
  `last_modified_time` int(11) unsigned DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `body` longtext,
  `hash` int(10) unsigned DEFAULT NULL COMMENT 'crc32 value for body',
  `view_count` int(10) unsigned DEFAULT '0',
  `weight` tinyint(3) unsigned DEFAULT '0' COMMENT 'sort condition, 1 > 0 > NULL. NULL will be the last, so set defalt to be 0',
  `status` tinyint(4) unsigned DEFAULT NULL COMMENT '1: published, 0:unpublished',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `view_count` (`view_count`),
  KEY `weight` (`weight`),
  KEY `status` (`status`),
  KEY `tid` (`tid`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB AUTO_INCREMENT=38998 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `poll_votes`
--

DROP TABLE IF EXISTS `poll_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll_votes` (
  `nid` int(10) unsigned DEFAULT NULL,
  `uid` int(10) unsigned DEFAULT NULL,
  `vote` tinyint(1) unsigned DEFAULT NULL,
  KEY `nid` (`nid`),
  KEY `uid` (`uid`),
  KEY `vote` (`vote`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `priv_msgs`
--

DROP TABLE IF EXISTS `priv_msgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_msgs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from_uid` int(10) unsigned DEFAULT NULL,
  `to_uid` int(10) unsigned DEFAULT NULL,
  `msg_id` int(10) unsigned DEFAULT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  `body` text,
  `is_new` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'perTopicResult: 0(0,0):none, 1(0,1):toUIDDelete, 2(1,0):fromUIDDelete, 3(1,1):bothDelete; action: toDelete: isDelete+=1, fromDelete:isDelete+=2*1',
  PRIMARY KEY (`id`),
  KEY `from_uid` (`from_uid`),
  KEY `to_uid` (`to_uid`),
  KEY `msg_mid` (`msg_id`),
  KEY `time` (`time`),
  KEY `is_new` (`is_new`),
  KEY `is_deleted` (`is_deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=152910 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(32) NOT NULL,
  `data` text NOT NULL,
  `mtime` int(11) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL COMMENT 'User ID',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `mtime` (`mtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spam_words`
--

DROP TABLE IF EXISTS `spam_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spam_words` (
  `word` varchar(30) NOT NULL,
  `last_hit_time` int(11) unsigned NOT NULL,
  KEY `word` (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spammers`
--

DROP TABLE IF EXISTS `spammers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spammers` (
  `email` varchar(30) NOT NULL COMMENT 'blocked emails for new user registration',
  `ip` int(10) unsigned NOT NULL COMMENT 'spammer IP as integer',
  `time` int(11) unsigned NOT NULL COMMENT 'time when spammer get banned',
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'tag id',
  `name` varchar(60) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `parent` int(10) unsigned DEFAULT NULL COMMENT 'parent tag id',
  `root` int(10) unsigned DEFAULT NULL COMMENT 'root tag id',
  `weight` int(10) unsigned DEFAULT NULL COMMENT 'order weight',
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  KEY `root` (`root`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(60) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `msn` varchar(32) DEFAULT NULL,
  `qq` varchar(32) DEFAULT NULL,
  `website` varchar(60) DEFAULT NULL,
  `firstname` varchar(15) DEFAULT NULL,
  `lastname` varchar(15) DEFAULT NULL,
  `sex` tinyint(1) unsigned DEFAULT NULL COMMENT '0: female; 1: male;',
  `birthday` int(8) unsigned DEFAULT NULL,
  `location` varchar(32) DEFAULT NULL,
  `occupation` varchar(32) DEFAULT NULL,
  `interests` varchar(255) DEFAULT NULL,
  `favorite_quotation` varchar(255) DEFAULT NULL,
  `relationship` tinyint(4) unsigned DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `create_time` int(11) unsigned DEFAULT NULL,
  `last_access_time` int(11) unsigned DEFAULT NULL,
  `last_access_ip` int(10) unsigned DEFAULT NULL COMMENT 'IP as Integer',
  `status` tinyint(4) unsigned DEFAULT NULL COMMENT 'NULL: new user; 0: deleted; 1: active;',
  `timezone` int(11) DEFAULT NULL,
  `avatar` varchar(32) DEFAULT NULL,
  `type` tinyint(4) unsigned DEFAULT NULL,
  `role` tinyint(4) unsigned DEFAULT NULL,
  `badge` int(10) unsigned DEFAULT NULL COMMENT 'badge id, (0~99 system badge, 100~* user uploaded badge)',
  `points` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_unique` (`username`),
  KEY `email` (`email`),
  KEY `status` (`status`),
  KEY `username` (`username`),
  KEY `password` (`password`),
  KEY `last_access_time` (`last_access_time`),
  KEY `type` (`type`),
  KEY `role` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=14408 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `yp_ratings`
--

DROP TABLE IF EXISTS `yp_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yp_ratings` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `rating` tinyint(1) unsigned DEFAULT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`nid`,`uid`),
  KEY `nid` (`nid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-13 21:54:33
