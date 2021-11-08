-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-11-2021 a las 01:32:05
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `corpotulipa_ga`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `cargo_id` int(11) NOT NULL,
  `cargo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rango` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`cargo_id`, `cargo`, `rango`) VALUES
(1, 'ACT', 1),
(4, 'Gerente', 2),
(5, 'Jodedor', 2),
(6, 'Ardido', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `departamento_id` int(11) NOT NULL,
  `departamento` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `siglas` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`departamento_id`, `departamento`, `siglas`) VALUES
(1, 'OFICINA', 'OAF');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `genero` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'frontend/img/profile/none.jpg',
  `email_validado` tinyint(1) NOT NULL DEFAULT 0,
  `fecha_nacimiento` date NOT NULL,
  `cargo_id` int(11) DEFAULT NULL,
  `departamento_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`id_usuario`, `nombre`, `apellido`, `genero`, `img`, `email_validado`, `fecha_nacimiento`, `cargo_id`, `departamento_id`) VALUES
(20, 'javier', 'gerardo', 'Masculino', 'frontend/img/profile/javileon.jpg', 0, '2000-10-28', 1, 1),
(37, 'Maria jesús', 'Cumare Trompiz', 'Femenino', 'frontend/img/profile/maria.jpg', 0, '1999-10-06', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `permiso_id` int(11) NOT NULL,
  `accion` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cargo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`permiso_id`, `accion`, `cargo_id`) VALUES
(13, 'Editar_UT_Caja_Chica', 1),
(14, 'Editar_UT_Caja_Chica', 4),
(16, 'Editar_UT_Caja_Chica', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reset_password`
--

CREATE TABLE `reset_password` (
  `id_reset_password` int(11) NOT NULL,
  `user_reset` int(11) NOT NULL,
  `token` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_reset` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `permisos` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'basic'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `username`, `password`, `email`, `status`, `permisos`) VALUES
(20, 'javileon', '$2y$12$yNvjs9xp6IBM40BPrMMWueflOttUhyBO49lJhm8ajarSIu1BJrpAq', 'javicentego@gmail.com', 'active', 'super'),
(37, 'maria', '$2y$12$/FajvxQKj6q5xfkbfrRIIOf3KluvmyFftQlUzHFPi145nMc8puVcm', 'cocolisosleon@gmail.com', 'active', 'basic');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ut`
--

CREATE TABLE `ut` (
  `utid` int(11) NOT NULL,
  `ut` int(11) NOT NULL DEFAULT 0,
  `cambio_ut` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ut`
--

INSERT INTO `ut` (`utid`, `ut`, `cambio_ut`) VALUES
(1, 90, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`cargo_id`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`departamento_id`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `cargo_id` (`cargo_id`),
  ADD KEY `departamento_id` (`departamento_id`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`permiso_id`),
  ADD KEY `cargo_id` (`cargo_id`);

--
-- Indices de la tabla `reset_password`
--
ALTER TABLE `reset_password`
  ADD PRIMARY KEY (`id_reset_password`),
  ADD KEY `user_reset` (`user_reset`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ut`
--
ALTER TABLE `ut`
  ADD PRIMARY KEY (`utid`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `cargo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `departamento_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `permiso_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `reset_password`
--
ALTER TABLE `reset_password`
  MODIFY `id_reset_password` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD CONSTRAINT `perfil_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `perfil_ibfk_2` FOREIGN KEY (`departamento_id`) REFERENCES `departamento` (`departamento_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `perfil_ibfk_3` FOREIGN KEY (`cargo_id`) REFERENCES `cargo` (`cargo_id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`cargo_id`) REFERENCES `cargo` (`cargo_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reset_password`
--
ALTER TABLE `reset_password`
  ADD CONSTRAINT `reset_password_ibfk_1` FOREIGN KEY (`user_reset`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
