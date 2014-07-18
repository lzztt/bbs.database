-- MySQL dump 10.13  Distrib 5.5.37, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: finance
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
-- Table structure for table `fund_categories`
--

DROP TABLE IF EXISTS `fund_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fund_categories` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund_categories`
--

LOCK TABLES `fund_categories` WRITE;
/*!40000 ALTER TABLE `fund_categories` DISABLE KEYS */;
INSERT INTO `fund_categories` VALUES (1,'Health'),(2,'Industrials'),(3,'Consumer Cyclical'),(4,'Technology'),(5,'Large Blend'),(6,'Financial'),(7,'Large Growth'),(8,'Mid-Cap Value'),(9,'Large Value'),(10,'Natural Resources'),(11,'Utilities'),(12,'Japan Stock'),(13,'Mid-Cap Blend'),(14,'Mid-Cap Growth'),(15,'Small Blend'),(16,'Consumer Defensive'),(17,'Small Growth'),(18,'Aggressive Allocation'),(19,'Foreign Small/Mid Growth'),(20,'World Stock'),(21,'Communications'),(22,'Moderate Allocation'),(23,'Equity Energy'),(24,'Real Estate'),(25,'Global Real Estate'),(26,'Convertibles'),(27,'Foreign Large Growth'),(28,'Retirement Income'),(29,'Target Date 2036-2040'),(30,'Target Date 2031-2035'),(31,'Diversified Pacific/Asia'),(32,'Foreign Large Blend'),(33,'Target Date 2026-2030'),(34,'Europe Stock'),(35,'Target Date 2021-2025'),(36,'Long Government'),(37,'High Yield Bond'),(38,'Emerging Markets Bond'),(39,'Target Date 2016-2020'),(40,'World Allocation'),(41,'Conservative Allocation'),(42,'Target Date 2011-2015'),(43,'Target Date 2000-2010'),(44,'Corporate Bond'),(45,'China Region'),(46,'Muni California Long'),(47,'Muni National Long'),(48,'Multisector Bond'),(49,'Muni Single State Long'),(50,'Muni Pennsylvania'),(51,'Muni Massachusetts'),(52,'Muni Ohio'),(53,'Muni New Jersey'),(54,'Muni New York Long'),(55,'Muni Single State Interm'),(56,'Muni National Interm'),(57,'Intermediate-Term Bond'),(58,'Muni Minnesota'),(59,'Intermediate Government'),(60,'Muni National Short'),(61,'Short-Term Bond'),(62,'Inflation-Protected Bond'),(63,'Pacific/Asia ex-Japan Stk'),(64,'Muni Single State Short'),(65,'Diversified Emerging Mkts'),(66,'Short Government'),(67,'Ultrashort Bond'),(68,'Equity Precious Metals');
/*!40000 ALTER TABLE `fund_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fund_families`
--

DROP TABLE IF EXISTS `fund_families`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fund_families` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund_families`
--

LOCK TABLES `fund_families` WRITE;
/*!40000 ALTER TABLE `fund_families` DISABLE KEYS */;
INSERT INTO `fund_families` VALUES (1,'Fidelity');
/*!40000 ALTER TABLE `fund_families` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funds`
--

