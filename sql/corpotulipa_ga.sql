-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-11-2021 a las 04:00:52
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
-- Estructura de tabla para la tabla `caja_chica`
--

CREATE TABLE `caja_chica` (
  `idcc` int(11) NOT NULL,
  `fondo_actual` decimal(13,2) NOT NULL,
  `fondo_maximo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `caja_chica`
--

INSERT INTO `caja_chica` (`idcc`, `fondo_actual`, `fondo_maximo`) VALUES
(1, '55.93', 900);

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
-- Estructura de tabla para la tabla `facturas_cc`
--

CREATE TABLE `facturas_cc` (
  `id_factura_cc` int(11) NOT NULL,
  `id_sol_cc` int(11) NOT NULL,
  `factura` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `facturas_cc`
--

INSERT INTO `facturas_cc` (`id_factura_cc`, `id_sol_cc`, `factura`) VALUES
(1, 1, 'frontend/img/facturas_cc/sol1n1.png'),
(2, 3, 'frontend/img/facturas_cc/sol3n1.png'),
(3, 3, 'frontend/img/facturas_cc/sol3n2.jpg'),
(4, 3, 'frontend/img/facturas_cc/sol3n3.png'),
(5, 4, 'frontend/img/facturas_cc/sol4n1.png'),
(6, 5, 'frontend/img/facturas_cc/sol5n1.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `id_noti` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `texto` varchar(3000) COLLATE utf8_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `leido` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `notificaciones`
--

INSERT INTO `notificaciones` (`id_noti`, `id_usuario`, `texto`, `fecha`, `leido`) VALUES
(1, 20, 'La solicitud de dinero por caja chica que enviaste ha sido rechazada', '2021-11-14', 0),
(2, 20, 'La solicitud de dinero por caja chica que enviaste ha sido rechazada', '2021-11-20', 0),
(4, 20, 'Rechazo de solicitud de reposición de caja chica #1: Porque yo mando aqui', '2021-11-21', 0),
(5, 20, 'Rechazo de solicitud de reposición de caja chica #1: Porque yo mando aqui vergaaaaa', '2021-11-21', 0),
(6, 37, 'Rechazo de solicitud de reposición de caja chica #1: Porque yo mando aqui', '2021-11-21', 0),
(7, 20, 'Rechazo de solicitud de reposición de caja chica #2: CARAJOOOOOOOOOOOOOOOOO', '2021-11-21', 0),
(8, 38, 'Rechazo de solicitud de reposición de caja chica #2: CARAJOOOOOOOOOOOOOOOOO', '2021-11-21', 0);

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
(37, 'Maria jesús', 'Cumare Trompiz', 'Femenino', 'frontend/img/profile/maria.jpg', 0, '1999-10-06', 4, 1),
(38, 'Milimar', 'Cumare Trompiz', 'Femenino', 'frontend/img/profile/none.jpg', 0, '1999-11-26', 1, 1);

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
(16, 'Editar_UT_Caja_Chica', 6),
(21, 'Editar_UT_Caja_Chica', 4),
(22, 'Aceptar_Sol_CC', 1),
(25, 'Recepcion_Repo_CC', 1),
(26, 'Coordinacion_Repo_CC', 1),
(27, 'Analisis_Repo_CC', 1),
(28, 'Contador_Repo_CC', 1),
(29, 'Gerencia_Repo_CC', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relacion_solicitud_cc`
--

CREATE TABLE `relacion_solicitud_cc` (
  `id_solicitud_repo_cc` int(11) NOT NULL,
  `id_sol_cc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `relacion_solicitud_cc`
--

INSERT INTO `relacion_solicitud_cc` (`id_solicitud_repo_cc`, `id_sol_cc`) VALUES
(1, 1),
(2, 3),
(2, 4);

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
-- Estructura de tabla para la tabla `solicitud_cc`
--

CREATE TABLE `solicitud_cc` (
  `id_sol_cc` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `bs` decimal(13,2) NOT NULL,
  `ut_pedido` decimal(13,2) NOT NULL,
  `motivo` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `aprobado` tinyint(1) NOT NULL DEFAULT 0,
  `efectuado` tinyint(1) NOT NULL DEFAULT 0,
  `validado` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `solicitud_cc`
--

INSERT INTO `solicitud_cc` (`id_sol_cc`, `id_usuario`, `fecha`, `bs`, `ut_pedido`, `motivo`, `aprobado`, `efectuado`, `validado`) VALUES
(1, 20, '2021-11-20', '20000.00', '22.22', 'Javier', 1, 1, 1),
(3, 20, '2021-11-21', '220.00', '0.24', 'eee', 1, 1, 1),
(4, 20, '2021-11-21', '4540.00', '5.04', 'QQQQ', 1, 1, 1),
(5, 20, '2021-11-22', '4010.00', '4.46', 'LLALALA', 1, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud_repo_cc`
--

CREATE TABLE `solicitud_repo_cc` (
  `id_solicitud_repo_cc` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `fondo_momento` decimal(13,2) NOT NULL,
  `custodio` tinyint(1) NOT NULL DEFAULT 0,
  `cuentadante` tinyint(1) NOT NULL DEFAULT 0,
  `coordinador` tinyint(1) NOT NULL DEFAULT 0,
  `analista` tinyint(1) NOT NULL DEFAULT 0,
  `contador` tinyint(1) NOT NULL DEFAULT 0,
  `gerente` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `solicitud_repo_cc`
--

INSERT INTO `solicitud_repo_cc` (`id_solicitud_repo_cc`, `fecha`, `fondo_momento`, `custodio`, `cuentadante`, `coordinador`, `analista`, `contador`, `gerente`) VALUES
(1, '2021-11-20', '65.67', 1, 1, 0, 0, 0, 0),
(2, '2021-11-21', '60.39', 1, 1, 0, 0, 0, 0);

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
(37, 'maria', '$2y$12$/FajvxQKj6q5xfkbfrRIIOf3KluvmyFftQlUzHFPi145nMc8puVcm', 'cocolisosleon@gmail.com', 'active', 'basic'),
(38, 'mili03', '$2y$12$ICddcLMr5VqreSht8avNpuhEpmfkK4PEnMvpFKVRmYJbQOw0O5bXi', 'maryleon@gmail.com', 'active', 'basic');

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
(1, 900, 900);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `caja_chica`
--
ALTER TABLE `caja_chica`
  ADD PRIMARY KEY (`idcc`);

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
-- Indices de la tabla `facturas_cc`
--
ALTER TABLE `facturas_cc`
  ADD PRIMARY KEY (`id_factura_cc`),
  ADD KEY `id_sol_cc` (`id_sol_cc`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`id_noti`),
  ADD KEY `id_usuario` (`id_usuario`);

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
-- Indices de la tabla `relacion_solicitud_cc`
--
ALTER TABLE `relacion_solicitud_cc`
  ADD KEY `id_solicitud_repo_cc` (`id_solicitud_repo_cc`,`id_sol_cc`),
  ADD KEY `id_sol_cc` (`id_sol_cc`);

--
-- Indices de la tabla `reset_password`
--
ALTER TABLE `reset_password`
  ADD PRIMARY KEY (`id_reset_password`),
  ADD KEY `user_reset` (`user_reset`);

--
-- Indices de la tabla `solicitud_cc`
--
ALTER TABLE `solicitud_cc`
  ADD PRIMARY KEY (`id_sol_cc`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `solicitud_repo_cc`
--
ALTER TABLE `solicitud_repo_cc`
  ADD PRIMARY KEY (`id_solicitud_repo_cc`);

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
-- AUTO_INCREMENT de la tabla `caja_chica`
--
ALTER TABLE `caja_chica`
  MODIFY `idcc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- AUTO_INCREMENT de la tabla `facturas_cc`
--
ALTER TABLE `facturas_cc`
  MODIFY `id_factura_cc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `id_noti` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `permiso_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `reset_password`
--
ALTER TABLE `reset_password`
  MODIFY `id_reset_password` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `solicitud_cc`
--
ALTER TABLE `solicitud_cc`
  MODIFY `id_sol_cc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `solicitud_repo_cc`
--
ALTER TABLE `solicitud_repo_cc`
  MODIFY `id_solicitud_repo_cc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `facturas_cc`
--
ALTER TABLE `facturas_cc`
  ADD CONSTRAINT `facturas_cc_ibfk_1` FOREIGN KEY (`id_sol_cc`) REFERENCES `solicitud_cc` (`id_sol_cc`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Filtros para la tabla `relacion_solicitud_cc`
--
ALTER TABLE `relacion_solicitud_cc`
  ADD CONSTRAINT `relacion_solicitud_cc_ibfk_1` FOREIGN KEY (`id_sol_cc`) REFERENCES `solicitud_cc` (`id_sol_cc`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relacion_solicitud_cc_ibfk_2` FOREIGN KEY (`id_solicitud_repo_cc`) REFERENCES `solicitud_repo_cc` (`id_solicitud_repo_cc`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reset_password`
--
ALTER TABLE `reset_password`
  ADD CONSTRAINT `reset_password_ibfk_1` FOREIGN KEY (`user_reset`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `solicitud_cc`
--
ALTER TABLE `solicitud_cc`
  ADD CONSTRAINT `solicitud_cc_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
