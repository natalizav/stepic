-- MySQL dump 10.13  Distrib 5.5.47, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: stepic
-- ------------------------------------------------------
-- Server version	5.5.47-0ubuntu0.14.04.1

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

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
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
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
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
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add question',7,'add_question'),(20,'Can change question',7,'change_question'),(21,'Can delete question',7,'delete_question'),(22,'Can add answer',8,'add_answer'),(23,'Can change answer',8,'change_answer'),(24,'Can delete answer',8,'delete_answer');
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
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$12000$jEUrT54tMQdz$SqPK62UTSOa+mmZb/v7eaa32utyVu0iLB4v0hqeHjN8=','2016-03-15 23:49:47',1,'box','','','',1,1,'2016-03-15 23:49:47'),(2,'test','2016-03-16 23:46:07',0,'test','','','',0,1,'2016-03-16 23:46:07');
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
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`),
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
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
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
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
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'user','auth','user'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'question','qa','question'),(8,'answer','qa','answer');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
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
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_answer`
--

DROP TABLE IF EXISTS `qa_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `added_at` datetime NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qa_answer_25110688` (`question_id`),
  KEY `qa_answer_e969df21` (`author_id`),
  CONSTRAINT `question_id_refs_id_06975074` FOREIGN KEY (`question_id`) REFERENCES `qa_question` (`id`),
  CONSTRAINT `author_id_refs_id_8b5df575` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_answer`
--

LOCK TABLES `qa_answer` WRITE;
/*!40000 ALTER TABLE `qa_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_question`
--

DROP TABLE IF EXISTS `qa_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `text` longtext NOT NULL,
  `added_at` datetime NOT NULL,
  `rating` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qa_question_e969df21` (`author_id`),
  CONSTRAINT `author_id_refs_id_19215df4` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3141686 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_question`
--

