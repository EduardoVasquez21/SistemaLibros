CREATE DATABASE  IF NOT EXISTS `libreria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `libreria`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: libreria
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `idCategoria` int NOT NULL AUTO_INCREMENT,
  `Categoria` char(20) NOT NULL,
  PRIMARY KEY (`Categoria`),
  UNIQUE KEY `idCategoria_UNIQUE` (`idCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `CodigoCliente` char(8) NOT NULL,
  `NombreCliente` varchar(45) NOT NULL,
  `ApellidoCliente` varchar(45) NOT NULL,
  `Edad` int NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Telefono` varchar(15) NOT NULL,
  PRIMARY KEY (`CodigoCliente`),
  UNIQUE KEY `idCliente_UNIQUE` (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `idCompras` int NOT NULL AUTO_INCREMENT,
  `Codigo_Libro` char(8) NOT NULL,
  `CodigoEditorial` char(8) NOT NULL,
  `Fecha_Compra` date NOT NULL,
  `IdFormadePago` int NOT NULL,
  `Cantidad_Libros` int NOT NULL,
  `Precio_Unitario` double NOT NULL,
  PRIMARY KEY (`idCompras`),
  KEY `fk_compras_libro1_idx` (`Codigo_Libro`),
  KEY `fk_compras_proveedor1_idx` (`CodigoEditorial`),
  KEY `fk_compras_formadepago1_idx` (`IdFormadePago`),
  CONSTRAINT `fk_compras_formadepago1` FOREIGN KEY (`IdFormadePago`) REFERENCES `formadepago` (`idFormaDePago`),
  CONSTRAINT `fk_compras_libro1` FOREIGN KEY (`Codigo_Libro`) REFERENCES `libro` (`Codigo_Libro`),
  CONSTRAINT `fk_compras_proveedor1` FOREIGN KEY (`CodigoEditorial`) REFERENCES `proveedor` (`CodigoEditorial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datos_libro`
--

DROP TABLE IF EXISTS `datos_libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datos_libro` (
  `idDatos_Libro` int NOT NULL AUTO_INCREMENT,
  `Codigo_Libro` char(8) NOT NULL,
  `Reseña` varchar(750) NOT NULL,
  `Precio` decimal(3,0) NOT NULL,
  `Cantidad` int NOT NULL,
  `Disponibilidad` varchar(45) NOT NULL,
  `Año_Publicacion` varchar(12) NOT NULL,
  PRIMARY KEY (`idDatos_Libro`),
  UNIQUE KEY `idDatos_Libro_UNIQUE` (`idDatos_Libro`),
  KEY `fk_datos_libro_libro1_idx` (`Codigo_Libro`),
  CONSTRAINT `fk_datos_libro_libro1` FOREIGN KEY (`Codigo_Libro`) REFERENCES `libro` (`Codigo_Libro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_libro`
--

LOCK TABLES `datos_libro` WRITE;
/*!40000 ALTER TABLE `datos_libro` DISABLE KEYS */;
/*!40000 ALTER TABLE `datos_libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datosescritor`
--

DROP TABLE IF EXISTS `datosescritor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datosescritor` (
  `idDatosEscritor` int NOT NULL AUTO_INCREMENT,
  `Codigo_Escritor` char(8) NOT NULL,
  `Fecha_Nacimiento` date NOT NULL,
  `Lugar_Nacimiento` varchar(45) NOT NULL,
  `Fecha_Deceso` varchar(45) NOT NULL,
  `Lugar_Deceso` varchar(45) NOT NULL,
  `Biografia` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idDatosEscritor`),
  KEY `fk_datosescritor_escritor1_idx` (`Codigo_Escritor`),
  CONSTRAINT `fk_datosescritor_escritor1` FOREIGN KEY (`Codigo_Escritor`) REFERENCES `escritor` (`Codigo_Escritor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datosescritor`
--

LOCK TABLES `datosescritor` WRITE;
/*!40000 ALTER TABLE `datosescritor` DISABLE KEYS */;
/*!40000 ALTER TABLE `datosescritor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escritor`
--

DROP TABLE IF EXISTS `escritor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escritor` (
  `idEscritor` int NOT NULL AUTO_INCREMENT,
  `Codigo_Escritor` char(20) NOT NULL,
  `Nombre_Escritor` varchar(45) NOT NULL,
  `Apellido_Escritor` varchar(45) NOT NULL,
  `Pais_Escritor` varchar(45) NOT NULL,
  PRIMARY KEY (`Codigo_Escritor`),
  UNIQUE KEY `idEscritor_UNIQUE` (`idEscritor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escritor`
--

LOCK TABLES `escritor` WRITE;
/*!40000 ALTER TABLE `escritor` DISABLE KEYS */;
/*!40000 ALTER TABLE `escritor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadolibros`
--

DROP TABLE IF EXISTS `estadolibros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadolibros` (
  `idEstadoLibros` int NOT NULL AUTO_INCREMENT,
  `Codigo_Libro` char(8) NOT NULL,
  `Estado` varchar(20) NOT NULL,
  `Descripcion` varchar(150) NOT NULL,
  PRIMARY KEY (`idEstadoLibros`),
  KEY `fk_estadolibros_libro1_idx` (`Codigo_Libro`),
  CONSTRAINT `fk_estadolibros_libro1` FOREIGN KEY (`Codigo_Libro`) REFERENCES `libro` (`Codigo_Libro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadolibros`
--

LOCK TABLES `estadolibros` WRITE;
/*!40000 ALTER TABLE `estadolibros` DISABLE KEYS */;
/*!40000 ALTER TABLE `estadolibros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formadepago`
--

DROP TABLE IF EXISTS `formadepago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formadepago` (
  `idFormaDePago` int NOT NULL AUTO_INCREMENT,
  `Pago` varchar(15) NOT NULL,
  PRIMARY KEY (`idFormaDePago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formadepago`
--

LOCK TABLES `formadepago` WRITE;
/*!40000 ALTER TABLE `formadepago` DISABLE KEYS */;
/*!40000 ALTER TABLE `formadepago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generoliterario`
--

DROP TABLE IF EXISTS `generoliterario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generoliterario` (
  `idGeneroLiterario` int NOT NULL AUTO_INCREMENT,
  `Genero_Literario` char(20) NOT NULL,
  PRIMARY KEY (`Genero_Literario`),
  UNIQUE KEY `idGeneroLiterario_UNIQUE` (`idGeneroLiterario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generoliterario`
--

LOCK TABLES `generoliterario` WRITE;
/*!40000 ALTER TABLE `generoliterario` DISABLE KEYS */;
/*!40000 ALTER TABLE `generoliterario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lector`
--

DROP TABLE IF EXISTS `lector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lector` (
  `idLector` int NOT NULL AUTO_INCREMENT,
  `CodigoLector` char(8) NOT NULL,
  `Nombre_Lector` varchar(25) NOT NULL,
  `Apellido_Lector` varchar(25) NOT NULL,
  `Edad` int NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  `Telefono` varchar(15) NOT NULL,
  PRIMARY KEY (`CodigoLector`),
  UNIQUE KEY `idLector_UNIQUE` (`idLector`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lector`
--

LOCK TABLES `lector` WRITE;
/*!40000 ALTER TABLE `lector` DISABLE KEYS */;
/*!40000 ALTER TABLE `lector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro`
--

DROP TABLE IF EXISTS `libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro` (
  `idLibro` int NOT NULL AUTO_INCREMENT,
  `Codigo_Libro` char(8) NOT NULL,
  `CodigoEditorial` char(8) NOT NULL,
  `Titulo` varchar(100) NOT NULL,
  `Codigo_Escritor` char(8) NOT NULL,
  `Categoria` char(20) NOT NULL,
  `Genero_Literario` char(20) NOT NULL,
  `Subgenero` char(20) NOT NULL,
  PRIMARY KEY (`Codigo_Libro`),
  UNIQUE KEY `idLibro_UNIQUE` (`idLibro`),
  KEY `fk_libro_generoliterario1_idx` (`Genero_Literario`),
  KEY `fk_libro_categoria1_idx` (`Categoria`),
  KEY `fk_libro_proveedor1_idx` (`CodigoEditorial`),
  KEY `fk_libro_escritor1_idx` (`Codigo_Escritor`),
  KEY `fk_libro_subgenero_literario1_idx` (`Subgenero`),
  CONSTRAINT `fk_libro_categoria1` FOREIGN KEY (`Categoria`) REFERENCES `categoria` (`Categoria`),
  CONSTRAINT `fk_libro_escritor1` FOREIGN KEY (`Codigo_Escritor`) REFERENCES `escritor` (`Codigo_Escritor`),
  CONSTRAINT `fk_libro_generoliterario1` FOREIGN KEY (`Genero_Literario`) REFERENCES `generoliterario` (`Genero_Literario`),
  CONSTRAINT `fk_libro_proveedor1` FOREIGN KEY (`CodigoEditorial`) REFERENCES `proveedor` (`CodigoEditorial`),
  CONSTRAINT `fk_libro_subgenero_literario1` FOREIGN KEY (`Subgenero`) REFERENCES `subgenero_literario` (`Subgenero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro`
--

LOCK TABLES `libro` WRITE;
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamo`
--

DROP TABLE IF EXISTS `prestamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamo` (
  `idPrestamo` int NOT NULL AUTO_INCREMENT,
  `CodigoLector` char(8) NOT NULL,
  `Codigo_Libro` char(8) NOT NULL,
  `FechaPrestamo` date NOT NULL,
  `FechaDevolucion` date NOT NULL,
  `Devuelto` varchar(2) NOT NULL,
  PRIMARY KEY (`idPrestamo`),
  KEY `fk_prestamo_libro1_idx` (`Codigo_Libro`),
  KEY `fk_prestamo_lector1_idx` (`CodigoLector`),
  CONSTRAINT `fk_prestamo_lector1` FOREIGN KEY (`CodigoLector`) REFERENCES `lector` (`CodigoLector`),
  CONSTRAINT `fk_prestamo_libro1` FOREIGN KEY (`Codigo_Libro`) REFERENCES `libro` (`Codigo_Libro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamo`
--

LOCK TABLES `prestamo` WRITE;
/*!40000 ALTER TABLE `prestamo` DISABLE KEYS */;
/*!40000 ALTER TABLE `prestamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `Id_ProveedorEditorial` int NOT NULL AUTO_INCREMENT,
  `CodigoEditorial` char(8) NOT NULL,
  `Nombre_Editorial` varchar(45) NOT NULL,
  `Direccion_Editorial` varchar(100) NOT NULL,
  `TelefonoEditorial` varchar(15) NOT NULL,
  PRIMARY KEY (`CodigoEditorial`),
  UNIQUE KEY `Id_ProveedorEditorial_UNIQUE` (`Id_ProveedorEditorial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subgenero_literario`
--

DROP TABLE IF EXISTS `subgenero_literario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subgenero_literario` (
  `idSubgenero_Literario` int NOT NULL AUTO_INCREMENT,
  `Subgenero` char(20) NOT NULL,
  PRIMARY KEY (`Subgenero`),
  UNIQUE KEY `idSubgenero_Literario_UNIQUE` (`idSubgenero_Literario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subgenero_literario`
--

LOCK TABLES `subgenero_literario` WRITE;
/*!40000 ALTER TABLE `subgenero_literario` DISABLE KEYS */;
/*!40000 ALTER TABLE `subgenero_literario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `idVenta` int NOT NULL AUTO_INCREMENT,
  `Codigo_Libro` char(8) NOT NULL,
  `CodigoCliente` char(8) NOT NULL,
  `Fecha_Venta` date NOT NULL,
  `IdFormadePago` int NOT NULL,
  `Cantidad_Libros` int NOT NULL,
  `Precio_Unitario` double NOT NULL,
  PRIMARY KEY (`idVenta`),
  KEY `fk_venta_libro_idx` (`Codigo_Libro`),
  KEY `fk_venta_cliente1_idx` (`CodigoCliente`),
  KEY `fk_venta_formadepago1_idx` (`IdFormadePago`),
  CONSTRAINT `fk_venta_cliente1` FOREIGN KEY (`CodigoCliente`) REFERENCES `cliente` (`CodigoCliente`),
  CONSTRAINT `fk_venta_formadepago1` FOREIGN KEY (`IdFormadePago`) REFERENCES `formadepago` (`idFormaDePago`),
  CONSTRAINT `fk_venta_libro` FOREIGN KEY (`Codigo_Libro`) REFERENCES `libro` (`Codigo_Libro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'libreria'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-29 10:21:30
