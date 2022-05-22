-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sedena
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `academias`
--

DROP TABLE IF EXISTS `academias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_academia` varchar(45) NOT NULL,
  `jefe_academia` varchar(100) NOT NULL,
  `edificio` varchar(45) NOT NULL,
  `piso` int(11) NOT NULL,
  `fk_id_carrera` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_academia_UNIQUE` (`nombre_academia`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `academias_carrera_idx` (`fk_id_carrera`),
  CONSTRAINT `academias_carrera` FOREIGN KEY (`fk_id_carrera`) REFERENCES `carreras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academias`
--

LOCK TABLES `academias` WRITE;
/*!40000 ALTER TABLE `academias` DISABLE KEYS */;
INSERT INTO `academias` VALUES (1,'Eje ético','Luis Antonio Barba','academias',1,3),(2,'Eje militar','Juan Manuel Olivera','academias',2,3),(3,'Eje académico','Marco Antonio Pacheco','academias',3,3),(4,'Extracurriculares','Miguel Angel Arévalo','academias',4,3);
/*!40000 ALTER TABLE `academias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carreras`
--

DROP TABLE IF EXISTS `carreras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carreras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_carrera` varchar(45) NOT NULL,
  `jefe_carrera` varchar(100) NOT NULL,
  `duracion_normal_semestres` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `nombre_carrera_UNIQUE` (`nombre_carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carreras`
--

LOCK TABLES `carreras` WRITE;
/*!40000 ALTER TABLE `carreras` DISABLE KEYS */;
INSERT INTO `carreras` VALUES (1,'Ingeniero constructor','Andrés Melara Contreras',12),(2,'Ingeniero en comunicaciones y electrónica','Santiago Ibarra Pedroza',12),(3,'Ingeniero en computación e informática','Pedro Antonio Carrascosa',12),(4,'Ingeniero químico industrial','Gustavo Adolfo Murcia',12),(5,'Ingeniero mecánico industrial','Angela Maria Saez',12),(6,'Ingeniero electricista industrial','Jose Tomas Bejarano',12),(7,'Administración y evaluación de proyectos','Maria Alicia Cañete',2),(8,'Ingeniería de costos','Luis Alfonso Torralba',2),(9,'Sistemas de calidad','Manuel Francisco Hermida',2),(10,'Tecnologías de la información','Luis Angel Yañez',2),(11,'Ingeniería en telemática','Maria Estrella Peralta',2),(12,'Ingeniería automotriz','Francisco Jesus Valencia',2);
/*!40000 ALTER TABLE `carreras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datos_academicos_discente`
--

DROP TABLE IF EXISTS `datos_academicos_discente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datos_academicos_discente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carrera` varchar(45) NOT NULL,
  `promedio` float NOT NULL,
  `fk_id_relacion_unidades_aprendizaje` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `datos_academicos_relacion_unidades_aprendizaje_idx` (`fk_id_relacion_unidades_aprendizaje`),
  CONSTRAINT `datos_academicos_relacion_unidades_aprendizaje` FOREIGN KEY (`fk_id_relacion_unidades_aprendizaje`) REFERENCES `relacion_unidades_aprendizaje` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_academicos_discente`
--

