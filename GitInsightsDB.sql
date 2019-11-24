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
  `hash` binary(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `repo_id` bigint(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `branch` varchar(50) NOT NULL,
  PRIMARY KEY (`hash`),
  KEY `userID_idx` (`user_id`),
  KEY `repoID_idx` (`repo_id`),
  CONSTRAINT `userID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `repoID` FOREIGN KEY (`repo_id`) REFERENCES `repo` (`repo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
-- Table structure for table `language - repo`
--

DROP TABLE IF EXISTS `language - repo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language - repo` (
  `language` varchar(50) NOT NULL,
  `repo_id` bigint(20) NOT NULL,
  `lines_of_code` int(11) NOT NULL,
  PRIMARY KEY (`language`,`repo_id`),
  KEY `repoID_idx` (`repo_id`),
  CONSTRAINT `IDrepo` FOREIGN KEY (`repo_id`) REFERENCES `repo` (`repo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `languageName` FOREIGN KEY (`language`) REFERENCES `programming language` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language - repo`
--

LOCK TABLES `language - repo` WRITE;
/*!40000 ALTER TABLE `language - repo` DISABLE KEYS */;
INSERT INTO `language - repo` VALUES ('C#',156265,586),('JAVA',24,43234),('JAVA',156265,296),('JavaScript',5656,3231),('Python',5656,2312),('Python',156265,167);
/*!40000 ALTER TABLE `language - repo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization` (
  `name` varchar(50) NOT NULL,
  `description` text,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` VALUES ('auth-uni','The Aristotle University of Thessaloniki.'),('facebook','The world\'s most popular social networking web site'),('google','Google <3 Open Source'),('Netflix',' Inc.'),('robotics-4-all','Robotics team focused on delivering enhanced functionality in/with robots'),('The Guardian','The source code of the world\'s leading liberal voice'),('Twitter',' Inc.');
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization - user`
--

DROP TABLE IF EXISTS `organization - user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization - user` (
  `org_name` varchar(50) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`org_name`,`user_id`),
  KEY `ID_user_idx` (`user_id`),
  CONSTRAINT `ID_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `org_name` FOREIGN KEY (`org_name`) REFERENCES `organization` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization - user`
--

LOCK TABLES `organization - user` WRITE;
/*!40000 ALTER TABLE `organization - user` DISABLE KEYS */;
INSERT INTO `organization - user` VALUES ('amazon',315346),('apple',86),('auth-uni',21),('facebook',32),('google',426),('google',3123),('netflix',562),('netflix',994);
/*!40000 ALTER TABLE `organization - user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `owner` (
  `owner_id` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL,
  `owner_type` enum('User','Team') NOT NULL,
  PRIMARY KEY (`owner_id`),
  KEY `id` (`id`),
  KEY `owner_type` (`owner_type`),
  CONSTRAINT `idUser` FOREIGN KEY (`id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idTeam` FOREIGN KEY (`id`) REFERENCES `team` (`team_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner`
--

LOCK TABLES `owner` WRITE;
/*!40000 ALTER TABLE `owner` DISABLE KEYS */;
INSERT INTO `owner` VALUES (13123,4234,'User'),(31311,41,'User'),(31589,123,'Team'),(51615,12,'Team'),(89415,123,'User'),(3124412,41,'Team');
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programming language`
--

DROP TABLE IF EXISTS `programming language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programming language` (
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programming language`
--

LOCK TABLES `programming language` WRITE;
/*!40000 ALTER TABLE `programming language` DISABLE KEYS */;
INSERT INTO `programming language` VALUES ('C#'),('C++'),('JAVA'),('JavaScript'),('Python'),('R');
/*!40000 ALTER TABLE `programming language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repo`
--

DROP TABLE IF EXISTS `repo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repo` (
  `repo_id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `owner_id` bigint(20) NOT NULL,
  `stars` int(11) NOT NULL,
  `forks` int(11) NOT NULL,
  `is_public` bit(1) NOT NULL,
  PRIMARY KEY (`repo_id`),
  KEY `owner_id` (`owner_id`),
  KEY `name` (`name`),
  CONSTRAINT `owner` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`owner_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repo`
--

LOCK TABLES `repo` WRITE;
/*!40000 ALTER TABLE `repo` DISABLE KEYS */;
INSERT INTO `repo` VALUES (123,'ml-course',2323,0,0,'\0'),(4352,'cats-classifier',21,43,2,''),(6363,'skroutz-crawler',21,432,50,''),(156265,'Bachelor?s Thesis Code',21,0,0,'\0'),(456384,'DB Project',51615,3,1,''),(468758,'Math Project',51615,7,2,'');
/*!40000 ALTER TABLE `repo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `team_id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `organization` varchar(50) NOT NULL,
  `description` text,
  PRIMARY KEY (`team_id`),
  KEY `organization` (`organization`),
  KEY `name` (`name`),
  CONSTRAINT `organization` FOREIGN KEY (`organization`) REFERENCES `organization` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'seo','amazon','Search Engine Optimization engineers'),(2,'frontend','facebook','Frontend developers at Facebook'),(43,'seo','google','Search Engine Optimization engineers'),(321,'db-team','auth-uni','AUTh Uni DB team'),(896,'transactions','amazon','Responsible for economic transactions'),(3213,'recommendations','netflix','Building content recommendation engine'),(328976,'analytics','facebook','Gather user analytics');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` bigint(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `date_of_birth_UNIQUE` (`date_of_birth`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (123,'konsletr','Konstantinos Letros','1997-02-10','konsletr@ece.auth.gr '),(248,'imanousar','Ioannis Manousaridis','1997-01-11','imanousar@ece.auth.gr'),(358,'johnbin','Ioannis Binousidis','1988-07-02','binous@gmail.com'),(543,'georgepap','Georgios Papadopoulos','2001-03-03','geopap4@gmail.com'),(846,'dimpap','Dimitris Papagiannakis','1986-08-01','dimpap@gmail.com'),(981,'alexsah','Alexandros Sahinis','1997-06-09','alexsach@ece.auth.gr');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user-team`
--

DROP TABLE IF EXISTS `user-team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user-team` (
  `team_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`team_id`,`user_id`),
  KEY `id_user_idx` (`user_id`),
  CONSTRAINT `id_user_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_team_fk` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user-team`
--

LOCK TABLES `user-team` WRITE;
/*!40000 ALTER TABLE `user-team` DISABLE KEYS */;
INSERT INTO `user-team` VALUES (2,23),(2,8629),(2,9780),(43,58),(43,98632),(321,4321),(3124,524);
/*!40000 ALTER TABLE `user-team` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-24 23:52:25
