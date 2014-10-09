-- MySQL dump 10.13  Distrib 5.5.31, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: forum
-- ------------------------------------------------------
-- Server version	5.5.31-0ubuntu0.12.04.2

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
-- Table structure for table `forum`
--

DROP TABLE IF EXISTS `forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_forumCategorie_categorie` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` text NOT NULL,
  `ordre` int(11) NOT NULL,
  `id_post_lastPost` int(11) NOT NULL,
  `topics` int(11) NOT NULL,
  `nbrposts` int(11) DEFAULT NULL,
  `accreditation` int(11) NOT NULL,
  `view_statut` tinyint(4) NOT NULL,
  `post_statut` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum`
--

LOCK TABLES `forum` WRITE;
/*!40000 ALTER TABLE `forum` DISABLE KEYS */;
INSERT INTO `forum` VALUES (1,1,'PHP','Tous sur le web',1,-1,16,-2,1,1,3),(3,1,'HTML5','Tous sur le web',2,-1,0,0,1,1,3),(4,4,'Test','test',0,-1,0,0,3,1,1);
/*!40000 ALTER TABLE `forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forumcategorie`
--

DROP TABLE IF EXISTS `forumcategorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forumcategorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_fr` varchar(256) NOT NULL,
  `value_fr` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forumcategorie`
--

LOCK TABLES `forumcategorie` WRITE;
/*!40000 ALTER TABLE `forumcategorie` DISABLE KEYS */;
INSERT INTO `forumcategorie` VALUES (1,'Programmation Web','PHP'),(2,'Programmation Web','HTML/CSS'),(3,'Programmation Web','Javascript'),(4,'Main','Test');
/*!40000 ALTER TABLE `forumcategorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user_createur` int(11) NOT NULL,
  `text` text NOT NULL,
  `dateCreation` datetime NOT NULL,
  `topic_id` int(11) NOT NULL,
  `forum_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (77,2024,'qsdfqsdfqsdfqsdfqsdfqs','2013-06-04 21:33:16',117,1),(78,2024,'dfsfdd','2013-06-04 21:39:14',118,1),(79,2024,'dfsfdd','2013-06-04 21:40:30',119,1),(80,2024,'dfsfdd','2013-06-04 21:40:44',120,1),(82,2024,'sdfqsdf','2013-06-04 21:33:05',122,1),(95,2024,'[b]Et un deplus[\\\\b]','2013-06-09 18:35:28',135,1),(96,2024,'Fais chier ','2013-06-09 18:35:39',135,1);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forum_id` int(11) NOT NULL,
  `titre` varchar(60) NOT NULL,
  `id_user_createur` int(11) NOT NULL,
  `langue` varchar(5) DEFAULT NULL,
  `vues` mediumint(8) NOT NULL,
  `posts` mediumint(8) NOT NULL,
  `dateCreation` datetime DEFAULT NULL,
  `genre` varchar(30) NOT NULL,
  `id_post_lastPost` int(11) NOT NULL,
  `id_post_firstPost` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (122,1,'qsdfqsdfq',2024,'uk',4,1,'0000-00-00 00:00:00','0',83,82),(135,1,'Je m\\\'entraine ',2024,'uk',4,2,'2013-06-09 18:35:28','0',96,95);
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-06-29 22:00:01
