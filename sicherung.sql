-- MySQL dump 10.17  Distrib 10.3.20-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: baufuchs
-- ------------------------------------------------------
-- Server version	10.4.11-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `artikel`
--

DROP TABLE IF EXISTS `artikel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artikel` (
  `Artikel_Nr` int(4) NOT NULL,
  `Artikel_Name` varchar(25) NOT NULL,
  `Bestand` int(5) NOT NULL,
  `Preis` int(9) NOT NULL,
  `Lieferant_Nr` int(4) NOT NULL,
  `Bereich_Nr` int(1) NOT NULL,
  PRIMARY KEY (`Artikel_Nr`),
  KEY `Lieferant_Nr` (`Lieferant_Nr`),
  KEY `Bereich_Nr` (`Bereich_Nr`),
  CONSTRAINT `artikel_ibfk_1` FOREIGN KEY (`Lieferant_Nr`) REFERENCES `lieferant` (`Lieferant_Nr`),
  CONSTRAINT `artikel_ibfk_2` FOREIGN KEY (`Bereich_Nr`) REFERENCES `bereich` (`Bereich_Nr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artikel`
--

LOCK TABLES `artikel` WRITE;
/*!40000 ALTER TABLE `artikel` DISABLE KEYS */;
INSERT INTO `artikel` VALUES (1,'Hammer',500,23,1,1),(2,'Schraubendreher',500,3,2,1),(3,'Blumentopf',30,50,3,2),(4,'Wasserhahn',2,1,4,6);
/*!40000 ALTER TABLE `artikel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bereich`
--

DROP TABLE IF EXISTS `bereich`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bereich` (
  `Bereich_Nr` int(5) NOT NULL AUTO_INCREMENT,
  `Bereich_Name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Bereich_Nr`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bereich`
--

LOCK TABLES `bereich` WRITE;
/*!40000 ALTER TABLE `bereich` DISABLE KEYS */;
INSERT INTO `bereich` VALUES (1,'Bauen'),(2,'Garten und Freizeit'),(3,'Technik'),(4,'Wohnen'),(5,'Küche'),(6,'Bad');
/*!40000 ALTER TABLE `bereich` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filiale`
--

DROP TABLE IF EXISTS `filiale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filiale` (
  `Filial_Nr` int(4) NOT NULL AUTO_INCREMENT,
  `Region_Nr` int(4) DEFAULT NULL,
  `Leiter_Nr` int(4) DEFAULT NULL,
  `Straße` varchar(20) DEFAULT NULL,
  `Hausnummer` int(4) DEFAULT NULL,
  `Plz` int(5) DEFAULT NULL,
  `Ort` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Filial_Nr`),
  KEY `Region_Nr` (`Region_Nr`),
  KEY `Leiter_Nr` (`Leiter_Nr`),
  CONSTRAINT `filiale_ibfk_1` FOREIGN KEY (`Region_Nr`) REFERENCES `regionalgesellschaft` (`Region_Nr`),
  CONSTRAINT `filiale_ibfk_2` FOREIGN KEY (`Leiter_Nr`) REFERENCES `filialleiter` (`Leiter_Nr`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filiale`
--

LOCK TABLES `filiale` WRITE;
/*!40000 ALTER TABLE `filiale` DISABLE KEYS */;
INSERT INTO `filiale` VALUES (1,1,1,'Nordstraße',1,11111,'Nordnorden'),(2,2,2,'Oststraße',1,33333,'Ostosten'),(3,3,3,'Südstraße',1,99999,'Südsüden'),(4,4,4,'Weststraße',1,77777,'Westwesten');
/*!40000 ALTER TABLE `filiale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filialleiter`
--

DROP TABLE IF EXISTS `filialleiter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filialleiter` (
  `Leiter_Nr` int(4) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) DEFAULT NULL,
  `Vorname` varchar(20) DEFAULT NULL,
  `Filial_Nr` int(4) DEFAULT NULL,
  `Straße` varchar(20) DEFAULT NULL,
  `Hausnummer` int(4) DEFAULT NULL,
  `PLZ` int(5) DEFAULT NULL,
  `Ort` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Leiter_Nr`),
  KEY `Filial_Nr` (`Filial_Nr`),
  CONSTRAINT `filialleiter_ibfk_1` FOREIGN KEY (`Filial_Nr`) REFERENCES `filiale` (`Filial_Nr`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filialleiter`
--

LOCK TABLES `filialleiter` WRITE;
/*!40000 ALTER TABLE `filialleiter` DISABLE KEYS */;
INSERT INTO `filialleiter` VALUES (1,'Müller','Heinz',1,'Leiterstraße',1,55556,'Leiterstadt'),(2,'Meyer','Peter',2,'Leiterstraße',2,55556,'Leiterstadt'),(3,'Jensen','Jonas',3,'Leiterstraße',3,55556,'Leiterstadt'),(4,'Bergmann','Friedrich',4,'Literstraße',4,55556,'Leiterstadt');
/*!40000 ALTER TABLE `filialleiter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kunde`
--

DROP TABLE IF EXISTS `kunde`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kunde` (
  `Kunden_Nr` int(5) NOT NULL AUTO_INCREMENT,
  `RK_Nr` int(4) NOT NULL,
  `Nachname` varchar(15) DEFAULT NULL,
  `Vorname` varchar(15) DEFAULT NULL,
  `Straße` varchar(15) DEFAULT NULL,
  `HausNr` varchar(15) DEFAULT NULL,
  `PLZ` int(5) DEFAULT NULL,
  `Ort` varchar(20) NOT NULL,
  PRIMARY KEY (`Kunden_Nr`),
  KEY `RK_Nr` (`RK_Nr`),
  CONSTRAINT `kunde_ibfk_1` FOREIGN KEY (`RK_Nr`) REFERENCES `rabattkarte` (`RK_Nr`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kunde`
--

LOCK TABLES `kunde` WRITE;
/*!40000 ALTER TABLE `kunde` DISABLE KEYS */;
INSERT INTO `kunde` VALUES (1,0,'Nicht','Registriert',NULL,NULL,NULL,''),(2,1,'Wurst','Hans','Hanswurststraße','2',12345,'Wursthausen'),(3,2,'Dieter','Rolf','Lauchstraße','69',33567,'Netto'),(4,0,'Werner','Udo','Kümmelallee','32',76655,'Jungel');
/*!40000 ALTER TABLE `kunde` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lieferant`
--

DROP TABLE IF EXISTS `lieferant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lieferant` (
  `Lieferant_Nr` int(5) NOT NULL AUTO_INCREMENT,
  `Firma` varchar(15) DEFAULT NULL,
  `Straße` varchar(15) DEFAULT NULL,
  `Hausummer` int(3) DEFAULT NULL,
  `ORT` varchar(15) DEFAULT NULL,
  `PLZ` int(5) DEFAULT NULL,
  `Land` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Lieferant_Nr`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lieferant`
--

LOCK TABLES `lieferant` WRITE;
/*!40000 ALTER TABLE `lieferant` DISABLE KEYS */;
INSERT INTO `lieferant` VALUES (1,'Saftladen','Sandkamp',2,'Pilzkopf',87654,'Deutschland'),(2,'Handel GmbH','Nedderredder',22,'Ostende',21155,'Deutschland'),(3,'Baulieferant','Elitestraße',3,'Könighausen',26635,'Deutschland'),(4,'Wir Beschaffen!','Karl-Marx-Alee',1,'Bruchhausen',87559,'Deutschland');
/*!40000 ALTER TABLE `lieferant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mitarbeiter`
--

DROP TABLE IF EXISTS `mitarbeiter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mitarbeiter` (
  `Mitarbeiter_Nr` int(5) NOT NULL AUTO_INCREMENT,
  `Nachname` varchar(15) DEFAULT NULL,
  `Vorname` varchar(15) DEFAULT NULL,
  `Bereich_Nr` int(11) NOT NULL,
  `Filial_Nr` int(4) NOT NULL,
  `Straße` varchar(15) DEFAULT NULL,
  `HausNr` varchar(15) DEFAULT NULL,
  `PLZ` int(5) DEFAULT NULL,
  `Ort` varchar(20) NOT NULL,
  PRIMARY KEY (`Mitarbeiter_Nr`),
  KEY `Bereich_Nr` (`Bereich_Nr`),
  KEY `Filial_Nr` (`Filial_Nr`),
  CONSTRAINT `mitarbeiter_ibfk_1` FOREIGN KEY (`Bereich_Nr`) REFERENCES `bereich` (`Bereich_Nr`),
  CONSTRAINT `mitarbeiter_ibfk_2` FOREIGN KEY (`Filial_Nr`) REFERENCES `filiale` (`Filial_Nr`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mitarbeiter`
--

LOCK TABLES `mitarbeiter` WRITE;
/*!40000 ALTER TABLE `mitarbeiter` DISABLE KEYS */;
INSERT INTO `mitarbeiter` VALUES (1,'Scholz','Olaf',1,1,'Personalstraße','1',55555,'Personalstadt'),(2,'Kel','Mer',6,2,'Personalstraße','2',55555,'Personalstadt'),(3,'Holz','Kopf',1,3,'Personalstraße','3',55555,'Personalstadt'),(4,'Koch','Samuel',2,4,'Personalstraße','4',55555,'Personalstadt');
/*!40000 ALTER TABLE `mitarbeiter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rabattkarte`
--

DROP TABLE IF EXISTS `rabattkarte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rabattkarte` (
  `RK_Nr` int(5) NOT NULL,
  `Kunden_Nr` int(5) NOT NULL,
  `Umsatz_Jahr` int(11) NOT NULL,
  PRIMARY KEY (`RK_Nr`),
  KEY `Kunden_Nr` (`Kunden_Nr`),
  CONSTRAINT `rabattkarte_ibfk_1` FOREIGN KEY (`Kunden_Nr`) REFERENCES `kunde` (`Kunden_Nr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rabattkarte`
--

LOCK TABLES `rabattkarte` WRITE;
/*!40000 ALTER TABLE `rabattkarte` DISABLE KEYS */;
INSERT INTO `rabattkarte` VALUES (0,1,0),(1,2,800),(2,3,250);
/*!40000 ALTER TABLE `rabattkarte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rech_nrartikel_nr`
--

DROP TABLE IF EXISTS `rech_nrartikel_nr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rech_nrartikel_nr` (
  `Rech_Nr` int(20) NOT NULL,
  `Artikel_Nr` int(20) NOT NULL,
  `Menge` int(5) DEFAULT NULL,
  PRIMARY KEY (`Rech_Nr`,`Artikel_Nr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rech_nrartikel_nr`
--

LOCK TABLES `rech_nrartikel_nr` WRITE;
/*!40000 ALTER TABLE `rech_nrartikel_nr` DISABLE KEYS */;
INSERT INTO `rech_nrartikel_nr` VALUES (1,1,1),(1,2,1),(1,4,3),(2,2,2),(2,4,12);
/*!40000 ALTER TABLE `rech_nrartikel_nr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rechnung`
--

DROP TABLE IF EXISTS `rechnung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rechnung` (
  `Rech_Nr` int(5) NOT NULL AUTO_INCREMENT,
  `Kunden_Nr` int(15) DEFAULT NULL,
  `Datum` date DEFAULT NULL,
  `Betrag` int(50) NOT NULL,
  PRIMARY KEY (`Rech_Nr`),
  KEY `Kunden_Nr` (`Kunden_Nr`) USING BTREE,
  CONSTRAINT `rechnung_ibfk_1` FOREIGN KEY (`Kunden_Nr`) REFERENCES `kunde` (`Kunden_Nr`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rechnung`
--

LOCK TABLES `rechnung` WRITE;
/*!40000 ALTER TABLE `rechnung` DISABLE KEYS */;
INSERT INTO `rechnung` VALUES (1,4,'2018-08-12',59),(2,2,'2018-11-12',78);
/*!40000 ALTER TABLE `rechnung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regionalgesellschaft`
--

DROP TABLE IF EXISTS `regionalgesellschaft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regionalgesellschaft` (
  `Region_Nr` int(4) NOT NULL AUTO_INCREMENT,
  `Region` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`Region_Nr`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regionalgesellschaft`
--

LOCK TABLES `regionalgesellschaft` WRITE;
/*!40000 ALTER TABLE `regionalgesellschaft` DISABLE KEYS */;
INSERT INTO `regionalgesellschaft` VALUES (1,'Nord'),(2,'Ost'),(3,'Süd'),(4,'West');
/*!40000 ALTER TABLE `regionalgesellschaft` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-23 16:06:23
