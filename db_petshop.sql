-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-11-2022 a las 12:01:16
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_petshop`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` bigint(20) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `portada` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp(),
  `ruta` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `nombre`, `descripcion`, `portada`, `datecreated`, `ruta`, `status`) VALUES
(1, 'Otras Mascota', 'Todo para tus otras mascotas', 'img_50f81ea9c3ed5c077b710753e6f53ce0.jpg', '2022-09-30 16:22:11', 'otras-mascota', 1),
(2, 'Gatos', 'Todos para tu gato', 'img_34fda69f15419d231a6bc6f3212f40fc.jpg', '2022-09-30 16:28:37', 'gatos', 1),
(3, 'Perros', 'Todo para tu perro', 'img_7fc2fe8dfa8a355f53ca5bf4a74ad663.jpg', '2022-09-30 16:29:02', 'perros', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto`
--

CREATE TABLE `contacto` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(200) COLLATE utf8mb4_swedish_ci NOT NULL,
  `email` varchar(200) COLLATE utf8mb4_swedish_ci NOT NULL,
  `mensaje` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `ip` varchar(15) COLLATE utf8mb4_swedish_ci NOT NULL,
  `dispositivo` varchar(25) COLLATE utf8mb4_swedish_ci NOT NULL,
  `useragent` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `datecreated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `contacto`
--

INSERT INTO `contacto` (`id`, `nombre`, `email`, `mensaje`, `ip`, `dispositivo`, `useragent`, `datecreated`) VALUES
(1, 'Asdasd', 'sergius16ht@gmail.com', 'sadasd', '::1', 'PC', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', '2022-10-28 06:21:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cupon`
--

CREATE TABLE `cupon` (
  `id_cupon` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE utf8mb4_swedish_ci NOT NULL,
  `porcentaje_dscto` decimal(3,1) DEFAULT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `cantidad_uso` int(11) DEFAULT 0,
  `total` int(11) DEFAULT 0,
  `personaid` bigint(20) NOT NULL,
  `fecha_reg` datetime NOT NULL DEFAULT current_timestamp(),
  `personaid_mod` bigint(20) DEFAULT NULL,
  `fecha_mod` datetime DEFAULT NULL,
  `estado` char(1) COLLATE utf8mb4_swedish_ci DEFAULT NULL COMMENT 'A:ACTIVO, I:INACTIVO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `cupon`
--

INSERT INTO `cupon` (`id_cupon`, `descripcion`, `porcentaje_dscto`, `fecha_inicio`, `fecha_fin`, `cantidad_uso`, `total`, `personaid`, `fecha_reg`, `personaid_mod`, `fecha_mod`, `estado`) VALUES
(1, 'OHMYPET10', '5.0', '2022-11-01 16:34:53', '2022-11-06 16:34:53', 0, 3, 1, '2022-11-16 21:28:36', NULL, NULL, 'A'),
(2, 'OHMYPET11', '2.5', '2022-11-01 16:34:53', '2022-11-06 16:34:53', 0, 2, 1, '2022-11-16 21:28:36', NULL, NULL, 'A'),
(3, 'OHMYPET12', '4.5', '2022-11-01 16:34:53', '2022-11-06 16:34:53', 0, 4, 1, '2022-11-16 21:28:36', NULL, NULL, 'A'),
(4, 'OHMYPET13', '1.5', '2022-11-01 16:34:53', '2022-11-06 16:34:53', 0, 10, 1, '2022-11-16 21:28:36', NULL, NULL, 'A'),
(5, 'OHMYPET14', '3.5', '2022-11-01 16:34:53', '2022-11-06 16:34:53', 0, 15, 1, '2022-11-16 21:28:36', NULL, NULL, 'A'),
(6, 'OHMYPET15', '5.0', '2022-11-01 16:34:53', '2022-11-06 16:34:53', 0, 6, 1, '2022-11-16 21:28:36', NULL, NULL, 'A'),
(7, 'OHMYPET16', '2.5', '2022-11-01 16:34:53', '2022-11-06 16:34:53', 0, 8, 1, '2022-11-16 21:28:36', NULL, NULL, 'A'),
(8, 'OHMYPET17', '4.5', '2022-11-01 16:34:53', '2022-11-06 16:34:53', 0, 17, 1, '2022-11-16 21:28:36', NULL, NULL, 'A'),
(9, 'OHMYPET18', '1.5', '2022-11-01 16:34:53', '2022-11-06 16:34:53', 0, 25, 1, '2022-11-16 21:28:36', NULL, NULL, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id` bigint(20) NOT NULL,
  `pedidoid` bigint(20) NOT NULL,
  `productoid` bigint(20) NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`id`, `pedidoid`, `productoid`, `precio`, `cantidad`) VALUES
(1, 1, 10, '15.00', 7),
(2, 2, 10, '15.00', 1),
(3, 3, 9, '23.00', 7),
(4, 3, 5, '30.00', 9),
(5, 4, 11, '35.00', 1),
(6, 5, 11, '35.00', 2),
(9, 8, 11, '35.00', 1),
(11, 10, 11, '35.00', 1),
(12, 11, 11, '35.00', 1),
(13, 12, 11, '35.00', 1),
(14, 13, 10, '15.00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_temp`
--

CREATE TABLE `detalle_temp` (
  `id` bigint(20) NOT NULL,
  `personaid` bigint(20) NOT NULL,
  `productoid` bigint(20) NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `transaccionid` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `detalle_temp`
--

INSERT INTO `detalle_temp` (`id`, `personaid`, `productoid`, `precio`, `cantidad`, `transaccionid`) VALUES
(9, 1, 10, '15.00', 4, '5s8quumvueurm8asm0sf8a88ub'),
(10, 18, 9, '23.00', 1, '5s8quumvueurm8asm0sf8a88ub'),
(11, 18, 6, '30.00', 1, '5s8quumvueurm8asm0sf8a88ub'),
(16, 21, 10, '15.00', 1, 'ujklfmmjpgnohppscotou872ra'),
(17, 1, 10, '15.00', 2, 'ujklfmmjpgnohppscotou872ra'),
(22, 1, 8, '60.00', 6, 'l5emk1fndmne2vjr17frcqokqv'),
(23, 24, 10, '15.00', 1, 'l5emk1fndmne2vjr17frcqokqv'),
(24, 25, 10, '15.00', 8, 'l5emk1fndmne2vjr17frcqokqv'),
(26, 1, 8, '60.00', 5, 'ki0b2l4jlq6hr1apeh17959s2i'),
(27, 1, 10, '15.00', 7, 'mokv45c511vd0i92tb6ar60v00'),
(28, 1, 10, '15.00', 1, 'p36lo49cnuoir1bmt1i33kjapc'),
(29, 26, 9, '23.00', 7, '6fcb5u6tkm7q8n778qbfbhdbfr'),
(30, 26, 5, '30.00', 9, '6fcb5u6tkm7q8n778qbfbhdbfr'),
(31, 1, 11, '35.00', 1, '2grk20ph4q7burtn7avmk225lo'),
(32, 1, 11, '35.00', 2, '2hg20s382nloojeud4sat9smsr'),
(34, 1, 8, '60.00', 1, 'st2ci37a1a9326tl5bi83lt6j3'),
(35, 23, 11, '35.00', 1, '7c6ig7rjh4grnruv2eq3sump4e'),
(36, 1, 11, '35.00', 1, 'tc6mlrpc1tefa2mg7pcu3j4f6m'),
(37, 1, 11, '35.00', 1, 'kfseg2a50biallees1mnql61je'),
(45, 1, 9, '23.00', 1, '8rdriogf5r3bhcnufsk7hgj8vd'),
(46, 1, 11, '35.00', 1, 'anoa1s351rq15229poktf7ol7n'),
(47, 1, 10, '15.00', 1, 'eurt2k836gjoh0kejrhjso49h1'),
(48, 1, 10, '15.00', 1, 'r2tlu8difsu85af0237i75sacr'),
(49, 1, 10, '15.00', 1, '8vn4ads4uakbgu3g253ab3ke0k'),
(50, 1, 10, '15.00', 1, '0c7phn0rn74g7ftq29nh3d7uaj'),
(51, 1, 10, '15.00', 1, 't933rg4bkl8brd3n2ho4s1a3ea'),
(52, 1, 20, '175.00', 1, 'ej8k73k3o5da5ca41iavoqv2l3'),
(143, 1, 17, '40.00', 1, 'a431e5pjt4rpm0odmjj0qg42j5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen`
--

CREATE TABLE `imagen` (
  `id` bigint(20) NOT NULL,
  `productoid` bigint(20) NOT NULL,
  `img` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `imagen`
--

INSERT INTO `imagen` (`id`, `productoid`, `img`) VALUES
(28, 6, 'pro_430a7080770da0279e9990a250b77574.jpg'),
(29, 6, 'pro_47033f43b7af01ccee70302287feeb4d.jpg'),
(30, 6, 'pro_f3b868303648da9cc499dece66e78044.jpg'),
(31, 5, 'pro_b8ade8c9c807e206fed067db3e9acf9c.jpg'),
(32, 5, 'pro_75af4df3e3cc43a6002af07735f200eb.jpg'),
(33, 5, 'pro_74a5a19192f4056902c5654937139d06.jpg'),
(34, 4, 'pro_69696ee5b0420c0bfd6a225282c5b450.jpg'),
(35, 4, 'pro_0d1145a90eb54315bb4695f7198eeb71.jpg'),
(36, 4, 'pro_040ef3684179ede08a6ff64aa943f394.jpg'),
(37, 8, 'pro_844a94c94fe6c52daf6878b8ea9eeaed.jpg'),
(38, 8, 'pro_f978d5e5febdb7d9231693cc7dd897b9.jpg'),
(39, 8, 'pro_18bcbac8d42752eaade1f1808e8e3aa8.jpg'),
(43, 11, 'pro_75af4df3e3cc43a6002af07735f200eb.jpg'),
(45, 10, 'pro_0be279a84706978ad68eb8919e0f4fff.jpg'),
(46, 9, 'pro_a85d661267e8f799f4f0637eb8b61d33.jpg'),
(47, 7, 'pro_8a8f100e5e314925df1ded88edc061db.jpg'),
(48, 7, 'pro_0d1145a90eb54315bb4695f7198eeb71.jpg'),
(49, 7, 'pro_44e2b2fa1b3b69caa5c6624bca222bd9.jpg'),
(50, 11, 'pro_25a33ed3a2596bcc88718aad23ffecec.jpg'),
(52, 12, 'pro_066ef4047b35ff7663d10244e5ba7786.jpg'),
(53, 12, 'pro_de514f2671535c035da2e8d2c62ab8d6.jpg'),
(54, 12, 'pro_23c9e0ce23b99ba3714de7532eb3a69d.jpg'),
(55, 12, 'pro_315ff43335dbbe9058044138927d1b03.jpg'),
(56, 12, 'pro_58dfb23de7bc78a11ff641870655c4ec.jpg'),
(57, 12, 'pro_4cda2e002cbb0501e05447d8311caa7a.jpg'),
(58, 12, 'pro_940b631c2ea1e33b806b8d774ad8d0dc.jpg'),
(59, 12, 'pro_5d60a2f656375e7701a5f9d20eaf0ed8.jpg'),
(60, 13, 'pro_1033fa8af413d760959b88d05cb7ee9e.jpg'),
(61, 14, 'pro_07ee986a1df7858d412aadd80aabb094.jpg'),
(62, 15, 'pro_23a293e41ef3b53212afbbb260dc3bed.jpg'),
(63, 16, 'pro_6c15c31ba4fdb3df32b676d6d89b5ffe.jpg'),
(64, 17, 'pro_01683f67f17d47b13a52c161b17fd5eb.jpg'),
(65, 18, 'pro_ff6e9f0b913e438f30dfdd0a02f31604.jpg'),
(66, 19, 'pro_857734b0c68468d11d4863d35826a51d.jpg'),
(67, 20, 'pro_d9dbabbfc2bbda2d0c2d4bb703dda5e0.jpg'),
(68, 21, 'pro_2034e96fdde66bbeb32a6baf21026772.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libroreclamaciones`
--

CREATE TABLE `libroreclamaciones` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(200) COLLATE utf8mb4_swedish_ci NOT NULL,
  `email` varchar(200) COLLATE utf8mb4_swedish_ci NOT NULL,
  `mensaje` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `ip` varchar(15) COLLATE utf8mb4_swedish_ci NOT NULL,
  `dispositivo` varchar(25) COLLATE utf8mb4_swedish_ci NOT NULL,
  `useragent` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `datecreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `telefono` int(11) NOT NULL,
  `asunto` text COLLATE utf8mb4_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `libroreclamaciones`
--

INSERT INTO `libroreclamaciones` (`id`, `nombre`, `email`, `mensaje`, `ip`, `dispositivo`, `useragent`, `datecreated`, `telefono`, `asunto`) VALUES
(1, 'Sergio Alexander', 'sergius16ht@gmail.com', 'asdasdasd', '::1', 'PC', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-17 02:47:25', 902216601, 'Reclamo 1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE `modulo` (
  `idmodulo` bigint(20) NOT NULL,
  `titulo` varchar(50) COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `modulo`
--

INSERT INTO `modulo` (`idmodulo`, `titulo`, `descripcion`, `status`) VALUES
(1, 'Dashboard', 'Dashboard', 1),
(2, 'Usuarios', 'Usuarios del sistema', 1),
(3, 'Clientes', 'Clientes de tienda', 1),
(4, 'Productos', 'Todos los productos', 1),
(5, 'Pedidos', 'Pedidos', 1),
(6, 'Caterogías', 'Caterogías Productos', 1),
(7, 'suscriptores', 'Suscriptores del sitio web', 1),
(8, 'Contactos', 'Mensajes del formulario contacto', 1),
(11, 'Paginas', 'Páginas del sitio web', 1),
(13, 'libroreclamaciones', 'Todas los reclamos', 1),
(14, 'Cupones', 'Gestion de cupones', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `idpedido` bigint(20) NOT NULL,
  `id_cupon` int(11) DEFAULT NULL,
  `referenciacobro` varchar(255) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `idtransaccionpaypal` varchar(255) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `datospaypal` text COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `personaid` bigint(20) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `costoenvio` decimal(10,2) NOT NULL DEFAULT 0.00,
  `monto` decimal(11,2) NOT NULL,
  `tipopagoid` bigint(20) NOT NULL COMMENT '1:PAYPAL, 2:TARJETA, 5:EFECTIVO',
  `direccionenvio` text COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `status` varchar(110) COLLATE utf8mb4_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`idpedido`, `id_cupon`, `referenciacobro`, `idtransaccionpaypal`, `datospaypal`, `personaid`, `fecha`, `costoenvio`, `monto`, `tipopagoid`, `direccionenvio`, `status`) VALUES
(1, NULL, NULL, '36981674D71696318', '{\"id\":\"2AC26857LD1317626\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"155.00\"},\"payee\":{\"email_address\":\"sb-lmuua21551784@business.example.com\",\"merchant_id\":\"ZDEDWCG3M4NXC\"},\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Lima\",\"admin_area_1\":\"Lima\",\"postal_code\":\"07001\",\"country_code\":\"PE\"}},\"payments\":{\"captures\":[{\"id\":\"36981674D71696318\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"155.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"create_time\":\"2022-10-26T04:15:09Z\",\"update_time\":\"2022-10-26T04:15:09Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"email_address\":\"sb-yofmr21494532@personal.example.com\",\"payer_id\":\"B9M4NVYJ3PMUY\",\"address\":{\"country_code\":\"PE\"}},\"create_time\":\"2022-10-26T04:14:53Z\",\"update_time\":\"2022-10-26T04:15:09Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/2AC26857LD1317626\",\"rel\":\"self\",\"method\":\"GET\"}]}', 1, '2022-10-25 23:15:11', '50.00', '155.00', 1, 'Av Petit Thoars, 1033, lima', 'Reembolsado'),
(2, NULL, NULL, '752052324J031942B', '{\"id\":\"0FW7817733040044W\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"65.00\"},\"payee\":{\"email_address\":\"sb-lmuua21551784@business.example.com\",\"merchant_id\":\"ZDEDWCG3M4NXC\"},\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Lima\",\"admin_area_1\":\"Lima\",\"postal_code\":\"07001\",\"country_code\":\"PE\"}},\"payments\":{\"captures\":[{\"id\":\"752052324J031942B\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"65.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"create_time\":\"2022-10-26T04:19:16Z\",\"update_time\":\"2022-10-26T04:19:16Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"email_address\":\"sb-yofmr21494532@personal.example.com\",\"payer_id\":\"B9M4NVYJ3PMUY\",\"address\":{\"country_code\":\"PE\"}},\"create_time\":\"2022-10-26T04:19:09Z\",\"update_time\":\"2022-10-26T04:19:16Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/0FW7817733040044W\",\"rel\":\"self\",\"method\":\"GET\"}]}', 1, '2022-10-25 23:19:17', '50.00', '65.00', 1, 'Av Petit Thoars, 1033, lima', 'Reembolsado'),
(3, NULL, NULL, '7T944553GH762964F', '{\"id\":\"8W693966BY063330A\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"481.00\"},\"payee\":{\"email_address\":\"sb-lmuua21551784@business.example.com\",\"merchant_id\":\"ZDEDWCG3M4NXC\"},\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Lima\",\"admin_area_1\":\"Lima\",\"postal_code\":\"07001\",\"country_code\":\"PE\"}},\"payments\":{\"captures\":[{\"id\":\"7T944553GH762964F\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"481.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"create_time\":\"2022-10-26T07:55:30Z\",\"update_time\":\"2022-10-26T07:55:30Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"email_address\":\"sb-yofmr21494532@personal.example.com\",\"payer_id\":\"B9M4NVYJ3PMUY\",\"address\":{\"country_code\":\"PE\"}},\"create_time\":\"2022-10-26T07:55:17Z\",\"update_time\":\"2022-10-26T07:55:30Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/8W693966BY063330A\",\"rel\":\"self\",\"method\":\"GET\"}]}', 26, '2022-10-26 02:55:31', '50.00', '481.00', 1, 'Petit Thoars 1033, lima', 'Completo'),
(4, NULL, NULL, '4GJ29750YX1746930', '{\"id\":\"67H86399K7911713E\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"85.00\"},\"payee\":{\"email_address\":\"sb-lmuua21551784@business.example.com\",\"merchant_id\":\"ZDEDWCG3M4NXC\"},\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Lima\",\"admin_area_1\":\"Lima\",\"postal_code\":\"07001\",\"country_code\":\"PE\"}},\"payments\":{\"captures\":[{\"id\":\"4GJ29750YX1746930\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"85.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"create_time\":\"2022-10-29T03:51:49Z\",\"update_time\":\"2022-10-29T03:51:49Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"email_address\":\"sb-yofmr21494532@personal.example.com\",\"payer_id\":\"B9M4NVYJ3PMUY\",\"address\":{\"country_code\":\"PE\"}},\"create_time\":\"2022-10-29T03:51:25Z\",\"update_time\":\"2022-10-29T03:51:49Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/67H86399K7911713E\",\"rel\":\"self\",\"method\":\"GET\"}]}', 1, '2022-10-28 22:51:51', '50.00', '85.00', 1, 'LIMA, LIMA', 'Reembolsado'),
(5, NULL, 'hgjhgjk', '', NULL, 1, '2022-10-28 22:54:07', '50.00', '120.00', 5, 'LIMA, LIMA', 'Completo'),
(6, NULL, 'OHMYPET002', '', NULL, 1, '2022-10-30 12:52:05', '50.00', '250.00', 2, 'VES, VES', 'Completo'),
(8, NULL, 'OHMYPET003', '', NULL, 23, '2022-10-30 13:09:14', '50.00', '85.00', 5, 'LIMA, LIMA', 'Completo'),
(10, 1, 'OHMYPET005', '', NULL, 1, '2022-11-07 21:49:37', '50.00', '80.75', 5, 'LIMA, LIMA', 'Completo'),
(11, NULL, NULL, '9B222996GM103173F', '{\"id\":\"9TY27712HS677161L\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"21.79\"},\"payee\":{\"email_address\":\"sb-lmuua21551784@business.example.com\",\"merchant_id\":\"ZDEDWCG3M4NXC\"},\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Lima\",\"admin_area_1\":\"Lima\",\"postal_code\":\"07001\",\"country_code\":\"PE\"}},\"payments\":{\"captures\":[{\"id\":\"9B222996GM103173F\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"21.79\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"create_time\":\"2022-11-08T04:22:55Z\",\"update_time\":\"2022-11-08T04:22:55Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"email_address\":\"sb-yofmr21494532@personal.example.com\",\"payer_id\":\"B9M4NVYJ3PMUY\",\"address\":{\"country_code\":\"PE\"}},\"create_time\":\"2022-11-08T04:22:00Z\",\"update_time\":\"2022-11-08T04:22:55Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/9TY27712HS677161L\",\"rel\":\"self\",\"method\":\"GET\"}]}', 1, '2022-11-07 23:22:57', '50.00', '85.00', 1, ', ', 'Completo'),
(12, NULL, 'OHMYPET006', '', NULL, 1, '2022-11-13 22:57:48', '50.00', '85.00', 5, 'LIMA, LIMA', 'Completo'),
(13, NULL, 'OHMYPET008', '', NULL, 1, '2022-11-14 22:08:28', '50.00', '65.00', 5, 'LIMA, LIMA', 'Completo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `idpermiso` bigint(20) NOT NULL,
  `rolid` bigint(20) NOT NULL,
  `moduloid` bigint(20) NOT NULL,
  `r` int(11) NOT NULL DEFAULT 0,
  `w` int(11) NOT NULL DEFAULT 0,
  `u` int(11) NOT NULL DEFAULT 0,
  `d` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`idpermiso`, `rolid`, `moduloid`, `r`, `w`, `u`, `d`) VALUES
(350, 2, 1, 1, 0, 0, 0),
(351, 2, 2, 1, 0, 0, 0),
(352, 2, 3, 1, 0, 0, 0),
(353, 2, 4, 1, 0, 0, 0),
(354, 2, 5, 1, 0, 0, 0),
(355, 2, 6, 1, 0, 0, 0),
(530, 7, 1, 1, 0, 0, 0),
(531, 7, 2, 0, 0, 0, 0),
(532, 7, 3, 0, 0, 0, 0),
(533, 7, 4, 0, 0, 0, 0),
(534, 7, 5, 1, 0, 0, 0),
(535, 7, 6, 0, 0, 0, 0),
(536, 7, 7, 0, 0, 0, 0),
(537, 7, 8, 0, 0, 0, 0),
(538, 7, 11, 0, 0, 0, 0),
(629, 1, 1, 1, 1, 1, 1),
(630, 1, 2, 1, 1, 1, 1),
(631, 1, 3, 1, 1, 1, 1),
(632, 1, 4, 1, 1, 1, 1),
(633, 1, 5, 1, 1, 1, 1),
(634, 1, 6, 1, 1, 1, 1),
(635, 1, 7, 1, 1, 1, 1),
(636, 1, 8, 1, 1, 1, 1),
(637, 1, 11, 1, 1, 1, 1),
(638, 1, 13, 1, 1, 1, 1),
(639, 1, 14, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `idpersona` bigint(20) NOT NULL,
  `identificacion` varchar(30) COLLATE utf8mb4_swedish_ci NOT NULL,
  `nombres` varchar(80) COLLATE utf8mb4_swedish_ci NOT NULL,
  `apellidos` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `telefono` bigint(20) NOT NULL,
  `email_user` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `password` varchar(75) COLLATE utf8mb4_swedish_ci NOT NULL,
  `nit` varchar(20) COLLATE utf8mb4_swedish_ci NOT NULL,
  `nombrefiscal` varchar(80) COLLATE utf8mb4_swedish_ci NOT NULL,
  `direccionfiscal` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `token` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `rolid` bigint(20) NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idpersona`, `identificacion`, `nombres`, `apellidos`, `telefono`, `email_user`, `password`, `nit`, `nombrefiscal`, `direccionfiscal`, `token`, `rolid`, `datecreated`, `status`) VALUES
(1, '2409198923', 'Super', 'Admin', 1234567, 'info@superadmin.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '24252622', 'Super Admin', 'Lima-Per', '', 1, '2020-08-13 00:51:44', 1),
(2, '7865421565', 'Carlos', 'Hernández', 789465487, 'carlos@info.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', '', 1, '2020-08-13 00:54:08', 1),
(3, '879846545454', 'Pablo', 'Arana', 784858856, 'pablo@info.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', '', 3, '2020-08-14 01:42:34', 0),
(4, '65465465', 'Jorge David', 'Arana', 987846545, 'jorge@info.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', '', 1, '2020-08-22 00:27:17', 1),
(5, '4654654', 'Carme', 'Arana', 646545645, 'carmen@infom.com', 'be63ad947e82808780278e044bcd0267a6ac6b3cd1abdb107cc10b445a182eb0', '', '', '', '', 1, '2020-08-22 00:35:04', 1),
(6, '8465484', 'Alex Fernando', 'Méndez', 222222222, 'alex@info.com', '608cfa9ffc1dac43e8710cb23bbcf1d5215beee7ca8632c6a4a5a63a56f59aeb', '', '', '', '', 7, '2020-08-22 00:48:50', 0),
(7, '54684987', 'Francisco', 'Herrera', 6654456545, 'francisco@info.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', '', 1, '2020-08-22 01:55:57', 1),
(8, '54646849841', 'Axel', 'Vela', 654687454, 'axel@info.com', 'a5b810a3190a39033de4d82052fdf6f4c9765516d6b7eeb0c496adf8a3d3efc9', '', '', '', '', 3, '2020-09-07 01:30:52', 1),
(9, '132123132132', 'Ejemplodeupdate', 'EJemplo', 123456789, 'ejemplo@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'CF', 'EJmplo', 'Lima-Peru', '', 7, '2022-09-23 23:02:22', 0),
(11, '145645646', 'Ejemplotres', 'EJemplotres', 123456789, 'ejemplo3@gmail.com', '0fb90862b0245f855e9601431a0a968ba8974da373e3511209232df7bbd3aae5', 'CD', 'Ejemplotres', 'lima-peru', '', 7, '2022-09-24 11:34:55', 1),
(12, '96305281', 'Ejemplotres', 'EJemplotres', 123456789, 'ejemplom@gmail.com', 'b69ec4e563a4c19dc6f82b2f716ef6ba89c3d4e14dff600ecc102f4102ec435a', 'CD', 'Ejemplotres', 'lima-peru', '', 7, '2022-09-24 11:35:15', 1),
(13, '9888888', 'Ocho', 'Ocho', 345687123, 'ocho@gmail.com', 'cd14926896094764982aeaea0173aba05c7abeb7d34f027f4757e44872c4d8e6', 'nueve', 'ocho', 'ocho', '', 7, '2022-09-24 11:36:35', 0),
(14, '0000000', 'Siete', 'Siete', 123498765, 'emailw@gmail.com', '509da48afea39f36ad4ff012d28685aa87e9af68e40a6fb4f4d177056f9bb343', 'hdd', 'cero', 'cero', '', 7, '2022-09-24 11:42:44', 0),
(15, '55555555', 'Siete', 'Siete', 777777888, 'siete@gmail.com', '66d657293f35410191536b10dfe71a1210543ff0fbfb3ea7bb51ba1b91841ce6', '', '', '', '', 1, '2022-09-24 11:44:25', 0),
(16, '99999999', 'Nueve', 'Nueve', 999999999, 'nueve@gmail.com', '127c3952b52b0df5b6bef889cc15632b1d5c73943254fa875cec82b430c4a973', 'nueve', 'nueve', 'nueve', '', 7, '2022-09-24 11:46:16', 0),
(17, '', 'Sergio', 'Ht', 963852741, 'pruebadecarrito@gmail.com', '5a8f4684220638bd3a459a817e3c4fa988c982d409229e7e108f519072e5164c', '', '', '', '', 7, '2022-10-11 14:51:34', 1),
(18, '', 'Pagoconcarrito', 'Pagoconcarrito', 987654321, 'carrito@gmail.com', 'd39fd34fc62cc5b3b4099ddfe287d8a32d990f496d16e395d672e34f80df681d', '', '', '', '', 7, '2022-10-11 15:27:18', 1),
(19, '', 'Sergio', 'Ht', 5645465456345, 'asdas@gmail.com', 'b365da5f69d006eaa6269f95c68ca305843e534c1ee47762951542b2ffc82a3a', '', '', '', '', 7, '2022-10-11 15:33:09', 1),
(20, '', 'Asdasd', 'Asdas', 13123123, 'adasd@gmail.com', '47756fa283b7dcf363ae29c451eeec6a1634e3c93f1acd2fea9478c6e56dc14b', '', '', '', '', 7, '2022-10-11 15:38:04', 1),
(21, '', 'Hjhjhjj', 'Hjhjh', 65457657567, 'jkjk@gmail.com', '4918864a627976364081a2dc65758bc3c1ec906bace5bcd241fe205658868eee', '', '', '', '', 7, '2022-10-11 15:39:01', 1),
(22, '1233424', 'Algo', 'Algosss', 546987458, 'dasdsa@gmail.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', '', '', '', '', 3, '2022-10-12 00:14:57', 1),
(23, '88888888', 'Ocho', 'Ocho', 854745574, 'ocholl@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '45454545454545', 'ocho', 'ocho', '', 7, '2022-10-12 00:16:25', 1),
(24, '', 'Lol', 'Lol', 456465645, 'lol@gmail.com', '491906f44fa5b12a891e4663353a893a37604783f101757bee46f81d6d9fa253', '', '', '', '', 7, '2022-10-12 02:32:02', 1),
(25, '', 'Xd', 'Xd', 569874456, 'xd@gmail.com', '686c75c1073846e498145bfaa61ecc712c7f33d9f669b1f6312942e85a4f83a1', '', '', '', '', 7, '2022-10-12 02:37:47', 1),
(26, '66666', 'Sergio', 'Ht', 123456789, 'sergius16ht@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '45454545454545', 'Cliente enterprise', '01', '', 7, '2022-10-26 02:51:10', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `post`
--

CREATE TABLE `post` (
  `idpost` bigint(20) NOT NULL,
  `titulo` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `contenido` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `portada` varchar(100) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `datecreate` datetime NOT NULL DEFAULT current_timestamp(),
  `ruta` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `post`
--

INSERT INTO `post` (`idpost`, `titulo`, `contenido`, `portada`, `datecreate`, `ruta`, `status`) VALUES
(1, 'Inicio', '<p>CUPON : OHMYPET10</p>', '', '2022-10-28 01:12:37', 'inicio', 1),
(2, 'Tienda', '<p>Contenido</p>', '', '2022-10-28 01:12:57', 'tienda', 1),
(3, 'Carrito', '<p>Contenido</p>', '', '2022-10-28 01:13:21', 'carrito', 1),
(4, 'Nosotros', '<div data-section=\"nosotros\" data-value=\"nosotros-introduccion\"> <p>En Oh My Pet! nosotros creemos que para cumplir con las expectativas de nuestros clientes contamos con los siguientes valores:</p> </div> <div data-section=\"nosotros\" data-value=\"nosotros-servicio-subtitulo\"> <p>SERVICIO</p> </div> <div data-section=\"nosotros\" data-value=\"nosotros-servicio-contenido\"> <p>La&nbsp;calidad del servicio al cliente es&nbsp;el principal valor&nbsp;que nos&nbsp;diferencia&nbsp;de&nbsp;nuestros competidores&nbsp;y&nbsp;es el&nbsp;factor&nbsp;de&nbsp;&eacute;xito de&nbsp;nuestra empresa.&nbsp;La calidad&nbsp;del&nbsp;servicio se mide en&nbsp;todas las interacciones con&nbsp;los&nbsp;clientes.</p> </div> <div data-section=\"nosotros\" data-value=\"nosotros-cumplimiento-subtitulo\"> <p>CUMPLIMIENTO</p> </div> <div data-section=\"nosotros\" data-value=\"nosotros-cumplimiento-contenido\"> <p>Es la&nbsp;ejecuci&oacute;n&nbsp;de&nbsp;nuestra obra, negociada y declarada seg&uacute;n&nbsp;las caracter&iacute;sticas de calidad, cantidad y&nbsp;posibilidad.&nbsp;En nuestra&nbsp;operaci&oacute;n,&nbsp;este valor se&nbsp;manifiesta especialmente&nbsp;en el servicio al cliente.</p> </div> <div data-section=\"nosotros\" data-value=\"nosotros-calidad-subtitulo\"> <p>CALIDAD</p> </div> <div data-section=\"nosotros\" data-value=\"nosotros-calidad-contenido\"> <p>Representa&nbsp;el amor, la&nbsp;misi&oacute;n&nbsp;y el respeto&nbsp;por&nbsp;los dem&aacute;s. Es&nbsp;cari&ntilde;o, amabilidad&nbsp;y&nbsp;bondad&nbsp;en&nbsp;las relaciones&nbsp;con nuestros compa&ntilde;eros, clientes, socios comerciales y dem&aacute;s interlocutores. Es&nbsp;una se&ntilde;al&nbsp;de atenci&oacute;n que&nbsp;queremos&nbsp;recibir y&nbsp;ofrecer a los dem&aacute;s.</p> </div> <div data-section=\"nosotros\" data-value=\"nosotros-compromiso-subtitulo\"> <p>COMPROMISO</p> </div> <div data-section=\"nosotros\" data-value=\"nosotros-compromiso-contenido\"> <p>Se deriva&nbsp;de&nbsp;una creencia&nbsp;personal en los beneficios de&nbsp;realizar&nbsp;tareas&nbsp;responsables. Este compromiso nos&nbsp;permite pasar de las promesas a&nbsp;las acciones que producen&nbsp;resultados y beneficios tangibles.</p> </div> <div data-section=\"nosotros\" data-value=\"nosotros-innovacion-subtitulo\"> <p>INNOVACI&Oacute;N</p> </div> <div data-section=\"nosotros\" data-value=\"nosotros-innovacion-contenido\"> <p>Es&nbsp;un uso eficaz&nbsp;de la creatividad.&nbsp;Esto se&nbsp;refleja en la redefinici&oacute;n y/o reinvenci&oacute;n de productos, estrategias, actividades y funciones&nbsp;para mejorarlos. Las innovaciones pueden&nbsp;encontrar mayores beneficios que&nbsp;las existentes.</p> <p>&nbsp;</p> </div> <div class=\"row\"> <div class=\"order-md-1 col-11 col-md-5 col-lg-4 m-lr-auto p-b-30\"> <div class=\"how-bor2\"> <div class=\"hov-img0\"><img src=\"https://cdn.pixabay.com/photo/2015/07/17/22/43/student-849822_1280.jpg\" alt=\"IMG\" width=\"500\" height=\"333\" /></div> </div> </div> </div>', 'img_86c655c520abc81f7238d0f61fa855ed.jpg', '2022-10-28 01:13:45', 'nosotros', 1),
(5, 'Contacto', '<div class=\"map\"><iframe style=\"border: 0;\" src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3901.6509201177596!2d-77.03783328455768!3d12.067522145574099!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105c8eb73a4c50f%3A0x61219792de12a71c!2sUniversidad%20Tecnol%C3%B3gica%20Del%20Per%C3%BA%20-%20Informes!5e0!3m2!1ses!2sgt!4v1667874861998!5m2!1ses!2sgt\" width=\"100%\" height=\"600\" allowfullscreen=\"allowfullscreen\" loading=\"lazy\"></iframe></div>', '', '2022-10-28 01:14:32', 'contacto', 1),
(6, 'Preguntas frecuentes', '<div data-section=\"faq\" data-value=\"asd\"> <ol> <li><strong>&iquest;Qu&eacute; es Oh My Pet! Petshop? </strong>Oh My Pet! es una empresa peruana dedicada a la venta de productos de mascotas dom&eacute;sticas.</li> <li><strong>&iquest;D&oacute;nde se encuentra ubicado Oh My Pet! Petshop?</strong> Oh My Pet! Petshop se encuentra en: Av. Petit. Thouars 385 / Av. Arequipa 265</li> <li><strong>&iquest;Por qu&eacute; comprar en Oh My Pet! Petshop?</strong>&nbsp; En Oh My Pet! encontrar&aacute;s los mejores productos a los mejores precios. Adem&aacute;s, siempre contamos con promociones y ofertas para nuestros clientes m&aacute;s frecuentes.</li> </ol> <p>&nbsp;</p> <p>Otras preguntas</p> <ul> <li><strong>&iquest;Qu&eacute; m&eacute;todos de pago aceptamos? </strong><span style=\"color: #666666; font-family: Arial, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">En Oh My Pet! aceptamos todas las tarjetas (VISA y Mastercard), efectivo, paypal, etc. </span></li> </ul> </div>', '', '2022-10-28 01:15:21', 'preguntas-frecuentes', 1),
(7, 'Terminos y condiciones', '<p><u data-section=\"terminos-condiciones\" data-value=\"titulo\">INFORMACI&Oacute;N DETALLADA DE T&Eacute;RMINOS Y CONDICIONES&lt;/u &gt; </u></p> <div> <div data-section=\"terminos-condiciones\" data-value=\"parte-1\">A continuaci&oacute;n se describen los t&eacute;rminos y condiciones de la Tienda Virtual!</div> </div> <p><u>&nbsp;</u></p> <div data-section=\"terminos-condiciones\" data-value=\"parte-2\"> <p>Gracias por visitar este sitio web. Por favor lea con cuidado los T&Eacute;RMINOS Y CONDICIONES del contenido en este documento ya que cualquier uso de este sitio web constituye su aceptaci&oacute;n t&aacute;cita y/o expresa a los mismos. En otras palabras, cada vez que se usa esta p&aacute;gina web se est&aacute;n aceptando &iacute;ntegramente los T&eacute;rminos y Condiciones que aqu&iacute; se exponen.</p> <ol> <li><strong>Creaci&oacute;n de Usuario</strong></li> </ol> </div> <div data-section=\"terminos-condiciones\" data-value=\"parte-3\"> <p>Para poder hacer compras de manera online es indispensable que la persona que en este caso denominaremos &ldquo;cliente&rdquo; debe tener creada una cuenta de usuario para poder acceder a esta misma.</p> <p>En caso el cliente no cuente con una cuenta de usuario, podr&aacute; crearse sin problema colocando un usuario (correo) y una contrase&ntilde;a. Y es que el cliente tiene problemas para la creaci&oacute;n de estos, tiene la posibilidad de acercarse de manera presencial a uno de los establecimientos de nuestras Tiendas m&aacute;s cercanas y solicitar ayuda a uno de nuestros colaboradores para la creaci&oacute;n de cuenta.</p> <p>Una vez registrado, le llegar&aacute; una notificaci&oacute;n a su correo con la confirmaci&oacute;n de la creaci&oacute;n de usuario y reenviando los datos que se ingres&oacute;.</p> <p>En caso de que el cliente olvide la contrase&ntilde;a, podr&aacute; dirigirse a Olvide la contrase&ntilde;a para ingresar su correo y se le envi&eacute; un enlace para la modificaci&oacute;n de esta misma.</p> </div> <p>&nbsp;</p> <div data-section=\"terminos-condiciones\" data-value=\"parte-4\"> <ul> <li><strong> </strong><strong>Compras Online</strong></li> </ul> </div> <p>Una vez registrada una cuenta en la Tienda Online &ldquo;Oh My Pet&rdquo;, el cliente podr&aacute; comprar sin problema los productos que ofrecemos.</p> <p>El cliente podr&aacute; seleccionar los productos y estos se ir&aacute;n a&ntilde;adiendo en el carrito de compras, el cual al querer pagar tendr&aacute; la opci&oacute;n de elegir si desea que los productos lleguen a casa por delivery (lo cual tendr&aacute; un costo extra) o desee recogerlo en tienda.</p> <p>El cliente podr&aacute; elegir el d&iacute;a que desee que llegue el delivery, posterior a ello, se estar&iacute;an comunicando los de programaci&oacute;n por WhatsApp para coordinar el rango de hora a llegar el motorizado.</p> <p>Los m&eacute;todos de pago pueden ser con tarjetas Visa, Mastercard, American Express y Paypal tanto d&oacute;lares como soles.</p> <p>Una vez cancelado el pago de manera online, le llegar&aacute; una constancia a su correo de la confirmaci&oacute;n del pago y los datos de la compra.&nbsp;</p> <p>En caso el cliente opte por recoger los productos en Tienda tendr&aacute; la opci&oacute;n de elegir el tipo de pago si es en tarjeta o efectivo y una vez que llegue al establecimiento los colaboradores ya tendr&aacute;n en cuenta el m&eacute;todo de pago.</p> <p>De la misma manera le llegar&aacute; una constancia con los datos de los productos y tipo de pago y orden de compra para que cuando se acerque a Tienda, los colaboradores puedan solicitar DNI y el n&uacute;mero de orden.</p> <p>&nbsp;</p> <div data-section=\"terminos-condiciones\" data-value=\"parte-5\"> <ul> <li><strong> </strong><strong>Cup&oacute;n</strong></li> </ul> </div> <p>Los cupones son publicados mensualmente en el inicio de la p&aacute;gina, con un stock para las primeras 100 personas que lo utilicen, el cual tiene vigencia los primeros 15 d&iacute;as de cada mes y/o hasta agotar stock.</p> <p>Para hacer uso del cup&oacute;n tendr&iacute;a que realizar compras mayores de S/ 200 o $69. Y este descuento se realiza sobre el total del pago.</p> <p>El valor del cup&oacute;n puede ser dado en porcentajes y estos pueden variar desde 10% hasta 50%.</p> <p>Los cupones se actualizan cada mes, podr&aacute; ser usado 1 vez por cada cuenta de usuario y solo v&aacute;lido para compras online.</p> <p>Los cupones son v&aacute;lidos para cualquier tipo de producto que se muestra en nuestra p&aacute;gina web.</p> <p>En su constancia de compra se ver&aacute; reflejado el descuento del cup&oacute;n o monto del cup&oacute;n.</p> <p>&nbsp;</p> <div data-section=\"terminos-condiciones\" data-value=\"parte-6\"> <ul> <li><strong> </strong><strong>Delivery</strong></li> </ul> </div> <p>Al seleccionar que desee que su pedido llegue a casa, estar&iacute;a seleccionando delivery el cual tiene un costo est&aacute;ndar S/ 50 o $12.99.</p> <p>El costo es v&aacute;lido hasta en 3 viajes en caso no pueda ser entregado el pedido en el d&iacute;a establecido o si el cliente desea reprogramar la fecha de env&iacute;o. En caso, no se logr&eacute; concretar en las 3 oportunidades la entrega del pedido, el cliente deber&aacute; recogerlo de manera presencial en una de nuestras tiendas m&aacute;s cercanas.</p> <p>Nuestro env&iacute;o de delivery solo aplica para Lima Metropolitana y Callao.</p> <p>&nbsp;</p> <div data-section=\"terminos-condiciones\" data-value=\"parte-7\"> <ul> <li><strong> </strong><strong>Devoluci&oacute;n</strong></li> </ul> <p>Se realizan devoluciones en caso el cliente lo requiera el cual deber&aacute; devolver el producto en buen estado si el motivo de devoluci&oacute;n es por equivocaci&oacute;n.</p> <p>El monto ser&aacute; devuelto al mismo m&eacute;todo de pago.</p> <p>El tiempo de devoluci&oacute;n para tarjetas Visa, Mastercard, American Express es de 30 d&iacute;as.</p> <p>El tiempo de devoluci&oacute;n para Paypal&nbsp;es de 60 d&iacute;as.</p> <p>En caso desea devoluci&oacute;n por mal estado de alg&uacute;n producto, deber&aacute; comunicarse al n&uacute;mero de nuestro WhatsApp, adjuntando videos y/o im&aacute;genes y la constancia de pago y posterior a ello se estar&iacute;an comunicando con el cliente para coordinar el recojo de los productos y devoluci&oacute;n del mismo valor.</p> </div> <div data-section=\"terminos-condiciones\" data-value=\"parte-8\"> <ul> <li><strong> </strong><strong>Reclamos/ Quejas</strong></li> </ul> <p>Los reclamos/quejas lo pueden realizar cualquier persona sin necesidad de tener un usuario</p> <p>creado.</p> <p>El cliente deber&aacute; complementar todos los cambios solicitados de manera detallada para</p> <p>poder responderles de la manera m&aacute;s r&aacute;pida por el medio que indica.</p> <p>El tiempo de respuesta de reclamo y/o Queja es de 30 d&iacute;as h&aacute;biles y la respuesta puede ser enviada por correo electr&oacute;nico o carta.</p> <p>&nbsp;</p> <p>En caso tenga alguna duda m&aacute;s o algo que no haya quedado claro, podr&iacute;a dejar su mensaje en el formulario de cont&aacute;ctenos o enviar un mensaje de WhatsApp o al correo corporativo y uno de nuestros colaboradores le responder&aacute;.</p> </div> <p>&nbsp;</p>', '', '2022-10-28 01:16:42', 'terminos-y-condiciones', 1),
(8, 'Not Found', '<h1 data-section=\"faq\" data-value=\"error\">Error 404: P&aacute;gina no encontrada</h1> <p data-section=\"faq\" data-value=\"encontrar\">No se encuentra la p&aacute;gina que ha solicitado.</p>', '', '2022-10-28 01:17:36', 'not-found', 1),
(9, 'Promocion', '<p>Contenido</p>', '', '2022-10-28 01:13:21', 'promocion', 1),
(10, 'Libroreclamaciones', '<p>Contenido</p>', '', '2022-11-14 01:53:21', 'libroreclamaciones', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idproducto` bigint(20) NOT NULL,
  `categoriaid` bigint(20) NOT NULL,
  `codigo` varchar(30) COLLATE utf8mb4_swedish_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `imagen` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp(),
  `ruta` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '1:ACTIVO, 2:INACTIVO, 3:PROMOCION'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idproducto`, `categoriaid`, `codigo`, `nombre`, `descripcion`, `precio`, `stock`, `imagen`, `datecreated`, `ruta`, `status`) VALUES
(4, 3, '65656565656', 'CANBO Cordero Cachorros Mediano y Grande', '<p>15 kg</p>', '20.00', 30, '', '2022-10-06 22:49:41', 'canbo-cordero-cachorros-mediano-y-grande', 1),
(5, 3, '45454545474', 'CANBO Cordero Adulto Mediano y Grande', '<p>SuperPremiun Cordero/Adulto</p> <p>SuperPremiun Cordero/Lamb</p> <p>Razas Medians y grande</p> <p>Medium and Large Breeds</p> <p>15KG</p>', '30.00', 32, '', '2022-10-06 22:53:07', 'canbo-cordero-adulto-mediano-y-grande', 1),
(6, 3, '23232323232', 'CANBO Cordero Cachorros Pequeños', '<p>Super Premiun Cordero/Adulto</p> <p>Super Premiun Cordero/Lamb</p> <p>Cachorro/puppy</p> <p>Razas Peque&ntilde;as/Small Breeds</p> <p>7 kg</p>', '30.00', 36, '', '2022-10-06 22:55:58', 'canbo-cordero-cachorros-pequenos', 1),
(7, 3, '32356454545', 'CANBO Codero Adulto Pequeño', '<p>SuperPremiun Cordero Adulto</p> <p>SuperPremiun Codero/Lamb</p> <p>Razas Peque&ntilde;as/Small Breeds</p> <p>7 Kg</p>', '60.00', 30, '', '2022-10-06 22:58:33', 'canbo-codero-adulto-pequeno', 1),
(8, 2, '12121212312', 'CANBO Comida Para Gatos Adultos', '<p>Urinary Health</p> <p>7 Kg</p>', '60.00', 30, '', '2022-10-06 23:00:37', 'canbo-comida-para-gatos-adultos', 1),
(9, 3, '63656565656', 'CANBO Galletas', '<p>CANBO Galletas para perros- cordero</p> <p>200 gr</p>', '23.00', 60, '', '2022-10-10 19:25:27', 'canbo-galletas', 1),
(10, 3, '31243423423', 'Pelota con luces para perro', '<p>Pelota con luces para perro</p>', '15.00', 30, '', '2022-10-10 19:26:42', 'pelota-con-luces-para-perro', 1),
(11, 3, '44556576776', 'Salchicha de plasticos', '<p>Juguete de plastico con forma de salchicha para perros</p>', '35.00', 65, '', '2022-10-10 19:27:34', 'salchicha-de-plasticos', 1),
(12, 3, '12345678911', 'PURINA ADULTOS MEDIANOS Y GRANDES 15KG', '<p>PURINA ADULTOS MEDIANOS Y GRANDES 15KG</p> <p>SALUD VISIBLE</p> <p>Comprobador Equilibra la Flora intestinal</p> <p>Salud Oral</p> <p>Musculos y Huesos Fuertes</p> <p>Promueve un PELAJE BRILLANTE</p>', '40.00', 40, '', '2022-11-14 22:46:53', 'purina-adultos-medianos-y-grandes-15kg', 1),
(13, 2, '65989898989', 'RICOCAT ADULTOS 15 KG', '<h2 class=\"product-short-description\">Ricocat Festival de Sabores es un alimento premium, 100% completo y balanceado. Especialmente formulado para gatos adultos de todas las razas</h2>', '155.00', 30, '', '2022-11-14 23:03:57', 'ricocat-adultos-15-kg', 1),
(14, 1, '12222222222', 'Brit Animals Rabbit Junior 1.5Kg', '<h1 class=\"title\"><strong>Brit Animals RABBIT JUNIOR Complete</strong></h1> <p class=\"hidden-xs\">Alimento Completo Super Premium para Conejos Peque&ntilde;os (4 a 20 semanas). Rico en vitaminas esenciales, con un contenido de prote&iacute;nas m&aacute;s alto para un crecimiento saludable. Con alfalfa y diente de le&oacute;n para gran sabor. Contiene cardo de leche (Silybum marianum) para favorecer una digesti&oacute;n y un metabolismo saludables. Alimento completo s&uacute;per premium extruido.</p>', '68.80', 60, '', '2022-11-14 23:11:45', 'brit-animals-rabbit-junior-15kg', 1),
(15, 1, '66665554444', 'Brit Animals Rabbit Senior 1.5 Kg', '<h1 class=\"title\"><strong>BRIT ANIMALS RABBIT SENIOR&nbsp;</strong></h1> <p>Alimento Completo S&uacute;per Premium para Conejos Adultos (+4 a&ntilde;os) Rico en vitaminas esenciales, bajo contenido graso y cal&oacute;rico para mantener un peso &oacute;ptimo. Con alfalfa y diente de le&oacute;n para gran sabor. Contiene cardo de leche (Silybum marianum) para favorecer una digesti&oacute;n y un metabolismo saludables. Alimento completo s&uacute;per premium extruido.</p>', '68.80', 36, '', '2022-11-14 23:13:11', 'brit-animals-rabbit-senior-15-kg', 1),
(16, 1, '55544441111', 'BEAPHAR CARE HAMSTER 250 GR', '<h1 id=\"evProductTitle\" class=\"h3-Style\">BEAPHAR CARE+ HAMSTER</h1> <p>Care+ H&aacute;mster es un alimento de alta calidad extremadamente sabroso y bien equilibrado. El pienso se desarroll&oacute; en colaboraci&oacute;n con veterinarios, bromat&oacute;logos y especialistas en h&aacute;mster.</p>', '34.00', 80, '', '2022-11-14 23:15:16', 'beaphar-care-hamster-250-gr', 1),
(17, 1, '33333333333', 'BEAPHAR XTRAVITAL CANARIO 500 GR', '<h1 id=\"evProductTitle\" class=\"h3-Style\">BEAPHAR XTRAVITAL CANARIO 500 GR</h1> <p>La mixtura XtraVital para Canarios es un alimento completo con una composici&oacute;n muy variada y sabrosa ya que aporta frutas, 26 variedades de semillas y un 20% de pasta de huevo para satisfacer todas las necesidades nutricionales.</p>', '40.00', 60, '', '2022-11-14 23:17:18', 'beaphar-xtravital-canario-500-gr', 1),
(18, 1, '10101010122', 'BEAPHAR XTRAVITAL PERIQUITO 500 GR', '<h1 id=\"evProductTitle\" class=\"h3-Style\">BEAPHAR XTRAVITAL PERIQUITO</h1> <p>La mixtura XtraVital para Periquitos es un alimento completo con una composici&oacute;n muy variada y sabrosa ya que aporta frutas, 26 variedades de semillas y un 19% de pasta de huevo para satisfacer todas las necesidades nutricionales.</p>', '40.00', 10, '', '2022-11-14 23:18:29', 'beaphar-xtravital-periquito-500-gr', 1),
(19, 2, '66554401554', 'Hills Sd Feline Indoor Adult7 1.6 Kg', '<div class=\"productAwareRichText richText component section default-style first odd col-xs-12 initialized\"> <div class=\"component-content\"> <div class=\"richText-content\"> <p>El alimento seco para gatos&nbsp;<span class=\"nowrap\">Hill&rsquo;s&trade; Science Diet&trade;</span>&nbsp;Indoor Adult 7+ est&aacute; especialmente formulado para abastecer las necesidades de energ&iacute;a para gatos con un estilo de vida de interiores a medida que envejecen dignamente.</p> <ul> <li>La fibra natural favorece la salud digestiva y los ingredientes de alta calidad hacen m&aacute;s f&aacute;cil la limpieza de la caja de arena</li> <li>Prote&iacute;na de alta calidad para m&uacute;sculos magros</li> <li>Ingredientes naturales de alta calidad, f&aacute;ciles de digerir para una comida nutritiva y llena de sabor</li> </ul> </div> </div> </div> <div class=\"conditionalBox box component section default-style even col-xs-12\"> <div id=\"1566975598\" class=\"component-content\"> <div class=\"paragraphSystem content\"> <div class=\"productAwareRichText richText component section col-xs-12 productawarerichtext default-style initialized\"> <div class=\"component-content\"> <div class=\"richText-content\"> <h4>Se recomienda para:</h4> <p>Gatos Adultos de 7+ a&ntilde;os con un estilo de vida de interiores.</p> </div> </div> </div> </div> </div> </div> <div class=\"conditionalBox box component section default-style odd col-xs-12\"> <div id=\"374782943\" class=\"component-content\"> <div class=\"paragraphSystem content\"> <div class=\"productAwareRichText richText component section default-style first odd last col-xs-12 initialized\"> <div class=\"component-content\"> <div class=\"richText-content\"> <h4>No se recomienda para:</h4> <p>Gatitos y gatas gestantes o lactantes. Durante la gestaci&oacute;n o lactancia, las gatas deben cambiar al alimento seco para gatos Hill&rsquo;s&reg;&nbsp;<span class=\"nowrap\">Science Diet&reg;</span>&nbsp;Kitten o&nbsp;<span class=\"nowrap\">Hill&rsquo;s&reg; Science Diet&reg;</span>&nbsp;Kitten Indoor.</p> </div> </div> </div> </div> </div> </div>', '78.00', 30, '', '2022-11-14 23:20:45', 'hills-sd-feline-indoor-adult7-16-kg', 1),
(20, 2, '10514444555', 'Hills Sd Feline Adult Multiple Benefit 3.2 Kg', '<ul> <li>La L-carnitina ayuda a transformar la grasa en energ&iacute;a y la prote&iacute;na de alta calidad ayuda a mantener los m&uacute;sculos magros</li> <li>Fibra natural que reduce c&oacute;modamente las bolas de pelo</li> <li>Ingredientes de alta calidad que facilitan la limpieza de la caja de arena y fibra natural que promueve la salud digestiva</li> <li>Se recomienda para Gatos adultos de 1-6 a&ntilde;os que comparten su hogar</li> </ul>', '175.00', 65, '', '2022-11-14 23:21:51', 'hills-sd-feline-adult-multiple-benefit-32-kg', 1),
(21, 2, '203050101010', 'Brit Care Cat Grain-Free Sterilized 2 Kg', '<p><strong>BRIT CARE CAT GRAIN-FREE STERILIZED SENSITIVE</strong></p> <p><strong>Alimento completo para gatos adultos y esterilizados con digesti&oacute;n sensible.</strong></p> <p>F&oacute;rmula hipoalerg&eacute;nica no m&oacute;vil para la salud de los ri&ntilde;ones y el tracto urinario, contiene frutas y hierbas, ricas en antioxidantes naturales y vitamina E, que protegen al organismo de los radicales libres y mantienen fuerte el sistema inmunol&oacute;gico durante toda la vida de tu gato. La carne diet&eacute;tica, de conejo fresco, favorece la salud del coraz&oacute;n y el sistema circulatorio y ayuda a mantener una condici&oacute;n f&iacute;sica &oacute;ptima.</p> <ul> <li>CONEJO FRESCO &ndash; carne diet&eacute;tica con excelente digestibilidad y bajo contenido en colesterol.</li> <li>ESPINO CERVAL Y CAPUCHINA contribuye a la salud de los ri&ntilde;ones y el tracto urinario. El bajo contenido de magnesio y L-metionina ayuda a mantener un pH urinario &oacute;ptimo de 6,0 a 6,5.</li> <li>Los PROBI&Oacute;TICOS Y LOS PREBI&Oacute;TICOS ayudan a mantener los intestinos y un sistema inmunol&oacute;gico normales y saludables.</li> <li>SIN cereales &ndash; SIN colorantes &ndash; SIN conservantes &ndash; SIN OMG &ndash; SIN soja</li> </ul>', '85.00', 10, '', '2022-11-14 23:24:15', 'brit-care-cat-grain-free-sterilized-2-kg', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promocion`
--

CREATE TABLE `promocion` (
  `id_promocion` bigint(20) NOT NULL,
  `id_producto` bigint(20) NOT NULL,
  `porcentaje_dscto` decimal(3,1) DEFAULT NULL,
  `precio_promocion` decimal(11,2) NOT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `id_persona` bigint(20) NOT NULL,
  `fecha_reg` datetime NOT NULL DEFAULT current_timestamp(),
  `id_persona_mod` bigint(20) DEFAULT NULL,
  `fecha_mod` datetime DEFAULT NULL,
  `estado` char(1) COLLATE utf8mb4_swedish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `promocion`
--

INSERT INTO `promocion` (`id_promocion`, `id_producto`, `porcentaje_dscto`, `precio_promocion`, `fecha_inicio`, `fecha_fin`, `id_persona`, `fecha_reg`, `id_persona_mod`, `fecha_mod`, `estado`) VALUES
(1, 21, '50.0', '42.50', '2022-11-10 00:00:00', '2022-11-30 00:00:00', 1, '2022-11-21 03:41:18', 1, '2022-11-21 03:46:39', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reembolso`
--

CREATE TABLE `reembolso` (
  `id` bigint(20) NOT NULL,
  `pedidoid` bigint(20) NOT NULL,
  `idtransaccion` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `datosreembolso` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `observacion` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` varchar(150) COLLATE utf8mb4_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `reembolso`
--

INSERT INTO `reembolso` (`id`, `pedidoid`, `idtransaccion`, `datosreembolso`, `observacion`, `status`) VALUES
(1, 2, '2G301610HF6906004', '{\"id\":\"0FW7817733040044W\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"payment_source\":{\"paypal\":{\"email_address\":\"sb-yofmr21494532@personal.example.com\",\"account_id\":\"B9M4NVYJ3PMUY\",\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"address\":{\"country_code\":\"PE\"}}},\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"65.00\"},\"payee\":{\"email_address\":\"sb-lmuua21551784@business.example.com\",\"merchant_id\":\"ZDEDWCG3M4NXC\"},\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Lima\",\"admin_area_1\":\"Lima\",\"postal_code\":\"07001\",\"country_code\":\"PE\"}},\"payments\":{\"captures\":[{\"id\":\"752052324J031942B\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"65.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"seller_receivable_breakdown\":{\"gross_amount\":{\"currency_code\":\"USD\",\"value\":\"65.00\"},\"paypal_fee\":{\"currency_code\":\"USD\",\"value\":\"3.81\"},\"net_amount\":{\"currency_code\":\"USD\",\"value\":\"61.19\"}},\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/752052324J031942B\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/752052324J031942B\\/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/0FW7817733040044W\",\"rel\":\"up\",\"method\":\"GET\"}],\"create_time\":\"2022-10-26T04:19:16Z\",\"update_time\":\"2022-10-26T04:19:16Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"email_address\":\"sb-yofmr21494532@personal.example.com\",\"payer_id\":\"B9M4NVYJ3PMUY\",\"address\":{\"country_code\":\"PE\"}},\"create_time\":\"2022-10-26T04:19:09Z\",\"update_time\":\"2022-10-26T04:19:16Z\",\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/0FW7817733040044W\",\"rel\":\"self\",\"method\":\"GET\"}]}', 'fsswdfdsfs', 'COMPLETED'),
(2, 4, '7P637950MX545540C', '{\"id\":\"67H86399K7911713E\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"payment_source\":{\"paypal\":{\"email_address\":\"sb-yofmr21494532@personal.example.com\",\"account_id\":\"B9M4NVYJ3PMUY\",\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"address\":{\"country_code\":\"PE\"}}},\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"85.00\"},\"payee\":{\"email_address\":\"sb-lmuua21551784@business.example.com\",\"merchant_id\":\"ZDEDWCG3M4NXC\"},\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Lima\",\"admin_area_1\":\"Lima\",\"postal_code\":\"07001\",\"country_code\":\"PE\"}},\"payments\":{\"captures\":[{\"id\":\"4GJ29750YX1746930\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"85.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"seller_receivable_breakdown\":{\"gross_amount\":{\"currency_code\":\"USD\",\"value\":\"85.00\"},\"paypal_fee\":{\"currency_code\":\"USD\",\"value\":\"4.89\"},\"net_amount\":{\"currency_code\":\"USD\",\"value\":\"80.11\"}},\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/4GJ29750YX1746930\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/4GJ29750YX1746930\\/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/67H86399K7911713E\",\"rel\":\"up\",\"method\":\"GET\"}],\"create_time\":\"2022-10-29T03:51:49Z\",\"update_time\":\"2022-10-29T03:51:49Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"email_address\":\"sb-yofmr21494532@personal.example.com\",\"payer_id\":\"B9M4NVYJ3PMUY\",\"address\":{\"country_code\":\"PE\"}},\"create_time\":\"2022-10-29T03:51:25Z\",\"update_time\":\"2022-10-29T03:51:49Z\",\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/67H86399K7911713E\",\"rel\":\"self\",\"method\":\"GET\"}]}', 'prueba', 'COMPLETED'),
(3, 1, '4MP79863KX349111A', '{\"id\":\"2AC26857LD1317626\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"payment_source\":{\"paypal\":{\"email_address\":\"sb-yofmr21494532@personal.example.com\",\"account_id\":\"B9M4NVYJ3PMUY\",\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"phone_number\":{\"national_number\":\"5190234297\"},\"address\":{\"country_code\":\"PE\"}}},\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"155.00\",\"breakdown\":{\"item_total\":{\"currency_code\":\"USD\",\"value\":\"155.00\"},\"shipping\":{\"currency_code\":\"USD\",\"value\":\"0.00\"},\"handling\":{\"currency_code\":\"USD\",\"value\":\"0.00\"},\"insurance\":{\"currency_code\":\"USD\",\"value\":\"0.00\"},\"shipping_discount\":{\"currency_code\":\"USD\",\"value\":\"0.00\"},\"discount\":{\"currency_code\":\"USD\",\"value\":\"0.00\"}}},\"payee\":{\"email_address\":\"sb-lmuua21551784@business.example.com\",\"merchant_id\":\"ZDEDWCG3M4NXC\"},\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Lima\",\"admin_area_1\":\"Lima\",\"postal_code\":\"07001\",\"country_code\":\"PE\"}},\"payments\":{\"captures\":[{\"id\":\"36981674D71696318\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"155.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"seller_receivable_breakdown\":{\"gross_amount\":{\"currency_code\":\"USD\",\"value\":\"155.00\"},\"paypal_fee\":{\"currency_code\":\"USD\",\"value\":\"8.67\"},\"net_amount\":{\"currency_code\":\"USD\",\"value\":\"146.33\"}},\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/36981674D71696318\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/36981674D71696318\\/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/2AC26857LD1317626\",\"rel\":\"up\",\"method\":\"GET\"}],\"create_time\":\"2022-10-26T04:15:09Z\",\"update_time\":\"2022-10-26T04:15:09Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"email_address\":\"sb-yofmr21494532@personal.example.com\",\"payer_id\":\"B9M4NVYJ3PMUY\",\"phone\":{\"phone_number\":{\"national_number\":\"5190234297\"}},\"address\":{\"country_code\":\"PE\"}},\"update_time\":\"2022-10-26T04:15:09Z\",\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/2AC26857LD1317626\",\"rel\":\"self\",\"method\":\"GET\"}]}', 'rembolso ejmplo', 'COMPLETED'),
(4, 11, '7WA33859PM910382C', '{\"id\":\"9TY27712HS677161L\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"payment_source\":{\"paypal\":{\"email_address\":\"sb-yofmr21494532@personal.example.com\",\"account_id\":\"B9M4NVYJ3PMUY\",\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"address\":{\"country_code\":\"PE\"}}},\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"21.79\"},\"payee\":{\"email_address\":\"sb-lmuua21551784@business.example.com\",\"merchant_id\":\"ZDEDWCG3M4NXC\"},\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Lima\",\"admin_area_1\":\"Lima\",\"postal_code\":\"07001\",\"country_code\":\"PE\"}},\"payments\":{\"captures\":[{\"id\":\"9B222996GM103173F\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"21.79\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"seller_receivable_breakdown\":{\"gross_amount\":{\"currency_code\":\"USD\",\"value\":\"21.79\"},\"paypal_fee\":{\"currency_code\":\"USD\",\"value\":\"1.48\"},\"net_amount\":{\"currency_code\":\"USD\",\"value\":\"20.31\"}},\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/9B222996GM103173F\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/9B222996GM103173F\\/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/9TY27712HS677161L\",\"rel\":\"up\",\"method\":\"GET\"}],\"create_time\":\"2022-11-08T04:22:55Z\",\"update_time\":\"2022-11-08T04:22:55Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"email_address\":\"sb-yofmr21494532@personal.example.com\",\"payer_id\":\"B9M4NVYJ3PMUY\",\"address\":{\"country_code\":\"PE\"}},\"create_time\":\"2022-11-08T04:22:00Z\",\"update_time\":\"2022-11-08T04:22:55Z\",\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/9TY27712HS677161L\",\"rel\":\"self\",\"method\":\"GET\"}]}', 'me webie', 'COMPLETED');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idrol` bigint(20) NOT NULL,
  `nombrerol` varchar(50) COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idrol`, `nombrerol`, `descripcion`, `status`) VALUES
(1, 'Administrador', 'Acceso a todo el sistema', 1),
(2, 'Supervisores', 'Supervisor de tienda', 1),
(3, 'Vendedores', 'Acceso a módulo ventas', 1),
(4, 'Servicio al cliente', 'Servicio al cliente sistema', 1),
(5, 'Bodega', 'Bodega', 0),
(6, 'Resporteria', 'Resporteria Sistema', 0),
(7, 'Cliente', 'Clientes tienda', 1),
(8, 'Ejemplo rol', 'Ejemplo rol sistema', 0),
(9, 'Coordinador', 'Coordinador', 1),
(10, 'Consulta Ventas', 'Consulta Ventas', 1),
(11, 'ROl de ejemplo', 'ROl de ejemplo', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopago`
--

CREATE TABLE `tipopago` (
  `idtipopago` bigint(20) NOT NULL,
  `tipopago` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `tipopago`
--

INSERT INTO `tipopago` (`idtipopago`, `tipopago`, `status`) VALUES
(1, 'Paypal', 1),
(2, 'Tarjeta', 1),
(5, 'Efectivo', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Indices de la tabla `contacto`
--
ALTER TABLE `contacto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cupon`
--
ALTER TABLE `cupon`
  ADD PRIMARY KEY (`id_cupon`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedidoid` (`pedidoid`),
  ADD KEY `productoid` (`productoid`);

--
-- Indices de la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productoid` (`productoid`),
  ADD KEY `personaid` (`personaid`);

--
-- Indices de la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productoid` (`productoid`);

--
-- Indices de la tabla `libroreclamaciones`
--
ALTER TABLE `libroreclamaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD PRIMARY KEY (`idmodulo`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idpedido`),
  ADD KEY `personaid` (`personaid`),
  ADD KEY `tipopagoid` (`tipopagoid`),
  ADD KEY `id_cupon` (`id_cupon`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`idpermiso`),
  ADD KEY `rolid` (`rolid`),
  ADD KEY `moduloid` (`moduloid`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idpersona`),
  ADD KEY `rolid` (`rolid`);

--
-- Indices de la tabla `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`idpost`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idproducto`),
  ADD KEY `categoriaid` (`categoriaid`);

--
-- Indices de la tabla `promocion`
--
ALTER TABLE `promocion`
  ADD PRIMARY KEY (`id_promocion`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `reembolso`
--
ALTER TABLE `reembolso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedidoid` (`pedidoid`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idrol`);

--
-- Indices de la tabla `tipopago`
--
ALTER TABLE `tipopago`
  ADD PRIMARY KEY (`idtipopago`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `contacto`
--
ALTER TABLE `contacto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cupon`
--
ALTER TABLE `cupon`
  MODIFY `id_cupon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT de la tabla `imagen`
--
ALTER TABLE `imagen`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT de la tabla `libroreclamaciones`
--
ALTER TABLE `libroreclamaciones`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `modulo`
--
ALTER TABLE `modulo`
  MODIFY `idmodulo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idpedido` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `idpermiso` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=640;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idpersona` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `post`
--
ALTER TABLE `post`
  MODIFY `idpost` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idproducto` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `promocion`
--
ALTER TABLE `promocion`
  MODIFY `id_promocion` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `reembolso`
--
ALTER TABLE `reembolso`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idrol` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `tipopago`
--
ALTER TABLE `tipopago`
  MODIFY `idtipopago` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`pedidoid`) REFERENCES `pedido` (`idpedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`productoid`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  ADD CONSTRAINT `detalle_temp_ibfk_1` FOREIGN KEY (`productoid`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD CONSTRAINT `imagen_ibfk_1` FOREIGN KEY (`productoid`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`personaid`) REFERENCES `persona` (`idpersona`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`tipopagoid`) REFERENCES `tipopago` (`idtipopago`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`id_cupon`) REFERENCES `cupon` (`id_cupon`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`rolid`) REFERENCES `rol` (`idrol`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permisos_ibfk_2` FOREIGN KEY (`moduloid`) REFERENCES `modulo` (`idmodulo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `promocion`
--
ALTER TABLE `promocion`
  ADD CONSTRAINT `promocion_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
