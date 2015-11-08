/*
SQLyog Community v12.12 (64 bit)
MySQL - 5.6.15-log : Database - italy_restaurant
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`italy_restaurant` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `italy_restaurant`;

/*Table structure for table `add_ingredients` */

DROP TABLE IF EXISTS `add_ingredients`;

CREATE TABLE `add_ingredients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `id_of_dish` int(11) NOT NULL,
  `name_of_ingredient` varchar(20) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_of_dishes` (`id_of_dish`),
  KEY `name_of_ingredient` (`name_of_ingredient`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `add_ingredients_ibfk_1` FOREIGN KEY (`id_of_dish`) REFERENCES `dishes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `add_ingredients_ibfk_2` FOREIGN KEY (`name_of_ingredient`) REFERENCES `ingredients` (`name_of_ingredient`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `add_ingredients_ibfk_4` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Data for the table `add_ingredients` */

insert  into `add_ingredients`(`id`,`order_id`,`id_of_dish`,`name_of_ingredient`) values (15,68,6,'croutons'),(16,68,6,'fish'),(17,72,4,'fish'),(18,72,4,'ham'),(19,69,6,'fish'),(20,73,7,'fish'),(21,77,7,'eggs'),(22,83,7,'cheese'),(23,83,5,'spaghetti'),(24,88,6,'ham'),(25,89,7,'eggs'),(26,90,2,'corn'),(27,91,1,'eggs'),(28,92,19,'lettuce'),(29,93,6,'croutons'),(30,94,7,'fish'),(31,94,3,'dips'),(32,95,5,'eggs'),(33,95,5,'spaghetti'),(34,98,7,'lettuce'),(35,99,4,'eggs'),(36,99,6,'ham');

/*Table structure for table `bill` */

DROP TABLE IF EXISTS `bill`;

CREATE TABLE `bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(5) NOT NULL,
  `bill` float NOT NULL,
  `item` text CHARACTER SET latin1 NOT NULL,
  `status` varchar(10) CHARACTER SET latin1 NOT NULL DEFAULT 'anetimo',
  `type` varchar(15) CHARACTER SET utf16 NOT NULL DEFAULT 'default',
  `id_magira` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `id_magira` (`id_magira`),
  CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`id_magira`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8;

/*Data for the table `bill` */

insert  into `bill`(`id`,`order_id`,`bill`,`item`,`status`,`type`,`id_magira`) values (23,32,29.35,'pizza with peperoni for 16','READY','dish',1),(24,33,19,'nioki','READY','dish',1),(25,33,2,'dips','READY','dish',1),(26,33,4,'fish','READY','default',1),(27,33,0.4,'lettuce','READY','default',1),(28,33,0.8,'ham','READY','default',1),(29,33,0.8,'ham','READY','default',1),(30,33,0.8,'ham','READY','default',1),(31,33,0.8,'ham','READY','default',1),(32,33,0.8,'ham','anetimo','default',1),(33,34,9.9,'fresh salad','anetimo','dish',1),(34,35,10.3,'soup with chicken','anetimo','dish',1),(35,35,0.65,'eggs','anetimo','ingredients',1),(36,35,0.4,'lettuce','anetimo','ingredients',1),(37,36,10.3,'soup with chicken','anetimo','dish',2),(38,36,9.9,'fresh salad','anetimo','dish',2),(39,36,0.6,'croutons','anetimo','ingredients',2),(40,36,100,'beer','anetimo','drinks',2),(41,37,10.3,'soup with chicken','anetimo','dish',2),(42,37,1.3,'soft drinks','anetimo','drinks',2),(43,37,1.1,'juice','anetimo','drinks',2),(44,37,3.5,'beer','anetimo','drinks',2),(45,37,4,'fish','anetimo','ingredients',2),(46,38,9.9,'fresh salad','anetimo','dish',2),(47,38,1.1,'juice','anetimo','drinks',2),(58,59,1.5,'water','anetimo','dishes',2),(59,59,9.9,'fresh salad','anetimo','dish',2),(60,61,9.9,'fresh salad','anetimo','dish',3),(61,61,29.35,'pizza with peperoni for 16','anetimo','dish',3),(62,61,8.4,'croutons with dips','anetimo','dish',3),(78,68,10.3,'soup with chicken','anetimo','dish',3),(79,68,9.9,'fresh salad','anetimo','dish',3),(81,68,4,'fish','anetimo','ingredients',3),(84,68,4,'fish','anetimo','ingredients',3),(85,68,0.4,'lettuce','anetimo','ingredients',3),(92,68,9.9,'fresh salad','anetimo','dish',3),(93,68,9.9,'fresh salad','anetimo','dish',3),(94,68,9.9,'fresh salad','anetimo','dish',3),(95,68,9.9,'fresh salad','anetimo','dish',3),(96,68,9.9,'fresh salad','anetimo','dish',3),(97,68,9.9,'fresh salad','anetimo','dish',3),(98,68,9.9,'fresh salad','anetimo','dish',3),(99,68,50,'potatoes','anetimo','ingredients',3),(100,68,30,'tomatoes','anetimo','ingredients',3),(101,68,1.1,'juice','anetimo','drinks',3),(102,68,1.1,'juice','anetimo','drinks',3),(103,68,1.3,'soft drinks','anetimo','drinks',3),(104,68,1.1,'juice','anetimo','drinks',3),(120,72,19,'nioki','READY','dish',3),(121,72,4,'fish','READY','ingredients',3),(122,72,0.8,'ham','READY','ingredients',3),(123,72,1.1,'juice','READY','drinks',3),(124,69,9.9,'fresh salad','anetimo','dish',3),(125,69,4,'fish','anetimo','ingredients',3),(126,69,1.3,'soft drinks','anetimo','drinks',3),(127,54,10.3,'soup with chicken','anetimo','dish',3),(128,54,1.1,'juice','anetimo','drinks',3),(129,73,9.9,'fresh salad','READY','dish',3),(130,73,10.3,'soup with chicken','READY','dish',3),(131,73,4,'fish','READY','ingredients',3),(132,73,1.1,'juice','READY','drinks',3),(135,77,10.3,'soup with chicken','READY','dish',1),(136,77,0.65,'eggs','READY','ingredients',3),(139,80,13.9,'pasta','READY','dish',2),(141,83,10.3,'soup with chicken','READY','dish',1),(142,83,0.9,'cheese','READY','ingredients',1),(143,83,1.3,'soft drinks','READY','drinks',1),(144,83,13.9,'pasta','READY','dish',1),(145,83,2,'spaghetti','READY','ingredients',1),(146,87,13.9,'','READY','dish',1),(147,88,9.9,'fresh salad','READY','dish',4),(148,88,0.8,'ham','READY','ingredients',1),(149,88,1.1,'juice','READY','drinks',1),(150,89,10.3,'soup with chicken','READY','dish',4),(151,89,0.65,'eggs','READY','ingredients',1),(152,89,1.5,'water','READY','drinks',1),(153,89,1.3,'soft drinks','READY','drinks',1),(154,90,18.35,'pizza with peperoni for 8','READY','dish',4),(155,90,0.7,'corn','READY','ingredients',1),(156,90,3.5,'beer','READY','drinks',1),(157,90,3.5,'beer','READY','drinks',1),(158,91,11.35,'pizza with peperoni for 4','READY','dish',4),(159,91,0.65,'eggs','READY','ingredients',1),(160,91,3.5,'beer','READY','drinks',1),(161,92,8.9,'soup with cheese','READY','dish',4),(162,92,0.4,'lettuce','READY','ingredients',1),(163,92,1.3,'soft drinks','READY','drinks',1),(164,93,19,'nioki','READY','dish',4),(165,93,9.9,'fresh salad','READY','dish',4),(166,93,0.6,'croutons','READY','ingredients',1),(167,93,1.1,'juice','READY','drinks',1),(168,94,10.3,'soup with chicken','READY','dish',24),(169,94,4,'fish','READY','ingredients',1),(170,94,29.35,'pizza with peperoni for 16','READY','dish',24),(171,94,2,'dips','READY','ingredients',1),(172,94,1.3,'soft drinks','READY','drinks',1),(173,95,13.9,'pasta','READY','dish',24),(174,95,0.65,'eggs','READY','ingredients',1),(175,95,2,'spaghetti','READY','ingredients',1),(176,95,1.1,'juice','READY','drinks',1),(177,96,19,'nioki','READY','dish',24),(178,96,9.9,'fresh salad','READY','dish',24),(179,96,1.5,'water','READY','drinks',1),(180,97,29.35,'pizza with peperoni for 16','READY','dish',24),(181,97,1.5,'water','READY','drinks',1),(182,97,1.1,'juice','READY','drinks',1),(183,98,10.3,'soup with chicken','READY','dish',24),(184,98,0.4,'lettuce','READY','ingredients',1),(185,98,1.1,'juice','READY','drinks',1),(186,99,19,'nioki','anetimo','dish',1),(187,99,0.65,'eggs','anetimo','ingredients',1),(188,99,1.5,'water','anetimo','drinks',1),(189,99,9.9,'fresh salad','anetimo','dish',1),(190,99,0.8,'ham','anetimo','ingredients',1),(191,99,1.3,'soft drinks','anetimo','drinks',1);

/*Table structure for table `customers` */

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `id_bonus_card` int(11) DEFAULT NULL,
  `email` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `bonus` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_bonus_card` (`id_bonus_card`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `customers` */

insert  into `customers`(`id`,`id_bonus_card`,`email`,`bonus`) values (1,123,'eee@examples.com',153),(2,124,'ggg@example.com',7),(3,125,'ggggg',4),(4,126,'er@eecamo.com',1),(5,127,'ews',0),(6,132,'glafkos@examoles.com',69),(7,155,'example@example.com',0),(8,143,'kat_@example.com',7),(9,753,'nikolaog@exqmp.com',0),(10,852,'ex@example.gr',0),(11,857,'Nikolaou',0);

/*Table structure for table `dish_of_the_day` */

DROP TABLE IF EXISTS `dish_of_the_day`;

CREATE TABLE `dish_of_the_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dish_id` int(11) NOT NULL,
  `number_of_portions` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `category` enum('starter','soup','main dish') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dish_id` (`dish_id`),
  CONSTRAINT `dish_of_the_day_ibfk_1` FOREIGN KEY (`dish_id`) REFERENCES `dishes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `dish_of_the_day` */

insert  into `dish_of_the_day`(`id`,`dish_id`,`number_of_portions`,`date`,`category`) values (1,13,100,'2015-08-19 10:10:41','soup'),(2,14,100,'2015-08-19 10:11:06','main dish'),(3,15,159,'2015-08-19 10:11:33','starter'),(4,16,180,'2015-08-20 10:12:12','soup'),(5,17,100,'2015-08-20 10:12:34','main dish'),(6,18,150,'2015-08-20 10:13:13','starter'),(7,19,100,'2015-08-21 10:13:33','soup'),(8,20,100,'2015-08-21 00:00:00','main dish'),(9,21,150,'2015-08-21 10:14:31','starter');

/*Table structure for table `dishes` */

DROP TABLE IF EXISTS `dishes`;

CREATE TABLE `dishes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET latin1 NOT NULL,
  `preparation_time_minutes` int(2) NOT NULL,
  `preparation_instructions` varchar(250) CHARACTER SET latin1 DEFAULT 'nothing',
  `price` float NOT NULL,
  `category` enum('main dish','soup','salad','starter') CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `dishes` */

insert  into `dishes`(`id`,`name`,`preparation_time_minutes`,`preparation_instructions`,`price`,`category`) values (1,'pizza with peperoni for 4',35,'oven',11.35,'main dish'),(2,'pizza with peperoni for 8',35,'oven',18.35,'main dish'),(3,'pizza with peperoni for 16',35,'oven',29.35,'main dish'),(4,'nioki',25,'oven',19,'main dish'),(5,'pasta',23,'nothing',13.9,'main dish'),(6,'fresh salad',10,'nothing',9.9,'salad'),(7,'soup with chicken',30,'nothing',10.3,'soup'),(8,'croutons with dips',5,'nothing',8.4,'starter'),(9,'rizoto',15,'nothing',11.8,'main dish'),(10,'pizza (only cheese) for 4',35,'oven',9.6,'main dish'),(11,'pizza (only cheese) for 8',35,'oven',10.9,'main dish'),(12,'pizza (only cheese) for 16',35,'oven',12.8,'main dish'),(13,'soup with beef',20,'nothing',8.8,'soup'),(14,'special pizza for 8',25,'oven',13.5,'main dish'),(15,'motzarella stiks',10,'nothing',8.6,'starter'),(16,'soup with fish',18,'nothing',9.9,'soup'),(17,'pasta with pesto',25,'nothing',11.3,'main dish'),(18,'motzarella with bread',15,'nothing',7.5,'starter'),(19,'soup with cheese',20,'nothing',8.9,'soup'),(20,'pasta with beef',25,'nothing',12.2,'main dish'),(21,'pesto with bread',15,'nothing',8.8,'starter');

/*Table structure for table `dishes_ingredients` */

DROP TABLE IF EXISTS `dishes_ingredients`;

CREATE TABLE `dishes_ingredients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_of_dishes` int(11) NOT NULL,
  `name_of_ingredient` varchar(20) CHARACTER SET latin1 NOT NULL,
  `quantity` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_of_dishes` (`id_of_dishes`),
  KEY `name_of_ingredient` (`name_of_ingredient`),
  CONSTRAINT `dishes_ingredients_ibfk_1` FOREIGN KEY (`id_of_dishes`) REFERENCES `dishes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dishes_ingredients_ibfk_3` FOREIGN KEY (`name_of_ingredient`) REFERENCES `ingredients` (`name_of_ingredient`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `dishes_ingredients` */

insert  into `dishes_ingredients`(`id`,`id_of_dishes`,`name_of_ingredient`,`quantity`) values (1,1,'ham',2),(2,1,'corn',2),(3,1,'peperoni',2),(4,4,'eggs',1),(5,4,'milk',1),(6,4,'potatoes',2),(7,6,'tomatoes',2),(8,6,'lettuce',1),(9,5,'ham',1),(10,5,'bacon',1),(11,5,'sour cream',1),(12,7,'chicken',1),(13,8,'croutons',3),(14,8,'dips',2),(16,9,'rice',1),(17,9,'cheese',1),(18,9,'tomatoes',1),(19,10,'cheese',1),(20,11,'cheese',1),(21,12,'cheese',1);

/*Table structure for table `drinks` */

DROP TABLE IF EXISTS `drinks`;

CREATE TABLE `drinks` (
  `name` enum('beer','wine','water','soft drinks','juice') CHARACTER SET latin1 NOT NULL,
  `quantity` int(5) NOT NULL,
  `limit_of_drinks` int(5) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `drinks` */

insert  into `drinks`(`name`,`quantity`,`limit_of_drinks`,`price`) values ('beer',188,100,3.5),('water',395,140,1.5),('soft drinks',290,130,1.3),('juice',292,75,1.1);

/*Table structure for table `duty` */

DROP TABLE IF EXISTS `duty`;

CREATE TABLE `duty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_employee` int(11) NOT NULL,
  `date` date NOT NULL,
  `type_duty` enum('DAY','NIGHT') CHARACTER SET latin1 NOT NULL,
  `speciality` varchar(15) CHARACTER SET utf16 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_employee` (`id_employee`),
  CONSTRAINT `duty_ibfk_1` FOREIGN KEY (`id_employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8;

/*Data for the table `duty` */

insert  into `duty`(`id`,`id_employee`,`date`,`type_duty`,`speciality`) values (1,21,'2015-07-01','DAY',''),(2,20,'2015-07-01','DAY',''),(3,19,'2015-07-01','NIGHT',''),(4,18,'2015-07-01','NIGHT',''),(5,17,'2015-07-02','DAY',''),(6,16,'2015-07-02','DAY',''),(7,15,'2015-07-02','NIGHT',''),(8,14,'2015-07-02','NIGHT',''),(9,22,'2015-07-01','DAY',''),(10,23,'2015-07-01','DAY',''),(11,24,'2015-07-01','DAY',''),(12,1,'2015-07-01','NIGHT',''),(13,2,'2015-07-01','NIGHT',''),(14,3,'2015-07-01','NIGHT',''),(15,5,'2015-07-02','DAY',''),(16,4,'2015-07-02','DAY',''),(17,22,'2015-07-02','DAY',''),(18,1,'2015-07-02','NIGHT',''),(19,3,'2015-07-02','NIGHT',''),(20,23,'2015-07-02','NIGHT',''),(21,9,'2015-07-01','DAY',''),(22,10,'2015-07-01','DAY',''),(23,11,'2015-07-01','NIGHT',''),(24,12,'2015-07-01','NIGHT',''),(25,13,'2015-07-02','DAY',''),(26,10,'2015-07-02','DAY',''),(27,11,'2015-07-02','NIGHT',''),(28,12,'2015-07-02','NIGHT',''),(29,35,'2015-07-01','DAY',''),(37,36,'2015-07-01','NIGHT',''),(38,37,'2015-07-02','DAY',''),(39,35,'2015-07-02','NIGHT',''),(40,36,'2015-07-03','DAY',''),(41,37,'2015-07-03','NIGHT',''),(42,35,'2015-07-04','DAY',''),(43,36,'2015-07-04','NIGHT',''),(44,37,'2015-07-05','DAY',''),(45,36,'2015-07-05','NIGHT',''),(46,35,'2015-07-06','DAY',''),(47,37,'2015-07-06','NIGHT',''),(48,36,'2015-07-07','DAY',''),(49,37,'2015-07-07','NIGHT',''),(50,35,'2015-07-08','DAY',''),(51,37,'2015-07-08','NIGHT',''),(53,36,'2015-07-09','DAY',''),(54,35,'2015-07-09','NIGHT',''),(55,27,'2015-07-01','DAY',''),(56,28,'2015-07-01','NIGHT',''),(57,29,'2015-07-02','DAY',''),(58,27,'2015-07-02','NIGHT',''),(59,28,'2015-07-03','DAY',''),(60,29,'2015-07-03','NIGHT',''),(61,27,'2015-07-04','DAY',''),(62,28,'2015-07-04','NIGHT',''),(63,29,'2015-07-05','DAY',''),(64,27,'2015-07-05','NIGHT',''),(65,28,'2015-07-06','DAY',''),(66,29,'2015-07-06','NIGHT',''),(67,27,'2015-07-07','DAY',''),(68,28,'2015-07-07','NIGHT',''),(69,29,'2015-07-08','DAY',''),(70,27,'2015-07-08','NIGHT',''),(71,28,'2015-07-09','DAY',''),(72,29,'2015-07-09','NIGHT',''),(73,26,'2015-07-01','DAY',''),(74,8,'2015-07-01','NIGHT',''),(75,7,'2015-07-02','DAY',''),(76,6,'2015-07-02','NIGHT',''),(77,25,'2015-07-03','DAY',''),(79,26,'2015-07-03','NIGHT',''),(80,8,'2015-07-04','DAY',''),(81,7,'2015-07-04','NIGHT',''),(82,6,'2015-07-05','DAY',''),(83,25,'2015-07-05','NIGHT',''),(84,26,'2015-07-06','DAY',''),(85,7,'2015-07-06','NIGHT',''),(86,8,'2015-07-07','DAY',''),(87,25,'2015-07-07','NIGHT',''),(88,6,'2015-07-08','DAY',''),(89,8,'2015-07-08','NIGHT',''),(90,6,'2015-07-09','DAY',''),(91,26,'2015-07-09','NIGHT',''),(92,30,'2015-07-01','DAY',''),(93,31,'2015-07-01','DAY',''),(94,32,'2015-07-01','NIGHT',''),(95,33,'2015-07-01','NIGHT',''),(96,34,'2015-07-02','DAY',''),(97,30,'2015-07-02','DAY',''),(98,31,'2015-07-02','NIGHT',''),(99,32,'2015-07-02','NIGHT',''),(100,33,'2015-07-03','DAY',''),(101,34,'2015-07-03','DAY',''),(102,30,'2015-07-03','NIGHT',''),(103,31,'2015-07-03','NIGHT',''),(104,32,'2015-07-04','DAY',''),(105,33,'2015-07-04','DAY',''),(106,34,'2015-07-04','NIGHT',''),(107,30,'2015-07-04','NIGHT',''),(108,31,'2015-07-05','DAY',''),(109,32,'2015-07-05','DAY',''),(110,34,'2015-07-05','NIGHT',''),(111,30,'2015-07-05','NIGHT',''),(112,31,'2015-07-06','DAY',''),(113,32,'2015-07-06','DAY',''),(114,33,'2015-07-06','NIGHT',''),(115,34,'2015-07-06','NIGHT',''),(116,30,'2015-07-07','DAY',''),(117,31,'2015-07-07','DAY',''),(118,32,'2015-07-07','NIGHT',''),(119,33,'2015-07-07','NIGHT',''),(120,34,'2015-07-08','DAY',''),(121,30,'2015-07-08','DAY',''),(122,31,'2015-07-08','NIGHT',''),(123,32,'2015-07-08','NIGHT',''),(124,33,'2015-07-09','DAY',''),(125,34,'2015-07-09','DAY',''),(126,30,'2015-07-09','NIGHT',''),(127,32,'2015-07-09','NIGHT',''),(128,14,'2015-07-03','DAY',''),(129,15,'2015-07-03','DAY',''),(130,19,'2015-07-03','NIGHT',''),(131,18,'2015-07-03','NIGHT',''),(132,20,'2015-07-04','DAY',''),(133,21,'2015-07-04','DAY',''),(134,17,'2015-07-04','NIGHT',''),(135,16,'2015-07-04','NIGHT',''),(136,17,'2015-07-05','DAY',''),(137,16,'2015-07-05','DAY',''),(138,21,'2015-07-05','NIGHT',''),(139,20,'2015-07-05','NIGHT',''),(140,14,'2015-07-06','DAY',''),(141,15,'2015-07-06','DAY',''),(142,16,'2015-07-06','NIGHT',''),(143,17,'2015-07-06','NIGHT',''),(144,18,'2015-07-07','DAY',''),(145,19,'2015-07-07','DAY',''),(146,21,'2015-07-07','NIGHT',''),(147,20,'2015-07-07','NIGHT',''),(148,16,'2015-07-08','DAY',''),(149,17,'2015-07-08','DAY',''),(150,15,'2015-07-08','NIGHT',''),(151,14,'2015-07-08','NIGHT',''),(152,18,'2015-07-09','DAY',''),(153,19,'2015-07-09','DAY',''),(154,20,'2015-07-09','NIGHT',''),(155,21,'2015-07-09','NIGHT',''),(156,22,'2015-07-03','DAY',''),(157,2,'2015-07-03','DAY',''),(158,1,'2015-07-03','DAY',''),(159,3,'2015-07-03','NIGHT',''),(160,4,'2015-07-03','NIGHT',''),(161,5,'2015-07-03','NIGHT',''),(162,24,'2015-07-04','DAY',''),(163,23,'2015-07-04','DAY',''),(164,2,'2015-07-04','DAY',''),(165,1,'2015-07-04','NIGHT',''),(166,5,'2015-07-04','NIGHT',''),(167,4,'2015-07-04','NIGHT',''),(168,3,'2015-07-05','DAY',''),(169,4,'2015-07-05','DAY',''),(170,5,'2015-07-05','DAY',''),(171,1,'2015-07-05','NIGHT',''),(172,2,'2015-07-05','NIGHT',''),(173,22,'2015-07-05','NIGHT',''),(174,23,'2015-07-06','DAY',''),(175,24,'2015-07-06','DAY',''),(176,1,'2015-07-06','DAY',''),(177,5,'2015-07-06','NIGHT',''),(178,4,'2015-07-06','NIGHT',''),(179,3,'2015-07-06','NIGHT',''),(180,2,'2015-07-07','DAY',''),(181,1,'2015-07-07','DAY',''),(182,3,'2015-07-07','DAY',''),(183,22,'2015-07-07','NIGHT',''),(184,24,'2015-07-07','NIGHT',''),(185,4,'2015-07-07','NIGHT',''),(186,22,'2015-07-08','DAY',''),(187,23,'2015-07-08','DAY',''),(188,24,'2015-07-08','DAY',''),(189,1,'2015-07-08','NIGHT',''),(190,2,'2015-07-08','NIGHT',''),(191,3,'2015-07-08','NIGHT',''),(192,4,'2015-07-09','DAY',''),(193,5,'2015-07-09','DAY',''),(194,22,'2015-07-09','DAY',''),(195,23,'2015-07-09','NIGHT',''),(196,24,'2015-07-09','NIGHT',''),(197,1,'2015-07-09','NIGHT',''),(198,9,'2015-07-03','DAY',''),(199,10,'2015-07-03','DAY',''),(200,11,'2015-07-03','NIGHT',''),(201,12,'2015-07-03','NIGHT',''),(202,13,'2015-07-04','DAY',''),(203,9,'2015-07-04','DAY',''),(204,10,'2015-07-04','NIGHT',''),(205,11,'2015-07-04','NIGHT',''),(206,13,'2015-07-05','DAY',''),(207,12,'2015-07-05','DAY',''),(208,10,'2015-07-05','NIGHT',''),(209,9,'2015-07-05','NIGHT',''),(210,11,'2015-07-06','DAY',''),(211,13,'2015-07-06','DAY',''),(212,10,'2015-07-06','NIGHT',''),(213,12,'2015-07-06','NIGHT',''),(214,9,'2015-07-07','DAY',''),(216,10,'2015-07-07','DAY',''),(217,11,'2015-07-07','NIGHT',''),(218,12,'2015-07-07','NIGHT',''),(219,13,'2015-07-08','DAY',''),(220,9,'2015-07-08','DAY',''),(221,10,'2015-07-08','NIGHT',''),(222,11,'2015-07-08','NIGHT',''),(223,12,'2015-07-09','DAY',''),(224,13,'2015-07-09','DAY',''),(225,9,'2015-07-09','NIGHT',''),(226,10,'2015-07-09','NIGHT','');

/*Table structure for table `employees` */

DROP TABLE IF EXISTS `employees`;

CREATE TABLE `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET latin1 NOT NULL,
  `surname` varchar(40) CHARACTER SET latin1 NOT NULL,
  `speciality` varchar(15) CHARACTER SET latin1 NOT NULL,
  `years_of_service` int(5) NOT NULL,
  `hire_date` date NOT NULL,
  `hourly_pay` float NOT NULL,
  `cv` text CHARACTER SET latin1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

/*Data for the table `employees` */

insert  into `employees`(`id`,`name`,`surname`,`speciality`,`years_of_service`,`hire_date`,`hourly_pay`,`cv`) values (1,'Maria','Andreou','Magiras',5,'2014-12-01',7,NULL),(2,'Kwstas','Antoniou','Magiras',3,'2014-10-22',6,NULL),(3,'Andreas','Lysandrou','Magiras',1,'2013-10-16',5,NULL),(4,'Giorgos','Lytras','Magiras',0,'2015-02-11',4,NULL),(5,'Marios','Sarras','Magiras',8,'2015-03-17',9,NULL),(6,'Panagiotis','Panagiotou','Ypeuthinos',7,'2014-09-18',8,NULL),(7,'Athina','Nikolaou','Ypeuthinos',6,'2014-05-13',8,NULL),(8,'Nikoleta','Argyrou','Ypeuthinos',4,'2014-06-01',6,NULL),(9,'Anna','Douka','Katharistis',2,'2014-07-08',6,NULL),(10,'Antonis','Papagianni','Katharistis',8,'2013-12-17',7,NULL),(11,'Andreas','Kyriakou','Katharistis',7,'2014-10-14',7,NULL),(12,'Irini','Karantoni','Katharistis',6,'2015-01-29',7,NULL),(13,'Giannis','Artemiou','Katharistis',3,'2015-03-04',6,NULL),(14,'Diamantis','Argyrou','Servitoros',1,'2015-06-09',6,NULL),(15,'Katerina','Nikolaou','Servitoros',1,'2015-07-07',6,NULL),(16,'Rafaela','Hrakleous','Servitoros',9,'2015-08-04',9,NULL),(17,'Theodoros','Konstantinou','Servitoros',3,'2015-01-26',6,NULL),(18,'Magdalini','Andreou','Servitoros',7,'2015-05-18',8,NULL),(19,'Argyris','Papanikolaou','Servitoros',5,'2014-01-28',7,NULL),(20,'Konstantina','Spiropoulou','Servitoros',3,'2014-06-25',6,NULL),(21,'Alexis','Alexiou','Servitoros',1,'2014-02-27',6,NULL),(22,'Maria','Konstantinou','Magiras',1,'2015-07-21',5,NULL),(23,'Antonia','Panagiotou','Magiras',1,'2014-10-24',5,NULL),(24,'Savvas','Swtiriou','Magiras',0,'2014-10-15',5,NULL),(25,'Antonis','Dimitriou','Ypeuthinos',3,'2014-09-01',6,NULL),(26,'Dimitris','Stylianou','Ypeuthinos',10,'2015-07-03',10,NULL),(27,'Alexandros','Papandreou','Tilefwnitis',2,'2015-06-09',6,NULL),(28,'Nikiforos','Papamichael','Tilefwnitis',2,'2014-09-09',6,NULL),(29,'Angelos','Makridis','Tilefwnitis',3,'2015-06-02',6,NULL),(30,'Christos','Gewrgiou','Paraggelies',7,'2014-11-20',7,NULL),(31,'Christiana','Iakovidi','Paraggelies',6,'2014-11-27',7,NULL),(32,'Kyriaki','Vasiliou','Paraggelies',5,'2014-05-13',7,NULL),(33,'Loukia','Gewrgiou','Paraggelies',1,'2015-05-20',6,NULL),(34,'Nikolas','Efthimiou','Paraggelies',3,'2014-04-25',6,NULL),(35,'Tasos','Varnava','Tamio',3,'2014-10-29',6,NULL),(36,'Stephanos','Andreou','Tamio',1,'2014-03-27',6,NULL),(37,'Stephani','Kyriakou','Tamio',2,'2014-02-26',0,NULL),(38,'dffss','fddd','fdd',5,'0000-00-00',6,NULL),(39,'Glafkos','Nikolaou','Magiras',5,'0000-00-00',5,NULL),(40,'ffff','Nikolaou','Magiras',5,'0000-00-00',5,NULL),(41,'Hello','Nikolaou','Magiras',5,'0000-00-00',5,NULL);

/*Table structure for table `ingredients` */

DROP TABLE IF EXISTS `ingredients`;

CREATE TABLE `ingredients` (
  `name_of_ingredient` varchar(20) CHARACTER SET latin1 NOT NULL,
  `quantity` int(5) NOT NULL,
  `availability_limit` int(5) NOT NULL,
  `price` float(3,2) NOT NULL,
  PRIMARY KEY (`name_of_ingredient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ingredients` */

insert  into `ingredients`(`name_of_ingredient`,`quantity`,`availability_limit`,`price`) values ('bacon',346,35,0.70),('cheese',199,30,0.90),('chicken',185,40,3.00),('corn',196,30,0.70),('croutons',196,30,0.60),('dips',345,60,2.00),('eggs',186,30,0.65),('fish',145,25,4.00),('ham',335,35,0.80),('lettuce',208,30,0.40),('milk',241,30,0.70),('penne',300,50,2.00),('peperoni',198,30,0.80),('pork',200,30,0.55),('potatoes',283,50,0.65),('rice',200,20,0.80),('sour cream',196,30,2.00),('spaghetti',297,50,2.00),('tomatoes',232,30,0.65),('trikolore',300,50,2.00);

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `order_id` int(5) NOT NULL AUTO_INCREMENT,
  `table_number` int(11) NOT NULL,
  `card_id` int(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `people` int(3) NOT NULL DEFAULT '0',
  `status` varchar(10) CHARACTER SET utf16 NOT NULL DEFAULT 'uncomplete',
  `bill` float NOT NULL DEFAULT '0',
  `waiter_id` int(11) NOT NULL DEFAULT '14',
  `dishes_status` varchar(10) NOT NULL DEFAULT 'uncomplete',
  PRIMARY KEY (`order_id`),
  KEY `table_number` (`table_number`),
  KEY `card_id` (`card_id`),
  KEY `waiter_id` (`waiter_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`card_id`) REFERENCES `customers` (`id_bonus_card`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`table_number`) REFERENCES `tables` (`number_of_table`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`waiter_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`order_id`,`table_number`,`card_id`,`date`,`people`,`status`,`bill`,`waiter_id`,`dishes_status`) values (32,5,126,'2015-08-28 09:20:34',4,'complete',29.35,14,'complete'),(33,7,123,'2015-08-28 09:20:40',6,'complete',29.4,14,'complete'),(34,12,126,'2015-08-28 09:20:42',8,'complete',9.9,14,'complete'),(35,6,127,'2015-08-28 09:20:45',6,'complete',11.35,14,'complete'),(36,9,125,'2015-08-28 09:20:47',4,'complete',120.8,14,'complete'),(37,11,NULL,'2015-08-28 09:20:50',6,'complete',20.2,14,'complete'),(38,10,124,'2015-08-28 09:20:53',4,'complete',11,14,'complete'),(54,9,NULL,'2015-08-28 09:20:55',0,'complete',11.4,14,'complete'),(59,12,132,'2015-08-28 09:21:02',0,'complete',11.4,14,'complete'),(61,12,132,'2015-08-28 09:21:04',0,'complete',47.65,14,'complete'),(68,12,132,'2015-08-28 09:21:07',0,'complete',182.5,14,'complete'),(69,11,124,'2015-08-28 09:21:09',0,'complete',15.2,14,'complete'),(72,7,143,'2015-08-24 12:28:11',5,'complete',24.9,15,'complete'),(73,7,143,'2015-08-28 09:24:19',5,'complete',25.3,14,'complete'),(77,4,NULL,'2015-08-28 09:24:26',4,'complete',10.95,14,'complete'),(80,5,NULL,'2015-08-28 09:24:32',5,'complete',13.9,14,'complete'),(83,1,NULL,'2015-08-28 09:24:38',3,'complete',28.4,14,'complete'),(87,12,132,'2015-08-28 09:24:45',5,'complete',13.9,14,'complete'),(88,1,132,'2015-08-28 09:34:17',5,'complete',11.8,14,'complete'),(89,2,126,'2015-08-28 09:34:24',4,'complete',13.75,14,'complete'),(90,3,125,'2015-08-28 09:34:31',3,'complete',26.05,14,'complete'),(91,4,132,'2015-08-28 09:37:05',3,'complete',15.5,21,'complete'),(92,8,125,'2015-08-28 09:37:12',6,'complete',10.6,21,'complete'),(93,6,124,'2015-08-28 09:37:19',2,'complete',30.6,21,'complete'),(94,10,132,'2015-08-28 09:43:43',5,'complete',46.95,20,'complete'),(95,2,124,'2015-08-28 09:43:51',5,'complete',17.65,20,'complete'),(96,1,132,'2015-08-28 09:43:59',2,'complete',30.4,20,'complete'),(97,3,132,'2015-08-28 09:44:05',5,'complete',31.95,20,'complete'),(98,12,132,'2015-08-28 09:44:11',5,'complete',11.8,20,'complete'),(99,1,132,'2015-08-28 09:44:48',5,'uncomplete',0,14,'uncomplete');

/*Table structure for table `table_service` */

DROP TABLE IF EXISTS `table_service`;

CREATE TABLE `table_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `waiter_id` int(11) NOT NULL,
  `table_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `waiter_id` (`waiter_id`),
  KEY `table_id` (`table_id`),
  CONSTRAINT `table_service_ibfk_1` FOREIGN KEY (`waiter_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `table_service_ibfk_2` FOREIGN KEY (`table_id`) REFERENCES `tables` (`number_of_table`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

/*Data for the table `table_service` */

insert  into `table_service`(`id`,`waiter_id`,`table_id`) values (1,14,1),(2,14,2),(4,14,3),(5,14,4),(6,14,5),(7,14,6),(8,15,7),(10,15,8),(11,15,9),(12,15,10),(14,15,11),(15,15,12),(16,16,1),(17,16,2),(18,16,3),(19,16,4),(20,16,5),(21,16,6),(22,17,7),(23,17,8),(24,17,9),(25,17,10),(26,17,11),(27,17,12),(28,18,1),(29,18,2),(30,18,3),(31,18,4),(32,18,5),(33,18,6),(34,19,7),(35,19,8),(36,19,9),(37,19,10),(38,19,11),(39,19,12),(40,20,1),(41,20,2),(42,20,3),(43,20,4),(44,20,5),(45,20,6),(46,21,7),(47,21,8),(48,21,9),(49,21,10),(50,21,11),(51,21,12);

/*Table structure for table `tables` */

DROP TABLE IF EXISTS `tables`;

CREATE TABLE `tables` (
  `number_of_table` int(11) NOT NULL,
  `description` enum('window','hall','garden','patio') CHARACTER SET latin1 DEFAULT NULL,
  `capacity_of_table` int(4) NOT NULL,
  PRIMARY KEY (`number_of_table`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tables` */

insert  into `tables`(`number_of_table`,`description`,`capacity_of_table`) values (1,'window',4),(2,'window',8),(3,'window',12),(4,'hall',4),(5,'hall',12),(6,'hall',8),(7,'garden',4),(8,'patio',4),(9,'patio',12),(10,'patio',8),(11,'patio',12),(12,'garden',4);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
