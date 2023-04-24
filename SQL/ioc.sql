-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: ioc
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `foradmin`
--

DROP TABLE IF EXISTS `foradmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foradmin` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `pwd` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foradmin`
--

LOCK TABLES `foradmin` WRITE;
/*!40000 ALTER TABLE `foradmin` DISABLE KEYS */;
INSERT INTO `foradmin` VALUES (1,'fx',810894),(2,'zh',810894),(3,'mm',810894),(4,'mf',810894),(5,'bl',810894),(6,'bg',810894),(7,'cyn',810894),(8,'周大侠',810894);
/*!40000 ALTER TABLE `foradmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forlog_0`
--

DROP TABLE IF EXISTS `forlog_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forlog_0` (
  `id` int NOT NULL,
  `audit` varchar(45) NOT NULL,
  `content` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forlog_0`
--

LOCK TABLES `forlog_0` WRITE;
/*!40000 ALTER TABLE `forlog_0` DISABLE KEYS */;
INSERT INTO `forlog_0` VALUES (1,'zh','abc'),(2,'zh','@2023年1月28日-0时4分51秒@@zh提交审核: @@@{ id: 9; 用户名: Q持之以恒Q; 视频BV号: BV18Y411m7xN; 纸面成绩: 159s; 赛道: 无限成本; 状态: 不通过; 罚时原因: 待审核; 罚时秒数: 0; 最终成绩: 0; 精彩时刻: ; 备注: 甘雨占比过高; }'),(3,'zh','@2023年1月28日-1时9分19秒@@zh@@@提交审核: { id: 13; 用户名: 213; 视频BV号: bv1234567890; 纸面成绩: 321; 赛道: 大世界; 状态: 待审核; 罚时原因: 兔兔6命; 罚时秒数: 11; 最终成绩: 332; 精彩时刻: ; 备注: ; }'),(4,'zh','@2023年1月28日-1时10分6秒@@zh@@@提交审核: { id: 13; 用户名: 213; 视频BV号: bv1234567890; 纸面成绩: 321; 赛道: 大世界; 状态: 已通过; 罚时原因: 兔兔6命; 罚时秒数: 11; 最终成绩: 332; 精彩时刻: ; 备注: ; }'),(5,'zh','@2023年1月28日-1时12分30秒@@zh@@@提交审核: { id: 11; 用户名: Q持之以恒Q; 视频BV号: bv1234567890; 纸面成绩: 987; 赛道: 无限成本; 状态: 已通过; 罚时原因: ; 罚时秒数: 0; 最终成绩: 987; 精彩时刻: ; 备注: session; }'),(6,'fx','@2023年1月28日-1时13分44秒@@fx@@@提交审核: { id: 11; 用户名: Q持之以恒Q; 视频BV号: bv1234567890; 纸面成绩: 987; 赛道: 无限成本; 状态: 已通过; 罚时原因: 物理1命; 罚时秒数: 5; 最终成绩: 987; 精彩时刻: ; 备注: session; }'),(7,'zh','@2023年1月28日-1时15分1秒@@zh@@@提交审核: { id: 14; 用户名: qw; 视频BV号: bv1234567890; 纸面成绩: 139s; 赛道: 三成本; 状态: 待审核; 罚时原因: 待审核; 罚时秒数: 0; 最终成绩: 139; 精彩时刻: ; 备注: session; }'),(8,'fx','@2023年1月28日-1时19分54秒@@fx@@@提交审核: { id: 15; 用户名: qw; 视频BV号: bv1234567890; 纸面成绩: 139; 赛道: 三成本; 状态: 已通过; 罚时原因: 无; 罚时秒数: 0; 最终成绩: 139; 精彩时刻: ; 备注: se; }'),(9,'zh','@2023年1月28日-1时22分14秒@@zh@@@提交审核: { id: 14; 用户名: qw; 视频BV号: bv1234567890; 纸面成绩: 139s; 赛道: 三成本; 状态: 待审核; 罚时原因: 待审核; 罚时秒数: 0; 最终成绩: 139; 精彩时刻: ; 备注: session_zh; }'),(10,'bl','@2023年1月28日-1时22分39秒@@bl@@@提交审核: { id: 14; 用户名: qw; 视频BV号: bv1234567890; 纸面成绩: 139s; 赛道: 三成本; 状态: 待审核; 罚时原因: 待审核; 罚时秒数: 0; 最终成绩: 139; 精彩时刻: ; 备注: session_bl; }'),(11,'mf','@2023年1月28日-10时26分33秒@@mf@@@提交审核: { id: 21; 用户名: 马椰子粉测试; 视频BV号: bv1145141919; 纸面成绩: 1; 赛道: 大世界; 状态: 已通过; 罚时原因: ; 罚时秒数: 0; 最终成绩: 1; 精彩时刻: ; 备注: ; }'),(12,'mf','@2023年1月28日-10时26分50秒@@mf@@@提交审核: { id: 22; 用户名: 马椰子粉测试; 视频BV号: bv1145141919; 纸面成绩: 1; 赛道: 大世界; 状态: 已通过; 罚时原因: 没看到绯星女装; 罚时秒数: 0; 最终成绩: 18; 精彩时刻: ; 备注: ; }'),(13,'zh','@2023年1月29日-15时28分54秒@@zh@@@提交审核: { id: 23; 用户名: jason; 视频BV号: bv1qaz2wsx3e; 纸面成绩: 135s; 赛道: 八成本; 状态: 已通过; 罚时原因: ttlc6; 罚时秒数: 11; 最终成绩: 146; 精彩时刻: 2:00; 备注: 绯星没有女装; }'),(14,'bl','@2023年1月29日-15时59分51秒@@bl@@@提交审核: { id: 26; 用户名: 布灵灵灵灵-; 视频BV号: BV1We4y1F7MN; 纸面成绩: 118s; 赛道: 三成本; 状态: 已通过; 罚时原因: 6命; 罚时秒数: 11; 最终成绩: 129; 精彩时刻: 无; 备注: 无; }'),(15,'zh','@2023年1月31日-1时58分16秒@@zh@@@提交审核: { id: 10; 用户名: 123; 视频BV号: bv1234567890; 纸面成绩: 678; 赛道: 三成本; 状态: 已通过; 罚时原因: 天枢肉; 罚时秒数: 8; 最终成绩: 686; 精彩时刻: ; 备注: ; }'),(16,'bl','@2023年1月31日-2时9分44秒@@bl@@@提交审核: { id: 26; 用户名: 布灵灵灵灵-; 视频BV号: BV1We4y1F7MN; 纸面成绩: 118s; 赛道: 三成本; 状态: 已通过; 罚时原因: 6命; 罚时秒数: 11; 最终成绩: 129; 精彩时刻: 无; 备注: 无; }'),(17,'bl','@2023年1月31日-2时9分51秒@@bl@@@提交审核: { id: 14; 用户名: qw; 视频BV号: bv1234567890; 纸面成绩: 139s; 赛道: 三成本; 状态: 待审核; 罚时原因: 待审核; 罚时秒数: 0; 最终成绩: 139; 精彩时刻: ; 备注: session_bl; }'),(18,'bl','@2023年1月31日-2时10分59秒@@bl@@@提交审核: { id: 2; 用户名: 2; 视频BV号: BV18Y411m7xN; 纸面成绩: 158; 赛道: 无限成本; 状态: 不通过; 罚时原因: 待审核; 罚时秒数: 0; 最终成绩: 0; 精彩时刻: bl; 备注: 占比有问题; }'),(19,'zh','@2023年2月1日-1时40分9秒@@zh@@@提交审核: { id: 22; 用户名: 马椰子粉测试; 视频BV号: bv1145141919; 纸面成绩: 1; 赛道: 大世界; 状态: 已通过; 罚时原因: 没看到绯星女装; 罚时秒数: 0; 最终成绩: 18; 精彩时刻: ; 备注: ; }');
/*!40000 ALTER TABLE `forlog_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forlog_1`
--

DROP TABLE IF EXISTS `forlog_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forlog_1` (
  `id` int NOT NULL,
  `audit` varchar(45) NOT NULL,
  `content` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forlog_1`
--

LOCK TABLES `forlog_1` WRITE;
/*!40000 ALTER TABLE `forlog_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `forlog_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forscore_0`
--

DROP TABLE IF EXISTS `forscore_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forscore_0` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `bvnumber` varchar(45) NOT NULL,
  `score` varchar(45) NOT NULL,
  `track` varchar(45) NOT NULL,
  `submittime` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  `punish_reason` varchar(45) DEFAULT NULL,
  `punish_time` int DEFAULT NULL,
  `final_score` int DEFAULT NULL,
  `ex_time` varchar(45) DEFAULT NULL,
  `audit` varchar(45) DEFAULT NULL,
  `remarks` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forscore_0`
--

LOCK TABLES `forscore_0` WRITE;
/*!40000 ALTER TABLE `forscore_0` DISABLE KEYS */;
INSERT INTO `forscore_0` VALUES (1,'1','BV18Y411m7xN','159','八成本','2023年1月20日-19时58分5秒','已通过','ttlc6',11,170,'2:00','zh','nb'),(2,'2','BV18Y411m7xN','158','无限成本','2023年1月20日-20时1分24秒','不通过','待审核',0,0,'bl','bl','占比有问题'),(3,'3','BV18Y411m7xN','157','大世界','2023年1月20日-20时2分40秒','已通过','七天神像',10,167,'1:58','zh','666'),(4,'4','BV18Y411m7xN','222','八成本','2023年1月20日-20时20分41秒','已通过','无',0,222,'','zh',''),(5,'5','BV18Y411m7xN','812','大世界','2023年1月20日-20时21分27秒','已通过','火伤药',6,818,'','zh',''),(6,'6','BV18Y411m7xN','123','三成本','2023年1月20日-20时22分27秒','已通过','物理1命',5,128,'','zh',''),(7,'7','BV18Y411m7xN','159s','八成本','2023年1月21日-0时9分2秒','不通过','待审核',0,NULL,NULL,NULL,NULL),(8,'8','bv1234567890','324','八成本','2023年1月21日-2时13分12秒','已通过','仙跳墙',8,332,'','zh',''),(9,'Q持之以恒Q','BV18Y411m7xN','159s','无限成本','2023年1月19日-22时4分46秒','不通过','待审核',0,0,'','zh','甘雨占比过高'),(10,'123','bv1234567890','678','三成本','2023年1月21日-11时10分11秒','已通过','天枢肉',8,686,'','zh',''),(11,'Q持之以恒Q','bv1234567890','987','无限成本','2023年1月21日-11时10分54秒','已通过','物理1命',5,987,'','fx','session'),(12,'颠三倒四','bv1234567890','139s','三成本','2023年1月21日-17时6分15秒','已通过','待审核',0,321,NULL,NULL,NULL),(13,'213','bv1234567890','321','大世界','2023年1月21日-17时38分20秒','已通过','兔兔6命',11,332,'','zh',''),(14,'qw','bv1234567890','139s','三成本','2023年1月21日-17时40分38秒','待审核','待审核',0,139,'','bl','session_bl'),(15,'qw','bv1234567890','139','三成本','2023年1月21日-17时40分38秒','已通过','无',0,139,'','fx','se'),(16,'绯星xh','bv1234567890','120s','八成本','2023年1月21日-18时34分23秒','不通过','待审核',0,NULL,NULL,NULL,NULL),(17,'21','bv1234567890','124s','三成本','2023年1月24日-18时4分54秒','待审核','待审核',0,NULL,NULL,NULL,NULL),(18,'dsd','bv21281809ds','120s','三成本','2023年1月24日-18时6分14秒','待审核','待审核',0,NULL,NULL,NULL,NULL),(19,'zh','bvsasd123123','123s','八成本','2023年1月25日-13时35分54秒','待审核',NULL,0,NULL,NULL,NULL,NULL),(20,'qw','bvasdf23r43e','134s','八成本','2023年1月27日-0时44分17秒','待审核',NULL,0,NULL,NULL,NULL,NULL),(21,'马椰子粉测试','bv1145141919','1','大世界','2023年1月28日-10时2分25秒','已通过','',0,1,'','mf',''),(22,'马椰子粉测试','bv1145141919','1','大世界','2023年1月28日-10时2分25秒','已通过','没看到绯星女装',0,18,'','zh',''),(23,'jason','bv1qaz2wsx3e','135s','八成本','2023年1月29日-15时28分13秒','已通过','ttlc6',11,146,'2:00','zh','绯星没有女装'),(24,'jason','bvfdfdfdfdfd','123s','大世界','2023年1月29日-15时30分56秒','待审核',NULL,0,NULL,NULL,NULL,NULL),(25,'jason_','bvasdf1qa1as','153s','其他','2023年1月29日-15时46分13秒','待审核',NULL,0,NULL,NULL,NULL,NULL),(26,'布灵灵灵灵-','BV1We4y1F7MN','118s','三成本','2023年1月29日-15时52分18秒','已通过','6命',11,129,'无','bl','无'),(27,'bvb','bvwqw2135467','123s','八成本','2023年1月31日-1时57分16秒','待审核',NULL,0,NULL,NULL,NULL,NULL),(28,'1234','bvqwertasdfg','135s','大世界','2023年2月1日-1时39分39秒','待审核',NULL,0,NULL,NULL,NULL,NULL),(29,'2134','bv1qaz2wsx3e','1234s','八成本','2023年2月1日-2时12分18秒','待审核',NULL,0,NULL,NULL,NULL,NULL),(30,'还是睡觉','bvqwertasdfz','200s','无限成本','2023年2月1日-2时12分48秒','待审核',NULL,0,NULL,NULL,NULL,NULL),(31,'1234','bv1qaz2wsx3e','435s','八成本','2023年2月1日-2时23分16秒','待审核',NULL,0,NULL,NULL,NULL,NULL),(32,'Zhdus','Bvasdfghjklz','675s','大世界','2023年2月1日-2时23分56秒','待审核',NULL,0,NULL,NULL,NULL,NULL),(33,'dasda','bv1234567890','135s','八成本','2023年2月4日-12时10分50秒','待审核',NULL,0,NULL,NULL,NULL,NULL),(34,'Zwzw','Bv1472583690','1747s','八成本','2023年2月4日-17时47分10秒','待审核',NULL,0,NULL,NULL,NULL,NULL),(35,'Ded','Bvqazwsxedcr',' 1357s','八成本','2023年2月4日-17时47分34秒','待审核',NULL,0,NULL,NULL,NULL,NULL),(36,'Bg','Bv1247358690','258s','无限成本','2023年2月4日-17时49分35秒','待审核',NULL,0,NULL,NULL,NULL,NULL),(37,'迁安镇','bvqazwsxedcr','258秒','三成本','2023年2月4日-17时51分0秒','待审核',NULL,0,NULL,NULL,NULL,NULL),(38,'ahd','bvqazwsxeqqq','245s ','八成本','2023年2月4日-19时24分3秒','待审核',NULL,0,NULL,NULL,NULL,NULL),(39,'Bv','Bv1234578960','Ahs','无限成本','2023年2月4日-19时43分57秒','待审核',NULL,0,NULL,NULL,NULL,NULL),(40,' Bv','Bv123456789a','Ahs','八成本','2023年2月4日-19时44分37秒','待审核',NULL,0,NULL,NULL,NULL,NULL),(41,'Ahs','Bvqwertyuiop','Ahs','八成本','2023年2月4日-19时45分11秒','待审核',NULL,0,NULL,NULL,NULL,NULL),(42,'bv','bv1234567890','bv','无限成本','2023年2月4日-19时50分1秒','待审核',NULL,0,NULL,NULL,NULL,NULL),(43,'Zha','Bv1234567890','你好','八成本','2023年2月4日-19时58分6秒','待审核',NULL,0,NULL,NULL,NULL,NULL),(44,'bv','bv1234567890','你','八成本','2023年2月4日-20时11分32秒','待审核',NULL,0,NULL,NULL,NULL,NULL),(45,'请问','bv1234567860','5秒','八成本','2023年2月4日-20时12分19秒','待审核',NULL,0,NULL,NULL,NULL,NULL),(46,'bv1234567890','bv1234567890','g秒','八成本','2023年2月4日-20时12分44秒','待审核',NULL,0,NULL,NULL,NULL,NULL),(47,'afdsa dsf','bv1qaz2wsx3e','1 s 323 秒秒','八成本','2023年2月4日-23时46分8秒','待审核',NULL,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `forscore_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forscore_1`
--

DROP TABLE IF EXISTS `forscore_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forscore_1` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `bvnumber` varchar(45) NOT NULL,
  `score` varchar(45) NOT NULL,
  `track` varchar(45) NOT NULL,
  `submittime` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  `punish_reason` varchar(45) DEFAULT NULL,
  `punish_time` int DEFAULT NULL,
  `final_score` int DEFAULT NULL,
  `ex_time` varchar(45) DEFAULT NULL,
  `audit` varchar(45) DEFAULT NULL,
  `remarks` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forscore_1`
--

LOCK TABLES `forscore_1` WRITE;
/*!40000 ALTER TABLE `forscore_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `forscore_1` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-05  0:46:42
