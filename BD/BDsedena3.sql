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
  `fk_id_unidades_aprendizaje_reprobadas` int(11) DEFAULT NULL,
  `fk_id_unidades_aprendizaje_aprobadas` int(11) DEFAULT NULL,
  `fk_id_unidades_aprendizaje_no_cursadas` int(11) DEFAULT NULL,
  `fk_id_unidades_aprendizaje_cursando` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_academicos_discente`
--

LOCK TABLES `datos_academicos_discente` WRITE;
/*!40000 ALTER TABLE `datos_academicos_discente` DISABLE KEYS */;
INSERT INTO `datos_academicos_discente` VALUES (1,'Ingeniero en computación e informática',9.5,NULL,NULL,NULL,NULL),(2,'Ingeniero en computación e informática',10,NULL,NULL,NULL,NULL);
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
  `foto` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_personales_discente`
--

LOCK TABLES `datos_personales_discente` WRITE;
/*!40000 ALTER TABLE `datos_personales_discente` DISABLE KEYS */;
INSERT INTO `datos_personales_discente` VALUES (1,'José Juan','López','Gutiérrez','cadete','plantel_aleatorio','curp_aleatorio','rfc_aleatorio','cartilla_aleatoria','pasaporte_aleatorio','Masculino','1998-12-15','mexicana','Ciudad de México','Manuel Jesus Marquez','rfc_aleatorio','Isidoro Kaur','Sara Maria Tena','C.E.C.yT. 9','físico matemático','Ciudad de México',9,10,_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342�\�\0C			\r\r2!!22222222222222222222222222222222222222222222222222��\0SS\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0B\0\0\0!1AQa\"2q#B3R��$CSbc��4�%r�\�&DTs�\�\0\Z\0\0\0\0\0\0\0\0\0\0\0\0�\�\0#\0\0\0\0\0\0\0!12A\"3�\�\0\0\0?\0\�\�AHA\0#D� �\0 �0A��A)\0Ad�$� \�h�\�R��\0Q#($	A\Z�H#A\0T�#A\0�)\nKA\0�I\�\r���@)Q(��#A\0H#A\0��h�8IDvK�)$ 	R�\�~��Z�\�;\�))Ғ�n�ۣJA\0�^�\"쨍�Ih)R07J\��} \�i�>�(�LI\��H�K��@�)�H)Ē�H#A3jA��A\0A4� \r4H\0� 	(XPe ����$|DhR�\"v\'l#���N\"AII%li\�A���\0�  �$A  �\0 �\0���XA\0��QC�5�$�IB��4H��\0� $h�`\nD�\nK�H\�\�O��(��\�R4D�\�Z	p)i\�\�`\�%R4)\0�]�\�i(a4E��A�\�U$?`�M�T�ғI\�\�t�6�U���\�\"����T�V\'�Q�c�\�d��\�V�t���V;T>!�\0t\�\�g=�%\�\�*\�\n�\�d<Q��ɮ�\�w��\��\�#����\0�\"#J|\�\�~l1���c��\\6aU\�\�t��RW5L�����&Nl\�\�kA/,�\�\�H�m\�$Yܹ\�7~\�\0i\n�\0��Ha\n 4�RRc*�JR\�6´��q-\Z$���\�A)PA\0AHA	\0DtH� �\�y\�j*<ّ\�7�\�+BZ\n�\�I�G\' ΄\�-=i���\�\�\��l���\��\��0�[.��\�_ۡ��:8�I\�U@\�4�I�:�w�\�ǨC.Ė\�\�Ņ�TfdQ��=<��\�!w\��$��\0 �$��\0F��\�mEG\�A�5A\0|�$\�\�h\0(@\'�$�!]�8	��\�%AIT�\�����H\�7�R2\nAKH&��E\�#� �}.��	V��ҹ�mYI�\�N��:\�:Ӊ�*N�D\�\�(@L/I��?��	+��:�\�C�H	W�dD�\�D��(	\�hZ�·:O8(�\�\0�J�\0��1\�F^�H�6�=(G;�\0ُotĚ�?��Pr,�Ն�K\�~\�(�w��#�\�Z\�f~卅�I[����^���\�\�R � ��\�$�\�\"Gh�\0�\"��R>m<l�\�\n�Tֱt\�L�\�\�f^\�q͖C1\�Bv�(���u�\�N1\�\� �c\���\�j�Y��OP	=\�s\']\��\�8\�\�|\�ܕ/X\�rA\�\�a\�f\0��[ᄋY��!����A\�Ts�\�H�\�URyӺi�96�u�\�\�MG\nF?{�\�J\��:Yd����\�g{��)\��R52z\�b\�|����\0�u Ç<�3\�b�=a�.K~r�f�9\�є��a�$\��9\�\�i�a\�a\�ecdG\�tW�\�\\~XT�=e�\�rv�!Y#\���|���\'�ʳ\�p\r��<o\�\�c2\"�H]F\�\�1�qJ��	7d�}���IQ�\r\�D���\'a,!\��	�r��D��8\r���\0#IB\�G�$�\�H �$\�\"�?\�+�#\�H\�q\�\�M�/\��jl\�\�\�ͅ\�\0#�АJ\0�Q�&WD\\<�R\�K�	ت���Ys~\Z.sb��)|\�9i�@ `�Rȴ\�A��\�o����@6���\��|��B\�c+\�l	X\��\0��e\�\�\�\�d#\�yA5	\�\�i�\�$�\�\�c��n> �\�R�hB\��\��V�\�wy�e8~��:�\'��_�l\�@�\�\'�,�\��E%|\�Ĥr4\�\�!ْ?o3\�$׺\�	\�G\��E�\�hO�ъ+ܨ�k�o�>ʼd\n�@H�&g;�\�GR\�ד\'�L|�RT\���$\�#\��(���\�D9$\�\�\�\�S\��\�\Z\�\�\�\��W=/�\�H\��z\�m��A&Җ�pJI@&\nA%\0)�w)e6>��QiQ\�H�썜\� \0,\�Q>�!\�i��cI=I;;�V�H4O1���9����\�\�y$�\�,�m�\�\�՞�\����\�IWk9.K��l�r!i9\�D�I&�5�\��\0\nC\�?9\�\���\�>\�\\\��r\0�H�\�\�\�����0b�<e\�\�\�^H21�\�\��>z��J���b6y�\�|�\��\0�`�aa��0��U�G\�I�\�`������\�\'ˊ�ے\�G\�F܂���*�H\�,\�T�=c;O�\�1\">\�eU�H�F�{�\�\�u~\�\\y\�!ς��yȺ\��~$s\��Y ^R\�\�)�P�v��\\\�\�K�A�_ر9Qqz\0�s�s�U]�<9G<d=��?\�Hڬ^l��\�\�Dgg�ey���ې�\�@�\0��EvSڮ�\����!5ɽ�����z�\�Ro\�@\�F�\��\��\n\�y��\'��\"�������r3\� �:8\�@�@�	I$�2\�v\�W\�d\�_ӈ��Fϐw�\�%�@\���dR�>J\� �\�!\Z�B&r� f�\�}Rs\�\0S;�q�b4�+!$�_�\0��\�Sg\�\0\���Y\�\�KK�#`\�\�1�5���K�q$�\�\���\�\\B\�\�u	���ܪ�4����Z\�g�u�1k.n\�e�f\�;�7	qr���ǽ�\�OpwC��\��\��\�\�c%0�r��ԶdN�\�J�! ��\�\�	�� U,�\�c \�J�j	�J\ZU\�-)�6��\�\"X�uOibPRN\�\�\�\�	��t�\�\n\�2Οb{�\�)7K�iq�4�Xǈ\�\�[�IAhĻF�\�% \rFм��\�\�h�!R\�P<\�N>�Gݟ\���\"\�\�3\� \�0x*�#�4ݧ\�\�b\�e���q:r\0�\�a8��qt�=���\�L����q\��>�\�̓ψ\�\�Y��̜\�\�\�*{Za��sT\�2�2��g[\�wUR~i���w>\�9\���C\0>vhhD\�Y�\�Q����\�\'e��O�#\�=�� �M��bn�\�_\'t\�L��\0I$�>w\�`����#��\�~�C\�\�b6F9\��\�pu%�MJ�\"qWo>G\�\�9v�\�P\�\\��J����\�\��\02kM\�{h\�\���fGΞ���\�*(A<��\';�\'��\�u\"YK<ؑ��D�6)A\��.�G�c\�T\�?U�zT\��,R�4\nl9]��ǋ�C�eI�W[�rA\�^L\��_���?�\��{^�\�n,�3D�B$yx��N���\�\�@\�&a���\�\�\�O;\�(��nr\nФ��O\�\\�ф\��\"\�#vF�K\�++O{\�Cu�~��v��g�\�Q\��^g�\�����+\�G.G�\0ԔnA4gyG�����\��\�\�>B_��R�c\�g\�\�}u>c���xGy�S2fb��5T4\�=��g\0Ci�yҘ,ƣ�\�N\�I�Ϟ��\�G�ᇼ�\�<x�u\0��r.:1\�_o\���W�\�Y!\"1��K\"���Ia���cN\�\��ԵN\��\�6����\��6AlP�LIJI@ \�$�,\r�H@ ���O\Z\�\�\�U�\0\�\�.\n�i8\�M�<�ߒ6]\��#�����q\�h�7\�&��Ew\�<��u.\�uv�\�a>$�Q�\"W5\���\�M6A��o\�s\�͏9�h\���(�\�HPu\r7T����\�[\�{�/��\�Rܚ]T\�\'~�Fw\�\�\�bsq��LcɂH�=B�UyK\�9p���\�����XAE��\'F\��j4��\�)OK�!nH�w�\\9JvO2r�F\�\�l\�d\�\��l�`\\KNg>������\�*��A\�[ �ԴE�\�PmM\�\����^\n\��\0\�e���s���\\K�|�!��A�RM\�\Z�\�h��=Ÿ�X=G\�ǒ_{n{���\0a�Uz�y�%\�d��\�=\�w��O$e췑\�MR�\�1\��\�0R~�S�#Y\��gt\�N \�F4{��Q�%���P\�9\�`���+�&�r����Q��ۉ)&Nw�\����\����F��N��\�y��\�\r���H\�\0�U�\0T\�#2]\� �\' ���QH^�# By,P;$�FE�:@s�\�\�-6�>{\'rRz�\�\�2\�܄�m�p�\�#\���=\0$�*�C�\�k\�R��\�P\�l��\�6T~�{\�[D�0Fgw\���&�Gdҗ\�M�-�~\�=��?�\n.+�kC\�\�|\�G��]G�\�7��eFM�b\�d�2CC7]#�ؾ\'eI_%�\�Za]Z7�\0g	������ �\nę\�s\�\�\�!�ro�\�J��Ĥk!=\�z���#d�\�|\�$�\�z�=]�\�� ̀d����ܛ��(�}\�AY�OO�m��c �TE]O(�>ʽ�#�e7Q�\n�\�ތ\��ß��\0�֏�\�ic�~N��~�^�\�\�^�\�g�R��y1$>\�R�\�6\�5䀶\��B��\�C	��\�B\�y-�U\�<�@\r��Fɷ�6�(���_D\��@5�	\�W�:J\���?[\�\�\�\\=\��ږ�$�xy\�\�b�����b�;�?��\��/�\�����i�97b\�\�r��\0d\�\�\�:_�0�\r��y�\0���\��p鼜iϣٻl�6Y\�EA\�\�}�\�䎬	\'��\�ϼ\�,_�:�f�\�b\�$5ؒ,\�ҵY&c\�\�\n�R�\0ag>n��a��f\�O\�W��hߌ��:|\rr��BÑ\Z\����q>\�..t\�\�\�Y�\\�\�K	�\�9��\�33�\�,di�\�\�6��\�pk8�,�O\�Y4\�1\�b��Aehs�SI���\�p�_�\�h\�M<�a��\�>~�P�g�+՚v���6-\�OK\�\'�	�L\�q$\�\ZxN�1��\�\\	�f[�\��v,6�\�Z��OVc�\�\�^\r1\�*�L����$!\n$�������T4�,9\r\�9W�$g�\"<��(\��:R�ԈJ\nI!�\�c\�q�\�Y\�\�K�p�2�N\0�\�\�]�n-\\e�\���Rh�	��I�\'\��¬\�sF!�\�on\�Fk\�2�:\�1���\�\"I��Ϣ\�9�\"I	`��\'j�#X\��\�e��&\�g����P�h\�\�jM\�\�	l�fdB�`ڬd�y��\n��ddlRF\�*L�[��\�ǂL\�.Nfc��Rre6\09#\�Ꙣ<2\r\�#�\n�\�=�]\�\�#�\�\0�[\�d\�%\�\�\�utYy�͘\�8��)\�B1\�\�(��r�ɦ\'9�\�Ih�\�z�^��̀\0���\��O\�#�\�M����\�\�=�L�\r�>J{#\�\�\�U\�n\\wH\�\Z\�6p�\�Wx��\nQ�\�Y�\�:&���z�\� +��.|�u\�i3e��M\��S\�K�g\�\�6�UJ\�l9P@#u\�?%g#\��\�\�\�8n\n�\�u�gG\'v^\�\�\�/	\�q\�Tcn\�\�&\�x�]ē\n<��Y$=�HvV\����>X\�,��{\�Oo\�F(N?P��(��)�bI\����v�\"\��¡u F\�J\�x9,���\��\�ʜ7LӜ\�7\�̷\Z�$L�お\�\�����;7\�+L\'Yq!g��˓���>����l\��N�\Z9�hK\�ފ�\���\�\�\�\�d\��?��G���,\�\�\�V\�L\�d� �\��\'\�\�/��\�k��\�y�f\�p|�����\�\�dʃ�^\'�\'��޺���7@��-��\�\"�U��>���/[1O�\Z �n�\�ҏ\�QV��\�\"��H𐄝�\nY;�I�Ԁl�\�JAP�	�i\�\�قo\�lxia��\\��1�\��Y\�!��#�n�\�,y���A\�\Z�\0\�\��,���J\�\�;�qo\n��\�31\�\'x��$��r�oc�gb\�l�u.�\�b^��\�\�j\�?�\��߄\�\'�Y��\0��	clv8�;��=�xx�V���,>h�o\�\�\�6��\�l�MQ�M\�u�\�ϔ�\��a\�;$}|\�\�\�W�\�>�\�\"t�o�V�\\\�	\�8�&��@�\�a�Y:xѺI;�����\�\�\�c�-\��+��\�;���\�F���\�\�R1u��4N$\�\�\�h/\��\�x�M/Pp���\Zs\��º\�\�sŒd��>?TK`\�^�\��GK\�l�i<�5�ո\'7Oq��\�\�\���(\�Z;z9\�\�\�̋�iu�꜃�1�x�D�(��\\)�E�<\Z��v~��j�\�Ǟ\�Ʊ��e\�\\����՝\�\�m&\�\r�\��\�7�Gn\���\nHʎ5\�ix\0��d\�Ȼ\�!�9e�5�@�\�\�Ү1\�Ii(ٔ�\�B�m\0\�[�!X\�0Ԏ����8ꍣ`�l3+\�.-���|^��� %yz\�6��s�܎��I&\�\�\�TL��bI6�7\�)��E�)\�?\�l��7B�p9�$�`�DXl2�� \'�|��	�w�|\��}\�܉:c�\�M�gd�\�\'1\"I{�Dd$��9�\�>\�,nU% �&\��U��e\�y>=�n@��T�P�,\�D��\Z��q���\�`��\���\rt\�R3T\rnR�\�\�l\�#�&\r�\nDH�(�Xѵ�F�\�#��N/\'�\�U�`2=W�ɜ|��2��ip��#!X��\'�<f@�GE��[}����\�\�\n�\\s-,�$vPe�XT\�I�\�,\�!x�^dAWaV\�M�\�W.xqX\�}\�p�}R��\0�\�p��ݛ6�+Lk&˅uF�w\�|�\0�-敒0\�	�J{�.;�fI��\�\��/bWQ3/K\�-�<r.\�Ù:�e\�Kl\�q\��S�|L9L�{#mʭ\�\�9!�ͼ�=¶\����宄��\�\��V�K\��N��Ie�\�Sf\�Y�02�{�^<(XF\�*\�����(<���X�\�j!�\0YP\�/\�N\�M\�1�\�\�J`0�\\�\0���\�=�B:lh \��i4�V�<|��G\�vT3�s��z���|g�LL�\�]?��\�\�I�q�d\�����\�pI&6C\�{\"�4e�k��)\Z�di\�A�\�!,N��e\�f�d\�w\��߻{�:}=�$�\�\�\�9\�{B� j\�5\���`+JU�t�G.OzZ%bX	4���AuI)I:A\�F�!# \�RJ[�\0RB�.tiaʟ��@i#\�d\�G\��:3K�Fa;<	�XH4<�\�t��d��i�,�\�\0g�����\�?�|3��6E��!\�t2vZ��\�\�\�r ~\�2͏��g\�cayx�Oi[\�+_�<p�ѿxʿ>�\�\�~g�O\�_O�\�6I<�\�L\�\�\�f�]/A���\�}���˭|F~F[\�ӓ �\'Oa�xdGӾqAY�}\��\�j�l\�Ӡ|�\�y\0f\�\��G\�8�Rf���d�\��\�W�x7�t\�\r\�*\�\�^*l�?\�\"A\�2Z\�\��c˗U\�kF=\�\�sDGpT�7�Z\�o�\�\�\�ͣ��ڊ��%\�pN@�4ǌ��\�*FK�hӘ�\0:�\�+\���\������\�\�\�\\}�\�j߇�\�$:�/ڥ�^X�\�\'C#K3��>Yثܿ�\�\���\\���5���r\�\��I����\�fiڶ��\�+_�aب����\�|}�\�f�\�3\�\�~\�p�\0⎗���k@\�{Ƽ\��;�\��\0����3b�L�\��1��ގ�\0\�.\��\���/[\�<G\'?i\�+�q��\�\�ơ#\�F	�F^=��7�Nv�cf6[�\�݄+\�^8:\�G�I\0/|\�\�b}��c]�Y���kyO\�\��\�v�\0qo+[\��\�w�AAA\�T�\�-��^��\�ǻ�Ge��y\�]\�9:\�S��?�;\�u\�\��l\�H\�\�\�{/9�b��\�\�\�=t\�C��|�����\����\�E)˖UNq��\�\�;\��\\\�c�4?�{+�%S\�\�\�u,�\�Ǐ�\�#f\�T��\'&G��BM�g�3�q\�\�\�VS��{�H�_\�\��g�v\�b�\�F�>Bg�m�gLc�\�|$��H	y Dx��5\�dhH@;3a�Lzl��\�\�������uyd�l\��\�>��WŮ�WPݓ\�J���\\\�E!�~�0\�Ć_e�Y2r\�;4\�|��^s\\e<�Z.\�6_\�2�\0�0��c��?(me;\�N	9h.K^�:\"%�\�D��\�7\�\0�#\0��\�\rO>#K�\�\n�?�n5�\�M�\��{���\�\\�˿�U� \���)\�$��]��\�ly��ytmvI�����gs}\�9�����C$|&b\�we�*wcح9{l ��\�o�����\�	yJ;,�_��\�f�\�\�l��	�\���^e��\�?\�/R�$\�%��\05��q$\�\\b\�\�*�^�����|\�e�\���G8��N�;����	�q\��,B	<\�2\�6s��\�\��ʙ=O�+\�x\r@\����wc\�\�뾕rc\��o�C\0\�+klc\�@Y\�p\�5(\�\��\r,�U\��xzr~V_�\�t��g2�\0>��j3ǧ\�\�1\�\'��!{7��U�\�xA/�.k�\0�|gcRΛ!`�f�)d�t�¯\��x \��\n�9,�\��1�\�����S�ؐ�\�\�FeRMP\�@�����l�)%)�Α��L�W\�aȴ>�Q\�m;P\�\�\�ZXm�\��\�\ZF�����3t�y1\�P-\�_�1G~�\�j߈x��0y�<ﾎ8\�\"<\"<\�\�\�biد˛)\�1�!\�}�Y\�\�\�%\�s:x���a\�\Z\�N��ɨer�\�\�(R�\�\�\�F�F>�\�l�\�09��\'O�\'��xgs\�_i|-�\�,f����\�<\�\�ݭ�\��1ً\�[+�	#)\�\\{��D��\Z�Ɛܐ\�\Z\�\�7\�x�L\�?\�o\Z\�\�\�x9%\�,\�_	BwŚ�3[Әy�\��	���x\�g\��T�הq\�\�.���4�W\����\�^���A�c31��\�z��?|\�dK#�~%�ֹL�8bN�\�\�j���=����\�\�Z\�\����}<\�hr\�#-q>\'\�7\��%`\�l\�\�\����#p\����[X\�=)��,5,_��.a�\Z,\�x��\��BGˉ6)�\0/�ϲ4��	.\'�=$�z\�Gԣ\��k9�Ǔ\r\��4Xt�ߐ���ߜ�����+��L*<\�Ĭ�\���Q͇&\��H�vȥqN��\��iح`gy�u��\��Jރ�\0\��\Zѵ�<I�\Z\�K�~\�\���Ry�9u\�\�(R ��PE��J�&6d�x�\�c\������>���遒l�@?�;���K��\�\��_�6�@B\�8\�\�Y,̑\�viV�\�̗�\�N���a\�!7 �8�xy%\�\�M\�E\�G ����	��\"ž�c�tl�g���\';�\0�N��	\��R\�Q\�\�L\���Tl\�d��?)	���#�I\�\�zM(Tȿ\��ِ�s�\�`�> d��B��S\�S#�S\�\�\�6N\�ҟ�y�\�ŧ\�\�q��2\�K=�m�J�M\�I�=\�l�j��C\�\��rpt�	$>N��g���\�eX���^V�9$+ ��\�uK��\�ܢ�mH\�2\�EAK#8�\�`=��Zc&>\�\�oĜH9��Z\�:�Ǫ�\�\�Wh\�y}HGe�\�\�\�w�]��5\�L�e!��,�\��B*<\�aK���NJA�\0E�H|`\r\�d\�T�.�\0ݦr��\�4�\�G����c��BiR\�\���C)�F\�\n\����\"\r�Z���\�Xh�s��o�	�\"��\�<?�R�>�l \n��wg�\�>\�f�$@Yxa�\�\�eDd�Fy#ܼҵ�\�I�n=E$\��ѿ\�켞v���[,\�\'ӳ1a��\���F\�	Zn��X�b\��^.O>�ӈv�\�|3&	\�fɎ9��\�����~m!Br�`1��\'���F\��\�{,�y3\�^�\��E<\'��<X��o1j�����;�X\0��G\�\�s\�u\�cu6\��=\�ߞ\�x\�X/\��c�G�]it\�\��\�@\�O�tY\�g\�>\�\�s\��,�|öU\�8pM?1�N%\�B��1ǹ�\�c\�ܤ���Խ>8Lg���7�N\�3�c\�(���4l�9��Z���\�L��\�\�%\�ɾD�	�Hi@�\�\"-\Z#�A��$��8;�#\�\�\��s\��g��YmCQ\�\�3d\�͜\�eJw{\�,y\�緄\�\�Cc�*r\"䕠\�o+��\�\�1\�Af)\�<_2+��6�Nd:��\��2��\�7cLc\�\�\�\"ӱ\�c#����B6\r�P�\�uAy:|}_G�oSO��_\"%�\�\�\�<�fk$�!gst=CK}f\�&�ٸ]���h�\�K�Ɠc�E3��0\�yT�C�\�^y��.ӝ\��>��ˈ#�\�\�خ[������p\�\�\�\�\�N�݅E��͇���r`\�\�\�߄\��\�� \�S\��\���+S��\�:V˦>\��O�\�\�B!\�\�$|�\�G����z\�|dk�e3\�.��qG�V�\�z���X�߱^|\�\��s\r�h\���f�Z4\�!\�\�x�\�\�V9�7	��x��05�[��; �qVd�\\\�x\�Q\���N^��\�\��\�\�2�	��s�i*�\�u+MƟ2FGd���\�US8�\�\�|-��\�\�[}3��᰾\'<\\�\�J�I0>\�\�M����G��O\��`\�ɐ���K�a��\�j��A\Z	����\�\�P�|u��\\��/H?\Z\�\�\��\�WU��\�\�!��H�\�w\�9�\��\�H\�T�?�\�jOˆC\�\"\��\�#jS7e���SO0�(Y�\�xBL��A\0��G�[\�6	cLz\�\Z������\�y͐vJ\'Ø\�&\�\�BJ_o���J\�\��\�#��\�\'^M\�19�-=\����x\����?���nL���4���>`/\�\�a�N \�\����U�4\�\��Y0�\�d\�\�mCr\�+ц��\�\�Ѹ\�=��>\�\�\'\Zw\�)\�cz\�1q�1\�ty��w�\�V��\��&�;�\�\�2z����Y��B��\�\�>��U�W7�C��\�-���e���\�\�?s\�\�[6a1�tX\��\�ps,p�S��2\�6p�\�Q��Y��A\0�\�3�\�\�c\�\�-;���F��ɐ�F\�\'�f#\�6��\�\�Y��\�*�]\������&\�ԡ��\������-H�S\�<\�\n���\�\0\�Od���T�x\�\�I\�c\�\�U\�y@,U\�\n\�\�c\\3\�~5��\�bs[��/]A\�{,ƹ�Teú\�UF\�Y\�\�\��S4l���\�\�\�<\�!V��N =tl�\�\�\�bd,y\�u?T\�\�iI��U�\n��J�\�\�Iؙ8�>)@�׼g\�A2��!\�<=K\�\'駊x�LHy\�\�2Q\�\�\�>@Ȃ�^q����H$\�0<�!��z�\�6AĜ<�a�\�\�	{	آT\�/�$�N�ǀ\r�(�\05-/EyY�zF\�Z͒F\�-��d�}r�\�]s��\�\�}���B��$1����6�(\'X�\�0�2�#�%\�p�Ty��\��OW\"(\�_���%� �\��\�$#yܤ�M@�\�LȖ�%\0I�\Zc\�I��!���\���Ӝu<�\���\0�\\!<���\��eA\�\�mB;~>L9\�Qz%�U��ļ7-\�ee�\�\�\�+a��3j�\���O������f���b\��,4��1�s#� �Tt\\et=+�C�u\�ԝ�rl1�q�!b\����\�;ep��.��@O�\�UmoC�I��3+\�O�\�h�=J\��\�Rċ\�Zg\�\�\�\�2�2\���-\��Ǡ\�Pς|3\�>p��6WL\�\�K��3\��\\�����f��\�\�\�ӵl�f?uA��S�s��Y\"/�\��\�Cr8OJy\�?��x=E�\���\�S\n�\�\�I���\Zi�ڎH�\�1�W�\��\��;��q�a\�\��\�//��yÖ�����14�hG�\�\��\0$~\�<\�%\\iz4�\�<Tk?)\Z}A\�ӟ��l]�\�:N�LL\�۝��_#\�b\�\�i�\���>Y\�x�\�\�\�2�V3�\�\'�m@㞉\�T�Dy\�[}��V��c\����\'�ʼU<?����\0�V�h�\ZG��I�\�\�t�\�5�E\�l)Tq\�h��\��\�\�\r£\�\�ZTq��`�\��^\\G�t\�\�\�\�y1�ӟuKՂy#¢d?=�\�8�Oz?S����\\�F��Ÿ�G\�)e+�T\��G\�$��%�\�go��1\��?�]{��K\�?��\0\�\0M�ީe$\�\�dd\�`a\�c\�D�,s\�`��\�,��I�Jʑ��O`\�Z\��i\��\�P��\�\���X���C��W\�\�?\�\�!:6KC�\�QQ\�!/Xk�,�\�\�r�YuQ��\�\�d�?\�\�~Ӛ�I�D\���;��ϲ\�\�\�\�\�gdv)\�%<xOJ\�a.a�\�܏P#᜿�d3&9C�L!����\�\�->\�S;��|A�d2ٝ\r�\�Q\�a\��$�\���>�4U�4�i;B\�\�Ņ��AI�\�\���6O�	C\'�t\�J�\���Hԙ4�`f\�\0N]rl	\'`=Q劬Qj\�A�N�y %��pc\�k9�h�*\�kN<I\�\�yW�\�ļ,g\�\�!$[\�fl��93�\\/�\�s\�\�P�\�\�+�*\��p���p�쳈:�\�\�f��1)ii\�W3�\0\�\��nGϕ�覎���Ǖ g�k�Ia�\�W\�g\�\�G\�\�\��1`$\�ʍ\��\�\�\�J^��ω8�+��=�»\�4�\�e\�(��XOu\�\�O���)c>\\*�$O��jp�\�\�\�i�c\nSq�\�\��c\�\�\�L�X_U���](�\���\�X:��\Z|*|\��\�rG-W��y\�{��\��\0��	�\0m\�b����#�P5t�g�d#xgpH\'t��\�R\�rG�J^��\�&	\��\�\�*+_)݅1+)�\�TD\�әJC\�U�v`�>���>K�RKﵭ#\Z_V���\�vW\�|\���s\�\r�\��h�A��\�DӢ{sﾖ86M�\��\0J\�r \�Բ��V\n�N�\��z\�U���X(\�j���I�Q\�\�\�!\�j@ �\�e,\�h\�t�A(�\�G݇�NuvZ��Xoe3���\�90�\�r�$\�H\�%\��ɓ\�\�^\�\�Z���2Vs��\�+7��\�O�\�c�N��5\�Y\�ߋ�u8��<�Ҹ\�\�:\�\�\�bd\�\�3=�	e*\�G��\��ax��E\��K���\�8Ȇ9Ѫ,Y\�&\�:\rJ\�\��\��h����r#�\�b���9�ر�T�8ӈbӧ\�ss��A\�$S|\�Gk�|\\��\\v�\�{�\0��-|��\��я\�\�칳\�q>yQX�2\�L�):~$�����}7?d\�����]���O�Ǎ\�\�ӗV\�JI���\�\��c�4~k�+}?M\�\0��\��X~3��*\\�N��\�£A\"g,aMcI�\��إ��y$^\�o\�\\e0X�f\�NTX\�D}-?HB�Q�aC\�RB��IJA\0g\'�lo�O�/��\�R����]%?O�\�KZF�\�\�ޫ��\�����\��O�:�R��\�E�K�\�c\�\�\�\�]o%\�\�)�ٻ\�\�ڔ�bd�Wǃ&<p� �\�B\�\�::\�jڋu�3�G\��Y�2�0y���\��\�$\��\�X$��\�\���9/	\r#(�&��˂Y6\�}�\�\�I\Ze��#�\�9\�\�;L\�:t\Z~?>��yT\�d��b\�_۝�+�i�\rPO�\�\"�\�7D\�U��S��m4rr2\�\�3ٳ�4\�1\�\\��\�u��W�?��\�F��\���I�Z�A�G�a��\rC5���\�|�/^U]	\��[�\0ڱ\� \0�XV�a\��\�\�\�\'\�ûf\�Z<)#�0y4��qՆ}?�c�	\�\�\�<�/\�g��\�1\�p\�x��9\�ܼ��F28sQ/\0�\�_��曌\�l|L C\�{Ҍ��\�;xcP:\��\�d\�Pߑ\�U\�\��\���\�&\�\�֣Qđ�\�e���=c)���*��7a=7�� d4Ȇ\�w�o��6\�\�uj�IgV7�6\�O�\�\�\��rʌ.�	^f\�\� \�\�\�ό0�\�\�;��5\�5�,ڤ�<w����~tͪ\�,���4\�\�\\\�F�dW\�\��#pa�5\�5�\"^��\�kmҙ�5^6P�c�È\��\�d��\��Ѻ�.^$��FS\�9^\r�ݛ]��3 ��\'�R�Rv��vT�8�x-\��j�9\�l�;,�y���z\�:�2��	�.?�4�\�\�@�\�d\�%\�fZs�U�V\�\��\��\�\�܉:y�\�i\�G\�k\�8\�\�\�ȫ\�\���3H ���\��K\�~$\Z\�Y]k1��\��F\�\�\�l\�\�i�C\"� �\�ẝ�\0\�t�\�\�\0��\�2\�}RĖ�g�I\�$��L=S{Qa\"S\�\��Q\�\�\n�PX�\�v=Y��2a��\�\�L��7G��Q>\"Li\�l��\�\\X\���;�Au\�\�Ӆ��\�\0?�\�\�>C5\r_\0F>��!v3\�˳F.=\�$��7�]A�<��C�Zw�=ͩ�\0\�ą�\�b\��})\�\�\�CD��@�)D\��I��I;\ZM��	��4m\�ؚ\�\���y���8Z,?ŽV\nfv6G��V�_\��N���\�\�(���S\��p��2s��\\w��\�~\��\�\�a~)\�y42#��\�\�\�\��.��Q\�\��>��Wf���\�\�Or\�\�9\r#E|n=���̼��A�o[YĚ�����r\�15.%Ҝ>/$i,)�߈z\�f���jbc��O%<*\�S\�L\�\�oM�9\�\�\�\�d1Gm���\Zq�G\�qqq��\\�&vT��\�>g�\"�F^�?��&C\�\"��Ƈn\�\�Qr7��ծ�6_$���Z\�p\��9��\�G贸\ZY��Sy4�NҮ�\n\�\�\r:x\�(�Pc\��\�\�)Uci#ّ�Ǫ���O\�\�/L\�Hd\�\�c%`��t_�\�\�et\�b�8�\0�\0\��\0�\�����;%��.Hŝʉ��\�e\�`$\"ū<x\��A\�0W��\�;,�\�\��(#J�d#A\0<(�;\��\nW�S��{�C�c8�\�C�H\�Ջ\r�;�\�S�\�,3�\�_�9/%�淂\�\�8���\�-��&���\�%\�K�\�`���s�\�3�i�V�\�|\��\�{.o>W��Op�[��\�\��\�<S��\�\�<��\�Fv���\�2e�\�\�\\귆\��b�\�\�Y&�\0#�\�� a{9�Zm�\�L\�l�^��\�YQ�N\\��Pu\rf��>)\�$�pU�̐\Z�;(��L\�&\�\�\�\r�5\�L�\�g?&Gϕ8�C�\�\�p\�Xh^\�va�\�U,H?x��\�/6^�\��\�&�\�\�A&���2�G\�^�ݫ]\'K���X�\0Ue�<a��g{#`ܼ\0w;Z�qY�L1�h$�r��@6U��\�$\��/<�\�T\�A�\� �Β7�>(�G\���\���8\�l7Ke�\�Kޓ�){7X<\��mc⢐1�0\�G\�\��0lmb5\��Y3t�]�\�t\�1�3n\'�[���\�+L`%���<�US��\'g\�;|��~/��\��\�ΝQ�\�\�ʸp\�)L\�$��Oϟ��b\�P_\'\�6���FM\�\�4p�\�g�L@y\�/�L��`V#O��bv<@?B�5���f39��r��p[AL8\���@cNZ�䉺TCGղ�~N�����^&8\�\�X\�\�B?\�^\�~G�y3W\�d\0y\�\�󼪲\rHWM�<�\�\�n0\�\�O0��[���\�Ï�K��Pp\�$\�\���4�a\�_�\�\��{�t~.\r~E2i\0H%\�9�$��\��//\�\�®�F�~�9�\�Q\�&\�H\"�h�Z�,F��U�\�\��?\�I|w\"�#(eу;�����ٖ�@�r�\�{\���v���6]\�><\��\0\�v�\�\��\'�9Uj��>$7\����\�\�=�`�JE\�!\�[:z\��	\Zv�0H@�<�OѺ[\�\�PB\�$��Q�e )TL\�r��_��\���\�,�S+l|�%e\�<rV<Z�c/G\�ƫ\�@�*���>\�|\r�o�L$*�&\���x�c0X�T���\Z�\�\�\�X���f����\�$v>]��\�G:S+\r\�\�\�-\�\�F\�\�62 D�;�\�\�R\��o\�Z\�ird\�\�E�\0)z\�^\���F�d\��O\��12���\�Y-3L%\�E0.�\�1�\ZC\�-���T\�A\�\�\�\r�!\'jZ-F0�\�T��O�3��#R\0\0$\�%8�T\�9:oS�y\�|\nl���OU�eko�\���յ(\�͟Mf;���	9�]$F5\\\�\�\�dQ0&��-\�C2�y��\r\�W8a}\�~\�C���@{ǉ�\�\�1u5�6Z\�\��\0\�\'�\0N�\�~N \��z\���\�\�}��\�z%.�0\�\�\�\r�4$7\��\0`�����8[Px�[\��\�o�\�\\\�O�;0�̹�|o�\��=�\\�\\��\��\0,_\�\�	6����\0�\�X�0\�yWLC~\�\�^�\�\�<,C\�`8|c���S�\� Z�CJ��=�z����Gx�@\���઼N\"9\Zd��C���zY��_\�9�O�\0d�1��G\r\�n��}�\�)\�/\�:ef���A��X�\n�Z|T�\�܊�Y��i\�\Z\��XY�\�\�8�>S�\0Hճ��&	2X%̐\\_\�\'�7PΓQ\�y�*so��\�\�+��N\�7/\�y:6�3#�\0jD�,��i�\",]v�\��T\�\�y\�G�͟[����K7�\�g\�!SfG\�;%\Z1P1\�#�\�to��\� \��Z<Y\�{��6G��3��\0\�g��\�4\�?y����dH\�\�3�3\�\�ûD˱ɞ^ƺ8\�\�\nt@T,=Z�\rD�g�\��\0�\���\0Z���lv���\�a�8\�\�-�\n@gL�\',V�)�~qē��&fTxЋ�C��RdIQ0�/W�&M�\�3�2�3s����c�\�o�r\�\���Z\�ly��&9�:3��\�7rI�\��&q?1\�1#q���F(zy�\'߰��z\�y�n0O�4O\�!)�ln�� z����� �ֳN\�ٗ�|T�\�N�\�,��κ�\�`����y\'\�&X��\�~p��ew��K\�3u\�5Ӓ.\�\�ХJ0uI�2N�A\'\��\��=e7)ȪFi��,�	�2c\�\� 6\�>\�7\�\��a\�қ䰙x\�ԣ�/�\0ډ\'c\�\�)�@�\�fֺ\�\�\�?����?�$k��k�cO���̙Emh�^��\��we�\0d����Y�\�\�l��\�\�s\���-�twh´����\�@,�\�wB\�E�@\�#�Q;R@�SH�\� ~�H�$��<�p�\\S�]vW�N\�\�\\C�?���K=�mAf��\�>!\�\�W\�#\�\�!%\�9i\�2d�\�$\��dx(���28\�ޕ��&A�\r�V󄰣�I\����g�r(�\�G\'S\'yf-f�e�\�)�K�Ke\�wwJ\�0��\�<&\0͕��Lzb8�S�h�49�0<y\n�\�\��9,��G�0$��\�:d�rf�}�\�\�\�D\�lQ#ɂC�O�<)��|�K�PRq\�?t\�>��\�T\��3\�\'���/\�t\�3\���\�q\�\�\�_\n =`Y9R8�1�\�\�\�\�\�Vi\�.��\�%\�\�	%p\��\���do4�Y\�\�\�C�D�I�+�;\�?�\�|��\�\�\�}\�\��5y$��g\�+w\�\��J�?@B�C�I	I�Q�\�}J��D6SJ�P��\�?���\0Y]/\����\0�s��\�$�%a���d�줪���\�����i#\�Pd�/��a\\���\0\�s�L%\���#Y� \����3�^q�#ْV\��\n߃^\'\�7�	�Kl�����k\���pֺA�Fq6\�n�ʒsqN�\�e��Enq�\�#Q\�a�\0���b%>*$ִ\�MA�?\� B�:�����Q�\0��{\��c�\�N\�\�&8=�Yy5����$�\'\�?_~����I\���d6���\�\�\�Q�aAe�Fc�Y, ��qVLPI=;(��\�zo�\��\�a��ˎf\��\�:k���͕��.\�\�wY�f�N��\�pJ9\�e\�\�Lfcw,�J�&@#}�&}H�%�j�\�$�@\�Z[ȴ���;O�\\w��g�5FI�;:´1jfLA$�\�J����l��t�C��-<A֏\n!/K˓\��_<g��\�gS6Y�{�\�\�F\'��Hɵv�:\��5\�/\�pr}\�q�|n�v\Z<\0��tzf�d��\�\�{�x2�(\"f^��zơg戱\�||A\�\��R ÃCC̀O�p6\n�S\�nc�!�v���\�,\�d��L陇ܒ�Ƴ�HĀ\�(�\��ɦ\�\��,����9�Ð�-f��6���e�S�_����s�\\��\�V\n{#N\�\�Đ\�\�cǯ\��, A�\�S\�\"A\�!c!$�I���б�?\�\�3.�hɊz��\�´}dA��1��\��\�\�\�6갾\��\0[�Ҹ4\�>3�\���!hdf.}���(\�`��U9xsaI\�-��\���Î�6J��2|\�r+i\�\�ʷ 7\�\�eZ�������4\�\��_Z��\���>5F<h\��)k\�\�zx\��!\�]Z�\��\���=d!Z\��H^w\�Z�\�\�������f�\nOd��KHC�\�\0y\�\"\�)\'+E�P����RR��B�;A\n\�\�dٵa�\�\�\�<\�h®+O��\�\�\��Ŧ�6��f�8�`F.<��Vx��\�a�+ߋ��\�*\�&\�w%\�p\�;!�U��q�t)9H�\\]!\Z\�a?�iR�L\�f8c�YL�n,?��p��N\�\���\�~�,9���D\�Y�g葏Vؙ9Z^��$�H�\�@ƍ�jb\�e	9ɵe���WMc;�(���\�1\�< �!*SPH}F8�\�����#?\�3�c�0Ƨ��\�\�Ya�Qtm+��L�Y�=�5ǃTnIʓ��=E����g\��	�\0�w�}:i뜭\�Lɳu�qc	\\\���i\�L۞\���\�?���ܷ�\�\�^Λ\�v\�t�\Z�\�\�A\0Ҙ���=\'\�\�L{1 ���ӥ�\0ҹ\�=�\�k\Z��3\0gI��$U��{0�\�F�mD\�\n>�\0\�Ԥ�\�d��	z�\�S�/Z��\0�\n\�\�k���\�\�x\�4\�B̀\�S\�[I\�\���\�D� a�ɜ��Ş0\�x6��_�\�Fd�:�7Q1�}ʋ)\�I!�Y-[Q�#(ac\��\�Dt�??\'U\��XK�\�Wz^�$!�|�N�f68\�h\ri\�\��j\Zd\"\�\��Rh^���_�]Z�-7\'�\\\�\�=Y00��x��9���k\"O��{7&A\�\�0��\�bf\�#\�p[N�\�\�o#���G8\�\�\0S#n�\�\�]�s6L���̦��`l��g#=T!���FK���O�����\ZxV���U�&\�Y��ǂ��W�2@O;\�k.ƒ\\�[�\ny%�>�ȰB�#\����U�\�R�\�>Ĩ;]:	9�\���q�\���v<wA�=\�сi�$���$>N\��*]/m*	\�T�[1���\�G�\�{��\�.��q�\�7!�Y�\�1\�d;\"cԓ�\0yV|EƂ��Ƌ��q�x3�\�r~7\"6rE�`\�(\�zg�\\^\�O�f	$\��cL`�-�8^�\0F(#N��r\�y�\�\�2X?ޕ\�;㍱\�\�y#�P`�Tj\Z>I�\�ŝ<�Lf\�z\"JNc\�d?JSI��\�\��V�\��?�$j&�\�\��<�xɍ\�v=��\�0ND\�&\�o=�ʊ<3��\�\�A|\�a��m��\\��9>p\�\�#�\0@\�`9|U��\�YC �B\�\�+K��3�\�z�\"\�\���N��8�.s�xSF(Zc90�J\�$�.j=\�	X[@�\�RR�E#AA%�}R�%$���ؠOdH\�J���\"AX\�\�\�9v�}�\�\�`�\02�q\�%�Q�}N-�\�{9�T`�c\�j��\��\0T\�}�U�GjV\�\�C\�=\�=��H\�\�$\�R�b\��n�\�<\�DO<\�S\�\�f�\nxf�[�Yw\�b\�W\�\�09rvvz0���ў\�.v\�\�\�h޵q�a�Ak�b\�;5(��\�8�+�\�\�\�\�@�\�e\'�it\�\�	�L�\0\��Rt}*6� f	�Yl\�\�\�\�\�#Oɞ$x���-\�n�^~����\�\"��\��e/��(\r�y}C\�&�\��n\����\��\�׆s�\0 \�0��տ��=�X\�!�\��\��G\�\�(�\��W�6\�&\�x/*crJM�C\�ٲ\�\��!\�+W8\�AI��#�f�>\�)�\�	7<G�>\�8\r�Z\�)x ,�\�\�\�\��Q�?³\��\\���`U:����	ec\�?\�EϏ�\�/\�o�\�\�j��0��7.\�[\�X׷j!cp�d\Z�(�On\�?�v{\�̬� ǒI$�\n\�j\�9$y\'�\�M!Og`q\�~-�\�2\��b\�=\�_\'�&\�g8��1S\�qĒ3�&\ZZc��<�̉!�\�L3?\�\�瘺�����7�0�1�\�f�p͘J��l�Z��vJ��N \�i3&F,�BVg\�\�\�\�\��\��\�7\�9,��>\n<�\�J�8̆@�K�b�з�r�=Le�B	yI\�\�mK\�k`�+�Cԡ��I���-)�>\�\�Ēn�CO\�\�&�<�9\�|i\�݉cP\�,A\�qq=�a����>��>�k/8V\�\�k�O+Y��_�{\�\�\�+}��񷒼��\��3���\'��[��\0�1�9\�4��)@���U�?Rʱ\�%lX����0ߝԴ�@����FI�\"\�A��U�[\�q�2M錥Q�j�i\�\�\�<�\��\�\�]��_&k>\�5�Y\���`\�&w9�1��v]:�\�=�͛,��t�׃��\�c\"�f\�+7�r\�\�dQ\�q\�*�k\�Z��\��W?<!�l�c>֞�����r5?���9�gj,\�K�Hv\�X�6K#���j]\'�%tJ���ܚ>@d��=#D\�su\�wn\"�\�ײ\�\�!Rh\�\�0Em�X]>x\��FƎFO<�<!���KD�\�J. 7�\�0R��\�5�:��,c\�Z��l�T\�#�A\0�\0 ��P	%6R\�\"�6���j�J	T�\�&4�ٺIK���D��{(�\r��F\�Z\�O��*��S6\0�\�Ј�\0.\�\�)Lي/\�R��$�-�L\�\�G�Dv���\�\�\�y���F-\�z�X�ژ�y2:Mg,�I\�(\�\"\��\�@8N\��nL�*2\��\0u�\��$\�l��h,$Q�M�o�\�$9��?Ό�h\�s\�\�G.;Ĭ\0��G\�&\�\�3�\0D�>���3���\0)�\�yRt\�I��/T��1�\0t�\�\��娅\�^�\�X>���k\�ō<k� ��@ ��\�\�ғ&\�	\�_�d�\�\Z\���o\�\�\�#g�1S��.m�]Z�(uCs�_\�ZE�\0�d5y+u\�\��h��\�e��ןŎ�#	��Y�RekU�OЛmF\�\�{$1���\�ӯ�opb\�:@��z��Ͼ����otA�T&>r\r�s;\"\�0�\�e��\�?�<��\0e�����e�\��+\\3\�\�c84���4�E�!�\�\�]\���d\�#\�}����\�\�\�\�VS��\�?ڸ\�P\�Ǔ\'B7�;���s\�ƿ\�j�pI�\�\�\�`\�q�\��A�\�6\\�/�3g�\��\�E<0nT\���:( �8\�#[\�U\�1\��V�M/��\��\0\"\�B��\�1�%��\�\�^N%\���\�I\�H�J~��\�cВ~�g���,��648x\���>/H�qf�)\�Dr\�`�ͪ8�<\�\�LWt�gp�j�!�,͒fd�2Q���\��\0Nj}W/\n<S-=k,\n�O��u$\��#Ć0C#\��Vx\�r3`/ʯ>C�9{C�Dq�\05�\�\"\�\�F\�D�1`\�\�v;���\\\�D]E�|�ԃaI�^^�H&\�DgH~\��W�~9gI0\�$\�\�*Z2\�\�c�@i�\��\�\�Ә�z=G��h\�ei�M�\r\�b\�K�^)nV�\�\�ןݐ\����\0�ܮ\�?N\�\�h �y!\�[3-��C���֙ ��Sh��\�\�4�Q�Y0\�\�v[�P�\ZL�\�`�y�\�K\�=�\�4}J=S�Ft\���hX�\�}�C\�\�ر�87ѐ�e��{\'\���W8�՛��[)�\ny�=f�ҘԤ?\�LțH\�\�/{1�\�1RA�\�y^@ +\��L:	LIK\n�A*\"($�\�q%\0��Q���V\�+9��#�\�A�7N�q%8yW\�{_��`�#���V>/�8͞��f)]�\�a���i\�\�`\n�i�8��E=<ϣt��\0l��5&��9\�\�K$�I\� \�\�$��\�|�f�a�d ,�\�H\0#\�f�����F�-t\n��1�s.s\��j�I{0<���چ6�y,���Q�5\��6ş\"�\�OOH\�>��ef.K�\�\�\'�\n�\�\�\�\�\��E�\r�\�\�}\�#H��\0��\0��u6\Z\�\\��R�������\�,ǌ\��4\�\�΂07/\0/fc\�Ӎ������\��D\�\�KD��!$�y)h��~$\��`\n��{��\�c�\�Q\�\��s�\�?�g<�{\�\�:}=7zF3\�\�b=\�X\�\�\���\�\n4�>*8�ר�\�#T\�#ʳ\�:\�\�\�\0\n�\�\�\�(\�:\��\�7�;\�*�Fs�\�U\�@\�\�q�r?\�.J�0�x�ӑ\�*\�O�\�#��\� \�K���Dh��ra�b�rb�j;�+\�\��aB\�\�\�fR�G>9\�`~\�F(`!��LJ.����Ai3k\�}τs�M�L5�Q�#�Qȵ]G\�G\�\��\�ӽ\�^���效\�\�.�tG[PSs5|x\� 	\�\�͓�0J2KA.����\0��{@\�oJ�Kbe�<\�I�%H�V�7MԒ��\r��gZN\Z\�|��P}TD2\�^����`��y�PQ6�\�3r\�a\�\�=E�ױr$\�Ǌ<w\�:\�t��=�s\�m\�\�	��\�\�VE$nle\�\��KE\�f�fA$\��22\�	+\�U��\0R�\�]�\�c\�\��)3�\�\�v	\�\�u#\�+D!g\��\�G\�A\�i<\�2��U�����*Q��aG7-0\�\�j��V\�\�9�6 ֓鵪~%Α�T\�x\�1�����wl�\�\�;}1<\�s\�\�Q\�|Vcm��r.�\��\'�L�k\�,W\r\�\\m\�ִ�4\�\�9$dm��L:n&��\����Mx�񬳱{\�s/k�6U�0u���򷱞\�&ݔϑ��hUF�\'$r?\�ZU��֕��yS�_\�T�+	��6��HITiA\"\�\�\Z<\0�	IK)�$DQ�WH\�$@$��u\�\Z�<������0�t=K��2\� ?*��\�Ǖ\�\�\�\�G�#\�Ó�^dG\�>\�\�F\�\�F	Ocd1\�Y|hfat&�;>��\\�\�>f\�I����k1�\�\�\������d\0�h\��2\�\�~U�	o\�X���fY8/\n|\�\�ǘ\'|«���f�,�\'\��\�\�6�j\�U\�^d8x\�l�a����f�xQ�P�+M��d�\�R*��;6K9�?\��$Zvqn�!\�P�:8�H�\�5\�>�`\�x�A��[_,���\� f��\�b�̌���ԏf+�9\�\�\�x~1���9C�\�\�\�\�I���7��S�N`�[\�\�\�\���\�c��\�+\�\"\�?�k l�C�a��5,�Lū.5\��m�\�>JZ%\�d�\�U��\�\�Q\���\�0\��<,\�w-Ƈ�;��\�	��8wE\�\�238�|\\`�\0U\�@my��q��\04�\\7�^g/JF�E�2(��##J�� 7��2Rc�\0�)\�\��>s�~�VC��\�(e\�Sx�\�RJ��\�WuۄgbL\�W��\����\�?>�ǵu�1hН̞�����}�Q�\��z��S�d)�+\���MfAՌ��*K�\�`=��B�nn\';̐Бc�\�;�\�1�Z�\��>\�?�-Hc�\��rl_\�s�\�3VE+\��\�/%�BNfAB\�g���M݀���	�\���N͐7H�\n�EPԒbw\����/\�B��+/J��	<�Q��\�F|�\�\r�A%\�\���zo1�i�c�3<\�h���I\� *\�2j`op��(\�U\�繤>[7tbL�)\�G{��\�_\�;&0Ci_\�}\�yM;Oa,�;)Z\�\�z��\�$2e\�c2n\���n���&�<s\�i��\�RǛ#�z\�d2/v\ZC,\�y\�Q\�8b9�\�\�1�e}�\�c\�\��Zg�\�1\�\�\�\0\n~;y ���tkÏ7:T��7�@�\�Џ\�\'�0��\�$ml�%\\x\�T��O�Ri��b�?M�:�I�E\��)\��>\�q�-���\�f�/´�\\<��43�GQ�g�:޲\�69\Zy�>h\�\�\�&��8{�<�,}I�͛S�X++oֈM�yc�\�4iG@�(�!�}?��{\�\�\���\�6���*\�x �\�I\�\���e-O��\�Cx�3\�I),\�`gK<HǠV*60��\'\�;J	\�\�v鉈\0Z�`�i>P\ZDRQAHJ�(v	6�:H(��\0A:\n�[\�\�)ɾ\�\�#\�G%�J�qȫ�m�\�$>�V�$q݊s�\�2�X\�C����c}���\�Yy=z~�E�I��|@ov�Z�/V1�g��\��X\�\�Hs���\�\�x\\��9&\�\�J~ae\�\'��\�\�~���VGR\�!\�\�X\�1s�$.a`I<�g�_[m�.��r�\0@�\�H\�?\rg\�\�}ʗ�\�>)�C< \0,�\�4�ȧ\�}\0S�\�Nq\�\�[3\'�\�!M�!o�?��Q�����?e\�\'@1��\�mYhl\�kxl�\0X%`��35� I��,\�오��5��9�\�ad\�۪�\��l\��γ�9=L,F}\�4ct�?:3��2 w��]<k\�\�i�\�\�8e�\0:gu\�\�\�ϱ*Dr\�?Z2��;?ᬰd�!b�FY\��Y>˾\�(\r��a�#�gʓ\�\�\�q^�a\�\'�gN#Ev�L\�F��n=�]RN����\0H\�}���\�):|?�{�JJӌ6#91cg�3�?��ٌ�\n�V��+�7v�:Χ�\�I]_�w\�/\�u5��5Ҥ���\�%�1��O\�{��I�_\�IH$���\�\�נּV�\�5�\�yk�\�;���\�\"��}So�I\�ƒ}����\�,\�H�hY\'`6��\�\�\�:�qZ\�@y11�\�\�y\���)��Fu�/�5�	���lL\�a���L~FN�˛�9��Y�K�14�\�\�\�\�\�\�\'��$��\�cv��\�f\rA�\�u7g���,s1�F~\�O�\�0�\��coT\�󚽭7<\�\�Tir �^iVj�Z^�\n$�\�6����` Z��F�⊯/�d\�\n��(�\�\�L�\�\�*�\�\��(\��\n�73�\�\n>N��*Yr\�\'ur9�}I~G��>w\��\�0&\�!\�\�I��*D�̥?~S\�E�\�#\"ph8wX�K\�d�$����U\�jVp\nb:S�;�\�\�Z\�\��$2(�ݞ\�\\\r��f��gh��b\�>2};�\�?s�\��\�\�c����F���\�ߋ��\�o\�%*\�\rcQ�7\�\�0�\�YZ\�\�a��\��\'R.\�-�J@`�\�hq�\�-/d�ؗݭ~�\0��D\�\�${���\�c\Z��a{$\�~C\�\�\n\�@\�suK-�=1\�z,\�sɥ´3\�M7��f�\�\��yQ\�G\�i_S\"t\�\0_��\�_\�\�ć���\' ��a\�\�\�KJ���8� \'	MF�HR�J�ع7iV�\n/\��Z\�QD��\�M�\ZH( �J$F��I@*ڂn\�\n�μ:ƍ��\�*Ա�7��p�\0ɢc�[Sr\�K\ng��b�\�|c�2@|�,%\�\�\n�c�\�\�I&������g\��$\�`�\�\�<��\�O�\��\�68\��{���	�e\�`h0oB\�\�d\�\�\�^\�y\";\0�h���>s\'�\�\��\n\�\�\��q%3�-\�x�m#Ϻ�\�\Z\�\�\�тa}	+�\�uى�|�]F<�\�.�x\�\�\�kU��Y�W7�r\�j0o��͒�$\�Q��\Z�E����h8N>�\��YSU/;?ԕ�\�\��ج�np��PV���q~���j\�0\'X18�\�8\�_�q^v�?��w��\�\�.1f��\���b\�T\��HN*@$�f���vP\r1g��7��dCњ\�\�g\�Z,\�\Z\�ӱY�&p�\��\\�\�yU\Z\���*�,ܗ\�p�C\�p� ��9:���\�k�\�E@�s��,U���\�>\nLyI�YF�ȧ1$l�1\�0(\�=\�\'�k�\�a�}�8�&91ac<\�\�漿��\�©��\��y\�\r�\�Guܟ�\�\�f<1dx\�P�\�\��Yy���Wz\�|\�2=�3_�,�\�\\e�G\�c=g��o�ӹ���L�����{�˔%g\�\�\\}���yY��3v��2&\�a��\�E�\�\n�/��p,�UY\�vL\����P\�Ϋ�g��n6T�▒\�\n3�Ѯq\�\�3\\��\rڤ~\'P��#\��o%>�\�N\�\�\r�\����}L��I�\nN��U�Yj�\�I_\�Z[ !�\�\�\�\�1�h�)�$䩱\�\"<z	Ν,\�i!�)��%ܟ�B�c����{(�Q�gҽ�gZa�nE,H�\Z!f\�\�$�F\�`i�\�t�ʑ�Hv�z+\�-��\�0��iN<p\�\�(\0*���|&�\�\�2G�\'+1\��\�@nS\�\���v]�U����\�\�:��2a\��\0�6īm[\'\�4����#%rd�\�m�)�\0�5�&#\���G���I޽�~~�\�\�M�:��\�ڦ�\r |�I+u�\��`㎀X\�\��\��2 \�\�4��\�>\�N\�\\��+t״�\\\�\�?��GԀ���\0�D\�t�Yǳ�WS�\�T[zr	=0��Tx_��e\�\��*,�\�hYE\�0�@<\n;H)\0d�Z\��\�Q�� O�d{$��HA���\�@�PVy\��\�\�ӣ���\"B�\�?�|\�\�,&D\�YBH\�wgDz��_\�\��K<Q�l\�k���\�\���7^6A}<h��\�U\�\�ʮ�&w�RN�Ǳ��H\�?�Q�\�cQ��\�1�426\r���@)y�2W�õ(�i=J\���\�\�>[�$d\���l5<�t\��䛞FHn�\�\�R¨Y0c�����*\'A��xO;yQ��\�/Q�Klny�\�\r�;Y�\�l�l5\�V��W�x\�\�W�f�� �.+S��dfDy�v�	\�0�첹S\��\�8�,#�G�I��\��3\�F\�\�}/S��^\�E�i!�\0_!�\�\�b��,ʮ�\�buD\r\Z*DG�Ô��4�9�;���\�s	(%���36�3#\�\�\�<w_�x�|\�yr\�\�\��a�>\rÌ��\��[p�\nXN$i��\�L��\�0z�?R��6g=���\�2s\�\�l�LJӐ�G�\�0\�@�ɽ�N�/5�v�#˶\�\�W1,=�_>y�\�s\������6<frD)Sd\�.\�\�D�rXKI$��\�iN��Eg��\�	ܔ�\�����|�1(\�\�;��\�!��(*��z�\��<\��\0��\�\'�\0���\��\�j\����%�y�\�q�1qV��\��ƣg\�G\�m\Zd�j#{p�\���O����\����\�P2})O�>ʉ�.5+g�\rl�^\�i�ϝA\��R�\�?�eذQt�\���\0\n#\����\�\�op��cp��\���\� ����`�\�\�a�\�V4\�	��\�>!����\0u1�{��g�}F�\��=����M2�\�쭣f\�EC\�\0+h$\�yQ��\�x\�Ul\�t0�2A$�\"���`�0�?-�`�dT9\�\�ׇ#\�߻�S%�;)\�l�\�\�\�\�ʪ���JC�S��s\�^\�c\�.*S�D%8��p��ΟL΃!��C!x}���3���X$Tq}oq5�-]\�l9��\�g�.\�楁�u\"q�`v��uw��K\�u6\� *��q!�����p��|\�*\�L�&�\���lB��\�!2O@@$�.�\��^�4H\"\�\"�M�%~��/d\�FR\n\0�$E\0�L<ѭi��\�P���\�[���2y@, ���\�[XǏ;���=z*\�/&w*O1C�\�ZOI,���#1�iQ�G��F�ZϨM�\�q��oS��J�óE-O`cd\�c�h%\�IT<O�&�\�1��4l��-\�Q��\�\�\�נ�0\�\"\�q�\���d���\�g����\�q�\�5�8\�dG�<����G\�\�k&$���f�Ł�c\r�\�NV�</|l�9�Q�\�8�=�?\�\'�\�ŧ]GG{\'��6$�\�:�$�\�R��܇�g�l�Fؼ\�\'ױX��^t�\�֞:\���>g�\Z$�&\�+)�����X�|\��#6U:cizp�V\��9�e37��ӏ\Zw��G\��\"\�]Z\�`��T\�4n�K\�a\�1\�\�\��t(z�w\�GL\�W}!K$0VS#\'\�21>h%jd,?r�o)���T�6d�y\�>D�6��ϭ!�\�4y\�$��d6J=Ȑ\�*�I~\�\�\�=���\�G\���.�wO�۹L���\�\��~�\�vCB�\�L�$O[\n\�\� ��\01\�&ߕ3\r�*\�|b�\�\�p�����$>^Y\��Y\�_�%t珐�\�l^�ʩ\�s9\��Fv!h\�=�\�x_\"LN�F\�ἲ��<��k\�ϲ��w�\�H�\�Ut�X�\�T�\�JZq&6��G��&ʏ%z\'�\�8\�\�wc��R���#i9;\0�q\�<���z\ZS莉$۰QM�֥<�H��\�G�ь�Է�\"\�E\�T\�t\�e���o\�6>H�w�\�u9\�0�cc�\���\�\�A�!Q��� �C`H�r\r���]\���\�\�\�vS�J\'f\�\�4od[P#�6!h�?���^\�5�vJa5N�R��\nؒ�V�1#�Q�|\�\"S�Qf\�+5J\0��W\�\�\��I\�\��\�4�8���11�|�<\�G�\�iY�e�Pؑ�>3\�,�5 �$\�G8\�\�y�x��\0\Z:�@�@M�\�\�f��\"�&�\�	}og��\��\'Q#D��)6�+�J\"IH@�	%H?\�H#���h*S�\�?�\�q,��P�~��i�k\�\r#�qx6{\�JG�^\�d�0Ŏt\\\��Z2h��:G��c��,�;��r����3�/\�]���\�?\�b�\�w\�Z k]ø�ρ�?�C���\�xf*ұ=�ʜՂl�5�t\�#c|d0��\�\�Y\�m��玖���\0H^�$�\�4��y�23\�e�\�\��\�\�|\�0*\�Uu\��\�\'�4\�w\�FZQ\�\\m�\�����\Z�s�b��֜��k�&\Z�\��,�l�@��rG˩GNѱE��N݂\�ޞ0\��t\�p��r�\'2ګeW�\n\��]\�\�)7d�#�\�\�\0l��R\�e\�l���cz��\�\�\�~6N\�\�Az@�\n\0��b\�g�nQ�D��8\�$\�a\0 ���\�\�,�\")�=h�\0\�\�\�w\�5�\�`\�\�\0Ϗٟ\�\�\�8Oӵ(�\�VX�L�OU?%�@\�\�~B<+r`\�ƺE  ���Y\'\�\�\�9|��\�R�O�>�\�z��|���	\n�}\�\�(1� \�b�\�,\�\�zӖ#�\�\�f���H��\�\"�&8�\�\0\�R#�\�\�M��f�r\�2�%\�l�UH�Yf\�n�j_!H1�\�dG,�,�\"]La{����\�_<\�;\�o@�׮\�.\��kC\�\�\�G\�Ml�x\�^�\�2�\0�2���\�6��^�<}\�\�\�|�J/�D�����co�+p\�գ @<��\��!\�<�����n�\02�߀\�F�\"��씪�G@�p��\�E3`\�@�.����@%Ja�w�\�o\�\n�OԜ\�\�����t	{>x\�wa�t�f|*.?�\�?�\�7cł�>\�Ov�B�Q\�\�e\�q\�3\�)\�k�G!c�c\�;<\���:c5*,=��\0uA�B�N|oaO��	�h�\�@$�J)()�\�7�B�\��A\'d+\�\�\�\�\��Q��\�\�V��Tq��/TǹZ\�\\\�\�d\���?\�c�J��U�M\��\"F6 �:��Ξ%s,�3\�w��lt�c8\�\�q\0~p�3;�WR�����FE.�ð\��.^�ކ\�Ha�q�@�ͦ����g9�zt�\"\�\\\��4I\�\� x��o\�\�b���5\���\�\Z2;Ok��G�\�\�� c��\�z)G��\����\�ԡc�\����JaL3���Qʐ�֣\�ȑ�z�L�va*���ˇ��Y�_B�p�\�	R\�a�a}\�H\�:xU�\�n��\��9vSܟ2�V{��G������䧹)�aQ�\�}]JS\�\nd�Oؓ�@gnS9������۰MH�ey%\0\�d+��A�S#\�\0%u=$��;�b\�\���	�\��OH\�\�ث{a/\�M��`/��&\�\�p�ʬ�J�ߦ��\��\��\0ALǗ��!1K\�9�Y�\�1�X���E�,�\�\0����Xg�Wf�͸z� �daE��Υ\�gI\0�ǎp�6�y1�r\n\�,wa�z\�_L!T6H�⿼�1^�N\�.ߐ(�9��\0�k�d	��� 绐\�\�3ӵ_:\�ŵϟ�\0C\\��D��bS�`\nD�\�+m\�%t�\0��]Xh����s�\�l�A�\�\�)\�cܡW\�W\�tI#�\�~��\n\�R�\�R�`\����Q\� �\�؃\�e\n@\�t	\'m�B�l\rDI\�\�\ZN�M\�<1\0ا�c��n\�:\�e\�lۤz�C��SA$�`�)`mhV\�q�@�\0x(\��%\����\�iUJ$\��N\�\�\�$vR��n6Dõ#�\�&�A�cv$Cp\�=\�Gt�~Aأ�E\�\�Q\�L��,�0���m�<촘��6H@`�Ya%ZN\�ml\'d��9� �b�e�,\�#x��#\'oe�\�\�I\�(\�mA�RQ��\0��a\�ޤ�u��H\�)�v)�\�\�Ǎ�-�\�r\Z���֙��M\�\�\�e� 5C{T	\�\�f����L�d�I\�\�-k	�ʸ\�u!�>W\�!x\��Qq\�4p\�ƒ\�#\r\�H+,�e\\j\��͐\�c��\"�Q�;A\0U�����I\�d�\�o��\�\�>��ܓs�\�Ȫ\�ƹ�3��+�i,�\��Y\�+�0�l��H�yq���<lQ�+w\�\�h�Rc3Kʓn\�\�\�2�\�Ѯ:��\�Y)6�(���sR\��&^���f6�=\��#V�t�3#S|�\�h%�\�]�\��0�\�Vl�\�\�Š��H\��-�\�]������|���H\�e���\�\�Q�\�N\\����W��L�\�\�lS�f�\�����v|�(�X�\�\�&�Qx�~�T02\�.0c\���)f���`\�\�澔ow��n\\�y�BM��x�0`i\��DO��5z�>y\�\���\�<�\�*e\�b&[\�����у6\�xV\�?\��T̴N\� Гx\�\0�!y}�\"{ �n\�\�f\�\�\�,���$HA=���-;ZV\�ob�$��]�\�	�7�p-- �\�R*<�\� �=�A8oa=\�\�ɸVO��{ ���\�ϯǬfҺ��xde+�U�%?\�)\�M *9\�\�ߐ�y4\�N\�\�Ԭ\��J+$$� �4ܝ�,R_H�`v	\�����`\��aV�!\�\�|�=�$\n�\Z\�\�zK�\�%�ty�\�L�p� ���*\�\�Rv�\�j��`\rH\'\�(g\�\0&��[���`�\��\�nKg��,\'?ʑ�ˢ��v4�6z\Z��#\0 �#.6\�i \��l-+��4��\�@\�\�M\'/���fI#k�BO���E�\'d�\���ȀR�M}\��\��~��dD\�L�X\�IF\�d���c��\�Ĩ�\�\��V\�N\�8\�yw\�TVH\�\�e�i\�$�����\�\�d�\�=��\�I)8��&ި\�h$[}GC\�\�Ɯ�=���i6�nmևvA�\\bUn�X����\n�Ϲq\�\�J\�Aj\�����0z�\�NE!�@�\� \�\�;L�\�\�\�B�Sru,���$\�\�%J�6x`t�FF\�\�]~\�\�\�\�\���0�Vl��	[\�\�L�<�t�\�7�{Zix\�|\�\�ʀ?�nJ\�FC�q\�\�sidѳj\�\�{I\�FQ�48\�F\�\�4I\�^��d�Yk��krk�{F۪�*\�+q\��8t�=\�w>\�h�1�ϥ\�N�9 \0�0uL�|F\��\�P��Is�ʖ>I\'\�+\�_/�tVmU��t�qϫ\�Y�����\\��\�ز@S�]W#�\�O\�\�4�@\�䘎�4}E�1u8�@7���ft��O��\�\"��22f\�5\�{�䒯�\�>A}\�-N%\�4I+_�2?>U`a\��\n_ �7�R:q\�`Y\�db]�P^H?\"�;�zҋ$�ځH\�9C7�L�\�r\nS\�^wI�\��\0��\�\�Hf㘠�M�񛣠\�k�M��\�.r2�\0\�;n�bJ�\�&�w�D\��RI�v&��|�ܤ\�(!0\Z�\�v_:n�z\�(>\n@���\�(�B:	7�Sd>@9\�vy)<���&���j���|\�\�\���%Ԉ�kM\�\�bӦ�)0I\�ς�\\�J\�͔\\�-`�9ǲ�)\�\�̛��@#���m�\�%\�\�=\�R|u�P\�ͤ\�\0�ҭ�\�\�\�\�*\�~x���\�@]b\�\�#Z:H�3�P�\nר�\��w\�<�d*I\�\�\�8=*р�6S\�\�A{\�E\�;�\�L\�*L{�[�y�	\��i�̅`���l���#�\"�`M\n\�\�^X�\�|\�`���\�<���$�\�b���p\�^M\�\0��\0I%��\Z\r�\�..&\�f�\'z=֤?�+	δ\ZF�_P���:�)���\�w\�4,���<\��\�y\n�%��Q6�P�,cE��P\�-ks$\r\�\n5_�V\�\�\r] )\�&\�p \�/IK��vHA4H ,�8���\r�]G�Ա-SWi���\�6�9�\0�\�?��*@�x��\�_��`Wr;�+\�߆\�|?\��?�^Zf\�\�\\-��\\7�\��\�\�\�r-MT[j��\�\�J�1�;\�ǜ3�,\�¡�/�12|H\�E�i\����}�\�T\��__�m\��W���I�.\�)��d8I\�\0\Z�S	�\�t\�\��{5��r�\�\�dy��\�	\0\r�p�*L2�\�G����\�D��@G�\�\�DxN�F��*$�3}\�\�H\�ւl�׭��v\���O%\0�\0\0!\�w��	�ZJ29\�\� ~\�\�\"\�d�\�BF\�(\��%WP\�΅��hP	�\����̊��\�4\0�[�;�>�$ܠp_�R�]߀P?=\n\�\��\��Nl=w�@\�\�b�\�\�@ᣲ\"\�{vN>\'ݳ� ��b\�\nH\�\n)o\�H��dJh\���,U�\�=\����\�(}Р\r��ؤ)2y\��I\�\�n�&����\�\\}�\'3YX\�t��\�H\�\�\��A*p�}\ZةF#����\�FU+BI\�\�W��\��)\�\�\�웢\�y�@��\��\�@I۵m�\��4\�,$Z\r\"�HH�V\'\�K$rU �Ő�Ȝl}�?\\��2�\�\��G�Q\�}6Ͷ�eH+\�\�!DvtݟKB�+d\��\�}�b��(Sm�(�\0�\��=�\�=2 �\�~!$�5A\�-/0\�!l���\�<\�r}\�T�$��8N��y\�8B ��%\�(\��  ��\��}?9�d�r��[�MK\nW�SJ\�0\�\�\��6�;�,�6H\�ewY\�\�\�N*5Y��I���`\�.��XL\�\rb���s��fF\�\�q\0/ca\�\�dq�\�ፇ\��t\�Y�`bA�\"l�1�ݹ\��c\�y+�\�ǽo\�\�z�\�aI	5\�	+\r��E,\�	\�l��[,s�\0�i��\�x/\�\�\�\�f\��J(O\�%fG�{m8\�4X\�܀�8w \�\�+~q<7\�\�Q\�8\0�)����Q\�yNI!��I*��Fe;�r�\�`�=��\�9$���tL miן7���<�<#\�\�\�#��F�Ey�Z@ ]\�\�\0{�\�]�@�V��\�6��d{�\ZA���?a�\�\'\�\0�v|� �W\�l��\�4@���>㻐\���{�H��{�Y�G�.CE#\'r\�B�:҈߹��\�J@�}\�y\��\�tvt���\�p�\�\��\�\0���A#��w\�\�? �i�\Zb�H\�\"\� .��\�J\0X\�`�O7MI�vEܠ\�\�}�\�0�	�HH$\� \�l�2GSEW\0�w\n؎�-s��e\�Ǜe[LS\�\�ձVћ�L��gkI�\�\r��/k\�ԡ�\"d�q{݅B\�YtU��\0\��\�\�k\'� E�\�n�\0����\r\�.\�\�\�F^N�A��>\�y��͝�\�!e���\�\�6H�R?BWS\�t�t=��\����iLM\�PR����e�\�?��Ϸ�@�\�\�\� �me���S�\����\�J;\�R�&UJ\�<!��d�*u(�}e^7�]�p��\�g���hӷ�\�]\�\\�iر\�d+�\�\�}Ji�\�v(A$���V}MO��\�b\�7؆\\nf�$��\'\��(��bwE��ϘOR�ӿ#6	�\nN��_\�dD0\�ވW\�fA�bx��?p��e\��)\�s1�He�Y�\��f�)?�Ctf&	Sqꥰ\�A�P=J\�i�\\5���K\�)\�����ҥ1\�5�\�{�9\��\�n�\�8\�G��_���2��>�.�zd\��B҄\�o|�ы\��ި,0\�ӧr�6@]$rQa%�5����Ԟ	�\�lU�֥�)ߐ�l�Fz�UG�rfcG��1\�O�L�\�d\�zl\�~���>v.�/�\�x>q&�wa2F�\�ҸHd��ͩ\�(�)@��绐\rH~\�F&�>\�??�y\r\�H7`�.�(Ͼd�M���R�s���J�t�]o\�\�p�׹F�#}�,X;��\�ߑ\�;Y(\��B7�\�	�\�\�,\�ò�N\�{\��>Q\�OTѰK\�\��\�\\\� 	;x@y���:8/��?�Z7�������\0��҉\�n\�ܨ�Toqcr�`���\0�4wMh윑��/�4@bɽ\�I�g\��i\0\�\"@&��{\�6pA�\�\�\Z�FA�% U\�P\�.�6�	\�\�Š��\�\\\�ԑ��*�>~bU���\0Bj�V�6)x��\�I|A�L\�U�R~X;�\r:�r\n*<�dBG��PK@9�V_0�e�Z�\���A\�\�fs\���ސqc��FL�6�\0V;*nl�y�\"�(���\'���c{\�?��.��}\��\�\��x �dM��6\�߹DF��]\�	7hoʃ8$G 0\�\�?\�ӱؐ\�\�s!cOpЂF.SdōޡF�J.Q\�\�ӣ\�5j!\�\�a�ANV�3�M\�U�\�1�0�\\飼���8?x\�eb�U\�~�)\�ؿ\��\�\0\�]�6���C�\�3\�4q�\��_7\�O�B\�~L�\�*�掻�Re\�\�*푇�t�\���\�k+�JS���( \�)g�6qv\��\�\�WL�)`\��@��\�aĚBWz�\�\�R\���H8�Sya\�n\r��t\�k��Ym[��FG\�\r�\�e\�\�bGDϐ�$��\0�\�u],j�ܗ\� \��\\�\07\Zl\���H;,\�$\��\"��;П\�\�<\�b\��K���ͮ�#����/��rK\�YR�y�P��\�\�ʔ�\�Mw\�E\'\�9%o\�D|�If\�M\�\nId\0�?r�,\�lI���v;��޻!�\0!m\�h�	\0w��#\��\0 �H{\�|�-\�]��$��[\�\�\n���T@~�gt7�N�ۄ\�\���\�P�%Е{�s���\�{!��J)\0\�޾\�>ɲM%�p�w\"\0�P<\�\�K?\�H%\0\�턇��I���^M��\��Ro�jѓl�\�\�W검E���\"\�\�/œe \�]��H=�@\�\�\� �O\�HY  ��\�Zo�\��KmV>�>�et�jG\�f\�V��3\�}�<��\�g�\�\Z\�\�\��Q�a��(7@�w�̳y��;�����C�r?*\�<%b�\�*\�H̒>g�(�d� m�O���\nc[\�P\r\�\�*�b�p�\�\"2~\��KM��ݐ�@�}�JHm\��`\��H�\01F\�PKa���Gw%ښ\�.`\�lp1��Q\�A\�\��4��5�2�ʭ�*|���-fkW\�jX�Rz�z*\\��俙��&@�dZ#�\�\�\�ޜ\�=��d\�l4�Y\�\�\�9t@)l�!IL���\�\�筁4�����)f8.��\�Q\�q\�w\�\�\�?����_$=<{��b���K\�2��\�##]: V�c�@�m��o�$��L��0��\�z.6��\�0\0��O!>\�Or�{\�\�^K�i\�ic,�I� �����ڳ�\\w��\�:W�\�D��\�<\�J� R\�~E&NO[)3\�,\�z������QI���)��#t	\�7vl B�M�}\�2C\�Ħ��@����~��׺JڒP���v6ot\�X\�EtR\�(�@\06{R\�I�	?=��\�	��?/\���P<\�K\�ʠ���ъD\0	&��SI\�ЛzP�+d�.�B\0\�I\0\� �Gg��E{(�]��%l�M\�Ԑ�\�P4�I8\�\�\�\�)}�=\�\0��\�U$�\�\�! �m�K �?p�^	\�8=O\0�Nyf\�$\����\�H6?�n\�$\�>\�2\r죀�}\�l�4�G\�{&.�\���\�X�|J6L@U\Z*\��\�\�\�\�c�:vw$X@1\�\��O�ڻ�/���؍�W�\�A.�\��b6Qg��ʹ�\�.\�\�Y\�RN�$}\�3�z��C\�l��4��\�@�\��S�)�\�dYM��Y\�?��$�������G�`���ؕ*a�\nbZMl?\�z;\r��Q\�@ȁx�p�	�@:�$�z��5R���PB�U\�R�u\�\�^~D\�NI�\�%_���\�\�$Q��f\�<&�ƻ�89;\�K10\��$P�\��\0D}v�\�>��Zt�@�/��C�\�mĽ\��GP\�\�?\�/a�Q`\��F�\�\�~\�\�\�/��\��e$r%�h�=�8J�\�>�\�0�\�*�����4\�}1cW!\�\�\�_\�O:p(юrT�\nL��0?\�\Z4\�֕�\0��\�q�2=6qݒ+\�I\�rxxY�\0�3����;*\�\�\�\�ɽ�U�\'\���;]��W�Ky �\�G���\�h8t����C�H\�\�	L��}R����v���L�Y@�|�s\�9\0z ^)�\0T\�5\�4�=\�r��\��6JB�K=�M|ԋqؔ+��^l�;y\�Ga�[��\��QwG\�9~�7\�J�[n�J�\�\��A\r�*\�\�;��\\�^���m�woB�H)��ل\'��&\�m�BC�-�(��\�(�(�� $U���6P/�PD_�\�|Ȭ�\09$#��\�\�A�!a��>}�M~�\�%�*���>=��\n�d)!\�J$?�B\n!\�%H/ea,����ɂ�cd\�\�E6b3�Z\��\�@$-R�L\rƚ\rB2Aa��4\�<, �(&���wY}RA.\\x��<\�G%t?`�A\�#:y\�\�b\ru�Ln\�\�L\�N^\�Na؎\�i\rL{P@?\0C\�RA琐\nl\�d�\�\04�\0�%1\�\�Ȅ���\0�Nc�H���a�\�N\�S�_ M�P��zP`f��a��l��%2�YE M8 vAL���\�1\�L�샫\�L\�~e\�\�,\��\�	\�\�\�/	ޚw�j\�E\�\�4�\�ݒ\�)\�FOd\�H�\�N��8bU\'�Hr)\�I���v�\�>A@\�.�0\�|��|�\0>\���\�\�S㈄��KR��\�,�v{�Q�a�\�@2��J�M\�rYaǣ ��21�#�o9*\\Vl�#��G\�J@;(\�\�Rp&~>���1�\0\�\��$�\�؏$\�%)<Y\�p\�[}:�\�\�:�8�}�+?��\�\�<��r�2\0�V�2Y�\n�SB\�\�R܀Tb�{�$>Mn�2(�Ϳy�#7{&�� ���\��\�2\���L��\'�*EH{�z:�\��ɢ<�\�g֊L�\�6\�UD$\�%��\�p{li�0�����\�\�؄�����#�\�pR��J�B\n#U�@\�=B�ߝ�H�BM�\�\�jM<^�\�\�9\�ה�h4Sd��(x�SRX��#\�So��}\�:	p;%u\06l��t̏ސ�\'k\�A�f\�CT�D!#6�\�nSd�R�\0�(��%\�\0\r#5h�x@(\"�\0CbSFJڭ8_�bB)\0\�PA\n\�\�\�K\�<\�\�\�\�e-Y\���x\�lŝᬳ\�\�E�j:a�{\r\�X�<�&����m����\�!=��\�\�g�ܩ\Z\�EiQ\�\0�PČ[#쀶�|p�\��d�VY\'\��iUA���\��NJk\�5l69\�~\�\�`\�`H�\�\�O �\0t��\�\�(e\�W��0��T�\�&\�a�rS��#\�w4�m�Q��a\'�(\n:\�d��&o\�;%��B�d�5M����\�AZ�<\�A�u`�\�*\�c�/Ԃ	*�E�dAfJ6}H �p<��h<m�X��C\��w�}eJ��A�Ϡ\�~\�`�A��\�e\��ee�%\���8���e�5�\�]K�Y���N�WI��B�\n\�>���>�����h��\�z3����\��#[\�\0>��h �(�lN���8S\�HA\�R�%�H9ݠ�m2\�P��H ��})�@\"\�$TA }.A\0�\� �\'\�Mw\��v)�rz\� �L�\�\�em\�/�TA-�o��\0\�bԄA$j\�wLn�c~\�gOԥ����$\��\�\�`���F�;5H�@�ϥ<;���A4�\�'),(2,'Gustavo Ricardo','Vallejo','Suárez','oficial','plantel_aleatorio','curp_aleatorio','rfc_aleatorio','cartilla_aleatoria','pasaporte_aleatorio','Masculino','1998-12-15','mexicana','Ciudad de México','Maria Julia Calatayud','rfc_aleatorio','Pedro Miguel Silva','Arantxa Rebollo','C.E.C.yT. 9','físico matemático','Ciudad de México',10,9,''),(3,'Agustín','Carrillo','Aguilar','cadete','plantel_aleatorio','curp_aleatorio','rfc_aleatorio','cartilla_aleatoria','pasaporte_aleatorio','Masculino','1998-12-15','mexicana','Ciudad de México','Ricard Sevillano','rfc_aleatorio','Jeronimo Gallego','Angustias Ordoñez','C.E.C.yT. 9','físico matemático','Ciudad de México',9,10,''),(4,'Francisco Fernando','Escalante','Sánchez','oficial','plantel_aleatorio','curp_aleatorio','rfc_aleatorio','cartilla_aleatoria','pasaporte_aleatorio','Masculino','1998-12-15','mexicana','Ciudad de México','Jenifer Grau','rfc_aleatorio','Aimar Roldan','Rosalia Pons','C.E.C.yT. 9','físico matemático','Ciudad de México',10,9,''),(5,'José Marcelino','León','Santiago','cadete','plantel_aleatorio','curp_aleatorio','rfc_aleatorio','cartilla_aleatoria','pasaporte_aleatorio','Masculino','1998-12-15','mexicana','Ciudad de México','Gael Garrido','rfc_aleatorio','Josep Alcazar','Maria Amparo Collado','C.E.C.yT. 9','físico matemático','Ciudad de México',9,10,''),(6,'Pedro León','Álvarez','Alcacio','oficial','plantel_aleatorio','curp_aleatorio','rfc_aleatorio','cartilla_aleatoria','pasaporte_aleatorio','Masculino','1998-12-15','mexicana','Ciudad de México','Veronica De-Dios','rfc_aleatorio','Manuel Antonio Esteban','Laila Pinilla','C.E.C.yT. 9','físico matemático','Ciudad de México',10,9,''),(7,'Juan Manuel','Mozo','Spezia','cadete','plantel_aleatorio','curp_aleatorio','rfc_aleatorio','cartilla_aleatoria','pasaporte_aleatorio','Masculino','1998-12-15','mexicana','Ciudad de México','Jose Rafael Cervera','rfc_aleatorio','Joan Paniagua','Elisa Checa','C.E.C.yT. 9','físico matemático','Ciudad de México',9,10,''),(8,'Gilberto','García','Campante','oficial','plantel_aleatorio','curp_aleatorio','rfc_aleatorio','cartilla_aleatoria','pasaporte_aleatorio','Masculino','1998-12-15','mexicana','Ciudad de México','Montserrat Palacio','rfc_aleatorio','Ayman Vives','Maria Rosa Francisco','C.E.C.yT. 9','físico matemático','Ciudad de México',10,9,''),(9,'Raúl','Ayala','Arámbula','cadete','plantel_aleatorio','curp_aleatorio','rfc_aleatorio','cartilla_aleatoria','pasaporte_aleatorio','Masculino','1998-12-15','mexicana','Ciudad de México','Jose Tejero','rfc_aleatorio','Josep Alcantara','Herminia Ramon','C.E.C.yT. 9','físico matemático','Ciudad de México',9,10,''),(10,'Salvador','Aguirre','Cervantes','oficial','plantel_aleatorio','curp_aleatorio','rfc_aleatorio','cartilla_aleatoria','pasaporte_aleatorio','Masculino','1998-12-15','mexicana','Ciudad de México','Maria Nuria de Diego','rfc_aleatorio','Javier Luna','Socorro Cordero','C.E.C.yT. 9','físico matemático','Ciudad de México',10,9,'');
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
  `nombre_discente` varchar(45) NOT NULL,
  `apellido_paterno_discente` varchar(45) NOT NULL,
  `apellido_materno_discente` varchar(45) NOT NULL,
  `grado_militar` varchar(45) NOT NULL,
  `plantel` varchar(45) NOT NULL,
  `CURP` varchar(45) NOT NULL,
  `RFC` varchar(45) NOT NULL,
  `cartilla_militar` varchar(45) NOT NULL,
  `pasaporte` varchar(45) NOT NULL,
  `sexo` varchar(45) NOT NULL,
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
  `promedio_secundaria` double NOT NULL,
  `promedio_bachillerato` double NOT NULL,
  `foto` longblob NOT NULL,
  `practica_deporte` varchar(45) NOT NULL,
  `nombre_deporte` varchar(45) DEFAULT NULL,
  `nombre_entrenador` varchar(100) DEFAULT NULL,
  `categoria` varchar(45) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `lugar` varchar(45) DEFAULT NULL,
  `horario` varchar(45) DEFAULT NULL,
  `asociacion` varchar(45) DEFAULT NULL,
  `peso` double NOT NULL,
  `estatura` varchar(45) NOT NULL,
  `tipo_sangre` varchar(45) NOT NULL,
  `padece_enfermedad` varchar(45) NOT NULL,
  `descripcion_enfermedad` text,
  `problema_fiscio` varchar(45) NOT NULL,
  `descripcion_problema` text,
  `operacion_fisica` varchar(45) NOT NULL,
  `descripcion_operacion` text,
  `tatuajes` varchar(45) NOT NULL,
  `num_tatuajes` tinyint(4) DEFAULT NULL,
  `pie_plano` varchar(45) NOT NULL,
  `lentes` varchar(45) NOT NULL,
  `carrera` varchar(45) NOT NULL,
  `promedio` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matricula_discente_UNIQUE` (`matricula_discente`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discentes`
--

LOCK TABLES `discentes` WRITE;
/*!40000 ALTER TABLE `discentes` DISABLE KEYS */;
INSERT INTO `discentes` VALUES (1,'2015080213','','','','','','','','','','','0000-00-00','','','','','','','','','',0,0,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'','','',NULL,'',NULL,'',NULL,'',NULL,'','','',0),(2,'2015060213','','','','','','','','','','','0000-00-00','','','','','','','','','',0,0,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'','','',NULL,'',NULL,'',NULL,'',NULL,'','','',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doscentes`
--

LOCK TABLES `doscentes` WRITE;
/*!40000 ALTER TABLE `doscentes` DISABLE KEYS */;
INSERT INTO `doscentes` VALUES (1,'D-5354512','Miguel Ángel','Sánchez','Lamego','Ingeniería en sistemas computacionales',1,3,1),(2,'D-3146985','Genaro','Ambía','Pedraza','Ingeniería en sistemas computacionales',2,3,1),(3,'D-5487986','Francisco','Grajales','Godoy','Ingeniería en sistemas computacionales',3,3,1),(4,'D-3265988','Joaquín','Aspiroz','Viniegra','Ingeniería en sistemas computacionales',4,3,1),(5,'D-2154652','Carlos','Solís','Avedaño','Ingeniería en sistemas computacionales',1,3,1),(6,'D-6284953','Ignacio','González','Álvarez','Ingeniería en sistemas computacionales',2,3,1),(7,'D-1892658','Manuel','Vázquez','Barete','Ingeniería en sistemas computacionales',3,3,1),(8,'D-2365458','Rafael','Robles','Hurtado','Ingeniería en sistemas computacionales',4,3,1),(9,'D-5263148','Manuel ','Vázquez','Barete','Ingeniería en sistemas computacionales',1,3,1),(10,'D-9878546','Guillermo','Ruiz','Pérez','Ingeniería en sistemas computacionales',2,3,1),(11,'D-2684475','Rodolfo','Díaz','Santacruz','Ingeniería en sistemas computacionales',3,3,1),(12,'D-5487211','Guillermo','Ruiz','Pérez','Ingeniería en sistemas computacionales',4,3,1),(13,'D-6325859','Jacobo','Wittman','Rojano','Ingeniería en sistemas computacionales',1,3,1),(14,'D-5285965','Matías','González','González','Ingeniería en sistemas computacionales',2,3,1),(15,'D-5874859','David','Salas','Vázquez','Ingeniería en sistemas computacionales',3,3,1),(16,'D-3652412','Samuel M.','Jiménez','Migueles','Ingeniería en sistemas computacionales',4,3,1),(17,'D-2198325','Marco Antonio','Córdova','López','Ingeniería en sistemas computacionales',1,3,1),(18,'D-8732546','Armando','Cid','Nava','Ingeniería en sistemas computacionales',2,3,1),(19,'D-7425633','Pedro','Hirata','Vaquera','Ingeniería en sistemas computacionales',3,3,1),(20,'D-5269412','Jorge','Rueda','Bravo','Ingeniería en sistemas computacionales',4,3,1);
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
  `ruta_horario` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario_discente`
--

LOCK TABLES `horario_discente` WRITE;
/*!40000 ALTER TABLE `horario_discente` DISABLE KEYS */;
INSERT INTO `horario_discente` VALUES (1,'C:\\Users\\georg\\source\\Repos\\ProyectoSEDENA\\BD\\HORARIO_DISCENTE_1.txt'),(2,'C:\\Users\\georg\\source\\Repos\\ProyectoSEDENA\\BD\\HORARIO_DISCENTE_2.txt'),(3,'C:\\Users\\georg\\source\\Repos\\ProyectoSEDENA\\BD\\HORARIO_DISCENTE_3.txt'),(4,'C:\\Users\\georg\\source\\Repos\\ProyectoSEDENA\\BD\\HORARIO_DISCENTE_4.txt'),(5,'C:\\Users\\georg\\source\\Repos\\ProyectoSEDENA\\BD\\HORARIO_DISCENTE_5.txt'),(6,'C:\\Users\\georg\\source\\Repos\\ProyectoSEDENA\\BD\\HORARIO_DISCENTE_6.txt'),(7,'C:\\Users\\georg\\source\\Repos\\ProyectoSEDENA\\BD\\HORARIO_DISCENTE_7.txt'),(8,'C:\\Users\\georg\\source\\Repos\\ProyectoSEDENA\\BD\\HORARIO_DISCENTE_8.txt'),(9,'C:\\Users\\georg\\source\\Repos\\ProyectoSEDENA\\BD\\HORARIO_DISCENTE_9.txt'),(10,'C:\\Users\\georg\\source\\Repos\\ProyectoSEDENA\\BD\\HORARIO_DISCENTE_10.txt');
/*!40000 ALTER TABLE `horario_discente` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidades_aprendizaje_todas`
--

LOCK TABLES `unidades_aprendizaje_todas` WRITE;
/*!40000 ALTER TABLE `unidades_aprendizaje_todas` DISABLE KEYS */;
INSERT INTO `unidades_aprendizaje_todas` VALUES (1,'ÉTICA MILITAR I',4,1,0.25,3,1),(2,'EDUCACIÓN FÍSICA I',46,1,2.88,3,2),(3,'LEGISLACIÓN MILITAR I',25,1,1.56,3,2),(4,'ADIESTRAMIENTO MIL. BASICO',341,1,21.31,3,2),(5,'ORDEN CERRADO DE INFANTERÍA I',34,1,2.13,3,4),(6,'HABLIDADES BASICA DEL COMBATIENTE',74,1,4.63,3,2),(7,'HISTORIA MILITAR DE MÉXICO I',35,1,2.18,3,2),(8,'OPERACIONES MILITARES I',40,1,2.5,3,2),(9,'ARMAMENTO MILITAR I',46,1,2.87,3,2),(10,'NAVEGACIÓN TERRESTRE I',43,1,2.7,3,2),(11,'EDUCACIÓN FÍSICA II',80,2,5,3,2),(12,'LEGISLACIÓN MILITAR II',16,2,1,3,2),(13,'HISTORIA MILITAR DE MÉXICO II',32,2,2,3,2),(14,'ARMAMENTO MILITAR II',32,2,2,3,2),(15,'EJERCICIOS MILITARES DE APLICACIÓN I',168,2,10.5,3,2),(16,'FÍSICA GENERAL',64,2,4,3,3),(17,'QUÍMICA GENERAL',48,2,3,3,3),(18,'MATEMÁTICAS BÁSICAS PARA INGENIERÍA',64,2,4,3,3),(19,'GEOMETRÍA ANALÍTICA',64,2,4,3,3),(20,'CÁLCULO DIFERENCIAL',64,2,4,3,3),(21,'TÉCNICAS DE APRENDIZAJE',32,2,2,3,3),(22,'EXPRESIÓN ORAL Y ESCRITA',48,2,3,3,3),(23,'IDIOMA EXTRANJERO I',80,2,5,3,4),(24,'ÉTICA MILITAR II',32,3,2,3,1),(25,'EDUCACIÓN FÍSICA III',80,3,5,3,2),(26,'LEGISLACIÓN MILITAR III',32,3,2,3,2),(27,'ORDEN CERRADO  DE INFANTERÍA II',32,3,2,3,4),(28,'TEMAS SELECTOS DE FÍSICA',64,3,4,3,3),(29,'MECÁNICA',64,3,4,3,3),(30,'ÁLGEBRA LINEAL',64,3,4,3,3),(31,'DIBUJO DE INGENIERÍA',80,3,5,3,3),(32,'CÁLCULO VECTORIAL I',64,3,4,3,3),(33,'CÁLCULO INTEGRAL',80,3,5,3,3),(34,'PROGRAMACIÓN',64,3,4,3,3),(35,'IDIOMA EXTRANJERO II',80,3,5,3,4),(36,'FILOSOFÍA',32,4,2,3,1),(37,'EDUCACIÓN FÍSICA IV',80,4,5,3,2),(38,'LEGISLACIÓN MILITAR IV',32,4,2,3,2),(39,'PROTECCIÓN CIVIL Y PLAN DN-III-E',48,4,3,3,2),(40,'EJERCICIOS MILITARES DE APLICACIÓN II',168,4,10.5,3,2),(41,'ELECTRICIDAD Y MAGNETISMO',64,4,4,3,3),(42,'PROBABILIDAD Y ESTADÍSTICA',64,4,4,3,3),(43,'ECUACIONES DIFERENCIALES',64,4,4,3,3),(44,'CÁLCULO VECTORIAL II',64,4,4,3,3),(45,'PROGRAMACIÓN AVANZADA',64,4,4,3,3),(46,'ORGANIZACIÓN DE COMPUTADORAS',64,4,4,3,3),(47,'IDIOMA EXTRANJERO III',80,4,5,3,4),(48,'ÉTICA MILITAR III',32,5,2,3,1),(49,'EDUCACIÓN FÍSICA V',80,5,5,3,2),(50,'ORDEN CERRADO DE INFANTERÍA III',32,5,2,3,4),(51,'ARMAMENTO MILITAR III',32,5,2,3,2),(52,'DESARROLLO HUMANO',32,5,2,3,3),(53,'MATEMÁTICAS AVANZADAS',48,5,3,3,3),(54,'SIMULACIÓN DE SISTEMAS',64,5,4,3,3),(55,'RECURSOS NATURALES Y NECESIDADES DE MÉXICO',48,5,3,3,3),(56,'MÉTODOS NUMÉRICOS',64,5,4,3,3),(57,'ESTRUCTURA DE DATOS',80,5,5,3,3),(58,'ARQUITECTURA DE COMPUTADORAS I',64,5,4,3,3),(59,'IDIOMA EXTRANJERO IV',80,5,5,3,4),(60,'EDUCACIÓN FÍSICA VI',80,6,5,3,2),(61,'ASPECTOS TÉCNICOS DEL SERVICIO DE INFORMÁTICA',16,6,1,3,2),(62,'NAVEGACIÓN TERRESTRE II',32,6,2,3,2),(63,'PRÁCTICAS DE LA ESPECIALIDAD I',168,6,10.5,3,3),(64,'INGENIERÍA DE SISTEMAS DE INFORMACIÓN I',48,6,3,3,3),(65,'MATEMÁTICAS COMPUTACIONALES',64,6,4,3,3),(66,'LENGUAJE ENSAMBLADOR',80,6,5,3,3),(67,'LENGUAJES DE PROGRAMACIÓN',64,6,4,3,3),(68,'ARQUITECTURA DE COMPUTADORAS II',64,6,4,3,3),(69,'INVESTIGACION DE OPERACIONES I',48,6,3,3,3),(70,'CULTURA DE LA CALIDAD',48,6,3,3,3),(71,'IDIOMA EXTRANJERO V',80,6,5,3,4),(72,'ÉTICA MILITAR IV',32,7,2,3,1),(73,'EDUCACIÓN FÍSICA VII',80,7,5,3,2),(74,'ORDEN CERRADO DE INFANTERÍA IV',16,7,1,3,4),(75,'ARMAMENTO MILITAR IV',32,7,2,3,2),(76,'SEÑALES Y SISTEMAS',64,7,4,3,3),(77,'INGENIERÍA DE SISTEMAS DE INFORMACIÓN II',64,7,4,3,3),(78,'TEORIA DE LA COMPUTACIÓN',72,7,4.5,3,3),(79,'SISTEMAS OPERATIVOS',64,7,4,3,3),(80,'ANALISIS DE ALGORITMOS',64,7,4,3,3),(81,'BASES DE DATOS',80,7,5,3,3),(82,'INVESTIGACIÓN DE OPERACIONES II',56,7,3.5,3,3),(83,'IDIOMA EXTRANJERO VI',80,7,5,3,4),(84,'EDUCACIÓN FÍSICA VIII',80,8,5,3,2),(85,'ASPECTOS ADMINISTRATIVOS DEL MANDO',32,8,2,3,2),(86,'ADIESTRAMIENTO MILITAR Y CAPACITACIÓN DOCENTE I',48,8,3,3,2),(87,'PRÁCTICAS DE LA ESPECIALIDAD II',168,8,10.5,3,3),(88,'TÉCNICAS DE PRODUCCIÓN DE SISTEMAS',64,8,4,3,3),(89,'MICROPROCESADORES Y MICROCONTROLADORES',64,8,4,3,3),(90,'SISTEMAS DISTRIBUIDOS ',64,8,4,3,3),(91,'COSTOS APLICADOS A LA INGENIERÍA',32,8,2,3,3),(92,'DISEÑO DE COMPILADORES',64,8,4,3,3),(93,'BASES DE DATOS AVANZADAS',80,8,5,3,3),(94,'INGENIERÍA AMBIENTAL',64,8,4,3,3),(95,'IDIOMA EXTRANJERO VII',80,8,5,3,4),(96,'EDUCACIÓN FÍSICA IX',80,9,5,3,2),(97,'GUERRA IRREGULAR I',16,9,1,3,2),(98,'ADIESTRAMIENTO MILITAR Y CAPACITACIÓN DOCENTE II',32,9,2,3,2),(99,'INGENIERÍA DE REDES I',80,9,5,3,3),(100,'SISTEMAS COMPUTACIONALES EN AMBIENTE MULTIMEDIA',80,9,5,3,3),(101,'SISTEMAS EXPERTOS',64,9,4,3,3),(102,'PROGRAMACIÓN ORIENTADA A OBJETOS',64,9,4,3,3),(103,'ARQUITECTURA DE DESARROLLO DE SOFTWARE',64,9,4,3,3),(104,'METODOLOGÍA DE LA INVESTIGACIÓN',32,9,2,3,3),(105,'IDIOMA EXTRANJERO VIII',80,9,5,3,4),(106,'DERECHOS HUMANOS',48,10,3,3,1),(107,'EDUCACIÓN FÍSICA X',80,10,5,3,2),(108,'GUERRA IRREGULAR II',32,10,2,3,2),(109,'INGENIERÍA DE REDES II',80,10,5,3,3),(110,'PRÁCTICAS DE LA ESPECIALIDAD',168,10,10.5,3,3),(111,'TECNOLOGÍA DE INFORMACIÓN EMERGENTE',64,10,4,3,3),(112,'SEGURIDAD COMPUTACIONAL',96,10,6,3,3),(113,'INTELIGENCIA ARTIFICIAL',64,10,4,3,3),(114,'AUDITORÍA Y CONSULTORÍA INFORMÁTICA',56,10,3.5,3,3),(115,'DESARROLLO DE SOFTWARE ORIENTADO A OBJETOS',64,10,4,3,3),(116,'PROYECTOS DE INGENIERÍA',48,10,3,3,3),(117,'SEMINARIO DE TESIS I',48,10,3,3,3),(118,'MANDO Y LIDERAZGO I',32,11,2,3,1),(119,'DERECHO INTERNACIONAL HUMANITARIO',32,11,2,3,1),(120,'EDUCACIÓN FÍSICA XI',80,11,5,3,2),(121,'INGENIERÍA DE REDES III',100,11,6.25,3,3),(122,'LABORATORIO DE INGENIERÍA DE REDES',64,11,4,3,3),(123,'REDES NEURONALES',64,11,4,3,3),(124,'LAGISLACIÓN INFORMÁTICA',64,11,4,3,3),(125,'PROYECTOS DE INGENIERÍA DE SOFTWARE',64,11,4,3,3),(126,'TOPICOS AVANZADOS',64,11,4,3,3),(127,'GLOBALIZACIÓN Y DESARROLLO',64,11,4,3,3),(128,'SEMINARIO DE TESIS II',32,11,2,3,3),(129,'MANDO Y LIDERAZGO II',32,12,2,3,1),(130,'EDUCACIÓN FÍSICA XII',80,12,5,3,2),(131,'OPERACIONES MILITARES II',48,12,3,3,2),(132,'COMPRAS GUBERNAMENTALES',32,12,2,3,3),(133,'ELABORACIÓN DE TÉSIS PROFESIONAL',368,12,23,3,3);
/*!40000 ALTER TABLE `unidades_aprendizaje_todas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `matricula` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido_paterno` varchar(45) NOT NULL,
  `apellido_materno` varchar(45) NOT NULL,
  `contrasena` varchar(45) NOT NULL,
  PRIMARY KEY (`matricula`),
  UNIQUE KEY `matricula_UNIQUE` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('12345678','David','Gamaliel','López','1234'),('2015080213','Eduardo','Castro','Cruces','123456'),('2016060213','Bernardino','Castro','Cruces','123456');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-29  3:19:20
