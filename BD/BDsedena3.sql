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
INSERT INTO `academias` VALUES (1,'Eje Ã©tico','Luis Antonio Barba','academias',1,3),(2,'Eje militar','Juan Manuel Olivera','academias',2,3),(3,'Eje acadÃ©mico','Marco Antonio Pacheco','academias',3,3),(4,'Extracurriculares','Miguel Angel ArÃ©valo','academias',4,3);
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
INSERT INTO `carreras` VALUES (1,'Ingeniero constructor','AndrÃ©s Melara Contreras',12),(2,'Ingeniero en comunicaciones y electrÃ³nica','Santiago Ibarra Pedroza',12),(3,'Ingeniero en computaciÃ³n e informÃ¡tica','Pedro Antonio Carrascosa',12),(4,'Ingeniero quÃ­mico industrial','Gustavo Adolfo Murcia',12),(5,'Ingeniero mecÃ¡nico industrial','Angela Maria Saez',12),(6,'Ingeniero electricista industrial','Jose Tomas Bejarano',12),(7,'AdministraciÃ³n y evaluaciÃ³n de proyectos','Maria Alicia CaÃ±ete',2),(8,'IngenierÃ­a de costos','Luis Alfonso Torralba',2),(9,'Sistemas de calidad','Manuel Francisco Hermida',2),(10,'TecnologÃ­as de la informaciÃ³n','Luis Angel YaÃ±ez',2),(11,'IngenierÃ­a en telemÃ¡tica','Maria Estrella Peralta',2),(12,'IngenierÃ­a automotriz','Francisco Jesus Valencia',2);
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
INSERT INTO `datos_academicos_discente` VALUES (1,'Ingeniero en computaciÃ³n e informÃ¡tica',9.5,NULL,NULL,NULL,NULL),(2,'Ingeniero en computaciÃ³n e informÃ¡tica',10,NULL,NULL,NULL,NULL);
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
INSERT INTO `datos_personales_discente` VALUES (1,'JosÃ© Juan','LÃ³pez','GutiÃ©rrez','cadete','plantel_aleatorio','curp_aleatorio','rfc_aleatorio','cartilla_aleatoria','pasaporte_aleatorio','Masculino','1998-12-15','mexicana','Ciudad de MÃ©xico','Manuel Jesus Marquez','rfc_aleatorio','Isidoro Kaur','Sara Maria Tena','C.E.C.yT. 9','fÃ­sico matemÃ¡tico','Ciudad de MÃ©xico',9,10,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ÿ\Û\0C			\r\r2!!22222222222222222222222222222222222222222222222222ÿÀ\0SS\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0B\0\0\0!1AQa\"2q#B3R‘$CSbc¡±4Á%r‚\Ñ&DTsÿ\Ä\0\Z\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0#\0\0\0\0\0\0\0!12A\"3ÿ\Ú\0\0\0?\0\ï¨\ĞAHA\0#D€ ‚\0 ‚0A ˆA)\0Ad¥$¥ \Óh¤\ÒR ‚\0Q#($	A\ZıH#A\0T…#A\0)\nKA\0„I\Ä\r Œ¢@)Q(”‚#A\0H#A\0’¤h’8IDvKı)$ 	R\Ó~ˆŠZ¤\È;\Ù))Ò’€n­Û£JA\0”^¼\"ì¨¡Ih)R07J\äò} \íi‰>•(‹LI\è’H÷K­ö@Š)ºH)Ä’…H#A3jA«˜A\0A4‚ \r4H\0‚ 	(XPe ›øˆŒ$|DhR“\"v\'l# ¤ŠN\"AII%li\ØA”’‚\0‚  €$A  ‚\0 ‚\0‚… XA\0‚‚QCº5²$ºIB„‚4H ‚\0‚ $h‘`\nD\nK€H\Ğ\ì‰O‚(””\ÌR4D¤\ÒZ	p)i\ä—\Ò`\İ%R4)\0”]†\Éi(a4E”òAò¤\ÌU$?`MŸT™Ò“I\ä\ßt„6‚U ™´\È\"¶¦Ÿ“TV\'Q¨c\×dƒ¨\ÇVôtøšV;T>!ÿ\0t\É\Ôg=¨%\å‰\Ì*\á\n\æd<Q’¾É®£\Ïw“ü\Òó\ã#‘ñÿ\0ˆ\"#J|\Õ\à¸~l1ù¿²cö“\\6aU\à\×t®ÀRW5L¨¿ô°&Nl\Ï\ÚkA/,\Â\ëHğm\å$YÜ¹\Å7~\Å\0i\nÿ\0“ÁHa\n 4œRRc*´JR\à6Â´•q-\Z$Œ \ÈA)PA\0AHA	\0DtH· ˆ\ì’y\ëj*<Ù‘\ã7óŸ\İ+BZ\n\ÜI¥G\' Î„\ï»-=i³¼³\â£\è\éñlŠ÷¥\ê¬\Ùù0û[Â‹.¹¦\Ç_Û¡¿º:8µI\ìU@\×4òI‹:°w§\î¤Ç¨C.Ä–\æ‘\ÑÅ… TfdQ“ù=<˜\Ñ!w\ÙÀ$ ‚\0 ‚$ ‰\0F‰€\ÑmEG\ÈA…5A\0|¥$\×\Íh\0(@\'õ$¥!]Š8	¤Š\à%AIT\Â³õ‚–H\Ù7úR2\nAKH&œ¤E\ä#ı ¢}.úŠ	V‚¡Ò¹ÁmYI¶\ÔN¸´:\Ê:Ó‰Ÿ*NÁD\ê·\Õ(@L/Iµª?‰¢	+¨‡:‹\ÔC©H	WşdD¨\ÂD®¡(	\åhZÎ‡:O8(¹\Ó\0¥Jÿ\0„ô1\ŞF^¡H‰6‡=(G;ÿ\0ÙotÄš¶?ü Pr,ùÕ†œK\Ø~\ë(ıwŸ#ş\ÌZ\Íf~å…€I[«À¶ü^ ’‚\Õ\ÎR € ‚€\İ$\è\"Gh’\0‚\"ˆ¼R>m<lú\È\n¯TÖ±t\ÈL’\È\Ëf^\ë™qÍ–C1\çBv¦(¹´˜u¹\âN1\Æ\Ò c\Í“\ë•jœY•OP	=\Ös\']\éş\æ8\Ï\Ï|\ïÜ•/X\ÔrA\ê\Ña\ßf\0³÷[á„‹Yõ‘!ø‡A\ìTs›\èH±\êURyÓºiò¾96…u¬\Æ\âMG\nF?{û\ïJ\ïñ:Yd‹™Œ“\ê”g{ş‰)\è¼R52z\Ğb\î|³²ÿ\0Šu Ã‡<‘3\Úbö=aŸ.K~rf¡9\ÙÑ”ƒ©aş$\äô9\Ú\Úiœa\Ôa\éecdG\étWŸ\Æ\\~XT¬=eø\ärvô!Y#\Ç§ğµœ|Ÿ‘\'£Ê³\Ùp\r<o\Æ\Ïc2\"ğH]F\â\Ø1úqJòü	7d}˜¿ùIQ–\r\éD£Á’\'a,!\ìõ	õr£ƒDş8\r» ‚\0#IB\ÑGº$¼\ĞH ˜$\ì€\"‘?\ì‰+º#\âH\İq\å\áM /\Â¸jl\Ï\ä\ÈÍ…\Ó\0#óĞJ\0‹Q¾&WD\\<şR\èK´	Øª¨õŒYs~\Z.sbùü)|\è9i¢@ `RÈ´\ÙAı\Óoú“ˆˆ@6‚‚ \Ï°|¥B\Åc+\Äl	X\Îÿ\0¾Áe\Ê\×\Ë\ìd#\ë‚yA5	\È\ŞiŒ\Ô$ù\Ï\ßcº£n> ¹\îR¿hB\Îó\ÇıV®\Âwyşe8~¶:®\'œ¦_²l\ë@Ÿ\Ì\'ù,€\äğE%|\ßÄ¤r4\Ï\×!Ù’?o3\Ä$×º\Í	\íG\îœ‚E \ìhOŸÑŠ+Ü¨²k¹oú>Ê¼d\nª@H&g;ü\èGR\Ê×“\'õL|¨RT\Ëø‰$\ï#\Ïó(›­\ØD9$\ï\á\Ø\îS\áğ¢·\Ü\Z\Ê\Ğ\Ù\îòW=/\×H\áøz\æ¯mø¿A&Ò–pJI@&\nA%\0)°w)e6>¢•QiQ\ÙH‘ìœ\ï \0,\ÚQ>«!\Åi¤cI=I;;ŸVñH4O1ó¼®9™ü™\Ë\æy$û\İ,®mõ\ë\ïÕ£\Åº´\ëIWk9.Kş‚l‰r!i9\íDòI&”5¼\È°\0\nC\Ù?9\É\ì”ş\ß>\å\\\âúr\0€HŒ\É\ä\ÆôŸ’¿0b­<e\×\Î\Ó^H21ş\Ã\Ù†>z€‡J”şb6y¤\È|Á\ç’ÿ\0š`ñaa‘º0÷óU¤G\ŞI—\×`ü¸…¼\ê‚\'ËŠ©Û’\ÂG\íFÜ‚’¨*€H\ä,\ÈTü=c;O’\Å1\">\ÌeUûH§F£{\ß\æƒu~\ã¬\\y\Ä!Ï‚÷øyÈº\Ş£~$s\ÂğY ^R\ê\Ç)¶Pv ·\\\Æ\ÇKœA•_Ø±9Qqz\0¼s÷sU]‰<9G<d=…›?\ÕHÚ¬^lø¨\Ï\âDggºeyø‘Û¦\Î@ÿ\0 ’EvSÚ®ñ\é£øƒü!5É½¢ù’ó£‡òz„\ßRo\ã@\ÚFü\Èò\Èù\n\çyşğ¤\'÷…\"¤­£š¤¥r3\Ğ ‚:8\Ï@’@ô	I$†2\Ğv\éW\Êd\Ô_ÓˆôñFÏw“\Ø%@\Õ‡ıdR˜>J\İ ‚\È!\Z¬B&r£ f¡\ã}Rs\è\0S;•qb4Á+!$´_©\0‚‘\ê–Sg\Ù\0\ÚõY\à\İKK¹#`\É\Ç1’5ª£Kµq$½\Ô\äü¸\ï\\B\Ù\Ğu	½‘›Üª±4ú°ˆŠZ\İguù1k.n\áeŸf\Ò;‚7	qr™²”Ç½½\íOpwC©\áô\à˜\Ş\éc%0r„•Ô¶dN‰\ØJ¬! £Š\ê\ã¨	´¡ U,\éc \ÚJ•j	õJ\ZU\Ã-)™6¦„\á\"XŸuOibPRN\ê\í½¡\Î\Õ	’®t—\È\n\é¼2ÎŸb{²\×)7K°iqô4¬XÇˆ\Â\Ó[IAhÄ»F‘\Ü% \rFĞ¼½ \Ó\Øh…!R\êP<\ŞN>òGİŸ\Æ·‡\"\Ì\ä3\Õ \ä0x*£#’4İ§\Ë\Äb\ÏeŸšüq:r\0\éa8¿Œqtö=Œ‘“\å‘Lˆ£û¤q\Ï>§\â›Ì“Ïˆ\Â\ãY²ˆÌœ\ä½\ä\Ù*{Za„úsT\Ô2²2¤g[\ŞwUR~iü»²w>\ß9\Ñò–ùC\0>vhhD\ÆY”\ÙQ¥ı\è\'e•O¦Â#\ß=‹° ­M‘bn‘\Ç_\'t\ŞLŒˆ\0I$“>w\Ğ` „ôñ#šù\Û~‰C\Ö\Ób6F9\äî€—©\àpu%–MJ“\"qWo>G\Ë\È9v¢\İP\ê\\™“JúŠ˜˜\é\Ûÿ\02kM\Ù{h\à\èƒfGÎ›¹‰\Ø*(A<ª³\';«\'šñ\Èu\"YK<Ø‘‹Dõ6)A\áˆñ.¦Gc\ìT\á?UƒzT\Åö,R—4\nl9]£ğÇ‹¾C¢eI®W[rA\ä^L\Òó_‹ñ?\Äş{^†\án,3DB$yx§©N¶€\Ò\è@\Î&a„†\Ö\İ\ÒO;\Æ(şªnr\nĞ¤³O\â\\Ñ„\ßş\"\Ê#vF°K\Î++O{\ĞCu”~½–v¿’gö\ÎQ\ï’¢^gú\Û«½¤÷+\ÍG.Gÿ\0Ô”nA4gyG™ş¶¸ò\ì“ü\Â\Ç>B_¼’R¤c\Äg\Ù\ï}u>cõ´¦xGyıS2fbó°5T4\è=½”g\0Ci©yÒ˜,Æ£‰\ØN\ÓIÏòò\×G‹á‡¼¾\ê<xğu\0 ­r.:1\Â_o\ÛÀõW…\éY!\"1ööK\"§ò¤Ia„•§cN\ï\È«ÔµN\ÛŸ\ã6¤€´Œ\éğ6AlPªLIJI@ \Õ$¥,\r÷H@ ’‚ O\Z\Ï\Ğ\à½Uÿ\0\è\ç.\n’i8\ÛM€<ôß’6]\ïñ#§Àº¸q\Ãh›7\â&–†Ew\ë<£ò«u.\ÓuvŠ\Åa>$¬Q‚\"W5\Õ²ñ\îM6A‘øo\î²s\ãÍ9‚h\ß£»(®\îHPu\r7T‹§—\É[\ê{„/®ñ\ÈRÜš]T\à\'~Fw\é\É\İbsqŸ§LcÉ‚H=B‹UyK\ì˜9põ…”\è”˜¢´€XAEú»\'F\è²j4…›\Ù)OK·!nH¤w²\\9JvO2r™F\Ã\êl\êd\Æ\îğ»l£`\\KNg>©ˆ™˜»ˆ\Ø*Œó£A\å[ ğÔ´E\ÎPmM\Ğ\åú¬ó^\n\Çÿ\0\å™eõıs½ ¨\\K­|—!…ñ²A·RM\Ù\Z“\Åh·=Å¸ƒX=G\âÇ’_{n{¬­ÿ\0aUzyŸ%\ïd•\ï=\Ïwû•O$eì·‘\ÎMR¥\É1\ÉŠ\ß0R~ŒS“#Y\Îógt\ãN \ÈF4{›šQ¹%½ı­P\Ï9\Û`‘‘–+ô&“r‘­ùôQûÛ‰)&Nwü\ç¾ô”ø\Ë÷òF©¢N÷\Éy”˜\ë\rû¤¾H\Ã\0ˆUÿ\0T\Ó#2]\í ¤\' —ı„QH^ò# By,P;$¾FEŠ:@s\é\È-6ù>{\'rRz…\ï\î2\İÜ„¦m”p\Ä#\îı©=\0$’*”Có\Âk\ÉR¢€\ÉP\æl•‰\Ê6T~–{\í [D­0Fgw\Ùôš&‚GdÒ—\áM‹-ğ~\î•=”÷?ô\n.+•kC\å\Ê|\ÑG°ú]Gğ\×7©§eFMşb\ã‘d¾2CC7]#ğØ¾\'eI_%\ÌZa]Z7ÿ\0g	¾¥ö š ²\nÄ™\Ñs\Ö\ç\ß!õroŸ\å°J‚üÂ‡Ä¤k!=\Òz›¨£#d‡\ä|\è$ù\Òz¿=]¨\äú Ì€d¢€µˆÜ›«œ(€}\îAY†OO¥m’c µTE]O(>Ê½ù#Ÿe7Q÷\n·\ã¹ŞŒ\Æ¤ÃŸ©\0»Ö»\Şic¸~N®±~€^µ\ìª\Ù^˜\ÏgôR‹šy1$>\ÊR¯\Õ6\Â5ä€¶\ã¸B°£\ÊC	´˜\ÅB\Æy-¾U\Â<@\r‘ FÉ·š6œ(Š©¿_D\áˆ@5º	\ÄWñ:J\à™Á?[\Â\â¼\Ä\\=\ÅøÚ– $øxy\ï¦\Îb½™…ªb¿;™?»¹\î½ø/¥\æ¦‹’üiı97b\Ö\Ær­ÿ\0d\Ğ\ä\ß:_¸0±\rôôyÿ\0œ‹š\ê¼ªpé¼œiÏ£Ù»lº6Y\ÄEA\ç\É}¬\í°ä¬	\'§¦\ÆÏ¼\Ê,_‹:®f¡\ãb\Æ$5Ø’,\ÄÒµY&c\Ì\Ğ\nôRÿ\0ag>n¼™a’±f\ÅO\ìWƒ©hßŒ˜§:|\rr‰ŠBÃ‘\Z\ßÁ‘£q>\Å..t\Ğ\Ù\ÌYº\\ñ\â–K	–\Ï9\Õ33µ\Í,di³\Ï\Ø6’«\Ópk8ª,¼O\ÄY4\İ1\äbœ¦Aehs´SI—¡™\âpı_¥\ë›h\ÜM<¼a¨\ë>~P’gù+Õšv»¢ñ6-\ãOK\Ş\'÷	ğL\ìq$\Ğ\ZxN³1‹ª\ê\\	§f[ğ¿³\Éüv,6­\ÂZ†˜OVc\Í\Â^\r1\Î*†L¿ú£ù$!\n$˜…—µ¦¹‚T4’,9\r\ì…9Wõ$g•\"<·ö(\èğ:R‡ÔˆJ\nI!¹\Ğc\êqœ\ÏY\Â\íKp€2ñN\0®\Ï\æ]”n-\\e˜\Ğğ‚Rh´	”şI¥\'\çıÂ¬\ÔsF!™\çon\åFk\Â2ˆ:\ã1´¯‚\Ç\"IıÏ¢\á9ù\"I	`·­\'j‡#X\È—\ï¿e™Š&\ÜgÁµ‹§PŒh\è\ŞjM\ä\ä	l¥fdBó`Ú¬d„y§ö\n¤¤ddlRF\ï*Lš[™÷\ìÇ‚L\É.Nfcƒ°Rre6\09#\Õê™¢<2\r\É#À\nó\É=ó]\èŸ\È#’\É\0³[\êd\á%\á\Ç\ÔutYy¦Í˜\Ë8‹€)\åB1\Ş\ï(€r¾É¦\'9û\ĞIh¨\Õzª^©ğÍ€\0„ˆ‡\æñ°O\ï#ö\ÙMªÁú\Ô\è…=€L²\r>J{#\ä¡\Ú\ÔU\Èn\\wH\Ö\Z\Ù6pû\ØWx‘À\nQÀ\äYş\Î:&¾²‡z¦\Ì +üœ.Â•|¸u\åi3eŒM\È®S\ÙKøg\è\Î6õUJ\æl9P@#u\Ó?%g#\Øş\ë\Ö\ä8n\n·\Ğu§gG\'v^\à¨\Ù\î/	\Çq\êTcn\â\ì&\äx¥]Ä“\n<ˆ±Y$=HvV\áø²°>X\ß,’¸{\ÇOo\åF(N?P­†(¯ò)˜bI\ç§ˆ‚vŒ\"\îñÂ¡u F\×J\êx9,•¤\àˆ\ÏÊœ7LÓœ\ã7\æÌ·\Z–$L¨ãŠ\ã\Ä‡ú…;7\Ì+L\'Yq!g”øË“’…›>‹©‰ğ¼l\ÊûN—\Z9‚hK\ÎŞŠµ\ìıˆ\Ù\é\Í\äd\çô?ù¥G…¨¶,\Ç\ì\ÂV\êL\ÈdŸ —\Ûñ¤\'\î\Å/öŒ\Âk¨ò\ìÂ–yò¦f\Ïp|ı¡ù‘\Ö\ëdÊƒ†^\'“\'¯ŞºôûŒ7@«µ-şŸ\Ç\"±U¹Ÿ>©‰ /[1O­\Z €n‘\ÈÒ\ÔQV“\à\"’Hğ„’\nY;I¿Ô€l\ĞJAP¤	ƒi\È\ÊÙ‚o\×lxia‡‹\\‹ñ“‡1´\ÎƒY\Ò!³·#’n’\ë,yµœüA\Ã\Z—\0\ê\Ğ÷,¬°J\ä\Ü;£qo\nÁª\Ç31\ä\'x·$Œröoc¼gb\Ùl¿u.§\çb^øó\Ú\Üj\Ü?£\ëşß„\Ã\'‰Y³ÿ\0ª	clv8§;­€=ñ¼xx°Vˆµ¼,>hñ o\í\Å\Ì6º¶\ãlœMQ“M\Ñu˜\ÎÏ”\âöa\Æ;$}|\æ\ì•\ÎWª\Í>¥\Õ\"t²o²Vó\\\Ü	\ã8ù&„†@ğ°\ÒaºY:xÑºI;À•…ª\æ\é\äc-\ïû+úˆ\ì¼;øÁ¨\àF©ôó\ã¾\×R1uŒ4N$\Ç\Ã\Êh/\ïû\åxõM/Ppø˜ş\Zs\İıÂº\Ó\ã›sÅ’d>?TK`\ç^\ÔøGK\Ôlòi<¾5‰Õ¸\'7Oq‘Œ\ê\Ç\áñ¬·ş(\ëZ;z9\Ã\â\áÌ‹ªiu¢êœƒ®1¥x’Dû(÷º\\)Eñ<\Z¢»v~‹§jŒ\ç’Ç\ÒÆ±º¯e\ã\\ˆÕ\Ô\İm&\æ\r–\ì©ó\á¾7‘Gn\àŠ¥\nHÊ5\ìix\0—ñd\ĞÈ»\ì!ü9eñ5ú@õ\×\ÇÒ®1\ÌIi(Ù”‡\éB’m\0\Ö[ù!X\Î0Ô™¥œ£8ê£`±l3+\ä·.-ø©|^¡ğ¸§ò %yz\Ï6ºñs¼Ü¼óI&\Å\ç\ÊTL›‘bI6Á7\ß) Eö)\Ã?\Ölü‹7B¦p9ƒ$¡`¾DXl2¿¯ \'œ|Œô	†wò|\Ä’}\ÔÜ‰:c§\ïM²gd€\ßÂ\'1\"I{øDd$Á9\Ä>\Ş,nU% û&\â›U’­e\äy>=•n@·T‰P’,\ÒD–ò\Z§ºqÀ”\È`—\Üú¦\rt\èR3T\rnRù\è\Øl\Õ#¦&\r·\nDH¹(©XÑµòFµ\Â#¹£N/\'ô\ìU˜`2=WôÉœ|»•2«ıip ¨#!Xô­\'‚<f@§GE€®[}»°øª\È\Â\n®\\s-,Œ$vPeŒXT\ÜIñ\Ë,\×!x¡^dAWaV\ÉM²\ÚW.xqX\È}\×p£}R¹\0ø\ï—pª¦İ›6ˆ+Lk&Ë…uFœw\â—|ÿ\0 -æ•’0\ã†	‰J{ú.;¥fI‡”\Ç\Æğ/bWQ3/K\Ç-<r.\ÈÃ™:ôe\ßKl\Üq\ïşSº|L9L{#mÊ­\Æ\Ë9!‘Í¼Œ=Â¶\Âö«ºå®„ó‰€\É\Ó½VK\ÓñN’Ie›\İSf\ÆY02¬{­^<(XF\á€*\Ñ»”ú–(<¬ŸXñ\íj!‚\0YP\Æ/\ÙN\ÔM\ä1§\Ë\ŞJ`0Š\\ÿ\0“ı´\×=œB:lh \ÖÁi4üV²<|†óG\ÈvT3°s±¤z’µš|göLLó\Ó]?‡‹\Ê\ÉI‹qñd\İÁ­”¼\é¾pI&6C\ì{\"Œ4e’kœš)\Zµdi\ÓAı\ç!,Nû¼e\Ïf¸d\åw\êò¬ß»{¨:}=ö$©\Ë\Ğ\×9\ç{B j\ï5\ãşœ`+JUøtıG.OzZ%bX	4–ÀµAuI)I:A\áF…!# \ìRJ[ÿ\0RB.tiaÊŸø³@i#\Şd\ŞG\ãñ:3K¥Fa;<	·XH4<²\Ët‘Ÿd™øiù,ş\Ğ\0g¨ğ§öƒ´\è?‰|3®²6E¨·!\Ût2vZŒ˜\ã\Í\Ór ~\ì–2Í²ò¦g\åcayx÷Oi[\Å+_›<pÑ¿xÊ¿>¦\à\Ş~g·O\â_O‘\â6I<ş\ÅL\ã¯\Ä\çf¶]/A““´\Ù}Œ«Ë­|F~F[\ÙÓ“ “\'OaºxdGÓ¾qAY“}\Óñ\åj™l\ÂÓ |²\Êy\0f\å\éıG\Õ8³RfŸ¦Àd¿\èÁ\êW£x7‚t\î\r\Â*\È\Ô^*l¢?\Ø\"A\Ş2Z\à\Ãğ°cË—U\ékF=\Ø\æsDGpT7›Z\ÑoŒ\Ã\Ü\ÜÍ£½ˆÚŠ¾¯%\çpN@¹4ÇŒˆı\Ä*FK©hÓ˜ÿ\0:\ì+\Õú¯\èú³ú€\ã\Ï\â\\}Š\Æjß‡™\Â$:®/Ú¥±^X¸\Ö\'C#K3±÷>YØ«Ü¿…\Ë\Åøü\\¾˜³5²r\á\ÈüIüÁ—²\ÉfiÚ¶‘\Ë+_õaØ¨¸«®ƒ\Ã|}¯\éf¡\É3\ã\ì~\ë«pÿ\0â—¨†k@\î{Æ¼\ë§ñ;±\Üÿ\0‰„şò3b®Lø\Ùğ1óŞÿ\0\Ñ.\å‘\é™ôı/[\Å<G\'?i\à+q¾’\Î\ÓÆ¡#\ÆF	F^=„¬7ñNv–cf6[ñ¤\íİ„+\Ä^8:\ßG§I\0/|\×\Õb}”ùc]øYŸƒ¨kyO\Æ\È\ÙvÁ\0qo+[\Íş\ã…w¤AAA\ÈT“\İ-ş•^ªö\ÆÇ»µGeşy\ï]\É9:\ÆSú€?³;\Şu\Ø\Úül\çH\ã\Ê\Ø{/9’b‘÷\å\æ\×=t\éC–À|‘‘²¨\åô±¶\îE)Ë–UNqøœ\Ğ\Â;\é¥\\\àcˆ4?‰{+À%S\æ¼\ì\î­u,›\ÄÇ¯\Î#f\â¶T±‰\'&G‰BM–g…3¨q\ã\é\ÅVS‘{şH˜_\ê\å©g§v\îbş\åF‚>Bg”múgLcı\á²|$½òH	y Dx““5\ØdhH@;3a°Lzl ›\ë\Ø’³š—ˆuyd¥l\Ì‡\Å>¶–WÅ®†WPİ“\ÙJÂˆü“‘\\\åE!Š~¥0\ÂÄ†_e›Y2r\Ğ;4\Ş|Œ°^s\\e<ùZ.\Ç6_\éº2ÿ\0˜0­cò÷?(me;\ĞN	9h.K^„:\"%›\ÒD˜Œ\ä7\İ\0ó#\0ò\Ñ\rO>#K¨\Ù\n£?¦n5«\éMª\Üü{–’°\Ï\\“Ë¿ôU¹ \Æ÷«)\Ç$µ]‘¾\ëlyšˆytmvI¦±gs}\×9‰ôï––£…óC$|&b\Âweö*wcØ­9{l ²\Øo±µ£ŠŒ\Ø	yJ;,ü_¼’\ëf±\Â\Ælº	ş\âÁ÷^eø\îµ?\á/R†$\Õ%óÿ\05¢q$\Ó\\b\ï©\Ü*^–­ˆ÷‘|\äe¡\Î„ùG8÷¯Nœ;³ö —	†q\Îù,B	<\å2\Ì6s¼ó\É\ßøÊ™=O+\ãx\r@\Íş°¸wc\Ü\Ûë¾•rc\Ìño°C\0\ç+klc\Ï@Y\Ìp\É5(\è‚\ßğ¶\r,¬U\ßøxzr~V_ô\Ät˜ıg2\0>»¥j3Ç§\Ç\â1\Ô\'ñº™!{7ùUú\ÉxA/œ.kÿ\0£|gcRÎ›!`ˆfÁ)d©tùÂ¯\Òşx \îù\n›9,\ï¾Á1¥\Æ…õ´…S’Ø”\Î\ËFeRMî–’P\Ó@’–¦ˆl÷)%)õÎ‘ú·LÁW\ì‚aÈ´>ŸQ\ám;P\Â\Ô\ÏZXmñ\ä¨\Ù\ZF±§ü¹ø3t‡y1\ÏP-\á_1G~“\Ìjßˆx³†0yò<ï¾8\ï\"<\"<\ë˜\ä\äbiØ¯Ë›)\Æ1·!\î}–Y\Ô\ç\Õ%\æs:xÀü‘a\Ä\Z\ÆN¿ªÉ¨er\Ñ\Æ(Rù\Î\Û\ÈFÁF>—\Õl˜\æ09û•\'OŸ\'Ÿ¥xgs\á_i|-¨\ê,f£“‹’\Í<\í\Öİ­®\ìø1Ù‹\Æ[+¹	#)\Â\\{­ğD\Z¤ÆÜ\Ë\Z\ëº\ã7\ê•x“L\È?\âo\Z\Â\æ\éx9%\á„,\î_	BwÅš‘3[Ó˜y˜\Ùğ	°§x\Ïg\ÄğT×”q\ã\â.“©ƒ4ñW\ëô¶š\ã^«€öA­c31µ\Óz©›?|\ÇdK#¡~%ğÖ¹L8bNº\É\Ùjú€°=…¥‡³\Æ\áZ\æ\éøºœ}<\Ühr\é#-q>\'\á7\áş%`\él\Ê\ä\Òõñş#p\Ãü¹[X\Å=)ù¼,5,_ú½.a‘\Z,\Ìxğ\ÕøBGË‰6)ÿ\0/Ï²4¬¬	.\'õ=$‰z\ÇGÔ£\×øk9›Ç“\r\Èˆ4Xt¹ßğÁ‡ßœ˜¢´+¯L*<\ÈÄ¬õ\ìğ‹QÍ‡&\ÙòHÀvÈ¥qN£¦\ê€iØ­`gyûuŒ²\É‘JŞƒÿ\0\éş\ZÑµ¹<I“\Z\íK‘~\Ã\ËÁ™Ry“9u\Ô\â(R ™‚PEú’J¯&6d¾x\Ûc\Îşô¸‚>–·•é’lô@?™;û’óKƒñ\Æ\Øü_”6’@B\Ã8\é\ÓY,Ì‘\ä“viVô\ŞÌ—›\åNŒ¡a\Ö!7 †8·xy%\ç\ÊM\ìE\ÕG ‘¸»	ˆ¹\"Å¾§c¼tl¥gŸ˜\';ÿ\0 N˜ò	\ÌùR\ÃQ\Æ\ÂL\Ïû€Tl\Òd’£?)	üü›#§I\Æ\çzM(TÈ¿\ÎôÙ†s“\ç`¤> dú¹BŠ¹S\ÄS#S\Ñ\Ä\é6N\ÂÒŸ–y\ÈÅ§\Ä\Òq¢Œ2\ï¹K=œm¯J‡M\ÓI=\àl¥j£¦C\á\î¯òrptø	$>NÁg¤…ó¼\åeXŒ˜^Vº9$+ ¿°\ßuK›’\ìÜ¢òmH\Ô2\ÎEAK#8ø\Ï`=¦‰Zc&>\Ø\åoÄœH9ıÀZ\Í:‡Çªù\Î\åWh\Úy}HGe©\Ä\Ó\ïw®]™º5\àL¿e!˜ô,\ÔñB*<\ãaKŸ®”NJAÿ\0E±H|`\r\Êd\ÇTœ.˜\0İ¦rö\éµ4ö\ÙGº´ªcõªBiR\È\à­§µC)²F\Ö\n\êÁÁ²\"\r­Zğôø\àXhªs°µo¡	¥\"­Ÿ\Ë<?·R¿>¤l \n‘€wgª\Ö>\âf•$@Yxa²\Í\éeDd“Fy#Ü¼Òµœ\çI…n=E$\ÆşÑ¿\×ì¼v»òş[,\Ì\'Ó³1aó\Âı˜F\Ï	Zn³«Xòb\äò^.O>§Óˆvı\Ö|3&	\ŞfÉ9ú„\îºüù‹“~m!Br¤`1—‘\'ıŠF\Ãó\Ü{,Œy3\Æ^ô\ÏùE<\'Š˜<X’ıo1jôŒº;ùX\0­G\Ä\âs\Îu\Ëcu6\É€=\Óß\Ëx\ÔX/îºµ\ìğœc³G]it\ç\Æù\ä’@\ÒOtY\Îg\í>\Ø\Ës\íû,€|Ã¶U\æ­8pM?1òN%\éB÷¬1Ç¹´\Ëc\äÜ¤”´¯Ô½>8Lg¿§ƒ7¸N\ã3§c\Ğ(š§ı4lş9ŸúZ´ˆ¥\àLş´\â\Ñ%\ŞÉ¾D¿	 Hi@†\Ê\"-\Z#°A‚$‡8;#\á\Ê\Æ™s\Ì÷g°÷YmCQ\Ë\Õ3d\ÊÍœ\äeJw{\Õ,y\îç·„\è”\ÈCc»*r\"ä• \Óo+¤ğ\á\Ï1\ê¼Af)\Ş<_2+ü6‡Nd:®®\Èò2ğ\Ä7cLc\É\î´\Â\"Ó±\ãc#‰‘B6\r€Pµ\ÑuAy:|}_GùoSO¥_\"%¬\á\Ô\ì<úfk$ú!gst=CK}f\à¾&ùÙ¸]ˆ»ğh³\ÈKõÆ“c‹E3°0\ØyTüC£\â^y’.Ó\Âú>£óËˆ#“\Ã\ãØ®[ø•¥¿…±p\ß\Ï\É\Ã\ÈNŸİ…EÁ¤Í‡ƒ²r`\ë\â\ä°ß„\æ»\Åü \ÙS\Åş\îúŒ+S¥\ê:VË¦>\åıO¢\ä\åB!\è\É$|\ïG•ƒ’´z\ã|dkše3\â.…§qGñV˜\ØzŒ‰˜Xøß±^|\Ë\Òğs\r²h\Øóüf³Z4\ì€!\É\çxò\Ã\ÙV9õ7	§„x›‚05½[ñ; œqVdŒ\\\ïŒx\ëQ\âü¾N^†\å\ã’\Í\Ô2õ	úùs¾i*­\çu+MÆŸ2FGd¼š‚\ÉUS8Œ\Ş\ä«|-ù›\ä\í[}3ğûá°¾\'<\\ı\ÄJ‹I0>\ä\İM‹øG§³O\àÁ`\ÑÉ®‚³K†a÷‘\åjˆ¢A\Z	‘ ˆ\ì\ÂP¥|u½¹\\³ñ/H?\Z\Ì\è\Æõ\ÎWU‚¢\â\ì!“¢Hò\Îw\Æ9µ\×õ\çH\ïTš?ó\ÚjOË†C\Ó\"\äı\â˜#jS7e‚—™SO0‚(Yº\ÔxBLœ¦A\0“ùG„[\Ø6	cLz\é\Z÷¢˜œô\ŞyÍvJ\'Ã˜\Ş&\ä\îBJ_o–‡ J\È\È²\ä#œª\á\'^M\Í19Š-=\Êü™ºx\ãù«?‡ºÀnL—½¦4ùññœ>`/\Ê\ÓañN \ä\åú¥–U¦4\Î\ÎúY0¡\Ûd\è\ámCr\ì©+Ñ†•ö\â\ÊÑ¸\ä=¤ô>\ê\ë\'\Zw\ì)\ácz\è–1qğ³1\ÙtyÁ¾w\ÕV¡§\äõ&€;¦\ä\â2z³œù¥Y‘¡Bù†\Ï\ç>¨™UòW7ƒC˜¾\Ø-÷±¥e —\Î\Æ?s\İ\ï[6a1’tX\è´ö\ã³ps,p‘S‹§2\Ã6p¬\ÙQòòYŒòA\0\ê‹3Š\à\Æc\Å\î§-;œ’FÀ¡ÉÁF\Ö\'Œf#\ä6«¥\âŒ\ÙY¼€\à*š]\íôú…ƒó&\ãÔ¡’ƒ\Íˆ§ -HS\ç<\ï\n®û\İ\0\ÈOd‡ñT³x\Ú\ïI\Ìc\Ï\ÈU\Ôy@,U\î\n\Æ\ác\\3\ê~5±õ\ábs[ğù/]A\Ï{,Æ¹§TeÃº\×UF\ìY\Ç\î\ËõS4l‡ÁŸ\Ù\àª\Ö<\ß!Vº½N =tlø\ã\Ã\ë©bd,y\ãu?T\Ê\ÃiIòñ‘±Uñ\nµ–Jñ»\í\éIØ™8>)@×¼g\ÑA2 !\ä<=K\â\'é§ŠxõLHy\ä\Ş2Q\Ñ\Å\Ö>@È‚ş^q³ı”¶H$\Ç0<ö!ñûz¬\î6AÄœ<‹aú\Õ\Û	{	Ø¢T\Ø/ñ$õN˜Ç€\rò­(ÿ\05-/EyY“zF\ÆZÍ’F\Û-°üd„}rş\Ë]sµ\ï\á}‰“ñBÁ³$1‚Ÿ¿6À(\'X»\Ü0õ2ñ#ô%\êpúTyõ†\àOW\"(\Â_„õ%« ½\Â¡\å$#yÜ¤“M@ı\ÍLÈ–›%\0I´\Zc\áI—!„¼«\çğ¬ıÓœu<…\×ğÿ\0´\\!<“Š§\ÏüeA\È\àmB;~>L9\ìQz%U‹Ä¼7-\âeeÁ\ì\Ç\Ø+a¥ş3jø\Õ­ƒO¸ü·©™šf¡„µb\Éõ,4«ò1ñs#© †Tt\\et=+ñC†u\ÙÔørl1óqó!b\Ï¬õ\à¯;ep¾¬.…ò@O®\áUmoCI‡•3+\ÌO¤\æh¸=J\É÷\ìRÄ‹\ÏZg\â\ß\é\Ô2¹2\ãô”-\æ“øÇ \æPÏ‚|3\ê>p´•6WL\ï\ëKş3\ã‡ğ\\ûŒ µúf½¥\ê\ì\çÓµlŸf?uAø£S€sÁğY\"/À\Ğğ\ŞCr8OJy\Ü?–‹x=Eù\Âş\ãS\n\Â\ÜI…¤ş\Zi¹ÚHŠ\ã1Wû\Éø\×ñ;Šq¡a\Æ\ÓÁ\Ú//û¥yÃ–õˆ¸‡ó14¼hG‡\Ï\Éÿ\0$~\å<\Ì%\\iz4™\ê<Tk?)\Z}A\ÂÓŸñl]„\à:N¡LL\ìÛ›£_#\Êb\Ô\ãiñ\ãÀ•>Y\ìx£\Í\Â\ê2·V3¼\ä\'ôm@ã‰\ìT­Dy\ã[}ŒşV»…c\éğöö\'ıÊ¼U<?¶‡ƒÿ\0óVªh­\ZG”ÁIş\á\étš\É5÷E\àl)Tq\àhù\à¶\ê\è\rÂ£\â\ÓZTqø’`°\Ëù^\\GŒt\Ï\Ù\Ú\äy1ÓŸuKÕ‚y#Â¢d?=…\Ó8»Oz?S¼˜ûŠ\\³F‹«Å¸»G\È)e+®T\ÜüG\áƒ$‚Ÿ%°\ágo•1\Äò?¹]{ˆ¸K\Ä?’ÿ\0\É\0M™Ş©e$\Ó\Údd\Æ`a\íc\çD­,s\Ù`’\È,‰IƒJÊ‘ôòO`\ÆZ\éñi\ïô\ØPÁ‡\È\Â÷«X±«’CöW\ì\ã?\Ó\×!:6KCÁ\ÜQQ\Æ!/Xk»,…\Ù\ç€rYuQ™¥\â\ä‚d†?\æ\Ä~ÓšûIŒD\à˜;°Ï²\Ô\é\Ú\ä\Âgdv)\ì%<xOJ\Èa.aŒ\ÖÜP#áœ¿d3&9C©L!ª¤±³\Ã\â->\ÇS;õù|A¥d2Ù\r³\ÑQ\áa\à‰$€\Ç’–>€4U³4¬i;B\Ï\äÅ…­¤AI¥\ã\Èóñ6O£	C\'Œt\îJŒ\Î÷ŸHÔ™4ø`f\à\0N]rl	\'`=QåŠ¬Qj\ÜA‚N”y %”³pc\äk9½hù*\ékN<I\Ï\ÓyW¹\ĞÄ¼,g\ä\Î!$[\Ïfløò93ò¬´\\/\Ïs\â½\ÇP©\Ì\á+Ÿ*\Ïúp®›ªp—ì³ˆ:Œ\È\çŒfô1)ii\ÂW3ÿ\0\Â\ØınGÏ•÷è¦ƒğûÇ• g¼k¢Iaü\åW\Ëg\Æ\ÅG\î\É\Ñú1`$\ÃÊ\×\É\ì\ÓJ^Ÿ¨Ï‰8‡+Œ=ƒÂ»\Õ4¨\äe\Æ(¨˜XOu\â\æ°O¿«“)c>\\*û$O£jpñ\ê\Ø\Óiùc\nSq¼\ã\Ëüc\Ó\î¬\çL°X_U´½](¬\Âª½\áX:ú³\Z|*|\Öò\êrG-W±y\Ş{€·\İÿ\0›“	ÿ\0m\Äb˜ƒö¤#úP5t¼g­d#xgpH\'t””\ÈR\ÛrGƒJ^\Ğ&	\Èş\ß\ä*+_)İ…1+)ş\ÄTD\ØÓ™JC\äUšv`’>„¤õ>KôRKïµ­#\Z_Vû…»\ávW\Ä|\È÷½s\É\rµ\ÒôhşAÁ\ÏDÓ¢{sï¾–86M\Òÿ\0J\ìr \ãÔ² V\n¿Nù\Ìòz\ÈU‚¸ŠX(\Ñjˆ I´Q\è\É\Ù!\çj@ \Óe,\îh\ÏtA(Ÿ\ÕGİ‡±NuvZ³§Xoe3‡´¬\Û90ó\ïŒró$\İH\ê%\ãˆòÉ“\É\à^\ß\ìZœ‘ú2Vs…\ã+7†ô\ÖO™\Èc’N˜’5\ØY\ê°ß‹u8¿ü<¨Ò¸\Ã\Ç:\Ã\á\ãbd\é±\Í3=–	e*\ÍG†ô\âÀaxŒŸE\ØøK¡›À\Ú8È†9Ñª,Y\î&\á½:\rJ\ã\Æ\ìğh§•¤½r#¢\çb¿©‰9±Ø±ôT‰8ÓˆbÓ§\Òss¤ŸA\Ë$S|\êGkš|\\øº\\vş\Æ{ÿ\0…’-|¤½\ÄıÑ\Ò\Ìì¹³\Ëq>yQX2\ãLû):~$™…„’}7?d\Şšü‡ö]ƒğûOÁÇ\à\ÂÓ—V\ÉJI›‹\ä\ÓñcŸ4~k÷+}?M\ç\0¿²\è™úX~3ƒù*\\ŒNÁ\ÃÂ£A\"g,aMcI¶\ŞˆØ¥ ˜y$^\Êo\Ä\\e0X‡f\ĞNTX\éºD}-?HB°Q±aC\íRB¤IJA\0g\'÷lo©O…/û±\êR €³œ]%?O\ÖKZF”\â\×Ş«€Á\à¬³¾š\áõO:˜R³µ\ÆE®K \Äc\ã¬\í\×\ä]o%\ìŠ\É)¨Ù»\Ê\ãÚ”òbd¿WÇƒ&<pò œ\ÃB\Ê\Â::\ÕjÚ‹u‰3µG\åY§2»0yû•§\Ñô\È$\Ñô\ÂX$•ğ\Û\É¨¼9/	\r#(ü&©†Ë‚Y6\ê}Š\Ù\àI\Ze™„#²\Ó9\Ã\Ã;L\ê:t\Z~?>÷±yT\âdòb\Â_Ûû+Œiõ\rPOª\Ì\"À\Ç7D\ĞU™üS‘œm4rr2\Ò\Ã3Ù³Á4\ê1\Â\\ş\ÃuœŸW’?•ğ±\êF¡ª\Îü­I™Z‡AñG´a‹š\rC5ùÁŒ\È|/^U]	\Ãò[ÿ\0Ú±\É \0–XVŸa\è±ù\Ê\Ó\ß\'\ÆÃ»f\âˆZ<)#Ÿ0y4±¸qÕ†}?¨cŒ	\à\Õ\á<Œ/\äg‡ª\ê1\Èp\Ûx»²9\åÜ¼ö°F28sQ/\0ˆ\ã_­„æ›Œ\ìl|L C\ß{ÒŒ¿•\á;xcP:\ÃÁ\éd\ãPß‘\áU\á\äœü\Ù”ø\ã’&\È\ÈÖ£QÄ‘‘\ße‚=c)€¿*€ò7a=7¥» d4È†\çw•o6\Ş\Ñuj³IgV7™6\ëO«\ê\Ø\Ó–rÊŒ.	^f\Í\Ö \ä\ê\ÙÏŒ0‚\Ù\ï;ª™5\Í5Ÿ,Ú¤’<w£²—ğš~tÍª\ê,ı£ğ4\Ê\Ü\\\ì¨F™dW\È\Çû#pa»5\ë5­\"^§ö\ÙkmÒ™™5^6Pœc¢Ãˆ\åÁ\ÖdŒ\îğÑº‘.^$üøFS\Ü9^\r°İ›]©3 –¼\'¡Rñ™Rv²ºvTò8²x-\àıjş9\Ìlº;,üy“§»z\Ë:˜2öŸ	ƒ.?°4ô\ß\Æ@ø\Èd\ì%\ãfZsıUğV\Ï\Òò¿\à‹\Ã\áÜ‰:y\Úi\äG\İk\á8\Ã\Î\ËÈ«\Í\æı­3H ‡Š\ÖğK\Ø~$\Z\çY]k1™º\ÔùF\è\Ú\çl\Ó\İiøC\"¿ ²\Øáºÿ\0\Âtö\æ\İ\0‘ú\í2\É}RÄ–¼g«I\Ù$½ŸL=S{Qa\"S\È\ä÷Q\Ë\Ñ\nŠPXñ¾\ãv=YÁ–2a»ù\Ç\ÖL’Š7G±ôQ>\"Li\ìlñş\ë\\X\Ñœ€;“Au\È\ÙÓ…Œğ\Æ\0?¢\ã\Ú>C5\r_\0F>¹À!v3\İË³F.=\å„$“’7”]Aı<ùCœZwı=Í©ª\0\äÄ…\Êb\Õ¶})\Ä\Û\ĞCD…¢@›)D\ÑñI¢€I;\ZM”¿	²€4m\ËØš\ç\éğùyƒÁ8Z,?Å½V\nfv6G©¦V¦_\ÃøNøºƒ\Ù\í(°²üS\Ãópş2s£†\\w¿§\Ï~\áø\â\Òa~)\èy42#Ÿş\â\Â\Õ\àñ.¨Q\Å\Ôñ¤>…ôWf‡˜¬\È\èOr\î\É9\r#E|n=û£Ì¼“A±o[YÄšŸ€³üòr\Æ15.%Òœ>/$i,)ùßˆz\Öf•¥jbc”O%<*\ïS\ÇL\à\íoMü9\Ä\Ë\Ì\Èd1Gm²¹·\ZqşG\Èqqq°ú\\‹&vT¸ñ\ã>g˜\"¾F^Á?‡&C\Ã\"Œ¹Æ‡n\è\ÜQr7ıÕ®•6_$’ŠZ\ãp\Óğ¦9‡«\ÜGè´¸\ZY–Sy4‘NÒ®™\n\Ø\é\r:x\Ş(¼Pc\Ç¸\ã\Ù)Uci#Ù‘‚ÇªŒ˜ÁO\é³\Ş/L\ïHd\èµ\ïc%`Št_¨\ë\àet\äbŒ8Š\0ÿ\0\İÿ\0º\æ»ğ™§;%ˆ¹.HÅÊ‰¬\ãe\äŒ`$\"Å«<x\ÃõA\ë0W…—\ã;,ú\é\Ì(#J¶d#A\0<(¹;\Íô\nW…Sı¨{©Cc8”\ßCşH\ÖÕ‹\r­;©\ÄS·\Ğ,3ø\×_ô‡9/%Œæ·‚\Å\Ì8·ô\í-—Œ&¦°¾\ß%\ïK¦\É`¼³¸s÷\ê3§iùVö\æ|\ïğ\Â{.o>W£¯Opµ[ \æ\ëú\×<S˜¢\É\à<…¾\ÖFv—‰‹\É2e°\Ô\Ò\\ê·†\ïób¼\Ô\ØY&ÿ\0#²\Ññ a{9üZmø\ÏL\îl–^•\ÄYQüN\\‚õPu\rfœö>)\Ë$¾pUÀÌ\Zğ;(šL\Ù&\Æ\Ã\î£\r–5\ÏL¬\æg?&GÏ•8’Cµ\Ş\ê”p\ÔXh^\îva¾\ËU,H?x¢ş\È/6^ı\Õş\Ú&ˆ\Ï\çA&§–ù2ò¦G\î^÷İ«]\'KÁôòXÿ\0Ue›<a„g{#`Ü¼\0w;ZøqY¯L1´h$úr²ş@6U®‹\Ï$\ÙŠ/<\áT\ë‘A©\ê ±Î’7ü>(G\Öõ£\Óğş8\Ål7Keœ\â´KŞ“›){7X<\Òümcâ¢1ğ0\ÈG\×\êó0lmb5\æ²Y3t£]ö\Ót\ì1»3n\'ş[À‘•\ä+L`%˜¿<ŸUS¥À\'g\Â;|ˆÁ~/úŒ\îø\ÕÎQ›\Ú\éÊ¸p\×)L\Õ$ôOÏŸ¸b\ËP_\'\È6´ü‘FM\Ö\å4p\İgûL@y\Å/±L€Š`V#O‚÷bv<@?BŸ5ş¨¨f39¬³r¥œp[AL8\Ïğˆ@cNZŒä‰ºTCGÕ²¨~N—‘¿¹ ^&8\Ç\ÓX\Ê\ÜB?\á^\æ~G˜y3W\Ëd\0y\è\Çó¼ª²\rHWM®<ª\æ\Ún0\Ì\ÖO0Ÿ¸[µ§\æÃK§½Pp\ä$\ê\Ä4¥a\Æ_”\Ë\ßó{²t~.\r~E2i\0H%\Î9ò$û¦\ëú//\é\×Â®÷Fù~”9Ÿ\åQ\ß&\åH\"‚h°Z¸,F‘ûU¨\Å\àŠ?\ÉI|w\"#(eÑƒ;üŸŒ°÷Ù–ò»@½r¿\Ã{\â©¹v‹®ª6]\Ú><\Íÿ\0\Ùv \ê\Çû\'ñ¼9UjŸ™>$7\İö¶¬\â\Æ=£`öJE\à!\å[:z\Ñö	\Zv‡0H@š<¦OÑº[\Î\é‚PB\ê$¤‚QŸe )TL\Ürö³_ˆ¸\ßÀ¹\Ô,ÁS+l|¸%e\Å<rV<Z¤c/G\ÌÆ«\ê@ö*¤ªü>\Í|\rˆo L$*ş&\Òğxc0Xñ°T†º´\Zª\Ü\Ù\ÙXò—½fø»¥\×$v>]©ú\äG:S+\r\ë\Ú\Î-\â\àF\Ç\È62 D’;\×\îR\Ù’o\ÙZ\áird\Ó\å¶Eÿ\0)z\Å^\ê™F’d\àıO\ÄÁ12òû\ìY-3L%\àE0.‰\Ã1³\ZC\è’-öÁT\ÒA\Ê\ë\Ê\rú!\'jZ-F0÷\ÙTÁ”O¢3‡…#R\0\0$\Ñ%8…T\Ü9:oSy\Õ|\nl”ú†OU€ekoŒ\ÈµŠÕµ(\âÍŸMf;ú€–	9ö]$F5\\\é\æ\ädQ0&·ğ-\ÕC2µy©ó’\r\îW8a}\×~\ÙCµŒ@{Ç‰º\Ù\é1u5¼6Z\É\èŒÿ\0\Ï\'ÿ\0N°\Ñ~N \Â÷z\Ûñ±ô\ç\İ}º„\Èz%.§0\Æ\è\Ñ\r‚4$7\ï”ÿ\0`¦û÷”³8[Px“[\Ì£\éo†\Í\\\æOŸ;0úÌ¹ö|o«\èû=‰\\÷\\Á“\âÿ\0,_\Ã\ä	6û­üÿ\0ô\ä¨X0\ëyWLC~\Æ\×^§\â\ç<,C\Ô`8|cõıŸS÷\é Z­CJùğ=“z¦³¢Gx@\à—øàª¼N\"9\Zd˜ùC¥ŠzY•¶_\Ë9õO™\0d„1›¨G\r\Än®¹}¼\Ñ)\ã/\ç:efş³ºAŠöX£\nŒZ|Tª\ĞÜŠ¤Y¹’i\Ğ\Z\ÔóXYˆ\Ã\Ş8û>Sÿ\0HÕ³°´&	2X%Ì\\_\ï\'£7PÎ“Q\Íy“*so“ş\Ã\Ø+˜øN\Ö7/\Ùy:6›3#™\0jD–,‘¦iı\",]v¦\ÈğT\Ï\ëy\éGšÍŸ[¬©ŒK7µ\Ùg\æ!SfG\Î;%\Z1P1\ã#§\ÔtoŒ‡\Ã \ïõZ<Y\Î{Œ‚6Gù3³ÿ\0\Ôg²©\Ô4\é?yõ¨ğdH\É\ã3Á3\ä\ÊÃ»DË±É^Æº8\Ã\Ø\nt@T,=Zö\rD³gö\Èÿ\0ñ\åûÿ\0Z€²¬lv¢³º\Ûa±8\î\â-ö\n@gLò\',Vû)‘~qÄ“&fTxĞ‹’C²›RdIQ0•/W&M¥\é3‰23s™¸‰c\İo†r\ï\ÏüˆZ\Îlyš¯&9¼:3‰Š\Ä7rIü\Ïü&q?1\å1#q±Œ¦F(zy©\'ß°°‹z\Çyún0O‘4O\Í!)¬ln½ z–«ô¼ƒ »Ö³N\ÓÙ—©|T¤\ÇN‹\Ø,‚³Îºµ\Ş`—›¦y\'\Â&XÁ¢\Â~p«‡ew™ôK\Í3u\ã5Ó’.\ß\ÏĞ¥J0uI¿2N†A\'\Ùş\ï=e7)ÈªFiüœ,œ	ù2c\Ç\É 6\É>\Å7\É\Øöa\ÆÒ›ä°™x\ÚÔ£³/¦\0Ú‰\'c\î§\Ê)…@–\ÄfÖº\Ù\æ\è?…¸õ§?¯$k¡køcO…¤›Ì™Emhø^®¹\Èòweÿ\0dªœŸY„\Ğ\Ålªú\Ü\Çs\ÈÀ¢-¯twhÂ´´°€\æ@,\ÅwB\ÂEù@\İ#ºQ;R@õSH\È ~¤H„$ ¬<œpõ\\Sù]vW¡N\Ã\Å\\C¦?‘šK=mAf»¨\Æ>!\ß\ÍW\Ë#\æ\É!%\Å9i\É2d‘\Ï$\ìódx(¡ó¼28\ËŞ•&A¦\r½Vó„°£I\ÈÁ˜³g¦r(´\íG\'S\'yf-f˜e§\È)KƒKe\ÉwwJ\Ê0²­\ä<&\0Í•–úLzb8ıSñƒh”490<y\n±\ì\ÜŸ9,G†0$ª¿\Û:d€rfÀ}ù\Õ\Ú\ÎD\ÔlQ#É‚CòOû<)±|…KˆPRq\Í?t\Ã>”»\îT\çñ3\ë\'«òóŸ/\Ït\Æ3\Åú¬\ìq\à\ã\ê_\n =`Y9R8‡1ñ\ä\È\Í\è¾\íVi\×.½‰\Ô%\ä\È	%p\áğµ\ìş¹do4ŸY\Ô\ß\èC·DüI‚+·;\Ö?…\É|š”\Ã\Ì\ë}\Â\Ğõ5y$ş—g\ã+w\Ö\ÎöJ´?@B—C£I	I€Q»\Ş}J–£D6SJóP¼ú\Ï?¾›ÿ\0Y]/\äÁ”ÿ\0‘s¸­\ì$÷%a±¾‘dŸì¤ªŸ‰­\àøš•¦i#\áPdû/üa\\™»ÿ\0\ës¡L%\Ğñ¤ğ#Y® \Âı¡’3±^qó#Ù’V\Ï\nßƒ^\'\á¸7õ	Kl§³®úk\Ïû¬pÖºAªFq6\ênøÊ’sqNñ\ê˜e‡ıEnq¡\È#Q\éaÿ\0™‰ób%>*$Ö´\èMA’?\Ã B™:†©‘‹ğQÿ\0û™{\É÷c´\çN\Ò\ã&8=€Yy5‰µ¾Œ$ò\'\æ?_~•œ¾I\æ™öùd6÷•º\Ç\Ó\ÄQ³aAeúFc˜Y, ¡«qVLPI=;(·­\ä’zo±\Ù\ìa€¢Ëf\êÁ\ì°:k˜ùñÍ•‹ñ.\ß\ÈwYªf°Nù±\ßpJ9\Õe\éœ\ïLfcw,£J“&@#}•&}H–%­j‚\É$Ÿ@\ãZ[È´“Š¥;O†\\w²–gˆ5FI¶;:Â´1jfLA$ \ÆJ¼°¸¢l™«tC¦ó-<AÖ\n!/KË“\Îñ_<gù\ÂgS6Yù{¼\Ò\ĞF\'HÉµv—:\Ğõ5\à/\ápr}\Ùq¤|n¸v\Z<\0ú¾tzfªd\Í\Ï{…x2(\"f^ôøzÆ¡gæˆ±\Ï||A\È\Ü÷R ÃƒCCÍ€Op6\n’S\êncÁ!›v™¼ò“\à,\Ëd¨øLé™‡Ü’ˆÆ³¢HÄ€\Æ(­\Ç¼É¦\î\í¹û,³ô—õ9úÃû-f‘…6š—ó›eùS_ø´ˆ–s\\ú\ÙV\n{#N\Â\ÈÄ\â\ÖcÇ¯\åŸş, A¾\ÖS\Ì\"A\Ì!c!$ŒIÁĞ±ò?\×\Ù3.–hÉŠz‘\ì½Â´}dAğù1‰ñ\ì›\Ğ\Ç\É6ê°¾\äÿ\0[ıÒ¸4\Ã>3¤\Â‚›!hdf.}Œšƒ(\ç`¢¸U9xsaI\É-´Œ\ìõ…ÃŒ6J«2|\ãœr+i\Æ\ÌÊ· 7\ç\ÓeZşŸ‹‚ñ¾„4\á\ê…_Z‡¤\Çğú>5F<h\Çû)k\Ø\Âzx\Ùı!\ç]Z©\Ãü\Ìü©=d!Z\ÎşH^w\ØZ§\Ñ\ï ÷š·¼”ñf”\nOd ­KHCô\Ò\0y\İ\"\í)\'Â+EúP´’¨„RRªB;A\n\Ã\ÆdÙµa§\é\Ï\Ì<\çhÂ®+O¡\ì\İ\êò¾™Å¦–6‘­fƒ8™`F.<½€Vxóô\æaô+ß‹¬ø\ë*\é&\Âw%\âp\É;!U²qƒt)9H”\\]!\Z\áa?˜iR³L\Âf8cñYL«n,?—‹pù’N\å\í‚™\î–~™,9ôüD\âŒY gè‘VØ™9Z^¥•$‘Hú\å@Æòjb\àe	9ÉµeÀıWMc;›(§®õ\Ò1\Ï< ù!*SPH}F8¨\Â¦°¦û#?\á3ûc²0Æ§‹–\ï\İYa÷Qtm+¥—L’Yğ=†5ÇƒTnIÊ“‡™=E¿¯÷g\ßú	ÿ\0šw}:iëœ­\ïLÉ³u·qc	\\\Û¯¤i\ãLÛ\íò²\è?†±ôÜ·\Ë\æ^Î›\ëv\ët‰\Z¥\Ê\ĞA\0Ò˜‡›•=\'\î\ÊL{1 ©šÓ¥ÿ\0Ò¹\æ=˜\Ùk\Z„³3\0gIÁ$U¬„{0†\çF”mD\Ô\n>‡\0\ÉÔ¤€\Ñd›	z£\é”S¼/Z™ÿ\0Á\n\å\çk£¬ö\Ğ\éx\Ó4\æBÍ€\İS\ë[I\Ï\Şû«\íDô aºÉœŸÅ0\êx6›«_¹\ÔFdò:¼7Q1ƒ}Ê‹)\äŒI!«Y-[Q›#(ac\Îş\åDt??\'U\ËøXK«\ÉWz^Ÿ$!¾|•NÁf68\ä•h\ri\Ä\Ö¡j\Zd\"\Î\ÏöRh^öò_²]Z®-7\'ş\\\äƒ\á=Y00°xü…9€ºk\"O†{7&A\Î\Ö0’³\Òbf\Ï#\äp[N˜\ß\Êo#´•±G8\×\Î\0S#ÂŸn¬\Å\á]¿s6L€‡Ì¦¾`l²œg#=T!Œ—‹FKû“O‰’œœñ\ZxV¸º—U•&\ÏY»Ç‚Wò2@O;\êk.Æ’\\[•\ny%§>¸È°B#\ÃöğˆU“\ÙRñ\Å>Ä¨;]:	9÷\íûµq\İöv<wA„=\çÑiò$ø¼™$>N\ŞÀ*]/m*	\ä˜T™[1‘©\âG\Å{¤œ\ê.¯q´\é7!›YÀ\Ì1\âd;\"cÔ“ó\0yV|EÆ‚ùƒÆ‹…°qôx3¥\Ôr~7\"6rE`\äŸ(\Æzg–\\^\ÇOñºf	$\ÔöcL`†-Ÿ8^ÿ\0F(#Nšºr\êy²\Ã\æ2X?Ş•\æ;ã±\Â\Èy#ŒP`˜Tj\Z>I\æÅ<ùLf\âz\"JNc\äd?JSIˆı\ä\ÚÀV“\Éò?$j&\Ô\ÂÁ<xÉ\ïv=ªœ\İ0ND\Ø&\Åo=¾ÊŠ<3‘¨\â\ãA|\ìaş«m‘‡\\’9>p\å\î#ÿ\0@\Ò`9|U¤Œ\ÈYC şB\Ô\á‡+K³ş3³\Íz£\"\Ğ\Îû Nö½8óª.súxSF(Zc90£J\×$­.j=\È	X[@Á\ìRR‚E#AA%’}Rˆ%$û²‘Ø OdH\ÊJÁü¨\"AX\ã\Æ\Æ9v•}¤\Ø\Ç`ÿ\02–q\Í%ÁQ–}N-ñ\Ê{9¹T`¬c\ì”j¸‰\åğ\0T\ì}€U¸GjV\Ñ\éC\å=\Ê=§£H\Ù\Ş$\ßRÁb\Ëñn¬\ì<\âDO<\ßS\Õ\çf¿\nxfŒ[ÀYw\äb\êšW\Â\Ë09rvvz0ú“Ñ\Ö.v\à\Ï\çhŞµq§aAk™b\Å;5(£Š\Ù8ô+¨\è\à\Ë\Å@\ìe\'´it\È\ä	Lÿ\0\åòRt}*6« f	÷Yl\ï€\Ã\ê\ä\Å#OÉ$xòò-\àn¹^~§•‡¨\Î\"‘õ\Ïüe/Šµ(\r²y}C\×&¿\Ãñ¾n\Ûù¸\èù\ì×†sÿ\0 \ä0ù¥Õ¿£=òX\Ñ!˜\ìŸ\àüG\×\Ç(¿\îÀWü6\Ô&\Ôx/*crJM¯C\âÙ²\ç\áõ!\İ+W8\ĞAIû´#úfú>\å)ƒ\ä	7<G¤>\Ö8\rÀZ\Ş)x ,¢\ç\Ø\è\ÓñQ¬?Â³\à–\\ùö`U:±·«ş	ec\ä?\ÖEÏô\Û/\åo¬\î\Éj¶¦07.\ì[\İX×·j!cpÁd\Z‹(¶On\Í?Â‡Šv{\ÓÌ¬– Ç’I$ù\n\Ój\â9$y\'“\ä¥M!Og`q\Ñ~-±\ã2\Ô¦b\è=\Ö_\'ˆ&\Æg8Œò1S\çqÄ’3–&\ZZc‡’<üÌ‰!‚\ŞL3?\Ğ\Úç˜º¦¥ª»–7¶0·1ğ\ÉfpÍ˜Jı»lZø¬vJ—ûN \Æi3&F,›BVg\æ\á\é\Ê\ë’ó\à„\æ7\ê9,’>\n<ö\ÄJ†8Ì†@£K©b†Ğ·¦rô=LeŒB	yI\Ë\ámK\Èk`+öCÔ¡½™I´ñ˜û-)œ>\Í\ÌÄ’n¹CO\á\á&Ÿ<“9\Ï|i\Éİ‰cP\Ä,A\ï†qq=¥aµ¤ò>¿>‚k/8V\Î\îk®O+Y¥†_“{\Æ\è\Æ+}“˜ñ·’¼•™\Óò3§¤\'‘‹[„ÿ\0ˆ1€9\Î4—«)@‹ÁUÁ?RÊ±\Õ%lXœŠ§„0ßÔ´§@¹®—FI‡\"\ÄA–úUñ±[\èqó³2MéŒ¥Qjñ°¿i\â\ç\ç<£\ß³\Ò\é]˜_&k>\Æ5…Y\ÔÁÁ`\ï&w9û1‹¢v]:õ\Ë=¼Í›,¼Œt¼×ƒ¦ù\Øc\"Ÿf\Å+7†r\ç\ÆdQ\Ïq\Â*˜k\ĞZş¨\ËöW?<!¨lğc>Ö†óş«r5?£ıù9ögj,\ÄK²Hv\ÓXš6K#±Œj]\'%tJ©¾¹Üš>@d…ğ=#D\Ãsu\Îwn\"\å×²\è\å­!Rh\ã™\ä0Em÷X]>x\îòFÆFO<’<!‚»ñKDõ\ĞJ. 7\Ç0R±…\ä«5‰:š¦,c\İZÁôlˆT\å #œA\0‚\0 ”P	%6R\Ê\"€6œ½“j’J	T‚\Î&4¸ÙºIKº•D¸—{(ğ\r“şF\ÈZ\ÃO¾§*½ŒS6\0ù\ÂĞˆÿ\0.\é\Í)LÙŠ/\ëR™ô$-‚L\Ì\ãGóDvÀ°ø\Ø\Ù\Ïy•ŠF-\î zœXñÚ˜²y2:Mg,‚I\ë(\Ç\"\Îú\â@8N\ÖşnL¹*2\Êÿ\0u­\áğ$\âl·€h,$QºMôo¨\è$9õù?ÎŒ¯h\Âs\Å\éG.;Ä¬\0²‘G\É&\ç\Ò3ÿ\0D¸>¥¾¡3‡ªŒ\0)ü\ÃyRt\ËIø¬/TşÀ1ÿ\0t±\ê\Òõå¨…\Ğ^½\áX>…´¸k\éÅ<k´ ¬Š@ “\é\ÇÒ“&\ï	\Ä_Šd§\Ã\Z\Îş¥o\Ä\Ï\Ö#gğ1Sş‡.mŸ]Z¾(uCs­_\ÇZEÿ\0…d5y+u\Â\Ñòhø¿\Õe‡¼×ŸÅª#	½öYùRekU¯OĞ›mF\î\Ö{$1“š­Â\ßÓ¯ñopb\Ã:@ız—Ï¾ö´ù±otA·T&>r\r±s;\"\Ã0‚\Ëeµ\é?©<ÿ\0e¸Šˆ’şe‚\Çö+\\3\àº\åc84Áš4ıE€!—\æ\×]\Óññd\Ğ#\Â}±ûƒ\Í\Ğ\Ù\ÚVSÁù\èŠ?Ú¸\ØP\àÇ“\'B7óŠ;•½½s\ßÆ¿\ã¯j˜pI¦\È\È\Ş`\ì­qô\è§A¿\Ê6\\£/ˆ3g\áñ\ÆE<0nT\èø·:( 8\Ï#[\îU\Î1\Ëñ·V¶M/öû\äÿ\0\"\ØB©\ã™1¦%”À\Í\Ö^N%\Êø¨\äŠI\ØH£J~µ¨\äcĞ’~Ÿg‡¿º,Šš648x\Øøú>/H³qf•)\èDr\à`­Íª8õ<\Ğ\ÎLWt£gpój£!ù,Í’fd¼2Qóû©\âÿ\0Nj}W/\n<S-=k,\n»O‘óu$\îò­#Ä†0C#\ä÷Vx\Ğr3`/Ê¯>Cš9{C¦Dqÿ\05 \Ó\"\É\ÎF\áD‚1`\Ö\êv;ùú®\\\İD]E|’ÔƒaI²^^úH&\äDgH~\Ì÷Wš~9gI0\ï$\ß\Ô*Z2\Î\Ècò@iª\âş\Ê\ÅÓ˜Àz=Gû½h\ÃeiøM¬\r\Òb\ÄKı^)nV„\Û\Ó×Ÿİ\éğ°÷ÿ\0ºÜ®\Í?N\ï\èh ›y!\ì[3-¬öCƒ‘”Ö™ ’šSh‘\Ë\â©4ıQ¸Y0\ä\ív[óP´\ZLó\å`²y»\ÈK\Ú=…\Ï4}J=SFt\Ò£“hX÷\î}—C\Ò\ØØ±87Ñ±eªõ{\'\İô•W8ùÕ›ş•[)¹\nyı=fÒ˜Ô¤?\éLÈ›H\Ê\ä/{1Š\é›1RAó\ëy^@ +\æ‘L:	LIK\n‘A*\"($\Êq%\0’’Q”‚V\È+9‡‰#°\àA¨7î³šN q%8yW\Ë{_…¥`º#²Œ±V>/¡8Íš‹f)]¤\Ña¼i\ã\Î`\n‘iñ·8Š‚E=<Ï£t©º\0l•5&¿Ÿ9\ì\ÃK$†I\ß \Ù\ï$•§\È|f¬a¨d ,³\ÍH\0#\Üf‘¢¿©¬F‰-t\nÁ—1ıs.s\Ãûj“I{0<®‹ÁÚ†6‰y,Œ½öQó5\ãü6ÅŸ\"ª\ÖOOH\Ë>•ef.K³\ä\Ã\'³\n©\â“\Ó\á\ì\ãşE³\rœ\Ü\Ò}\Ò#H‘ÿ\0˜ÿ\0ºŸu6\Z\Ç\\‘R½‰¤•„\Ï,ÇŒ\è4\ï\ÍÎ‚07/\0/fc\ÇÓƒµğ…‘ş\èÀD\Î\ÉKD”‚!$ó¥¤y)h¶ş~$\Èö`\n„ö{ºš\Öc¿\ÔQ\å\Ú¹s®\Ì?–g<ş{\Ê\é:}=7zF3\È\Şb=\×X\Ò\ã\éÁ®\Ì\n4ı>*8™×¨Á\ì#T\Ï#Ê³\â:\Ë\ì\ì\0\n´\Ç\Î\Ê(\Ù:\Óñ³\â£7¹;\Ğ*¢Fsƒ\èU\Ö@\î\ÉqŒr?\Ü.Jõ0ªxŸÓ‘\ì*\ßO®\Ë#ª\é \à«K‘±Dh´rab¨rb›j;°+\Ø\ä€aB\Ï\Â\ÒfR G>9\Ş`~\èF(`!„šLJ.Á¥öÁAi3k\æ}Ï„sMüL5óƒ°QŸ#ıQÈµ]G\ìG\È\Èù\ßÓ½\Ô^œ“æ•ˆ\Ç\î.ŠtG[PSs5|x\â 	\î¥\ÆÍ“0J2KA.±´ºù\0´ô{@\íoJŠKbe²<\ÂIƒ%H–Võ7MÔ’®˜\r’‰gZN\Z\Ã|³¿P}TD2\ì^¶º‹ó`Áy¾PQ6³\Ü3r\áa\Ã\ä=E²×±r$\ÄÇŠ<w\È:\Ìt‚=¹s\Ém\Ã\Æ	³³\Ş\ÌVE$nle\í\ìñKE\åf¸fA$\Ùò22\Æ	+\îUöÿ\0Rª\É]º\ïc\Ï\Ùõ)3¹\È\ìv	\Ô\Ìu#\ç+D!g\êø\ØG\æA\Ôi<\Â2ğòUú–»€ı*Qƒ©aG7-0\Î\êj´V\ì\Ç9À6 Ö“éµª~%Î‘úT\Ãx\Ù1–ó‘¤¬wlš\çµ\á;}1<\Ãs\ã\ëQ\ç|Vcmü’r. \Æµ\'úLÀk\Ü,W\r\Ï\\m\ÇÖ´ı4\Ë\Ê9$dm·­L:n&¯˜\Ñˆ‰öMxğ§ñ¬³±{\æs/k’6U²0u¬”öò·±\ß&İ”Ï‘¥hUF£\'$r?\ĞZU¤¬Ö•ù¹yS…_\ÍTº+	õ6®¿HITiA\"\Ò\Ğ\Z<\0‰	IK)¤$DQ¤WH\Ê$@$ ¬u\ä«\Z¤<®¡–Á±ş0­t=K±2\á ?* \âÇ•\×\ç\Ù\àGú#\ÎÃ“¬^dG\Ü>\é\ÔF\Õ\ïF	Ocd1\àY|hfat&¡;>’¦\\‘\ã>f\ÈI°½ñ½k1ò\á\ï©\ìöŸƒ¦d\0‚h\Íñ2\ä\Ã~U¤	o\İX™Œ™fY8/\n|\Ô\ŞÇ˜\'|Â«¦¤¥fô,‰\'\Óñ\Í\Õ6òj\ŞU\Ö^d8x\æl™a›’´ˆf³xQƒP“+M™d†\ÌR*Œı;6K9º?\Ïş$Zvqn‹!\ÛP:8—H”\Õ5\Ç>`\éxûA“’[_,‚’ô\Ş f¤\åb‰ÌŒ•Ÿ—Ôf+9\Ê\Å\Ôx~1‡‘†9CŠ\ç\Ò\ã\äI‹¼ò7œS°N`‹[\Ï\Ã\ì\é•¨\ÙcÁ†\ì+\Î\"\Ô?ûk l•Cøa€ğ5,©LÅ«.5\Æøm\ì>JZ%\Êd’\ŞUş“\Ã\ÃQ\Âø§\ê0\ãû<,\ßw-Æ‡ƒ;ğ¡\É	§§8wE\ä\â­238|\\`ÿ\0U\ë@my·‚q‹ÿ\04˜\\7^g/JFğE…2(±ô##J¤‚ 7¿º2Rcÿ\0º)\ß\É>s~¦VCù®\æ(e\íSx†\á¿RJ¯ş\ÊWuÛ„gbL\æW€º\Öª‹•\é?>¯gÌuŒ1hĞÌ®ş¦³’}ÀQ‡\İ™zš†Sıd)¯+\ìñşMfAÕŒ–œ*Kù\ë`=€‘B•nn\';ÌĞ‘c\Í;¿\Ä1¾Zòˆ\Çù>\Å?-Hcš\Øğ¤rl_\ásñ\Ù3VE+\âù\Ù/%ıBNfAB\ëg¨¬°Mİ€…¢¼	¥\ãõŸNÍ7H”\n¯EPÔ’bw\î›”¬ù/\æB½+/Jş	<ŠQü¶\åF|‚\Ğ\r‘A%\â\éÀûzo1ôiˆc3<\ãhü’I\Ä *\É2j`opš“(\îU\Èç¹¤>[7tbL³)\äG{ªó’\é_\È;&0Ci_\ë}\ÂyM;Oa,”;)Z\è\Ùz„º\Î$2e\Îc2n\Âın¹ö¡&Ÿ<s\Äiñ›¡\èRÇ›#õz\äd2/v\ZC,\ãy\ÂQ\È8b9\ã\Ï1’e}¤\Æc\Ò\à½Zg†\Ğ1\ã\í\É\0\n~;y ¾tkÃ7:T‡–7Ÿ@£\âĞ\Ü\'ò0¾½\Ç$ml–%\\x\ÇT–ƒO»Ri¸²bü?M¢:¡IùE\É¿)\ä®ı>\Öq¼-ƒ£ñ \Éf¿/Â´†\\<Œ43²GQg¨:Ş²\Í69\Zy>h\ï\Î\ê&‰†8{†<ñƒ,}I½Í›S†X++oÖˆMyc\å4iG@¿(±!ø}?”Š{\í\ï\ßõ\Ê6™ö*\Óx ¬\×I\Ò\Òò÷e-O•\âCx½3\ŞI),\Ú`gK<HÇ V*60ü†\'\Ò;J	\Ä\Úvé‰ˆ\0Zş`•i>P\ZDRQAHJô(v	6€:H(ˆ”\0A:\n‡[\á¨\î)É¾\ê\ß#\âG%òJÁqÈ«øm‡\à$>¯V$qİŠs©\Â2ùX\ï†C‘§°şc}®›©\ÆYy=z~EªIùŒ|@ov¨Zó/V1ùgº¯\ê¼X\ã\çHs£ü\Ò\Èx\\²µ9&\Ê\ÉJ~ae\ï\'²©\Æ\Ê~—’üVGR\Ó!\İ\áX\Ä1sƒ$.a`I<½g”_[m©.„¯rÿ\0@Ÿ\âH\Æ?\rg\Ë\Ì}Ê—§\Ö>)’C< \0,ª\î4”È§\Ø}\0S†\ãNq\Ú\Â[3\'Œ\í!M½!oõ?ö¶Q‹¦÷’®?e\Ï\'@1¥ó\ÓmYhl\êkxlÿ\0X%`¦35­ I‹û,\Îì˜¤µˆ5¬9˜\Óad\ã›Ûª¶\ìŸûl\ÏñÎ³ˆ9=L,F}\Ô4ct¼?:3”ö2 w½Á]<k\Ø\Ği¯\Ç\Ç8e„\0:gu\Ç\Ã\ßÏ±*Dr\Ì?Z2”ğ²;?á¬°dş!b°FY\É’Y>Ë¾\Æ(\r—a“#ŒgÊ“\é\Æ\Äq^Œa\Ø\'gN#Ev…L\ÊF‰€n=š]RN•–ÿ\0H\Ê}Ÿğ®\â):|?–{JJÓŒ6#91cg‘3©?“©ÙŒö\n¿V’ +‹7v¼:Î§Á\ìI]_„w\è/\áu5¢‚5Ò¤“£¦\Ï%ı1’«O\Æ{¿¦Iò_\êIH$ú¢\ä¨\ãï­€V˜\Ü5¨\äykŸ\ç;£—ª\ï\"¯¨}So’I\ÈÆ’}–»†ô\è,\äHùhY\'`6£¨\â\á\è™:“qZ\Ü@y11‡\Ë\×y\Øªğ)Ÿ¿Fu¬/ˆÂƒ5€	ùûªlL\àa”“L~FN‡Ë›«9¾¡YK§14¹\ë\Ñ\Ã\â\È\Ä\'Œ‹$²¬\Écv³\Âf\rAø\äu7g‚—›,s1’F~\åO\â0•\à‘coT\Äóš½­7<\í\å°Tir ‘^iVjûZ^À\n$¨\ä‚6½”¿ˆ` Z¢óFâŠ¯/±d\ì\n‘›(“\è\ìªL„\Ï\Ø*\î\Äñ(\Øø\n³73¸\ç\n>N¡ò*Yr\İ\'ur9®}I~G’¢>w\Îú\Ü0&\Ï!\Ş\éI›*D‰Ì¥?Â~S\ÅE­\ä#\"ph8wX›K\ÊdŒ$‡Š‘U\ä¾jVp\nb:S½;£\ê\ØZ\æ”\Éñ$2(‹İ\Å\\\r‚óf‰¯ghóób\ä>2};·\Ó?s°\Ş¦\Æ\äcù‘¢F½˜¼\íß‹”ø\ëo\Ü%*\ì\rcQ7\ã\ä0ó‹«\İYZ\Ù\Éa§¶\åŒú\'R.\æ-öJ@`µ\Èhq‹\ã-/dÁØ—İ­~¡\0Ÿ£D\Û\ã${…‘À\Öc\Zş´a{$\Ë~C\Æ\à\n\×@\ÖsuK-™=1\å†z,\æsÉ¥Â´3\×M7§¦f”\È\ÈûyQ\ÎG\Ìi_S\"t\ï\0_…‹\×_\Ô\ÍÄ‡üö´\' ¬¾a\ê\ë\ì¿KJ´“‹8ö \'	MFœHRÀJ«Ø¹7iV\n/\İ¤Z\èQD¤¤\ÚM©\ZH( €J$Fù’I@*Ú‚n\Ê\nƒÎ¼:Æ„\î*Ô±7‚¢pÿ\0É¢c[Sr\ÏK\ng³¸bŒ\Î|c³2@|Œ,%\â\Ã\n­c˜\Ö\ÌI&¨”¼¿’g\ßğ$\à`‚\é\å<˜ñ\îOª\ÓŒ\ï´68\Âğ{°­·	°e\ä¾`h0oB\Ê\Æd\È\Ç\Ì^\Èy\";\0¥hú¤ú>s\'\è\Ë§\n\Ú\ê\ßšq%3ü-\Ôxñm#Ïº\Ä\Z\Ë\ä\áÑ‚a}	+Ÿ\ÄuÙ‰Œ|Œ]F<©\ä.x\ß\×\çkUú¯YºW7÷r\Éj0o—òÍ’‚$\îQ«\ZüE†øŠ™h8N>§\ãûYSU/;?Ô•‘\ã\ÓùØ¬ônp€øPVşq~…“j\É0\'X18”\ë8\í_€q^vµ?¤±w€¸\ß\à.1fª\åº¹b\ìT\ã‚HN*@$¿f¤‰¿vP\r1g¸«7§¤dCÑš\í‚\ëg\ÙZ,\ï\Z\ÑÓ±Y¹&p³\Ëù\\ú\ÍyU\Z\ÃÀŒ*ö,Ü—\ÜpC\ä«p® ©µ9:®¢š\ák§\ÎE@ùs²Ÿ,U®\È>\nLyI©YF•aÌ‡1$l‚1\Ø0(\æ=\ï\'™k„\äa}«8&91ac<\Ö\é·æ¼¿”“\ŞÂ©’ø\ã¨ûy\Ü\r•\ÊGuÜŸ‡\á\î›f<1dx\ÂP \é\àşYy°Wz\ì½|\İ2=ˆ3_û,Ÿ\Ë\\e¤G\àc=g²úoøÓ¹µš¢L°¨š„ó{±Ë”%g\Ô\å\\}ôõ¼yYŒ¼3vª¹2&\Ça¶‚\ÏE¤\È\n§/¾p,¢UY\ÖvL\ÆóˆöP\äÎ«µg™n6Tùâ–’\Æ\n3¨Ñ®q\É\ê¤3\\‹\rÚ¤~\'Pü…#\àño%>³\åN\È\Õ\rü\ïşŠ¶}L›«Iø\nNüùUôYj­\æI_\äZ[ !ª\Ë\á\ë\Â1hó)‚$ä©±\ã…\"<z	Î,\íi! )ô%ÜŸ»B¸cœò­„{(øQ…gÒ½”gZa˜nE,Hù\Z!f\ï“\ä$°F\Ã`i¥\âtÀÊ‘¤HvŒz+\×-¬·\ç0‹üiN<p\Æ\Â(\0*óˆõ|&ó\ã\Ì2G˜\'+1\Ôñ\Í@nS\Ñ\Ïù›v]ŸU²º‡\Å\Ø:»º2a\åÿ\0ƒ6Ä«m[\'\á4Œ©Áú#%rd•\Ômò)ÿ\0·5ƒ&#\æø¼G°±ñIŞ½Š~~‘\á\íMÁ:„“\êÚ¦¥\r |şI+u \åñ¡`ã€X\î\ÂÁ\Òó2 \ë\Ş4‡­\É>\ÏN\á\\—+t×´ù\\\×\ë»?‡§GÔ€‡¦°\0¨D\ît†YÇ³ŒWSŠ\ÔT[zr	=0®Tx_™¨e\É\êô*,Á\ÍhYE\Ú0€@<\n;H)\0d¤Z\È´\ÒQş• O¾d{$—øHA‹ø’\ì‚@¤PVy\áü\È\æÓ£§ó\"B±\Í?ù|\Ã\Ô,&D\ØYBH\ìwgDzœ_\è\×ôK<Q†l\Ök™‘†\×\ÎÀ¬7^6A}<hûŸ\ãU\Ò\ĞÊ® &wõRN¢Ç±¾H\Ã?©Q—\ÅcQµ™\ç1‘426\r‚©³@)yó2W‚Ãµ(±i=J\ÛŒ¯\Õ\Ö>[ˆ$d\çó»l5<’t\Èñä›FHn†\Ê\ËRÂ¨Y0c£ˆ®¶*\'A…xO;yQö\Ó/Q›Klny \Ï\r°;Y‚\ãl”l5\í°VµŒW¿x\Î\ìWüf¸ó £.+S—˜dfDyšv˜	\Û0³ì²¹S\éù\Ì8´,#G“I‹¨\éò3\áF\ã²\æ¼}/SˆŸ^\ãE–i!À\0_!§\Ú\ç¼bğş,Ê®Á\ébuD\r\Z*DG™Ã”¯±4ı9ü;•”\Çs	(%ğö–36Š3#\Î\è\É<w_Áxú|\Ëyr\Ó\Â\Äşaœ>\rÃŒŠ·\Èú[pª\nXN$i ¤\ÎL¬\ç¼0z•?Rƒ’6g=˜¸“\ê2s\ç\ÍlñLJÓöGÁ\×0\à@üÉ½»N‡/5­v¥#Ë¶\Å\ì‡W1,=¨_>y‘\çs\îõšø³“6<frD)Sd\æ™.\È\İD–rXKI$ù½\ĞiNû»Egº\Î	Ü”ş\ÛøÁ¢|©1(\Ñ\Ø;\ç!„ö(*˜zš\Æ›<\ïÿ\0…\ã\'ÿ\0÷ö•\éğ\åj\çö†%»yŠ\Êqğ1qV“\àóÆ£g\ÇG\ãm\Zdˆj#{p™\á÷Oº—›î˜¸\Çú¤\ØP2})O”>Ê‰’.5+gó\rl«^\Åi’ÏA\ìõR¢\Ä?‡eØ°Qt¶\íºòÿ\0\n#\ÉõŠ\Ç\ÄopŒÁcp§ˆ\Éú§\Æ ¯œ£¢`©\É\æaú\ĞV4\Ì	·³\Õ>!–³ÿ\0u1û{¨¯gª}F¤\ÛÁ=”š²‡M2ğ\ãì­£f\×EC\Æ\0+h$\ÉyQ­\éx\ÛUl\Ât0ñ¾2A$Œ\"Áò­»€`0À?-ƒ`dT9\Ê\ï×‡#\Ãß»öS%›;)\Æl‹\Î\â\Ñ\ïÊª²”¶JC½SŒ“s\Ø^\Éc\İ.*S’D%8ƒ±pŸÁÎŸLÎƒ!ñüC!x}£3šû¥X$Tq}oq5œ-]\æl9®÷\é¿g….\Âæ¥’u\"q`v‘‡uw§ñK\â¨u6\Ã *ƒq!‘’©´Áp“ó|\ï*\ÂL–&\áñòlB‡¦\ìŒ!2O@@$•.•\í”^¦4H\"\İ\"£Mö%~”Œ/d\ÙFR\n\0‚$E\0¤L<Ñ­i¼ü\ÙPÁü\Æ[ƒšü2y@, ‚¼\Ö[XÇ;òş‰=z*\Ç/&w*O1C¨\îZOI,°£­#1“iQG‚›F˜ZÏ¨M\æqŒ‚oS‘²JÀÃ³E-O`cd\ãc²h%\ÆIT<O&°\è1£Œ4l³-\ìQ«ş\È\Å\Æ× “0\È\"\íq\Õ›§dÁ‹”\Ég‡ªÁú\Öq¿\×5­8\ãdG<ò¼üŒÁG\ï\Ïk&$ı¡’fÅŒc\r„\ÆNVŸ</|l’9‰Qñ\æ8ò=‘?\ä\'º\ÏÅ§]GG{\'³6$†\Ş:¬$™\ëRõõÜ‡“g¨l­FØ¼\ã\'×±X¬§^t†\ÏÖ:\ÕÁ‰>g¿\Z$‡&\è+)š†‡…ùX¯|\ïó#6U:cizp†V\Èù9¯e37‹£Ó\ZwÀ¨G\Òü\"\é]Z\ê`÷­T\Ú4nK\Ãa\î1\ã¿\è\Ë„t(z†w\ÂGL\ŞW}!K$0VS#\'\â21>h%jd,?rùo)œŒ£TÁ6dùy\ê>D6ºÏ­!‰\ä4y\É$¨’d6J=È\Ù*¾I~\Â\Ğ\É=’õ\ÙG\ã¥©.¤wO³Û¹L°‚’\Ê\Ìô~À\ÚvCB\ÚL¦$O[\n\ß\Õ ‡¨\01\Ù&ß•3\rú*\Ä|bı\á\ßpõ¨‘ƒ$>^Y\à‡Y\Ğ_%tçû\Êl^»Ê©\Ğs9\àFv!h\ä=›\Ïx_\"LN¦F\Óá¼²–º<ñk\ÏÏ²½½w°\ÖH£\îUtôX§\ä›Tò\ËJZq&6’ G²³&Ê%z\'ˆ\É8\È\Şwc†öR™ú#i9;\0”q\Ø<’¦°z\ZSè‰$Û°QMüÖ¥<¦H²\ÄG„ÑŒÔ·°\"\äµE\ÏT\át\ée“ø˜o\Ë6>H¯wª\Æu9\ç0„cc³\É†­\ê\èA‚!Q„¨ù ŒC`H®r\rü—¹]\Úõñ\ã\ï\ßvSŒJ\'f\æ\ï4od[P#²6!hÀ?¼ú‚^\Å5½vJa5N´R…¼\nØ’‘V—1#»Q£|\ß\"SªQf\é+5J\0ø¤W\Î\Â\Û¸I\İ\á”\î4¹8Ÿ—‹11¼|ğ<\ìG²\ÔiYğeÁPØ‘›>3\Ü,˜5 ´$\ëG8\Ë\Æyxüÿ\0\Z:§@@M„\è\Ùf´¾\"&£\Ê	}og­¾\éõ\'Q#D€)6+²J\"IH@‰	%H?\ÕH#œ “h*S‰\Ç?ª\Éq,¬“P³~˜¥i­k\ß\r#ñqx6{\ÖJG™^\ãd­0Åt\\\Û„Z2h‘ :G²±cöŒ,—;›ˆrıœ¶¼3ø/\ä]“©­\æ?\Öb³\Åw\â±Z k]Ã¸Ï–?Cõ‘¥\Ğxf*Ò±=ùÊœÕ‚lœ5¥t\ß#c|d0Ÿ‘\ë\ÈY\Îm‹¬ç–•”ÿ\0H^¹$ƒ\ç4³Áyˆ23\ä…e¥\ã\Äü\è\Í|\Ò0*\ÖUu\Âø\ç\'Š4\Èw\åFZQ\ì\\m˜\ÆÁ€²Ÿ\ZsŸb¦Öœ¢¡k¹&\Z\ë”ò,ülğ@ ½rGË©GNÑ±E’€Nİ‚\ÎŞ0\Ôòt\ïp«²r²\'2Ú«eWù\n\Ôò]\Î\ê)7d¡#ü\Ö\Å\0lû›R\ãe\Ìl³º•cz¢¢\á\à\Ã~6N\Ö\àAz@Œ\n\0„üb\Ğg«nQºD¥8\Â$\ïa\0 ú»¨\Ç\áµ,¬\")=hÿ\0\î¥\ã\Èw\Ù5Ÿ\ä`\Ê\Å\0ÏÙŸ\Ç\ê\Å8OÓµ(õ\ÌVX¾L¶OU?%’@\Ç\Æ~B<+r`\ÌÆºE  °öY\'\ã\É\Ã9|·\éR’Oğ½—>ı\ìz‡¾|«¬‰	\nª}\Ô\Ó(1Š \ßb¡\È,\Ú\àzÓ–#”\Ã\Ùf”§‹Hù¤\å\"…&8ö\İ\0\ÊR#‘\Ò\çM¾«f¨r\ß2Ÿ%\à¼lªUHŠYf\Ên›j_!H1”\ÓdG,ö,©\"]La{ı”¨ğ\Ä_<\ß;\ëo@µ×®\×.\íøkC\Ç\Ó\ÎG\æMl€x\ì^§\İ2ƒ\0³2òô¸\ã6û¿^¾<}\Û\î\Ã|J/¾D¿° ”óco²+p\ìÕ£ @<”\Åú!\î<£­»¤¡nÿ\02ˆß€\ïF\"€­ì”ª÷G@p¸\İE3`\ï°@±.·´ƒ÷@%Ja´w¾\éo\Å\n†OÔœ\Ó\î’À…˜”t	{>x\Şwağ­t½f|*.?˜\ä?ğ¡\Û7cÅ‚£>\ÇOvÁBQ\Æ\Íe\ã¿q\Ş3\Ü)\×k›G!cÁc\Ë;<\Ê÷‰:c5*,=²ÿ\0uAªB“N|oaO‚	¢h¦\É@$¢J)()«\ïº7¢Bƒ\æöA\'d+\æ\Ä\è\å³\æ÷Q¤«\Ø\ØVúTq/TÇ¹Z\á\\\Ù\Ïd\Ú”«?\âc–J°ÀU‰M\İÀ\"F6  :¶‚Î%s,÷3\çw¬…lt­c8\à\í‹q\0~p±3;WR³Á¦ ‚FE.¡Ã°\Öô€.^ºŞ†\ÎHa¼q°@³Í¦øô¸g9şzt¹\"\é\\\èğ4I\à\ï“ xŒ®o\İ\Êb¬²ü5\ÆøŸ\Ä\Z2;Okú—Gü\Å\ëş c¿ü\äz)G¥±\Íø ¥\ŞÔ¡c‘\ÈÀœJaL3¯“ŸQÊŸÖ£\åÈ‘Œz’Lòva*’œ‰Ë‡‚²Y™_B«p¡\È	R\åa’a}\ÉH\Õ:xUü\àn„«\Èô9vSÜŸ2ŸV{ G²À€§ä§¹)—aQ‘\È}]JS\È\nd¸OØ“°@gnS9’º‘–ñÛ°MHûey%\0\Ôd+şŸA°S#\ë\0%u=$¸‡;òb\Í\Í¡õ	ğ\äÁOH\ß\ëØ«{a/\ØM‘Œ`/“Š&\ß\Øp»Ê¬—JŸß¦¿©\ïş\ãÿ\0ALÇ—‡§!1K\æ9­Yš\Ë1XşüE‘,ş\Ó\0ú‘¸Xg¢WfŸÍ¸z¨ œdaEıÎ¥\ãgI\0ğÇp—6¥y1¤r\n\æº,waùz\ê_L!T6Hâ¿¼1^N\æ.ß(ı9·ÿ\0õk†d	šº” ç»\í\è3Óµ_:\ÓÅµÏŸÿ\0C\\ø‰DöŒbSö`\nD‡\Ã+m\Í%tÿ\0šÀ]Xh‘Á³ós¿\êlÀA‘\çœ\Ğ)\î˜cÜ¡W\ÜW\İtI#\Û~›¦\n\îR¹\ÎRú`\ÛùúQ\Ò \ïØƒ\è€e\n@\Ït	\'m÷B€l\rDI\æ\Ø\ZN°M\Ñ<1\0Ø§£c¤¯n\á:\Ée\ìŒlÛ¤zôC¹÷SA$›`ô)`mhV\Ãqº@Á\0x(\ìú%\Öô‘µ\ïiUJ$\Ù÷N\Ş\Õ\à$vR®Œn6DÃµ#ª\Ü&öA”cv$Cp\Ú=\ØGt®~AØ£ E\Ö\èQ\ÌLŒ,™0¤ü¢mğ<ì´˜šö6H@`›Ya%ZN\Ûml\'d ‰9À ‚be´,\É#xó‰#\'oe©\î„\ĞI\İ(\ì“mA’RQ’‰\0”©a\äŞ¤Œu‡›H\İ)”v)ù\å\çÇ”-¤\î¶r\Zü¶Ö™¯»M\È\Ó\äeÁ 5C{T	\è\Äfú„¶LúdıI\èƒ\È-k	´Ê¸\Ñu!§>W\Ù!x\ìôQq\æ4p\èÆ’\Ù#\r\ìH+,óe\\j\ÚÁÍ\Çc’\"¥Q„;A\0U–‹¨°I\Ædõ\Ío°ô\Ü\İ>¥”Ü“sˆ\ÏÈª\åÆ¹›3Àõ+°i,¸\É÷Y\Í+†0õlŒıH²yq¢›’<lQó+w\æ\äh™Rc3KÊ“n\Ç\Ö\ê2«\ÃÑ®:\ĞY)6ó(‹™sR\Ûñ¥&^ùf6ú=\Öõ#V¬tı3#S|Œ\Æh%‚\×]ü\Òò0õ\íVl˜\é\ìÅ ¹ŸH\èò¥-»\å]¿ğÀœ™õ|§Š¾H\Ôe—¶˜\É\ÇQƒ\ÂN\\›•Wü”L‰\Å\ÜlS©f³\äı›¢¼v|²(úXş\Ë\Ô&ˆQxª~¦T02\è.0c\Ñöò)f¤­Œ`\Ë\Ôæ¾”ow¬¦n\\™y¦BM’¯x‹0`i\ØúDO§€5zª>y\ß\Ù©ø\Ì<Š\Û*e\Òb&[\Ã°Œò¨Ñƒ6\ìœxV\Å?\ÉşTÌ´N\Ä Ğ“x\Í\0‘!y}‚\"{ ¸n\æ\Óf\î\É\Ù,ı¼$HA=“²-;ZV\Ôobš$ ¨]³\ä	¹7®p-- °\åR*<±\Ç ©=­A8oa=\ì\ÑÉ¸VO¢ò{ ¸ªş\ĞÏ¯Ç¬fÒº§“xde+¦UŸ%?\é)\ÒM *9\É\îß¡y4\ÈN\â\ÎÔ¬\ËöJ+$$  ü4Ü˜,R_Hó“`v	\ÇıŠ«²`\ØƒaV›!\İ\Ê|‹=“$\n \Z\é\åzKª\ì‡%„ty«\çL¿p ƒúŠ*\Ü\ÛRv¢\îj“‡`\rH\'\Ğ(g\ë\0&Á[„øº`ó\Ù\ÕnKgº,\'?Ê‘”Ë¢œ¶v46z\Z²—#\0 ©#.6\âi \Ãól-+÷4¯´\Í@\è¹\ìM\'/Á¼¤fI#kõBO¬£ E´\'d®\È÷¾È€R©M}\Â\Éğ–~”‹dD\ØL’X\ÃIF\ëd–¬÷c‘ˆ\áÄ¨™\Ó\äğV\ÃN\Í8\Ìyw\ÏTVH\ì¤\áeœi\Å$¶À’˜\Ä\Èd¬\î=¤„\ÑI)8óò&Ş¨\Åh$[}GC\Ê\ìÆœ°=±º½i6şnmÖ‡vAƒ\\bUnªXùÁ±\nñÏ¹q\é\æJ\ÄAj\ç…¼ó0z”\ÉNE!Š@ñ\Ü \â\ç;Lƒ\Ê\Ğ\àB£Sru,œ¨ù$\É\è¡%J‹6x`tFF\ã»\Ù]~\Ô\ê\é\Ì\Æı£0˜Vl 	[\î\âL<¦tø\ï7·{Zix\Ó|\á\ÆÊ€?nJ\ä¸FC‘q\È\æsidÑ³j\á\Í{I\İFQ¦48\ÎF\à\ã4I\Í^÷™dóYk¬ükrk{FÛªª*\â+q\Âı8t§=\ãw>\×hü1Ï¥\çNğ9 \0Ÿ0uLŒ|F\ÂÀ\ÎP½øIsğ‘Ê–>I\'\Ê+\Ó_/ùtVmU™²tóqÏ«\éY¾¢ƒœª\\÷ó\ïØ²@S§]W#¯\ÄO\Ü\Ğ4µ@\Èä˜4}E˜1u8†@7¹•‡ft OŒ¸\ï\"„¨22f\Õ5\É{½ä’¯ô\ì>A}\Ô-N%\Ì4I+_Œ2?>U`a\Û\n_ »7°R:q\Ò`Y\Êdb]€P^H?\"•;şzÒ‹$—ÚH\Í9C7÷Ló€\Îr\nS\Ş^wI‘\àı\0—¾\Í\ÙHfã˜ ó±Mşñ›£ \ík«MŸó\Ú.r2ÿ\0\Ë;n‚bJ\Å&’w¯D\ÊÁRI°v&’ú|‡Ü¤\Ñ(!0\Zò‹\î–v_:nşz\å(>\n@«¤·\î(„B:	7ğSd>@9\Çvy)<ıö•&ü‚’jÀ¥|\å\æ\Íª¶%Ôˆ³kM\È\ÕbÓ¦ù)0I\å¤Ï‚\\J\ßÍ”\\ö-`õ9Ç²·)\Ş\ÒÌ› ô@#Ÿ“ºm÷\ä%\è\Ë=\ÈR|uºP\åÍ¤\î\0­Ò­ı\Ê\Ø\Ç\Î*\Â~xÀ‘\ä¤@]b\ì¥\æ’#Z:Hğ3P²\n×¨´\Ä¼w\İ<şd*I\ä\Ú\Ê8=*Ñ€6S\î\ÊA{\çE\á;–\ÂL\Ü*L{†[‹y÷	\Ú²i÷Ì…`¯“²l¬§#û\"Ÿ`M\n\à\é‰^XÁ\É|\ç`Ÿ\Ã<¨£ó$¾\Ìb™·„p\á^M\Ò\0ÿ\0I%ş¨\Z\r»\İ..&\áf˜\'z=Ö¤?œ+	Î´\ZF¢_P¼ı“:º)²–ò\Êw\é²4,ú ¨<\æ\Ûy\n—%¥’Q6´Pú,cE¼±P\ê-ks$\r\ì\n5_úV\ï\á\r] )\Æ&\Êp \á/IK‚vHA4H ,´8úº´\r÷]G¾Ô±-SWiô ¢\Ë6¸9ÿ\0›\Ö? *@­x€ó\ë™_ú•`Wr;õ+\Ôß†\Ñ|?\è¾ğ?©^Zf\Ë\×\\-‰ğ\\7¤\âö\é\à\Çr-MT[j’ô\ç›\ïJ§1õ;\ÆÇœ3‰,\è’Â¡Ÿ/¨12|H\ÎEi\ÙŠ™}ˆ\çT\Ëû__šm\ËöWú±òIš.\Æ)ş§d8I\ê\0\ZúS	£\Òt\á§\ã±ò²{5Œ·rŸ\é\ìdy·\å	\0\r«pû*L2ó¸\ÙG•ô¦†\êD”õ@G\ß\İDxN¾F±*$¤3}\Ï\ÙH\ïÖ‚l°×­”’v\ì…ù•O%\0ÿ\0\0!\ßw	»ZJ29\Í\Ù ~\Ş\è\"\ïdô\îBF\á(\Õö%WP\×Î…¢¡hP	€\Ú÷ ‡ÌŠÁ¦\Ò4\0¡[¢;Š>‰$Ü p_ûR²]ß€P?=\n\ì\Ã“\ÙòNl=wö@\Ç\Ïb†\Ç\É@á£²\"\Â{vN>\'İ³ú ‚€b\Ë\nH\Ø\n)o\æHdJh\Ø²,U”\Ğ=\ÃÀ²\Â(}Ğ \r¥øØ¤)2y\íõI\Ë\Òn&ü„ \â\\}¬\'3YX\ÇtŒ¯\İH\Ï\Ù\ìöA*p·}\ZØ©F#½’«ğ\ŞFU+BI\î\ÕW’‘\Óù)\Ç\Ñ\Øì›¢\Éyö@Ÿ\éó°\î @IÛµm—\Ì•4\×,$Z\r\"ùHHÁV\'\çK$rU Å˜Èœl}©?\\€¨2¤\ì\Ã¡Gñ™Q\Ò}6Í¶¤eH+\å\ì“!DvtİŸKB¥+d\ìô\ç}ŠbÀ€(Sm(\0û\î‹=¥\ê=2 •\Û~!$ó5A\ç-/0\Ï!l®‚¨\Í<\Ùr}\ÓTö$•®8Nõy\Û8B ­%\É(\Ğ‚  €½\á¬ü}?9òdór–ø[ŒMK\nWSJ\æ0\ì\í\Õş6;ñ™“,‚6H\ËewY\æ\è\ÂN*5Yš®Iõ¨`\î•.ò¼XL\Ù\rb¿ñús®–fF\Ö\Ùq\0/ca\Ç\ÒdqŸ\îá‡\î˜t\ìY­`bAˆ\"l™1²İ¹\î¨c\Úy+ø\ÊÇ½o\á\ÃzÀ\êaI	5\Ï	+\r¯ŸE,\Ï	\Ùlõ©[,sÿ\0†işÀ\ì°x/\ä\Í\È\Åf\á÷J(O\Õ%fGó³{m8\á4X\ÈÜ€ò°8w \È\Ò+~q<7\å„\îQ\Ú8\0¨)§¼“¹Q\åyNI!­”I*¬¦Fe;¨r˜\ß`¤=üı\Ô9$½’ğtL mi×Ÿ7²ù<¥<#\è\ß\Ê#°öFóEy¯Z@ ]\ì\ï²\0{„\à]…@–Vû¶\Ò6÷´d{¥\ZAşˆ»?aü\Ğ\'\İ\0€v| ƒW\Ìl”»\İ4@´¯º>ã»\Şû¦{öH»´{¼Y¡G².CE#\'r\êBû:Òˆß¹„»\îJ@¾}\Òy\é¬\ßtvt‡ğ\Úpö\Ü\Éı\Ğ\0“µ‚A#õ”w\Ü\é? ói\ZbõH\Ø\"\Ü .¹™\ÌJ\0X\ï²`šO7MI»vEÜ \Â\Î}Á\Ù0„	ùHH$\Å \êl¬2GSEW\0§w\nØ¦-s‚‚e\ÅÇ›e[LS\ä\ÜÕ±VÑ›Lœ·gkI\ì\r ò/k\ÛÔ¡·\"d–q{İ…B\ÃYtUûÿ\0\é’\Í\Îk\'½ E‹\Ån–\0¤€Œ\r\Ø.\Ê\Ô\ÄF^NÁA‚ù>\ïy²œÍ²\È!eû¡²\Ó\Ù6HğR?BWS\Çtt=ü¦\Éş¨“iLM\ÆPR¢º…‡e¡\ê?ıÏ·…@‘\ï\Ã\Ô me¾ ‚SÀ\í·‚ ó\ËJ;\ãR»&UJ\×<!’dŠ*u(’}e^7®]˜p„˜\Şg€§œhÓ·‰\Ã]\Í\\§iØ±\åd+ù\Ñ\Ì}Jiø\Äv(A$˜³²V}MO½…\áb\Û7Ø†\\nfò‹$ªı\'\ãõ(±bwE—¨Ï˜ORšÓ¿#6	ı\nN– _\ÖdD0\ÓŞˆW\èfA¸bxü†?p´°e\Æü)\Ìs1ñ€HeöYœ\Öüf«)?Ctf&	Sqê¥°\ÛA’P=J\Ôiú\\5ÀœK\Ê)\àú¬š±Ò¥1\æ5Á\Ä{£9\èõ\ßnƒ\Ã8\ÙGô_ˆ˜2‚ô>À.øzd\ÌüBÒ„\Óo|ŸÑ‹\Ğ‘Ş¨,0\ÇÓ§r·6@]$rQa%’5•ÀÔ	§\ÆlU¦Ö¥š)ßÁl’FzUG¨rfcG•Á1\ìO²Lª\Ãd\ëzl\Ñ~·õı>v.‹/•\Ïx>q&¡wa2F·\ïÒ¸Hd¨²Í©\È()@•üç»\rH~\åF&Á>\Ï??€y\r\ØH7`÷.û(Ï¾d¹Múı“R€sú€’J·t–]o\Ø\Òpò×¹F™#}­,X; \îß‘\Ö;Y(\êÁB7½\Ñ	®\Æ\í,\ÖÃ²N\Ô{\Ú >Q\åOTÑ°K\Å\Ğ÷\î–\\\á¤ 	;x@y¯¨÷:8/ı¨?µZ7’Á¶öƒı‚\0·­Ò‰\Ûn\áÜ¨»Toqcr`¯î•²™\0Ÿ4wMhìœ‘õ²/¹4@bÉ½\ÂI©ï¦g\ïúi\0\Ù\"@&’ú{\äš6pA‘\Ù\è\ZôFAº% U\ìP\á.6õ	\Ê\ÛÅ §‹\İ\\\ãÔ‘¼*€>~bU‡¬\0Bj‡V™6)x“‡\ÃI|AL\çºUøR~X;²\r:¾r\n*<ô‹dBGõ PK@9ñV_0†eøZˆ\ÍÀòA\ß\Ñfs\ÇöªŞqc‰»FL‚6ó\0V;*nlıy„\"÷(ÀŸ™\'’¤šc{\î›?–À.öò…—}\Ò·\ì\ÄÁx  dMş´6\äß¹DFö€]\Ò	7hoÊƒ8Â•$G 0\à¦\ã?\ÊÓ±Ø\ì¤\ãs!cOpĞ‚F.SdÅŞ¡FóJ.Q\ê¬\äÓ£\ä5j!\Ó\æa°ANV³3»M\ŞUƒ\ã’1ó0…\\ï¨«Á†ú8?x\Õeb¶U\Ğ~ğ)\ìØ¿\Æş\Ô\0\îŒ]§6¯Ÿ•C¡\Ñ3\Ñ4q‰\ì¥ş_7\ÈOóB\Ê~Lò\×*±æ»ûRe\Ü\ç¹*í‘‡³t‰\à’\ék+¡JS¿§( \Õ)g…6qv\î´ó•Ÿ\é\ÎWLü)`\Èü@¦\î£aÄšBWzƒ\Ó\ÔR\áğH8—Sya\ån\r»¤t\Âk·¿Ym[©’FG\Î\r³\İe\Ã\ÌbGDÏ’$‹ÿ\0…\Òu],j˜Ü—\É \ìú\\ÿ\07\Zl\Ó±–H;,\ì$\Ş\"†‰;ĞŸ\Ú\×<\áb\ÏüK€§˜Í®…#ü«„‹/û¨rK\ØYR¦yôP¥’\Î\ÂÊ”£\ÊMw\İE\'\Õ9%o\İD|”If\ÉM\È\nId\0›?r,\ÚlI´°’v;„ÀŞ»!ÿ\0!m\Ìh 	\0w²#\Íÿ\0 H{\Ë|‚-\ä]’’$ “[\Ö\å\nª”¾T@~¨gt7÷NÛ„\Ğ\Üø\ìP¢%Ğ•{›s‡¶‚\Â{!°J)\0\ïŞ¾\è>É²M%öp‘w\"\0¬P<\É\ÙK?\äH%\0\Ûí„‡Š±Iı’^M¤ó\ÔüRo¦jÑ“l£\Ş\ÑWê²€E§Ÿ\"\Ã\Ù/Å“e \î€]ı‰H=÷@\É\á\È ÷O\âHY  ”Á\ØZoœ\ŞöKmV>¾>¡etùjG\Çf\ØV±3\á}–<Ÿ†\×gû\Ä\Z\ì\É\ÎÀQ‰aù(7@±wşÌ³y¿õ;•Œú€•C¨r?*\ê‚<%bø\Ø*\ìHÌ’>gù(²d¢ mó½OŒŠ\nc[\îP\r\Ë\è*“b‡p„\å\"2~\È’KM„¾İª@€}‰JHm\ê…„`\Ø÷Hÿ\01F\è€PKa£½¦Gw%Úš\Ò.`\Ëlp1¾Q\ÖA\Æ\ìû4©ò52½Ê­›*|ƒù’-fkW\ÓjX±Rz„z*\\¼–ä¿™±†&@¡dZ#»\Õ\É\ÄŞœ\Ç=©Ÿd\Ôl4Y\æ\î\Ó9t@)lŒ!IL¢„¨\Æ\Èç­4‰„™÷ò)f8.‘²\æQ\Éq\ìw\Û\î˜\ç?¤¤‰_$=<{¢‡büƒK\Ö2·\Ë##]: Vğ§cğ@mñ‘o£$´Lş¤0¢£\êz.6­\É0\0¢O!>\ËOr{\Ë\Ù^K§i\Óic,„I± …°‚³Ú³º\\w¦»\Ö:W¾\ÅD§œ\â<\ßJ‰ R\å~E&NO[)3\ê,\ãzµş²Ÿ’ÁQI»…¢)#t	\İ7vl B¶Mö}\Ú2C\ÆÄ¦“¿@«´„‚~ …×ºJÚ’P÷²’v6ot\ÒX\ËEtR\Ğ(÷@\06{R\İIö	?=¤¥\Ğ	ƒŸ?/\Ìı©P<\ĞK\îÊ ’‚ıÑŠD\0	&· SI\ßĞ›zPú+d‰.¾B\0\ë°I\0\Ù ùGg±ªE{(„]¦Ÿ%lŠM\ÏÔş\ßP4€I8\é\Ñ\Û\È)}˜=\Ê\0ü–\ÎU$š\é\Ø! ¿mK €?p’^	\Ø8=O\0öNyf\à$\Ïü’¶\ÜH6?¿n\Å$\Å>\Â2\rì£€}\ÊlŸ4”G\Ë{&.Ÿ\âıø\ìX³|J6L@U\Z*\Ûô\ä\î\ä\×c½:vw$X@1\á\ì¸OƒÚ»ª/«ˆÁØˆW¿\çA.±\Éøb6QgşòÊ¹Œ\Ş.\ä\ÙY\İRN“$}\İ3zù¦C\Øl¥Š4«´\æ@Á\ÜùS²)‘\ßdYM¾‚Y\äŠ?î˜€õ$´ô¯ş¡‰†Gó¿`„…½Ø•*aö\nbZMl?\İz;\r¡Q\ä@Èx¯p’	»@:ˆ$°z£µ5R¯ò„PBœU\î’R‡u\Ô\ä‡^~D\ÈNIô„\İ%_©±ö\î\ç$Q¢˜f\á<&‚Æ»°89;\ÑK10\àú$Pü\Çÿ\0D}v±\×>û¥Zt¶@ò/°÷C”\ìmÄ½\çóGP\í\ã?\è/a÷Q`\è’—Fö\ß\ì~\è\á\Ê/ı©\Èöe$r%€h =À8J‡\Ö>¢\Ö0\Ê*…ñş‡4\È}1cW!\â\Õ\Ç_\ÒO:p(ÑrT¦\nL˜ş0?\Ä\Z4\ãÖ•ÿ\0¯º\Ïqı2=6qİ’+\ÆI\ÏrxxYÿ\0­3÷‰ö;*\ìƒ\İ\Ş\éÉ½€U¹\'\İ‘¤;]•òW›Ky ü\åGüı\Ñh8t“¾÷ºC÷H\Ï\î	Lö¢}R¬¦‰±v€öLüY@|s\ì9\0z ^)ÿ\0T\Ù5\İ4‡=\Òr›¡\Ô6JB«K=¶M|Ô‹qØ”+‡„^l§;y\İGa³[€‚\ËıQwG\Õ9~7\ä‹J±[nšJ±\ä\ìñA\r‹*\Ñ\Û; ú\\’^•»²möwoB…H)²ûÙ„\'¼&\èm°BC®-–(€¿\ì(¦(¼ $U‡“6P/ùPD_ş\ê€|È¬ÿ\09$#½›\Ú\íŠAÁ!aù™>}÷M~\é%û* ùŒ>=ö\nñd)!\äJ$?»B\n!\Å%H/ea,’Š­É‚·cd\Û\êE6b3ğZ\äø\ß@$-RñL\rÆš\rB2Aa¢¬4\ì‘<, ›(&‹±wY}RA.\\xÀ÷<\ëG%t?`²A\ã#:y\ë±\äb\ruLn\Û\ĞL\æN^\ÚNaØ\ê”i\rL{P@?\0C\ÌRAç\nl\Èd \Ì\04ı\0Ÿ%1\Ï\ÔÈ„²¸’\0«NcÀH±µ a®\éN\éS¼_ M€P »zP`fû¢a´ l‰û%2¬YE M8 vAL …¸\Ò1\İL“ìƒ«\ÎL\Ç~e\Ó\×,\Âô\Ù	\Æ\Ä\ß/	Şšw j\éE\Í\Ñ4\Îİ’\È)\ÖFOd\çH¬\îN¹‚8bU\'ºHr)\ëIˆºvœ\ä>A@\İ.0\Ç|„„|ÿ\0>\à¿™\Ã\ì—Sãˆ„Œ¿KR±ñ\ß,ğ°v{ÀQºa\Ç@2ø³JM\ØrYaÇ£ ü†21·#¥o9*\\Vl­#Š¤G\ËJ@;(\ì\ØRp&~>©¢1ÿ\0\á\Èú$Ÿ\ÃØ$\ß%)<Y\Äp\æ[}:­\à\é:œ8Á}¤+?õ¯\Ü\ä<‘¿r«2\0÷V¹2Yª\n²SB\Ğ\ÅRÜ€Tbñ{§$>Mn˜2(´Í¿y»#7{&Á» Ÿ²ó¿\ç“\Ï2\ãù¦L‡\'õ*EH{Áz:¦\ĞƒÉ¢<\ágÖŠL†\ï6\ÃUD$\É%·”\Òp{liş0›ôª¼¢\Ñ\ÑØ„ ˜ §#õ\åpR¢÷JB\n#U±@\È=B¨ß·H´BM‰\îœ\ÛjM<^ü\â\Ò9\Å×”«h4Sd‡›(xğSRX„™#\ìSoº¾}\Ê:	p;%u\06l­tÌŞ \'k\ÂA“f\ÉCTƒD!#6Á\ØnSd’R‰\0ö(ªˆ%\È\0\r#5hx@(\"°\0CbSFJÚ­8_²bB)\0\çPA\n\ã\ä’\ÒK\È<\É\è\ß\×e-Y\Çøıx\èlÅá¬³\Ğ\é“E…j:a{\r\ÑX<ü&·•ğômõ±¦\É!=˜³\Ø\Ğg©Ü©\Z\æEiQ\Æ\0¹PÄŒ[#ì€¶‹|p«\Şğd«VY\'\áñiUA½”¸\ÈôNJk\Ù5l69\å~\ä\Ò`\ì`Hû\ï\ì¤O \0t±\Ù\Ü(e\æWù¤0—’T¨\Å&\ãa°rS²‘#\é©w4Œm÷QÁòœa\'¿(\n:\Ãd§¨&o\Ã;%‚¤Bşdó5M˜ö½’\ĞAZ°<\ÌA•u`‘\î‚*\Ğc²/Ô‚	*ƒE»dAfJ6}H †p<«şh<m¥XşùC\Ëùwö}eJ‹±A³Ï \î~\ê`úAƒ«\ï¢e\ßøeeø%\Îı—8½º…eı5Ÿ\Å]KõY‘û´N±WIô½Bò‚\n\Ó>·¥Á> ƒû ‚h¥³\êz3ô ‚\ï•#[\è‚\0>‘h ‚(ılNó¢‚8S\ÉHA\ÕRô%¥H9İ ‚m2\ì‚P†ıH „ˆ})¤@\"\Ê$TA }.A\0ğ\í» ‚\'\èMw\î‚²v)Œrz\è ˜L—\Ê\Âem\Å/¯TA-õo§ÿ\0\ì§bÔ„A$j\ÏwLn£c~\ígOÔ¥Áô ‚$\Äõ\Ç\Ù`î‘“ô ‚Fˆ;5H„@ Ï¥<; ‚•A4ÿ\Ù'),(2,'Gustavo Ricardo','Vallejo','SuÃ¡rez','oficial','plantel_aleatorio','curp_aleatorio','rfc_aleatorio','cartilla_aleatoria','pasaporte_aleatorio','Masculino','1998-12-15','mexicana','Ciudad de MÃ©xico','Maria Julia Calatayud','rfc_aleatorio','Pedro Miguel Silva','Arantxa Rebollo','C.E.C.yT. 9','fÃ­sico matemÃ¡tico','Ciudad de MÃ©xico',10,9,''),(3,'AgustÃ­n','Carrillo','Aguilar','cadete','plantel_aleatorio','curp_aleatorio','rfc_aleatorio','cartilla_aleatoria','pasaporte_aleatorio','Masculino','1998-12-15','mexicana','Ciudad de MÃ©xico','Ricard Sevillano','rfc_aleatorio','Jeronimo Gallego','Angustias OrdoÃ±ez','C.E.C.yT. 9','fÃ­sico matemÃ¡tico','Ciudad de MÃ©xico',9,10,''),(4,'Francisco Fernando','Escalante','SÃ¡nchez','oficial','plantel_aleatorio','curp_aleatorio','rfc_aleatorio','cartilla_aleatoria','pasaporte_aleatorio','Masculino','1998-12-15','mexicana','Ciudad de MÃ©xico','Jenifer Grau','rfc_aleatorio','Aimar Roldan','Rosalia Pons','C.E.C.yT. 9','fÃ­sico matemÃ¡tico','Ciudad de MÃ©xico',10,9,''),(5,'JosÃ© Marcelino','LeÃ³n','Santiago','cadete','plantel_aleatorio','curp_aleatorio','rfc_aleatorio','cartilla_aleatoria','pasaporte_aleatorio','Masculino','1998-12-15','mexicana','Ciudad de MÃ©xico','Gael Garrido','rfc_aleatorio','Josep Alcazar','Maria Amparo Collado','C.E.C.yT. 9','fÃ­sico matemÃ¡tico','Ciudad de MÃ©xico',9,10,''),(6,'Pedro LeÃ³n','Ãlvarez','Alcacio','oficial','plantel_aleatorio','curp_aleatorio','rfc_aleatorio','cartilla_aleatoria','pasaporte_aleatorio','Masculino','1998-12-15','mexicana','Ciudad de MÃ©xico','Veronica De-Dios','rfc_aleatorio','Manuel Antonio Esteban','Laila Pinilla','C.E.C.yT. 9','fÃ­sico matemÃ¡tico','Ciudad de MÃ©xico',10,9,''),(7,'Juan Manuel','Mozo','Spezia','cadete','plantel_aleatorio','curp_aleatorio','rfc_aleatorio','cartilla_aleatoria','pasaporte_aleatorio','Masculino','1998-12-15','mexicana','Ciudad de MÃ©xico','Jose Rafael Cervera','rfc_aleatorio','Joan Paniagua','Elisa Checa','C.E.C.yT. 9','fÃ­sico matemÃ¡tico','Ciudad de MÃ©xico',9,10,''),(8,'Gilberto','GarcÃ­a','Campante','oficial','plantel_aleatorio','curp_aleatorio','rfc_aleatorio','cartilla_aleatoria','pasaporte_aleatorio','Masculino','1998-12-15','mexicana','Ciudad de MÃ©xico','Montserrat Palacio','rfc_aleatorio','Ayman Vives','Maria Rosa Francisco','C.E.C.yT. 9','fÃ­sico matemÃ¡tico','Ciudad de MÃ©xico',10,9,''),(9,'RaÃºl','Ayala','ArÃ¡mbula','cadete','plantel_aleatorio','curp_aleatorio','rfc_aleatorio','cartilla_aleatoria','pasaporte_aleatorio','Masculino','1998-12-15','mexicana','Ciudad de MÃ©xico','Jose Tejero','rfc_aleatorio','Josep Alcantara','Herminia Ramon','C.E.C.yT. 9','fÃ­sico matemÃ¡tico','Ciudad de MÃ©xico',9,10,''),(10,'Salvador','Aguirre','Cervantes','oficial','plantel_aleatorio','curp_aleatorio','rfc_aleatorio','cartilla_aleatoria','pasaporte_aleatorio','Masculino','1998-12-15','mexicana','Ciudad de MÃ©xico','Maria Nuria de Diego','rfc_aleatorio','Javier Luna','Socorro Cordero','C.E.C.yT. 9','fÃ­sico matemÃ¡tico','Ciudad de MÃ©xico',10,9,'');
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
INSERT INTO `domicilio` VALUES (1,'JosÃ© Sotero CastaÃ±eda',664,NULL,'Asturias','06890','Ciudad de MÃ©xico','CuauhtÃ©moc','5586847983','5589876889','5523515478','usuario1@gmail.com'),(2,'C. Sabino',343,NULL,'Atlampa','06450','Ciudad de MÃ©xico','CuauhtÃ©moc','5564741425','5542688779','5532244889','seÃ±or2@gmail.com'),(3,'Nte. 72',5418,NULL,'Bondojito','07850','Ciudad de MÃ©xico','Gustavo A. Madero','5587896425','5589876894','5589422756','piÃ±a65@gmail.com'),(4,'C. 1',182,NULL,'Santa Apolonia','02790','Ciudad de MÃ©xico','Gustavo A. Madero','5565545781','5521242526','5524477884','carro21@gmail.com'),(5,'Miguel Ãngel',521,NULL,'San Juan','04850','Ciudad de MÃ©xico','Azcapotzalco','5521147884','5564588744','5589944745','botella65@gmail.com'),(6,'San JosÃ©',2879,NULL,'Casas AlemÃ¡n','08460','Ciudad de MÃ©xico','Azcapotzalco','5521147884','5564422113','5584899668','bocina14@gmail.com'),(7,'HÃ©ctor Fierro',968,NULL,'NÃ¡poles','03240','Ciudad de MÃ©xico','Venustiano Carranza','5547788449','5565686261','5532343781','almohada5@gmail.com'),(8,'Pedro AlcarÃ¡z',657,NULL,'Granjas MÃ©xico','08480','Ciudad de MÃ©xico','Venustiano Carranza','5537383431','5556989476','5525545165','escritorio8@gmail.com'),(9,'AzafrÃ¡n',117,NULL,'Juventino Rosas','02340','Ciudad de MÃ©xico','Iztacalco','5523644778','5584879888','5558497612','tennis6@gmail.com'),(10,'Calzada de las brujas',253,NULL,'Tres Fuentes','14390','Ciudad de MÃ©xico','Iztacalco','5598846875','5585512425','5587966435','caja4@gmail.com');
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
INSERT INTO `doscentes` VALUES (1,'D-5354512','Miguel Ãngel','SÃ¡nchez','Lamego','IngenierÃ­a en sistemas computacionales',1,3,1),(2,'D-3146985','Genaro','AmbÃ­a','Pedraza','IngenierÃ­a en sistemas computacionales',2,3,1),(3,'D-5487986','Francisco','Grajales','Godoy','IngenierÃ­a en sistemas computacionales',3,3,1),(4,'D-3265988','JoaquÃ­n','Aspiroz','Viniegra','IngenierÃ­a en sistemas computacionales',4,3,1),(5,'D-2154652','Carlos','SolÃ­s','AvedaÃ±o','IngenierÃ­a en sistemas computacionales',1,3,1),(6,'D-6284953','Ignacio','GonzÃ¡lez','Ãlvarez','IngenierÃ­a en sistemas computacionales',2,3,1),(7,'D-1892658','Manuel','VÃ¡zquez','Barete','IngenierÃ­a en sistemas computacionales',3,3,1),(8,'D-2365458','Rafael','Robles','Hurtado','IngenierÃ­a en sistemas computacionales',4,3,1),(9,'D-5263148','Manuel ','VÃ¡zquez','Barete','IngenierÃ­a en sistemas computacionales',1,3,1),(10,'D-9878546','Guillermo','Ruiz','PÃ©rez','IngenierÃ­a en sistemas computacionales',2,3,1),(11,'D-2684475','Rodolfo','DÃ­az','Santacruz','IngenierÃ­a en sistemas computacionales',3,3,1),(12,'D-5487211','Guillermo','Ruiz','PÃ©rez','IngenierÃ­a en sistemas computacionales',4,3,1),(13,'D-6325859','Jacobo','Wittman','Rojano','IngenierÃ­a en sistemas computacionales',1,3,1),(14,'D-5285965','MatÃ­as','GonzÃ¡lez','GonzÃ¡lez','IngenierÃ­a en sistemas computacionales',2,3,1),(15,'D-5874859','David','Salas','VÃ¡zquez','IngenierÃ­a en sistemas computacionales',3,3,1),(16,'D-3652412','Samuel M.','JimÃ©nez','Migueles','IngenierÃ­a en sistemas computacionales',4,3,1),(17,'D-2198325','Marco Antonio','CÃ³rdova','LÃ³pez','IngenierÃ­a en sistemas computacionales',1,3,1),(18,'D-8732546','Armando','Cid','Nava','IngenierÃ­a en sistemas computacionales',2,3,1),(19,'D-7425633','Pedro','Hirata','Vaquera','IngenierÃ­a en sistemas computacionales',3,3,1),(20,'D-5269412','Jorge','Rueda','Bravo','IngenierÃ­a en sistemas computacionales',4,3,1);
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
INSERT INTO `unidades_aprendizaje_todas` VALUES (1,'Ã‰TICA MILITAR I',4,1,0.25,3,1),(2,'EDUCACIÃ“N FÃSICA I',46,1,2.88,3,2),(3,'LEGISLACIÃ“N MILITAR I',25,1,1.56,3,2),(4,'ADIESTRAMIENTO MIL. BASICO',341,1,21.31,3,2),(5,'ORDEN CERRADO DE INFANTERÃA I',34,1,2.13,3,4),(6,'HABLIDADES BASICA DEL COMBATIENTE',74,1,4.63,3,2),(7,'HISTORIA MILITAR DE MÃ‰XICO I',35,1,2.18,3,2),(8,'OPERACIONES MILITARES I',40,1,2.5,3,2),(9,'ARMAMENTO MILITAR I',46,1,2.87,3,2),(10,'NAVEGACIÃ“N TERRESTRE I',43,1,2.7,3,2),(11,'EDUCACIÃ“N FÃSICA II',80,2,5,3,2),(12,'LEGISLACIÃ“N MILITAR II',16,2,1,3,2),(13,'HISTORIA MILITAR DE MÃ‰XICO II',32,2,2,3,2),(14,'ARMAMENTO MILITAR II',32,2,2,3,2),(15,'EJERCICIOS MILITARES DE APLICACIÃ“N I',168,2,10.5,3,2),(16,'FÃSICA GENERAL',64,2,4,3,3),(17,'QUÃMICA GENERAL',48,2,3,3,3),(18,'MATEMÃTICAS BÃSICAS PARA INGENIERÃA',64,2,4,3,3),(19,'GEOMETRÃA ANALÃTICA',64,2,4,3,3),(20,'CÃLCULO DIFERENCIAL',64,2,4,3,3),(21,'TÃ‰CNICAS DE APRENDIZAJE',32,2,2,3,3),(22,'EXPRESIÃ“N ORAL Y ESCRITA',48,2,3,3,3),(23,'IDIOMA EXTRANJERO I',80,2,5,3,4),(24,'Ã‰TICA MILITAR II',32,3,2,3,1),(25,'EDUCACIÃ“N FÃSICA III',80,3,5,3,2),(26,'LEGISLACIÃ“N MILITAR III',32,3,2,3,2),(27,'ORDEN CERRADO  DE INFANTERÃA II',32,3,2,3,4),(28,'TEMAS SELECTOS DE FÃSICA',64,3,4,3,3),(29,'MECÃNICA',64,3,4,3,3),(30,'ÃLGEBRA LINEAL',64,3,4,3,3),(31,'DIBUJO DE INGENIERÃA',80,3,5,3,3),(32,'CÃLCULO VECTORIAL I',64,3,4,3,3),(33,'CÃLCULO INTEGRAL',80,3,5,3,3),(34,'PROGRAMACIÃ“N',64,3,4,3,3),(35,'IDIOMA EXTRANJERO II',80,3,5,3,4),(36,'FILOSOFÃA',32,4,2,3,1),(37,'EDUCACIÃ“N FÃSICA IV',80,4,5,3,2),(38,'LEGISLACIÃ“N MILITAR IV',32,4,2,3,2),(39,'PROTECCIÃ“N CIVIL Y PLAN DN-III-E',48,4,3,3,2),(40,'EJERCICIOS MILITARES DE APLICACIÃ“N II',168,4,10.5,3,2),(41,'ELECTRICIDAD Y MAGNETISMO',64,4,4,3,3),(42,'PROBABILIDAD Y ESTADÃSTICA',64,4,4,3,3),(43,'ECUACIONES DIFERENCIALES',64,4,4,3,3),(44,'CÃLCULO VECTORIAL II',64,4,4,3,3),(45,'PROGRAMACIÃ“N AVANZADA',64,4,4,3,3),(46,'ORGANIZACIÃ“N DE COMPUTADORAS',64,4,4,3,3),(47,'IDIOMA EXTRANJERO III',80,4,5,3,4),(48,'Ã‰TICA MILITAR III',32,5,2,3,1),(49,'EDUCACIÃ“N FÃSICA V',80,5,5,3,2),(50,'ORDEN CERRADO DE INFANTERÃA III',32,5,2,3,4),(51,'ARMAMENTO MILITAR III',32,5,2,3,2),(52,'DESARROLLO HUMANO',32,5,2,3,3),(53,'MATEMÃTICAS AVANZADAS',48,5,3,3,3),(54,'SIMULACIÃ“N DE SISTEMAS',64,5,4,3,3),(55,'RECURSOS NATURALES Y NECESIDADES DE MÃ‰XICO',48,5,3,3,3),(56,'MÃ‰TODOS NUMÃ‰RICOS',64,5,4,3,3),(57,'ESTRUCTURA DE DATOS',80,5,5,3,3),(58,'ARQUITECTURA DE COMPUTADORAS I',64,5,4,3,3),(59,'IDIOMA EXTRANJERO IV',80,5,5,3,4),(60,'EDUCACIÃ“N FÃSICA VI',80,6,5,3,2),(61,'ASPECTOS TÃ‰CNICOS DEL SERVICIO DE INFORMÃTICA',16,6,1,3,2),(62,'NAVEGACIÃ“N TERRESTRE II',32,6,2,3,2),(63,'PRÃCTICAS DE LA ESPECIALIDAD I',168,6,10.5,3,3),(64,'INGENIERÃA DE SISTEMAS DE INFORMACIÃ“N I',48,6,3,3,3),(65,'MATEMÃTICAS COMPUTACIONALES',64,6,4,3,3),(66,'LENGUAJE ENSAMBLADOR',80,6,5,3,3),(67,'LENGUAJES DE PROGRAMACIÃ“N',64,6,4,3,3),(68,'ARQUITECTURA DE COMPUTADORAS II',64,6,4,3,3),(69,'INVESTIGACION DE OPERACIONES I',48,6,3,3,3),(70,'CULTURA DE LA CALIDAD',48,6,3,3,3),(71,'IDIOMA EXTRANJERO V',80,6,5,3,4),(72,'Ã‰TICA MILITAR IV',32,7,2,3,1),(73,'EDUCACIÃ“N FÃSICA VII',80,7,5,3,2),(74,'ORDEN CERRADO DE INFANTERÃA IV',16,7,1,3,4),(75,'ARMAMENTO MILITAR IV',32,7,2,3,2),(76,'SEÃ‘ALES Y SISTEMAS',64,7,4,3,3),(77,'INGENIERÃA DE SISTEMAS DE INFORMACIÃ“N II',64,7,4,3,3),(78,'TEORIA DE LA COMPUTACIÃ“N',72,7,4.5,3,3),(79,'SISTEMAS OPERATIVOS',64,7,4,3,3),(80,'ANALISIS DE ALGORITMOS',64,7,4,3,3),(81,'BASES DE DATOS',80,7,5,3,3),(82,'INVESTIGACIÃ“N DE OPERACIONES II',56,7,3.5,3,3),(83,'IDIOMA EXTRANJERO VI',80,7,5,3,4),(84,'EDUCACIÃ“N FÃSICA VIII',80,8,5,3,2),(85,'ASPECTOS ADMINISTRATIVOS DEL MANDO',32,8,2,3,2),(86,'ADIESTRAMIENTO MILITAR Y CAPACITACIÃ“N DOCENTE I',48,8,3,3,2),(87,'PRÃCTICAS DE LA ESPECIALIDAD II',168,8,10.5,3,3),(88,'TÃ‰CNICAS DE PRODUCCIÃ“N DE SISTEMAS',64,8,4,3,3),(89,'MICROPROCESADORES Y MICROCONTROLADORES',64,8,4,3,3),(90,'SISTEMAS DISTRIBUIDOS ',64,8,4,3,3),(91,'COSTOS APLICADOS A LA INGENIERÃA',32,8,2,3,3),(92,'DISEÃ‘O DE COMPILADORES',64,8,4,3,3),(93,'BASES DE DATOS AVANZADAS',80,8,5,3,3),(94,'INGENIERÃA AMBIENTAL',64,8,4,3,3),(95,'IDIOMA EXTRANJERO VII',80,8,5,3,4),(96,'EDUCACIÃ“N FÃSICA IX',80,9,5,3,2),(97,'GUERRA IRREGULAR I',16,9,1,3,2),(98,'ADIESTRAMIENTO MILITAR Y CAPACITACIÃ“N DOCENTE II',32,9,2,3,2),(99,'INGENIERÃA DE REDES I',80,9,5,3,3),(100,'SISTEMAS COMPUTACIONALES EN AMBIENTE MULTIMEDIA',80,9,5,3,3),(101,'SISTEMAS EXPERTOS',64,9,4,3,3),(102,'PROGRAMACIÃ“N ORIENTADA A OBJETOS',64,9,4,3,3),(103,'ARQUITECTURA DE DESARROLLO DE SOFTWARE',64,9,4,3,3),(104,'METODOLOGÃA DE LA INVESTIGACIÃ“N',32,9,2,3,3),(105,'IDIOMA EXTRANJERO VIII',80,9,5,3,4),(106,'DERECHOS HUMANOS',48,10,3,3,1),(107,'EDUCACIÃ“N FÃSICA X',80,10,5,3,2),(108,'GUERRA IRREGULAR II',32,10,2,3,2),(109,'INGENIERÃA DE REDES II',80,10,5,3,3),(110,'PRÃCTICAS DE LA ESPECIALIDAD',168,10,10.5,3,3),(111,'TECNOLOGÃA DE INFORMACIÃ“N EMERGENTE',64,10,4,3,3),(112,'SEGURIDAD COMPUTACIONAL',96,10,6,3,3),(113,'INTELIGENCIA ARTIFICIAL',64,10,4,3,3),(114,'AUDITORÃA Y CONSULTORÃA INFORMÃTICA',56,10,3.5,3,3),(115,'DESARROLLO DE SOFTWARE ORIENTADO A OBJETOS',64,10,4,3,3),(116,'PROYECTOS DE INGENIERÃA',48,10,3,3,3),(117,'SEMINARIO DE TESIS I',48,10,3,3,3),(118,'MANDO Y LIDERAZGO I',32,11,2,3,1),(119,'DERECHO INTERNACIONAL HUMANITARIO',32,11,2,3,1),(120,'EDUCACIÃ“N FÃSICA XI',80,11,5,3,2),(121,'INGENIERÃA DE REDES III',100,11,6.25,3,3),(122,'LABORATORIO DE INGENIERÃA DE REDES',64,11,4,3,3),(123,'REDES NEURONALES',64,11,4,3,3),(124,'LAGISLACIÃ“N INFORMÃTICA',64,11,4,3,3),(125,'PROYECTOS DE INGENIERÃA DE SOFTWARE',64,11,4,3,3),(126,'TOPICOS AVANZADOS',64,11,4,3,3),(127,'GLOBALIZACIÃ“N Y DESARROLLO',64,11,4,3,3),(128,'SEMINARIO DE TESIS II',32,11,2,3,3),(129,'MANDO Y LIDERAZGO II',32,12,2,3,1),(130,'EDUCACIÃ“N FÃSICA XII',80,12,5,3,2),(131,'OPERACIONES MILITARES II',48,12,3,3,2),(132,'COMPRAS GUBERNAMENTALES',32,12,2,3,3),(133,'ELABORACIÃ“N DE TÃ‰SIS PROFESIONAL',368,12,23,3,3);
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
INSERT INTO `usuarios` VALUES ('12345678','David','Gamaliel','LÃ³pez','1234'),('2015080213','Eduardo','Castro','Cruces','123456'),('2016060213','Bernardino','Castro','Cruces','123456');
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
