-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.3.0 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para gestempresarial
CREATE DATABASE IF NOT EXISTS `gestempresarial` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gestempresarial`;

-- Volcando estructura para tabla gestempresarial.tblclientes
CREATE TABLE IF NOT EXISTS `tblclientes` (
  `id_Cliente` int NOT NULL AUTO_INCREMENT,
  `CIFNIFcli` char(15) NOT NULL,
  `Fecha` date NOT NULL,
  `nombrecli` char(20) NOT NULL,
  `apellidoscli` char(30) NOT NULL,
  `direccioncli` varchar(50) NOT NULL,
  `Telefonocli` bigint NOT NULL,
  `e_mailcli` char(50) DEFAULT NULL,
  `activocli` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id_Cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla gestempresarial.tblclientes: ~0 rows (aproximadamente)
DELETE FROM `tblclientes`;
INSERT INTO `tblclientes` (`id_Cliente`, `CIFNIFcli`, `Fecha`, `nombrecli`, `apellidoscli`, `direccioncli`, `Telefonocli`, `e_mailcli`, `activocli`) VALUES
	(1, '09807478w', '2024-06-06', 'jose maria', 'villafañe marcos', 'calle maestro gregorio alonso,29', 987554433, 'chema1986@gmail.com', b'1');

-- Volcando estructura para tabla gestempresarial.tbldatos_empresa
CREATE TABLE IF NOT EXISTS `tbldatos_empresa` (
  `IdEmpresa` int NOT NULL AUTO_INCREMENT,
  `CIF_Empresa` char(20) NOT NULL,
  `nombre_empresa` char(50) NOT NULL,
  `direccion_empresa` char(50) NOT NULL,
  `Telefono_empresa` bigint NOT NULL,
  `e_mail` char(50) DEFAULT NULL,
  `activaempresa` bit(1) DEFAULT NULL,
  PRIMARY KEY (`IdEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla gestempresarial.tbldatos_empresa: ~0 rows (aproximadamente)
DELETE FROM `tbldatos_empresa`;
INSERT INTO `tbldatos_empresa` (`IdEmpresa`, `CIF_Empresa`, `nombre_empresa`, `direccion_empresa`, `Telefono_empresa`, `e_mail`, `activaempresa`) VALUES
	(1, '12345', 'prueba1', 'algo no', 987345566, 'infjmv00@estudiantes.unileon.es', b'1');

