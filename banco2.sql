-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: banco2
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.18.04.1

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
-- Table structure for table `banco`
--

DROP TABLE IF EXISTS `banco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banco` (
  `idbancos` int(11) NOT NULL AUTO_INCREMENT,
  `nombrebanco` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idbancos`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banco`
--

LOCK TABLES `banco` WRITE;
/*!40000 ALTER TABLE `banco` DISABLE KEYS */;
INSERT INTO `banco` VALUES (1,'BCP'),(2,'INTERBANK'),(3,'PICHINCHA'),(4,'BBVA');
/*!40000 ALTER TABLE `banco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuenta` (
  `idcuenta` int(11) NOT NULL AUTO_INCREMENT,
  `numeroCuenta` varchar(45) DEFAULT NULL,
  `monto` double DEFAULT NULL,
  `idusuario` int(11) NOT NULL,
  `idbancos` int(11) NOT NULL,
  PRIMARY KEY (`idcuenta`,`idusuario`,`idbancos`),
  KEY `fk_cuenta_usuario1_idx` (`idusuario`),
  KEY `fk_cuenta_banco1_idx` (`idbancos`),
  CONSTRAINT `fk_cuenta_banco1` FOREIGN KEY (`idbancos`) REFERENCES `banco` (`idbancos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cuenta_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta`
--

LOCK TABLES `cuenta` WRITE;
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
INSERT INTO `cuenta` VALUES (1,'123109546234',4645,1,1),(2,'2342364565434',4253,2,1);
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaccion`
--

DROP TABLE IF EXISTS `transaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaccion` (
  `idtransaccion` int(11) NOT NULL AUTO_INCREMENT,
  `monto` double DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `nombreTransaccion` varchar(15) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `cuenta_remitente` int(11) NOT NULL,
  `cuenta_receptor` int(11) NOT NULL,
  PRIMARY KEY (`idtransaccion`,`cuenta_remitente`,`cuenta_receptor`),
  KEY `fk_transaccion_cuenta1_idx` (`cuenta_remitente`),
  KEY `fk_transaccion_cuenta2_idx` (`cuenta_receptor`),
  CONSTRAINT `fk_transaccion_cuenta1` FOREIGN KEY (`cuenta_remitente`) REFERENCES `cuenta` (`idcuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaccion_cuenta2` FOREIGN KEY (`cuenta_receptor`) REFERENCES `cuenta` (`idcuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaccion`
--

LOCK TABLES `transaccion` WRITE;
/*!40000 ALTER TABLE `transaccion` DISABLE KEYS */;
INSERT INTO `transaccion` VALUES (1,300,'2018-10-12 14:26:48','deposito',1,1,2),(2,300,'2018-10-12 14:27:43','deposito',1,1,2),(3,300,'2018-10-12 14:28:18','deposito',1,1,2),(18,1000,'2018-10-12 16:01:47','deposito',1,2,1),(19,1000,'2018-10-12 16:02:54','deposito',1,2,1),(20,1000,'2018-10-12 16:03:24','deposito',1,2,1),(23,1000,'2018-10-12 16:24:00','deposito',1,2,1),(24,400,'2018-10-12 16:27:27','\'deposito\'',1,1,2),(25,400,'2018-10-12 16:27:58','\'deposito\'',1,1,2);
/*!40000 ALTER TABLE `transaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `transacciones`
--

DROP TABLE IF EXISTS `transacciones`;
/*!50001 DROP VIEW IF EXISTS `transacciones`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `transacciones` AS SELECT 
 1 AS `numeroCuenta`,
 1 AS `fecha`,
 1 AS `nombreTransaccion`,
 1 AS `monto`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(15) DEFAULT NULL,
  `apellido` varchar(25) DEFAULT NULL,
  `usuario` varchar(15) NOT NULL,
  `pass` varchar(15) NOT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'debra','chacaliaza','74119091','digimo'),(2,'lucas','quintana','23456879','1234567'),(3,'cesar','vallejo','123456789','1234'),(4,'alejandro','Cabrejos','785421466','951753');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'banco2'
--

--
-- Dumping routines for database 'banco2'
--
/*!50003 DROP PROCEDURE IF EXISTS `transaccion_deposito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `transaccion_deposito`(in remitente int, in receptor int, monto double, in nombreT varchar(15), in tipo int)
BEGIN
	
    insert into transaccion(monto, fecha, nombreTransaccion,tipo,cuenta_remitente, cuenta_receptor)
		values(monto,now(),nombreT,tipo,remitente,receptor);
    update cuenta
    set cuenta.monto = cuenta.monto-monto
    where cuenta.idcuenta=remitente;
	update cuenta
    set cuenta.monto = cuenta.monto+monto
    where cuenta.idcuenta=receptor;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `transacciones`
--

/*!50001 DROP VIEW IF EXISTS `transacciones`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `transacciones` AS select `c`.`numeroCuenta` AS `numeroCuenta`,`t`.`fecha` AS `fecha`,`t`.`nombreTransaccion` AS `nombreTransaccion`,`t`.`monto` AS `monto` from (`transaccion` `t` join `cuenta` `c` on((`c`.`idcuenta` = `t`.`cuenta_receptor`))) group by `t`.`fecha` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-12 18:55:59
