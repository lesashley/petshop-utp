-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-10-2022 a las 04:53:53
-- Versión del servidor: 10.4.10-MariaDB
-- Versión de PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
(1, 1, 11, '35.00', 4),
(2, 2, 10, '15.00', 1),
(3, 3, 1, '100.00', 1),
(4, 4, 10, '15.00', 1),
(5, 5, 10, '15.00', 1),
(6, 6, 1, '100.00', 7),
(7, 7, 10, '15.00', 2),
(8, 8, 11, '35.00', 1),
(9, 9, 1, '100.00', 1),
(10, 10, 1, '100.00', 1),
(11, 11, 8, '60.00', 1),
(20, 20, 9, '23.00', 1),
(21, 21, 10, '15.00', 1);

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
(13, 19, 2, '200.00', 2, 'ujklfmmjpgnohppscotou872ra'),
(15, 20, 1, '100.00', 1, 'ujklfmmjpgnohppscotou872ra'),
(16, 21, 10, '15.00', 1, 'ujklfmmjpgnohppscotou872ra'),
(17, 1, 10, '15.00', 2, 'ujklfmmjpgnohppscotou872ra'),
(22, 1, 8, '60.00', 6, 'l5emk1fndmne2vjr17frcqokqv'),
(23, 24, 10, '15.00', 1, 'l5emk1fndmne2vjr17frcqokqv'),
(24, 25, 10, '15.00', 8, 'l5emk1fndmne2vjr17frcqokqv'),
(26, 1, 8, '60.00', 5, 'ki0b2l4jlq6hr1apeh17959s2i'),
(28, 1, 11, '35.00', 4, 'ffghvjui07i98ijvgp9dhf0kb6'),
(29, 1, 10, '15.00', 1, 'u40adkk7o7nj4ak0t1tvd47sd7'),
(30, 1, 1, '100.00', 1, '5ip2a7iq87diaodgpmjg0o8qk0'),
(31, 1, 10, '15.00', 1, 'n66db3i7nvdsbb6r4vspd5mc6i'),
(32, 1, 10, '15.00', 1, 'pu7afu7chfbquvrmphnjlj8ev2'),
(33, 1, 1, '100.00', 7, 'u65c25ehpaah8kntv4n5eq7u1l'),
(34, 1, 10, '15.00', 2, 'stpd4n28bv83jai227r1grb4ec'),
(35, 1, 11, '35.00', 1, '8sdlelqos3la4j27nhajo69u6s'),
(36, 1, 1, '100.00', 1, 'k6eimn2985vpnftd1u1kqttm5k'),
(37, 1, 1, '100.00', 1, '38a4in8cngmvhe0ddi65pg28i0'),
(38, 1, 8, '60.00', 1, '13hgso5dndt542cmoljhuk4kul'),
(49, 27, 1, '100.00', 1, '9r3dc6nd3v6livep6ogt1i6l6u'),
(50, 1, 9, '23.00', 1, '7me4i7gla77opr6n9u091bf1et'),
(51, 1, 10, '15.00', 1, 'qfnbout3g55bnc6ck9d65ihuis'),
(54, 1, 31, '30.00', 1, 'khv4lng41gtnp8cukngg1kibiq'),
(55, 1, 30, '60.00', 2, 'ml9ugsrle316tn2j6hoplrengq'),
(56, 1, 32, '60.00', 2, 'ml9ugsrle316tn2j6hoplrengq'),
(57, 1, 19, '30.00', 1, 'iv8cmfoc9q5374no23ehgmljrn');

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
(5, 3, 'pro_d51bbbe6535ab278c528cd348082ebbc.jpg'),
(6, 2, 'pro_4aec3ea401df121ceec8f808706872bf.jpg'),
(7, 1, 'pro_90cef5b08960f262d119ce7552e3ba0d.jpg'),
(8, 3, 'pro_f760fd05949e064cdcfe5179efc35b0b.jpg'),
(9, 3, 'pro_d5d3996ed69da5ac8e7fd28bb9a33c23.jpg'),
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
(53, 14, 'pro_b10205eea01d3a49b528fb1ddbb627b1.jpg'),
(54, 15, 'pro_768047af7f752b6ccc38f6690f55f5a6.jpg'),
(55, 16, 'pro_55091ef81b2d1c586e3a7784b5316e25.jpg'),
(56, 17, 'pro_102d2d540a78663c90204f80770b3e33.jpg'),
(63, 22, 'pro_7fe4fb2768896a06b21f86f165d14a0c.jpg'),
(64, 22, 'pro_742f9fc4cd93c389fda5686f0ab4191e.jpg'),
(66, 24, 'pro_48fa212d68d1610e9b49ddd31eb7b917.jpg'),
(70, 26, 'pro_d94efe1766c79e0e3e49f9610ce62869.jpg'),
(71, 26, 'pro_bd62068bccd2a84f2930fc68de804ae0.jpg'),
(72, 27, 'pro_b10205eea01d3a49b528fb1ddbb627b1.jpg'),
(73, 27, 'pro_03ac37918d6ff9a83504327294160f24.jpg'),
(74, 27, 'pro_2928cc7595d73f255a6d0ed3f7118f0e.jpg'),
(75, 27, 'pro_cce049bf699d6ccaa2a41605843a4e4f.jpg'),
(77, 27, 'pro_bd62068bccd2a84f2930fc68de804ae0.jpg'),
(78, 27, 'pro_c889fa071c96c2cbb07f4ae9f495e86d.jpg'),
(86, 25, 'pro_55091ef81b2d1c586e3a7784b5316e25.jpg'),
(87, 25, 'pro_9046beafb10427db93f375042a969398.jpg'),
(89, 27, 'pro_d96a4ee63230e692e25a6cbd7c94b05d.jpg'),
(103, 29, 'pro_1f87770b8cf24cdc252f6632878dfd3f.jpg'),
(104, 29, 'pro_ca908c87941e47015a037811c9be791f.jpg'),
(105, 12, 'pro_13938745188ad83906bba1d6f5d6b5f3.jpg'),
(106, 13, 'pro_f99f8354cf1afe846429b1f8f7000894.jpg'),
(107, 18, 'pro_c52d9124f9fb3674f09f803bd7f82aa1.jpg'),
(108, 21, 'pro_ea27a73f5f6136259f834d774521e035.jpg'),
(109, 21, 'pro_7be283dd7b4b9d2ff5159ca1148c6545.jpg'),
(110, 28, 'pro_d634837979d95583f715143bc1a57208.jpg'),
(111, 30, 'pro_fc26c54139f71830f763635530ef7c3c.jpg'),
(112, 23, 'pro_8dee4bd199449778aeef603acf900029.jpg'),
(113, 31, 'pro_8dee4bd199449778aeef603acf900029.jpg'),
(114, 32, 'pro_ab3e33b03540eed0f3cacbcef6904840.jpg'),
(115, 20, 'pro_f29801bb05d3eec19263dadf752d544a.jpg'),
(116, 20, 'pro_1cfd11579774f6bc4ab1b31e37b66f89.jpg'),
(117, 19, 'pro_26534fbedaf50e2e31e54bfb5859587c.jpg');

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
(7, 'Suscriptores', 'Suscriptores del sitio web', 1),
(8, 'Contactos', 'Mensajes del formulario contacto', 1),
(11, 'Paginas', 'Páginas del sitio web', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `idpedido` bigint(20) NOT NULL,
  `referenciacobro` varchar(255) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `idtransaccionpaypal` varchar(255) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `datospaypal` text COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `personaid` bigint(20) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `costoenvio` decimal(10,2) NOT NULL DEFAULT 0.00,
  `monto` decimal(11,2) NOT NULL,
  `tipopagoid` bigint(20) NOT NULL,
  `direccionenvio` text COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`idpedido`, `referenciacobro`, `idtransaccionpaypal`, `datospaypal`, `personaid`, `fecha`, `costoenvio`, `monto`, `tipopagoid`, `direccionenvio`, `status`) VALUES