LOCK TABLES `qa_question` WRITE;
/*!40000 ALTER TABLE `qa_question` DISABLE KEYS */;
INSERT INTO `qa_question` VALUES (1,'question 0','text 0','2016-03-16 23:50:55',0,2),(2,'question 1','text 1','2016-03-16 23:50:55',1,2),(3,'question 2','text 2','2016-03-16 23:50:55',2,2),(4,'question 3','text 3','2016-03-16 23:50:55',3,2),(5,'question 4','text 4','2016-03-16 23:50:55',4,2),(6,'question 5','text 5','2016-03-16 23:50:55',5,2),(7,'question 6','text 6','2016-03-16 23:50:55',6,2),(8,'question 7','text 7','2016-03-16 23:50:55',7,2),(9,'question 8','text 8','2016-03-16 23:50:55',8,2),(10,'question 9','text 9','2016-03-16 23:50:55',9,2),(11,'question 10','text 10','2016-03-16 23:50:55',10,2),(12,'question 11','text 11','2016-03-16 23:50:55',11,2),(13,'question 12','text 12','2016-03-16 23:50:55',12,2),(14,'question 13','text 13','2016-03-16 23:50:55',13,2),(15,'question 14','text 14','2016-03-16 23:50:55',14,2),(16,'question 15','text 15','2016-03-16 23:50:55',15,2),(17,'question 16','text 16','2016-03-16 23:50:55',16,2),(18,'question 17','text 17','2016-03-16 23:50:55',17,2),(19,'question 18','text 18','2016-03-16 23:50:55',18,2),(20,'question 19','text 19','2016-03-16 23:50:55',19,2),(21,'question 20','text 20','2016-03-16 23:50:55',20,2),(22,'question 21','text 21','2016-03-16 23:50:55',21,2),(23,'question 22','text 22','2016-03-16 23:50:55',22,2),(24,'question 23','text 23','2016-03-16 23:50:55',23,2),(25,'question 24','text 24','2016-03-16 23:50:55',24,2),(26,'question 25','text 25','2016-03-16 23:50:55',25,2),(27,'question 26','text 26','2016-03-16 23:50:55',26,2),(28,'question 27','text 27','2016-03-16 23:50:55',27,2),(29,'question 28','text 28','2016-03-16 23:50:55',28,2),(30,'question 29','text 29','2016-03-16 23:50:55',29,2),(31,'question 0','text 0','2016-03-16 23:52:19',29,2),(32,'question 1','text 1','2016-03-16 23:52:19',30,2),(33,'question 2','text 2','2016-03-16 23:52:19',31,2),(34,'question 3','text 3','2016-03-16 23:52:19',32,2),(35,'question 4','text 4','2016-03-16 23:52:19',33,2),(36,'question 5','text 5','2016-03-16 23:52:19',34,2),(37,'question 6','text 6','2016-03-16 23:52:19',35,2),(38,'question 7','text 7','2016-03-16 23:52:19',36,2),(39,'question 8','text 8','2016-03-16 23:52:19',37,2),(40,'question 9','text 9','2016-03-16 23:52:19',38,2),(41,'question 10','text 10','2016-03-16 23:52:19',39,2),(42,'question 11','text 11','2016-03-16 23:52:19',40,2),(43,'question 12','text 12','2016-03-16 23:52:19',41,2),(44,'question 13','text 13','2016-03-16 23:52:19',42,2),(45,'question 14','text 14','2016-03-16 23:52:19',43,2),(46,'question 15','text 15','2016-03-16 23:52:19',44,2),(47,'question 16','text 16','2016-03-16 23:52:19',45,2),(48,'question 17','text 17','2016-03-16 23:52:19',46,2),(49,'question 18','text 18','2016-03-16 23:52:19',47,2),(50,'question 19','text 19','2016-03-16 23:52:19',48,2),(51,'question 20','text 20','2016-03-16 23:52:19',49,2),(52,'question 21','text 21','2016-03-16 23:52:19',50,2),(53,'question 22','text 22','2016-03-16 23:52:19',51,2),(54,'question 23','text 23','2016-03-16 23:52:19',52,2),(55,'question 24','text 24','2016-03-16 23:52:19',53,2),(56,'question 25','text 25','2016-03-16 23:52:19',54,2),(57,'question 26','text 26','2016-03-16 23:52:19',55,2),(58,'question 27','text 27','2016-03-16 23:52:19',56,2),(59,'question 28','text 28','2016-03-16 23:52:19',57,2),(60,'question 29','text 29','2016-03-16 23:52:19',58,2),(61,'question last','text','2016-03-16 23:52:21',0,2),(3141592,'question about pi','what is the last digit?','2016-03-16 23:52:21',0,2),(3141593,'question 0','text 0','2016-03-16 23:56:51',58,2),(3141594,'question 1','text 1','2016-03-16 23:56:51',59,2),(3141595,'question 2','text 2','2016-03-16 23:56:51',60,2),(3141596,'question 3','text 3','2016-03-16 23:56:51',61,2),(3141597,'question 4','text 4','2016-03-16 23:56:51',62,2),(3141598,'question 5','text 5','2016-03-16 23:56:51',63,2),(3141599,'question 6','text 6','2016-03-16 23:56:51',64,2),(3141600,'question 7','text 7','2016-03-16 23:56:51',65,2),(3141601,'question 8','text 8','2016-03-16 23:56:51',66,2),(3141602,'question 9','text 9','2016-03-16 23:56:51',67,2),(3141603,'question 10','text 10','2016-03-16 23:56:51',68,2),(3141604,'question 11','text 11','2016-03-16 23:56:51',69,2),(3141605,'question 12','text 12','2016-03-16 23:56:51',70,2),(3141606,'question 13','text 13','2016-03-16 23:56:51',71,2),(3141607,'question 14','text 14','2016-03-16 23:56:51',72,2),(3141608,'question 15','text 15','2016-03-16 23:56:51',73,2),(3141609,'question 16','text 16','2016-03-16 23:56:51',74,2),(3141610,'question 17','text 17','2016-03-16 23:56:51',75,2),(3141611,'question 18','text 18','2016-03-16 23:56:51',76,2),(3141612,'question 19','text 19','2016-03-16 23:56:51',77,2),(3141613,'question 20','text 20','2016-03-16 23:56:51',78,2),(3141614,'question 21','text 21','2016-03-16 23:56:51',79,2),(3141615,'question 22','text 22','2016-03-16 23:56:51',80,2),(3141616,'question 23','text 23','2016-03-16 23:56:51',81,2),(3141617,'question 24','text 24','2016-03-16 23:56:51',82,2),(3141618,'question 25','text 25','2016-03-16 23:56:51',83,2),(3141619,'question 26','text 26','2016-03-16 23:56:51',84,2),(3141620,'question 27','text 27','2016-03-16 23:56:51',85,2),(3141621,'question 28','text 28','2016-03-16 23:56:51',86,2),(3141622,'question 29','text 29','2016-03-16 23:56:51',87,2),(3141623,'question last','text','2016-03-16 23:56:53',0,2),(3141624,'question 0','text 0','2016-03-16 23:58:02',87,2),(3141625,'question 1','text 1','2016-03-16 23:58:02',88,2),(3141626,'question 2','text 2','2016-03-16 23:58:02',89,2),(3141627,'question 3','text 3','2016-03-16 23:58:02',90,2),(3141628,'question 4','text 4','2016-03-16 23:58:02',91,2),(3141629,'question 5','text 5','2016-03-16 23:58:02',92,2),(3141630,'question 6','text 6','2016-03-16 23:58:02',93,2),(3141631,'question 7','text 7','2016-03-16 23:58:02',94,2),(3141632,'question 8','text 8','2016-03-16 23:58:02',95,2),(3141633,'question 9','text 9','2016-03-16 23:58:02',96,2),(3141634,'question 10','text 10','2016-03-16 23:58:02',97,2),(3141635,'question 11','text 11','2016-03-16 23:58:02',98,2),(3141636,'question 12','text 12','2016-03-16 23:58:02',99,2),(3141637,'question 13','text 13','2016-03-16 23:58:02',100,2),(3141638,'question 14','text 14','2016-03-16 23:58:02',101,2),(3141639,'question 15','text 15','2016-03-16 23:58:02',102,2),(3141640,'question 16','text 16','2016-03-16 23:58:02',103,2),(3141641,'question 17','text 17','2016-03-16 23:58:02',104,2),(3141642,'question 18','text 18','2016-03-16 23:58:02',105,2),(3141643,'question 19','text 19','2016-03-16 23:58:02',106,2),(3141644,'question 20','text 20','2016-03-16 23:58:02',107,2),(3141645,'question 21','text 21','2016-03-16 23:58:02',108,2),(3141646,'question 22','text 22','2016-03-16 23:58:02',109,2),(3141647,'question 23','text 23','2016-03-16 23:58:02',110,2),(3141648,'question 24','text 24','2016-03-16 23:58:02',111,2),(3141649,'question 25','text 25','2016-03-16 23:58:02',112,2),(3141650,'question 26','text 26','2016-03-16 23:58:02',113,2),(3141651,'question 27','text 27','2016-03-16 23:58:02',114,2),(3141652,'question 28','text 28','2016-03-16 23:58:02',115,2),(3141653,'question 29','text 29','2016-03-16 23:58:02',116,2),(3141654,'question last','text','2016-03-16 23:58:04',0,2),(3141655,'question 0','text 0','2016-03-16 23:59:28',116,2),(3141656,'question 1','text 1','2016-03-16 23:59:28',117,2),(3141657,'question 2','text 2','2016-03-16 23:59:28',118,2),(3141658,'question 3','text 3','2016-03-16 23:59:28',119,2),(3141659,'question 4','text 4','2016-03-16 23:59:28',120,2),(3141660,'question 5','text 5','2016-03-16 23:59:28',121,2),(3141661,'question 6','text 6','2016-03-16 23:59:28',122,2),(3141662,'question 7','text 7','2016-03-16 23:59:28',123,2),(3141663,'question 8','text 8','2016-03-16 23:59:28',124,2),(3141664,'question 9','text 9','2016-03-16 23:59:28',125,2),(3141665,'question 10','text 10','2016-03-16 23:59:28',126,2),(3141666,'question 11','text 11','2016-03-16 23:59:28',127,2),(3141667,'question 12','text 12','2016-03-16 23:59:28',128,2),(3141668,'question 13','text 13','2016-03-16 23:59:28',129,2),(3141669,'question 14','text 14','2016-03-16 23:59:28',130,2),(3141670,'question 15','text 15','2016-03-16 23:59:28',131,2),(3141671,'question 16','text 16','2016-03-16 23:59:28',132,2),(3141672,'question 17','text 17','2016-03-16 23:59:28',133,2),(3141673,'question 18','text 18','2016-03-16 23:59:28',134,2),(3141674,'question 19','text 19','2016-03-16 23:59:28',135,2),(3141675,'question 20','text 20','2016-03-16 23:59:28',136,2),(3141676,'question 21','text 21','2016-03-16 23:59:28',137,2),(3141677,'question 22','text 22','2016-03-16 23:59:28',138,2),(3141678,'question 23','text 23','2016-03-16 23:59:28',139,2),(3141679,'question 24','text 24','2016-03-16 23:59:28',140,2),(3141680,'question 25','text 25','2016-03-16 23:59:28',141,2),(3141681,'question 26','text 26','2016-03-16 23:59:28',142,2),(3141682,'question 27','text 27','2016-03-16 23:59:28',143,2),(3141683,'question 28','text 28','2016-03-16 23:59:28',144,2),(3141684,'question 29','text 29','2016-03-16 23:59:28',145,2),(3141685,'question last','text','2016-03-16 23:59:30',0,2);
/*!40000 ALTER TABLE `qa_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_question_likes`
--

DROP TABLE IF EXISTS `qa_question_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_question_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `question_id` (`question_id`,`user_id`),
  KEY `qa_question_likes_25110688` (`question_id`),
  KEY `qa_question_likes_6340c63c` (`user_id`),
  CONSTRAINT `question_id_refs_id_cbe616b1` FOREIGN KEY (`question_id`) REFERENCES `qa_question` (`id`),
  CONSTRAINT `user_id_refs_id_74a809f8` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_question_likes`
--

LOCK TABLES `qa_question_likes` WRITE;
/*!40000 ALTER TABLE `qa_question_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_question_likes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-16 23:59:49
