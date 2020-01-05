-- MySQL dump 10.14  Distrib 5.5.57-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: gitinsightsdb
-- ------------------------------------------------------
-- Server version	5.5.57-MariaDB

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
-- Table structure for table `auth_group`
--

DROP DATABASE IF EXISTS gitinsightsdb;
CREATE DATABASE gitinsightsdb;
USE gitinsightsdb;

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add owner',1,'add_owner'),(2,'Can change owner',1,'change_owner'),(3,'Can delete owner',1,'delete_owner'),(4,'Can view owner',1,'view_owner'),(5,'Can add user',2,'add_user'),(6,'Can change user',2,'change_user'),(7,'Can delete user',2,'delete_user'),(8,'Can view user',2,'view_user'),(9,'Can add repo',3,'add_repo'),(10,'Can change repo',3,'change_repo'),(11,'Can delete repo',3,'delete_repo'),(12,'Can view repo',3,'view_repo'),(13,'Can add commit',4,'add_commit'),(14,'Can change commit',4,'change_commit'),(15,'Can delete commit',4,'delete_commit'),(16,'Can view commit',4,'view_commit'),(17,'Can add org',5,'add_org'),(18,'Can change org',5,'change_org'),(19,'Can delete org',5,'delete_org'),(20,'Can view org',5,'view_org'),(21,'Can add language repo',6,'add_languagerepo'),(22,'Can change language repo',6,'change_languagerepo'),(23,'Can delete language repo',6,'delete_languagerepo'),(24,'Can view language repo',6,'view_languagerepo'),(25,'Can add commit file',7,'add_commitfile'),(26,'Can change commit file',7,'change_commitfile'),(27,'Can delete commit file',7,'delete_commitfile'),(28,'Can view commit file',7,'view_commitfile'),(29,'Can add team',8,'add_team'),(30,'Can change team',8,'change_team'),(31,'Can delete team',8,'delete_team'),(32,'Can view team',8,'view_team'),(33,'Can add issue',9,'add_issue'),(34,'Can change issue',9,'change_issue'),(35,'Can delete issue',9,'delete_issue'),(36,'Can view issue',9,'view_issue'),(37,'Can add log entry',10,'add_logentry'),(38,'Can change log entry',10,'change_logentry'),(39,'Can delete log entry',10,'delete_logentry'),(40,'Can view log entry',10,'view_logentry'),(41,'Can add permission',11,'add_permission'),(42,'Can change permission',11,'change_permission'),(43,'Can delete permission',11,'delete_permission'),(44,'Can view permission',11,'view_permission'),(45,'Can add group',12,'add_group'),(46,'Can change group',12,'change_group'),(47,'Can delete group',12,'delete_group'),(48,'Can view group',12,'view_group'),(49,'Can add user',13,'add_user'),(50,'Can change user',13,'change_user'),(51,'Can delete user',13,'delete_user'),(52,'Can view user',13,'view_user'),(53,'Can add content type',14,'add_contenttype'),(54,'Can change content type',14,'change_contenttype'),(55,'Can delete content type',14,'delete_contenttype'),(56,'Can view content type',14,'view_contenttype'),(57,'Can add session',15,'add_session'),(58,'Can change session',15,'change_session'),(59,'Can delete session',15,'delete_session'),(60,'Can view session',15,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_commit`
--

