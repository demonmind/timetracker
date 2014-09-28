# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.20)
# Database: tm_tracker
# Generation Time: 2014-09-28 19:57:19 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table employees
# ------------------------------------------------------------

DROP TABLE IF EXISTS `employees`;

CREATE TABLE `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `emp_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;

INSERT INTO `employees` (`id`, `fname`, `lname`, `uid`, `status`, `emp_type`, `created_at`, `updated_at`)
VALUES
	(1,'Kleon','Kita','12345',NULL,'admin','2014-09-27 22:25:44','2014-09-27 22:25:44'),
	(6,'James','Dean','ZBU67',NULL,'general','2014-09-28 02:53:44','2014-09-28 02:53:44'),
	(7,'John','Doe','Z7U56',NULL,'general','2014-09-28 14:26:46','2014-09-28 14:26:46'),
	(9,'Larry','Ellison','BVCXG',NULL,'general','2014-09-28 14:30:30','2014-09-28 14:30:30');

/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table schema_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `schema_migrations`;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;

INSERT INTO `schema_migrations` (`version`)
VALUES
	('20140926020233'),
	('20140926130848'),
	('20140927222101');

/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table timerecords
# ------------------------------------------------------------

DROP TABLE IF EXISTS `timerecords`;

CREATE TABLE `timerecords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `in_time` time DEFAULT NULL,
  `out_time` time DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `timerecords` WRITE;
/*!40000 ALTER TABLE `timerecords` DISABLE KEYS */;

INSERT INTO `timerecords` (`id`, `date`, `in_time`, `out_time`, `employee_id`, `created_at`, `updated_at`)
VALUES
	(1,'2014-09-22','22:27:30','22:31:47',1,'2014-09-27 22:27:30','2014-09-27 22:31:47'),
	(2,'2014-09-23','22:31:59','23:32:11',1,'2014-09-27 22:31:59','2014-09-27 22:32:11'),
	(3,'2014-09-24','23:09:07','23:53:46',1,'2014-09-27 23:09:07','2014-09-27 23:53:46'),
	(4,'2014-09-25','20:53:56','23:11:54',1,'2014-09-27 23:53:56','2014-09-28 00:11:55'),
	(6,'2014-09-26','00:11:58','00:15:38',1,'2014-09-28 00:11:58','2014-09-28 00:15:38'),
	(7,'2014-09-27','00:44:45','01:14:41',1,'2014-09-28 00:44:45','2014-09-28 01:14:41'),
	(14,'2014-09-20','02:54:00','02:56:38',6,'2014-09-28 02:54:00','2014-09-28 02:56:38'),
	(16,'2014-09-21','01:10:05','03:10:50',6,'2014-09-28 03:10:05','2014-09-28 03:10:50'),
	(20,'2014-09-22','02:38:33','03:41:23',6,'2014-09-28 03:38:33','2014-09-28 03:41:23'),
	(21,'2014-09-23','03:00:39','03:43:40',6,'2014-09-28 03:41:39','2014-09-28 03:43:40'),
	(22,'2014-09-24','01:45:49','03:46:46',6,'2014-09-28 03:45:49','2014-09-28 03:46:46'),
	(23,'2014-09-25','02:47:00','03:49:17',6,'2014-09-28 03:47:00','2014-09-28 03:49:17'),
	(24,'2014-09-26','01:49:56','09:53:49',6,'2014-09-28 03:49:56','2014-09-28 03:53:49'),
	(25,'2014-09-27','03:56:08','09:57:12',6,'2014-09-28 03:56:08','2014-09-28 03:57:12'),
	(29,'2014-09-28','14:08:15','17:11:10',6,'2014-09-28 14:08:15','2014-09-28 14:11:10'),
	(40,'2014-09-28','19:41:19','19:56:15',1,'2014-09-28 19:41:19','2014-09-28 19:56:15');

/*!40000 ALTER TABLE `timerecords` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
