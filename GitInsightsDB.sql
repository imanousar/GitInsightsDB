SET FOREIGN_KEY_CHECKS=0;


-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: gitinsightsdb
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

DROP SCHEMA IF EXISTS `gitinsightsdb`;
CREATE SCHEMA `gitinsightsdb`;
USE `gitinsightsdb`;

--
-- Table structure for table `commit`
--

DROP TABLE IF EXISTS `commit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commit` (
  `hash` binary(40) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `repo_id` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `branch` varchar(45) NOT NULL,
  PRIMARY KEY (`hash`),
  KEY `userID_idx` (`user_id`),
  KEY `repoID_idx` (`repo_id`),
  CONSTRAINT `userID` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `repoID` FOREIGN KEY (`repo_id`) REFERENCES `repo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commit`
--

LOCK TABLES `commit` WRITE;
/*!40000 ALTER TABLE `commit` DISABLE KEYS */;
/*!40000 ALTER TABLE `commit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commit_file`
--

DROP TABLE IF EXISTS `commit_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commit_file` (
  `hash` binary(40) NOT NULL,
  `repo_id` bigint(20) NOT NULL,
  `filename` varchar(45) NOT NULL,
  `action` enum('create','update','delete','rename') NOT NULL,
  PRIMARY KEY (`hash`,`repo_id`,`filename`),
  KEY `repo_id_idx` (`repo_id`),
  CONSTRAINT `hash` FOREIGN KEY (`hash`) REFERENCES `commit` (`hash`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `repo_id` FOREIGN KEY (`repo_id`) REFERENCES `repo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commit_file`
--

LOCK TABLES `commit_file` WRITE;
/*!40000 ALTER TABLE `commit_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `commit_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue`
--

DROP TABLE IF EXISTS `issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue` (
  `repo_id` bigint(20) NOT NULL,
  `title` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `state` enum('open','closed') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `label` enum('bug','feature','documentation','help','other') NOT NULL,
  `author` bigint(20) NOT NULL,
  PRIMARY KEY (`repo_id`,`title`),
  KEY `author_fk_idx` (`author`),
  CONSTRAINT `author_fk` FOREIGN KEY (`author`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `repo_id_fk` FOREIGN KEY (`repo_id`) REFERENCES `repo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue`
--

LOCK TABLES `issue` WRITE;
/*!40000 ALTER TABLE `issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_repo`
--

DROP TABLE IF EXISTS `language_repo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language_repo` (
  `language` varchar(45) NOT NULL,
  `repo_id` bigint(20) NOT NULL,
  `lines_of_code` int(11) NOT NULL,
  KEY `repoID_idx` (`repo_id`),
  CONSTRAINT `IDrepo` FOREIGN KEY (`repo_id`) REFERENCES `repo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_repo`
--

LOCK TABLES `language_repo` WRITE;
/*!40000 ALTER TABLE `language_repo` DISABLE KEYS */;
/*!40000 ALTER TABLE `language_repo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `master_commits_in_repos`
--

DROP TABLE IF EXISTS `master_commits_in_repos`;
/*!50001 DROP VIEW IF EXISTS `master_commits_in_repos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `master_commits_in_repos` AS SELECT 
 1 AS `repo_id`,
 1 AS `repo`,
 1 AS `hash`,
 1 AS `commit_timestamp`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization` (
  `id` bigint(20) NOT NULL,
  `description` text,
  `name` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  CONSTRAINT `owner_id_fk` FOREIGN KEY (`id`) REFERENCES `owner` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` VALUES (11,'Robotics team focused on delivering enhanced functionality in/with robots in a fast and easy manner.','Robotics-4-All','2011-11-06 16:01:00'),(12,'The Aristotle University of Thessaloniki.','Auth-Uni','2012-05-06 16:08:00'),(13,'The world\'s most popular social networking web site','Facebook','2010-03-14 18:08:00'),(14,'Google <3 Open Source','Google','2012-01-14 21:06:00'),(15,'The source code of the world\'s leading liberal voice','The Guardian','2012-08-14 10:25:00'),(16,'Inc. Netflix Open Source Platform','Netflix','2011-07-18 19:58:00'),(17,'Inc.Working with and contributing to the open source community','Twitter','2012-08-14 05:28:00');
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_user`
--

DROP TABLE IF EXISTS `organization_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_user` (
  `org_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`org_id`,`user_id`),
  KEY `ID_user_idx` (`user_id`),
  CONSTRAINT `ID_user_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `org_id_fk` FOREIGN KEY (`org_id`) REFERENCES `organization` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_user`
--

LOCK TABLES `organization_user` WRITE;
/*!40000 ALTER TABLE `organization_user` DISABLE KEYS */;
INSERT INTO `organization_user` VALUES (11,8),(12,1),(13,3),(13,7),(14,2),(14,6),(14,7),(15,7),(15,10),(16,7),(16,9),(16,10),(17,10);
/*!40000 ALTER TABLE `organization_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `owner` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` enum('user','org') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `owner_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner`
--

LOCK TABLES `owner` WRITE;
/*!40000 ALTER TABLE `owner` DISABLE KEYS */;
INSERT INTO `owner` VALUES (1,'user'),(2,'user'),(3,'user'),(4,'user'),(5,'user'),(6,'user'),(7,'user'),(8,'user'),(9,'user'),(10,'user'),(11,'org'),(12,'org'),(13,'org'),(14,'org'),(15,'org'),(16,'org'),(17,'org');
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repo`
--

DROP TABLE IF EXISTS `repo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `owner_id` bigint(20) NOT NULL,
  `stars` int(11) NOT NULL,
  `forks` int(11) NOT NULL,
  `is_public` bit(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_repo_name_owner_id` (`name`,`owner_id`),
  KEY `owner_id` (`owner_id`),
  KEY `name` (`name`),
  CONSTRAINT `owner` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repo`
--

LOCK TABLES `repo` WRITE;
/*!40000 ALTER TABLE `repo` DISABLE KEYS */;
INSERT INTO `repo` VALUES (1,'DB Project',1,2,0,'','2019-12-03 18:54:00'),(2,'Math Project',1,3,0,'','2017-08-11 12:45:00'),(3,'Bachelor Thesis Code',2,5,0,'','2018-04-24 07:37:00'),(4,'ML-course',2,0,0,'\0','2016-05-16 07:05:00'),(5,'Test',1,0,2,'','2015-06-02 20:31:00'),(6,'kicad',2,3,2,'','2016-11-08 19:53:00'),(7,'Networks',3,0,0,'\0','2018-07-26 02:00:00'),(8,'portfolio',3,1,1,'','2016-03-18 05:49:00'),(9,'embedded systems',3,2,0,'','2019-05-23 00:37:00'),(10,'batmobile',7,0,0,'\0','2015-07-25 03:14:00'),(11,'batcopter',7,0,0,'\0','2017-02-07 13:33:00'),(12,'Arkam Hospital',7,123,4,'','2018-09-08 06:21:00'),(13,'Photos',9,340,0,'','2015-11-09 09:47:00'),(14,'Test',5,0,0,'\0','2015-09-04 19:53:00'),(15,'Test',6,1,0,'','2018-12-04 16:49:00'),(16,'premier league',15,520,42,'','2015-06-01 04:08:00'),(17,'Tennis',15,234,20,'','2017-10-12 09:55:00'),(18,'Live Bet',15,0,0,'\0','2017-11-02 17:20:00'),(19,'Sfhmmy',11,0,0,'\0','2019-05-04 21:57:00'),(20,'Doomsday',16,0,0,'\0','2019-12-20 20:15:00'),(21,'Suicide Squad',16,0,0,'\0','2019-04-03 15:05:00'),(22,'Pattern Recognition',16,120,23,'','2017-08-05 09:38:00'),(23,'Voice Recognition',14,532,53,'','2017-11-04 08:39:00'),(24,'Speech Recognition',14,434,43,'','2019-09-06 10:52:00'),(25,'African Languages',14,23,3,'','2018-11-24 01:11:00'),(26,'European Languages',14,234,55,'','2015-01-17 12:55:00'),(27,'Harvey Dent Creation',8,0,0,'\0','2016-06-08 14:07:00'),(28,'Bombs',8,0,0,'\0','2019-09-10 11:28:00'),(29,'Joker Plans',7,0,0,'\0','2019-09-08 20:11:00'),(30,'English',14,34,55,'','2017-03-06 14:10:00'),(31,'NAO',11,20,22,'','2016-06-26 02:00:00'),(32,'Latex-template',11,25,10,'','2018-07-14 23:59:00'),(33,'Word-template',11,33,7,'','2018-05-01 10:30:00'),(34,'ROS',11,23,4,'','2015-11-02 05:47:00'),(35,'Alpha Bank',16,0,0,'\0','2017-10-21 12:39:00'),(36,'Flask',12,0,0,'\0','2017-05-19 07:07:00'),(37,'Django',17,0,0,'\0','2017-05-12 15:31:00'),(38,'Flask',16,0,0,'\0','2015-04-13 12:42:00'),(39,'Trump',15,54,1,'','2019-02-27 01:58:00'),(40,'MySQL worbench',16,0,0,'\0','2016-01-09 17:04:00');
/*!40000 ALTER TABLE `repo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `org_id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` text,
  PRIMARY KEY (`org_id`,`name`),
  KEY `name` (`name`),
  CONSTRAINT `organization` FOREIGN KEY (`org_id`) REFERENCES `organization` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (11,'IoT','2013-09-05 17:54:00','Team working on Internet-of-Things aspects'),(11,'pandora','2013-03-06 03:45:00','Building autonomous robots'),(11,'Students','2014-07-05 09:32:00','Student from University'),(11,'thesis-templates','2011-12-17 19:25:00','Templates for thesis document'),(12,'db-team','2013-09-11 04:41:00','AUTh Uni DB team'),(12,'erasmus','2014-05-23 01:19:00','Erasmus Department Website'),(13,'analytics','2013-09-12 12:12:00','Gather user analytics'),(13,'frontend','2013-01-14 01:15:00','Frontend developers at Facebook'),(14,'Google AI Research','2014-04-17 05:08:00','Building the future'),(14,'Google Translate','2014-08-19 14:50:00','Google translate\'s developers'),(14,'seo','2014-02-16 05:22:00','Search Engine Optimization engineers'),(15,'Politics','2014-11-15 19:58:00','Politics Webpage'),(15,'seo','2013-08-10 05:10:00','Search Engine Optimization engineers'),(15,'sport','2014-12-16 13:34:00','Responsible for sports webpage '),(16,'db-team','2011-07-06 11:01:00','Netflix DB team'),(16,'Justice League','2011-12-09 02:01:00','Justice League Team'),(16,'recommendations','2013-05-11 17:27:00','Building content recommendation engine'),(16,'transactions','2014-05-22 02:50:00','Responsible for economic transactions'),(17,'db-team','2013-03-27 23:25:00','Twitter DB-team'),(17,'security','2013-02-12 12:59:00','Twitter security-team');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `username` varchar(45) NOT NULL,
  `fullname` varchar(45) NOT NULL,
  `date_of_birth` date NOT NULL,
  `email` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  CONSTRAINT `owner_id` FOREIGN KEY (`id`) REFERENCES `owner` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'konsletr','Konstantinos Letros','1997-02-10','konsletr@ece.auth.gr','2006-10-28 20:07:00'),(2,'imanousar','Ioannis Manousaridis','1997-01-11','imanousar@ece.auth.gr','2005-08-04 06:53:00'),(3,'alexsah','Alexandros Sahinis','1997-06-09','alexsach@ece.auth.gr','2007-03-13 20:07:00'),(4,'dimpap','Dimitris Papagiannakis','1986-08-01','dimpap@gmail.com','2010-01-20 21:16:00'),(5,'georgepap','Georgios Papadopoulos','2001-03-03','geopap4@gmail.com','2009-11-18 19:11:00'),(6,'johnbin','Ioannis Binousidis','1988-07-02','binous@gmail.com','2007-06-05 16:37:00'),(7,'batman','Bruce Wayne','1980-02-01','batman@gmail.com','2009-01-27 09:45:00'),(8,'joker','Arthur Fleck','1964-02-06','joker@gmail.com','2006-12-12 18:36:00'),(9,'superman','Clark Kent','1974-01-09','superman@gmail.com','2010-10-14 16:53:00'),(10,'flash','Barry Allen','1989-09-11','flash@gmail.com','2007-08-26 13:22:00');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_team`
--

DROP TABLE IF EXISTS `user_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_team` (
  `org_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `team_name` varchar(45) NOT NULL,
  PRIMARY KEY (`org_id`,`user_id`,`team_name`),
  KEY `id_user_idx` (`user_id`),
  KEY `name_team_fk_idx` (`team_name`),
  CONSTRAINT `id_user_fk_team` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_org_fk_team` FOREIGN KEY (`org_id`) REFERENCES `team` (`org_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `name_team_fk_team` FOREIGN KEY (`team_name`) REFERENCES `team` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_team`
--

LOCK TABLES `user_team` WRITE;
/*!40000 ALTER TABLE `user_team` DISABLE KEYS */;
INSERT INTO `user_team` VALUES (11,2,'IoT'),(11,2,'pandora'),(11,2,'Students'),(11,2,'thesis-templates'),(11,3,'IoT'),(11,3,'pandora'),(11,3,'Students'),(11,3,'thesis-templates'),(12,5,'db-team'),(12,5,'erasmus'),(12,6,'db-team'),(12,6,'erasmus'),(13,3,'analytics'),(13,4,'analytics'),(13,8,'frontend'),(14,2,'seo'),(14,3,'Google AI Research'),(14,4,'Google Translate'),(14,4,'seo'),(15,2,'sport'),(15,4,'seo'),(15,5,'Politics'),(15,5,'seo'),(16,1,'db-team'),(16,1,'Justice League'),(16,2,'Justice League'),(16,3,'Justice League'),(16,3,'recommendations'),(16,4,'recommendations'),(16,6,'transactions'),(16,7,'Justice League'),(16,7,'transactions'),(16,9,'Justice League'),(16,10,'db-team'),(16,10,'Justice League'),(17,2,'db-team'),(17,5,'db-team'),(17,6,'db-team'),(17,7,'db-team'),(17,9,'db-team'),(17,10,'db-team');
/*!40000 ALTER TABLE `user_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `users_latest_commits`
--

DROP TABLE IF EXISTS `users_latest_commits`;
/*!50001 DROP VIEW IF EXISTS `users_latest_commits`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `users_latest_commits` AS SELECT 
 1 AS `username`,
 1 AS `hash`,
 1 AS `created_at`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `users_master_commits_in_2019`
--

DROP TABLE IF EXISTS `users_master_commits_in_2019`;
/*!50001 DROP VIEW IF EXISTS `users_master_commits_in_2019`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `users_master_commits_in_2019` AS SELECT 
 1 AS `username`,
 1 AS `no_of_commits_in_2019`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `master_commits_in_repos`
--

/*!50001 DROP VIEW IF EXISTS `master_commits_in_repos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `master_commits_in_repos` AS select `repo`.`id` AS `repo_id`,`repo`.`name` AS `repo`,`commit`.`hash` AS `hash`,`commit`.`created_at` AS `commit_timestamp` from (`commit` join `repo` on((`repo`.`id` = `commit`.`repo_id`))) where (`commit`.`branch` = 'master') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `users_latest_commits`
--

/*!50001 DROP VIEW IF EXISTS `users_latest_commits`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `users_latest_commits` AS select `user`.`username` AS `username`,`o`.`hash` AS `hash`,`o`.`created_at` AS `created_at` from ((`commit` `o` left join `commit` `b` on(((`o`.`user_id` = `b`.`user_id`) and (`o`.`created_at` < `b`.`created_at`)))) join `user` on((`user`.`id` = `o`.`user_id`))) where isnull(`b`.`created_at`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `users_master_commits_in_2019`
--

/*!50001 DROP VIEW IF EXISTS `users_master_commits_in_2019`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `users_master_commits_in_2019` AS select `user`.`username` AS `username`,count(`commit`.`hash`) AS `no_of_commits_in_2019` from (`user` join `commit` on((`user`.`id` = `commit`.`user_id`))) where (`commit`.`created_at` between '2019-01-01 00:00:00' and '2019-12-31 23:59:59') group by `user`.`username` */;
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

-- Dump completed on 2019-12-11 13:54:59
