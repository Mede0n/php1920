-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-01-2020 a las 10:08:04
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `empleadosnn`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE IF NOT EXISTS `departamento` (
  `cod_dpto` varchar(4) NOT NULL DEFAULT '',
  `nombre_dpto` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`cod_dpto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`cod_dpto`, `nombre_dpto`) VALUES
('1', 'dpto1'),
('2', 'dpto2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE IF NOT EXISTS `empleado` (
  `dni` varchar(4) NOT NULL DEFAULT '',
  `nombre` varchar(40) DEFAULT NULL,
  `apellido` varchar(40) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `salario` double DEFAULT NULL,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`dni`, `nombre`, `apellido`, `fecha_nac`, `salario`) VALUES
('1202', 'pepe', 'stoo', '0000-00-00', 1000),
('1234', 'Ruben', 'Fernandez', '2000-01-20', 200),
('1235', 'David', 'Perez', '2000-07-14', 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `emple_departam`
--

CREATE TABLE IF NOT EXISTS `emple_departam` (
  `fecha_entra` date NOT NULL DEFAULT '0000-00-00',
  `cod_dpto` varchar(4) DEFAULT NULL,
  `dni` varchar(4) DEFAULT NULL,
  `fechafin` date DEFAULT NULL,
  PRIMARY KEY (`fecha_entra`),
  KEY `pk_fecha` (`cod_dpto`),
  KEY `fk_dni` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `emple_departam`
--

INSERT INTO `emple_departam` (`fecha_entra`, `cod_dpto`, `dni`, `fechafin`) VALUES
('2019-10-12', '2', '1235', NULL),
('2019-11-12', '1', '1234', NULL),
('2020-01-13', '1', '1202', NULL);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `emple_departam`
--
ALTER TABLE `emple_departam`
  ADD CONSTRAINT `fk_dni` FOREIGN KEY (`dni`) REFERENCES `empleado` (`dni`),
  ADD CONSTRAINT `pk_fecha` FOREIGN KEY (`cod_dpto`) REFERENCES `departamento` (`cod_dpto`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
