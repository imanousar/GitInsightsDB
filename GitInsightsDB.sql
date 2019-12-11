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
INSERT INTO `commit` VALUES ('027A12C2FC8568E8B70B07FF536FAF288A013670',2,3,'2018-12-05 18:38:22','master'),('03D67C263C27A453EF65B29E30334727333CCBCD',3,9,'2019-06-10 13:08:43','devel'),('073D41436E7F2B1B8344DA344D0B988B3FD5813C',4,30,'2019-10-21 00:39:31','master'),('09F199D25132204E99BFB1A89916DE24494F19BB',3,32,'2019-03-25 21:30:53','master'),('0AB8318ACAF6E678DD02E2B5C343ED41111B393D',7,37,'2017-08-14 15:42:54','master'),('0CE65B26DCD3C08E1B329D9EFBB6BBBCED426F31',1,5,'2018-12-12 12:09:22','junk'),('11760E1AAC4396E10D315E93AD3DF3E99204DC5E',2,3,'2019-09-20 22:51:56','bug'),('130E4A34F1B807A8F3BD24B204C06EC4DE4010DA',10,40,'2019-06-03 03:09:16','devel'),('17D53E0E6A68ACDF80B78D4F9D868C8736DB2CEC',1,20,'2019-12-21 09:32:26','master'),('180C89BF50C8B29DEB45E49D9DAC62FCD5C8BEDB',2,19,'2019-06-15 12:24:49','master'),('18740AF5BCEC9573BD3C059E0FC6570353097AAB',5,16,'2019-07-27 13:34:48','devel'),('1A591A3E91FCB7A47F2C08E9E2E117F39AF22078',2,4,'2017-01-09 05:39:57','devel'),('1AED9ECC6E1BE8EAAADDC5FFB6BA3ED84A8B1AE6',5,14,'2018-01-26 02:05:18','issues'),('1BF429F94068620B112ACA3888B58AECBC2EADEE',5,14,'2017-02-03 23:24:26','feat'),('1C39ABF68E93E438AE5DCA946E2D6A986CCCD3A9',7,12,'2018-12-06 07:44:49','bug'),('1ED5DD9D833F675B7509886681E2164D842F8DAD',4,16,'2017-04-22 13:07:07','devel'),('1F797564F7843D36EBE5E841E5BD39C98157E22B',3,9,'2019-09-08 07:32:56','master'),('1FEF42909247A6C230EEEF66277F2B5E0E8F274E',1,2,'2018-02-17 04:02:45','master'),('213598A7E92217BEE3A758F3C69AEA09ED940C0E',2,6,'2018-03-14 06:57:55','stable'),('213CB204509284FF2AEDECA9290B70A6DA307EAB',7,10,'2018-10-17 05:17:27','devel'),('259A6E935B848823A0C0B76ACED2803060B4BD0C',8,28,'2019-12-15 00:06:08','feat'),('26160D23FB07CF8D5DAE186EBA322E9FC8E27BB4',1,5,'2019-03-05 13:53:30','test'),('2C2FE4EC20E6C43DCC03E395AED7DB79756728A5',7,12,'2018-12-07 14:17:40','feat'),('2F36B6BB1852C24392FB3EE9A2879DA24EB0750D',2,35,'2019-10-20 22:04:05','bug'),('2F737399606486655401CB27B066F4658424766D',5,37,'2019-05-19 06:50:49','feat'),('314CCD964EF6A8E68AC5F9BB89F751A1C2196C56',7,12,'2018-10-18 21:36:23','master'),('317DBAC90743C3E5E82B2DDF122CD076A2226A92',5,36,'2017-06-24 17:16:12','master'),('349507E41DD8C71C10C9DF6D2444B5E64A285691',2,4,'2018-09-18 19:12:42','stable'),('354BF98925838CA68611B950E2A37EBD11C21640',4,23,'2019-08-23 07:25:49','master'),('35536A41B209715D9E3AD440431FEF2672F20BBE',1,5,'2019-09-16 01:35:17','feat'),('373616E39FB47D9A1A4E87DFD4EA968037435F14',6,36,'2019-12-21 06:35:06','master'),('37497AA5A2272C49714AEE1B07E8EDF973A95F59',1,5,'2019-12-15 05:06:36','master'),('3AE11C725C30009D4D3418BC6B30789FEED78322',5,36,'2018-12-09 14:39:32','master'),('3D91F7631BA813C13A08A208F1255B2E96FB03D0',2,32,'2019-06-23 02:29:54','devel'),('3F57ADF2C06CECD095FF83AB72787889961BBE87',6,15,'2019-08-10 12:44:34','junk'),('41349E9557E537855AE0F63CC43918FA13A561D3',3,7,'2019-09-16 04:09:37','master'),('41937B20FBE8C71D9C6C3346AFF43C001AA25E33',3,32,'2019-02-27 10:40:02','devel'),('42AB0C94A1E3BD6175A15DBA215CCF5F10E861E5',1,1,'2019-12-30 04:37:15','devel'),('4617585B8749A71BBB21237CAB6C2DC9CBE3B86F',2,3,'2019-01-08 03:40:50','stable'),('4902A456CAA9A4EAB463CE526C9DF0F6180BE184',2,32,'2018-08-12 01:56:04','master'),('4C197DFD67F1ED79D11A8B0218CC368BFCCE6CCB',4,30,'2019-01-15 16:37:05','issues'),('4EDED9AD930D56B01A3D8527B3220B71078001B0',2,34,'2018-08-16 14:31:59','master'),('5076721C4060FEEB69BD2C3DD9BDCE115D5C62F3',7,20,'2019-12-26 02:12:04','master'),('55949D4C16632F1C275D7684A379B8F1717B3904',2,23,'2019-01-12 13:43:31','junk'),('593905B31972F6FFE58325ABF98595CAF4EBF458',7,12,'2019-06-01 20:10:06','master'),('5A3E269AEE59E6826F23720F6FDD069D83BC087A',2,26,'2017-12-08 16:11:17','master'),('5AA588714AB4CBFD615D238FD9778C3A14CA4BA8',8,28,'2019-12-28 10:42:59','feat'),('5C77726358C5DAF98AD9CDCCD0882BCA0F718B88',5,14,'2018-07-13 18:31:56','master'),('5CAA7F811B5AFF6EB9993F309C4C045785EE67EC',3,31,'2017-04-23 08:46:23','master'),('5CB4C9D828175ED3931EC52305B32F47173A8E04',4,18,'2019-06-13 23:35:13','issues'),('5EEDD6A16AB862CB5D6B2E194E0BDF8B0161D89A',7,10,'2018-07-21 13:46:17','feat'),('5F4599DAA3415F788C1AFC3DB145F01B4BD2B438',3,8,'2017-02-05 07:49:48','bug'),('60A8B0C6DE6F6ABE5999959A5C7352750116FB9C',4,25,'2019-09-12 21:19:25','feat'),('63F1D3CFA0EC638B8F43AABD01A426C50A6E4653',9,13,'2018-06-20 13:38:02','issues'),('6557ACA8CD65D427A5621EFFA3E8EF5C27FEF340',7,29,'2019-12-10 14:26:50','issues'),('674027E17B0ED64E76CDE2005CB8E76FB4CD671A',5,39,'2019-09-03 00:32:29','master'),('6C6B1B2B3ECC0E6900000DABF4FAAE6F8DF5FFD1',2,4,'2017-07-20 10:25:38','bug'),('6D613A1EE01EEC4C0F8CA66DF0DB71DCA0C6E1CF',2,21,'2019-07-07 08:57:32','devel'),('73A7DDD505F2FC2CEAD1522E54A794328F228C44',1,2,'2019-01-13 08:27:46','master'),('74A788CEE27D549015A0786732C662E05CDD7567',2,26,'2017-03-09 05:13:15','raspberry'),('77F256B43643417F9B6622ADFF8BD31AE6EA7781',1,5,'2017-02-27 13:28:38','master'),('7971E6A051104074FDAE0F02322417B6EB5695A2',2,3,'2019-04-22 21:55:43','master'),('7998BE8D446D668C99ABCA446CB3BD79FCE08D2B',3,9,'2019-10-09 11:57:25','master'),('79B9D273AC6D2488109D1EA43E2BDB7977BD2B28',3,19,'2019-06-26 11:37:51','TZ-2001'),('7C39974F44B2B12933C66A9EBA3FE33C8D0805B6',2,6,'2017-08-10 22:29:11','stable'),('80EAF3087B0B041473C6C223F1E09197B649362E',2,23,'2019-06-06 08:08:03','master'),('852ADDAB901CBC5699D190285A009D7A7035FB57',1,1,'2019-12-12 14:44:31','stable'),('85FA355BDB4F46FA53A20A441623D53D686D4036',1,5,'2019-02-20 09:12:05','master'),('889224E3FCA24A6AB17D01FE47A45BC82244E938',4,26,'2017-03-25 23:14:03','master'),('89DA124E04DFE1AD9946CD37D91A119E1D028898',8,27,'2017-06-20 05:44:23','master'),('8A4BF12E17B2BE590B12721EF8D5D0248698B5B6',3,30,'2019-05-23 15:22:12','master'),('8E40809E474F3E0705DDEF056618CE3E5043522A',3,31,'2018-02-10 12:11:44','feat'),('9113C6C0C1F9CB53E3543B53136BA30C51018373',7,22,'2019-03-05 02:02:38','feat'),('93295B0C76B900DA760A8E0F2E9A29A1BA4B0F4C',2,32,'2019-08-14 00:46:06','junk'),('93409AF2F208E7545F0F26996E048113EDD88652',7,10,'2017-07-25 13:11:22','stable'),('93B12BF57F18C13C9AD2F55E33A8E3FD786FC394',3,9,'2019-06-19 07:27:36','master'),('9491A68514DC1EF6BDD379F8E408C0D49CC3B6CE',8,27,'2018-02-28 05:17:03','master'),('95CB62724475A0D26872DACC00642D5080519324',4,24,'2019-10-22 01:23:33','master'),('967CE367D89DCCC133D71049F1197D29561B3726',1,5,'2017-11-19 09:54:06','bug'),('9D3BD1FB52785A7BAEB03B437E7B2ECBA54EF34F',1,5,'2018-03-28 14:30:28','devel'),('A001AF75EE89582F31CB4DB6D3DD0B4766C80050',2,4,'2018-04-05 01:25:05','feat'),('A06DCD71328FD2B44FA7F84012096E8F318E4B48',1,5,'2019-06-24 02:33:37','junk'),('A42522A0CDD6E41A1379E6C95D08A9C46A17249C',2,30,'2017-09-01 22:31:05','feat'),('A4842F0234D7270B757B60B6F17A1B9F4D560DAD',7,38,'2018-06-02 01:39:19','test'),('A84F56F2E6A77ECB4B2F89344446DD3FF91B87C4',2,4,'2019-12-20 01:43:06','devel'),('AD79EF0F076D3A686AB9738925F4DD2C7E69D7D1',4,24,'2019-10-26 09:06:49','test'),('B07CB9A2B24832A8197CD3DFA67D1D6ADFB0CFBB',2,4,'2017-01-27 05:17:19','master'),('B0DDCE0F54C916C106117E280AEAD4F9C0CBF1DF',7,10,'2017-08-04 00:05:08','bug'),('B3C92EECF0AA1905086059D9F6D3261D8FB19657',7,29,'2019-11-02 10:20:10','test'),('B47B54FD3A460F43EBBCABE5B10C189176F25F25',2,3,'2019-11-22 10:10:23','stable'),('B47F363E2B430C0647F14DEEA3ECED9B0EF300CE',5,14,'2018-03-14 12:40:23','test'),('BB130626B42C3CCE860334424AEF9A144F8231F2',2,17,'2019-06-07 15:45:44','master'),('BB2254A806F43DF24753CA390143E2CA8C1E4E80',3,8,'2019-11-23 04:35:01','master'),('BBB7EF7F2EC9557D0895C9DA1C5CDDD50D15049E',5,14,'2018-11-21 12:14:39','stable'),('BC1CD4F07D828493332F9C95C491D6FB338AFD40',3,22,'2019-03-24 08:53:23','issues'),('BC88A24030A15BDE613C8749ED93D30E0A81FCC2',2,32,'2018-08-01 17:33:51','stable'),('BCD23F5BB628B5F99FE4B850D6CE84C74E48BEF5',8,28,'2019-10-20 11:47:22','master'),('BD6ACC8626D118AEA60331CE33BF000C9D7D1CEE',2,37,'2019-07-06 02:53:01','TZ-2001'),('C484B137E2D18229E4E7E677F1F8CFCE6A0AB819',3,30,'2019-02-20 00:31:31','master'),('C5F5BB3B350774D7CDA57104C55FB6C82B7AE7D9',2,4,'2019-10-13 12:06:56','test'),('C69153687791FB52C12CE7CCA2F4D03A65D9ABF8',8,28,'2019-12-20 02:01:44','master'),('C78791A3F0E109D34BA4EAC2AFA35EC011439AE3',6,15,'2019-03-15 00:24:06','feat'),('C909B138EBA89ECFBD86DF4C9D170AC78D4A3820',4,25,'2019-08-19 14:53:58','master'),('CD1B646EBD1F6844C60DD91951C6867E43857114',3,8,'2018-12-02 19:54:47','bug'),('CD6A7B8768528485A0DBCD459185091E80DC28AD',7,21,'2019-10-13 21:10:43','issues'),('CEAFB51E2B0783D53DD620019DFF3AA66708A26F',4,24,'2019-12-15 08:39:37','feat'),('D2EAF2AA1512D6596E0A5BAE633537C6B8E779A3',3,32,'2019-02-18 08:27:39','master'),('D7E0453BB4AF87006533F4D77AD9546DAC533DB8',7,12,'2018-10-18 15:55:58','master'),('DAA6A489DBCA7A13C480AAA1D0C344957590FDB7',10,22,'2018-05-16 14:25:25','raspberry'),('DBF2A2DA6458B242407285E7F1483AEB6CFEE9FD',4,30,'2019-02-05 12:34:03','devel'),('E3772AC4B4DB87B4A8DBFA59EF43CD1A8AD29515',4,30,'2019-07-26 10:01:07','issues'),('E5BB59A2731998CAE2070F6FD4F2E075FD61146F',4,22,'2017-08-17 09:52:15','junk'),('ED50AA2DE1123D2CB20C9D1F0F691C834FB6F548',6,15,'2019-03-21 21:52:05','bug'),('F0A96DA3F86A334CBE8D569110D6545277973859',2,3,'2019-12-01 18:36:59','feat'),('F14E46CE7D094F9326167ACC499698128651BE85',2,6,'2017-05-14 15:49:06','master'),('F92BCB6A06D2EC7C0AF7C8A338F131BF887C64A0',3,32,'2019-03-08 07:04:41','master'),('FA6C3752CD00F7F1277FD7E5604AB8D2EDAF26B8',2,3,'2019-08-05 00:59:10','test'),('FCF29F6CAD3232704B33E962EF5194FAD3B6817B',4,30,'2019-07-11 22:46:20','master'),('FF3EA3BEC182358766650A6FD2872D9221F7E6CC',7,12,'2019-10-25 05:41:17','bug'),('FFB0EAF998E6B2C3D5052AF77023A08FC1736781',2,30,'2018-04-20 21:02:40','feat');
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
INSERT INTO `commit_file` VALUES ('027A12C2FC8568E8B70B07FF536FAF288A013670',3,'D3DCompiler_47.dll','rename'),('03D67C263C27A453EF65B29E30334727333CCBCD',9,'d2d1debug3.dll','create'),('073D41436E7F2B1B8344DA344D0B988B3FD5813C',30,'d3d10_1.dll','update'),('09F199D25132204E99BFB1A89916DE24494F19BB',32,'davclnt.dll','update'),('0AB8318ACAF6E678DD02E2B5C343ED41111B393D',37,'d3d10.dll','create'),('0CE65B26DCD3C08E1B329D9EFBB6BBBCED426F31',5,'deviceaccess.dll','update'),('11760E1AAC4396E10D315E93AD3DF3E99204DC5E',3,'DdcClaimsApi.dll','update'),('130E4A34F1B807A8F3BD24B204C06EC4DE4010DA',40,'DafDnsSd.dll','create'),('17D53E0E6A68ACDF80B78D4F9D868C8736DB2CEC',20,'dcomcnfg.exe','create'),('180C89BF50C8B29DEB45E49D9DAC62FCD5C8BEDB',19,'dafAspInfraProvider.dll','update'),('18740AF5BCEC9573BD3C059E0FC6570353097AAB',16,'dbgcore.dll','create'),('1A591A3E91FCB7A47F2C08E9E2E117F39AF22078',4,'DeviceCredential.dll','rename'),('1AED9ECC6E1BE8EAAADDC5FFB6BA3ED84A8B1AE6',14,'de-DE','update'),('1BF429F94068620B112ACA3888B58AECBC2EADEE',14,'das.dll','rename'),('1C39ABF68E93E438AE5DCA946E2D6A986CCCD3A9',12,'davhlpr.dll','update'),('1ED5DD9D833F675B7509886681E2164D842F8DAD',16,'DesktopSwitcherDataModel.dll','update'),('1F797564F7843D36EBE5E841E5BD39C98157E22B',9,'d3d12SDKLayers.dll','update'),('1FEF42909247A6C230EEEF66277F2B5E0E8F274E',2,'DataExchangeHost.exe','update'),('213598A7E92217BEE3A758F3C69AEA09ED940C0E',6,'D3D12.dll','create'),('213CB204509284FF2AEDECA9290B70A6DA307EAB',10,'DeviceCensus.exe','delete'),('259A6E935B848823A0C0B76ACED2803060B4BD0C',28,'DavSyncProvider.dll','update'),('26160D23FB07CF8D5DAE186EBA322E9FC8E27BB4',5,'DeviceDisplayStatusManager.dll','update'),('2C2FE4EC20E6C43DCC03E395AED7DB79756728A5',12,'DafGip.dll','update'),('2F36B6BB1852C24392FB3EE9A2879DA24EB0750D',35,'defragres.dll','create'),('2F737399606486655401CB27B066F4658424766D',37,'DAFWSD.dll','rename'),('314CCD964EF6A8E68AC5F9BB89F751A1C2196C56',12,'DAFIPP.dll','rename'),('317DBAC90743C3E5E82B2DDF122CD076A2226A92',36,'dcomp.dll','rename'),('349507E41DD8C71C10C9DF6D2444B5E64A285691',4,'dafWfdProvider.dll','rename'),('354BF98925838CA68611B950E2A37EBD11C21640',23,'d3d10_1core.dll','create'),('35536A41B209715D9E3AD440431FEF2672F20BBE',5,'ddraw.dll','update'),('373616E39FB47D9A1A4E87DFD4EA968037435F14',36,'da-DK','update'),('37497AA5A2272C49714AEE1B07E8EDF973A95F59',5,'dafBth.dll','update'),('3AE11C725C30009D4D3418BC6B30789FEED78322',36,'d3d8thk.dll','create'),('3D91F7631BA813C13A08A208F1255B2E96FB03D0',32,'dbghelp.dll','rename'),('3F57ADF2C06CECD095FF83AB72787889961BBE87',15,'delegatorprovider.dll','create'),('41349E9557E537855AE0F63CC43918FA13A561D3',7,'DeveloperOptionsSettingsHandlers.dll','create'),('41937B20FBE8C71D9C6C3346AFF43C001AA25E33',32,'DeviceDriverRetrievalClient.dll','rename'),('42AB0C94A1E3BD6175A15DBA215CCF5F10E861E5',1,'D3DSCache.dll','create'),('4617585B8749A71BBB21237CAB6C2DC9CBE3B86F',3,'DAFIoT.dll','update'),('4902A456CAA9A4EAB463CE526C9DF0F6180BE184',32,'DDACLSys.dll','rename'),('4C197DFD67F1ED79D11A8B0218CC368BFCCE6CCB',30,'DefaultDeviceManager.dll','update'),('4EDED9AD930D56B01A3D8527B3220B71078001B0',34,'DaOtpCredentialProvider.dll','create'),('5076721C4060FEEB69BD2C3DD9BDCE115D5C62F3',20,'DevDispItemProvider.dll','update'),('55949D4C16632F1C275D7684A379B8F1717B3904',23,'DesktopView.Internal.Broker.dll','rename'),('593905B31972F6FFE58325ABF98595CAF4EBF458',12,'d3d11_3SDKLayers.dll','create'),('5A3E269AEE59E6826F23720F6FDD069D83BC087A',26,'dafupnp.dll','create'),('5AA588714AB4CBFD615D238FD9778C3A14CA4BA8',28,'ddisplay.dll','rename'),('5C77726358C5DAF98AD9CDCCD0882BCA0F718B88',14,'dafDockingProvider.dll','update'),('5CAA7F811B5AFF6EB9993F309C4C045785EE67EC',31,'DesktopShellAppStateContract.dll','update'),('5CB4C9D828175ED3931EC52305B32F47173A8E04',18,'d3dref9.dll','create'),('5EEDD6A16AB862CB5D6B2E194E0BDF8B0161D89A',10,'DefaultQuestions.json','update'),('5F4599DAA3415F788C1AFC3DB145F01B4BD2B438',8,'d3d11.dll','update'),('60A8B0C6DE6F6ABE5999959A5C7352750116FB9C',25,'DataStoreCacheDumpTool.exe','create'),('63F1D3CFA0EC638B8F43AABD01A426C50A6E4653',13,'DAConn.dll','create'),('6557ACA8CD65D427A5621EFFA3E8EF5C27FEF340',29,'datusage.dll','create'),('674027E17B0ED64E76CDE2005CB8E76FB4CD671A',39,'defragproxy.dll','create'),('6C6B1B2B3ECC0E6900000DABF4FAAE6F8DF5FFD1',4,'dafWCN.dll','update'),('6D613A1EE01EEC4C0F8CA66DF0DB71DCA0C6E1CF',21,'C_IS2022.DLL','create'),('73A7DDD505F2FC2CEAD1522E54A794328F228C44',2,'DAFMCP.dll','create'),('74A788CEE27D549015A0786732C662E05CDD7567',26,'DetailedReading-Default.xml','rename'),('77F256B43643417F9B6622ADFF8BD31AE6EA7781',5,'DAMM.dll','rename'),('7971E6A051104074FDAE0F02322417B6EB5695A2',3,'c_GSM7.DLL','create'),('7998BE8D446D668C99ABCA446CB3BD79FCE08D2B',9,'desktopimgdownldr.exe','rename'),('79B9D273AC6D2488109D1EA43E2BDB7977BD2B28',19,'d3d10level9.dll','create'),('7C39974F44B2B12933C66A9EBA3FE33C8D0805B6',6,'dciman32.dll','update'),('80EAF3087B0B041473C6C223F1E09197B649362E',23,'daxexec.dll','update'),('852ADDAB901CBC5699D190285A009D7A7035FB57',1,'DataExchange.dll','update'),('85FA355BDB4F46FA53A20A441623D53D686D4036',5,'DeviceDirectoryClient.dll','update'),('889224E3FCA24A6AB17D01FE47A45BC82244E938',26,'ddrawex.dll','update'),('89DA124E04DFE1AD9946CD37D91A119E1D028898',27,'datamarketsvc.dll','create'),('8A4BF12E17B2BE590B12721EF8D5D0248698B5B6',30,'DataUsageLiveTileTask.exe','update'),('8E40809E474F3E0705DDEF056618CE3E5043522A',31,'DafPrintProvider.dll','create'),('9113C6C0C1F9CB53E3543B53136BA30C51018373',22,'dcntel.dll','rename'),('93295B0C76B900DA760A8E0F2E9A29A1BA4B0F4C',32,'deskadp.dll','rename'),('93409AF2F208E7545F0F26996E048113EDD88652',10,'d3d9on12.dll','create'),('93B12BF57F18C13C9AD2F55E33A8E3FD786FC394',9,'DesktopShellExt.dll','delete'),('9491A68514DC1EF6BDD379F8E408C0D49CC3B6CE',27,'DefaultAccountTile.png','update'),('95CB62724475A0D26872DACC00642D5080519324',24,'desk.cpl','rename'),('967CE367D89DCCC133D71049F1197D29561B3726',5,'DDORes.dll','update'),('9D3BD1FB52785A7BAEB03B437E7B2ECBA54EF34F',5,'d3d10sdklayers.dll','create'),('A001AF75EE89582F31CB4DB6D3DD0B4766C80050',4,'dabapi.dll','create'),('A06DCD71328FD2B44FA7F84012096E8F318E4B48',5,'dccw.exe','update'),('A42522A0CDD6E41A1379E6C95D08A9C46A17249C',30,'d3d10warp.dll','create'),('A4842F0234D7270B757B60B6F17A1B9F4D560DAD',38,'DDFs','create'),('A84F56F2E6A77ECB4B2F89344446DD3FF91B87C4',4,'defragsvc.dll','rename'),('AD79EF0F076D3A686AB9738925F4DD2C7E69D7D1',24,'DefaultHrtfs.bin','update'),('B07CB9A2B24832A8197CD3DFA67D1D6ADFB0CFBB',4,'DdcComImplementationsDesktop.dll','rename'),('B0DDCE0F54C916C106117E280AEAD4F9C0CBF1DF',10,'DesktopView.Internal.Broker.ProxyStub.dll','rename'),('B3C92EECF0AA1905086059D9F6D3261D8FB19657',29,'DDOIProxy.dll','update'),('B47B54FD3A460F43EBBCABE5B10C189176F25F25',3,'DdcComImplementations.dll','update'),('B47F363E2B430C0647F14DEEA3ECED9B0EF300CE',14,'C_ISCII.DLL','create'),('BB130626B42C3CCE860334424AEF9A144F8231F2',17,'DeviceCredentialDeployment.exe','create'),('BB2254A806F43DF24753CA390143E2CA8C1E4E80',8,'dab.dll','rename'),('BBB7EF7F2EC9557D0895C9DA1C5CDDD50D15049E',14,'DbgModel.dll','update'),('BC1CD4F07D828493332F9C95C491D6FB338AFD40',22,'DataUsageHandlers.dll','update'),('BC88A24030A15BDE613C8749ED93D30E0A81FCC2',32,'DDDS.dll','rename'),('BCD23F5BB628B5F99FE4B850D6CE84C74E48BEF5',28,'deploymentcsps.dll','delete'),('BD6ACC8626D118AEA60331CE33BF000C9D7D1CEE',37,'d3d10ref.dll','update'),('C484B137E2D18229E4E7E677F1F8CFCE6A0AB819',30,'dataclen.dll','rename'),('C5F5BB3B350774D7CDA57104C55FB6C82B7AE7D9',4,'DesktopKeepOnToastImg.gif','rename'),('C69153687791FB52C12CE7CCA2F4D03A65D9ABF8',28,'d3d10core.dll','create'),('C78791A3F0E109D34BA4EAC2AFA35EC011439AE3',15,'deskmon.dll','rename'),('C909B138EBA89ECFBD86DF4C9D170AC78D4A3820',25,'dbnetlib.dll','update'),('CD1B646EBD1F6844C60DD91951C6867E43857114',8,'d2d1.dll','create'),('CD6A7B8768528485A0DBCD459185091E80DC28AD',21,'dafpos.dll','update'),('CEAFB51E2B0783D53DD620019DFF3AA66708A26F',24,'d3d11on12.dll','create'),('D2EAF2AA1512D6596E0A5BAE633537C6B8E779A3',32,'DAFWiProv.dll','create'),('D7E0453BB4AF87006533F4D77AD9546DAC533DB8',12,'dasHost.exe','update'),('DAA6A489DBCA7A13C480AAA1D0C344957590FDB7',22,'DeviceCenter.dll','delete'),('DBF2A2DA6458B242407285E7F1483AEB6CFEE9FD',30,'DdcAntiTheftApi.dll','update'),('E3772AC4B4DB87B4A8DBFA59EF43CD1A8AD29515',30,'dbnmpntw.dll','update'),('E5BB59A2731998CAE2070F6FD4F2E075FD61146F',22,'DAMediaManager.dll','create'),('ED50AA2DE1123D2CB20C9D1F0F691C834FB6F548',15,'deploymentcsphelper.exe','update'),('F0A96DA3F86A334CBE8D569110D6545277973859',3,'dbgeng.dll','update'),('F14E46CE7D094F9326167ACC499698128651BE85',6,'ddodiag.exe','rename'),('F92BCB6A06D2EC7C0AF7C8A338F131BF887C64A0',32,'devenum.dll','rename'),('FA6C3752CD00F7F1277FD7E5604AB8D2EDAF26B8',3,'d3d9.dll','update'),('FCF29F6CAD3232704B33E962EF5194FAD3B6817B',30,'Defrag.exe','update'),('FF3EA3BEC182358766650A6FD2872D9221F7E6CC',12,'deviceassociation.dll','update'),('FFB0EAF998E6B2C3D5052AF77023A08FC1736781',30,'DefaultPrinterProvider.dll','update');
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
INSERT INTO `issue` VALUES (1,'missing installation instructions','Percipio affectus sequatur iii habentur impressa meo.','open','2018-04-07 03:57:00','documentation',7),(1,'users authentication','Et lectores earundem aliasque de immobile putandum me.','open','2018-03-16 21:07:00','bug',1),(1,'users privileges','Ex in si volent negare possum.','open','2017-03-19 01:04:00','bug',2),(2,'how can I use the code?','Et lectores earundem aliasque de immobile putandum me.','closed','2018-03-13 01:22:00','help',2),(2,'wrong use of DFT','Novi vel has fal sine dat etsi. ','open','2017-06-10 03:55:00','help',5),(2,'wrong use of SFT','Factae imo partem absque seriem meo dictis. Sequentium rem cogitantur deo existentia theologiae. ','open','2018-08-02 01:43:00','help',3),(3,'IEEE format missing','Ex in si volent negare possum.','closed','2019-11-16 17:42:00','documentation',3),(6,'add capacitor','Factae imo partem absque seriem meo dictis. Sequentium rem cogitantur deo existentia theologiae. ','closed','2019-02-08 08:34:00','feature',3),(6,'add MOSFET for protection','Novi vel has fal sine dat etsi. ','closed','2019-05-06 19:17:00','feature',4),(12,'Jokers conidition','Ab ad noctu ac ut veras terra ausit nudam.','open','2017-11-12 11:31:00','other',10),(17,'tsitsipas live statistics','Ratione probant sciatur id ex docetur replere is.','closed','2017-05-10 12:39:00','feature',4),(17,'tsitsipas live statistics vs Federer','Ab ad noctu ac ut veras terra ausit nudam.','closed','2017-12-13 16:31:00','feature',2),(17,'tsitsipas live statistics vs Jokovic','Et lectores earundem aliasque de immobile putandum me.','closed','2019-08-02 09:53:00','feature',2),(17,'tsitsipas live statistics vs Nadal','Percipio affectus sequatur iii habentur impressa meo.','closed','2018-09-26 18:08:00','feature',1),(22,'SVD algorithm error','Et lectores earundem aliasque de immobile putandum me.','open','2019-06-03 18:16:00','bug',5),(22,'SVM algorithm error','Factae imo partem absque seriem meo dictis. Sequentium rem cogitantur deo existentia theologiae. ','open','2018-02-18 06:21:00','bug',7),(24,'Add component','Ab ad noctu ac ut veras terra ausit nudam.','open','2017-01-20 20:44:00','other',8),(24,'add new libraries','Percipio affectus sequatur iii habentur impressa meo.','closed','2018-01-17 11:21:00','feature',5),(24,'add new library','Ex in si volent negare possum.','open','2018-11-05 01:30:00','feature',7),(25,'Add component','Novi vel has fal sine dat etsi. ','open','2019-02-17 03:01:00','other',9),(25,'missing countries','Et lectores earundem aliasque de immobile putandum me.','open','2018-08-08 22:17:00','feature',8),(26,'Add component','Factae imo partem absque seriem meo dictis. Sequentium rem cogitantur deo existentia theologiae. ','open','2019-07-24 01:37:00','other',7),(26,'add instructions ','Ratione probant sciatur id ex docetur replere is.','open','2017-08-24 15:15:00','documentation',5),(26,'barcelona wrong statistics','Factae imo partem absque seriem meo dictis. Sequentium rem cogitantur deo existentia theologiae. ','open','2019-03-23 21:16:00','bug',3),(26,'real wrong statistics','Ab ad noctu ac ut veras terra ausit nudam.','open','2018-05-14 19:57:00','bug',3),(26,'unit_tests','Ex in si volent negare possum.','closed','2017-03-06 07:35:00','other',4),(26,'unit_tests_2','Ratione probant sciatur id ex docetur replere is.','open','2018-10-03 14:38:00','other',8),(30,'missing albanian words','Et lectores earundem aliasque de immobile putandum me.','open','2017-09-05 11:36:00','bug',10),(30,'missing greek words','Percipio affectus sequatur iii habentur impressa meo.','open','2017-06-01 07:33:00','bug',10),(30,'missing polish words','Ex in si volent negare possum.','open','2017-11-11 07:19:00','bug',9),(30,'missing turkish words','Ratione probant sciatur id ex docetur replere is.','open','2017-12-16 06:42:00','bug',5),(31,'MDE ','Novi vel has fal sine dat etsi. ','open','2018-09-17 15:35:00','bug',2),(39,'live images 1','Ratione probant sciatur id ex docetur replere is.','open','2017-03-07 02:14:00','documentation',4),(39,'live images 2','Novi vel has fal sine dat etsi. ','open','2019-05-09 06:18:00','bug',6);
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
INSERT INTO `language_repo` VALUES ('SQL',1,543),('Matlab',2,343),('Tex',3,234),('Matlab',4,423),('Python',4,433),('Python',5,323),('Tex',6,23),('JAVA',7,543),('HTML',8,120),('CSS',8,234),('C#',9,234),('C',10,256),('C++',10,245),('Python',10,235),('Matlab',10,230),('C',11,102),('C++',11,150),('Python',11,92),('Matlab',11,125),('Tex',12,124),('Tex',13,156),('C++',14,1),('R',15,1),('CSS',16,420),('HTML',16,320),('Tex',16,134),('CSS',17,503),('HTML',17,560),('Tex',17,560),('CSS',18,140),('HTML',18,530),('Tex',18,503),('Python',19,450),('Tex',20,653),('Tex',21,356),('Python',22,653),('R',22,603),('Python',23,842),('R',23,269),('Python',24,253),('R',24,182),('Python',25,182),('Python',26,593),('C++',27,392),('Tex',28,385),('Tex',29,832),('Python',30,293),('JAVA',31,292),('Python',31,394),('Tex',32,392),('Tex',33,124),('C++',34,353),('C#',35,340),('Python',35,321),('Python',36,394),('Python',37,395),('Python',38,320),('HTML',39,215),('CSS',39,320),('SQL',40,231);
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
INSERT INTO `team` VALUES (11,'IoT','2013-09-05 17:54:00','Team working on Internet-of-Things aspects'),(11,'pandora','2013-03-06 03:45:00','Building autonomous robots'),(11,'Students','2014-07-05 09:32:00','Student from University'),(11,'thesis-templates','2011-12-17 19:25:00','Templates for thesis document'),(12,'db-team','2013-09-11 04:41:00','AUTh Uni DB team'),(12,'erasmus','2014-05-23 01:19:00','Erasmus Department Website'),(13,'analytics','2013-09-12 12:12:00','Gather user analytics'),(13,'frontend','2013-01-14 01:15:00','Frontend developers at Facebook'),(14,'Google AI Research','2014-04-17 05:08:00','Building the future'),(14,'Google Translate','2014-08-19 14:50:00','Google translate\'s developers'),(14,'seo','2014-02-16 05:22:00','Search Engine Optimization engineers'),(15,'Politics','2014-11-15 19:58:00','Politics Webpage'),(15,'seo','2013-08-10 05:10:00','Search Engine Optimization engineers'),(15,'sport','2014-12-16 13:34:00','Responsible for sports webpage '),(16,'db-team','2012-07-06 11:01:00','Netflix DB team'),(16,'Justice League','2011-12-09 02:01:00','Justice League Team'),(16,'recommendations','2013-05-11 17:27:00','Building content recommendation engine'),(16,'transactions','2014-05-22 02:50:00','Responsible for economic transactions'),(17,'db-team','2013-03-27 23:25:00','Twitter DB-team'),(17,'security','2013-02-12 12:59:00','Twitter security-team');
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
INSERT INTO `user_team` VALUES (11,2,'IoT'),(11,2,'pandora'),(11,2,'Students'),(11,2,'thesis-templates'),(11,3,'IoT'),(11,3,'pandora'),(11,3,'Students'),(11,3,'thesis-templates'),(12,5,'db-team'),(12,5,'erasmus'),(12,6,'db-team'),(12,6,'erasmus'),(13,3,'analytics'),(13,3,'frontend'),(13,4,'analytics'),(13,8,'frontend'),(14,2,'seo'),(14,3,'Google AI Research'),(14,4,'Google Translate'),(14,4,'seo'),(15,2,'sport'),(15,4,'seo'),(15,5,'Politics'),(15,5,'seo'),(16,1,'db-team'),(16,1,'Justice League'),(16,2,'Justice League'),(16,3,'Justice League'),(16,3,'recommendations'),(16,4,'recommendations'),(16,6,'transactions'),(16,7,'Justice League'),(16,7,'transactions'),(16,9,'Justice League'),(16,10,'db-team'),(16,10,'Justice League'),(17,2,'db-team'),(17,5,'db-team'),(17,6,'db-team'),(17,7,'db-team'),(17,9,'db-team'),(17,10,'db-team');
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

-- Dump completed on 2019-12-11 22:03:43