LOCK TABLES `datos_academicos_discente` WRITE;
/*!40000 ALTER TABLE `datos_academicos_discente` DISABLE KEYS */;
/*!40000 ALTER TABLE `datos_academicos_discente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datos_deportivos_discente`
--

DROP TABLE IF EXISTS `datos_deportivos_discente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datos_deportivos_discente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `practica_deporte` varchar(2) NOT NULL,
  `deporte` varchar(45) DEFAULT NULL,
  `entrenador` varchar(100) DEFAULT NULL,
  `categoria` varchar(45) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `lugar` varchar(45) DEFAULT NULL,
  `horario` varchar(45) DEFAULT NULL,
  `asociacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_deportivos_discente`
--

LOCK TABLES `datos_deportivos_discente` WRITE;
/*!40000 ALTER TABLE `datos_deportivos_discente` DISABLE KEYS */;
INSERT INTO `datos_deportivos_discente` VALUES (1,'si','football','basketball','amateur','2019-09-10','campo de football','matutino','juvenil'),(2,'no',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'si','football','basketball','amateur','2019-09-10','campo de football','matutino','juvenil'),(4,'no',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'si','basketball','Jose Luis Fraga','amateur','2020-02-15','cancha de basketball','vespertino','juvenil'),(6,'no',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'si','basketball','Jose Luis Fraga','amateur','2020-02-15','cancha de basketball','vespertino','juvenil'),(8,'no',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'si','basketball','Jose Luis Fraga','amateur','2020-02-15','cancha de basketball','vespertino','juvenil'),(10,'no',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `datos_deportivos_discente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datos_medicos_discente`
--

DROP TABLE IF EXISTS `datos_medicos_discente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datos_medicos_discente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `peso` float NOT NULL,
  `estatura` float NOT NULL,
  `tipo_sangre` varchar(5) NOT NULL,
  `padece_enfermedad` varchar(2) NOT NULL,
  `descripcion_enfermedad` text,
  `problema_fiscio` varchar(2) NOT NULL,
  `descripcion_problema` text,
  `operacion_fisica` varchar(2) NOT NULL,
  `descripcion_operacion` text,
  `tatuajes` varchar(2) NOT NULL,
  `num_tatuajes` int(11) DEFAULT NULL,
  `pie_plano` varchar(2) NOT NULL,
  `lentes` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_medicos_discente`
--

LOCK TABLES `datos_medicos_discente` WRITE;
/*!40000 ALTER TABLE `datos_medicos_discente` DISABLE KEYS */;
INSERT INTO `datos_medicos_discente` VALUES (1,90,1.8,'O+','no',NULL,'no',NULL,'si','cornetes nasales','no',0,'no','si'),(2,80,1.75,'O+','no',NULL,'no',NULL,'no',NULL,'si',1,'no','no'),(3,85,1.73,'A+','no',NULL,'no',NULL,'no',NULL,'no',0,'no','no'),(4,75,1.81,'O-','no',NULL,'no',NULL,'no',NULL,'no',0,'no','si'),(5,88,1.9,'O+','no',NULL,'no',NULL,'no',NULL,'si',2,'no','no'),(6,80,1.75,'O+','no',NULL,'no',NULL,'no',NULL,'no',0,'no','no'),(7,69,1.7,'O+','no',NULL,'no',NULL,'no',NULL,'si',1,'no','si'),(8,95,1.95,'O+','no',NULL,'no',NULL,'no',NULL,'si',2,'no','no'),(9,78,1.82,'O+','no',NULL,'no',NULL,'no',NULL,'no',0,'no','no'),(10,83,1.84,'O+','no',NULL,'no',NULL,'no',NULL,'no',0,'no','no');
/*!40000 ALTER TABLE `datos_medicos_discente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datos_personales_discente`
--

DROP TABLE IF EXISTS `datos_personales_discente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datos_personales_discente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_discente` varchar(45) NOT NULL,
  `apellido_paterno_discente` varchar(45) NOT NULL,
  `apellido_materno_discente` varchar(45) NOT NULL,
  `grado_militar` varchar(45) NOT NULL,
  `plantel` varchar(45) NOT NULL,
  `CURP` varchar(45) NOT NULL,
  `RFC` varchar(45) NOT NULL,
  `cartilla_militar` varchar(45) NOT NULL,
  `pasaporte` varchar(45) NOT NULL,
  `sexo` varchar(10) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `nacionalidad` varchar(45) NOT NULL,
  `entidad_nacimiento` varchar(45) NOT NULL,
  `nombre_tutor` varchar(100) NOT NULL,
  `RFC_tutor` varchar(45) NOT NULL,
  `nombre_padre` varchar(100) NOT NULL,
  `nombre_madre` varchar(100) NOT NULL,
  `escuela_procedencia` varchar(100) NOT NULL,
  `tipo_escuela_procedencia` varchar(45) NOT NULL,
  `entidad_federativa_escuela` varchar(45) NOT NULL,
  `promedio_secundaria` float NOT NULL,
  `promedio_bachillerato` float NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_personales_discente`
--

LOCK TABLES `datos_personales_discente` WRITE;
/*!40000 ALTER TABLE `datos_personales_discente` DISABLE KEYS */;
INSERT INTO `datos_personales_discente` VALUES (1,'José Juan','López','Gutiérrez','cadete','plantel_aleatorio','curp_aleatorio','rfc_aleatorio','cartilla_aleatoria','pasaporte_aleatorio','Masculino','1998-12-15','mexicana','Ciudad de México','Manuel Jesus Marquez','rfc_aleatorio','Isidoro Kaur','Sara Maria Tena','C.E.C.yT. 9','físico matemático','Ciudad de México',9,10),(2,'Gustavo Ricardo','Vallejo','Suárez','oficial','plantel_aleatorio','curp_aleatorio','rfc_aleatorio','cartilla_aleatoria','pasaporte_aleatorio','Masculino','1998-12-15','mexicana','Ciudad de México','Maria Julia Calatayud','rfc_aleatorio','Pedro Miguel Silva','Arantxa Rebollo','C.E.C.yT. 9','físico matemático','Ciudad de México',10,9),(3,'Agustín','Carrillo','Aguilar','cadete','plantel_aleatorio','curp_aleatorio','rfc_aleatorio','cartilla_aleatoria','pasaporte_aleatorio','Masculino','1998-12-15','mexicana','Ciudad de México','Ricard Sevillano','rfc_aleatorio','Jeronimo Gallego','Angustias Ordoñez','C.E.C.yT. 9','físico matemático','Ciudad de México',9,10),(4,'Francisco Fernando','Escalante','Sánchez','oficial','plantel_aleatorio','curp_aleatorio','rfc_aleatorio','cartilla_aleatoria','pasaporte_aleatorio','Masculino','1998-12-15','mexicana','Ciudad de México','Jenifer Grau','rfc_aleatorio','Aimar Roldan','Rosalia Pons','C.E.C.yT. 9','físico matemático','Ciudad de México',10,9),(5,'José Marcelino','León','Santiago','cadete','plantel_aleatorio','curp_aleatorio','rfc_aleatorio','cartilla_aleatoria','pasaporte_aleatorio','Masculino','1998-12-15','mexicana','Ciudad de México','Gael Garrido','rfc_aleatorio','Josep Alcazar','Maria Amparo Collado','C.E.C.yT. 9','físico matemático','Ciudad de México',9,10),(6,'Pedro León','Álvarez','Alcacio','oficial','plantel_aleatorio','curp_aleatorio','rfc_aleatorio','cartilla_aleatoria','pasaporte_aleatorio','Masculino','1998-12-15','mexicana','Ciudad de México','Veronica De-Dios','rfc_aleatorio','Manuel Antonio Esteban','Laila Pinilla','C.E.C.yT. 9','físico matemático','Ciudad de México',10,9),(7,'Juan Manuel','Mozo','Spezia','cadete','plantel_aleatorio','curp_aleatorio','rfc_aleatorio','cartilla_aleatoria','pasaporte_aleatorio','Masculino','1998-12-15','mexicana','Ciudad de México','Jose Rafael Cervera','rfc_aleatorio','Joan Paniagua','Elisa Checa','C.E.C.yT. 9','físico matemático','Ciudad de México',9,10),(8,'Gilberto','García','Campante','oficial','plantel_aleatorio','curp_aleatorio','rfc_aleatorio','cartilla_aleatoria','pasaporte_aleatorio','Masculino','1998-12-15','mexicana','Ciudad de México','Montserrat Palacio','rfc_aleatorio','Ayman Vives','Maria Rosa Francisco','C.E.C.yT. 9','físico matemático','Ciudad de México',10,9),(9,'Raúl','Ayala','Arámbula','cadete','plantel_aleatorio','curp_aleatorio','rfc_aleatorio','cartilla_aleatoria','pasaporte_aleatorio','Masculino','1998-12-15','mexicana','Ciudad de México','Jose Tejero','rfc_aleatorio','Josep Alcantara','Herminia Ramon','C.E.C.yT. 9','físico matemático','Ciudad de México',9,10),(10,'Salvador','Aguirre','Cervantes','oficial','plantel_aleatorio','curp_aleatorio','rfc_aleatorio','cartilla_aleatoria','pasaporte_aleatorio','Masculino','1998-12-15','mexicana','Ciudad de México','Maria Nuria de Diego','rfc_aleatorio','Javier Luna','Socorro Cordero','C.E.C.yT. 9','físico matemático','Ciudad de México',10,9);
/*!40000 ALTER TABLE `datos_personales_discente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discentes`
--

DROP TABLE IF EXISTS `discentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discentes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matricula_discente` varchar(20) NOT NULL,
  `fk_id_datos_personales_discente` int(11) NOT NULL,
  `fk_id_datos_medicos_discente` int(11) NOT NULL,
  `fk_id_datos_deportivos_discente` int(11) NOT NULL,
  `fk_id_datos_academicos_discente` int(11) NOT NULL,
  `fk_id_domicilio` int(11) NOT NULL,
  `fk_id_horario_discente` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matricula_discente_UNIQUE` (`matricula_discente`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `discente_personales_idx` (`fk_id_datos_personales_discente`),
  KEY `discente_medicos_idx` (`fk_id_datos_medicos_discente`),
  KEY `discente_deportivos_idx` (`fk_id_datos_deportivos_discente`),
  KEY `discente_academicos_idx` (`fk_id_datos_academicos_discente`),
  KEY `discente_domicilio_idx` (`fk_id_domicilio`),
  KEY `discente_horario_idx` (`fk_id_horario_discente`),
  CONSTRAINT `discente_academicos` FOREIGN KEY (`fk_id_datos_academicos_discente`) REFERENCES `datos_academicos_discente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `discente_deportivos` FOREIGN KEY (`fk_id_datos_deportivos_discente`) REFERENCES `datos_deportivos_discente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `discente_domicilio` FOREIGN KEY (`fk_id_domicilio`) REFERENCES `domicilio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `discente_horario` FOREIGN KEY (`fk_id_horario_discente`) REFERENCES `horario_discente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `discente_medicos` FOREIGN KEY (`fk_id_datos_medicos_discente`) REFERENCES `datos_medicos_discente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `discente_personales` FOREIGN KEY (`fk_id_datos_personales_discente`) REFERENCES `datos_personales_discente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discentes`
--

LOCK TABLES `discentes` WRITE;
/*!40000 ALTER TABLE `discentes` DISABLE KEYS */;
/*!40000 ALTER TABLE `discentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discentes_doscentes`
--

DROP TABLE IF EXISTS `discentes_doscentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discentes_doscentes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_id_discente` int(11) NOT NULL,
  `fk_id_doscente` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `discente_doscente_idx` (`fk_id_discente`),
  KEY `doscente_discente_idx` (`fk_id_doscente`),
  CONSTRAINT `discente_doscente` FOREIGN KEY (`fk_id_discente`) REFERENCES `discentes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `doscente_discente` FOREIGN KEY (`fk_id_doscente`) REFERENCES `doscentes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discentes_doscentes`
--

LOCK TABLES `discentes_doscentes` WRITE;
/*!40000 ALTER TABLE `discentes_doscentes` DISABLE KEYS */;
/*!40000 ALTER TABLE `discentes_doscentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discentes_unidades_aprendizaje_todas`
--

DROP TABLE IF EXISTS `discentes_unidades_aprendizaje_todas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discentes_unidades_aprendizaje_todas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_id_discente` int(11) NOT NULL,
  `fk_id_unidades_aprendizaje_todas` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `discente_unidades_aprendizaje_todas_idx` (`fk_id_discente`),
  KEY `unidades_aprendizaje_todas_discente_idx` (`fk_id_unidades_aprendizaje_todas`),
  CONSTRAINT `discente_unidades_aprendizaje_todas` FOREIGN KEY (`fk_id_discente`) REFERENCES `discentes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `unidades_aprendizaje_todas_discente` FOREIGN KEY (`fk_id_unidades_aprendizaje_todas`) REFERENCES `unidades_aprendizaje_todas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discentes_unidades_aprendizaje_todas`
--

LOCK TABLES `discentes_unidades_aprendizaje_todas` WRITE;
/*!40000 ALTER TABLE `discentes_unidades_aprendizaje_todas` DISABLE KEYS */;
/*!40000 ALTER TABLE `discentes_unidades_aprendizaje_todas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domicilio`
--

DROP TABLE IF EXISTS `domicilio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `domicilio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calle` varchar(45) NOT NULL,
  `num_ext` int(11) NOT NULL,
  `num_int` int(11) DEFAULT NULL,
  `colonia` varchar(45) NOT NULL,
  `CP` varchar(5) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `deleg_munic` varchar(45) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `movil` varchar(15) NOT NULL,
  `telefono_oficina` varchar(15) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domicilio`
--

LOCK TABLES `domicilio` WRITE;
/*!40000 ALTER TABLE `domicilio` DISABLE KEYS */;
INSERT INTO `domicilio` VALUES (1,'José Sotero Castañeda',664,NULL,'Asturias','06890','Ciudad de México','Cuauhtémoc','5586847983','5589876889','5523515478','usuario1@gmail.com'),(2,'C. Sabino',343,NULL,'Atlampa','06450','Ciudad de México','Cuauhtémoc','5564741425','5542688779','5532244889','señor2@gmail.com'),(3,'Nte. 72',5418,NULL,'Bondojito','07850','Ciudad de México','Gustavo A. Madero','5587896425','5589876894','5589422756','piña65@gmail.com'),(4,'C. 1',182,NULL,'Santa Apolonia','02790','Ciudad de México','Gustavo A. Madero','5565545781','5521242526','5524477884','carro21@gmail.com'),(5,'Miguel Ángel',521,NULL,'San Juan','04850','Ciudad de México','Azcapotzalco','5521147884','5564588744','5589944745','botella65@gmail.com'),(6,'San José',2879,NULL,'Casas Alemán','08460','Ciudad de México','Azcapotzalco','5521147884','5564422113','5584899668','bocina14@gmail.com'),(7,'Héctor Fierro',968,NULL,'Nápoles','03240','Ciudad de México','Venustiano Carranza','5547788449','5565686261','5532343781','almohada5@gmail.com'),(8,'Pedro Alcaráz',657,NULL,'Granjas México','08480','Ciudad de México','Venustiano Carranza','5537383431','5556989476','5525545165','escritorio8@gmail.com'),(9,'Azafrán',117,NULL,'Juventino Rosas','02340','Ciudad de México','Iztacalco','5523644778','5584879888','5558497612','tennis6@gmail.com'),(10,'Calzada de las brujas',253,NULL,'Tres Fuentes','14390','Ciudad de México','Iztacalco','5598846875','5585512425','5587966435','caja4@gmail.com');
/*!40000 ALTER TABLE `domicilio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doscentes`
--

DROP TABLE IF EXISTS `doscentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doscentes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matricula_doscente` varchar(20) NOT NULL,
  `nombre_doscente` varchar(45) NOT NULL,
  `apellido_paterno_doscente` varchar(45) NOT NULL,
  `apellido_materno_doscente` varchar(45) NOT NULL,
  `especialidad` varchar(45) NOT NULL,
  `fk_id_academia` int(11) NOT NULL,
  `fk_id_carrera` int(11) NOT NULL,
  `fk_id_domicilio` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matricula_doscente_UNIQUE` (`matricula_doscente`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `doscente_academia_idx` (`fk_id_academia`),
  KEY `doscente_carrera_idx` (`fk_id_carrera`),
  KEY `doscente_domicilio_idx` (`fk_id_domicilio`),
  CONSTRAINT `doscente_academia` FOREIGN KEY (`fk_id_academia`) REFERENCES `academias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `doscente_carrera` FOREIGN KEY (`fk_id_carrera`) REFERENCES `carreras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `doscente_domicilio` FOREIGN KEY (`fk_id_domicilio`) REFERENCES `domicilio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doscentes`
--

LOCK TABLES `doscentes` WRITE;
/*!40000 ALTER TABLE `doscentes` DISABLE KEYS */;
INSERT INTO `doscentes` VALUES (1,'D-5354512','Miguel Ángel','Sánchez','Lamego','Ingeniería en sistemas computacionales',1,3,1),(2,'D-3146985','Genaro','Ambía','Pedraza','Ingeniería en sistemas computacionales',2,3,1),(3,'D-5487986','Francisco','Grajales','Godoy','Ingeniería en sistemas computacionales',3,3,1),(4,'D-3265988','Joaquín','Aspiroz','Viniegra','Ingeniería en sistemas computacionales',4,3,1),(5,'D-2154652','Carlos','Solís','Avedaño','Ingeniería en sistemas computacionales',1,3,1),(6,'D-6284953','Ignacio','González','Álvarez','Ingeniería en sistemas computacionales',2,3,1),(7,'D-1892658','Manuel','Vázquez','Barete','Ingeniería en sistemas computacionales',3,3,1),(8,'D-2365458','Rafael','Robles','Hurtado','Ingeniería en sistemas computacionales',4,3,1),(9,'D-5263148','Manuel ','Vázquez','Barete','Ingeniería en sistemas computacionales',1,3,1),(10,'D-9878546','Guillermo','Ruiz','Pérez','Ingeniería en sistemas computacionales',2,3,1),(11,'D-2684475','Rodolfo','Díaz','Santacruz','Ingeniería en sistemas computacionales',3,3,1),(12,'D-5487211','Guillermo','Ruiz','Pérez','Ingeniería en sistemas computacionales',4,3,1),(13,'D-6325859','Jacobo','Wittman','Rojano','Ingeniería en sistemas computacionales',1,3,1),(14,'D-5285965','Matías','González','González','Ingeniería en sistemas computacionales',2,3,1),(15,'D-5874859','David','Salas','Vázquez','Ingeniería en sistemas computacionales',3,3,1),(16,'D-3652412','Samuel M.','Jiménez','Migueles','Ingeniería en sistemas computacionales',4,3,1),(17,'D-2198325','Marco Antonio','Córdova','López','Ingeniería en sistemas computacionales',1,3,1),(18,'D-8732546','Armando','Cid','Nava','Ingeniería en sistemas computacionales',2,3,1),(19,'D-7425633','Pedro','Hirata','Vaquera','Ingeniería en sistemas computacionales',3,3,1),(20,'D-5269412','Jorge','Rueda','Bravo','Ingeniería en sistemas computacionales',4,3,1),(21,'D-3696581','Salvador','Aguirre','Cervantes','Ingeniería en sistemas computacionales',1,3,1),(22,'D-5258634','Raúl','Ayala','Arámbula','Ingeniería en sistemas computacionales',2,3,1),(23,'D-8339254','Gilberto','García','Campante','Ingeniería en sistemas computacionales',3,3,1),(24,'D-5825369','Juan Manuel','Mozo','Spezia','Ingeniería en sistemas computacionales',4,3,1),(25,'D-2354785','Pedro León','Álvarez','Alcacio','Ingeniería en sistemas computacionales',1,3,1),(26,'D-6543213','José Marcelino','León','Santiago','Ingeniería en sistemas computacionales',2,3,1),(27,'D-8493511','Francisco Fernando','Escalante','Sánchez','Ingeniería en sistemas computacionales',3,3,1),(28,'D-4865135','Agustín','Carrillo','Aguilar','Ingeniería en sistemas computacionales',4,3,1),(29,'D-6513515','Gustavo Ricardo','Vallejo','Suárez','Ingeniería en sistemas computacionales',1,3,1),(30,'D-3215556','José Juan','Barbizzan','Alonso','Ingeniería en sistemas computacionales',2,3,1),(31,'D-3216547','José Juan','López','Gutiérrez','Ingeniería en sistemas computacionales',3,3,1);
/*!40000 ALTER TABLE `doscentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doscentes_unidades_aprendizaje_todas`
--

DROP TABLE IF EXISTS `doscentes_unidades_aprendizaje_todas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doscentes_unidades_aprendizaje_todas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_id_doscente` int(11) NOT NULL,
  `fk_id_unidades_aprendizaje_todas` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `doscente_unidades_aprendizaje_todas_idx` (`fk_id_doscente`),
  KEY `unidades_aprendizaje_todas_doscente_idx` (`fk_id_unidades_aprendizaje_todas`),
  CONSTRAINT `doscente_unidades_aprendizaje_todas` FOREIGN KEY (`fk_id_doscente`) REFERENCES `doscentes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `unidades_aprendizaje_todas_doscente` FOREIGN KEY (`fk_id_unidades_aprendizaje_todas`) REFERENCES `unidades_aprendizaje_todas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doscentes_unidades_aprendizaje_todas`
--

LOCK TABLES `doscentes_unidades_aprendizaje_todas` WRITE;
/*!40000 ALTER TABLE `doscentes_unidades_aprendizaje_todas` DISABLE KEYS */;
/*!40000 ALTER TABLE `doscentes_unidades_aprendizaje_todas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario_discente`
--

DROP TABLE IF EXISTS `horario_discente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horario_discente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grupos` longtext NOT NULL,
  `fk_id_unidad_aprendizaje` int(11) NOT NULL,
  `fk_id_doscente` int(11) NOT NULL,
  `horario_semanal` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_horario_unidad_aprendizaje_idx` (`fk_id_unidad_aprendizaje`),
  KEY `fk_horario_doscente_idx` (`fk_id_doscente`),
  CONSTRAINT `fk_horario_doscente` FOREIGN KEY (`fk_id_doscente`) REFERENCES `doscentes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_horario_unidad_aprendizaje` FOREIGN KEY (`fk_id_unidad_aprendizaje`) REFERENCES `unidades_aprendizaje_todas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario_discente`
--

LOCK TABLES `horario_discente` WRITE;
/*!40000 ALTER TABLE `horario_discente` DISABLE KEYS */;
/*!40000 ALTER TABLE `horario_discente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacion_unidades_aprendizaje`
--

DROP TABLE IF EXISTS `relacion_unidades_aprendizaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relacion_unidades_aprendizaje` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_id_unidades_aprendizaje_reprobadas` int(11) NOT NULL,
  `fk_id_unidades_aprendizaje_aprobadas` int(11) NOT NULL,
  `fk_id_unidades_aprendizaje_no_cursadas` int(11) NOT NULL,
  `fk_id_unidades_aprendizaje_cursando` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reprobadas_idx` (`fk_id_unidades_aprendizaje_reprobadas`),
  KEY `aprobadas_idx` (`fk_id_unidades_aprendizaje_aprobadas`),
  KEY `no_cursadas_idx` (`fk_id_unidades_aprendizaje_no_cursadas`),
  KEY `cursando_idx` (`fk_id_unidades_aprendizaje_cursando`),
  CONSTRAINT `aprobadas` FOREIGN KEY (`fk_id_unidades_aprendizaje_aprobadas`) REFERENCES `unidades_aprendizaje_aprobadas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cursando` FOREIGN KEY (`fk_id_unidades_aprendizaje_cursando`) REFERENCES `unidades_aprendizaje_cursando` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `no_cursadas` FOREIGN KEY (`fk_id_unidades_aprendizaje_no_cursadas`) REFERENCES `unidades_aprendizaje_no_cursadas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reprobadas` FOREIGN KEY (`fk_id_unidades_aprendizaje_reprobadas`) REFERENCES `unidades_aprendizaje_reprobadas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacion_unidades_aprendizaje`
--

LOCK TABLES `relacion_unidades_aprendizaje` WRITE;
/*!40000 ALTER TABLE `relacion_unidades_aprendizaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `relacion_unidades_aprendizaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidades_aprendizaje_aprobadas`
--

DROP TABLE IF EXISTS `unidades_aprendizaje_aprobadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidades_aprendizaje_aprobadas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave_materia` varchar(5) NOT NULL,
  `nombre_materia` varchar(45) NOT NULL,
  `fecha` time NOT NULL,
  `forma_evaluacion` varchar(15) NOT NULL,
  `calificacion` float NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clave_materia_UNIQUE` (`clave_materia`),
  UNIQUE KEY `nombre_materia_UNIQUE` (`nombre_materia`),
  UNIQUE KEY `fecha_UNIQUE` (`fecha`),
  UNIQUE KEY `forma_evaluacion_UNIQUE` (`forma_evaluacion`),
  UNIQUE KEY `calificacion_UNIQUE` (`calificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidades_aprendizaje_aprobadas`
--

LOCK TABLES `unidades_aprendizaje_aprobadas` WRITE;
/*!40000 ALTER TABLE `unidades_aprendizaje_aprobadas` DISABLE KEYS */;
/*!40000 ALTER TABLE `unidades_aprendizaje_aprobadas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidades_aprendizaje_cursando`
--

DROP TABLE IF EXISTS `unidades_aprendizaje_cursando`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidades_aprendizaje_cursando` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave_materia` varchar(5) NOT NULL,
  `nombre_materia` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidades_aprendizaje_cursando`
--

LOCK TABLES `unidades_aprendizaje_cursando` WRITE;
/*!40000 ALTER TABLE `unidades_aprendizaje_cursando` DISABLE KEYS */;
/*!40000 ALTER TABLE `unidades_aprendizaje_cursando` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidades_aprendizaje_no_cursadas`
--

DROP TABLE IF EXISTS `unidades_aprendizaje_no_cursadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidades_aprendizaje_no_cursadas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave_materia` varchar(5) NOT NULL,
  `nombre_materia` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidades_aprendizaje_no_cursadas`
--

LOCK TABLES `unidades_aprendizaje_no_cursadas` WRITE;
/*!40000 ALTER TABLE `unidades_aprendizaje_no_cursadas` DISABLE KEYS */;
/*!40000 ALTER TABLE `unidades_aprendizaje_no_cursadas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidades_aprendizaje_reprobadas`
--

DROP TABLE IF EXISTS `unidades_aprendizaje_reprobadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidades_aprendizaje_reprobadas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave_materia` varchar(5) NOT NULL,
  `fecha` time NOT NULL,
  `calificacion` float NOT NULL,
  `nombre_materia` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidades_aprendizaje_reprobadas`
--

LOCK TABLES `unidades_aprendizaje_reprobadas` WRITE;
/*!40000 ALTER TABLE `unidades_aprendizaje_reprobadas` DISABLE KEYS */;
/*!40000 ALTER TABLE `unidades_aprendizaje_reprobadas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidades_aprendizaje_todas`
--

DROP TABLE IF EXISTS `unidades_aprendizaje_todas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidades_aprendizaje_todas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_materia` varchar(60) NOT NULL,
  `horas` int(11) NOT NULL,
  `semestre` int(11) NOT NULL,
  `creditos` float NOT NULL,
  `fk_id_carrera` int(11) NOT NULL,
  `fk_id_academia` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_materia_UNIQUE` (`nombre_materia`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `unidades_aprendizaje_todas_carrera_idx` (`fk_id_carrera`),
  KEY `unidades_aprendizaje_todas_academia_idx` (`fk_id_academia`),
  CONSTRAINT `unidades_aprendizaje_todas_academia` FOREIGN KEY (`fk_id_academia`) REFERENCES `academias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `unidades_aprendizaje_todas_carrera` FOREIGN KEY (`fk_id_carrera`) REFERENCES `carreras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidades_aprendizaje_todas`
--

LOCK TABLES `unidades_aprendizaje_todas` WRITE;
/*!40000 ALTER TABLE `unidades_aprendizaje_todas` DISABLE KEYS */;
INSERT INTO `unidades_aprendizaje_todas` VALUES (1,'ÉTICA MILITAR I',4,1,0.25,3,1),(2,'EDUCACIÓN FÍSICA I',46,1,2.88,3,2),(3,'LEGISLACIÓN MILITAR I',25,1,1.56,3,2),(4,'ADIESTRAMIENTO MIL. BASICO',341,1,21.31,3,2),(5,'ORDEN CERRADO DE INFANTERÍA I',34,1,2.13,3,4),(6,'HABLIDADES BASICA DEL COMBATIENTE',74,1,4.63,3,2),(7,'HISTORIA MILITAR DE MÉXICO I',35,1,2.18,3,2),(8,'OPERACIONES MILITARES I',40,1,2.5,3,2),(9,'ARMAMENTO MILITAR I',46,1,2.87,3,2),(10,'NAVEGACIÓN TERRESTRE I',43,1,2.7,3,2),(11,'EDUCACIÓN FÍSICA II',80,2,5,3,2),(12,'LEGISLACIÓN MILITAR II',16,2,1,3,2),(13,'HISTORIA MILITAR DE MÉXICO II',32,2,2,3,2),(14,'ARMAMENTO MILITAR II',32,2,2,3,2),(15,'EJERCICIOS MILITARES DE APLICACIÓN I',168,2,10.5,3,2),(16,'FÍSICA GENERAL',64,2,4,3,3),(17,'QUÍMICA GENERAL',48,2,3,3,3),(18,'MATEMÁTICAS BÁSICAS PARA INGENIERÍA',64,2,4,3,3),(19,'GEOMETRÍA ANALÍTICA',64,2,4,3,3),(20,'CÁLCULO DIFERENCIAL',64,2,4,3,3),(21,'TÉCNICAS DE APRENDIZAJE',32,2,2,3,3),(22,'EXPRESIÓN ORAL Y ESCRITA',48,2,3,3,3),(23,'IDIOMA EXTRANJERO I',80,2,5,3,4),(24,'ÉTICA MILITAR II',32,3,2,3,1),(25,'EDUCACIÓN FÍSICA III',80,3,5,3,2),(26,'LEGISLACIÓN MILITAR III',32,3,2,3,2),(27,'ORDEN CERRADO  DE INFANTERÍA II',32,3,2,3,4),(28,'TEMAS SELECTOS DE FÍSICA',64,3,4,3,3),(29,'MECÁNICA',64,3,4,3,3),(30,'ÁLGEBRA LINEAL',64,3,4,3,3),(31,'DIBUJO DE INGENIERÍA',80,3,5,3,3),(32,'CÁLCULO VECTORIAL I',64,3,4,3,3),(33,'CÁLCULO INTEGRAL',80,3,5,3,3),(34,'PROGRAMACIÓN',64,3,4,3,3),(35,'IDIOMA EXTRANJERO II',80,3,5,3,4),(36,'FILOSOFÍA',32,4,2,3,1),(37,'EDUCACIÓN FÍSICA IV',80,4,5,3,2),(38,'LEGISLACIÓN MILITAR IV',32,4,2,3,2),(39,'PROTECCIÓN CIVIL Y PLAN DN-III-E',48,4,3,3,2),(40,'EJERCICIOS MILITARES DE APLICACIÓN II',168,4,10.5,3,2),(41,'ELECTRICIDAD Y MAGNETISMO',64,4,4,3,3),(42,'PROBABILIDAD Y ESTADÍSTICA',64,4,4,3,3),(43,'ECUACIONES DIFERENCIALES',64,4,4,3,3),(44,'CÁLCULO VECTORIAL II',64,4,4,3,3),(45,'PROGRAMACIÓN AVANZADA',64,4,4,3,3),(46,'ORGANIZACIÓN DE COMPUTADORAS',64,4,4,3,3),(47,'IDIOMA EXTRANJERO III',80,4,5,3,4),(48,'ÉTICA MILITAR III',32,5,2,3,1),(49,'EDUCACIÓN FÍSICA V',80,5,5,3,2),(50,'ORDEN CERRADO DE INFANTERÍA III',32,5,2,3,4),(51,'ARMAMENTO MILITAR III',32,5,2,3,2),(52,'DESARROLLO HUMANO',32,5,2,3,3),(53,'MATEMÁTICAS AVANZADAS',48,5,3,3,3),(54,'SIMULACIÓN DE SISTEMAS',64,5,4,3,3),(55,'RECURSOS NATURALES Y NECESIDADES DE MÉXICO',48,5,3,3,3),(56,'MÉTODOS NUMÉRICOS',64,5,4,3,3),(57,'ESTRUCTURA DE DATOS',80,5,5,3,3),(58,'ARQUITECTURA DE COMPUTADORAS I',64,5,4,3,3),(59,'IDIOMA EXTRANJERO IV',80,5,5,3,4),(60,'EDUCACIÓN FÍSICA VI',80,6,5,3,2),(61,'ASPECTOS TÉCNICOS DEL SERVICIO DE INFORMÁTICA',16,6,1,3,2),(62,'NAVEGACIÓN TERRESTRE II',32,6,2,3,2),(63,'PRÁCTICAS DE LA ESPECIALIDAD I',168,6,10.5,3,3),(64,'INGENIERÍA DE SISTEMAS DE INFORMACIÓN I',48,6,3,3,3),(65,'MATEMÁTICAS COMPUTACIONALES',64,6,4,3,3),(66,'LENGUAJE ENSAMBLADOR',80,6,5,3,3),(67,'LENGUAJES DE PROGRAMACIÓN',64,6,4,3,3),(68,'ARQUITECTURA DE COMPUTADORAS II',64,6,4,3,3),(69,'INVESTIGACION DE OPERACIONES I',48,6,3,3,3),(70,'CULTURA DE LA CALIDAD',48,6,3,3,3),(71,'IDIOMA EXTRANJERO V',80,6,5,3,4),(72,'ÉTICA MILITAR IV',32,7,2,3,1),(73,'EDUCACIÓN FÍSICA VII',80,7,5,3,2),(74,'ORDEN CERRADO DE INFANTERÍA IV',16,7,1,3,4),(75,'ARMAMENTO MILITAR IV',32,7,2,3,2),(76,'SEÑALES Y SISTEMAS',64,7,4,3,3),(77,'INGENIERÍA DE SISTEMAS DE INFORMACIÓN II',64,7,4,3,3),(78,'TEORIA DE LA COMPUTACIÓN',72,7,4.5,3,3),(79,'SISTEMAS OPERATIVOS',64,7,4,3,3),(80,'ANALISIS DE ALGORITMOS',64,7,4,3,3),(81,'BASES DE DATOS',80,7,5,3,3),(82,'INVESTIGACIÓN DE OPERACIONES II',56,7,3.5,3,3),(83,'IDIOMA EXTRANJERO VI',80,7,5,3,4),(84,'EDUCACIÓN FÍSICA VIII',80,8,5,3,2),(85,'ASPECTOS ADMINISTRATIVOS DEL MANDO',32,8,2,3,2),(86,'ADIESTRAMIENTO MILITAR Y CAPACITACIÓN DOCENTE I',48,8,3,3,2),(87,'PRÁCTICAS DE LA ESPECIALIDAD II',168,8,10.5,3,3),(88,'TÉCNICAS DE PRODUCCIÓN DE SISTEMAS',64,8,4,3,3),(89,'MICROPROCESADORES Y MICROCONTROLADORES',64,8,4,3,3),(90,'SISTEMAS DISTRIBUIDOS ',64,8,4,3,3),(91,'COSTOS APLICADOS A LA INGENIERÍA',32,8,2,3,3),(92,'DISEÑO DE COMPILADORES',64,8,4,3,3),(93,'BASES DE DATOS AVANZADAS',80,8,5,3,3),(94,'INGENIERÍA AMBIENTAL',64,8,4,3,3),(95,'IDIOMA EXTRANJERO VII',80,8,5,3,4),(96,'EDUCACIÓN FÍSICA IX',80,9,5,3,2),(97,'GUERRA IRREGULAR I',16,9,1,3,2),(98,'ADIESTRAMIENTO MILITAR Y CAPACITACIÓN DOCENTE II',32,9,2,3,2),(99,'INGENIERÍA DE REDES I',80,9,5,3,3),(100,'SISTEMAS COMPUTACIONALES EN AMBIENTE MULTIMEDIA',80,9,5,3,3),(101,'SISTEMAS EXPERTOS',64,9,4,3,3),(102,'PROGRAMACIÓN ORIENTADA A OBJETOS',64,9,4,3,3),(103,'ARQUITECTURA DE DESARROLLO DE SOFTWARE',64,9,4,3,3),(104,'METODOLOGÍA DE LA INVESTIGACIÓN',32,9,2,3,3),(105,'IDIOMA EXTRANJERO VIII',80,9,5,3,4),(106,'DERECHOS HUMANOS',48,10,3,3,1),(107,'EDUCACIÓN FÍSICA X',80,10,5,3,2),(108,'GUERRA IRREGULAR II',32,10,2,3,2),(109,'INGENIERÍA DE REDES II',80,10,5,3,3),(110,'PRÁCTICAS DE LA ESPECIALIDAD',168,10,10.5,3,3),(111,'TECNOLOGÍA DE INFORMACIÓN EMERGENTE',64,10,4,3,3),(112,'SEGURIDAD COMPUTACIONAL',96,10,6,3,3),(113,'INTELIGENCIA ARTIFICIAL',64,10,4,3,3),(114,'AUDITORÍA Y CONSULTORÍA INFORMÁTICA',56,10,3.5,3,3),(115,'DESARROLLO DE SOFTWARE ORIENTADO A OBJETOS',64,10,4,3,3),(116,'PROYECTOS DE INGENIERÍA',48,10,3,3,3),(117,'SEMINARIO DE TESIS I',48,10,3,3,3),(118,'MANDO Y LIDERAZGO I',32,11,2,3,1),(119,'DERECHO INTERNACIONAL HUMANITARIO',32,11,2,3,1),(120,'EDUCACIÓN FÍSICA XI',80,11,5,3,2),(121,'INGENIERÍA DE REDES III',100,11,6.25,3,3),(122,'LABORATORIO DE INGENIERÍA DE REDES',64,11,4,3,3),(123,'REDES NEURONALES',64,11,4,3,3),(124,'LAGISLACIÓN INFORMÁTICA',64,11,4,3,3),(125,'PROYECTOS DE INGENIERÍA DE SOFTWARE',64,11,4,3,3),(126,'TOPICOS AVANZADOS',64,11,4,3,3),(127,'GLOBALIZACIÓN Y DESARROLLO',64,11,4,3,3),(128,'SEMINARIO DE TESIS II',32,11,2,3,3),(129,'MANDO Y LIDERAZGO II',32,12,2,3,1),(130,'EDUCACIÓN FÍSICA XII',80,12,5,3,2),(131,'OPERACIONES MILITARES II',48,12,3,3,2),(132,'COMPRAS GUBERNAMENTALES',32,12,2,3,3),(133,'ELABORACIÓN DE TÉSIS PROFESIONAL',368,12,23,3,3);
/*!40000 ALTER TABLE `unidades_aprendizaje_todas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-10 20:01:04
