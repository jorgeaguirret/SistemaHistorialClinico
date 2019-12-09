-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-12-2019 a las 16:18:23
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `historial_clinico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dato_clinico`
--

CREATE TABLE `dato_clinico` (
  `codigo_dato` int(11) NOT NULL,
  `fecha_consulta` date NOT NULL DEFAULT current_timestamp(),
  `lugar_atencion` varchar(20) DEFAULT NULL,
  `nombre_profesional` varchar(20) DEFAULT NULL,
  `descripcion` varchar(300) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `imagen1` text CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `imagen2` text CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `imagen3` text CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `rut` int(8) NOT NULL,
  `rol` int(11) NOT NULL,
  `estatus` int(1) NOT NULL DEFAULT 1,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medico`
--

CREATE TABLE `medico` (
  `idmedico` int(11) NOT NULL,
  `nombres` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `apepaterno` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `apematerno` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `rut` int(15) DEFAULT NULL,
  `digrut` int(1) DEFAULT NULL,
  `clave` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `centro_atencion` varchar(50) CHARACTER SET latin1 NOT NULL,
  `ciudad` varchar(50) CHARACTER SET latin1 NOT NULL,
  `pais` varchar(30) CHARACTER SET latin1 NOT NULL,
  `telefono` int(11) NOT NULL,
  `rol` int(1) DEFAULT NULL,
  `estatus` int(1) NOT NULL DEFAULT 1,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `idpaciente` int(11) NOT NULL,
  `nombres` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `apepaterno` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `apematerno` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `rut` int(15) NOT NULL,
  `digrut` int(1) DEFAULT NULL,
  `clave` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `rol` int(1) DEFAULT NULL,
  `estatus` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patologico`
--

CREATE TABLE `patologico` (
  `idpatologico` int(11) NOT NULL,
  `enf_infancia` varchar(1000) NOT NULL,
  `enf_adolescencia` varchar(1000) NOT NULL,
  `enf_adultez` varchar(1000) NOT NULL,
  `enf_vejez` varchar(1000) NOT NULL,
  `int_quirurgicas` varchar(1000) NOT NULL,
  `alergias` varchar(1000) NOT NULL,
  `transfusiones` varchar(1000) NOT NULL,
  `habitos` varchar(1000) NOT NULL,
  `rol` int(11) NOT NULL,
  `rut` int(15) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `idpaciente` int(11) NOT NULL,
  `estatus` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idrol` int(11) NOT NULL,
  `rol` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idrol`, `rol`) VALUES
(1, 'Administrador'),
(2, 'Medico'),
(3, 'Paciente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nombres` varchar(50) DEFAULT NULL,
  `apepaterno` varchar(50) DEFAULT NULL,
  `apematerno` varchar(50) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `rut` varchar(15) DEFAULT NULL,
  `digrut` varchar(1) DEFAULT NULL,
  `clave` varchar(100) DEFAULT NULL,
  `rol` int(11) DEFAULT NULL,
  `estatus` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombres`, `apepaterno`, `apematerno`, `correo`, `rut`, `digrut`, `clave`, `rol`, `estatus`) VALUES
(1, 'Administrador', 'root', 'root', 'admin@admin.com', 'root', '1', '123', 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `dato_clinico`
--
ALTER TABLE `dato_clinico`
  ADD PRIMARY KEY (`codigo_dato`),
  ADD KEY `usuario_id` (`usuario_id`) USING BTREE,
  ADD KEY `rut` (`rut`,`rol`);

--
-- Indices de la tabla `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`idmedico`),
  ADD KEY `medico_ibfk_1` (`rol`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`idpaciente`),
  ADD KEY `rol` (`rol`) USING BTREE;

--
-- Indices de la tabla `patologico`
--
ALTER TABLE `patologico`
  ADD PRIMARY KEY (`idpatologico`),
  ADD KEY `patologico_ibfk_1` (`rol`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `rut` (`rut`),
  ADD KEY `idpaciente` (`idpaciente`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idrol`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD KEY `rol` (`rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `dato_clinico`
--
ALTER TABLE `dato_clinico`
  MODIFY `codigo_dato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `medico`
--
ALTER TABLE `medico`
  MODIFY `idmedico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `paciente`
--
ALTER TABLE `paciente`
  MODIFY `idpaciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `patologico`
--
ALTER TABLE `patologico`
  MODIFY `idpatologico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idrol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `dato_clinico`
--
ALTER TABLE `dato_clinico`
  ADD CONSTRAINT `dato_clinico_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `medico`
--
ALTER TABLE `medico`
  ADD CONSTRAINT `medico_ibfk_1` FOREIGN KEY (`rol`) REFERENCES `rol` (`idrol`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`rol`) REFERENCES `rol` (`idrol`);

--
-- Filtros para la tabla `patologico`
--
ALTER TABLE `patologico`
  ADD CONSTRAINT `patologico_ibfk_1` FOREIGN KEY (`rol`) REFERENCES `rol` (`idrol`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`rol`) REFERENCES `rol` (`idrol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
