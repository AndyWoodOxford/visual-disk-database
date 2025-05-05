-- MySQL dump 10.13  Distrib 8.0.15, for macos10.14 (x86_64)
--
-- Host: localhost    Database: disks
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `categories` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Film'),(2,'TV Series'),(3,'TV Adaptation'),(4,'Music'),(5,'Bonus Material');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disk_categories`
--

DROP TABLE IF EXISTS `disk_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `disk_categories` (
  `disk_id` smallint(5) unsigned NOT NULL,
  `category_id` tinyint(3) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disk_categories`
--

LOCK TABLES `disk_categories` WRITE;
/*!40000 ALTER TABLE `disk_categories` DISABLE KEYS */;
INSERT INTO `disk_categories` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,2),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,3),(29,3),(30,3),(31,1),(32,1),(33,1),(34,1),(35,1),(36,2),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1),(71,1),(72,1),(73,1),(74,1),(75,1),(76,1),(77,1),(78,1),(79,1),(80,1),(81,1),(82,1),(83,1),(84,1),(85,1),(86,1),(87,1),(88,1),(89,1),(90,1),(91,1),(92,1),(93,1),(94,1),(95,1),(96,1),(97,1),(98,1),(99,1),(100,1),(101,1),(102,1),(103,1),(104,1),(105,1),(106,1),(107,1),(108,1),(109,1),(110,2),(111,1),(112,1),(113,1),(114,1),(115,1),(116,1),(117,1),(118,1),(119,1),(120,1),(121,1),(122,1),(123,1),(124,1),(125,1),(126,1),(127,1),(128,2),(129,5),(130,1),(131,1),(132,1),(133,1),(134,1),(135,1),(136,4),(137,4),(138,4),(139,4),(140,4),(141,1),(142,1),(143,1),(144,2),(145,2),(146,2),(147,2),(148,1),(149,1),(150,1),(151,1),(152,1),(153,2),(154,2),(155,2),(156,2),(157,1),(158,1),(159,1),(160,1),(161,1),(162,1),(163,1),(164,1),(165,1),(166,1),(167,1),(168,1),(169,1),(170,1),(171,1),(172,1),(173,1),(174,1),(175,1),(176,1),(177,1),(178,1),(179,2),(180,1),(181,1),(182,1),(183,1),(184,1),(185,1),(186,2);
/*!40000 ALTER TABLE `disk_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disk_formats`
--

DROP TABLE IF EXISTS `disk_formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `disk_formats` (
  `disk_id` smallint(5) unsigned NOT NULL,
  `format_id` tinyint(3) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disk_formats`
--

LOCK TABLES `disk_formats` WRITE;
/*!40000 ALTER TABLE `disk_formats` DISABLE KEYS */;
INSERT INTO `disk_formats` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,2),(23,2),(24,2),(25,2),(26,2),(27,2),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,2),(48,1),(49,1),(50,3),(51,1),(52,1),(53,1),(54,2),(55,1),(56,2),(57,2),(58,2),(59,2),(60,2),(61,2),(62,2),(63,2),(64,2),(65,2),(66,2),(67,2),(68,2),(69,2),(70,2),(71,2),(72,2),(73,2),(74,2),(75,2),(76,2),(77,2),(78,2),(79,2),(80,3),(81,2),(82,2),(83,2),(84,3),(85,1),(86,1),(87,1),(88,1),(89,1),(90,1),(91,2),(92,2),(93,2),(94,1),(95,3),(96,3),(97,1),(98,1),(99,1),(100,2),(101,2),(102,2),(103,2),(104,2),(105,1),(106,1),(107,1),(108,1),(109,1),(110,1),(111,1),(112,1),(113,1),(114,1),(115,1),(116,1),(117,1),(118,1),(119,1),(120,1),(121,1),(122,1),(123,1),(124,1),(125,1),(126,1),(127,1),(128,3),(129,2),(130,1),(131,2),(132,2),(133,1),(134,3),(135,1),(136,1),(137,2),(138,2),(139,1),(140,2),(141,1),(142,1),(143,1),(144,1),(145,1),(146,1),(147,1),(148,1),(149,1),(150,1),(151,1),(152,1),(153,1),(154,1),(155,1),(156,1),(157,2),(158,2),(159,2),(160,1),(161,1),(162,1),(163,1),(164,1),(165,1),(166,2),(167,2),(168,3),(169,2),(170,1),(171,1),(172,1),(173,1),(174,1),(175,1),(176,1),(177,1),(178,2),(179,1),(180,1),(181,1),(182,1),(183,1),(184,1),(185,1),(186,1);
/*!40000 ALTER TABLE `disk_formats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disk_ratings`
--

DROP TABLE IF EXISTS `disk_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `disk_ratings` (
  `disk_id` smallint(5) unsigned NOT NULL,
  `rating_id` tinyint(3) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disk_ratings`
--

LOCK TABLES `disk_ratings` WRITE;
/*!40000 ALTER TABLE `disk_ratings` DISABLE KEYS */;
INSERT INTO `disk_ratings` VALUES (1,3),(2,9),(3,9),(4,9),(5,9),(6,9),(7,9),(8,9),(9,9),(10,9),(11,9),(12,9),(13,9),(14,9),(15,9),(16,9),(17,9),(18,9),(19,9),(20,9),(21,9),(22,9),(23,9),(24,9),(25,9),(26,9),(27,9),(28,9),(29,9),(30,9),(31,9),(32,9),(33,9),(34,9),(35,9),(36,9),(37,9),(38,9),(39,9),(40,9),(41,9),(42,9),(43,9),(44,9),(45,9),(46,9),(47,9),(48,9),(49,9),(50,9),(51,9),(52,9),(53,9),(54,9),(55,9),(56,9),(57,9),(58,9),(59,9),(60,9),(61,9),(62,9),(63,9),(64,9),(65,9),(66,9),(67,9),(68,9),(69,9),(70,9),(71,9),(72,9),(73,9),(74,9),(75,9),(76,9),(77,9),(78,9),(79,9),(80,5),(81,9),(82,9),(83,9),(84,5),(85,9),(86,9),(87,9),(88,9),(89,9),(90,9),(91,9),(92,9),(93,9),(94,9),(95,9),(96,9),(97,9),(98,9),(99,9),(100,9),(101,9),(102,9),(103,9),(104,9),(105,9),(106,9),(107,9),(108,9),(109,9),(110,9),(111,9),(112,9),(113,9),(114,9),(115,9),(116,9),(117,9),(118,9),(119,9),(120,9),(121,9),(122,9),(123,9),(124,9),(125,9),(126,9),(127,9),(128,3),(129,9),(130,9),(131,9),(132,9),(133,9),(134,9),(135,9),(136,9),(137,9),(138,9),(139,9),(140,9),(141,9),(142,9),(143,9),(144,9),(145,9),(146,9),(147,9),(148,3),(149,9),(150,9),(151,9),(152,9),(153,9),(154,9),(155,9),(156,9),(157,9),(158,9),(159,9),(160,9),(161,9),(162,9),(163,9),(164,9),(165,9),(166,9),(167,9),(168,9),(169,9),(170,9),(171,9),(172,9),(173,9),(174,9),(175,9),(176,9),(177,9),(178,9),(179,9),(180,9),(181,9),(182,9),(183,9),(184,9),(185,9),(186,9);
/*!40000 ALTER TABLE `disk_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disks`
--

DROP TABLE IF EXISTS `disks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `disks` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `sort_title` varchar(255) NOT NULL,
  `director` varchar(32) DEFAULT NULL,
  `year` year(4) DEFAULT NULL,
  `disk_count` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disks`
--

LOCK TABLES `disks` WRITE;
/*!40000 ALTER TABLE `disks` DISABLE KEYS */;
INSERT INTO `disks` VALUES (1,'Airplane!','Airplane','DIRECTOR',1980,1),(2,'Airplane II','Airplane II: The Sequel','DIRECTOR',1982,1),(3,'American Psycho','American Psycho','DIRECTOR',2000,1),(4,'Austin Powers: International Man of Mystery','Austin Powers - 1. International Man of Mystery','DIRECTOR',1997,1),(5,'Austin Powers: The Spy Who Shagged Me','Austin Powers - 2. The Spy Who Shagged Me','DIRECTOR',1999,1),(6,'Austin Powers in Goldmember','DIRECTOR','Austin Powers - 3. Goldmember',2002,1),(7,'Back to the Future','Back to the Future I','DIRECTOR',1985,1),(8,'Back to the Future II','Back to the Future II','DIRECTOR',1989,1),(9,'Back to the Future III','Back to the Future III','DIRECTOR',1990,1),(10,'Beavis and Butt-Head Do America','Beavis and Butt-Head Do America','DIRECTOR',1996,1),(11,'The Complete Blackadder','Blackadder Boxed Set (Series 1-4)','DIRECTOR',2001,4),(12,'The Bourne Identity','Bourne Identity','DIRECTOR',2002,1),(13,'The Bourne Supremacy','Bourne Supremacy','DIRECTOR',2004,1),(14,'The Bourne Ultimatum','Bourne Ultimatum','DIRECTOR',2007,1),(15,'Bridget Jones’s Diary','Bridget Jones’s Diary','DIRECTOR',2001,1),(16,'A Bug’s Life','Bug’s Life','DIRECTOR',1998,1),(17,'Chocolat','Chocolat','DIRECTOR',2000,1),(18,'A Clockwork Orange','Clockwork Orange','DIRECTOR',1971,1),(19,'Crouching Tiger, Hidden Dragon','Crouching Tiger, Hidden Dragon','DIRECTOR',2000,1),(20,'The Da Vinci Code','Da Vinci Code','DIRECTOR',2006,2),(21,'The Day After Tomorrow','Day After Tomorrow','DIRECTOR',2004,1),(22,'Die Hard - Die Hard','Die Hard 1','DIRECTOR',1988,1),(23,'Die Hard - Die Hard 2','Die Hard 2','DIRECTOR',1990,1),(24,'Die Hard 3','Die Hard - Die Hard with a Vengeance','DIRECTOR',1995,1),(25,'Die Hard - Die Hard 4.0','Die Hard 4','DIRECTOR',2007,1),(26,'Die Hard - A Good Day to Die Hard','Die Hard 5','DIRECTOR',2013,1),(27,'Die Hard - Decoding Die Hard (bonus disk)','Die Hard Bonus','DIRECTOR',2013,1),(28,'The Colour of Magic','Discworld: Colour of Magic','DIRECTOR',2008,1),(29,'Going Postal','Discworld: Going Postal','DIRECTOR',2010,1),(30,'Hogfather','Discworld: Hogfather','DIRECTOR',2006,1),(31,'Dune','Dune','DIRECTOR',1984,1),(32,'Evita','Evita','DIRECTOR',1996,1),(33,'Blue Harvest','Family Guy - Blue Harvest','DIRECTOR',2007,2),(34,'It\'s a Trap','Family Guy - It\'s a Trap','DIRECTOR',2010,2),(35,'Something Something Something Dark Side','Family Guy - Something Something Something Dark Side','DIRECTOR',2009,2),(36,'Father Ted - The Complete Box Set','Father Ted - The Complete Box Set','DIRECTOR',1999,5),(37,'Fight Club','Fight Club','DIRECTOR',1999,2),(38,'Finding Nino','Finding Nino','DIRECTOR',2003,2),(39,'Four Weddings and a Funeral','Four Weddings and a Funeral','DIRECTOR',1994,1),(40,'Gladiator','Gladiator','DIRECTOR',2000,2),(41,'Goodfellas','Goodfellas','DIRECTOR',1990,1),(42,'Hannibal','Hannibal','DIRECTOR',2001,1),(43,'Harry Potter and the Sorcerer\'s Stone','Harry Potter 1','DIRECTOR',2001,2),(44,'Harry Potter and the Chamber of Secrets','Harry Potter 2','DIRECTOR',2002,2),(45,'Harry Potter and the Prisoner of Azkaban','Harry Potter 3','DIRECTOR',2004,2),(46,'Harry Potter and the Goblet of Fire','Harry Potter 4','DIRECTOR',2005,2),(47,'Harry Potter and the Order of the Phoenix','Harry Potter 5','DIRECTOR',2007,1),(48,'Highlander','Highlander','DIRECTOR',1986,1),(49,'The Incredibles','Incredibles','DIRECTOR',2004,2),(50,'Independence Day','Independence Day','DIRECTOR',1996,1),(51,'Indiana Jones - Raiders of the Lost Ark','Indiana Jones 1','DIRECTOR',1981,1),(52,'Indiana Jones and the Temple of Doom','Indiana Jones 2','DIRECTOR',1984,1),(53,'Indiana Jones and the Last Crusade','Indiana Jones 3','DIRECTOR',1989,1),(54,'Indiana Jones and the Kingdom of the Crystal Skull','Indiana Jones 4','DIRECTOR',2008,2),(55,'Inglorious Basterds','Inglorious Basterds','DIRECTOR',2009,1),(56,'James Bond - Dr. No','James Bond 1','DIRECTOR',1962,1),(57,'James Bond - From Russia With Love','James Bond 2','DIRECTOR',1963,1),(58,'James Bond - Goldfinger','James Bond 3','DIRECTOR',1964,1),(59,'James Bond - Thunderball','James Bond 4','DIRECTOR',1965,1),(60,'James Bond - You Only Live Twice','James Bond 5','DIRECTOR',1967,1),(61,'James Bond - On Her Majesty\'s Secret Service','James Bond 6','DIRECTOR',1969,1),(62,'James Bond - Diamonds Are Forever','James Bond 7','DIRECTOR',1971,1),(63,'James Bond - Live and Let Die','James Bond 8','DIRECTOR',1973,1),(64,'James Bond - The Man with the Golden Gun','James Bond 9','DIRECTOR',1974,1),(65,'James Bond - The Spy Who Loved Me','James Bond 10','DIRECTOR',1977,1),(66,'James Bond - Moonraker','James Bond 11','DIRECTOR',1979,1),(67,'James Bond - For Your Eyes Only','James Bond 12','DIRECTOR',1981,1),(68,'James Bond - Octopussy','James Bond 13','DIRECTOR',1983,1),(69,'James Bond - A View to a Kill','James Bond 14','DIRECTOR',1985,1),(70,'James Bond - The Living Daylights','James Bond 15','DIRECTOR',1987,1),(71,'James Bond - Licence to Kill','James Bond 16','DIRECTOR',1989,1),(72,'James Bond - GoldenEye','James Bond 17','DIRECTOR',1995,1),(73,'James Bond - Tomorrow Never Dies','James Bond 18','DIRECTOR',1997,1),(74,'James Bond - The World is Not Enough','James Bond 19','DIRECTOR',1999,1),(75,'James Bond - Die Another Day','James Bond 20','DIRECTOR',2002,1),(76,'James Bond - Casino Royale','James Bond 21','DIRECTOR',2006,1),(77,'James Bond - Quantum of Solace','James Bond 22','DIRECTOR',2008,1),(78,'James Bond - Skyfall','James Bond 23','DIRECTOR',2012,1),(79,'James Bond - Spectre','James Bond 24','DIRECTOR',2015,1),(80,'James Bond - Never Say Never Again','Never Say Never Again','Irvin Kershner',1983,1),(81,'Jurassic Park','Jurassic Park 1','DIRECTOR',1993,1),(82,'The Lost World: Jurassic Park','Jurassic Park 2','DIRECTOR',1997,1),(83,'Jurassic Park III','Jurassic Park 3','DIRECTOR',2003,1),(84,'Jurassic World: Fallen Kingdom','Jurassic Park 5','J. A. Bayona',2018,2),(85,'Kill Bill: Volume 1','Kill Bill: Volume 1','DIRECTOR',2003,1),(86,'Kill Bill: Volume 2 ','Kill Bill: Volume 2','DIRECTOR',2004,1),(87,'King Kong','King Kong','DIRECTOR',2005,1),(88,'L.A. Confidential','L.A. Confidential','DIRECTOR',1997,1),(89,'Layer Cake','Layer Cake','DIRECTOR',2004,2),(90,'Lock, Stock and Two Smoking Barrels','Lock, Stock and Two Smoking Barrels','DIRECTOR',1998,1),(91,'The Lord of the Rings - The Fellowship of the Ring','Lord of the Rings 1','DIRECTOR',2001,5),(92,'The Lord of the Rings - The Two Towers','Lord of the Rings 2','DIRECTOR',2002,5),(93,'The Lord of the Rings - The Return of the King','Lord of the Rings 3','DIRECTOR',2003,5),(94,'The Man Who Would Be King','Man Who Would Be King','DIRECTOR',1975,1),(95,'The Martian','Martian','DIRECTOR',2015,1),(96,'The Matrix','DIRECTOR','Matrix 1',1999,3),(97,'The Matrix Reloaded','Matrix 2','DIRECTOR',2003,1),(98,'The Matrix Revolutions','Matrix 3','DIRECTOR',2003,1),(99,'Minority Report','Minority Report','DIRECTOR',2002,1),(100,'Mission: Impossible','Mission: Impossible 1','DIRECTOR',1996,1),(101,'Mission: Impossible 2','Mission: Impossible 2','DIRECTOR',2000,1),(102,'Mission: Impossible III','Mission: Impossible 3','DIRECTOR',2006,1),(103,'Mission: Impossible - Ghost Protocol','Mission: Impossible 4','DIRECTOR',2011,1),(104,'Mission: Impossible - Rogue Nation','Mission: Impossible 5','DIRECTOR',2015,1),(105,'Monsters, Inc.','Monsters, Inc.','DIRECTOR',2001,1),(106,'Monty Python and the Holy Grail','Monty Python and the Holy Grail','DIRECTOR',1975,1),(107,'Monty Python\'s Life of Brian','Monty Python\'s Life of Brian','DIRECTOR',1979,1),(108,'The Mummy','Mummy','DIRECTOR',1999,1),(109,'The Mummy Returns','Mummy Returns','DIRECTOR',2001,1),(110,'My Name is Earl - Season One','My Name is Earl - Season One','DIRECTOR',2006,4),(111,'Naked Gun - From the Files of Police Squad!','Naked Gun 1','DIRECTOR',1988,1),(112,'Naked Gun - The Smell of Fear','Naked Gun 2','DIRECTOR',1991,1),(113,'Naked Gun - The Final Insult','Naked Gun 3','DIRECTOR',1994,1),(114,'Nikita','Nikita','DIRECTOR',1990,1),(115,'Ocean’s Eleven','Ocean’s Eleven','DIRECTOR',2001,1),(116,'The Passion of the Christ','Passion of the Christ','DIRECTOR',2004,1),(117,'Performance','Performance','DIRECTOR',1970,1),(118,'Pink Panther - The Pink Panther','Pink Panther 1','DIRECTOR',1963,1),(119,'Pink Panther - A Shot in the Dark','Pink Panther 2','DIRECTOR',1964,1),(120,'Pink Panther - The Return of the Pink Panther','Pink Panther 3','DIRECTOR',1975,1),(121,'Pink Panther - The Pink Panther Strikes Again','Pink Panther 4','DIRECTOR',1976,1),(122,'Pink Panther - Revenge of the Pink Panther','Pink Panther 5','DIRECTOR',1978,1),(123,'Pink Panther - Trail of the Pink Panther','Pink Panther 6','DIRECTOR',1982,1),(124,'Pink Panther - Pink Panther Cartoon Collection','Pink Panther 7','DIRECTOR',2003,1),(125,'Pirates of the Caribbean - The Curse of the Black Pearl','Pirates of the Caribbean 1','DIRECTOR',2003,1),(126,'Pirates of the Caribbean - Dead Man\'s Chest','Pirates of the Caribbean 2','DIRECTOR',2006,1),(127,'Pirates of the Caribbean - At World\'s End','Pirates of the Caribbean 3','DIRECTOR',2007,1),(128,'Planet Earth II','Planet Earth II','N/A',2016,4),(129,'Pixar Short Films Collection Volume 1','Pixar Short Films Collection Volume 1','DIRECTOR',2007,1),(130,'Pulp Fiction','Pulp Fiction','DIRECTOR',1994,1),(131,'Ratatouille','Ratatouille','DIRECTOR',2007,1),(132,'Red Dragon','Red Dragon','DIRECTOR',2002,1),(133,'Reservoir Dogs','Reservoir Dogs','DIRECTOR',1992,1),(134,'The Revenant','Revenant','DIRECTOR',2015,1),(135,'The Rocky Horror Picture Show','Rocky Horror Picture Show','DIRECTOR',1975,1),(136,'The Best of Rod Stewart and the Faces','The Best of Rod Stewart and the Faces','DIRECTOR',2003,1),(137,'The Rolling Stones: Havana Moon','Rolling Stones - Havana Moon','DIRECTOR',2016,1),(138,'Ladies and Gentlemen: The Rolling Stones','Rolling Stones - Ladies & Gentlemen','DIRECTOR',1974,1),(139,'The Rolling Stones Rock and Roll Circus','Rolling Stones - Rock and Roll Circus','DIRECTOR',1996,1),(140,'Shine a Light','Rolling Stones - Shine a Light','DIRECTOR',2008,1),(141,'Secretary','Secretary','DIRECTOR',2002,1),(142,'Se7en','Se7en','DIRECTOR',1995,1),(143,'The Silence of the Lambs','Silence of the Lambs','DIRECTOR',1991,1),(144,'The Simpsons - The Complete Third Season','Simpsons - Season 3','DIRECTOR',2003,4),(145,'The Simpsons - The Complete Sixth Season','Simpsons - Season 6','DIRECTOR',2005,4),(146,'The Simpsons - The Complete Eighth Season','Simpsons - Season 8','DIRECTOR',2006,4),(147,'The Simpsons - The Complete Ninth Season','Simpsons - Season 9','DIRECTOR',2007,4),(148,'The Simpsons Movie','Simpsons Movie','DIRECTOR',2007,1),(149,'The Sixth Sense','Sixth Sense','DIRECTOR',1999,1),(150,'Sliding Doors','Sliding Doors','DIRECTOR',1998,1),(151,'Snatch','Snatch','DIRECTOR',2000,1),(152,'There\'s Something About Mary','Something About Mary','DIRECTOR',1998,1),(153,'South Park - Complete Series 1','South Park - Complete Series 1','DIRECTOR',1999,3),(154,'South Park - Complete Series 2','South Park - Complete Series 2','DIRECTOR',2001,4),(155,'South Park - Complete Series 3','South Park - Complete Series 3','DIRECTOR',2000,4),(156,'South Park - Complete Series 4','South Park - Complete Series 4','DIRECTOR',2001,4),(157,'Spider-Man','Spider-Man 1','DIRECTOR',2002,1),(158,'Spider-Man 2','Spider-Man 2','DIRECTOR',2004,1),(159,'Spider-Man 3','Spider-Man 3','DIRECTOR',2007,1),(160,'Star Wars - Episode I: The Phantom Menace','Star Wars 1','DIRECTOR',1999,1),(161,'Star Wars - Episode II: Attack of the Clones','Star Wars 2','DIRECTOR',2002,1),(162,'Star Wars - Episode III: Revenge of the Sith','Star Wars 3','DIRECTOR',2005,1),(163,'Star Wars - Episode IV - A New Hope','Star Wars 4','DIRECTOR',1977,1),(164,'Star Wars - Episode V: The Empire Strikes Back','Star Wars 5','DIRECTOR',1980,1),(165,'Star Wars - Episode VI: Return of the Jedi','Star Wars 6','DIRECTOR',1983,1),(166,'Star Wars - Episode VII: The Force Awakens','Star Wars 7','DIRECTOR',2015,1),(167,'Star Wars - Rogue One: A Star Wars Story','Star Wars 8','DIRECTOR',2016,1),(168,'Star Wars - Episode VIII - The Last Jedi','Star Wars 9','DIRECTOR',2018,1),(169,'Starship Troopers','Starship Troopers','DIRECTOR',1997,1),(170,'The Talented Mr Ripley','Talented Mr Ripley','DIRECTOR',1999,1),(171,'Taxi Driver','Taxi Driver','DIRECTOR',1976,1),(172,'Team America: World Police','Team America: World Police','DIRECTOR',2005,1),(173,'The Terminator','Terminator 1','DIRECTOR',1984,1),(174,'Terminator - Terminator 2: Judgement Day','Terminator 2','DIRECTOR',1991,1),(175,'Terminator - Terminator 3: Rise Of The Machines','Terminator 3','DIRECTOR',2003,1),(176,'Lara Croft: Tomb Raider','Tomb Riader 1','DIRECTOR',2001,1),(177,'Lara Croft: Tomb Raider - The Cradle Of Life','Tomb Riader 2','DIRECTOR',2003,1),(178,'Tommy','Tommy','DIRECTOR',1975,1),(179,'Top Gear - The Complete Specials Box Set','Top Gear - The Complete Specials Box Set','DIRECTOR',2015,13),(180,'Toy Story','Toy Story 1','DIRECTOR',1995,1),(181,'Toy Story 2','Toy Story 2','DIRECTOR',1999,1),(182,'Toy Story 3','Toy Story 3','DIRECTOR',2010,1),(183,'Trainspotting','Trainspotting','DIRECTOR',1996,1),(184,'The Usual Suspects','Usual Suspects','DIRECTOR',1995,1),(185,'Wallace & Gromit: Curse Of The Were Rabbit','Wallace & Gromit: Curse Of The Were Rabbit','DIRECTOR',2005,1),(186,'Wallace & Gromit: The Complete Collection','Wallace & Gromit: The Complete Collection','DIRECTOR',2009,1);
/*!40000 ALTER TABLE `disks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formats`
--

DROP TABLE IF EXISTS `formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `formats` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formats`
--

LOCK TABLES `formats` WRITE;
/*!40000 ALTER TABLE `formats` DISABLE KEYS */;
INSERT INTO `formats` VALUES (1,'DVD'),(2,'Blu-Ray'),(3,'UHD');
/*!40000 ALTER TABLE `formats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `notes` (
  `disk_id` smallint(5) unsigned NOT NULL,
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (89,'Disk is probably corrupted ... at the point of the plot twist!'),(80,'German edition (\"Sag Niemals Nie\") - with original English language option');
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ratings` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (1,'U'),(2,'Uc'),(3,'PG'),(4,'12A'),(5,'12'),(6,'15'),(7,'18'),(8,'R18'),(9,'TODO');
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-05 16:03:02