DROP TABLE IF EXISTS `funds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funds` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `symbol` char(5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `fid` int(10) NOT NULL COMMENT 'family id',
  `cid` int(10) NOT NULL COMMENT 'category id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funds`
--

LOCK TABLES `funds` WRITE;
/*!40000 ALTER TABLE `funds` DISABLE KEYS */;
INSERT INTO `funds` VALUES (1,'FBIOX','Fidelity Fund Pick Select Biotechnology Portfolio',1,1),(2,'FSPHX','Fidelity Fund Pick Select Health Care Portfolio',1,1),(3,'FPHAX','Fidelity Fund Pick Select Pharmaceuticals Portfolio',1,1),(4,'FSAIX','Fidelity Fund Pick Select Air Transportation Portfolio',1,2),(5,'FBMPX','Fidelity Fund Pick Select Multimedia Portfolio',1,3),(6,'FSHOX','Fidelity Fund Pick Select Construction and Housing Portfolio',1,3),(7,'FSCSX','Fidelity Fund Pick Select Software and Computer Services Portfolio',1,4),(8,'FSRFX','Fidelity Fund Pick Select Transportation Portfolio',1,2),(9,'FLCSX','Fidelity Fund Pick Fidelity Large Cap Stock Fund',1,5),(10,'FBSOX','Fidelity Fund Pick Select IT Services Portfolio',1,4),(11,'FSVLX','Fidelity Fund Pick Select Consumer Finance Portfolio',1,6),(12,'FSRPX','Fidelity Fund Pick Select Retailing Portfolio',1,3),(13,'FGRTX','Fidelity Mega Cap Stock Fund',1,5),(14,'FSPCX','Fidelity Fund Pick Select Insurance Portfolio',1,6),(15,'FNCMX','Fidelity Fund Pick Fidelity Nasdaq Composite Index Fund',1,7),(16,'FGRIX','Fidelity Fund Pick Fidelity Growth & Income Portfolio',1,5),(17,'FSCPX','Fidelity Fund Pick Select Consumer Discretionary Portfolio',1,3),(18,'FMILX','Fidelity Fund Pick Fidelity New Millennium Fund',1,7),(19,'FSMVX','Fidelity Fund Pick Fidelity Mid Cap Value Fund',1,8),(20,'FLVEX','Fidelity Large Cap Value Enhanced Index Fund',1,9),(21,'FDVLX','Fidelity Fund Pick Fidelity Value Fund',1,8),(22,'FSCHX','Fidelity Fund Pick Select Chemicals Portfolio',1,10),(23,'FSRBX','Fidelity Fund Pick Select Banking Portfolio',1,6),(24,'FBGRX','Fidelity Blue Chip Growth Fund',1,7),(25,'FDLSX','Fidelity Fund Pick Select Leisure Portfolio',1,3),(26,'FSUTX','Fidelity Fund Pick Select Utilities Portfolio',1,11),(27,'FDCAX','Fidelity Fund Pick Fidelity Capital Appreciation Fund',1,7),(28,'FLCEX','Fidelity Fund Pick Fidelity Large Cap Core Enhanced Index Fund',1,5),(29,'FOCPX','Fidelity OTC Portfolio',1,7),(30,'FVDFX','Fidelity Value Discovery Fund',1,9),(31,'FSDAX','Fidelity Fund Pick Select Defense and Aerospace Portfolio',1,2),(32,'FSLVX','Fidelity Fund Pick Fidelity Stock Selector Large Cap Value Fund',1,9),(33,'FUSVX','Spartan 500 Index Fund - Fidelity Advantage Class',1,5),(34,'FUSEX','Fidelity Fund Pick Spartan 500 Index Fund - Investor Class',1,5),(35,'FJSCX','Fidelity Fund Pick Fidelity Japan Smaller Companies Fund',1,12),(36,'FSTVX','Spartan Total Market Index Fund - Fidelity Advantage Class',1,5),(37,'FDFFX','Fidelity Independence Fund',1,7),(38,'FMEIX','Fidelity Fund Pick Fidelity Mid Cap Enhanced Index Fund',1,13),(39,'FSTMX','Fidelity Fund Pick Spartan Total Market Index Fund - Investor Class',1,5),(40,'FLVCX','Fidelity Leveraged Company Stock Fund',1,13),(41,'FLGEX','Fidelity Large Cap Growth Enhanced Index Fund',1,7),(42,'FDSVX','Fidelity Growth Discovery Fund',1,7),(43,'FSELX','Fidelity Fund Pick Select Electronics Portfolio',1,4),(44,'FVSAX','Strategic Advisers Value Fund',1,9),(45,'FSLBX','Fidelity Fund Pick Select Brokerage and Investment Management Portfolio',1,6),(46,'FMCSX','Fidelity Fund Pick Fidelity Mid-Cap Stock Fund',1,14),(47,'FCNTX','Fidelity Fund Pick Fidelity Contrafund',1,7),(48,'FTRNX','Fidelity Trend Fund',1,7),(49,'FTQGX','Fidelity Fund Pick Fidelity Focused Stock Fund',1,7),(50,'FSEVX','Spartan Extended Market Index Fund - Fidelity Advantage Class',1,13),(51,'FSEMX','Fidelity Fund Pick Spartan Extended Market Index Fund - Investor Class',1,13),(52,'FCPEX','Fidelity Fund Pick Fidelity Small Cap Enhanced Index Fund',1,15),(53,'FCYIX','Fidelity Fund Pick Select Industrials Portfolio',1,2),(54,'FDSSX','Fidelity Stock Selector All Cap Fund',1,7),(55,'FIUIX','Fidelity Fund Pick Fidelity Telecom and Utilities Fund',1,11),(56,'FLPSX','Fidelity Fund Pick Fidelity Low-Priced Stock Fund',1,8),(57,'FDFAX','Fidelity Fund Pick Select Consumer Staples Portfolio',1,16),(58,'FCPGX','Fidelity Fund Pick Fidelity Small Cap Growth Fund',1,17),(59,'FFIDX','Fidelity Fund',1,7),(60,'FSPTX','Fidelity Fund Pick Select Technology Portfolio',1,4),(61,'FSDIX','Fidelity Fund Pick Fidelity Strategic Dividend & Income Fund',1,18),(62,'FDCPX','Fidelity Fund Pick Select Computers Portfolio',1,4),(63,'FSCOX','Fidelity Fund Pick Fidelity International Small Cap Opportunities Fund',1,19),(64,'FWWFX','Fidelity Fund Pick Fidelity Worldwide Fund',1,20),(65,'FFNOX','Fidelity Four-in-One Index Fund',1,18),(66,'FWRLX','Fidelity Fund Pick Select Wireless Portfolio',1,21),(67,'FDEGX','Fidelity Fund Pick Fidelity Growth Strategies Fund',1,14),(68,'FBALX','Fidelity Fund Pick Fidelity Balanced Fund',1,22),(69,'FPURX','Fidelity Fund Pick Fidelity Puritan Fund',1,22),(70,'FAMRX','Fidelity Asset Manager 85%',1,18),(71,'FSNGX','Fidelity Fund Pick Select Natural Gas Portfolio',1,23),(72,'FRESX','Fidelity Fund Pick Fidelity Real Estate Investment Portfolio',1,24),(73,'FIREX','Fidelity Fund Pick Fidelity International Real Estate Fund',1,25),(74,'FSDPX','Fidelity Fund Pick Select Materials Portfolio',1,10),(75,'FCVSX','Fidelity Fund Pick Fidelity Convertible Securities Fund',1,26),(76,'FRIFX','Fidelity Fund Pick Fidelity Real Estate Income Fund',1,24),(77,'FASGX','Fidelity Asset Manager 70%',1,22),(78,'FIVFX','Fidelity Fund Pick Fidelity International Capital Appreciation Fund',1,27),(79,'FIXRX','Fidelity Income Replacement 2042 Fund',1,28),(80,'FFFFX','Fidelity Freedom 2040 Fund',1,29),(81,'FFTHX','Fidelity Freedom 2035 Fund',1,30),(82,'FISMX','Fidelity Fund Pick Fidelity International Small Cap Fund',1,19),(83,'FIRWX','Fidelity Income Replacement 2040 Fund',1,28),(84,'FPBFX','Fidelity Fund Pick Fidelity Pacific Basin Fund',1,31),(85,'FOSFX','Fidelity Fund Pick Fidelity Overseas Fund',1,32),(86,'FIRVX','Fidelity Income Replacement 2038 Fund',1,28),(87,'FSTCX','Fidelity Fund Pick Select Telecommunications Portfolio',1,21),(88,'FIRUX','Fidelity Income Replacement 2036 Fund',1,28),(89,'FSANX','Fidelity Asset Manager 60%',1,22),(90,'FFFEX','Fidelity Freedom 2030 Fund',1,33),(91,'FIRSX','Fidelity Income Replacement 2034 Fund',1,28),(92,'FIGFX','Fidelity Fund Pick Fidelity International Growth Fund',1,27),(93,'FIEUX','Fidelity Fund Pick Fidelity Europe Fund',1,34),(94,'FIRRX','Fidelity Income Replacement 2032 Fund',1,28),(95,'FFTWX','Fidelity Freedom 2025 Fund',1,35),(96,'FIRQX','Fidelity Income Replacement 2030 Fund',1,28),(97,'FIENX','Fidelity International Enhanced Index Fund',1,32),(98,'FSENX','Fidelity Fund Pick Select Energy Portfolio',1,23),(99,'FDIVX','Fidelity Fund Pick Fidelity Diversified International Fund',1,32),(100,'FIRPX','Fidelity Income Replacement 2028 Fund',1,28),(101,'FLBAX','Spartan Long-Term Treasury Bond Index Fund - Fidelity Advantage Class',1,36),(102,'FAGIX','Fidelity Fund Pick Fidelity Capital & Income Fund',1,37),(103,'FIGRX','Fidelity Fund Pick Fidelity International Discovery Fund',1,32),(104,'FNMIX','Fidelity Fund Pick Fidelity New Markets Income Fund',1,38),(105,'FASMX','Fidelity Asset Manager 50%',1,22),(106,'FLBIX','Fidelity Fund Pick Spartan Long-Term Treasury Bond Index Fund - Investor Class',1,36),(107,'FIROX','Fidelity Income Replacement 2026 Fund',1,28),(108,'SPHIX','Fidelity Fund Pick Fidelity High Income Fund',1,37),(109,'FSIVX','Spartan International Index Fund - Fidelity Advantage Class',1,32),(110,'FSIIX','Fidelity Fund Pick Spartan International Index Fund - Investor Class',1,32),(111,'FIRNX','Fidelity Income Replacement 2024 Fund',1,28),(112,'FGHNX','Fidelity Global High Income Fund',1,37),(113,'FFFDX','Fidelity Freedom 2020 Fund',1,39),(114,'FGBLX','Fidelity Fund Pick Fidelity Global Balanced Fund',1,40),(115,'FFANX','Fidelity Asset Manager 40%',1,41),(116,'FFVFX','Fidelity Freedom 2015 Fund',1,42),(117,'FIRMX','Fidelity Income Replacement 2022 Fund',1,28),(118,'FFFCX','Fidelity Freedom 2010 Fund',1,43),(119,'FCBFX','Fidelity Fund Pick Fidelity Corporate Bond Fund',1,44),(120,'FHKCX','Fidelity Fund Pick Fidelity China Region Fund',1,45),(121,'FNARX','Fidelity Fund Pick Select Natural Resources Portfolio',1,23),(122,'FTANX','Fidelity Asset Manager 30%',1,41),(123,'FCTFX','Fidelity Fund Pick Fidelity California Municipal Income Fund',1,46),(124,'FTIEX','Fidelity Fund Pick Fidelity Total International Equity Fund',1,32),(125,'FIRLX','Fidelity Income Replacement 2020 Fund',1,28),(126,'FTABX','Fidelity Fund Pick Fidelity Tax-Free Bond Fund',1,47),(127,'FHIGX','Fidelity Fund Pick Fidelity Municipal Income Fund',1,47),(128,'FFFVX','Fidelity Freedom 2005 Fund',1,43),(129,'FOCFX','Fidelity Municipal Income 2021 Fund',1,47),(130,'FSICX','Fidelity Fund Pick Fidelity Strategic Income Fund',1,48),(131,'FSAZX','Fidelity Arizona Municipal Income Fund',1,49),(132,'FPXTX','Fidelity Fund Pick Fidelity Pennsylvania Municipal Income Fund',1,50),(133,'FDMMX','Fidelity Fund Pick Fidelity Massachusetts Municipal Income Fund',1,51),(134,'FOHFX','Fidelity Fund Pick Fidelity Ohio Municipal Income Fund',1,52),(135,'FIRKX','Fidelity Income Replacement 2018 Fund',1,28),(136,'FNJHX','Fidelity Fund Pick Fidelity New Jersey Municipal Income Fund',1,53),(137,'FTFMX','Fidelity Fund Pick Fidelity New York Municipal Income Fund',1,54),(138,'FMHTX','Fidelity Fund Pick Fidelity Michigan Municipal Income Fund',1,55),(139,'FMCFX','Fidelity Municipal Income 2019 Fund',1,56),(140,'FTBFX','Fidelity Fund Pick Fidelity Total Bond Fund',1,57),(141,'FICNX','Fidelity Fund Pick Fidelity Connecticut Municipal Income Fund',1,55),(142,'FBNDX','Fidelity Fund Pick Fidelity Investment Grade Bond Fund',1,57),(143,'SMDMX','Fidelity Maryland Municipal Income Fund',1,55),(144,'FLTMX','Fidelity Fund Pick Fidelity Intermediate Municipal Income Fund',1,56),(145,'FIMIX','Fidelity Minnesota Municipal Income Fund',1,58),(146,'FIBAX','Spartan Intermediate Treasury Bond Index Fund - Fidelity Advantage Class',1,59),(147,'FIBIX','Fidelity Fund Pick Spartan Intermediate Treasury Bond Index Fund - Investor Class',1,59),(148,'FSITX','Spartan U.S. Bond Index Fund - Fidelity Advantage Class',1,57),(149,'FBIDX','Fidelity Fund Pick Spartan U.S. Bond Index Fund - Investor Class',1,57),(150,'FMIFX','Fidelity Municipal Income 2017 Fund',1,60),(151,'FJRLX','Fidelity Fund Pick Fidelity Limited Term Bond Fund',1,61),(152,'FGMNX','Fidelity Fund Pick Fidelity GNMA Fund',1,59),(153,'FINPX','Fidelity Inflation-Protected Bond Fund',1,62),(154,'FSEAX','Fidelity Fund Pick Fidelity Emerging Asia Fund',1,63),(155,'FGOVX','Fidelity Fund Pick Fidelity Government Income Fund',1,59),(156,'FCSTX','Fidelity Fund Pick Fidelity California Limited Term Tax-Free Bond Fund',1,64),(157,'FSTFX','Fidelity Fund Pick Fidelity Limited Term Municipal Income Fund',1,60),(158,'FSTGX','Fidelity Fund Pick Fidelity Intermediate Government Income Fund',1,59),(159,'FEMEX','Fidelity Emerging Europe, Middle East, Africa (EMEA) Fund',1,65),(160,'FSHBX','Fidelity Fund Pick Fidelity Short-Term Bond Fund',1,61),(161,'FFXSX','Fidelity Fund Pick Fidelity Limited Term Government Fund',1,66),(162,'FSBAX','Spartan Short-Term Treasury Bond Index Fund - Fidelity Advantage Class',1,66),(163,'FSBIX','Spartan Short-Term Treasury Bond Index Fund - Investor Class',1,66),(164,'FCNVX','Fidelity Conservative Income Bond Fund - Institutional Class',1,67),(165,'FCONX','Fidelity Fund Pick Fidelity Conservative Income Bond Fund',1,67),(166,'FEMKX','Fidelity Fund Pick Fidelity Emerging Markets Fund',1,65),(167,'FSAGX','Fidelity Fund Pick Select Gold Portfolio',1,68);
/*!40000 ALTER TABLE `funds` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-17  0:23:44