-- Volcando estructura para tabla gestempresarial.tblfacturas
CREATE TABLE IF NOT EXISTS `tblfacturas` (
  `n_factura` int NOT NULL AUTO_INCREMENT,
  `id_Cliente` int NOT NULL,
  `id_Material` int NOT NULL,
   id_trabajador int NOT NULL,
  `FechaFactura` date NOT NULL,
  `descripcion` text,
  `cantidad` int NOT NULL,
  `tipo` char(10) DEFAULT NULL,
  `total` float DEFAULT NULL,
  `total_bruto` float DEFAULT NULL,
  `iva_aplicado` float DEFAULT '0.21',
  `precio_unitario` float DEFAULT NULL,
  PRIMARY KEY (`n_factura`),
  KEY `FK_tblFacturas_NIF` (`id_Cliente`),
KEY `FK_tblFacturas_trabajador` (id_trabajador),
  KEY `FK_tblFacturas_Material` (`id_Material`),
  CONSTRAINT `FK_tblFacturas_Material` FOREIGN KEY (`id_Material`) REFERENCES `tblmateriales` (`IdMaterial`) ON UPDATE CASCADE,
CONSTRAINT `FK_tblFacturas_trabajador` FOREIGN KEY (id_trabajador) REFERENCES tbltrabajadores (IdTrabajador) ON UPDATE CASCADE,
  CONSTRAINT `FK_tblFacturas_NIF` FOREIGN KEY (`id_Cliente`) REFERENCES `tblclientes` (`id_Cliente`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla gestempresarial.tblfacturas: ~0 rows (aproximadamente)
DELETE FROM `tblfacturas`;

-- Volcando estructura para tabla gestempresarial.tblfamilias
CREATE TABLE IF NOT EXISTS `tblfamilias` (
  `IdFamilia` int NOT NULL AUTO_INCREMENT,
  `CodigoFamilia` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `familia` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT NULL,
  PRIMARY KEY (`IdFamilia`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla gestempresarial.tblfamilias: ~0 rows (aproximadamente)
DELETE FROM `tblfamilias`;
INSERT INTO `tblfamilias` (`IdFamilia`, `CodigoFamilia`, `familia`, `activo`) VALUES
	(1, 'font-01', 'fontanteria pequeña', b'1');

-- Volcando estructura para tabla gestempresarial.tblmateriales
CREATE TABLE IF NOT EXISTS `tblmateriales` (
  `IdMaterial` int NOT NULL AUTO_INCREMENT,
  `codigo_material` char(15) NOT NULL,
  `descripcion` char(50) DEFAULT NULL,
  `IdFamilia` int NOT NULL,
  `activo` bit(1) DEFAULT NULL,
  PRIMARY KEY (`IdMaterial`),
  KEY `FK_tblMateriales_tbFamilia` (`IdFamilia`),
  CONSTRAINT `FK_tblMateriales_tbFamilia` FOREIGN KEY (`IdFamilia`) REFERENCES `tblfamilias` (`IdFamilia`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla gestempresarial.tblmateriales: ~0 rows (aproximadamente)
DELETE FROM `tblmateriales`;
INSERT INTO `tblmateriales` (`IdMaterial`, `codigo_material`, `descripcion`, `IdFamilia`, `activo`) VALUES
	(1, 'grifo-01', 'grifo dorado monomando', 1, b'1'),
	(2, 'grifo-01', 'griferia dorada monomando', 1, b'1');

-- Volcando estructura para tabla gestempresarial.tblmaterialproveedor
CREATE TABLE IF NOT EXISTS `tblmaterialproveedor` (
  `IdPedido` int NOT NULL AUTO_INCREMENT,
  `CIFpro` int NOT NULL,
  `idmat` int NOT NULL,
  `fecha` date NOT NULL,
  `unidades` smallint NOT NULL,
  `activo` bit(1) DEFAULT NULL,
  `finalizado` bit(1) DEFAULT NULL,
  PRIMARY KEY (`IdPedido`),
  KEY `FK_TMP_prov` (`CIFpro`),
  KEY `FK_TMP_Mat` (`idmat`),
  CONSTRAINT `FK_TMP_Mat` FOREIGN KEY (`idmat`) REFERENCES `tblmateriales` (`IdMaterial`) ON UPDATE CASCADE,
  CONSTRAINT `FK_TMP_prov` FOREIGN KEY (`CIFpro`) REFERENCES `tblproveedores` (`IdProveedor`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla gestempresarial.tblmaterialproveedor: ~0 rows (aproximadamente)
DELETE FROM `tblmaterialproveedor`;

-- Volcando estructura para tabla gestempresarial.tblmaterialusado
CREATE TABLE IF NOT EXISTS `tblmaterialusado` (
  `cod_trabajo` int NOT NULL,
  `code_material` int NOT NULL,
  `unidades` smallint DEFAULT NULL,
  `uso_desgaste` tinyint(1) DEFAULT NULL,
  `desgastado` tinyint(1) DEFAULT NULL,
  KEY `FK_tblMatUsed_cod_trabajo` (`cod_trabajo`),
  KEY `FK_tblMatUsed_cod_material` (`code_material`),
  CONSTRAINT `FK_tblMatUsed_cod_material` FOREIGN KEY (`code_material`) REFERENCES `tblmateriales` (`IdMaterial`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tblMatUsed_cod_trabajo` FOREIGN KEY (`cod_trabajo`) REFERENCES `tbltrabajosrealizados` (`cod_trabajo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla gestempresarial.tblmaterialusado: ~0 rows (aproximadamente)
DELETE FROM `tblmaterialusado`;

-- Volcando estructura para tabla gestempresarial.tblmenu
CREATE TABLE IF NOT EXISTS `tblmenu` (
  `idMenu` int NOT NULL AUTO_INCREMENT,
  `idRol` int NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `tipo` enum('S','I') DEFAULT NULL,
  `codigo_submenu` int DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idMenu`),
  KEY `FK_tblmenu_tblRoles` (`idRol`),
  KEY `FK_Menu_Item` (`codigo_submenu`),
  CONSTRAINT `FK_Menu_Item` FOREIGN KEY (`codigo_submenu`) REFERENCES `tblmenu` (`idMenu`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_tblmenu_tblRoles` FOREIGN KEY (`idRol`) REFERENCES `tblroles` (`IdRol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla gestempresarial.tblmenu: ~3 rows (aproximadamente)
DELETE FROM `tblmenu`;
INSERT INTO `tblmenu` (`idMenu`, `idRol`, `nombre`, `tipo`, `codigo_submenu`, `estado`, `url`) VALUES
	(1, 1, 'TRABAJADORES', 'S', NULL, b'1', NULL),
	(2, 1, 'NUEVO', 'I', 1, b'1', 'propietario/AltaTrabajador.xhtml'),
	(3, 1, 'ELIMINAR', 'I', 1, b'1', '/EliminarTrabajador.xhtml');

-- Volcando estructura para tabla gestempresarial.tblposiblestrabajos
CREATE TABLE IF NOT EXISTS `tblposiblestrabajos` (
  `id_tarea` int NOT NULL AUTO_INCREMENT,
  `descripcion` char(100) NOT NULL,
  `activoTrabajo` bit(1) DEFAULT NULL,
  `importeud` float DEFAULT NULL,
  PRIMARY KEY (`id_tarea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla gestempresarial.tblposiblestrabajos: ~0 rows (aproximadamente)
DELETE FROM `tblposiblestrabajos`;

-- Volcando estructura para tabla gestempresarial.tblpresupuestos
CREATE TABLE IF NOT EXISTS `tblpresupuestos` (
  `n_presupuesto` int NOT NULL AUTO_INCREMENT,
  `id_Cliente` int NOT NULL,
  `descripcion` text,
  `cantidad` int NOT NULL,
  `tipo` char(10) DEFAULT NULL,
  `iva_aplicado` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `id_Material` int NOT NULL,
  `precio_unitario` float DEFAULT NULL,
  `total_bruto` float DEFAULT NULL,
  PRIMARY KEY (`n_presupuesto`),
  KEY `FK_tblPresupuestos_Material` (`id_Material`),
  KEY `FK_tblPresupuestos_NIF` (`id_Cliente`),
  CONSTRAINT `FK_tblPresupuestos_Material` FOREIGN KEY (`id_Material`) REFERENCES `tblmateriales` (`IdMaterial`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tblPresupuestos_NIF` FOREIGN KEY (`id_Cliente`) REFERENCES `tblclientes` (`id_Cliente`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla gestempresarial.tblpresupuestos: ~0 rows (aproximadamente)
DELETE FROM `tblpresupuestos`;

-- Volcando estructura para tabla gestempresarial.tblproveedores
CREATE TABLE IF NOT EXISTS `tblproveedores` (
  `IdProveedor` int NOT NULL AUTO_INCREMENT,
  `CIFprov` char(15) NOT NULL,
  `nombreprov` char(20) NOT NULL,
  `apellidosprov` char(30) NOT NULL,
  `direccion` char(50) NOT NULL,
  `Telefonoprov` bigint NOT NULL,
  `e_mail` char(50) DEFAULT NULL,
  `activoprov` bit(1) DEFAULT NULL,
  PRIMARY KEY (`IdProveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla gestempresarial.tblproveedores: ~1 rows (aproximadamente)
DELETE FROM `tblproveedores`;
INSERT INTO `tblproveedores` (`IdProveedor`, `CIFprov`, `nombreprov`, `apellidosprov`, `direccion`, `Telefonoprov`, `e_mail`, `activoprov`) VALUES
	(1, '1234', 'PREFECTO', 'AD', 'ERE', 1234, 'RERRRER', b'1');

-- Volcando estructura para tabla gestempresarial.tblroles
CREATE TABLE IF NOT EXISTS `tblroles` (
  `IdRol` int NOT NULL AUTO_INCREMENT,
  `TipoRol` char(1) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`IdRol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla gestempresarial.tblroles: ~3 rows (aproximadamente)
DELETE FROM `tblroles`;
INSERT INTO `tblroles` (`IdRol`, `TipoRol`, `descripcion`) VALUES
	(1, 'P', 'Propietario'),
	(2, 'E', 'Empleado'),
	(3, 'A', 'Administrador');

-- Volcando estructura para tabla gestempresarial.tblstockmateriales
CREATE TABLE IF NOT EXISTS `tblstockmateriales` (
  `IdStock` int NOT NULL AUTO_INCREMENT,
  `IdMaterial` int NOT NULL DEFAULT '0',
  `CantidadReal` int NOT NULL DEFAULT '0',
  `CantidadPteRecibir` int NOT NULL DEFAULT '0',
  `CantidadTotal` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`IdStock`),
  KEY `FK_tblstockproductos_tblproductos` (`IdMaterial`),
  CONSTRAINT `FK_tblstockproductos_tblproductos` FOREIGN KEY (`IdMaterial`) REFERENCES `tblmateriales` (`IdMaterial`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla gestempresarial.tblstockmateriales: ~0 rows (aproximadamente)
DELETE FROM `tblstockmateriales`;
INSERT INTO `tblstockmateriales` (`IdStock`, `IdMaterial`, `CantidadReal`, `CantidadPteRecibir`, `CantidadTotal`) VALUES
	(1, 1, 0, 0, 0);

-- Volcando estructura para tabla gestempresarial.tblsueldos
CREATE TABLE IF NOT EXISTS `tblsueldos` (
  `IdSueldo` int NOT NULL,
  `IdTrabajador` int NOT NULL,
  `fecha` date NOT NULL,
  `enbruto` float NOT NULL,
  `gastosirpf` float DEFAULT NULL,
  `seguridad_social` float DEFAULT NULL,
  `primas` float DEFAULT NULL,
  `total` float NOT NULL,
  PRIMARY KEY (`IdSueldo`),
  KEY `FK_tblSueldos_NIF` (`IdTrabajador`),
  CONSTRAINT `FK_tblSueldos_NIF` FOREIGN KEY (`IdTrabajador`) REFERENCES `tbltrabajadores` (`IdTrabajador`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla gestempresarial.tblsueldos: ~0 rows (aproximadamente)
DELETE FROM `tblsueldos`;

-- Volcando estructura para tabla gestempresarial.tbltienetrabajos
CREATE TABLE IF NOT EXISTS `tbltienetrabajos` (
  `id_trabajo` int NOT NULL,
  `id_tarea` int NOT NULL,
  `importe_ud` int DEFAULT NULL,
  KEY `FK_tblTTcod_trab` (`id_trabajo`),
  KEY `FK_tblTTcod_tarea` (`id_tarea`),
  CONSTRAINT `FK_tblTTcod_tarea` FOREIGN KEY (`id_tarea`) REFERENCES `tblposiblestrabajos` (`id_tarea`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tblTTcod_trab` FOREIGN KEY (`id_trabajo`) REFERENCES `tbltrabajosrealizados` (`cod_trabajo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla gestempresarial.tbltienetrabajos: ~0 rows (aproximadamente)
DELETE FROM `tbltienetrabajos`;

-- Volcando estructura para tabla gestempresarial.tbltrabajadores
CREATE TABLE IF NOT EXISTS `tbltrabajadores` (
  `IdTrabajador` int NOT NULL AUTO_INCREMENT,
  `NIFtrab` char(15) NOT NULL,
  `IdRol` int NOT NULL,
  `id_Empresa` int NOT NULL,
  `Fecha` date NOT NULL,
  `usuario` char(30) DEFAULT NULL,
  `contrasenya` char(10) DEFAULT NULL,
  `nombretrab` char(20) NOT NULL,
  `apellidostrab` char(30) NOT NULL,
  `direcciontrab` char(50) NOT NULL,
  `Telefonotrab` bigint NOT NULL,
  `e_mailtrab` char(50) DEFAULT NULL,
  `Fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `activotrab` bit(1) DEFAULT NULL,
  PRIMARY KEY (`IdTrabajador`),
  KEY `FK_tblTrabajadores_CIFEMPRESA` (`id_Empresa`),
  KEY `FK_tblTrabajadores_IDROL` (`IdRol`),
  CONSTRAINT `FK_tblTrabajadores_CIFEMPRESA` FOREIGN KEY (`id_Empresa`) REFERENCES `tbldatos_empresa` (`IdEmpresa`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tblTrabajadores_IDROL` FOREIGN KEY (`IdRol`) REFERENCES `tblroles` (`IdRol`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla gestempresarial.tbltrabajadores: ~17 rows (aproximadamente)
DELETE FROM `tbltrabajadores`;
INSERT INTO `tbltrabajadores` (`IdTrabajador`, `NIFtrab`, `IdRol`, `id_Empresa`, `Fecha`, `usuario`, `contrasenya`, `nombretrab`, `apellidostrab`, `direcciontrab`, `Telefonotrab`, `e_mailtrab`, `Fecha_inicio`, `fecha_fin`, `activotrab`) VALUES
	(2, '09807478w', 3, 1, '2024-05-01', 'admin', 'admin', 'asncelotti', 'villafañe marcos', 'calle maestro gregorio alonso', 987698882, 'infjmv00@estudiantes.unileon.es', '2024-05-10', '2024-05-16', b'0'),
	(4, '34567', 1, 1, '2024-05-01', 'prop', 'prop', 'prueba1', 'pruebs3', 'sewe', 987665544, 'sewe', '2024-05-28', '2024-05-21', b'1'),
	(5, '123456t', 2, 1, '2024-05-01', 'emp', 'emp', 'ew', 'wew', 'wew', 1213, '33e2', '2024-05-30', '2024-05-30', b'0'),
	(6, '223', 1, 1, '2024-05-06', 'adm', 'b', 'e2', 'ee3e', 'eee', 123, 'wdw', '2024-05-01', '2024-05-06', b'1'),
	(7, 'prueba', 1, 1, '2024-05-01', 'a', 'a', 'e2', 'ee3e', 'eee', 0, 'ww', '2024-05-01', '2024-05-06', b'1'),
	(8, 'prueba', 1, 1, '2024-05-01', 'a', 'a', 'e2', 'ee3e', 'eee', 0, 'ww', '2024-05-01', '2024-05-06', b'0'),
	(9, '1234', 1, 1, '2024-05-01', 'p', 'p', 'jose maria', 'villafañe marcos', 'algo no se que', 22, 'wwee', '2024-05-05', '2024-05-13', b'0'),
	(10, '5', 2, 1, '2024-05-05', 'emp1', 'emp1', 'jose maria 2', 'villafañe', 'ewewe', 12345, 'dedeed', '2024-05-26', '2024-05-27', b'0'),
	(11, '12345678', 2, 1, '2024-05-01', 'emp', 'emp', 'jose maria', 'villafañe marcos', 'calle maestro gregorio', 987698882, 'INFJMV00@estudiantes.unileon.es', '2024-05-01', '2024-05-01', b'0'),
	(12, '12345678', 2, 1, '2024-05-01', 'emp', 'emp', 'jose maria', 'villafañe marcos', 'calle maestro gregorio', 987698882, 'INFJMV00@estudiantes.unileon.es', '2024-05-01', '2024-05-01', b'0'),
	(13, '12345', 1, 1, '2024-05-05', 'pro', 'pro', 'we3e', 'e', 'e', 123, 'wew', '2024-05-26', '2024-05-27', b'0'),
	(14, '1234', 3, 1, '2024-05-05', 'admin3', 'admin3', 'dr3w', 'wewe', 'calle de la prueba', 0, 'wewe', '2024-05-26', '2024-05-26', b'0'),
	(15, '23', 3, 1, '2024-05-07', 'adm4', 'adm4', 'jose maria', 'villafañe marcos', 'calle algo no se que', 986554433, 'wewew', '2024-05-26', '2024-05-26', b'1'),
	(16, '1', 1, 1, '2024-05-05', 'adm', 'adm', 'e', 'e', 'e', 12, 'ee', '2024-05-27', '2024-05-26', b'0'),
	(17, '5', 1, 1, '2024-05-05', 'af', 'af', 'ass', 'asas', 'asa', 13, 'sdd', '2024-05-26', '2024-05-26', b'1'),
	(18, '1', 1, 1, '2024-05-05', 'prop6', 'prpop6', 'jose maria', 'villafañe marcos', 'algo no se que', 987, 'efere', '2024-05-01', '2024-05-26', b'1'),
	(19, '12454', 1, 1, '2024-05-12', 'adm', 'adm', 'erer', 'rrrer', 'rrer', 123, 'ffrfrf', '2024-05-26', '2024-05-26', b'0');

-- Volcando estructura para tabla gestempresarial.tbltrabajosejecutados
CREATE TABLE IF NOT EXISTS `tbltrabajosejecutados` (
  `codigo_trabajo` int NOT NULL,
  `trabajador` int NOT NULL,
  KEY `FK_tblTrabEj_cod_trabajo` (`codigo_trabajo`),
  KEY `FK_tblTrabEj_trabajador` (`trabajador`),
  CONSTRAINT `FK_tblTrabEj_cod_trabajo` FOREIGN KEY (`codigo_trabajo`) REFERENCES `tbltrabajosrealizados` (`cod_trabajo`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tblTrabEj_trabajador` FOREIGN KEY (`trabajador`) REFERENCES `tbltrabajadores` (`IdTrabajador`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla gestempresarial.tbltrabajosejecutados: ~0 rows (aproximadamente)
DELETE FROM `tbltrabajosejecutados`;

-- Volcando estructura para tabla gestempresarial.tbltrabajosrealizados
CREATE TABLE IF NOT EXISTS `tbltrabajosrealizados` (
  `cod_trabajo` int NOT NULL AUTO_INCREMENT,
  `fecha_inicio` timestamp(6) NOT NULL,
  `descripcion` text,
  `n_factura` int NOT NULL,
  `IdTrabajador` int NOT NULL,
  `fecha_fin` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`cod_trabajo`),
  UNIQUE KEY `n_factura` (`n_factura`),
  UNIQUE KEY `IdTrabajador` (`IdTrabajador`),
  CONSTRAINT `FK_TTR_factura` FOREIGN KEY (`n_factura`) REFERENCES `tblfacturas` (`n_factura`) ON UPDATE CASCADE,
  CONSTRAINT `FK_TTR_NIFtrabajador` FOREIGN KEY (`IdTrabajador`) REFERENCES `tbltrabajadores` (`IdTrabajador`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla gestempresarial.tbltrabajosrealizados: ~0 rows (aproximadamente)
DELETE FROM `tbltrabajosrealizados`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
