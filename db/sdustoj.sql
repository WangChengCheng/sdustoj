-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: sdustoj
-- ------------------------------------------------------
-- Server version	5.5.49-0+deb7u1

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
-- Table structure for table `activation`
--

DROP TABLE IF EXISTS `activation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activation` (
  `user_id` varchar(50) NOT NULL,
  `code` varchar(200) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activation`
--

LOCK TABLES `activation` WRITE;
/*!40000 ALTER TABLE `activation` DISABLE KEYS */;
/*!40000 ALTER TABLE `activation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `archive`
--

DROP TABLE IF EXISTS `archive`;
/*!50001 DROP VIEW IF EXISTS `archive`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `archive` (
  `user_id` tinyint NOT NULL,
  `problem_id` tinyint NOT NULL,
  `solution_id` tinyint NOT NULL,
  `language_ext` tinyint NOT NULL,
  `result` tinyint NOT NULL,
  `code` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_0e939a4f` (`group_id`),
  KEY `auth_group_permissions_8373b171` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_417f1b1c` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=202 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (97,'Can add log entry',33,'add_logentry'),(98,'Can change log entry',33,'change_logentry'),(99,'Can delete log entry',33,'delete_logentry'),(100,'Can add permission',34,'add_permission'),(101,'Can change permission',34,'change_permission'),(102,'Can delete permission',34,'delete_permission'),(103,'Can add group',35,'add_group'),(104,'Can change group',35,'change_group'),(105,'Can delete group',35,'delete_group'),(106,'Can add user',36,'add_user'),(107,'Can change user',36,'change_user'),(108,'Can delete user',36,'delete_user'),(109,'Can add content type',37,'add_contenttype'),(110,'Can change content type',37,'change_contenttype'),(111,'Can delete content type',37,'delete_contenttype'),(112,'Can add session',38,'add_session'),(113,'Can change session',38,'change_session'),(114,'Can delete session',38,'delete_session'),(115,'Can add activation',39,'add_activation'),(116,'Can change activation',39,'change_activation'),(117,'Can delete activation',39,'delete_activation'),(118,'Can add collections',40,'add_collections'),(119,'Can change collections',40,'change_collections'),(120,'Can delete collections',40,'delete_collections'),(121,'Can add collections problem',41,'add_collectionsproblem'),(122,'Can change collections problem',41,'change_collectionsproblem'),(123,'Can delete collections problem',41,'delete_collectionsproblem'),(124,'Can add compileinfo',42,'add_compileinfo'),(125,'Can change compileinfo',42,'change_compileinfo'),(126,'Can delete compileinfo',42,'delete_compileinfo'),(127,'Can add contest',43,'add_contest'),(128,'Can change contest',43,'change_contest'),(129,'Can delete contest',43,'delete_contest'),(130,'Can add contest privilege',44,'add_contestprivilege'),(131,'Can change contest privilege',44,'change_contestprivilege'),(132,'Can delete contest privilege',44,'delete_contestprivilege'),(133,'Can add contest problem',45,'add_contestproblem'),(134,'Can change contest problem',45,'change_contestproblem'),(135,'Can delete contest problem',45,'delete_contestproblem'),(136,'Can add contest users',46,'add_contestusers'),(137,'Can change contest users',46,'change_contestusers'),(138,'Can delete contest users',46,'delete_contestusers'),(139,'Can add django migrations',47,'add_djangomigrations'),(140,'Can change django migrations',47,'change_djangomigrations'),(141,'Can delete django migrations',47,'delete_djangomigrations'),(142,'Can add loginlog',48,'add_loginlog'),(143,'Can change loginlog',48,'change_loginlog'),(144,'Can delete loginlog',48,'delete_loginlog'),(145,'Can add mail',49,'add_mail'),(146,'Can change mail',49,'change_mail'),(147,'Can delete mail',49,'delete_mail'),(148,'Can add news',50,'add_news'),(149,'Can change news',50,'change_news'),(150,'Can delete news',50,'delete_news'),(151,'Can add online',51,'add_online'),(152,'Can change online',51,'change_online'),(153,'Can delete online',51,'delete_online'),(154,'Can add privilege',52,'add_privilege'),(155,'Can change privilege',52,'change_privilege'),(156,'Can delete privilege',52,'delete_privilege'),(157,'Can add problem',53,'add_problem'),(158,'Can change problem',53,'change_problem'),(159,'Can delete problem',53,'delete_problem'),(160,'Can add reply',54,'add_reply'),(161,'Can change reply',54,'change_reply'),(162,'Can delete reply',54,'delete_reply'),(163,'Can add runtimeinfo',55,'add_runtimeinfo'),(164,'Can change runtimeinfo',55,'change_runtimeinfo'),(165,'Can delete runtimeinfo',55,'delete_runtimeinfo'),(166,'Can add sim',56,'add_sim'),(167,'Can change sim',56,'change_sim'),(168,'Can delete sim',56,'delete_sim'),(169,'Can add solution',57,'add_solution'),(170,'Can change solution',57,'change_solution'),(171,'Can delete solution',57,'delete_solution'),(172,'Can add source code',58,'add_sourcecode'),(173,'Can change source code',58,'change_sourcecode'),(174,'Can delete source code',58,'delete_sourcecode'),(175,'Can add topic',59,'add_topic'),(176,'Can change topic',59,'change_topic'),(177,'Can delete topic',59,'delete_topic'),(178,'Can add users',60,'add_users'),(179,'Can change users',60,'change_users'),(180,'Can delete users',60,'delete_users'),(181,'Can add status',61,'add_status'),(182,'Can change status',61,'change_status'),(183,'Can delete status',61,'delete_status'),(184,'Can add language',62,'add_language'),(185,'Can change language',62,'change_language'),(186,'Can delete language',62,'delete_language'),(187,'Can add statusinfo',63,'add_statusinfo'),(188,'Can change statusinfo',63,'change_statusinfo'),(189,'Can delete statusinfo',63,'delete_statusinfo'),(190,'Can add contestinfo',64,'add_contestinfo'),(191,'Can change contestinfo',64,'change_contestinfo'),(192,'Can delete contestinfo',64,'delete_contestinfo'),(193,'Can add archive',65,'add_archive'),(194,'Can change archive',65,'change_archive'),(195,'Can delete archive',65,'delete_archive'),(196,'Can add siminfo',66,'add_siminfo'),(197,'Can change siminfo',66,'change_siminfo'),(198,'Can delete siminfo',66,'delete_siminfo'),(199,'Can add sim config',67,'add_simconfig'),(200,'Can change sim config',67,'change_simconfig'),(201,'Can delete sim config',67,'delete_simconfig');
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
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_e8701ad4` (`user_id`),
  KEY `auth_user_groups_0e939a4f` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_e8701ad4` (`user_id`),
  KEY `auth_user_user_permissions_8373b171` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections`
--

DROP TABLE IF EXISTS `collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collections` (
  `col_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(30) NOT NULL,
  `title` varchar(300) NOT NULL,
  `description` text NOT NULL,
  `cnt` int(11) NOT NULL,
  `div` int(11) NOT NULL,
  PRIMARY KEY (`col_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections`
--

LOCK TABLES `collections` WRITE;
/*!40000 ALTER TABLE `collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections_problem`
--

DROP TABLE IF EXISTS `collections_problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collections_problem` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `col_id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections_problem`
--

LOCK TABLES `collections_problem` WRITE;
/*!40000 ALTER TABLE `collections_problem` DISABLE KEYS */;
/*!40000 ALTER TABLE `collections_problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compileinfo`
--

DROP TABLE IF EXISTS `compileinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compileinfo` (
  `solution_id` int(11) NOT NULL DEFAULT '0',
  `error` text,
  PRIMARY KEY (`solution_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compileinfo`
--

LOCK TABLES `compileinfo` WRITE;
/*!40000 ALTER TABLE `compileinfo` DISABLE KEYS */;
INSERT INTO `compileinfo` VALUES (73,'main.c:1:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ at end of input\n'),(76,'main.c:1:20: fatal error: iostream: No such file or directory\ncompilation terminated.\n'),(77,'main.cpp:3:1: error: stray ‘343’ in program\nmain.cpp:3:1: error: stray ‘200’ in program\nmain.cpp:3:1: error: stray ‘200’ in program\nmain.cpp:7:1: error: stray ‘343’ in program\nmain.cpp:7:1: error: stray ‘200’ in program\nmain.cpp:7:1: error: stray ‘200’ in program\n'),(87,'main.c:1:20: fatal error: iostream: No such file or directory\ncompilation terminated.\n'),(89,'main.c:1:20: fatal error: iostream: No such file or directory\ncompilation terminated.\n'),(94,'main.c:1:20: fatal error: iostream: No such file or directory\ncompilation terminated.\n'),(100,'main.c: In function ‘main’:\nmain.c:4:11: error: ‘true’ undeclared (first use in this function)\nmain.c:4:11: note: each undeclared identifier is reported only once for each function it appears in\n'),(107,'main.c:2:6: warning: return type of ‘main’ is not ‘int’ [-Wmain]\nmain.c: In function ‘main’:\nmain.c:7:5: error: expected expression before ‘else’\nmain.c:4:15: warning: unused variable ‘n’ [-Wunused-variable]\nmain.c:4:13: warning: unused variable ‘b’ [-Wunused-variable]\nmain.c:4:11: warning: unused variable ‘i’ [-Wunused-variable]\nmain.c:4:9: warning: unused variable ‘a’ [-Wunused-variable]\n');
/*!40000 ALTER TABLE `compileinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contest`
--

DROP TABLE IF EXISTS `contest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contest` (
  `contest_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `defunct` char(1) NOT NULL DEFAULT 'N',
  `points` text,
  `private` tinyint(4) NOT NULL DEFAULT '0',
  `langmask` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'bits for LANG to mask',
  `contest_mode` int(11) DEFAULT NULL,
  PRIMARY KEY (`contest_id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contest`
--

LOCK TABLES `contest` WRITE;
/*!40000 ALTER TABLE `contest` DISABLE KEYS */;
INSERT INTO `contest` VALUES (44,'test','2016-05-31 08:52:38','2016-05-31 08:55:00','C',NULL,0,100,NULL),(40,'121212121','2016-04-30 16:00:00','2016-06-29 16:00:00','C',NULL,0,100,NULL),(41,'121212121test','2016-04-30 16:00:00','2016-06-29 16:00:00','C',NULL,0,100,NULL),(42,'test12','2016-04-30 16:00:00','2016-06-29 16:00:00','C',NULL,0,100,NULL),(43,'Just For Test','2016-05-24 06:40:46','2016-05-25 16:00:00','C',NULL,0,100,NULL);
/*!40000 ALTER TABLE `contest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contest_privilege`
--

DROP TABLE IF EXISTS `contest_privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contest_privilege` (
  `privilege_id` int(11) NOT NULL AUTO_INCREMENT,
  `privilege` varchar(45) DEFAULT NULL,
  `private_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`privilege_id`),
  UNIQUE KEY `privilege_id_UNIQUE` (`privilege_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contest_privilege`
--

LOCK TABLES `contest_privilege` WRITE;
/*!40000 ALTER TABLE `contest_privilege` DISABLE KEYS */;
INSERT INTO `contest_privilege` VALUES (1,'Public','0'),(2,'Private','1');
/*!40000 ALTER TABLE `contest_privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contest_problem`
--

DROP TABLE IF EXISTS `contest_problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contest_problem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problem_id` int(11) NOT NULL,
  `contest_id` int(11) DEFAULT NULL,
  `title` char(200) NOT NULL DEFAULT '',
  `num` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contest_problem`
--

LOCK TABLES `contest_problem` WRITE;
/*!40000 ALTER TABLE `contest_problem` DISABLE KEYS */;
INSERT INTO `contest_problem` VALUES (35,7,29,'a+b',0),(36,8,29,'亲密数',1),(37,7,31,'a+b',0),(38,7,32,'a+b',0),(39,8,32,'亲密数',1),(40,7,37,'a+b',0),(41,8,37,'亲密数',1),(42,7,42,'a+b',0),(43,7,43,'a+b',0),(44,8,43,'亲密数',1),(45,7,44,'a+b',0),(46,8,44,'亲密数',1);
/*!40000 ALTER TABLE `contest_problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contest_users`
--

DROP TABLE IF EXISTS `contest_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contest_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL DEFAULT '',
  `contest_id` int(11) DEFAULT NULL,
  `title` char(200) NOT NULL DEFAULT '',
  `num` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contest_users`
--

LOCK TABLES `contest_users` WRITE;
/*!40000 ALTER TABLE `contest_users` DISABLE KEYS */;
INSERT INTO `contest_users` VALUES (18,'admin',27,'',0),(19,'admin',28,'',0),(20,'admin',29,'',0),(21,'admin',30,'',0),(22,'admin',31,'',0),(23,'admin',32,'',0),(24,'admin',33,'',0),(25,'admin',34,'',0),(26,'admin',35,'',0),(27,'admin',36,'',0),(28,'admin',37,'',0),(29,'admin',38,'',0),(30,'admin',39,'',0),(31,'admin',40,'',0),(32,'admin',41,'',0),(33,'admin',42,'',0),(34,'admin',43,'',0),(35,'test1',43,'',0),(36,'admin',44,'',0),(37,'test1',44,'',0);
/*!40000 ALTER TABLE `contest_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `contestinfo`
--

DROP TABLE IF EXISTS `contestinfo`;
/*!50001 DROP VIEW IF EXISTS `contestinfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `contestinfo` (
  `contest_id` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `start_time` tinyint NOT NULL,
  `end_time` tinyint NOT NULL,
  `defunct` tinyint NOT NULL,
  `points` tinyint NOT NULL,
  `langmask` tinyint NOT NULL,
  `contest_mode` tinyint NOT NULL,
  `privilege` tinyint NOT NULL,
  `language` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_417f1b1c` (`content_type_id`),
  KEY `django_admin_log_e8701ad4` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (33,'admin','logentry'),(34,'auth','permission'),(35,'auth','group'),(36,'auth','user'),(37,'contenttypes','contenttype'),(38,'sessions','session'),(39,'sdustoj','activation'),(40,'sdustoj','collections'),(41,'sdustoj','collectionsproblem'),(42,'sdustoj','compileinfo'),(43,'sdustoj','contest'),(44,'sdustoj','contestprivilege'),(45,'sdustoj','contestproblem'),(46,'sdustoj','contestusers'),(47,'sdustoj','djangomigrations'),(48,'sdustoj','loginlog'),(49,'sdustoj','mail'),(50,'sdustoj','news'),(51,'sdustoj','online'),(52,'sdustoj','privilege'),(53,'sdustoj','problem'),(54,'sdustoj','reply'),(55,'sdustoj','runtimeinfo'),(56,'sdustoj','sim'),(57,'sdustoj','solution'),(58,'sdustoj','sourcecode'),(59,'sdustoj','topic'),(60,'sdustoj','users'),(61,'sdustoj','status'),(62,'sdustoj','language'),(63,'sdustoj','statusinfo'),(64,'sdustoj','contestinfo'),(65,'sdustoj','archive'),(66,'sdustoj','siminfo'),(67,'sdustoj','simconfig');
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
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-06-05 02:36:54'),(2,'auth','0001_initial','2016-06-05 02:36:54'),(3,'admin','0001_initial','2016-06-05 02:36:54'),(4,'admin','0002_logentry_remove_auto_add','2016-06-05 02:36:54'),(5,'contenttypes','0002_remove_content_type_name','2016-06-05 02:36:54'),(6,'auth','0002_alter_permission_name_max_length','2016-06-05 02:36:54'),(7,'auth','0003_alter_user_email_max_length','2016-06-05 02:36:54'),(8,'auth','0004_alter_user_username_opts','2016-06-05 02:36:54'),(9,'auth','0005_alter_user_last_login_null','2016-06-05 02:36:54'),(10,'auth','0006_require_contenttypes_0002','2016-06-05 02:36:54'),(11,'auth','0007_alter_validators_add_error_messages','2016-06-05 02:36:54'),(12,'sessions','0001_initial','2016-06-05 02:36:54');
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
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('258k2gpwpx8zkpua0fpbufhxr4p17t6c','ZDAyZGY5ZTM5Y2EwZjA0Mzc0ZGViMDFkNDMzODA3MjVmM2NhMzM5Mjp7Il9kamFuZ29fY2FwdGNoYV9rZXkiOiIifQ==','2016-05-07 16:36:09'),('tci3usxs4u3jejelgmgvfg5ep7u8c9hy','YmMzNTc5NjhmYjM5ZDYyZWJiMzg5Y2EyZWRjZjdjZjFhZWZmZGM0Mzp7Il9kamFuZ29fY2FwdGNoYV9rZXkiOiI5NTIyIn0=','2016-05-19 06:26:54'),('t5oaren3ktn4kbgop5e3b7nedp9e6h4x','ZDAyZGY5ZTM5Y2EwZjA0Mzc0ZGViMDFkNDMzODA3MjVmM2NhMzM5Mjp7Il9kamFuZ29fY2FwdGNoYV9rZXkiOiIifQ==','2016-06-12 01:55:04'),('7pl6oshqogbdzwpxgfnoj2gthvtoxa5j','ZDAyZGY5ZTM5Y2EwZjA0Mzc0ZGViMDFkNDMzODA3MjVmM2NhMzM5Mjp7Il9kamFuZ29fY2FwdGNoYV9rZXkiOiIifQ==','2016-06-21 06:15:14'),('57x13gfrzpxqosn0zmh9knfpxstglhtu','ZDAyZGY5ZTM5Y2EwZjA0Mzc0ZGViMDFkNDMzODA3MjVmM2NhMzM5Mjp7Il9kamFuZ29fY2FwdGNoYV9rZXkiOiIifQ==','2016-06-16 10:49:58'),('hu95x6241ki0qg04r1hadooj37fwquok','ZDAyZGY5ZTM5Y2EwZjA0Mzc0ZGViMDFkNDMzODA3MjVmM2NhMzM5Mjp7Il9kamFuZ29fY2FwdGNoYV9rZXkiOiIifQ==','2016-06-12 02:16:03');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `language` int(11) DEFAULT NULL,
  `language_name` varchar(45) DEFAULT NULL,
  `language_compile` varchar(45) DEFAULT NULL,
  `language_ext` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`language_id`),
  UNIQUE KEY `language_id_UNIQUE` (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (1,0,'C','gcc','c'),(2,1,'C++','g++','cpp'),(3,2,'Java','java','java');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loginlog`
--

DROP TABLE IF EXISTS `loginlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loginlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(40) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=207 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginlog`
--

LOCK TABLES `loginlog` WRITE;
/*!40000 ALTER TABLE `loginlog` DISABLE KEYS */;
INSERT INTO `loginlog` VALUES (132,'admin','admin','127.0.0.1','2016-05-05 03:23:38'),(133,'admin','admin','127.0.0.1','2016-05-05 06:23:20'),(134,'admin','admin','127.0.0.1','2016-05-05 07:28:40'),(135,'admin','admin','127.0.0.1','2016-05-05 08:48:14'),(136,'admin','admin','127.0.0.1','2016-05-05 10:34:30'),(137,'admin','admin','127.0.0.1','2016-05-05 13:54:48'),(138,'admin','admin','127.0.0.1','2016-05-06 07:34:42'),(139,'admin','admin','127.0.0.1','2016-05-06 08:12:36'),(140,'admin','admin','127.0.0.1','2016-05-08 05:32:40'),(141,'admin','admin','127.0.0.1','2016-05-12 19:10:35'),(142,'admin','admin','127.0.0.1','2016-05-14 01:58:21'),(143,'admin','admin','127.0.0.1','2016-05-14 02:45:50'),(144,'admin','admin','127.0.0.1','2016-05-14 04:58:03'),(145,'admin','admin','127.0.0.1','2016-05-14 06:14:03'),(146,'admin','admin','127.0.0.1','2016-05-14 08:21:25'),(147,'admin','admin','127.0.0.1','2016-05-14 09:24:54'),(148,'admin','admin','127.0.0.1','2016-05-14 11:40:55'),(149,'admin','admin','127.0.0.1','2016-05-15 02:35:40'),(150,'admin','admin','127.0.0.1','2016-05-15 05:03:42'),(151,'admin','admin','127.0.0.1','2016-05-15 06:45:02'),(152,'admin','admin','127.0.0.1','2016-05-15 07:45:57'),(153,'admin','admin','127.0.0.1','2016-05-15 08:49:12'),(154,'admin','admin','127.0.0.1','2016-05-15 11:49:30'),(155,'test1','123456','127.0.0.1','2016-05-16 07:07:57'),(156,'admin','admin','127.0.0.1','2016-05-16 07:10:05'),(157,'test1','123456','127.0.0.1','2016-05-16 07:50:24'),(158,'admin','admin','127.0.0.1','2016-05-16 12:02:47'),(159,'test1','123456','127.0.0.1','2016-05-16 12:06:36'),(160,'admin','admin','127.0.0.1','2016-05-16 12:08:37'),(161,'admin','admin','127.0.0.1','2016-05-17 08:12:45'),(162,'admin','admin','127.0.0.1','2016-05-18 02:05:27'),(163,'admin','admin','127.0.0.1','2016-05-18 03:10:47'),(164,'admin','admin','127.0.0.1','2016-05-18 06:14:59'),(165,'admin','admin','127.0.0.1','2016-05-18 11:07:38'),(166,'admin','admin','127.0.0.1','2016-05-18 12:15:09'),(167,'admin','admin','127.0.0.1','2016-05-18 13:18:32'),(168,'admin','admin','127.0.0.1','2016-05-19 01:50:45'),(169,'admin','admin','127.0.0.1','2016-05-19 03:38:49'),(170,'admin','admin','127.0.0.1','2016-05-19 07:29:06'),(171,'admin','admin','127.0.0.1','2016-05-19 08:36:00'),(172,'admin','admin','127.0.0.1','2016-05-19 10:14:38'),(173,'admin','admin','127.0.0.1','2016-05-20 01:56:32'),(174,'admin','admin','127.0.0.1','2016-05-20 05:00:09'),(175,'admin','admin','127.0.0.1','2016-05-21 02:27:46'),(176,'test1','123456','127.0.0.1','2016-05-21 02:28:21'),(177,'admin','admin','127.0.0.1','2016-05-21 02:32:01'),(178,'admin','admin','127.0.0.1','2016-05-21 11:22:25'),(179,'admin','admin','127.0.0.1','2016-05-22 13:55:10'),(180,'test1','123456','127.0.0.1','2016-04-23 16:36:09'),(181,'admin','admin','127.0.0.1','2016-05-24 09:05:18'),(182,'admin','admin','127.0.0.1','2016-05-24 10:07:20'),(183,'admin','admin','127.0.0.1','2016-05-24 12:41:45'),(184,'admin','admin','127.0.0.1','2016-05-24 14:02:50'),(185,'admin','admin','127.0.0.1','2016-05-24 15:11:06'),(186,'test1','123456','127.0.0.1','2016-05-24 16:17:16'),(187,'admin','admin','127.0.0.1','2016-05-24 16:27:36'),(188,'admin','admin','127.0.0.1','2016-05-25 09:15:55'),(189,'admin','admin','127.0.0.1','2016-05-25 10:21:37'),(190,'admin','admin','127.0.0.1','2016-05-29 01:30:07'),(191,'admin','admin','127.0.0.1','2016-05-29 01:55:04'),(192,'admin','admin','127.0.0.1','2016-05-29 02:13:08'),(193,'admin','admin','127.0.0.1','2016-05-29 02:16:03'),(194,'admin','admin','127.0.0.1','2016-05-29 02:33:11'),(195,'admin','admin','127.0.0.1','2016-05-29 07:42:49'),(196,'admin','admin','127.0.0.1','2016-05-29 08:57:24'),(197,'admin','admin','127.0.0.1','2016-05-29 09:58:46'),(198,'admin','admin','127.0.0.1','2016-05-29 11:06:51'),(199,'admin','admin','127.0.0.1','2016-05-29 12:08:26'),(200,'admin','admin','127.0.0.1','2016-05-31 07:49:07'),(201,'admin','admin','127.0.0.1','2016-05-31 08:49:15'),(202,'admin','admin','127.0.0.1','2016-06-02 10:49:58'),(203,'admin','admin','127.0.0.1','2016-06-05 02:19:31'),(204,'admin','admin','127.0.0.1','2016-06-05 03:25:22'),(205,'admin','admin','127.0.0.1','2016-06-07 01:11:29'),(206,'admin','admin','127.0.0.1','2016-06-07 06:15:14');
/*!40000 ALTER TABLE `loginlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail`
--

DROP TABLE IF EXISTS `mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail` (
  `mail_id` int(11) NOT NULL AUTO_INCREMENT,
  `to_user` varchar(20) NOT NULL DEFAULT '',
  `from_user` varchar(20) NOT NULL DEFAULT '',
  `title` varchar(200) NOT NULL DEFAULT '',
  `content` text,
  `new_mail` tinyint(1) NOT NULL DEFAULT '1',
  `reply` tinyint(4) DEFAULT '0',
  `in_date` datetime DEFAULT NULL,
  `defunct` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`mail_id`),
  KEY `uid` (`to_user`)
) ENGINE=MyISAM AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail`
--

LOCK TABLES `mail` WRITE;
/*!40000 ALTER TABLE `mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` text NOT NULL,
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `release` int(11) DEFAULT '0',
  `type` int(11) DEFAULT '0',
  `author` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `online`
--

DROP TABLE IF EXISTS `online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `online` (
  `hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `ua` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `refer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastmove` int(10) NOT NULL,
  `firsttime` int(10) DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`hash`),
  UNIQUE KEY `hash` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `online`
--

LOCK TABLES `online` WRITE;
/*!40000 ALTER TABLE `online` DISABLE KEYS */;
/*!40000 ALTER TABLE `online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilege`
--

DROP TABLE IF EXISTS `privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privilege` (
  `user_id` char(20) NOT NULL DEFAULT '',
  `rightstr` char(30) NOT NULL DEFAULT '',
  `defunct` char(1) NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilege`
--

LOCK TABLES `privilege` WRITE;
/*!40000 ALTER TABLE `privilege` DISABLE KEYS */;
/*!40000 ALTER TABLE `privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problem`
--

DROP TABLE IF EXISTS `problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problem` (
  `problem_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL DEFAULT '',
  `description` text,
  `input` text,
  `output` text,
  `sample_input` text,
  `sample_output` text,
  `spj` char(1) NOT NULL DEFAULT '0',
  `hint` text,
  `source` varchar(100) DEFAULT NULL,
  `in_date` datetime DEFAULT NULL,
  `time_limit` int(11) NOT NULL DEFAULT '0',
  `memory_limit` int(11) NOT NULL DEFAULT '0',
  `defunct` char(1) NOT NULL DEFAULT 'N',
  `accepted` int(11) DEFAULT '0',
  `submit` int(11) DEFAULT '0',
  `solved` int(11) DEFAULT '0',
  `fileupload` varchar(1) DEFAULT 'N',
  PRIMARY KEY (`problem_id`),
  UNIQUE KEY `problem_id_UNIQUE` (`problem_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem`
--

LOCK TABLES `problem` WRITE;
/*!40000 ALTER TABLE `problem` DISABLE KEYS */;
INSERT INTO `problem` VALUES (7,'a+b','<p>a+b<br></p>','<p>输入两个整数（int）<br></p>','<p>输出答案 c<br></p>','<p>1 1<br></p>','<p>2<br></p>','','<p><br></p>',NULL,'2016-05-05 08:14:05',1000,12800,'',210,29,0,'Y'),(8,'亲密数','<p>如果a的所有正因子和等于b，b的所有正因子和等于a，因子包括1但不包括本身，且a不等于b，则称a，b为亲密数对。一般通过叠代编程求出相应的亲密数对。</p><p><br></p>','<p>输入一个[0，3000]以内的数a<br></p>','<p>输出a以内的所有亲密数对(若a以内不存这样的数对，则不输出)<br></p>','<p>300<br></p>','<p>220..284<br></p>','','<p><br></p>',NULL,'2016-05-14 02:04:39',1000,65535,'',126,19,0,'N');
/*!40000 ALTER TABLE `problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reply` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` varchar(20) NOT NULL,
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `content` text NOT NULL,
  `topic_id` int(11) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '0',
  `ip` varchar(30) NOT NULL,
  PRIMARY KEY (`rid`),
  KEY `author_id` (`author_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `runtimeinfo`
--

DROP TABLE IF EXISTS `runtimeinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `runtimeinfo` (
  `solution_id` int(11) NOT NULL DEFAULT '0',
  `error` text,
  PRIMARY KEY (`solution_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `runtimeinfo`
--

LOCK TABLES `runtimeinfo` WRITE;
/*!40000 ALTER TABLE `runtimeinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `runtimeinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sim`
--

DROP TABLE IF EXISTS `sim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sim` (
  `s_id` int(11) NOT NULL,
  `sim_s_id` int(11) NOT NULL,
  `sim` int(11) DEFAULT NULL,
  PRIMARY KEY (`s_id`,`sim_s_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sim`
--

LOCK TABLES `sim` WRITE;
/*!40000 ALTER TABLE `sim` DISABLE KEYS */;
INSERT INTO `sim` VALUES (-1,-1,-1),(71,70,100),(72,70,100),(72,71,100),(75,74,100),(78,74,100),(78,75,100),(81,70,100),(81,71,100),(81,72,100),(84,82,100),(85,82,92),(85,84,92),(86,74,100),(86,75,100),(86,78,100),(88,74,100),(88,75,100),(88,78,100),(88,86,100),(90,74,100),(90,75,100),(90,78,100),(90,86,100),(90,88,100),(91,74,100),(91,75,100),(91,78,100),(91,86,100),(91,88,100),(91,90,100),(92,74,100),(92,75,100),(92,78,100),(92,86,100),(92,88,100),(92,90,100),(92,91,100),(95,74,71),(95,75,71),(95,78,71),(95,86,71),(95,88,71),(95,90,71),(95,91,71),(95,92,71),(98,83,100),(99,82,92),(99,84,92),(99,85,100),(97,74,100),(97,75,100),(97,78,100),(97,86,100),(97,88,100),(97,90,100),(97,91,100),(97,92,100),(97,95,87),(101,82,92),(101,84,92),(101,85,100),(101,99,100),(102,101,94),(102,82,100),(102,84,100),(102,85,94),(102,99,94),(103,101,94),(103,102,100),(103,82,100),(103,84,100),(103,85,94),(103,99,94),(105,101,94),(105,102,100),(105,103,100),(105,82,100),(105,84,100),(105,85,94),(105,99,94),(106,83,100),(106,98,100),(108,84,56),(108,102,56),(108,103,56),(108,105,56),(113,99,34),(108,82,56),(104,79,100),(104,80,100),(114,113,100),(113,102,38),(113,103,38),(113,105,38),(113,85,34),(114,108,42),(113,84,38),(113,82,38),(113,108,42),(112,104,100),(112,79,100),(112,80,100),(113,101,34);
/*!40000 ALTER TABLE `sim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sim_config`
--

DROP TABLE IF EXISTS `sim_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sim_config` (
  `id` int(11) NOT NULL,
  `sim_enable` tinyint(4) NOT NULL DEFAULT '1',
  `sim_threshold` int(11) NOT NULL DEFAULT '30',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sim_config`
--

LOCK TABLES `sim_config` WRITE;
/*!40000 ALTER TABLE `sim_config` DISABLE KEYS */;
INSERT INTO `sim_config` VALUES (1,1,10);
/*!40000 ALTER TABLE `sim_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sim_info`
--

DROP TABLE IF EXISTS `sim_info`;
/*!50001 DROP VIEW IF EXISTS `sim_info`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `sim_info` (
  `s_id` tinyint NOT NULL,
  `sim_s_id` tinyint NOT NULL,
  `sim` tinyint NOT NULL,
  `user_id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `solution`
--

DROP TABLE IF EXISTS `solution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solution` (
  `solution_id` int(11) NOT NULL AUTO_INCREMENT,
  `problem_id` int(11) NOT NULL DEFAULT '0',
  `user_id` char(20) DEFAULT '-1',
  `time` int(11) DEFAULT '0',
  `memory` int(11) DEFAULT '0',
  `in_date` datetime DEFAULT '0000-00-00 00:00:00',
  `result` smallint(6) DEFAULT '0',
  `language` tinyint(4) DEFAULT '0',
  `ip` char(15) DEFAULT '0.0.0.0',
  `contest_id` int(11) DEFAULT NULL,
  `valid` tinyint(4) DEFAULT '-1',
  `num` tinyint(4) DEFAULT '-1',
  `code_length` int(11) DEFAULT '0',
  `judgetime` datetime DEFAULT NULL,
  `is_sim` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`solution_id`),
  KEY `uid` (`user_id`),
  KEY `pid` (`problem_id`),
  KEY `res` (`result`),
  KEY `cid` (`contest_id`)
) ENGINE=MyISAM AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solution`
--

LOCK TABLES `solution` WRITE;
/*!40000 ALTER TABLE `solution` DISABLE KEYS */;
INSERT INTO `solution` VALUES (71,7,'admin',0,276,'2016-05-05 11:16:30',1,0,'127.0.0.1',-1,NULL,NULL,148,NULL,1),(72,7,'admin',0,276,'2016-05-06 07:35:28',1,0,'127.0.0.1',-1,NULL,NULL,148,NULL,1),(70,7,'admin',0,276,'2016-05-05 10:37:51',1,0,'127.0.0.1',-1,NULL,NULL,148,NULL,0),(73,7,'admin',0,0,'2016-05-12 19:10:57',7,0,'127.0.0.1',-1,NULL,NULL,3,NULL,0),(74,7,'admin',0,476,'2016-05-14 05:02:21',1,1,'127.0.0.1',-1,NULL,NULL,141,NULL,0),(75,7,'admin',0,476,'2016-05-14 05:27:59',1,1,'127.0.0.1',-1,NULL,NULL,141,NULL,1),(76,7,'admin',0,0,'2016-05-14 05:28:22',7,0,'127.0.0.1',-1,NULL,NULL,167,NULL,0),(77,7,'admin',0,0,'2016-05-14 05:55:12',7,1,'127.0.0.1',-1,NULL,NULL,167,NULL,0),(78,7,'admin',0,476,'2016-05-14 05:56:48',1,1,'127.0.0.1',-1,NULL,NULL,165,NULL,1),(79,7,'admin',84,16676,'2016-05-14 06:14:28',1,2,'127.0.0.1',-1,NULL,NULL,236,NULL,0),(80,7,'admin',64,16688,'2016-05-14 06:15:43',1,2,'127.0.0.1',-1,NULL,NULL,236,NULL,0),(81,7,'admin',0,280,'2016-05-14 09:31:14',1,0,'127.0.0.1',31,NULL,NULL,148,NULL,1),(82,8,'admin',16,284,'2016-05-14 11:54:14',1,0,'127.0.0.1',-1,NULL,NULL,542,NULL,0),(83,8,'admin',16,280,'2016-05-14 11:54:40',1,0,'127.0.0.1',-1,NULL,NULL,582,NULL,0),(84,8,'admin',12,284,'2016-05-14 11:55:57',1,0,'127.0.0.1',-1,NULL,NULL,542,NULL,1),(85,8,'admin',16,284,'2016-05-14 12:00:21',1,0,'127.0.0.1',-1,NULL,NULL,596,NULL,1),(86,7,'admin',0,476,'2016-05-15 07:41:11',1,1,'127.0.0.1',-1,NULL,NULL,157,NULL,1),(87,7,'test1',0,0,'2016-05-16 07:50:39',7,0,'127.0.0.1',-1,NULL,NULL,157,NULL,0),(88,7,'test1',0,480,'2016-05-16 07:51:32',1,1,'127.0.0.1',-1,NULL,NULL,157,NULL,1),(89,7,'admin',0,0,'2016-05-19 08:36:21',7,0,'127.0.0.1',-1,NULL,NULL,157,NULL,0),(90,7,'admin',0,476,'2016-05-19 08:38:29',1,1,'127.0.0.1',-1,NULL,NULL,157,NULL,1),(91,7,'admin',0,480,'2016-05-19 10:16:37',1,1,'127.0.0.1',-1,NULL,NULL,157,NULL,1),(92,7,'admin',0,476,'2016-05-20 01:56:51',1,1,'127.0.0.1',-1,NULL,NULL,157,NULL,1),(93,7,'test1',1010,0,'2016-04-23 16:39:07',2,1,'127.0.0.1',-1,NULL,NULL,174,NULL,0),(94,7,'test1',0,0,'2016-04-23 16:40:29',7,0,'127.0.0.1',-1,NULL,NULL,188,NULL,0),(95,7,'test1',0,476,'2016-04-23 16:41:04',1,1,'127.0.0.1',-1,NULL,NULL,189,NULL,1),(96,7,'test1',0,576,'2016-04-23 16:42:29',1,1,'127.0.0.1',-1,NULL,NULL,160,NULL,0),(97,7,'admin',0,480,'2016-05-24 14:03:47',1,1,'127.0.0.1',42,NULL,NULL,157,NULL,1),(98,8,'admin',16,284,'2016-05-24 15:37:02',1,0,'127.0.0.1',43,NULL,NULL,582,NULL,1),(99,8,'admin',12,284,'2016-05-24 15:52:09',1,0,'127.0.0.1',43,NULL,NULL,596,NULL,1),(100,8,'admin',0,0,'2016-05-24 15:52:52',7,0,'127.0.0.1',43,NULL,NULL,66,NULL,0),(101,8,'admin',16,280,'2016-05-24 15:53:46',1,0,'127.0.0.1',43,NULL,NULL,596,NULL,1),(102,8,'admin',16,284,'2016-05-24 15:55:23',1,0,'127.0.0.1',-1,NULL,NULL,542,NULL,1),(103,8,'admin',16,284,'2016-05-24 16:03:57',1,0,'127.0.0.1',-1,NULL,NULL,580,NULL,1),(104,7,'admin',96,16700,'2016-05-24 16:05:21',1,2,'127.0.0.1',-1,NULL,NULL,236,NULL,1),(105,8,'test1',16,280,'2016-05-24 16:17:43',1,0,'127.0.0.1',43,NULL,NULL,542,NULL,1),(106,8,'test1',16,284,'2016-05-24 16:18:28',1,0,'127.0.0.1',-1,NULL,NULL,582,NULL,1),(107,8,'test1',0,0,'2016-05-24 16:18:48',7,0,'127.0.0.1',-1,NULL,NULL,499,NULL,0),(108,8,'test1',12,284,'2016-05-24 16:20:35',1,0,'127.0.0.1',-1,NULL,NULL,516,NULL,1),(109,8,'test1',0,280,'2016-05-24 16:21:30',4,0,'127.0.0.1',-1,NULL,NULL,455,NULL,0),(110,8,'test1',0,280,'2016-05-24 16:24:48',4,0,'127.0.0.1',-1,NULL,NULL,455,NULL,0),(111,8,'test1',0,280,'2016-05-24 16:25:22',4,0,'127.0.0.1',-1,NULL,NULL,455,NULL,0),(112,7,'admin',60,16708,'2016-05-24 16:29:45',1,2,'127.0.0.1',43,NULL,NULL,254,NULL,1),(113,8,'admin',12,260,'2016-05-24 16:31:26',1,0,'127.0.0.1',-1,NULL,NULL,635,NULL,1),(114,8,'admin',12,280,'2016-05-29 08:42:27',1,0,'127.0.0.1',-1,NULL,NULL,695,NULL,1);
/*!40000 ALTER TABLE `solution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `source_code`
--

DROP TABLE IF EXISTS `source_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `source_code` (
  `solution_id` int(11) NOT NULL,
  `source` text NOT NULL,
  PRIMARY KEY (`solution_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `source_code`
--

LOCK TABLES `source_code` WRITE;
/*!40000 ALTER TABLE `source_code` DISABLE KEYS */;
INSERT INTO `source_code` VALUES (67,'#include <stdio.h>\r\n\r\nint main()\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    while(scanf(\"%d %d\", &a, &b)!=EOF)\r\n\r\n    printf(\"%d\\n\", a + b);\r\n\r\n    return 0;\r\n\r\n}'),(68,'#include <stdio.h>\r\n\r\nint main()\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    while(scanf(\"%d %d\", &a, &b)!=EOF)\r\n\r\n    printf(\"%d\\n\", a + b);\r\n\r\n    return 0;\r\n\r\n}'),(69,'#include <stdio.h>\r\n\r\nint main()\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    while(scanf(\"%d %d\", &a, &b)!=EOF)\r\n\r\n    printf(\"%d\\n\", a + b);\r\n\r\n    return 0;\r\n\r\n}'),(70,'#include <stdio.h>\r\n\r\nint main()\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    while(scanf(\"%d %d\", &a, &b)!=EOF)\r\n\r\n    printf(\"%d\\n\", a + b);\r\n\r\n    return 0;\r\n\r\n}'),(71,'#include <stdio.h>\r\n\r\nint main()\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    while(scanf(\"%d %d\", &a, &b)!=EOF)\r\n\r\n    printf(\"%d\\n\", a + b);\r\n\r\n    return 0;\r\n\r\n}'),(72,'#include <stdio.h>\r\n\r\nint main()\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    while(scanf(\"%d %d\", &a, &b)!=EOF)\r\n\r\n    printf(\"%d\\n\", a + b);\r\n\r\n    return 0;\r\n\r\n}'),(73,'aaa'),(74,'#include <iostream>\r\nusing namespace std;\r\nint main(void)\r\n{\r\n    int a, b;\r\n    cin >> a >> b;\r\n    cout << a + b << endl;\r\n    return 0;\r\n}'),(75,'#include <iostream>\r\nusing namespace std;\r\nint main(void)\r\n{\r\n    int a, b;\r\n    cin >> a >> b;\r\n    cout << a + b << endl;\r\n    return 0;\r\n}'),(76,'#include <iostream>\r\n\r\n　\r\n\r\nusing namespace std;\r\n\r\n　\r\n\r\nint main(void)\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    cin >> a >> b;\r\n\r\n    cout << a + b << endl;\r\n\r\n    return 0;\r\n\r\n}'),(77,'#include <iostream>\r\n\r\n　\r\n\r\nusing namespace std;\r\n\r\n　\r\n\r\nint main(void)\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    cin >> a >> b;\r\n\r\n    cout << a + b << endl;\r\n\r\n    return 0;\r\n\r\n}'),(78,'#include <iostream>\r\n\r\n\r\n\r\nusing namespace std;\r\n\r\n\r\n\r\nint main(void)\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    cin >> a >> b;\r\n\r\n    cout << a + b << endl;\r\n\r\n    return 0;\r\n\r\n}'),(79,'import java.util.*;\r\npublic class Main\r\n{\r\n    public static void main(String args[])\r\n    {\r\n        Scanner cin = new Scanner(System.in);\r\n        int a = cin.nextInt(), b = cin.nextInt();\r\n        System.out.println(a + b);\r\n    }\r\n}'),(80,'import java.util.*;\r\npublic class Main\r\n{\r\n    public static void main(String args[])\r\n    {\r\n        Scanner cin = new Scanner(System.in);\r\n        int a = cin.nextInt(), b = cin.nextInt();\r\n        System.out.println(a + b);\r\n    }\r\n}'),(81,'#include <stdio.h>\r\n\r\nint main()\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    while(scanf(\"%d %d\", &a, &b)!=EOF)\r\n\r\n    printf(\"%d\\n\", a + b);\r\n\r\n    return 0;\r\n\r\n}'),(82,'﻿#include<stdio.h>\r\nvoid main()\r\n{\r\n    int a,i,b,n,range;\r\n    scanf(\"%d\",&range);\r\n    if(range<2||range>3000)\r\n        printf(\"input beyond the range!\");\r\n    else{\r\n        for(a=1;a<=range;a++) //穷举range以内的全部整数\r\n        {\r\n               for(b=0,i=1;i<=a/2;i++) //计算数a的各因子，各因子之和存放于b\r\n               if(!(a%i))b+=i;\r\n               //计算b的各因子，各因子之和存于n\r\n               for(n=0, i=1; i<=b/2; i++)\r\n               if(!(b%i))n+=i;\r\n               if(n==a&&a<b)\r\n               printf(\"%d..%d\\n\",a,b); //若n =a，则a和b是一对亲密数，输出\r\n        }\r\n    }\r\n}'),(83,'﻿#include<stdio.h>\r\nvoid main()\r\n{\r\n    int a,range;\r\n    scanf(\"%d\",&range);\r\n    if(range>=2&&range<=3000)\r\n    {\r\n        for(a=1;a<=range;a++)\r\n        {\r\n            int b=0,n=0;\r\n            int i=1,j=1;\r\n            while(i<=a/2)\r\n            {\r\n                if(a%i==0)b+=i;\r\n                i++;\r\n            }\r\n            while(j<=b/2)\r\n            {\r\n                if(b%j==0)n+=j;\r\n                j++;\r\n            }\r\n            if(a<b&&n==a)\r\n                printf(\"%d..%d\\n\",a,b);\r\n        }\r\n    }\r\n    else printf(\"input beyond the range!\");\r\n    return 0;\r\n}'),(84,'﻿#include<stdio.h>\r\nvoid main()\r\n{\r\n    int a,i,b,n,range;\r\n    scanf(\"%d\",&range);\r\n    if(range<2||range>3000)\r\n        printf(\"input beyond the range!\");\r\n    else{\r\n        for(a=1;a<=range;a++) //穷举range以内的全部整数\r\n        {\r\n               for(b=0,i=1;i<=a/2;i++) //计算数a的各因子，各因子之和存放于b\r\n               if(!(a%i))b+=i;\r\n               //计算b的各因子，各因子之和存于n\r\n               for(n=0, i=1; i<=b/2; i++)\r\n               if(!(b%i))n+=i;\r\n               if(n==a&&a<b)\r\n               printf(\"%d..%d\\n\",a,b); //若n =a，则a和b是一对亲密数，输出\r\n        }\r\n    }\r\n}'),(85,'﻿#include<stdio.h>\r\nint main()\r\n{\r\n    int var_a,var_i,var_b,var_n,var_range;\r\n    scanf(\"%d\",&var_range);\r\n    if(var_range<2||var_range>3000)\r\n        printf(\"input beyond the range!\");\r\n    else{\r\n        for(var_a=1;var_a<=var_range;var_a++)\r\n        {\r\n            for(var_b=0,var_i=1;var_i<=var_a/2;var_i++)\r\n                if(!(var_a%var_i))var_b+=var_i;\r\n            for(var_n=0,var_i=1;var_i<=var_b/2;var_i++)\r\n                if(!(var_b%var_i))var_n+=var_i;\r\n            if(var_n==var_a&&var_a<var_b)\r\n                printf(\"%d..%d\\n\",var_a,var_b);\r\n        }\r\n    }\r\n    return 0;\r\n}'),(86,'#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nint main(void)\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    cin >> a >> b;\r\n\r\n    cout << a + b << endl;\r\n\r\n    return 0;\r\n\r\n}'),(87,'#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nint main(void)\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    cin >> a >> b;\r\n\r\n    cout << a + b << endl;\r\n\r\n    return 0;\r\n\r\n}'),(88,'#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nint main(void)\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    cin >> a >> b;\r\n\r\n    cout << a + b << endl;\r\n\r\n    return 0;\r\n\r\n}'),(89,'#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nint main(void)\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    cin >> a >> b;\r\n\r\n    cout << a + b << endl;\r\n\r\n    return 0;\r\n\r\n}'),(90,'#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nint main(void)\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    cin >> a >> b;\r\n\r\n    cout << a + b << endl;\r\n\r\n    return 0;\r\n\r\n}'),(91,'#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nint main(void)\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    cin >> a >> b;\r\n\r\n    cout << a + b << endl;\r\n\r\n    return 0;\r\n\r\n}'),(92,'#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nint main(void)\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    cin >> a >> b;\r\n\r\n    cout << a + b << endl;\r\n\r\n    return 0;\r\n\r\n}'),(93,'#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nint main(void)\r\n\r\n{\r\n\r\n    int a, b;\r\n    while(true){\r\n    cin >> a >> b;\r\n\r\n    cout << a + b << endl;}\r\n\r\n    return 0;\r\n\r\n}'),(94,'#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nint main(void)\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    cin >> a >> b;\r\n\r\n    cout << a + b << endl;\r\n    cout << \"        \"<<endl;\r\n\r\n    return 0;\r\n\r\n}'),(95,'#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nint main(void)\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    cin >> a >> b;\r\n\r\n    cout << a + b << endl;\r\n    cout << \"         \"<<endl;\r\n\r\n    return 0;\r\n\r\n}'),(96,'#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nint main(void)\r\n\r\n{\r\n\r\n    double a, b;\r\n\r\n    cin >> a >> b;\r\n\r\n    cout << a + b << endl;\r\n\r\n    return 0;\r\n\r\n}'),(97,'#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nint main(void)\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    cin >> a >> b;\r\n\r\n    cout << a + b << endl;\r\n\r\n    return 0;\r\n\r\n}'),(98,'﻿#include<stdio.h>\r\nvoid main()\r\n{\r\n    int a,range;\r\n    scanf(\"%d\",&range);\r\n    if(range>=2&&range<=3000)\r\n    {\r\n        for(a=1;a<=range;a++)\r\n        {\r\n            int b=0,n=0;\r\n            int i=1,j=1;\r\n            while(i<=a/2)\r\n            {\r\n                if(a%i==0)b+=i;\r\n                i++;\r\n            }\r\n            while(j<=b/2)\r\n            {\r\n                if(b%j==0)n+=j;\r\n                j++;\r\n            }\r\n            if(a<b&&n==a)\r\n                printf(\"%d..%d\\n\",a,b);\r\n        }\r\n    }\r\n    else printf(\"input beyond the range!\");\r\n    return 0;\r\n}'),(99,'﻿#include<stdio.h>\r\nint main()\r\n{\r\n    int var_a,var_i,var_b,var_n,var_range;\r\n    scanf(\"%d\",&var_range);\r\n    if(var_range<2||var_range>3000)\r\n        printf(\"input beyond the range!\");\r\n    else{\r\n        for(var_a=1;var_a<=var_range;var_a++)\r\n        {\r\n            for(var_b=0,var_i=1;var_i<=var_a/2;var_i++)\r\n                if(!(var_a%var_i))var_b+=var_i;\r\n            for(var_n=0,var_i=1;var_i<=var_b/2;var_i++)\r\n                if(!(var_b%var_i))var_n+=var_i;\r\n            if(var_n==var_a&&var_a<var_b)\r\n                printf(\"%d..%d\\n\",var_a,var_b);\r\n        }\r\n    }\r\n    return 0;\r\n}'),(100,'﻿#include<stdio.h>\r\nint main()\r\n{\r\n    while(true){}\r\nreturn 0;\r\n}'),(101,'﻿#include<stdio.h>\r\nint main()\r\n{\r\n    int var_a,var_i,var_b,var_n,var_range;\r\n    scanf(\"%d\",&var_range);\r\n    if(var_range<2||var_range>3000)\r\n        printf(\"input beyond the range!\");\r\n    else{\r\n        for(var_a=1;var_a<=var_range;var_a++)\r\n        {\r\n            for(var_b=0,var_i=1;var_i<=var_a/2;var_i++)\r\n                if(!(var_a%var_i))var_b+=var_i;\r\n            for(var_n=0,var_i=1;var_i<=var_b/2;var_i++)\r\n                if(!(var_b%var_i))var_n+=var_i;\r\n            if(var_n==var_a&&var_a<var_b)\r\n                printf(\"%d..%d\\n\",var_a,var_b);\r\n        }\r\n    }\r\n    return 0;\r\n}'),(102,'﻿#include<stdio.h>\r\nvoid main()\r\n{\r\n    int a,i,b,n,range;\r\n    scanf(\"%d\",&range);\r\n    if(range<2||range>3000)\r\n        printf(\"input beyond the range!\");\r\n    else{\r\n        for(a=1;a<=range;a++) //穷举range以内的全部整数\r\n        {\r\n               for(b=0,i=1;i<=a/2;i++) //计算数a的各因子，各因子之和存放于b\r\n               if(!(a%i))b+=i;\r\n               //计算b的各因子，各因子之和存于n\r\n               for(n=0, i=1; i<=b/2; i++)\r\n               if(!(b%i))n+=i;\r\n               if(n==a&&a<b)\r\n               printf(\"%d..%d\\n\",a,b); //若n =a，则a和b是一对亲密数，输出\r\n        }\r\n    }\r\n}'),(103,'﻿#include<stdio.h>\r\n\r\nvoid main()\r\n\r\n{\r\n\r\n    int a,i,b,n,range;\r\n\r\n    scanf(\"%d\",&range);\r\n\r\n    if(range<2||range>3000)\r\n\r\n        printf(\"input beyond the range!\");\r\n\r\n    else{\r\n\r\n        for(a=1;a<=range;a++) //穷举range以内的全部整数\r\n\r\n        {\r\n\r\n               for(b=0,i=1;i<=a/2;i++) //计算数a的各因子，各因子之和存放于b\r\n\r\n               if(!(a%i))b+=i;\r\n\r\n               //计算b的各因子，各因子之和存于n\r\n\r\n               for(n=0, i=1; i<=b/2; i++)\r\n\r\n               if(!(b%i))n+=i;\r\n\r\n               if(n==a&&a<b)\r\n\r\n               printf(\"%d..%d\\n\",a,b); //若n =a，则a和b是一对亲密数，输出\r\n\r\n        }\r\n\r\n    }\r\n\r\n}'),(104,'import java.util.*;\r\npublic class Main\r\n{\r\n    public static void main(String args[])\r\n    {\r\n        Scanner cin = new Scanner(System.in);\r\n        int a = cin.nextInt(), b = cin.nextInt();\r\n        System.out.println(a + b);\r\n    }\r\n}'),(105,'﻿#include<stdio.h>\r\nvoid main()\r\n{\r\n    int a,i,b,n,range;\r\n    scanf(\"%d\",&range);\r\n    if(range<2||range>3000)\r\n        printf(\"input beyond the range!\");\r\n    else{\r\n        for(a=1;a<=range;a++) //穷举range以内的全部整数\r\n        {\r\n               for(b=0,i=1;i<=a/2;i++) //计算数a的各因子，各因子之和存放于b\r\n               if(!(a%i))b+=i;\r\n               //计算b的各因子，各因子之和存于n\r\n               for(n=0, i=1; i<=b/2; i++)\r\n               if(!(b%i))n+=i;\r\n               if(n==a&&a<b)\r\n               printf(\"%d..%d\\n\",a,b); //若n =a，则a和b是一对亲密数，输出\r\n        }\r\n    }\r\n}'),(106,'﻿#include<stdio.h>\r\nvoid main()\r\n{\r\n    int a,range;\r\n    scanf(\"%d\",&range);\r\n    if(range>=2&&range<=3000)\r\n    {\r\n        for(a=1;a<=range;a++)\r\n        {\r\n            int b=0,n=0;\r\n            int i=1,j=1;\r\n            while(i<=a/2)\r\n            {\r\n                if(a%i==0)b+=i;\r\n                i++;\r\n            }\r\n            while(j<=b/2)\r\n            {\r\n                if(b%j==0)n+=j;\r\n                j++;\r\n            }\r\n            if(a<b&&n==a)\r\n                printf(\"%d..%d\\n\",a,b);\r\n        }\r\n    }\r\n    else printf(\"input beyond the range!\");\r\n    return 0;\r\n}'),(107,'﻿#include<stdio.h>\r\nvoid main()\r\n{\r\n    int a,i,b,n,r;\r\n    scanf(\"%d\",&r);\r\n    if(r<2||r>3000)\r\n    else{\r\n        for(a=1;a<=r;a++)//穷举range以内的全部整数\r\n        {\r\n            b=0; n=0;\r\n            for(i=1;i<=a/2;i++) //计算数a的各因子，各因子之和存放于b\r\n            if(a%i==0)\r\n               b=b+i; //计算b的各因子，各因子之和存于n\r\n            for(i=1;i<=b/2;i++)\r\n               if(b%i==0)\r\n               n=n+i;\r\n               if(n==a&&a<b)\r\n               printf(\"%d..%d\\n\",a,b); //若n=a，则a和b是一对亲密数，输出\r\n        }\r\n    }\r\n}'),(108,'﻿#include<stdio.h>\r\nvoid main()\r\n{\r\n    int a,i,b,n,r;\r\n    scanf(\"%d\",&r);\r\n    if(r<2||r>3000)\r\n    printf(\"\");\r\n    else{\r\n        for(a=1;a<=r;a++)//穷举range以内的全部整数\r\n        {\r\n            b=0; n=0;\r\n            for(i=1;i<=a/2;i++) //计算数a的各因子，各因子之和存放于b\r\n            if(a%i==0)\r\n               b=b+i; //计算b的各因子，各因子之和存于n\r\n            for(i=1;i<=b/2;i++)\r\n               if(b%i==0)\r\n               n=n+i;\r\n               if(n==a&&a<b)\r\n               printf(\"%d..%d\\n\",a,b); //若n=a，则a和b是一对亲密数，输出\r\n        }\r\n    }\r\n}'),(109,'﻿#include<stdio.h>\r\nint main()\r\n{\r\n    int a,i,b,j,range;\r\n    scanf(\"%d\",&range);\r\n    if(range>=2&&range<=3000){\r\n        for(a=1;a<=range;a++)\r\n        {\r\n            for(b=0,i=1;i<=a/2;i++)\r\n                if(!(a%i))b+=i;\r\n            for(j=0,i=1;i<=b/2;i++)\r\n                if(!(b%i))j=j+i+1-1;\r\n            if(j==a&&a>b)\r\n            printf(\"%d..%d\\n\",a,b);\r\n        }\r\n    }\r\n    else\r\n        printf(\"input beyond the range!\");\r\n    return 0;\r\n}'),(110,'﻿#include<stdio.h>\r\nint main()\r\n{\r\n    int a,i,b,j,range;\r\n    scanf(\"%d\",&range);\r\n    if(range>=2&&range<=3000){\r\n        for(a=1;a<=range;a++)\r\n        {\r\n            for(b=0,i=1;i<=a/2;i++)\r\n                if(!(a%i))b+=i;\r\n            for(j=0,i=1;i<=b/2;i++)\r\n                if(!(b%i))j=j+i+1-1;\r\n            if(j==a&&a>b)\r\n            printf(\"%d..%d\\n\",a,b);\r\n        }\r\n    }\r\n    else\r\n        printf(\"input beyond the range!\");\r\n    return 0;\r\n}'),(111,'﻿#include<stdio.h>\r\nint main()\r\n{\r\n    int a,i,b,j,range;\r\n    scanf(\"%d\",&range);\r\n    if(range>=2&&range<=3000){\r\n        for(a=1;a<=range;a++)\r\n        {\r\n            for(b=0,i=1;i<=a/2;i++)\r\n                if(!(a%i))b+=i;\r\n            for(j=0,i=1;i<=b/2;i++)\r\n                if(!(b%i))j=j+i+1-1;\r\n            if(j==a&&a>b)\r\n            printf(\"%d..%d\\n\",a,b);\r\n        }\r\n    }\r\n    else\r\n        printf(\"input beyond the range!\");\r\n    return 0;\r\n}'),(112,'import java.util.*;\r\n\r\npublic class Main\r\n\r\n{\r\n\r\n    public static void main(String args[])\r\n\r\n    {\r\n\r\n        Scanner cin = new Scanner(System.in);\r\n\r\n        int a = cin.nextInt(), b = cin.nextInt();\r\n\r\n        System.out.println(a + b);\r\n\r\n    }\r\n\r\n}'),(113,'﻿#include<stdio.h>\r\nvoid main()\r\n{\r\n    int a,i,b,n,num;\r\n    scanf(\"%d\",&num);\r\n    if(num<2||num>3000)\r\n        printf(\"input beyond the range!\");\r\n    else{\r\n        for(a=1;a<=num;a++)\r\n        {\r\n            b=0;\r\n            i=1;\r\n            while(i<=a/2)\r\n            {\r\n               if(! (a%i))\r\n               {b+=i;}\r\n               i++;\r\n            }\r\n            n=0;\r\n            i=1;\r\n            while(i<=b/2)\r\n            {\r\n               if(!(b%i))\r\n               {n+=i;}\r\n               i++;\r\n            }\r\n            if(n==a&&a<b)\r\n               printf(\"%d..%d\\n\",a,b);\r\n        }//for\r\n    }//else\r\n}//main'),(114,'﻿#include<stdio.h>\r\n\r\nvoid main()\r\n\r\n{\r\n\r\n    int a,i,b,n,num;\r\n\r\n    scanf(\"%d\",&num);\r\n\r\n    if(num<2||num>3000)\r\n\r\n        printf(\"input beyond the range!\");\r\n\r\n    else{\r\n\r\n        for(a=1;a<=num;a++)\r\n\r\n        {\r\n\r\n            b=0;\r\n\r\n            i=1;\r\n\r\n            while(i<=a/2)\r\n\r\n            {\r\n\r\n               if(! (a%i))\r\n\r\n               {b+=i;}\r\n\r\n               i++;\r\n\r\n            }\r\n\r\n            n=0;\r\n\r\n            i=1;\r\n\r\n            while(i<=b/2)\r\n\r\n            {\r\n\r\n               if(!(b%i))\r\n\r\n               {n+=i;}\r\n\r\n               i++;\r\n\r\n            }\r\n\r\n            if(n==a&&a<b)\r\n\r\n               printf(\"%d..%d\\n\",a,b);\r\n\r\n        }//for\r\n\r\n    }//else\r\n\r\n}//main');
/*!40000 ALTER TABLE `source_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `status_id` int(11) NOT NULL,
  `result_id` int(11) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`status_id`),
  UNIQUE KEY `status_id_UNIQUE` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,0,'Waiting'),(2,1,'Accepted'),(3,2,'Time Limit Exceeded'),(4,3,'Memory Limit Exceeded'),(5,4,'Wrong Answer'),(6,5,'Runtime Error'),(7,6,'Output Limit'),(8,7,'Compile Error'),(9,8,'Presentation Error'),(10,11,'System Error'),(11,12,'Judging');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `statusinfo`
--

DROP TABLE IF EXISTS `statusinfo`;
/*!50001 DROP VIEW IF EXISTS `statusinfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `statusinfo` (
  `solution_id` tinyint NOT NULL,
  `problem_id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `time` tinyint NOT NULL,
  `memory` tinyint NOT NULL,
  `in_date` tinyint NOT NULL,
  `language` tinyint NOT NULL,
  `ip` tinyint NOT NULL,
  `contest_id` tinyint NOT NULL,
  `valid` tinyint NOT NULL,
  `num` tinyint NOT NULL,
  `code_length` tinyint NOT NULL,
  `judgetime` tinyint NOT NULL,
  `is_sim` tinyint NOT NULL,
  `status_id` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `language_name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varbinary(60) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '0',
  `top_level` int(2) NOT NULL DEFAULT '0',
  `cid` int(11) DEFAULT NULL,
  `pid` int(11) NOT NULL,
  `author_id` varchar(20) NOT NULL,
  PRIMARY KEY (`tid`),
  KEY `cid` (`cid`,`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` varchar(20) NOT NULL DEFAULT '',
  `email` varchar(100) DEFAULT NULL,
  `submit` int(11) DEFAULT '0',
  `solved` int(11) DEFAULT '0',
  `defunct` char(1) NOT NULL DEFAULT 'C',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `accesstime` datetime DEFAULT NULL,
  `volume` int(11) NOT NULL DEFAULT '1',
  `language` int(11) NOT NULL DEFAULT '1',
  `password` varchar(32) DEFAULT NULL,
  `reg_time` datetime DEFAULT NULL,
  `nick` varchar(100) NOT NULL DEFAULT '',
  `school` varchar(100) NOT NULL DEFAULT '',
  `activated` int(11) NOT NULL DEFAULT '0',
  `accepted` int(11) DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('admin','',35,0,'A','127.0.0.1',NULL,555,555,'admin','2016-05-05 03:22:13','admin','',555,245),('test1','',13,0,'C','127.0.0.1',NULL,555,555,'123456','2016-05-16 07:07:31','测试用户','',555,45);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `archive`
--

/*!50001 DROP TABLE IF EXISTS `archive`*/;
/*!50001 DROP VIEW IF EXISTS `archive`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `archive` AS select `so`.`user_id` AS `user_id`,`so`.`problem_id` AS `problem_id`,`so`.`solution_id` AS `solution_id`,`language`.`language_ext` AS `language_ext`,`status`.`status` AS `result`,`source_code`.`source` AS `code` from (((`solution` `so` left join `language` on((`so`.`language` = `language`.`language`))) left join `status` on((`so`.`result` = `status`.`result_id`))) left join `source_code` on((`so`.`solution_id` = `source_code`.`solution_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `contestinfo`
--

/*!50001 DROP TABLE IF EXISTS `contestinfo`*/;
/*!50001 DROP VIEW IF EXISTS `contestinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sdustoj`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `contestinfo` AS select `contest`.`contest_id` AS `contest_id`,`contest`.`title` AS `title`,`contest`.`start_time` AS `start_time`,`contest`.`end_time` AS `end_time`,`contest`.`defunct` AS `defunct`,`contest`.`points` AS `points`,`contest`.`langmask` AS `langmask`,`contest`.`contest_mode` AS `contest_mode`,`contest_privilege`.`privilege` AS `privilege`,`language`.`language_name` AS `language` from ((`contest` left join `contest_privilege` on((`contest`.`private` = `contest_privilege`.`private_id`))) left join `language` on((`contest`.`langmask` = `language`.`language`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sim_info`
--

/*!50001 DROP TABLE IF EXISTS `sim_info`*/;
/*!50001 DROP VIEW IF EXISTS `sim_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sim_info` AS select `sim`.`s_id` AS `s_id`,`sim`.`sim_s_id` AS `sim_s_id`,`sim`.`sim` AS `sim`,`solution`.`user_id` AS `user_id` from (`sim` left join `solution` on((`sim`.`sim_s_id` = `solution`.`solution_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `statusinfo`
--

/*!50001 DROP TABLE IF EXISTS `statusinfo`*/;
/*!50001 DROP VIEW IF EXISTS `statusinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sdustoj`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `statusinfo` AS select `so`.`solution_id` AS `solution_id`,`so`.`problem_id` AS `problem_id`,`so`.`user_id` AS `user_id`,`so`.`time` AS `time`,`so`.`memory` AS `memory`,`so`.`in_date` AS `in_date`,`so`.`language` AS `language`,`so`.`ip` AS `ip`,`so`.`contest_id` AS `contest_id`,`so`.`valid` AS `valid`,`so`.`num` AS `num`,`so`.`code_length` AS `code_length`,`so`.`judgetime` AS `judgetime`,`so`.`is_sim` AS `is_sim`,`status`.`status_id` AS `status_id`,`status`.`status` AS `status`,`language`.`language_name` AS `language_name` from ((`solution` `so` left join `status` on((`so`.`result` = `status`.`result_id`))) left join `language` on((`so`.`language` = `language`.`language`))) */;
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

-- Dump completed on 2016-06-07 14:40:40
