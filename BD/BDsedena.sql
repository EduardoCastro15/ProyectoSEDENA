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
  UNIQUE KEY `jefe_academia_UNIQUE` (`jefe_academia`),
  UNIQUE KEY `edificio_UNIQUE` (`edificio`),
  UNIQUE KEY `piso_UNIQUE` (`piso`),
  KEY `academias_carrera_idx` (`fk_id_carrera`),
  CONSTRAINT `academias_carrera` FOREIGN KEY (`fk_id_carrera`) REFERENCES `carreras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academias`
--

LOCK TABLES `academias` WRITE;
/*!40000 ALTER TABLE `academias` DISABLE KEYS */;
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
  UNIQUE KEY `nombre_carrera_UNIQUE` (`nombre_carrera`),
  UNIQUE KEY `jefe_carrera_UNIQUE` (`jefe_carrera`),
  UNIQUE KEY `duracion_normal_semestres_UNIQUE` (`duracion_normal_semestres`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carreras`
--

LOCK TABLES `carreras` WRITE;
/*!40000 ALTER TABLE `carreras` DISABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_deportivos_discente`
--

LOCK TABLES `datos_deportivos_discente` WRITE;
/*!40000 ALTER TABLE `datos_deportivos_discente` DISABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_medicos_discente`
--

LOCK TABLES `datos_medicos_discente` WRITE;
/*!40000 ALTER TABLE `datos_medicos_discente` DISABLE KEYS */;
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
  `nacional` varchar(45) NOT NULL,
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
  UNIQUE KEY `nombre_discente_UNIQUE` (`nombre_discente`),
  UNIQUE KEY `apellido_paterno_discente_UNIQUE` (`apellido_paterno_discente`),
  UNIQUE KEY `apellido_materno_discente_UNIQUE` (`apellido_materno_discente`),
  UNIQUE KEY `grado_militar_UNIQUE` (`grado_militar`),
  UNIQUE KEY `plantel_UNIQUE` (`plantel`),
  UNIQUE KEY `CURP_UNIQUE` (`CURP`),
  UNIQUE KEY `RFC_UNIQUE` (`RFC`),
  UNIQUE KEY `cartilla_militar_UNIQUE` (`cartilla_militar`),
  UNIQUE KEY `pasaporte_UNIQUE` (`pasaporte`),
  UNIQUE KEY `sexo_UNIQUE` (`sexo`),
  UNIQUE KEY `fecha_nacimiento_UNIQUE` (`fecha_nacimiento`),
  UNIQUE KEY `nacional_UNIQUE` (`nacional`),
  UNIQUE KEY `entidad_nacimiento_UNIQUE` (`entidad_nacimiento`),
  UNIQUE KEY `nombre_tutor_UNIQUE` (`nombre_tutor`),
  UNIQUE KEY `RFC_tutor_UNIQUE` (`RFC_tutor`),
  UNIQUE KEY `nombre_padre_UNIQUE` (`nombre_padre`),
  UNIQUE KEY `nombre_madre_UNIQUE` (`nombre_madre`),
  UNIQUE KEY `escuela_procedencia_UNIQUE` (`escuela_procedencia`),
  UNIQUE KEY `tipo_escuela_procedencia_UNIQUE` (`tipo_escuela_procedencia`),
  UNIQUE KEY `entidad_federativa_escuela_UNIQUE` (`entidad_federativa_escuela`),
  UNIQUE KEY `promedio_secundaria_UNIQUE` (`promedio_secundaria`),
  UNIQUE KEY `promedio_bachillerato_UNIQUE` (`promedio_bachillerato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_personales_discente`
--

LOCK TABLES `datos_personales_discente` WRITE;
/*!40000 ALTER TABLE `datos_personales_discente` DISABLE KEYS */;
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
  `num_int` int(11) NOT NULL,
  `colonia` varchar(45) NOT NULL,
  `CP` int(11) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `deleg_munic` varchar(45) NOT NULL,
  `telefono` int(11) NOT NULL,
  `movil` int(11) NOT NULL,
  `telefono_oficina` int(11) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calle_UNIQUE` (`calle`),
  UNIQUE KEY `num_ext_UNIQUE` (`num_ext`),
  UNIQUE KEY `num_int_UNIQUE` (`num_int`),
  UNIQUE KEY `colonia_UNIQUE` (`colonia`),
  UNIQUE KEY `CP_UNIQUE` (`CP`),
  UNIQUE KEY `estado_UNIQUE` (`estado`),
  UNIQUE KEY `deleg_munic_UNIQUE` (`deleg_munic`),
  UNIQUE KEY `telefono_UNIQUE` (`telefono`),
  UNIQUE KEY `movil_UNIQUE` (`movil`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `telefono_oficina_UNIQUE` (`telefono_oficina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domicilio`
--

LOCK TABLES `domicilio` WRITE;
/*!40000 ALTER TABLE `domicilio` DISABLE KEYS */;
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
  UNIQUE KEY `nombre_doscente_UNIQUE` (`nombre_doscente`),
  UNIQUE KEY `apellido_paterno_doscente_UNIQUE` (`apellido_paterno_doscente`),
  UNIQUE KEY `apellido_materno_doscente_UNIQUE` (`apellido_materno_doscente`),
  UNIQUE KEY `especialidad_UNIQUE` (`especialidad`),
  KEY `doscente_academia_idx` (`fk_id_academia`),
  KEY `doscente_carrera_idx` (`fk_id_carrera`),
  KEY `doscente_domicilio_idx` (`fk_id_domicilio`),
  CONSTRAINT `doscente_academia` FOREIGN KEY (`fk_id_academia`) REFERENCES `academias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `doscente_carrera` FOREIGN KEY (`fk_id_carrera`) REFERENCES `carreras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `doscente_domicilio` FOREIGN KEY (`fk_id_domicilio`) REFERENCES `domicilio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doscentes`
--

LOCK TABLES `doscentes` WRITE;
/*!40000 ALTER TABLE `doscentes` DISABLE KEYS */;
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
  `grupo` varchar(5) NOT NULL,
  `nombre_materia` varchar(45) NOT NULL,
  `nombre_profesor` varchar(100) NOT NULL,
  `hora_lunes` varchar(45) NOT NULL,
  `hora_martes` varchar(45) NOT NULL,
  `hora_miercoles` varchar(45) NOT NULL,
  `hora_jueves` varchar(45) NOT NULL,
  `hora_viernes` varchar(45) NOT NULL,
  `hora_sabado` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `grupo_UNIQUE` (`grupo`),
  UNIQUE KEY `nombre_materia_UNIQUE` (`nombre_materia`),
  UNIQUE KEY `nombre_profesor_UNIQUE` (`nombre_profesor`),
  UNIQUE KEY `hora_lunes_UNIQUE` (`hora_lunes`),
  UNIQUE KEY `hora_martes_UNIQUE` (`hora_martes`),
  UNIQUE KEY `hora_miercoles_UNIQUE` (`hora_miercoles`),
  UNIQUE KEY `hora_jueves_UNIQUE` (`hora_jueves`),
  UNIQUE KEY `hora_viernes_UNIQUE` (`hora_viernes`),
  UNIQUE KEY `hora_sabado_UNIQUE` (`hora_sabado`)
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
  `clave_materia` varchar(5) NOT NULL,
  `nombre_materia` varchar(45) NOT NULL,
  `salon` varchar(5) NOT NULL,
  `edificio` varchar(45) NOT NULL,
  `piso` int(11) NOT NULL,
  `fk_id_carrera` int(11) NOT NULL,
  `fk_id_academia` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clave_materia_UNIQUE` (`clave_materia`),
  UNIQUE KEY `nombre_materia_UNIQUE` (`nombre_materia`),
  UNIQUE KEY `salon_UNIQUE` (`salon`),
  UNIQUE KEY `edificio_UNIQUE` (`edificio`),
  UNIQUE KEY `piso_UNIQUE` (`piso`),
  KEY `unidades_aprendizaje_todas_carrera_idx` (`fk_id_carrera`),
  KEY `unidades_aprendizaje_todas_academia_idx` (`fk_id_academia`),
  CONSTRAINT `unidades_aprendizaje_todas_academia` FOREIGN KEY (`fk_id_academia`) REFERENCES `academias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `unidades_aprendizaje_todas_carrera` FOREIGN KEY (`fk_id_carrera`) REFERENCES `carreras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidades_aprendizaje_todas`
--

LOCK TABLES `unidades_aprendizaje_todas` WRITE;
/*!40000 ALTER TABLE `unidades_aprendizaje_todas` DISABLE KEYS */;
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

-- Dump completed on 2022-05-08 11:32:42