DROP TABLE IF EXISTS `core_commit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_commit` (
  `hash` varchar(45) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `branch` varchar(45) NOT NULL,
  `repo_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`hash`),
  UNIQUE KEY `core_commit_hash_repo_id_c5e1f6f7_uniq` (`hash`,`repo_id`),
  KEY `core_commit_repo_id_11fd001b_fk_core_repo_id` (`repo_id`),
  KEY `core_commit_user_id_e74ebf0e_fk_core_user_id` (`user_id`),
  CONSTRAINT `core_commit_user_id_e74ebf0e_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`),
  CONSTRAINT `core_commit_repo_id_11fd001b_fk_core_repo_id` FOREIGN KEY (`repo_id`) REFERENCES `core_repo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_commit`
--

LOCK TABLES `core_commit` WRITE;
/*!40000 ALTER TABLE `core_commit` DISABLE KEYS */;
INSERT INTO `core_commit` VALUES (' 027A12C2FC8568E8B70B07FF536FAF288A013670 ','2018-12-05 18:38:22.000000','master',3,2),(' 03D67C263C27A453EF65B29E30334727333CCBCD ','2019-06-10 13:08:43.000000','devel',9,3),(' 073D41436E7F2B1B8344DA344D0B988B3FD5813C ','2019-10-21 00:39:31.000000','master',30,4),(' 09F199D25132204E99BFB1A89916DE24494F19BB ','2019-03-25 21:30:53.000000','master',32,3),(' 0AB8318ACAF6E678DD02E2B5C343ED41111B393D ','2017-08-14 15:42:54.000000','master',37,7),(' 0CE65B26DCD3C08E1B329D9EFBB6BBBCED426F31 ','2018-12-12 12:09:22.000000','junk',5,1),(' 11760E1AAC4396E10D315E93AD3DF3E99204DC5E ','2019-09-20 22:51:56.000000','bug',3,2),(' 130E4A34F1B807A8F3BD24B204C06EC4DE4010DA ','2019-06-03 03:09:16.000000','devel',40,10),(' 17D53E0E6A68ACDF80B78D4F9D868C8736DB2CEC ','2019-12-21 09:32:26.000000','master',20,1),(' 180C89BF50C8B29DEB45E49D9DAC62FCD5C8BEDB ','2019-06-15 12:24:49.000000','master',19,2),(' 18740AF5BCEC9573BD3C059E0FC6570353097AAB ','2019-07-27 13:34:48.000000','devel',16,5),(' 1A591A3E91FCB7A47F2C08E9E2E117F39AF22078 ','2017-01-09 05:39:57.000000','devel',4,2),(' 1AED9ECC6E1BE8EAAADDC5FFB6BA3ED84A8B1AE6 ','2018-01-26 02:05:18.000000','issues',14,5),(' 1BF429F94068620B112ACA3888B58AECBC2EADEE ','2017-02-03 23:24:26.000000','feat',14,5),(' 1C39ABF68E93E438AE5DCA946E2D6A986CCCD3A9 ','2018-12-06 07:44:49.000000','bug',12,7),(' 1ED5DD9D833F675B7509886681E2164D842F8DAD ','2017-04-22 13:07:07.000000','devel',16,4),(' 1F797564F7843D36EBE5E841E5BD39C98157E22B ','2019-09-08 07:32:56.000000','master',9,3),(' 1FEF42909247A6C230EEEF66277F2B5E0E8F274E ','2018-02-17 04:02:45.000000','master',2,1),(' 213598A7E92217BEE3A758F3C69AEA09ED940C0E ','2018-03-14 06:57:55.000000','stable',6,2),(' 213CB204509284FF2AEDECA9290B70A6DA307EAB ','2018-10-17 05:17:27.000000','devel',10,7),(' 259A6E935B848823A0C0B76ACED2803060B4BD0C ','2019-12-15 00:06:08.000000','feat',28,8),(' 26160D23FB07CF8D5DAE186EBA322E9FC8E27BB4 ','2019-03-05 13:53:30.000000','test',5,1),(' 2C2FE4EC20E6C43DCC03E395AED7DB79756728A5 ','2018-12-07 14:17:40.000000','feat',12,7),(' 2F36B6BB1852C24392FB3EE9A2879DA24EB0750D ','2019-10-20 22:04:05.000000','bug',35,2),(' 2F737399606486655401CB27B066F4658424766D ','2019-05-19 06:50:49.000000','feat',37,5),(' 314CCD964EF6A8E68AC5F9BB89F751A1C2196C56 ','2018-10-18 21:36:23.000000','master',12,7),(' 317DBAC90743C3E5E82B2DDF122CD076A2226A92 ','2017-06-24 17:16:12.000000','master',36,5),(' 349507E41DD8C71C10C9DF6D2444B5E64A285691 ','2018-09-18 19:12:42.000000','stable',4,2),(' 354BF98925838CA68611B950E2A37EBD11C21640 ','2019-08-23 07:25:49.000000','master',23,4),(' 35536A41B209715D9E3AD440431FEF2672F20BBE ','2019-09-16 01:35:17.000000','feat',5,1),(' 373616E39FB47D9A1A4E87DFD4EA968037435F14 ','2019-12-21 06:35:06.000000','master',36,6),(' 37497AA5A2272C49714AEE1B07E8EDF973A95F59 ','2019-12-15 05:06:36.000000','master',5,1),(' 3AE11C725C30009D4D3418BC6B30789FEED78322 ','2018-12-09 14:39:32.000000','master',36,5),(' 3D91F7631BA813C13A08A208F1255B2E96FB03D0 ','2019-06-23 02:29:54.000000','devel',32,2),(' 3F57ADF2C06CECD095FF83AB72787889961BBE87 ','2019-08-10 12:44:34.000000','junk',15,6),(' 41349E9557E537855AE0F63CC43918FA13A561D3 ','2019-09-16 04:09:37.000000','master',7,3),(' 41937B20FBE8C71D9C6C3346AFF43C001AA25E33 ','2019-02-27 10:40:02.000000','devel',32,3),(' 42AB0C94A1E3BD6175A15DBA215CCF5F10E861E5 ','2019-12-30 04:37:15.000000','devel',1,1),(' 4617585B8749A71BBB21237CAB6C2DC9CBE3B86F ','2019-01-08 03:40:50.000000','stable',3,2),(' 4902A456CAA9A4EAB463CE526C9DF0F6180BE184 ','2018-08-12 01:56:04.000000','master',32,2),(' 4C197DFD67F1ED79D11A8B0218CC368BFCCE6CCB ','2019-01-15 16:37:05.000000','issues',30,4),(' 4EDED9AD930D56B01A3D8527B3220B71078001B0 ','2018-08-16 14:31:59.000000','master',34,2),(' 5076721C4060FEEB69BD2C3DD9BDCE115D5C62F3 ','2019-12-26 02:12:04.000000','master',20,7),(' 55949D4C16632F1C275D7684A379B8F1717B3904 ','2019-01-12 13:43:31.000000','junk',23,2),(' 593905B31972F6FFE58325ABF98595CAF4EBF458 ','2019-06-01 20:10:06.000000','master',12,7),(' 5A3E269AEE59E6826F23720F6FDD069D83BC087A ','2017-12-08 16:11:17.000000','master',26,2),(' 5AA588714AB4CBFD615D238FD9778C3A14CA4BA8 ','2019-12-28 10:42:59.000000','feat',28,8),(' 5C77726358C5DAF98AD9CDCCD0882BCA0F718B88 ','2018-07-13 18:31:56.000000','master',14,5),(' 5CAA7F811B5AFF6EB9993F309C4C045785EE67EC ','2017-04-23 08:46:23.000000','master',31,3),(' 5CB4C9D828175ED3931EC52305B32F47173A8E04 ','2019-06-13 23:35:13.000000','issues',18,4),(' 5EEDD6A16AB862CB5D6B2E194E0BDF8B0161D89A ','2018-07-21 13:46:17.000000','feat',10,7),(' 5F4599DAA3415F788C1AFC3DB145F01B4BD2B438 ','2017-02-05 07:49:48.000000','bug',8,3),(' 60A8B0C6DE6F6ABE5999959A5C7352750116FB9C ','2019-09-12 21:19:25.000000','feat',25,4),(' 63F1D3CFA0EC638B8F43AABD01A426C50A6E4653 ','2018-06-20 13:38:02.000000','issues',13,9),(' 6557ACA8CD65D427A5621EFFA3E8EF5C27FEF340 ','2019-12-10 14:26:50.000000','issues',29,7),(' 674027E17B0ED64E76CDE2005CB8E76FB4CD671A ','2019-09-03 00:32:29.000000','master',39,5),(' 6C6B1B2B3ECC0E6900000DABF4FAAE6F8DF5FFD1 ','2017-07-20 10:25:38.000000','bug',4,2),(' 6D613A1EE01EEC4C0F8CA66DF0DB71DCA0C6E1CF ','2019-07-07 08:57:32.000000','devel',21,2),(' 73A7DDD505F2FC2CEAD1522E54A794328F228C44 ','2019-01-13 08:27:46.000000','master',2,1),(' 74A788CEE27D549015A0786732C662E05CDD7567 ','2017-03-09 05:13:15.000000','raspberry',26,2),(' 77F256B43643417F9B6622ADFF8BD31AE6EA7781 ','2017-02-27 13:28:38.000000','master',5,1),(' 7971E6A051104074FDAE0F02322417B6EB5695A2 ','2019-04-22 21:55:43.000000','master',3,2),(' 7998BE8D446D668C99ABCA446CB3BD79FCE08D2B ','2019-10-09 11:57:25.000000','master',9,3),(' 79B9D273AC6D2488109D1EA43E2BDB7977BD2B28 ','2019-06-26 11:37:51.000000','TZ-2001',19,3),(' 7C39974F44B2B12933C66A9EBA3FE33C8D0805B6 ','2017-08-10 22:29:11.000000','stable',6,2),(' 80EAF3087B0B041473C6C223F1E09197B649362E ','2019-06-06 08:08:03.000000','master',23,2),(' 852ADDAB901CBC5699D190285A009D7A7035FB57 ','2019-12-12 14:44:31.000000','stable',1,1),(' 85FA355BDB4F46FA53A20A441623D53D686D4036 ','2019-02-20 09:12:05.000000','master',5,1),(' 889224E3FCA24A6AB17D01FE47A45BC82244E938 ','2017-03-25 23:14:03.000000','master',26,4),(' 89DA124E04DFE1AD9946CD37D91A119E1D028898 ','2017-06-20 05:44:23.000000','master',27,8),(' 8A4BF12E17B2BE590B12721EF8D5D0248698B5B6 ','2019-05-23 15:22:12.000000','master',30,3),(' 8E40809E474F3E0705DDEF056618CE3E5043522A ','2018-02-10 12:11:44.000000','feat',31,3),(' 9113C6C0C1F9CB53E3543B53136BA30C51018373 ','2019-03-05 02:02:38.000000','feat',22,7),(' 93295B0C76B900DA760A8E0F2E9A29A1BA4B0F4C ','2019-08-14 00:46:06.000000','junk',32,2),(' 93409AF2F208E7545F0F26996E048113EDD88652 ','2017-07-25 13:11:22.000000','stable',10,7),(' 93B12BF57F18C13C9AD2F55E33A8E3FD786FC394 ','2019-06-19 07:27:36.000000','master',9,3),(' 9491A68514DC1EF6BDD379F8E408C0D49CC3B6CE ','2018-02-28 05:17:03.000000','master',27,8),(' 95CB62724475A0D26872DACC00642D5080519324 ','2019-10-22 01:23:33.000000','master',24,4),(' 967CE367D89DCCC133D71049F1197D29561B3726 ','2017-11-19 09:54:06.000000','bug',5,1),(' 9D3BD1FB52785A7BAEB03B437E7B2ECBA54EF34F ','2018-03-28 14:30:28.000000','devel',5,1),(' A001AF75EE89582F31CB4DB6D3DD0B4766C80050 ','2018-04-05 01:25:05.000000','feat',4,2),(' A06DCD71328FD2B44FA7F84012096E8F318E4B48 ','2019-06-24 02:33:37.000000','junk',5,1),(' A42522A0CDD6E41A1379E6C95D08A9C46A17249C ','2017-09-01 22:31:05.000000','feat',30,2),(' A4842F0234D7270B757B60B6F17A1B9F4D560DAD ','2018-06-02 01:39:19.000000','test',38,7),(' A84F56F2E6A77ECB4B2F89344446DD3FF91B87C4 ','2019-12-20 01:43:06.000000','devel',4,2),(' AD79EF0F076D3A686AB9738925F4DD2C7E69D7D1 ','2019-10-26 09:06:49.000000','test',24,4),(' B07CB9A2B24832A8197CD3DFA67D1D6ADFB0CFBB ','2017-01-27 05:17:19.000000','master',4,2),(' B0DDCE0F54C916C106117E280AEAD4F9C0CBF1DF ','2017-08-04 00:05:08.000000','bug',10,7),(' B3C92EECF0AA1905086059D9F6D3261D8FB19657 ','2019-11-02 10:20:10.000000','test',29,7),(' B47B54FD3A460F43EBBCABE5B10C189176F25F25 ','2019-11-22 10:10:23.000000','stable',3,2),(' B47F363E2B430C0647F14DEEA3ECED9B0EF300CE ','2018-03-14 12:40:23.000000','test',14,5),(' BB130626B42C3CCE860334424AEF9A144F8231F2 ','2019-06-07 15:45:44.000000','master',17,2),(' BB2254A806F43DF24753CA390143E2CA8C1E4E80 ','2019-11-23 04:35:01.000000','master',8,3),(' BBB7EF7F2EC9557D0895C9DA1C5CDDD50D15049E ','2018-11-21 12:14:39.000000','stable',14,5),(' BC1CD4F07D828493332F9C95C491D6FB338AFD40 ','2019-03-24 08:53:23.000000','issues',22,3),(' BC88A24030A15BDE613C8749ED93D30E0A81FCC2 ','2018-08-01 17:33:51.000000','stable',32,2),(' BCD23F5BB628B5F99FE4B850D6CE84C74E48BEF5 ','2019-10-20 11:47:22.000000','master',28,8),(' BD6ACC8626D118AEA60331CE33BF000C9D7D1CEE ','2019-07-06 02:53:01.000000','TZ-2001',37,2),(' C484B137E2D18229E4E7E677F1F8CFCE6A0AB819 ','2019-02-20 00:31:31.000000','master',30,3),(' C5F5BB3B350774D7CDA57104C55FB6C82B7AE7D9 ','2019-10-13 12:06:56.000000','test',4,2),(' C69153687791FB52C12CE7CCA2F4D03A65D9ABF8 ','2019-12-20 02:01:44.000000','master',28,8),(' C78791A3F0E109D34BA4EAC2AFA35EC011439AE3 ','2019-03-15 00:24:06.000000','feat',15,6),(' C909B138EBA89ECFBD86DF4C9D170AC78D4A3820 ','2019-08-19 14:53:58.000000','master',25,4),(' CD1B646EBD1F6844C60DD91951C6867E43857114 ','2018-12-02 19:54:47.000000','bug',8,3),(' CD6A7B8768528485A0DBCD459185091E80DC28AD ','2019-10-13 21:10:43.000000','issues',21,7),(' CEAFB51E2B0783D53DD620019DFF3AA66708A26F ','2019-12-15 08:39:37.000000','feat',24,4),(' D2EAF2AA1512D6596E0A5BAE633537C6B8E779A3 ','2019-02-18 08:27:39.000000','master',32,3),(' D7E0453BB4AF87006533F4D77AD9546DAC533DB8 ','2018-10-18 15:55:58.000000','master',12,7),(' DAA6A489DBCA7A13C480AAA1D0C344957590FDB7 ','2018-05-16 14:25:25.000000','raspberry',22,10),(' DBF2A2DA6458B242407285E7F1483AEB6CFEE9FD ','2019-02-05 12:34:03.000000','devel',30,4),(' E3772AC4B4DB87B4A8DBFA59EF43CD1A8AD29515 ','2019-07-26 10:01:07.000000','issues',30,4),(' E5BB59A2731998CAE2070F6FD4F2E075FD61146F ','2017-08-17 09:52:15.000000','junk',22,4),(' ED50AA2DE1123D2CB20C9D1F0F691C834FB6F548 ','2019-03-21 21:52:05.000000','bug',15,6),(' F0A96DA3F86A334CBE8D569110D6545277973859 ','2019-12-01 18:36:59.000000','feat',3,2),(' F14E46CE7D094F9326167ACC499698128651BE85 ','2017-05-14 15:49:06.000000','master',6,2),(' F92BCB6A06D2EC7C0AF7C8A338F131BF887C64A0 ','2019-03-08 07:04:41.000000','master',32,3),(' FA6C3752CD00F7F1277FD7E5604AB8D2EDAF26B8 ','2019-08-05 00:59:10.000000','test',3,2),(' FCF29F6CAD3232704B33E962EF5194FAD3B6817B ','2019-07-11 22:46:20.000000','master',30,4),(' FF3EA3BEC182358766650A6FD2872D9221F7E6CC ','2019-10-25 05:41:17.000000','bug',12,7),(' FFB0EAF998E6B2C3D5052AF77023A08FC1736781 ','2018-04-20 21:02:40.000000','feat',30,2);
/*!40000 ALTER TABLE `core_commit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_commitfile`
--

DROP TABLE IF EXISTS `core_commitfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_commitfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(45) NOT NULL,
  `action` varchar(6) NOT NULL,
  `commit_id` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_commitfile_commit_id_filename_9f4da705_uniq` (`commit_id`,`filename`),
  CONSTRAINT `core_commitfile_commit_id_4aeac4d9_fk_core_commit_hash` FOREIGN KEY (`commit_id`) REFERENCES `core_commit` (`hash`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_commitfile`
--

LOCK TABLES `core_commitfile` WRITE;
/*!40000 ALTER TABLE `core_commitfile` DISABLE KEYS */;
INSERT INTO `core_commitfile` VALUES (1,'D3DCompiler_47.dll','rename',' 027A12C2FC8568E8B70B07FF536FAF288A013670 '),(2,'d2d1debug3.dll','create',' 03D67C263C27A453EF65B29E30334727333CCBCD '),(3,'d3d10_1.dll','update',' 073D41436E7F2B1B8344DA344D0B988B3FD5813C '),(4,'davclnt.dll','update',' 09F199D25132204E99BFB1A89916DE24494F19BB '),(5,'d3d10.dll','create',' 0AB8318ACAF6E678DD02E2B5C343ED41111B393D '),(6,'d3d10sdklayers.dll','update',' 0CE65B26DCD3C08E1B329D9EFBB6BBBCED426F31 '),(7,'deviceaccess.dll','update',' 0CE65B26DCD3C08E1B329D9EFBB6BBBCED426F31 '),(8,'DdcClaimsApi.dll','update',' 11760E1AAC4396E10D315E93AD3DF3E99204DC5E '),(9,'DafDnsSd.dll','create',' 130E4A34F1B807A8F3BD24B204C06EC4DE4010DA '),(10,'dcomcnfg.exe','create',' 17D53E0E6A68ACDF80B78D4F9D868C8736DB2CEC '),(11,'dafAspInfraProvider.dll','update',' 180C89BF50C8B29DEB45E49D9DAC62FCD5C8BEDB '),(12,'dbgcore.dll','create',' 18740AF5BCEC9573BD3C059E0FC6570353097AAB '),(13,'DeviceCredential.dll','rename',' 1A591A3E91FCB7A47F2C08E9E2E117F39AF22078 '),(14,'de-DE','update',' 1AED9ECC6E1BE8EAAADDC5FFB6BA3ED84A8B1AE6 '),(15,'das.dll','rename',' 1BF429F94068620B112ACA3888B58AECBC2EADEE '),(16,'davhlpr.dll','update',' 1C39ABF68E93E438AE5DCA946E2D6A986CCCD3A9 '),(17,'DesktopSwitcherDataModel.dll','update',' 1ED5DD9D833F675B7509886681E2164D842F8DAD '),(18,'d3d12SDKLayers.dll','update',' 1F797564F7843D36EBE5E841E5BD39C98157E22B '),(19,'DataExchangeHost.exe','update',' 1FEF42909247A6C230EEEF66277F2B5E0E8F274E '),(20,'D3D12.dll','create',' 213598A7E92217BEE3A758F3C69AEA09ED940C0E '),(21,'DeviceCensus.exe','delete',' 213CB204509284FF2AEDECA9290B70A6DA307EAB '),(22,'DavSyncProvider.dll','update',' 259A6E935B848823A0C0B76ACED2803060B4BD0C '),(23,'DeviceDisplayStatusManager.dll','update',' 26160D23FB07CF8D5DAE186EBA322E9FC8E27BB4 '),(24,'DafGip.dll','update',' 2C2FE4EC20E6C43DCC03E395AED7DB79756728A5 '),(25,'defragres.dll','create',' 2F36B6BB1852C24392FB3EE9A2879DA24EB0750D '),(26,'DAFWSD.dll','rename',' 2F737399606486655401CB27B066F4658424766D '),(27,'DAFIPP.dll','rename',' 314CCD964EF6A8E68AC5F9BB89F751A1C2196C56 '),(28,'dcomp.dll','rename',' 317DBAC90743C3E5E82B2DDF122CD076A2226A92 '),(29,'dafWfdProvider.dll','rename',' 349507E41DD8C71C10C9DF6D2444B5E64A285691 '),(30,'d3d10_1core.dll','create',' 354BF98925838CA68611B950E2A37EBD11C21640 '),(31,'ddraw.dll','update',' 35536A41B209715D9E3AD440431FEF2672F20BBE '),(32,'da-DK','update',' 373616E39FB47D9A1A4E87DFD4EA968037435F14 '),(33,'d3d10sdklayers.dll','update',' 37497AA5A2272C49714AEE1B07E8EDF973A95F59 '),(34,'dafBth.dll','update',' 37497AA5A2272C49714AEE1B07E8EDF973A95F59 '),(35,'d3d8thk.dll','create',' 3AE11C725C30009D4D3418BC6B30789FEED78322 '),(36,'dbghelp.dll','rename',' 3D91F7631BA813C13A08A208F1255B2E96FB03D0 '),(37,'delegatorprovider.dll','create',' 3F57ADF2C06CECD095FF83AB72787889961BBE87 '),(38,'DeveloperOptionsSettingsHandlers.dll','create',' 41349E9557E537855AE0F63CC43918FA13A561D3 '),(39,'DeviceDriverRetrievalClient.dll','rename',' 41937B20FBE8C71D9C6C3346AFF43C001AA25E33 '),(40,'D3DSCache.dll','create',' 42AB0C94A1E3BD6175A15DBA215CCF5F10E861E5 '),(41,'DAFIoT.dll','update',' 4617585B8749A71BBB21237CAB6C2DC9CBE3B86F '),(42,'DDACLSys.dll','rename',' 4902A456CAA9A4EAB463CE526C9DF0F6180BE184 '),(43,'DefaultDeviceManager.dll','update',' 4C197DFD67F1ED79D11A8B0218CC368BFCCE6CCB '),(44,'DaOtpCredentialProvider.dll','create',' 4EDED9AD930D56B01A3D8527B3220B71078001B0 '),(45,'DevDispItemProvider.dll','update',' 5076721C4060FEEB69BD2C3DD9BDCE115D5C62F3 '),(46,'DesktopView.Internal.Broker.dll','rename',' 55949D4C16632F1C275D7684A379B8F1717B3904 '),(47,'d3d11_3SDKLayers.dll','create',' 593905B31972F6FFE58325ABF98595CAF4EBF458 '),(48,'dafupnp.dll','create',' 5A3E269AEE59E6826F23720F6FDD069D83BC087A '),(49,'ddisplay.dll','rename',' 5AA588714AB4CBFD615D238FD9778C3A14CA4BA8 '),(50,'dafDockingProvider.dll','update',' 5C77726358C5DAF98AD9CDCCD0882BCA0F718B88 '),(51,'DesktopShellAppStateContract.dll','update',' 5CAA7F811B5AFF6EB9993F309C4C045785EE67EC '),(52,'d3dref9.dll','create',' 5CB4C9D828175ED3931EC52305B32F47173A8E04 '),(53,'DefaultQuestions.json','update',' 5EEDD6A16AB862CB5D6B2E194E0BDF8B0161D89A '),(54,'d3d11.dll','update',' 5F4599DAA3415F788C1AFC3DB145F01B4BD2B438 '),(55,'DataStoreCacheDumpTool.exe','create',' 60A8B0C6DE6F6ABE5999959A5C7352750116FB9C '),(56,'DAConn.dll','create',' 63F1D3CFA0EC638B8F43AABD01A426C50A6E4653 '),(57,'datusage.dll','create',' 6557ACA8CD65D427A5621EFFA3E8EF5C27FEF340 '),(58,'defragproxy.dll','create',' 674027E17B0ED64E76CDE2005CB8E76FB4CD671A '),(59,'dafWCN.dll','update',' 6C6B1B2B3ECC0E6900000DABF4FAAE6F8DF5FFD1 '),(60,'C_IS2022.DLL','create',' 6D613A1EE01EEC4C0F8CA66DF0DB71DCA0C6E1CF '),(61,'DAFMCP.dll','create',' 73A7DDD505F2FC2CEAD1522E54A794328F228C44 '),(62,'DetailedReading-Default.xml','rename',' 74A788CEE27D549015A0786732C662E05CDD7567 '),(63,'DAMM.dll','rename',' 77F256B43643417F9B6622ADFF8BD31AE6EA7781 '),(64,'c_GSM7.DLL','create',' 7971E6A051104074FDAE0F02322417B6EB5695A2 '),(65,'desktopimgdownldr.exe','rename',' 7998BE8D446D668C99ABCA446CB3BD79FCE08D2B '),(66,'d3d10level9.dll','create',' 79B9D273AC6D2488109D1EA43E2BDB7977BD2B28 '),(67,'dciman32.dll','update',' 7C39974F44B2B12933C66A9EBA3FE33C8D0805B6 '),(68,'daxexec.dll','update',' 80EAF3087B0B041473C6C223F1E09197B649362E '),(69,'DataExchange.dll','update',' 852ADDAB901CBC5699D190285A009D7A7035FB57 '),(70,'DeviceDirectoryClient.dll','update',' 85FA355BDB4F46FA53A20A441623D53D686D4036 '),(71,'ddrawex.dll','update',' 889224E3FCA24A6AB17D01FE47A45BC82244E938 '),(72,'datamarketsvc.dll','create',' 89DA124E04DFE1AD9946CD37D91A119E1D028898 '),(73,'DataUsageLiveTileTask.exe','update',' 8A4BF12E17B2BE590B12721EF8D5D0248698B5B6 '),(74,'DafPrintProvider.dll','create',' 8E40809E474F3E0705DDEF056618CE3E5043522A '),(75,'dcntel.dll','rename',' 9113C6C0C1F9CB53E3543B53136BA30C51018373 '),(76,'deskadp.dll','rename',' 93295B0C76B900DA760A8E0F2E9A29A1BA4B0F4C '),(77,'d3d9on12.dll','create',' 93409AF2F208E7545F0F26996E048113EDD88652 '),(78,'DesktopShellExt.dll','delete',' 93B12BF57F18C13C9AD2F55E33A8E3FD786FC394 '),(79,'DefaultAccountTile.png','update',' 9491A68514DC1EF6BDD379F8E408C0D49CC3B6CE '),(80,'desk.cpl','rename',' 95CB62724475A0D26872DACC00642D5080519324 '),(81,'DDORes.dll','update',' 967CE367D89DCCC133D71049F1197D29561B3726 '),(82,'d3d10sdklayers.dll','create',' 9D3BD1FB52785A7BAEB03B437E7B2ECBA54EF34F '),(83,'dabapi.dll','create',' A001AF75EE89582F31CB4DB6D3DD0B4766C80050 '),(84,'dccw.exe','update',' A06DCD71328FD2B44FA7F84012096E8F318E4B48 '),(85,'d3d10warp.dll','create',' A42522A0CDD6E41A1379E6C95D08A9C46A17249C '),(86,'DDFs','create',' A4842F0234D7270B757B60B6F17A1B9F4D560DAD '),(87,'defragsvc.dll','rename',' A84F56F2E6A77ECB4B2F89344446DD3FF91B87C4 '),(88,'DefaultHrtfs.bin','update',' AD79EF0F076D3A686AB9738925F4DD2C7E69D7D1 '),(89,'DdcComImplementationsDesktop.dll','rename',' B07CB9A2B24832A8197CD3DFA67D1D6ADFB0CFBB '),(90,'DesktopView.Internal.Broker.ProxyStub.dll','rename',' B0DDCE0F54C916C106117E280AEAD4F9C0CBF1DF '),(91,'DDOIProxy.dll','update',' B3C92EECF0AA1905086059D9F6D3261D8FB19657 '),(92,'DdcComImplementations.dll','update',' B47B54FD3A460F43EBBCABE5B10C189176F25F25 '),(93,'C_ISCII.DLL','create',' B47F363E2B430C0647F14DEEA3ECED9B0EF300CE '),(94,'DeviceCredentialDeployment.exe','create',' BB130626B42C3CCE860334424AEF9A144F8231F2 '),(95,'dab.dll','rename',' BB2254A806F43DF24753CA390143E2CA8C1E4E80 '),(96,'DbgModel.dll','update',' BBB7EF7F2EC9557D0895C9DA1C5CDDD50D15049E '),(97,'DataUsageHandlers.dll','update',' BC1CD4F07D828493332F9C95C491D6FB338AFD40 '),(98,'DDDS.dll','rename',' BC88A24030A15BDE613C8749ED93D30E0A81FCC2 '),(99,'deploymentcsps.dll','delete',' BCD23F5BB628B5F99FE4B850D6CE84C74E48BEF5 '),(100,'d3d10ref.dll','update',' BD6ACC8626D118AEA60331CE33BF000C9D7D1CEE '),(101,'dataclen.dll','rename',' C484B137E2D18229E4E7E677F1F8CFCE6A0AB819 '),(102,'DesktopKeepOnToastImg.gif','rename',' C5F5BB3B350774D7CDA57104C55FB6C82B7AE7D9 '),(103,'d3d10core.dll','create',' C69153687791FB52C12CE7CCA2F4D03A65D9ABF8 '),(104,'deskmon.dll','rename',' C78791A3F0E109D34BA4EAC2AFA35EC011439AE3 '),(105,'dbnetlib.dll','update',' C909B138EBA89ECFBD86DF4C9D170AC78D4A3820 '),(106,'d2d1.dll','create',' CD1B646EBD1F6844C60DD91951C6867E43857114 '),(107,'dafpos.dll','update',' CD6A7B8768528485A0DBCD459185091E80DC28AD '),(108,'d3d11on12.dll','create',' CEAFB51E2B0783D53DD620019DFF3AA66708A26F '),(109,'DAFWiProv.dll','create',' D2EAF2AA1512D6596E0A5BAE633537C6B8E779A3 '),(110,'dasHost.exe','update',' D7E0453BB4AF87006533F4D77AD9546DAC533DB8 '),(111,'DeviceCenter.dll','delete',' DAA6A489DBCA7A13C480AAA1D0C344957590FDB7 '),(112,'DdcAntiTheftApi.dll','update',' DBF2A2DA6458B242407285E7F1483AEB6CFEE9FD '),(113,'dbnmpntw.dll','update',' E3772AC4B4DB87B4A8DBFA59EF43CD1A8AD29515 '),(114,'DAMediaManager.dll','create',' E5BB59A2731998CAE2070F6FD4F2E075FD61146F '),(115,'deploymentcsphelper.exe','update',' ED50AA2DE1123D2CB20C9D1F0F691C834FB6F548 '),(116,'dbgeng.dll','update',' F0A96DA3F86A334CBE8D569110D6545277973859 '),(117,'ddodiag.exe','rename',' F14E46CE7D094F9326167ACC499698128651BE85 '),(118,'devenum.dll','rename',' F92BCB6A06D2EC7C0AF7C8A338F131BF887C64A0 '),(119,'d3d9.dll','update',' FA6C3752CD00F7F1277FD7E5604AB8D2EDAF26B8 '),(120,'Defrag.exe','update',' FCF29F6CAD3232704B33E962EF5194FAD3B6817B '),(121,'deviceassociation.dll','update',' FF3EA3BEC182358766650A6FD2872D9221F7E6CC '),(122,'DefaultPrinterProvider.dll','update',' FFB0EAF998E6B2C3D5052AF77023A08FC1736781 ');
/*!40000 ALTER TABLE `core_commitfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_issue`
--

DROP TABLE IF EXISTS `core_issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `description` longtext NOT NULL,
  `state` varchar(6) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `label` varchar(13) NOT NULL,
  `repo_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_issue_repo_id_title_55ee1179_uniq` (`repo_id`,`title`),
  KEY `core_issue_user_id_177ae23f_fk_core_user_id` (`user_id`),
  CONSTRAINT `core_issue_user_id_177ae23f_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`),
  CONSTRAINT `core_issue_repo_id_75506487_fk_core_repo_id` FOREIGN KEY (`repo_id`) REFERENCES `core_repo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_issue`
--

LOCK TABLES `core_issue` WRITE;
/*!40000 ALTER TABLE `core_issue` DISABLE KEYS */;
INSERT INTO `core_issue` VALUES (1,'missing installation instructions','Percipio affectus sequatur iii habentur impressa meo.','open','2018-04-07 03:57:00.000000','documentation',1,7),(2,'users authentication','Et lectores earundem aliasque de immobile putandum me.','open','2018-03-16 21:07:00.000000','bug',1,1),(3,'users privileges','Ex in si volent negare possum.','open','2017-03-19 01:04:00.000000','bug',1,2),(4,'how can I use the code?','Et lectores earundem aliasque de immobile putandum me.','closed','2018-03-13 01:22:00.000000','help',2,2),(5,'wrong use of DFT','Novi vel has fal sine dat etsi. ','open','2017-06-10 03:55:00.000000','help',2,5),(6,'wrong use of SFT','Factae imo partem absque seriem meo dictis. Sequentium rem cogitantur deo existentia theologiae. ','open','2018-08-02 01:43:00.000000','help',2,3),(7,'IEEE format missing','Ex in si volent negare possum.','closed','2019-11-16 17:42:00.000000','documentation',3,3),(8,'add capacitor','Factae imo partem absque seriem meo dictis. Sequentium rem cogitantur deo existentia theologiae. ','closed','2019-02-08 08:34:00.000000','feature',6,3),(9,'add MOSFET for protection','Novi vel has fal sine dat etsi. ','closed','2019-05-06 19:17:00.000000','feature',6,4),(10,'Jokers conidition','Ab ad noctu ac ut veras terra ausit nudam.','open','2017-11-12 11:31:00.000000','other',12,10),(11,'tsitsipas live statistics','Ratione probant sciatur id ex docetur replere is.','closed','2017-05-10 12:39:00.000000','feature',17,4),(12,'tsitsipas live statistics vs Federer','Ab ad noctu ac ut veras terra ausit nudam.','closed','2017-12-13 16:31:00.000000','feature',17,2),(13,'tsitsipas live statistics vs Jokovic','Et lectores earundem aliasque de immobile putandum me.','closed','2019-08-02 09:53:00.000000','feature',17,2),(14,'tsitsipas live statistics vs Nadal','Percipio affectus sequatur iii habentur impressa meo.','closed','2018-09-26 18:08:00.000000','feature',17,1),(15,'SVD algorithm error','Et lectores earundem aliasque de immobile putandum me.','open','2019-06-03 18:16:00.000000','bug',22,5),(16,'SVM algorithm error','Factae imo partem absque seriem meo dictis. Sequentium rem cogitantur deo existentia theologiae. ','open','2018-02-18 06:21:00.000000','bug',22,7),(17,'Add component','Ab ad noctu ac ut veras terra ausit nudam.','open','2017-01-20 20:44:00.000000','other',24,8),(18,'add new libraries','Percipio affectus sequatur iii habentur impressa meo.','closed','2018-01-17 11:21:00.000000','feature',24,5),(19,'add new library','Ex in si volent negare possum.','open','2018-11-05 01:30:00.000000','feature',24,7),(20,'Add component','Novi vel has fal sine dat etsi. ','open','2019-02-17 03:01:00.000000','other',25,9),(21,'missing countries','Et lectores earundem aliasque de immobile putandum me.','open','2018-08-08 22:17:00.000000','feature',25,8),(22,'Add component','Factae imo partem absque seriem meo dictis. Sequentium rem cogitantur deo existentia theologiae. ','open','2019-07-24 01:37:00.000000','other',26,7),(23,'add instructions ','Ratione probant sciatur id ex docetur replere is.','open','2017-08-24 15:15:00.000000','documentation',26,5),(24,'barcelona wrong statistics','Factae imo partem absque seriem meo dictis. Sequentium rem cogitantur deo existentia theologiae. ','open','2019-03-23 21:16:00.000000','bug',26,3),(25,'real wrong statistics','Ab ad noctu ac ut veras terra ausit nudam.','open','2018-05-14 19:57:00.000000','bug',26,3),(26,'unit_tests','Ex in si volent negare possum.','closed','2017-03-06 07:35:00.000000','other',26,4),(27,'unit_tests_2','Ratione probant sciatur id ex docetur replere is.','open','2018-10-03 14:38:00.000000','other',26,8),(28,'missing albanian words','Et lectores earundem aliasque de immobile putandum me.','open','2017-09-05 11:36:00.000000','bug',30,10),(29,'missing greek words','Percipio affectus sequatur iii habentur impressa meo.','open','2017-06-01 07:33:00.000000','bug',30,10),(30,'missing polish words','Ex in si volent negare possum.','open','2017-11-11 07:19:00.000000','bug',30,9),(31,'missing turkish words','Ratione probant sciatur id ex docetur replere is.','open','2017-12-16 06:42:00.000000','bug',30,5),(32,'MDE ','Novi vel has fal sine dat etsi. ','open','2018-09-17 15:35:00.000000','bug',31,2),(33,'live images 1','Ratione probant sciatur id ex docetur replere is.','open','2017-03-07 02:14:00.000000','documentation',39,4),(34,'live images 2','Novi vel has fal sine dat etsi. ','open','2019-05-09 06:18:00.000000','bug',39,6);
/*!40000 ALTER TABLE `core_issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_languagerepo`
--

DROP TABLE IF EXISTS `core_languagerepo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_languagerepo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(45) NOT NULL,
  `lines_of_code` int(11) NOT NULL,
  `repo_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_languagerepo_language_repo_id_f94956f5_uniq` (`language`,`repo_id`),
  KEY `core_languagerepo_repo_id_6e4930a3_fk_core_repo_id` (`repo_id`),
  CONSTRAINT `core_languagerepo_repo_id_6e4930a3_fk_core_repo_id` FOREIGN KEY (`repo_id`) REFERENCES `core_repo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_languagerepo`
--

LOCK TABLES `core_languagerepo` WRITE;
/*!40000 ALTER TABLE `core_languagerepo` DISABLE KEYS */;
INSERT INTO `core_languagerepo` VALUES (1,' C ',256,10),(2,' C ',102,11),(3,' C# ',234,9),(4,' C# ',340,35),(5,' C++ ',245,10),(6,' C++ ',150,11),(7,' C++ ',1,14),(8,' C++ ',392,27),(9,' C++ ',353,34),(10,' CSS ',234,8),(11,' CSS ',420,16),(12,' CSS ',503,17),(13,' CSS ',140,18),(14,' CSS ',320,39),(15,' HTML ',120,8),(16,' HTML ',320,16),(17,' HTML ',560,17),(18,' HTML ',530,18),(19,' HTML ',215,39),(20,' JAVA ',543,7),(21,' JAVA ',292,31),(22,' Matlab ',343,2),(23,' Matlab ',423,4),(24,' Matlab ',230,10),(25,' Matlab ',125,11),(26,' Python ',433,4),(27,' Python ',323,5),(28,' Python ',235,10),(29,' Python ',92,11),(30,' Python ',450,19),(31,' Python ',653,22),(32,' Python ',842,23),(33,' Python ',253,24),(34,' Python ',182,25),(35,' Python ',593,26),(36,' Python ',293,30),(37,' Python ',394,31),(38,' Python ',321,35),(39,' Python ',394,36),(40,' Python ',395,37),(41,' Python ',320,38),(42,' R ',1,15),(43,' R ',603,22),(44,' R ',269,23),(45,' R ',182,24),(46,' SQL ',543,1),(47,' SQL ',231,40),(48,' Tex ',234,3),(49,' Tex ',23,6),(50,' Tex ',124,12),(51,' Tex ',156,13),(52,' Tex ',134,16),(53,' Tex ',560,17),(54,' Tex ',503,18),(55,' Tex ',653,20),(56,' Tex ',356,21),(57,' Tex ',385,28),(58,' Tex ',832,29),(59,' Tex ',392,32),(60,' Tex ',124,33);
/*!40000 ALTER TABLE `core_languagerepo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_org`
--

DROP TABLE IF EXISTS `core_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_org` (
  `id` bigint(20) NOT NULL,
  `description` longtext,
  `name` varchar(45) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  CONSTRAINT `core_org_id_1015bf92_fk_core_owner_id` FOREIGN KEY (`id`) REFERENCES `core_owner` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_org`
--

LOCK TABLES `core_org` WRITE;
/*!40000 ALTER TABLE `core_org` DISABLE KEYS */;
INSERT INTO `core_org` VALUES (11,'Robotics team focused on delivering enhanced functionality in/with robots in a fast and easy manner.','Robotics-4-All','2011-11-06 16:01:00.000000'),(12,'The Aristotle University of Thessaloniki.','Auth-Uni','2012-05-06 16:08:00.000000'),(13,'The world\'s most popular social networking web site','Facebook','2010-03-14 18:08:00.000000'),(14,'Google <3 Open Source','Google','2012-01-14 21:06:00.000000'),(15,'The source code of the world\'s leading liberal voice','The Guardian','2012-08-14 10:25:00.000000'),(16,'Inc. Netflix Open Source Platform','Netflix','2011-07-18 19:58:00.000000'),(17,'Inc.Working with and contributing to the open source community','Twitter','2012-08-14 05:28:00.000000');
/*!40000 ALTER TABLE `core_org` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_org_owners`
--

DROP TABLE IF EXISTS `core_org_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_org_owners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_org_owners_org_id_user_id_fc89edc3_uniq` (`org_id`,`user_id`),
  KEY `core_org_owners_user_id_be2709d7_fk_core_user_id` (`user_id`),
  CONSTRAINT `core_org_owners_user_id_be2709d7_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`),
  CONSTRAINT `core_org_owners_org_id_39296a08_fk_core_org_id` FOREIGN KEY (`org_id`) REFERENCES `core_org` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_org_owners`
--

LOCK TABLES `core_org_owners` WRITE;
/*!40000 ALTER TABLE `core_org_owners` DISABLE KEYS */;
INSERT INTO `core_org_owners` VALUES (1,11,8),(2,12,1),(3,13,3),(4,13,7),(5,14,2),(6,14,6),(7,14,7),(8,15,7),(9,15,10),(10,16,7),(11,16,9),(12,16,10),(13,17,10);
/*!40000 ALTER TABLE `core_org_owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_owner`
--

DROP TABLE IF EXISTS `core_owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_owner` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_owner`
--

LOCK TABLES `core_owner` WRITE;
/*!40000 ALTER TABLE `core_owner` DISABLE KEYS */;
INSERT INTO `core_owner` VALUES (1,'user'),(2,'user'),(3,'user'),(4,'user'),(5,'user'),(6,'user'),(7,'user'),(8,'user'),(9,'user'),(10,'user'),(11,'org'),(12,'org'),(13,'org'),(14,'org'),(15,'org'),(16,'org'),(17,'org');
/*!40000 ALTER TABLE `core_owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_repo`
--

DROP TABLE IF EXISTS `core_repo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_repo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `stars` int(11) NOT NULL,
  `forks` int(11) NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `owner_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_repo_name_owner_id_07bfeee3_uniq` (`name`,`owner_id`),
  KEY `core_repo_owner_id_fbe4affc_fk_core_owner_id` (`owner_id`),
  CONSTRAINT `core_repo_owner_id_fbe4affc_fk_core_owner_id` FOREIGN KEY (`owner_id`) REFERENCES `core_owner` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_repo`
--

LOCK TABLES `core_repo` WRITE;
/*!40000 ALTER TABLE `core_repo` DISABLE KEYS */;
INSERT INTO `core_repo` VALUES (1,'DB-Project',2,0,1,'2019-12-03 18:54:00.000000',1),(2,'Math-Project',3,0,1,'2017-08-11 12:45:00.000000',1),(3,'Bachelor-Thesis-Code',5,0,1,'2018-04-24 07:37:00.000000',2),(4,'ML-course',0,0,0,'2016-05-16 07:05:00.000000',2),(5,'Test',0,2,1,'2015-06-02 20:31:00.000000',1),(6,'kicad',3,2,1,'2016-11-08 19:53:00.000000',2),(7,'Networks',0,0,0,'2018-07-26 02:00:00.000000',3),(8,'portfolio',1,1,1,'2016-03-18 05:49:00.000000',3),(9,'Embedded-systems',2,0,1,'2019-05-23 00:37:00.000000',3),(10,'batmobile',0,0,0,'2015-07-25 03:14:00.000000',7),(11,'batcopter',0,0,0,'2017-02-07 13:33:00.000000',7),(12,'Arkam-Hospital',123,4,1,'2018-09-08 06:21:00.000000',7),(13,'Photos',340,0,1,'2015-11-09 09:47:00.000000',9),(14,'Test',0,0,0,'2015-09-04 19:53:00.000000',5),(15,'Test',1,0,1,'2018-12-04 16:49:00.000000',6),(16,'Premier-league',520,42,1,'2015-06-01 04:08:00.000000',15),(17,'Tennis',234,20,1,'2017-10-12 09:55:00.000000',15),(18,'Live-Bet',0,0,0,'2017-11-02 17:20:00.000000',15),(19,'Sfhmmy',0,0,0,'2019-05-04 21:57:00.000000',11),(20,'Doomsday',0,0,0,'2019-12-20 20:15:00.000000',16),(21,'Suicide-Squad',0,0,0,'2019-04-03 15:05:00.000000',16),(22,'Pattern-Recognition',120,23,1,'2017-08-05 09:38:00.000000',16),(23,'Voice-Recognition',532,53,1,'2017-11-04 08:39:00.000000',14),(24,'Speech-Recognition',434,43,1,'2019-09-06 10:52:00.000000',14),(25,'African-Languages',23,3,1,'2018-11-24 01:11:00.000000',14),(26,'European-Languages',234,55,1,'2015-01-17 12:55:00.000000',14),(27,'Harvey-Dent-Creation',0,0,0,'2016-06-08 14:07:00.000000',8),(28,'Bombs',0,0,0,'2019-09-10 11:28:00.000000',8),(29,'Joker-Plans',0,0,0,'2019-09-08 20:11:00.000000',7),(30,'English',34,55,1,'2017-03-06 14:10:00.000000',14),(31,'NAO',20,22,1,'2016-06-26 02:00:00.000000',11),(32,'Latex-template',25,10,1,'2018-07-14 23:59:00.000000',11),(33,'Word-template',33,7,1,'2018-05-01 10:30:00.000000',11),(34,'ROS',23,4,1,'2015-11-02 05:47:00.000000',11),(35,'Alpha-Bank',0,0,0,'2017-10-21 12:39:00.000000',16),(36,'Flask',0,0,0,'2017-05-19 07:07:00.000000',12),(37,'Django',0,0,0,'2017-05-12 15:31:00.000000',17),(38,'Flask',0,0,0,'2015-04-13 12:42:00.000000',16),(39,'Trump',54,1,1,'2019-02-27 01:58:00.000000',15),(40,'MySQL-worbench',0,0,0,'2016-01-09 17:04:00.000000',16);
/*!40000 ALTER TABLE `core_repo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_team`
--

DROP TABLE IF EXISTS `core_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `description` longtext,
  `org_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_team_org_id_name_a5692be6_uniq` (`org_id`,`name`),
  CONSTRAINT `core_team_org_id_c3e3b9ad_fk_core_org_id` FOREIGN KEY (`org_id`) REFERENCES `core_org` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_team`
--

LOCK TABLES `core_team` WRITE;
/*!40000 ALTER TABLE `core_team` DISABLE KEYS */;
INSERT INTO `core_team` VALUES (1,'IoT','2013-09-05 17:54:00.000000','Team working on Internet-of-Things aspects',11),(2,'pandora','2013-03-06 03:45:00.000000','Building autonomous robots',11),(3,'Students','2014-07-05 09:32:00.000000','Student from University',11),(4,'thesis-templates','2011-12-17 19:25:00.000000','Templates for thesis document',11),(5,'db-team','2013-09-11 04:41:00.000000','AUTh Uni DB team',12),(6,'erasmus','2014-05-23 01:19:00.000000','Erasmus Department Website',12),(7,'analytics','2013-09-12 12:12:00.000000','Gather user analytics',13),(8,'frontend','2013-01-14 01:15:00.000000','Frontend developers at Facebook',13),(9,'Google AI Research','2014-04-17 05:08:00.000000','Building the future',14),(10,'Google Translate','2014-08-19 14:50:00.000000','Google translate\'s developers',14),(11,'seo','2014-02-16 05:22:00.000000','Search Engine Optimization engineers',14),(12,'Politics','2014-11-15 19:58:00.000000','Politics Webpage',15),(13,'seo','2013-08-10 05:10:00.000000','Search Engine Optimization engineers',15),(14,'sport','2014-12-16 13:34:00.000000','Responsible for sports webpage ',15),(15,'db-team','2012-07-06 11:01:00.000000','Netflix DB team',16),(16,'Justice League','2011-12-09 02:01:00.000000','Justice League Team',16),(17,'recommendations','2013-05-11 17:27:00.000000','Building content recommendation engine',16),(18,'transactions','2014-05-22 02:50:00.000000','Responsible for economic transactions',16),(19,'db-team','2013-03-27 23:25:00.000000','Twitter DB-team',17),(20,'security','2013-02-12 12:59:00.000000','Twitter security-team',17);
/*!40000 ALTER TABLE `core_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_team_members`
--

DROP TABLE IF EXISTS `core_team_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_team_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_team_members_team_id_user_id_5fa88203_uniq` (`team_id`,`user_id`),
  KEY `core_team_members_user_id_be6629f5_fk_core_user_id` (`user_id`),
  CONSTRAINT `core_team_members_user_id_be6629f5_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`),
  CONSTRAINT `core_team_members_team_id_7c3bab59_fk_core_team_id` FOREIGN KEY (`team_id`) REFERENCES `core_team` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_team_members`
--

LOCK TABLES `core_team_members` WRITE;
/*!40000 ALTER TABLE `core_team_members` DISABLE KEYS */;
INSERT INTO `core_team_members` VALUES (1,1,2),(5,1,3),(2,2,2),(6,2,3),(3,3,2),(7,3,3),(4,4,2),(8,4,3),(9,5,5),(11,5,6),(10,6,5),(12,6,6),(13,7,3),(15,7,4),(14,8,3),(16,8,8),(18,9,3),(19,10,4),(17,11,2),(20,11,4),(23,12,5),(22,13,4),(24,13,5),(21,14,2),(25,15,1),(35,15,10),(26,16,1),(27,16,2),(28,16,3),(32,16,7),(34,16,9),(36,16,10),(29,17,3),(30,17,4),(31,18,6),(33,18,7),(37,19,2),(38,19,5),(39,19,6),(40,19,7),(41,19,9),(42,19,10);
/*!40000 ALTER TABLE `core_team_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user`
--

DROP TABLE IF EXISTS `core_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_user` (
  `id` bigint(20) NOT NULL,
  `username` varchar(45) NOT NULL,
  `fullname` varchar(45) NOT NULL,
  `date_of_birth` date NOT NULL,
  `email` varchar(45) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  CONSTRAINT `core_user_id_a73ad060_fk_core_owner_id` FOREIGN KEY (`id`) REFERENCES `core_owner` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user`
--

LOCK TABLES `core_user` WRITE;
/*!40000 ALTER TABLE `core_user` DISABLE KEYS */;
INSERT INTO `core_user` VALUES (1,'konsletr','Konstantinos Letros','1997-02-10','konsletr@ece.auth.gr','2006-10-28 20:07:00.000000'),(2,'imanousar','Ioannis Manousaridis','1997-01-11','imanousar@ece.auth.gr','2005-08-04 06:53:00.000000'),(3,'alexsah','Alexandros Sahinis','1997-06-09','alexsach@ece.auth.gr','2007-03-13 20:07:00.000000'),(4,'dimpap','Dimitris Papagiannakis','1986-08-01','dimpap@gmail.com','2010-01-20 21:16:00.000000'),(5,'georgepap','Georgios Papadopoulos','2001-03-03','geopap4@gmail.com','2009-11-18 19:11:00.000000'),(6,'johnbin','Ioannis Binousidis','1988-07-02','binous@gmail.com','2007-06-05 16:37:00.000000'),(7,'batman','Bruce Wayne','1980-02-01','batman@gmail.com','2009-01-27 09:45:00.000000'),(8,'joker','Arthur Fleck','1964-02-06','joker@gmail.com','2006-12-12 18:36:00.000000'),(9,'superman','Clark Kent','1974-01-09','superman@gmail.com','2010-10-14 16:53:00.000000'),(10,'flash','Barry Allen','1989-09-11','flash@gmail.com','2007-08-26 13:22:00.000000');
/*!40000 ALTER TABLE `core_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (10,'admin','logentry'),(12,'auth','group'),(11,'auth','permission'),(13,'auth','user'),(14,'contenttypes','contenttype'),(4,'core','commit'),(7,'core','commitfile'),(9,'core','issue'),(6,'core','languagerepo'),(5,'core','org'),(1,'core','owner'),(3,'core','repo'),(8,'core','team'),(2,'core','user'),(15,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-01-05 23:01:16.840446'),(2,'auth','0001_initial','2020-01-05 23:01:16.982739'),(3,'admin','0001_initial','2020-01-05 23:01:17.228195'),(4,'admin','0002_logentry_remove_auto_add','2020-01-05 23:01:17.265534'),(5,'admin','0003_logentry_add_action_flag_choices','2020-01-05 23:01:17.272216'),(6,'contenttypes','0002_remove_content_type_name','2020-01-05 23:01:17.341977'),(7,'auth','0002_alter_permission_name_max_length','2020-01-05 23:01:17.371734'),(8,'auth','0003_alter_user_email_max_length','2020-01-05 23:01:17.413035'),(9,'auth','0004_alter_user_username_opts','2020-01-05 23:01:17.434700'),(10,'auth','0005_alter_user_last_login_null','2020-01-05 23:01:17.462832'),(11,'auth','0006_require_contenttypes_0002','2020-01-05 23:01:17.467013'),(12,'auth','0007_alter_validators_add_error_messages','2020-01-05 23:01:17.491232'),(13,'auth','0008_alter_user_username_max_length','2020-01-05 23:01:17.524574'),(14,'auth','0009_alter_user_last_name_max_length','2020-01-05 23:01:17.562526'),(15,'auth','0010_alter_group_name_max_length','2020-01-05 23:01:17.598799'),(16,'auth','0011_update_proxy_permissions','2020-01-05 23:01:17.627111'),(17,'core','0001_initial','2020-01-05 23:01:17.932996'),(18,'core','0002_auto_20200102_1903','2020-01-05 23:01:18.370128'),(19,'core','0003_auto_20200103_1311','2020-01-05 23:01:18.383955'),(20,'sessions','0001_initial','2020-01-05 23:01:18.398482');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-06  1:02:27
