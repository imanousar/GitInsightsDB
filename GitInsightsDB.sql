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
INSERT INTO `commit` VALUES ('027A12C2FC8568E8B70B07FF536FAF288A013670',1,20,'0000-00-00 00:00:00','master'),('03D67C263C27A453EF65B29E30334727333CCBCD',5,39,'0000-00-00 00:00:00','devel'),('073D41436E7F2B1B8344DA344D0B988B3FD5813C',3,32,'0000-00-00 00:00:00','master'),('09F199D25132204E99BFB1A89916DE24494F19BB',9,13,'0000-00-00 00:00:00','master'),('0AB8318ACAF6E678DD02E2B5C343ED41111B393D',7,35,'0000-00-00 00:00:00','master'),('0CE65B26DCD3C08E1B329D9EFBB6BBBCED426F31',3,24,'0000-00-00 00:00:00','junk'),('11760E1AAC4396E10D315E93AD3DF3E99204DC5E',3,7,'0000-00-00 00:00:00','bug'),('130E4A34F1B807A8F3BD24B204C06EC4DE4010DA',1,5,'0000-00-00 00:00:00','devel'),('17D53E0E6A68ACDF80B78D4F9D868C8736DB2CEC',2,6,'0000-00-00 00:00:00','master'),('180C89BF50C8B29DEB45E49D9DAC62FCD5C8BEDB',2,4,'0000-00-00 00:00:00','master'),('18740AF5BCEC9573BD3C059E0FC6570353097AAB',2,6,'0000-00-00 00:00:00','devel'),('1A591A3E91FCB7A47F2C08E9E2E117F39AF22078',2,17,'0000-00-00 00:00:00','devel'),('1AED9ECC6E1BE8EAAADDC5FFB6BA3ED84A8B1AE6',2,4,'0000-00-00 00:00:00','issues'),('1BF429F94068620B112ACA3888B58AECBC2EADEE',10,20,'0000-00-00 00:00:00','feat'),('1C39ABF68E93E438AE5DCA946E2D6A986CCCD3A9',3,31,'0000-00-00 00:00:00','bug'),('1ED5DD9D833F675B7509886681E2164D842F8DAD',3,31,'0000-00-00 00:00:00','devel'),('1F797564F7843D36EBE5E841E5BD39C98157E22B',2,16,'0000-00-00 00:00:00','master'),('1FEF42909247A6C230EEEF66277F2B5E0E8F274E',1,2,'0000-00-00 00:00:00','master'),('213598A7E92217BEE3A758F3C69AEA09ED940C0E',3,9,'0000-00-00 00:00:00','stable'),('213CB204509284FF2AEDECA9290B70A6DA307EAB',7,12,'0000-00-00 00:00:00','devel'),('259A6E935B848823A0C0B76ACED2803060B4BD0C',8,28,'0000-00-00 00:00:00','feat'),('26160D23FB07CF8D5DAE186EBA322E9FC8E27BB4',4,30,'0000-00-00 00:00:00','test'),('2C2FE4EC20E6C43DCC03E395AED7DB79756728A5',3,32,'0000-00-00 00:00:00','feat'),('2F36B6BB1852C24392FB3EE9A2879DA24EB0750D',3,7,'0000-00-00 00:00:00','bug'),('2F737399606486655401CB27B066F4658424766D',10,38,'0000-00-00 00:00:00','feat'),('314CCD964EF6A8E68AC5F9BB89F751A1C2196C56',4,25,'0000-00-00 00:00:00','master'),('317DBAC90743C3E5E82B2DDF122CD076A2226A92',2,6,'0000-00-00 00:00:00','master'),('349507E41DD8C71C10C9DF6D2444B5E64A285691',8,27,'0000-00-00 00:00:00','stable'),('354BF98925838CA68611B950E2A37EBD11C21640',6,15,'0000-00-00 00:00:00','master'),('35536A41B209715D9E3AD440431FEF2672F20BBE',3,8,'0000-00-00 00:00:00','feat'),('373616E39FB47D9A1A4E87DFD4EA968037435F14',1,5,'0000-00-00 00:00:00','master'),('37497AA5A2272C49714AEE1B07E8EDF973A95F59',2,17,'0000-00-00 00:00:00','master'),('3AE11C725C30009D4D3418BC6B30789FEED78322',3,23,'0000-00-00 00:00:00','master'),('3D91F7631BA813C13A08A208F1255B2E96FB03D0',1,1,'0000-00-00 00:00:00','devel'),('3F57ADF2C06CECD095FF83AB72787889961BBE87',2,16,'0000-00-00 00:00:00','junk'),('41349E9557E537855AE0F63CC43918FA13A561D3',4,22,'0000-00-00 00:00:00','master'),('41937B20FBE8C71D9C6C3346AFF43C001AA25E33',2,17,'0000-00-00 00:00:00','devel'),('42AB0C94A1E3BD6175A15DBA215CCF5F10E861E5',3,32,'0000-00-00 00:00:00','devel'),('4617585B8749A71BBB21237CAB6C2DC9CBE3B86F',7,12,'0000-00-00 00:00:00','stable'),('4902A456CAA9A4EAB463CE526C9DF0F6180BE184',2,4,'0000-00-00 00:00:00','master'),('4C197DFD67F1ED79D11A8B0218CC368BFCCE6CCB',7,29,'0000-00-00 00:00:00','issues'),('4EDED9AD930D56B01A3D8527B3220B71078001B0',2,32,'0000-00-00 00:00:00','master'),('5076721C4060FEEB69BD2C3DD9BDCE115D5C62F3',7,12,'0000-00-00 00:00:00','master'),('55949D4C16632F1C275D7684A379B8F1717B3904',7,35,'0000-00-00 00:00:00','junk'),('593905B31972F6FFE58325ABF98595CAF4EBF458',3,31,'0000-00-00 00:00:00','master'),('5A3E269AEE59E6826F23720F6FDD069D83BC087A',2,31,'0000-00-00 00:00:00','master'),('5AA588714AB4CBFD615D238FD9778C3A14CA4BA8',7,11,'0000-00-00 00:00:00','feat'),('5C77726358C5DAF98AD9CDCCD0882BCA0F718B88',1,5,'0000-00-00 00:00:00','master'),('5CAA7F811B5AFF6EB9993F309C4C045785EE67EC',2,16,'0000-00-00 00:00:00','master'),('5CB4C9D828175ED3931EC52305B32F47173A8E04',3,7,'0000-00-00 00:00:00','issues'),('5EEDD6A16AB862CB5D6B2E194E0BDF8B0161D89A',3,7,'0000-00-00 00:00:00','feat'),('5F4599DAA3415F788C1AFC3DB145F01B4BD2B438',3,9,'0000-00-00 00:00:00','bug'),('60A8B0C6DE6F6ABE5999959A5C7352750116FB9C',2,18,'0000-00-00 00:00:00','feat'),('63F1D3CFA0EC638B8F43AABD01A426C50A6E4653',4,22,'0000-00-00 00:00:00','issues'),('6557ACA8CD65D427A5621EFFA3E8EF5C27FEF340',2,3,'0000-00-00 00:00:00','issues'),('674027E17B0ED64E76CDE2005CB8E76FB4CD671A',1,40,'0000-00-00 00:00:00','master'),('6C6B1B2B3ECC0E6900000DABF4FAAE6F8DF5FFD1',2,18,'0000-00-00 00:00:00','bug'),('6D613A1EE01EEC4C0F8CA66DF0DB71DCA0C6E1CF',4,30,'0000-00-00 00:00:00','devel'),('73A7DDD505F2FC2CEAD1522E54A794328F228C44',5,39,'0000-00-00 00:00:00','master'),('74A788CEE27D549015A0786732C662E05CDD7567',8,28,'0000-00-00 00:00:00','raspberry'),('77F256B43643417F9B6622ADFF8BD31AE6EA7781',7,11,'0000-00-00 00:00:00','master'),('7971E6A051104074FDAE0F02322417B6EB5695A2',3,24,'0000-00-00 00:00:00','master'),('7998BE8D446D668C99ABCA446CB3BD79FCE08D2B',4,25,'0000-00-00 00:00:00','master'),('79B9D273AC6D2488109D1EA43E2BDB7977BD2B28',6,15,'0000-00-00 00:00:00','TZ-2001'),('7C39974F44B2B12933C66A9EBA3FE33C8D0805B6',1,5,'0000-00-00 00:00:00','stable'),('80EAF3087B0B041473C6C223F1E09197B649362E',2,6,'0000-00-00 00:00:00','master'),('852ADDAB901CBC5699D190285A009D7A7035FB57',7,11,'0000-00-00 00:00:00','stable'),('85FA355BDB4F46FA53A20A441623D53D686D4036',3,23,'0000-00-00 00:00:00','master'),('889224E3FCA24A6AB17D01FE47A45BC82244E938',3,9,'0000-00-00 00:00:00','master'),('89DA124E04DFE1AD9946CD37D91A119E1D028898',8,27,'0000-00-00 00:00:00','master'),('8A4BF12E17B2BE590B12721EF8D5D0248698B5B6',4,25,'0000-00-00 00:00:00','master'),('8E40809E474F3E0705DDEF056618CE3E5043522A',8,28,'0000-00-00 00:00:00','feat'),('9113C6C0C1F9CB53E3543B53136BA30C51018373',4,26,'0000-00-00 00:00:00','feat'),('93295B0C76B900DA760A8E0F2E9A29A1BA4B0F4C',1,40,'0000-00-00 00:00:00','junk'),('93409AF2F208E7545F0F26996E048113EDD88652',4,26,'0000-00-00 00:00:00','stable'),('93B12BF57F18C13C9AD2F55E33A8E3FD786FC394',3,7,'0000-00-00 00:00:00','master'),('9491A68514DC1EF6BDD379F8E408C0D49CC3B6CE',6,37,'0000-00-00 00:00:00','master'),('95CB62724475A0D26872DACC00642D5080519324',2,17,'0000-00-00 00:00:00','master'),('967CE367D89DCCC133D71049F1197D29561B3726',3,23,'0000-00-00 00:00:00','bug'),('9D3BD1FB52785A7BAEB03B437E7B2ECBA54EF34F',8,28,'0000-00-00 00:00:00','devel'),('A001AF75EE89582F31CB4DB6D3DD0B4766C80050',7,10,'0000-00-00 00:00:00','feat'),('A06DCD71328FD2B44FA7F84012096E8F318E4B48',4,22,'0000-00-00 00:00:00','junk'),('A42522A0CDD6E41A1379E6C95D08A9C46A17249C',3,24,'0000-00-00 00:00:00','feat'),('A4842F0234D7270B757B60B6F17A1B9F4D560DAD',3,9,'0000-00-00 00:00:00','test'),('A84F56F2E6A77ECB4B2F89344446DD3FF91B87C4',7,11,'0000-00-00 00:00:00','devel'),('AD79EF0F076D3A686AB9738925F4DD2C7E69D7D1',3,23,'0000-00-00 00:00:00','test'),('B07CB9A2B24832A8197CD3DFA67D1D6ADFB0CFBB',9,13,'0000-00-00 00:00:00','master'),('B0DDCE0F54C916C106117E280AEAD4F9C0CBF1DF',6,15,'0000-00-00 00:00:00','bug'),('B3C92EECF0AA1905086059D9F6D3261D8FB19657',7,29,'0000-00-00 00:00:00','test'),('B47B54FD3A460F43EBBCABE5B10C189176F25F25',3,8,'0000-00-00 00:00:00','stable'),('B47F363E2B430C0647F14DEEA3ECED9B0EF300CE',7,10,'0000-00-00 00:00:00','test'),('BB130626B42C3CCE860334424AEF9A144F8231F2',6,15,'0000-00-00 00:00:00','master'),('BB2254A806F43DF24753CA390143E2CA8C1E4E80',7,12,'0000-00-00 00:00:00','master'),('BBB7EF7F2EC9557D0895C9DA1C5CDDD50D15049E',2,17,'0000-00-00 00:00:00','stable'),('BC1CD4F07D828493332F9C95C491D6FB338AFD40',2,19,'0000-00-00 00:00:00','issues'),('BC88A24030A15BDE613C8749ED93D30E0A81FCC2',9,13,'0000-00-00 00:00:00','stable'),('BCD23F5BB628B5F99FE4B850D6CE84C74E48BEF5',8,28,'0000-00-00 00:00:00','master'),('BD6ACC8626D118AEA60331CE33BF000C9D7D1CEE',6,15,'0000-00-00 00:00:00','TZ-2001'),('C484B137E2D18229E4E7E677F1F8CFCE6A0AB819',2,16,'0000-00-00 00:00:00','master'),('C5F5BB3B350774D7CDA57104C55FB6C82B7AE7D9',3,7,'0000-00-00 00:00:00','test'),('C69153687791FB52C12CE7CCA2F4D03A65D9ABF8',2,4,'0000-00-00 00:00:00','master'),('C78791A3F0E109D34BA4EAC2AFA35EC011439AE3',2,17,'0000-00-00 00:00:00','feat'),('C909B138EBA89ECFBD86DF4C9D170AC78D4A3820',8,27,'0000-00-00 00:00:00','master'),('CD1B646EBD1F6844C60DD91951C6867E43857114',4,30,'0000-00-00 00:00:00','bug'),('CD6A7B8768528485A0DBCD459185091E80DC28AD',2,18,'0000-00-00 00:00:00','issues'),('CEAFB51E2B0783D53DD620019DFF3AA66708A26F',2,4,'0000-00-00 00:00:00','feat'),('D2EAF2AA1512D6596E0A5BAE633537C6B8E779A3',1,5,'0000-00-00 00:00:00','master'),('D7E0453BB4AF87006533F4D77AD9546DAC533DB8',3,31,'0000-00-00 00:00:00','master'),('DAA6A489DBCA7A13C480AAA1D0C344957590FDB7',2,19,'0000-00-00 00:00:00','raspberry'),('DBF2A2DA6458B242407285E7F1483AEB6CFEE9FD',2,6,'0000-00-00 00:00:00','devel'),('E3772AC4B4DB87B4A8DBFA59EF43CD1A8AD29515',7,29,'0000-00-00 00:00:00','issues'),('E5BB59A2731998CAE2070F6FD4F2E075FD61146F',3,8,'0000-00-00 00:00:00','junk'),('ED50AA2DE1123D2CB20C9D1F0F691C834FB6F548',2,3,'0000-00-00 00:00:00','bug'),('F0A96DA3F86A334CBE8D569110D6545277973859',2,4,'0000-00-00 00:00:00','feat'),('F14E46CE7D094F9326167ACC499698128651BE85',5,36,'0000-00-00 00:00:00','master'),('F92BCB6A06D2EC7C0AF7C8A338F131BF887C64A0',3,34,'0000-00-00 00:00:00','master'),('FA6C3752CD00F7F1277FD7E5604AB8D2EDAF26B8',7,10,'0000-00-00 00:00:00','test'),('FCF29F6CAD3232704B33E962EF5194FAD3B6817B',4,25,'0000-00-00 00:00:00','master'),('FF3EA3BEC182358766650A6FD2872D9221F7E6CC',5,14,'0000-00-00 00:00:00','bug'),('FFB0EAF998E6B2C3D5052AF77023A08FC1736781',9,13,'0000-00-00 00:00:00','feat'),('hash\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,'0000-00-00 00:00:00','branch');
/*!40000 ALTER TABLE `commit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_repo`
--

DROP TABLE IF EXISTS `language_repo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language_repo` (
  `language` varchar(50) NOT NULL,
  `repo_id` bigint(20) NOT NULL,
  `lines_of_code` int(11) NOT NULL,
  PRIMARY KEY (`language`,`repo_id`),
  KEY `repoID_idx` (`repo_id`),
  CONSTRAINT `IDrepo` FOREIGN KEY (`repo_id`) REFERENCES `repo` (`repo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `languageName` FOREIGN KEY (`language`) REFERENCES `programming_language` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_repo`
--

LOCK TABLES `language_repo` WRITE;
/*!40000 ALTER TABLE `language_repo` DISABLE KEYS */;
INSERT INTO `language_repo` VALUES ('C',10,256),('C',11,102),('C#',9,234),('C#',35,340),('C++',10,245),('C++',11,150),('C++',14,1),('C++',27,392),('C++',34,353),('CSS',8,234),('CSS',16,420),('CSS',17,503),('CSS',18,140),('CSS',39,320),('HTML',8,120),('HTML',16,320),('HTML',17,560),('HTML',18,530),('HTML',39,215),('JAVA',7,543),('JAVA',31,292),('Matlab',2,343),('Matlab',4,423),('Matlab',10,230),('Matlab',11,125),('Python',4,433),('Python',5,323),('Python',10,235),('Python',11,92),('Python',19,450),('Python',22,653),('Python',23,842),('Python',24,253),('Python',25,182),('Python',26,593),('Python',30,293),('Python',31,394),('Python',35,321),('Python',36,394),('Python',37,395),('Python',38,320),('R',15,1),('R',22,603),('R',23,269),('R',24,182),('SQL',1,543),('SQL',40,231),('Tex',3,234),('Tex',6,23),('Tex',12,124),('Tex',13,156),('Tex',16,134),('Tex',17,560),('Tex',18,503),('Tex',20,653),('Tex',21,356),('Tex',28,385),('Tex',29,832),('Tex',32,392),('Tex',33,124);
/*!40000 ALTER TABLE `language_repo` ENABLE KEYS */;
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
INSERT INTO `organization` VALUES ('Auth-Uni','The Aristotle University of Thessaloniki.'),('Facebook','The world\'s most popular social networking web site'),('Google','Google <3 Open Source'),('Netflix','Inc. Netflix Open Source Platform'),('Robotics-4-All','Robotics team focused on delivering enhanced functionality in/with robots in a fast and easy manner.'),('The Guardian','The source code of the world\'s leading liberal voice'),('Twitter','Inc.Working with and contributing to the open source community');
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_user`
--

DROP TABLE IF EXISTS `organization_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_user` (
  `org_name` varchar(50) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`org_name`,`user_id`),
  KEY `ID_user_idx` (`user_id`),
  CONSTRAINT `ID_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `org_name` FOREIGN KEY (`org_name`) REFERENCES `organization` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_user`
--

LOCK TABLES `organization_user` WRITE;
/*!40000 ALTER TABLE `organization_user` DISABLE KEYS */;
INSERT INTO `organization_user` VALUES ('Auth-Uni',1),('Facebook',3),('Facebook',7),('Google',2),('Google',6),('Google',7),('Netflix',7),('Netflix',9),('Netflix',10),('Robotics-4-All',8),('The Guardian',7),('The Guardian',10),('Twitter',10);
/*!40000 ALTER TABLE `organization_user` ENABLE KEYS */;
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
INSERT INTO `owner` VALUES (1,1,'User'),(2,2,'User'),(3,3,'User'),(4,4,'User'),(5,5,'User'),(6,6,'User'),(7,7,'User'),(8,8,'User'),(9,9,'User'),(10,10,'User'),(11,1,'Team'),(12,2,'Team'),(13,3,'Team'),(14,4,'Team'),(15,5,'Team'),(16,6,'Team'),(17,7,'Team'),(18,8,'Team'),(19,9,'Team'),(20,10,'Team'),(21,11,'Team'),(22,12,'Team'),(23,13,'Team'),(24,14,'Team'),(25,15,'Team'),(26,16,'Team'),(27,17,'Team'),(28,18,'Team'),(29,19,'Team'),(30,20,'Team');
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programming_language`
--

DROP TABLE IF EXISTS `programming_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programming_language` (
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programming_language`
--

LOCK TABLES `programming_language` WRITE;
/*!40000 ALTER TABLE `programming_language` DISABLE KEYS */;
INSERT INTO `programming_language` VALUES ('Assembly'),('Bash'),('C'),('C#'),('C++'),('CSS'),('Erlang'),('Go'),('HTML'),('Java'),('Javascript'),('Kotlin'),('Matlab'),('Octave'),('PHP'),('Python'),('R'),('Racket'),('Ruby'),('SQL'),('Swift'),('Tex'),('Visual Basic');
/*!40000 ALTER TABLE `programming_language` ENABLE KEYS */;
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
INSERT INTO `repo` VALUES (1,'DB Project',1,2,0,''),(2,'Math Project',1,3,0,''),(3,'Bachelor Thesis Code',2,5,0,''),(4,'ML-course',2,0,0,'\0'),(5,'Test',1,0,2,''),(6,'kicad',2,3,2,''),(7,'Networks',3,0,0,'\0'),(8,'portfolio',3,1,1,''),(9,'embedded systems',3,2,0,''),(10,'batmobile',7,0,0,'\0'),(11,'batcopter',7,0,0,'\0'),(12,'Arkam Hospital',7,123,4,''),(13,'Photos',9,340,0,''),(14,'Test',5,0,0,'\0'),(15,'Test',6,1,0,''),(16,'premier league',18,520,42,''),(17,'Tennis',18,234,20,''),(18,'Live Bet',18,0,0,'\0'),(19,'Sfhmmy',20,0,0,'\0'),(20,'Doomsday',28,0,0,'\0'),(21,'Suicide Squad',28,0,0,'\0'),(22,'Pattern Recognition',17,120,23,''),(23,'Voice Recognition',23,532,53,''),(24,'Speech Recognition',23,434,43,''),(25,'African Languages',24,23,3,''),(26,'European Languages',24,234,55,''),(27,'Harvey Dent Creation',8,0,0,'\0'),(28,'Bombs',8,0,0,'\0'),(29,'Joker Plans',7,0,0,'\0'),(30,'English ',24,34,55,''),(31,'NAO',20,20,22,''),(32,'Latex-template',30,25,10,''),(33,'Word-template',30,33,7,''),(34,'ROS',19,23,4,''),(35,'Alpha Bank ',16,0,0,'\0'),(36,'Flask',11,0,0,'\0'),(37,'Django',26,0,0,'\0'),(38,'Flask',22,0,0,'\0'),(39,'Trump',29,54,1,''),(40,'MySQL worbench',22,0,0,'\0');
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
INSERT INTO `team` VALUES (1,'db-team','Auth-Uni','AUTh Uni DB team'),(2,'frontend','Facebook','Frontend developers at Facebook'),(3,'seo','Google','Search Engine Optimization engineers'),(4,'analytics','Facebook','Gather user analytics'),(5,'seo','The Guardian','Search Engine Optimization engineers'),(6,'transactions','Netflix','Responsible for economic transactions'),(7,'recommendations','Netflix','Building content recommendation engine'),(8,'sport','The Guardian','Responsible for sports webpage '),(9,'pandora','Robotics-4-All','Building autonomous robots'),(10,'IoT','Robotics-4-All','Team working on Internet-of-Things aspects'),(11,'Students','Robotics-4-All','Student from University'),(12,'db-team','Netflix','Netflix DB team'),(13,'Google AI Research','Google','Building the future'),(14,'Google Translate','Google','Google translate\'s developers'),(15,'erasmus','Auth-Uni','Erasmus Department Website'),(16,'db-team','Twitter','Twitter DB-team'),(17,'security','Twitter','Twitter security-team'),(18,'Justice League','Netflix','Justice League Team'),(19,'Politics','The Guardian','Politics Webpage'),(20,'thesis-templates','Robotics-4-All','Templates for thesis document');
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
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'konsletr','Konstantinos Letros','0000-00-00','konsletr@ece.auth.gr'),(2,'imanousar','Ioannis Manousaridis','0000-00-00','imanousar@ece.auth.gr'),(3,'alexsah','Alexandros Sahinis','0000-00-00','alexsach@ece.auth.gr'),(4,'dimpap','Dimitris Papagiannakis','0000-00-00','dimpap@gmail.com'),(5,'georgepap','Georgios Papadopoulos','0000-00-00','geopap4@gmail.com'),(6,'johnbin','Ioannis Binousidis','0000-00-00','binous@gmail.com'),(7,'batman','Bruce Wayne','0000-00-00','batman@gmail.com'),(8,'joker','Arthur Fleck','0000-00-00','joker@gmail.com'),(9,'superman','Clark Kent','0000-00-00','superman@gmail.com'),(10,'flash','Barry Allen','0000-00-00','flash@gmail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_team`
--

DROP TABLE IF EXISTS `user_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_team` (
  `team_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`team_id`,`user_id`),
  KEY `id_user_idx` (`user_id`),
  CONSTRAINT `id_user_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_team_fk` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Dumping data for table `user_team`
--

LOCK TABLES `user_team` WRITE;
/*!40000 ALTER TABLE `user_team` DISABLE KEYS */;
INSERT INTO `user_team` VALUES (1,5),(1,6),(2,8),(3,2),(3,4),(4,3),(4,4),(5,4),(5,5),(6,6),(6,7),(7,3),(7,4),(8,2),(9,2),(9,3),(10,2),(10,3),(11,2),(11,3),(12,1),(12,10),(13,3),(14,4),(15,5),(15,6),(16,2),(16,5),(16,6),(16,10),(17,7),(17,9),(18,1),(18,2),(18,3),(18,7),(18,9),(18,10),(19,5),(20,2),(20,3);
/*!40000 ALTER TABLE `user_team` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-26 13:06:45