(1, NULL, '', NULL, 1, '2022-10-16 23:26:29', '50.00', '190.00', 5, 'Lima, Lima metropolitana', 0),
(2, NULL, '', NULL, 1, '2022-10-16 23:28:03', '50.00', '65.00', 5, 'Lima, Lima', 0),
(3, NULL, '', NULL, 1, '2022-10-16 23:32:05', '50.00', '150.00', 5, 'Lima, Lima metropolitana', 0),
(4, NULL, '', NULL, 1, '2022-10-16 23:35:39', '50.00', '65.00', 5, 'Lima, Lima', 0),
(5, NULL, '', NULL, 1, '2022-10-16 23:36:40', '50.00', '65.00', 2, 'Lima, Lima', 0),
(6, NULL, '29B27643TX3004141', '{\"id\":\"46K76778K3504054W\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"750.00\"},\"payee\":{\"email_address\":\"sb-lmuua21551784@business.example.com\",\"merchant_id\":\"ZDEDWCG3M4NXC\"},\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Lima\",\"admin_area_1\":\"Lima\",\"postal_code\":\"07001\",\"country_code\":\"PE\"}},\"payments\":{\"captures\":[{\"id\":\"29B27643TX3004141\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"750.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"create_time\":\"2022-10-17T04:43:14Z\",\"update_time\":\"2022-10-17T04:43:14Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"email_address\":\"sb-yofmr21494532@personal.example.com\",\"payer_id\":\"B9M4NVYJ3PMUY\",\"address\":{\"country_code\":\"PE\"}},\"create_time\":\"2022-10-17T04:42:41Z\",\"update_time\":\"2022-10-17T04:43:14Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/46K76778K3504054W\",\"rel\":\"self\",\"method\":\"GET\"}]}', 1, '2022-10-16 23:43:15', '50.00', '750.00', 1, 'Lima, Lima', 0),
(7, NULL, '', NULL, 1, '2022-10-17 12:56:14', '50.00', '80.00', 5, 'Lima, Lima', 0),
(8, NULL, '', NULL, 1, '2022-10-17 15:12:20', '50.00', '85.00', 5, 'Lima, Lima', 0),
(9, NULL, '', NULL, 1, '2022-10-17 15:15:33', '50.00', '150.00', 6, 'Lima, Lima', 0),
(10, NULL, '', NULL, 1, '2022-10-17 15:17:08', '50.00', '150.00', 6, 'Lima, Lima', 0),
(11, NULL, '', NULL, 1, '2022-10-17 15:20:23', '50.00', '110.00', 6, 'Lima, Lima', 0),
(20, NULL, '', NULL, 1, '2022-10-17 19:07:26', '0.00', '23.00', 2, 'Lima, Lima', 0),
(21, NULL, '', NULL, 1, '2022-10-17 19:08:35', '0.00', '15.00', 2, 'Lima, Lima', 0);

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
(517, 1, 1, 1, 1, 1, 1),
(518, 1, 2, 1, 1, 1, 1),
(519, 1, 3, 1, 1, 1, 1),
(520, 1, 4, 1, 1, 1, 1),
(521, 1, 5, 1, 1, 1, 1),
(522, 1, 6, 1, 1, 1, 1),
(523, 1, 7, 1, 1, 1, 1),
(524, 1, 8, 1, 1, 1, 1),
(525, 1, 11, 1, 1, 1, 1);

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
(29, '71657459', 'NombreClienteUno', 'APellidoClienteUno', 902216601, 'emailclienteuno@gmail.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', '12345678910111', 'Empresa Cliente Uno', 'DIreccion Empresa cliente uno', '', 7, '2022-10-17 19:15:58', 1);

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
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idproducto`, `categoriaid`, `codigo`, `nombre`, `descripcion`, `precio`, `stock`, `imagen`, `datecreated`, `ruta`, `status`) VALUES
(1, 1, '45645645645645', 'Producto Varios 1', '<p>Descripcion producto</p>', '100.00', 0, '', '2022-10-03 13:40:28', 'producto-varios-1', 1),
(2, 3, '45213565', 'Producto Perro 1', '<p>Producto 1</p> <ul> <li>1</li> <li>2</li> <li>3</li> </ul>', '100.00', 30, '', '2022-10-03 15:00:11', 'producto-perro-1', 1),
(3, 2, '454545659878', 'ProductoGato1', '<p>PRoducto 2</p> <ul> <li>1</li> <li>2</li> <li>3</li> </ul>', '300.00', 32, '', '2022-10-03 15:04:46', 'productogato1', 1),
(4, 3, '65656565656', 'CANBO Cordero Cachorros Mediano y Grande', '<p>15 kg</p>', '20.00', 30, '', '2022-10-06 22:49:41', 'canbo-cordero-cachorros-mediano-y-grande', 1),
(5, 3, '45454545474', 'CANBO Cordero Adulto Mediano y Grande', '<p>SuperPremiun Cordero/Adulto</p> <p>SuperPremiun Cordero/Lamb</p> <p>Razas Medians y grande</p> <p>Medium and Large Breeds</p> <p>15KG</p>', '30.00', 32, '', '2022-10-06 22:53:07', 'canbo-cordero-adulto-mediano-y-grande', 1),
(6, 3, '23232323232', 'CANBO Cordero Cachorros Pequeños', '<p>Super Premiun Cordero/Adulto</p> <p>Super Premiun Cordero/Lamb</p> <p>Cachorro/puppy</p> <p>Razas Peque&ntilde;as/Small Breeds</p> <p>7 kg</p>', '30.00', 36, '', '2022-10-06 22:55:58', 'canbo-cordero-cachorros-pequenos', 1),
(7, 3, '32356454545', 'CANBO Codero Adulto Pequeño', '<p>SuperPremiun Cordero Adulto</p> <p>SuperPremiun Codero/Lamb</p> <p>Razas Peque&ntilde;as/Small Breeds</p> <p>7 Kg</p>', '60.00', 30, '', '2022-10-06 22:58:33', 'canbo-codero-adulto-pequeno', 1),
(8, 2, '12121212312', 'CANBO Comida Para Gatos Adultos', '<p>Urinary Health</p> <p>7 Kg</p>', '60.00', 30, '', '2022-10-06 23:00:37', 'canbo-comida-para-gatos-adultos', 1),
(9, 3, '63656565656', 'CANBO Galletas', '<p>CANBO Galletas para perros- cordero</p> <p>200 gr</p>', '23.00', 60, '', '2022-10-10 19:25:27', 'canbo-galletas', 1),
(10, 3, '31243423423', 'Pelota con luces para perro', '<p>Pelota con luces para perro</p>', '15.00', 30, '', '2022-10-10 19:26:42', 'pelota-con-luces-para-perro', 1),
(11, 3, '44556576776', 'Salchicha de plastico', '<p>Juguete de plastico con forma de salchicha para perros</p>', '35.00', 65, '', '2022-10-10 19:27:34', 'salchicha-de-plastico', 1),
(12, 3, '99999999999', 'HARTZ Juguete Hueso con Olor a Tocino', '<p>Juguete Hueso con Olor a Tocino</p>', '55.00', 60, '', '2022-10-17 19:17:54', 'hartz-juguete-hueso-con-olor-a-tocino', 1),
(13, 1, '45465877798', 'Collar con Placa', '<p>Collar con Placa para Perros</p>', '32.00', 80, '', '2022-10-17 19:19:36', 'collar-con-placa', 1),
(14, 3, '36524154874', 'Cama para Perros Talla S', '<p>Cama para Perros Talla S&nbsp;</p> <p>Color Turqueza</p>', '65.00', 90, '', '2022-10-17 19:20:49', 'cama-para-perros-talla-s', 1),
(15, 1, '41254874444', 'Cama para Perros Talla S', '<p>Cama para Perros Talla S</p> <p>Color Amarillo</p>', '65.00', 10, '', '2022-10-17 19:21:28', 'cama-para-perros-talla-s', 1),
(16, 1, '78441545774', 'Cama para Perros Talla M', '<p>Cama para Perros Talla M</p> <p>Estilo Comando</p>', '70.00', 40, '', '2022-10-17 19:22:13', 'cama-para-perros-talla-m', 1),
(17, 2, '47411445454', 'Plato de Comida', '<p>Platos de comida Elevados Talla M</p> <p>Color Marron</p>', '30.00', 30, '', '2022-10-17 19:23:24', 'plato-de-comida', 1),
(18, 3, '12115441005', 'Plato de comida', '<p>Platos de comida Elevados Talla L</p> <p>Color Marron</p>', '30.00', 50, '', '2022-10-17 19:24:02', 'plato-de-comida', 1),
(19, 1, '41212002151', 'PEDIGREE Adulto Razas Pequeñas 10 KG', '<p>PEDIGREE Adulo Razas Peque&ntilde;as</p> <p>10 Kg</p>', '30.00', 60, '', '2022-10-17 19:26:25', 'pedigree-adulto-razas-pequenas-10-kg', 1),
(20, 1, '76473674637', 'PEDIGREE Cachorro Razas Medianas y Grandes 4 KG', '<p>PEDIGREE Cachorro Razas Medianas y Grandes</p> <p>4 Kg</p> <p>&nbsp;</p>', '40.00', 40, '', '2022-10-17 19:27:57', 'pedigree-cachorro-razas-medianas-y-grandes-4-kg', 1),
(21, 1, '98292912322', 'PEDIGREE Adulto Razas Pequeñas 2 KG', '<ul> <li>PEDIGREE Adulo Razas Peque&ntilde;as</li> <li>2 KG</li> </ul>', '30.00', 30, '', '2022-10-17 19:29:04', 'pedigree-adulto-razas-pequenas-2-kg', 1),
(22, 1, '56767676767', 'PEDIGREE Adulto Carne 100 grs', '<ul> <li>PEDIGREE Adulto Carne&nbsp;</li> <li>100 grs</li> </ul>', '20.00', 62, '', '2022-10-17 19:30:41', 'pedigree-adulto-carne-100-grs', 1),
(23, 1, '51215454544', 'PEDIGREE Cachorro Razas Medianas y Grandes 7 KG', '<ul> <li style=\"text-align: left;\">PEDIGREE Cachorro Razas Medianas y Grandes</li> <li style=\"text-align: left;\">7 KG</li> </ul>', '45.00', 60, '', '2022-10-17 19:32:42', 'pedigree-cachorro-razas-medianas-y-grandes-7-kg', 1),
(24, 3, '56677676767', 'PEDIGREE Razas Pequeñas Pollo 100 gr', '<ul> <li>PEDIGREE Razas Peque&ntilde;as Pollo</li> <li>100 gr</li> <li>Sabor Pollo</li> </ul>', '35.00', 43, '', '2022-10-17 19:34:22', 'pedigree-razas-pequenas-pollo-100-gr', 1),
(25, 3, '63262415151', 'PEDIGREE Cachorro Pollo 100 gr', '<ul> <li>PEDIGREE Cachorro Pollo &nbsp;</li> <li>100 gr</li> <li>Sabor Pollo</li> </ul>', '23.00', 63, '', '2022-10-17 19:36:02', 'pedigree-cachorro-pollo-100-gr', 1),
(26, 3, '12132656555', 'PEDIGREE Cachorro Carne 100 gr', '<ul> <li>PEDIGREE Cachorro Carne</li> <li>100 gr</li> <li>Sabor Carne en salsa</li> </ul>', '30.00', 30, '', '2022-10-17 19:38:04', 'pedigree-cachorro-carne-100-gr', 1),
(27, 3, '69650474374', 'PURINA Adultos Medianos y Grandes 15 KG', '<ul> <li>PURINA Adultos Medianos y Grandes 15 KG</li> </ul>', '60.00', 3, '', '2022-10-17 19:39:38', 'purina-adultos-medianos-y-grandes-15-kg', 1),
(28, 3, '11364565656', 'PURINA Adultos Minis y Pequeños 8 KG', '<p>PURINA DOG CHOW</p> <p>Adultos Minis y Peque&ntilde;os</p> <p>8 KG</p> <p>Carne y Pollo</p>', '50.00', 50, '', '2022-10-17 19:42:02', 'purina-adultos-minis-y-pequenos-8-kg', 1),
(29, 3, '13265606444', 'DOG CHOW Adultos Mas 7 Todos los tamaños 8 Kg', '<p>DOG CHOW Adultos 7+ Todos los tama&ntilde;os</p> <p>&nbsp;8 Kg</p>', '60.00', 60, '', '2022-10-17 19:50:36', 'dog-chow-adultos-mas-7-todos-los-tamanos-8-kg', 1),
(30, 3, '48441154515', 'DOG CHOW Cachorros Medianos y Grandes 15 KG', '<p>DOG CHOW Cachorros Medianos &nbsp;y Grandes</p>', '60.00', 60, '', '2022-10-17 19:54:26', 'dog-chow-cachorros-medianos-y-grandes-15-kg', 1),
(31, 3, '32365656565', 'DOG CHOW Cachorros Minis y Pequeños 3 Kg', '<ul> <li>DOG CHOW Cachorros Minis y Peque&ntilde;os</li> <li>3 Kg</li> </ul>', '30.00', 30, '', '2022-10-17 19:57:31', 'dog-chow-cachorros-minis-y-pequenos-3-kg', 1),
(32, 3, '63261212121', 'DOG CHOW Adultos Mas 7 Todos los Tamaños 3 KG', '<ul> <li>DOG CHOW Adultos Mas 7 Todos los Tama&ntilde;os</li> <li>3 KG</li> </ul>', '60.00', 60, '', '2022-10-17 19:59:20', 'dog-chow-adultos-mas-7-todos-los-tamanos-3-kg', 1);

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
(5, 'Efectivo', 1),
(6, 'Contra Entrega', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`);

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
  ADD KEY `tipopagoid` (`tipopagoid`);

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
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idproducto`),
  ADD KEY `categoriaid` (`categoriaid`);

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
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de la tabla `imagen`
--
ALTER TABLE `imagen`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT de la tabla `modulo`
--
ALTER TABLE `modulo`
  MODIFY `idmodulo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idpedido` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `idpermiso` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=526;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idpersona` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idproducto` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

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
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`tipopagoid`) REFERENCES `tipopago` (`idtipopago`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`rolid`) REFERENCES `rol` (`idrol`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permisos_ibfk_2` FOREIGN KEY (`moduloid`) REFERENCES `modulo` (`idmodulo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`rolid`) REFERENCES `rol` (`idrol`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`categoriaid`) REFERENCES `categoria` (`idcategoria`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
