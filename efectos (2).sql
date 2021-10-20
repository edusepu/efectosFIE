-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-09-2021 a las 03:58:38
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `efectos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`id`, `descripcion`) VALUES
(1, 'INFORMATICA'),
(2, 'INVESTIGACIÓN');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecomputadora`
--

CREATE TABLE `detallecomputadora` (
  `idDetalle` int(11) NOT NULL,
  `marcaProcesador` varchar(10) NOT NULL,
  `procesador` varchar(100) NOT NULL,
  `ram` int(11) NOT NULL,
  `tipoDisco` int(11) NOT NULL,
  `capacidadDisco` int(11) NOT NULL,
  `medidaCapacidad` int(11) NOT NULL,
  `sistemaOperativo` varchar(100) NOT NULL,
  `observaciones` varchar(250) NOT NULL,
  `activo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detallecomputadora`
--

INSERT INTO `detallecomputadora` (`idDetalle`, `marcaProcesador`, `procesador`, `ram`, `tipoDisco`, `capacidadDisco`, `medidaCapacidad`, `sistemaOperativo`, `observaciones`, `activo`) VALUES
(1, '2', 'Razr 5', 8, 2, 500, 2, 'Windows 10', 'observacion de prueba', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `efectos`
--

CREATE TABLE `efectos` (
  `id` int(11) NOT NULL,
  `NNE` varchar(20) DEFAULT NULL,
  `INE` varchar(100) DEFAULT NULL,
  `NI` varchar(20) DEFAULT NULL,
  `nroProntuario` varchar(50) DEFAULT NULL,
  `dpto` int(11) DEFAULT NULL,
  `activo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `efectos`
--

INSERT INTO `efectos` (`id`, `NNE`, `INE`, `NI`, `nroProntuario`, `dpto`, `activo`) VALUES
(1, '7025-15111111', 'Monitor LCD Marca Coradir Mod 19WHE', '123456', '154362', 1, 0),
(2, 'caqqqqqqqqqqqqqq', 'ca', 'modi', '11111', 33, 1),
(3, 'nq1', 'iq1', 'niq1', NULL, 551, 1),
(4, '', '', '', NULL, 0, 1),
(5, '', 'a', 'a', NULL, 3, 1),
(6, 'nneeeeeeeeeuuuuuu', 'ineuuuu', 'niuuuu', NULL, 11000, 1),
(7, 'a', 'a', 'a', NULL, 1, 1),
(8, 'nu', 'nu', 'nu', NULL, 99, 0),
(9, '88', '88', '88', NULL, 998, 0),
(10, 'a', 'a', 's', NULL, 1, 0),
(11, 'q', 'q', 'q', NULL, 22, 0),
(12, 'a', 'a', 'a', NULL, 1, 0),
(13, '12', '1', '1', NULL, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fundacion`
--

CREATE TABLE `fundacion` (
  `id` int(11) NOT NULL,
  `elemento` varchar(100) NOT NULL DEFAULT '0',
  `descripcion` varchar(100) NOT NULL DEFAULT '0',
  `cantidad` int(11) NOT NULL DEFAULT 0,
  `ubicacion` varchar(50) NOT NULL DEFAULT '0',
  `observacion` varchar(250) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fundacion`
--

INSERT INTO `fundacion` (`id`, `elemento`, `descripcion`, `cantidad`, `ubicacion`, `observacion`) VALUES
(1, 'CAMA DE UNA PLAZA DE PINO ', 'RESPALDO, PIECERA Y ELASTICO DE MADERA ', 1, 'Vestuario femenino', 'a'),
(2, 'MESA DE LUZ DE PINO', 'CON CAJON Y PUERTA ', 1, 'Vestuario femenino', ''),
(3, 'IMPRESORA', 'DESKJET D 1560', 1, 'Ofic Enc Apoyo', ''),
(4, 'CARRETILLA CHAPA', 'CON RUEDA NEUMATICA', 1, 'Intendente de cuartel', ''),
(5, 'AIRE ACONDICIONADO  3000 FR. SIGMAN', 'DE VENTANA', 1, 'Oficina Mesa Entrada y Salida', ''),
(6, 'IMPRESORA ', 'HP 1006', 1, 'Of Materiales', ''),
(7, 'LOCKERS', 'DE SEIS PUERTAS CON DISPOSITIVO PARA CANDADO', 2, 'Vestuario femenino', ''),
(8, 'LOCKERS', 'DE SEIS PUERTAS CON DISPOSITIVO PARA CANDADO', 8, 'Vestuario suboficiales', ''),
(9, 'PLACARD DE DOS PUERTAS', 'DE MADERA COLOR ROBLE - DOS PUERTAS - DOS CAJONES ', 1, 'Habitaci?n Oficial de Servicio', ''),
(10, 'TERMOTANQUE el?ctrico', 'DOMEC DE 120L ', 1, 'Vestuario Oficiales Superiores', ''),
(11, 'TERMOTANQUE el?ctrico', 'DOMEC DE 120L ', 1, 'Vestuario Suboficiales', ''),
(12, 'ESTUFA HALOGENA', 'Electrolux 1300 w', 1, 'Cabildo 15- guardia', ''),
(13, 'BOMBA DE AGUA ', 'TRIF?SICA DE 1 HP - CZERWNY ZETA 3T', 1, 'Cisterna', ''),
(14, 'IMPRESORA', 'HP Photosmart C 4280', 1, 'Ofic Jefe Dpto Apoyo', ''),
(15, 'EXTRACTOR AXIAL DE PARED', 'MONOF?SICA ELEMAK P13 220W 400mm di?metro', 1, 'Ba?o ofic cursantes', ''),
(16, 'IMPRESORA MULTIFUNCION', 'HP Laser Jet Pro', 1, 'Oficina Mesa Entrada y salida', ''),
(17, 'FREEZER', 'H 202L ETERNITY M GAFA', 1, 'Casino de Suboficiales', ''),
(18, 'CALEFACTOR', ' ECOSOL', 1, 'Ofic Enc Apoyo', ''),
(19, 'CALEFACTOR', ' ECOSOL', 1, 'Materiales', ''),
(20, 'CALEFACTOR', ' ECOSOL', 1, 'Materiales', ''),
(21, 'AIRE ACONDICIONADO', 'COMPACTO 2250', 1, 'Of Jefe Dpto Apoyo', ''),
(22, 'IMPRESORA MULTIFUNCION', 'HP OFFICEJET 4500', 1, 'Grupo personal', ''),
(23, 'EXTRACTOR COCINA', '', 1, 'Cantina EST', ''),
(24, 'VENTILADOR PARED ', 'ventiladores pared 20\"', 2, 'Vest Oficiales cursantes', ''),
(25, 'AIRE ACONDICIONADO PARED', 'Surrery 2100 F/C', 1, 'Habitaci?n Oficial de Servicio', ''),
(26, 'CORTINAS ', '', 0, 'Aula Magna', ''),
(27, 'AIRE ACONDICIONADO ', 'AVTCL 3000 FRIG -GREE', 1, 'Ofic Enc Apoyo', ''),
(28, 'BOMBA SUMERGIBLE', 'SAP-900  Sumergible Aguas limpias 1.25HP - Marca Motorarg', 1, 'Lab', ''),
(29, 'BARRERAS P/CONTROL VEHICULAR ', '', 2, 'Guardia', ''),
(30, 'COLCHONES DE UNA PLAZA', '90 cm x 190 cm', 2, 'Of Serv - Jefe de guardia', ''),
(31, 'TV CON SOPORTE', '46\" Admiral', 1, 'Guardia', ''),
(32, 'MOSTRADOR Y SILLA', '', 0, 'Ingreso Cabildo 15', ''),
(33, 'IMPRESORA LASER MULTIFUNCION', 'HP laser mono 425DN', 1, 'Personal militar', ''),
(34, 'BANCOS DE PINO', 'banco plegable-vestuarios', 1, 'Vestuario femenino', ''),
(35, 'BANCOS DE PINO', 'banco plegable-vestuarios', 1, 'Vestuario femenino', ''),
(36, 'BANCOS DE PINO', 'banco plegable-vestuarios', 1, 'Vestuario femenino', ''),
(37, 'BANCOS DE PINO', 'banco plegable-vestuarios', 1, 'Vestuario femenino', ''),
(38, 'BANCOS DE PINO', 'banco plegable-vestuarios', 1, 'Vestuario subof', ''),
(39, 'BANCOS DE PINO', 'banco plegable-vestuarios', 1, 'Vestuario subof', ''),
(40, 'BANCOS DE PINO', 'banco plegable-vestuarios', 1, 'Vestuario subof', ''),
(41, 'BANCOS DE PINO', 'banco plegable-vestuarios', 1, 'Vestuario subof', ''),
(42, 'BANCOS DE PINO', 'banco plegable-vestuarios', 1, 'Vestuario subof', ''),
(43, 'BANCOS DE PINO', 'banco plegable-vestuarios', 1, 'Vestuario subof', ''),
(44, 'BANCOS DE PINO', 'banco plegable-vestuarios', 1, 'Vestuario subof', ''),
(45, 'BANCOS DE PINO', 'banco plegable-vestuarios', 1, 'Vestuario subof', ''),
(46, 'BANCOS DE PINO', 'banco plegable-vestuarios', 1, 'Vestuario subof', ''),
(47, 'BANCOS DE PINO', 'banco plegable-vestuarios', 1, 'Vestuario subof', ''),
(48, 'BANCOS DE PINO', 'banco plegable-vestuarios', 1, 'Vestuario subof', ''),
(49, 'BANCOS DE PINO', 'banco plegable-vestuarios', 1, 'Vestuario subof', ''),
(50, 'CHULENGO', '', 1, 'Parque automotor', ''),
(51, 'TERMOTANQUE el?ctrico', 'el?ctrico TTE 125 EMEGE', 1, 'Ba?o Subof', ''),
(52, 'VENTILADOR DE TECHO', '4 aspas', 1, 'Peluqueria', ''),
(53, 'MOLINETES P/CONTROL DE ACCESO', '', 2, 'Cabildo 15', ''),
(54, 'M?DULO AMBIENTAL PLUZONO  ', '', 2, 'Edificio 1 - Ba?o Planta Baja - Ba?o 1er Piso', ''),
(55, 'SECAMANOS el?ctrico TWISTER ', '', 2, 'Edificio 1 - Ba?o Planta Baja - Ba?o 1er Piso', ''),
(56, 'REFLECTOR LED ', '', 3, 'Plaza de armas', ''),
(57, 'BARANDA DE ACERO INOXIDABLE ', '', 1, 'Ingreso Cabildo 15', ''),
(58, 'VENTILADOR DE PIE ', 'ATMA', 1, 'Ingreso Cabildo 15', ''),
(59, 'HIDROLAVADORA ', '', 1, 'Ofic Enc Apoyo', ''),
(60, 'MONITOR SAMSUNG 18,5\" ', '', 1, 'Guardia', ''),
(61, 'PUERTA CENTRO DE FOTOCOPIADO ', '', 1, 'Centro de fotocopiado', ''),
(62, 'PUERTA PLACA PARA OF GUARDIA ', '', 1, 'Habitaci?n de Jefe de Guardia', ''),
(63, 'CENICERO/PAPELERO', 'ARES negros', 1, 'Entrada Cabildo 15 ', ''),
(64, 'CENICERO/PAPELERO', 'ARES negros', 1, 'Entrada Edif N? 2', ''),
(65, 'ANDAMIO', '8 bastidor de andamio tubular, 2 bastidor de baranda ', 0, 'Parque automotor', ''),
(66, '', '10 riendas cortas,8 riendas largas,', 0, '', ''),
(67, '', '4 tablones met?licos encastrables, 4 ruedas', 0, '', ''),
(68, 'AIRE ACONDICIONADO SPLIT ', 'SIAM SMS32H17N', 1, 'Hab Jefe de Guardia', ''),
(69, 'CAMARAS DE SEGURIDAD', '', 0, 'Guardia', ''),
(70, 'CONTROL DE ACCESO Y ASISTENCIA ANVIZ', '', 0, 'Guardia', ''),
(71, 'CAMARA WEB', 'Control de acceso', 0, 'Guardia', ''),
(72, 'CAMARA WEB', 'Control de acceso', 0, 'Guardia', ''),
(73, 'CAMARA DE SEGURIDAD', '', 0, 'Guardia', ''),
(74, 'EQUIPO PARA CONTROL DE ACCESO', '', 0, 'Cabildo 15', ''),
(75, 'CONTROL DE ACCESO', 'DVD - 3 c?maras de visi?n  nocturna  3 fuentes std - Housing externo', 0, 'Cabildo 15', ''),
(76, 'MATAFUEGO', 'Tipo K x 5 Kg', 1, 'Confiter?a', ''),
(77, 'COCINA', 'C6H-cocina H320 -6 hornallas', 1, 'Confiter?a', ''),
(78, 'HELADERA EXHIBIDORA', '', 1, 'Confiter?a', ''),
(79, 'TERMOTANQUE ', 'Se?orial 160 l Zafiro multigas', 1, 'Vestuario Oficiales Cursantes', ''),
(80, 'GAZEBO', 'Autoarmable 3m x 3m ', 1, '', ''),
(81, 'CAMARA DE SEGURIDAD', 'HD-TVI Bullet de 5mp', 1, '', ''),
(82, 'AIRE ACONDICIONADO', 'Split - ATMA F/C ATS25HA4BN', 1, 'Guardia FIE', ''),
(83, 'COLCH?N DE 1 PLAZA', 'Alta densidad', 1, 'Hab Jefe de guardia', ''),
(84, 'SIERRA CIRCULAR', 'Skil F0125402JB-000', 1, 'Carpinter?a', ''),
(85, 'ATORNILLADOR', 'Bosch a bater?a GSR 180 - Li 18v', 1, 'Carpinter?a', ''),
(86, 'AIRE ACONDICIONADO ', 'Split 5461FC ', 1, 'Comedor FIE', ''),
(87, 'LIJADORA DE BANDA', '76 x 533 mm - 900w', 1, 'Carpinter?a', ''),
(88, 'SEMAFORO PARA GARAGE', 'Leds rojo y verde con sonido', 1, 'Ingreso vehicular FIE', ''),
(89, 'TERMOTANQUE ', 'Se?orial - el?ctrico - 120 l', 1, 'Vestuario de oficiales', ''),
(90, 'GPS', 'GARMIN NUVI 1300', 1, 'Veh?culo EST', ''),
(91, 'CORTINAS', '', 2, 'Ofic de Director', ''),
(92, 'AIRE ACONDICIONADO SPLIT', 'Luft 3000 F/C', 1, 'Secretar?a de direcci?n', ''),
(93, 'FAX PANASONIC', '', 1, 'Secretar?a de direcci?n', ''),
(94, 'NOTEBOOK TOSHIBA', '5955-SP5264SM ', 1, 'Ofic de Director', ''),
(95, 'HELADERA HGF 360B', '', 1, 'Cocina de direcci?n', ''),
(96, 'SILLAS ESCRITORIO  (4)+ 1 LAMPARA ', '', 1, 'Secretaria de direcci?n', ''),
(97, 'AIRE ACONDICIONADO SPLIT ', 'LUFT 3000 F/C', 1, 'Ofic Enc Elemento', ''),
(98, 'IMPRESORA MULTIFUNCION LASER JET', 'HP Laser color M175A', 1, 'Secretar?a de direcci?n', ''),
(99, 'MICROONDAS', 'Microondas ', 1, 'Cocina de direcci?n', ''),
(100, 'BIBLIOTECA ', 'Biblioteca', 1, 'Ofic Enc Elemento', ''),
(101, 'MUEBLE OFICINA ', 'Mueble 2 puertas', 1, 'Ofic Enc Elemento', ''),
(102, 'AIRE ACONDICIONADO', 'Surray ventana - 4950 F/C', 1, 'Ofic de Director', ''),
(103, 'NOTEBOOK ', 'Compaq presario', 1, 'Secretaria de direcci?n', ''),
(104, 'Termotanque el?ctrico 55 litros', '', 1, 'Ba?o de direcci?n', ''),
(105, 'DESTRUCTORA DE PAPEL', '', 1, 'Ofic de Director', ''),
(106, 'Sill?n Monet ', '', 1, 'Ofic de Director', ''),
(107, 'NOTEBOOK', 'Bangho G01  I 318', 1, 'Oficina del Subdirector', ''),
(108, 'Tablet', 'Huawei mediapat T3 10\"', 1, 'Director', ''),
(109, 'Cortinas roller ', 'B. Out', 0, 'Sala de situaci?n', ''),
(110, 'SOMIER Y COLCHON', '1 Plaza', 1, 'Privado del Decano', ''),
(111, 'BALANZA', 'Para personas c/alt?metro - capacidad 200Kg', 1, 'Consultorio m?dico', ''),
(112, 'CALOVENTOR', 'Split -Liliana CWD900', 1, 'Consultorio m?dico', ''),
(113, 'AIRE ACONDICIONADO', 'Split 5461 FC-6,35KW EA GRS60H', 1, 'Decanato', ''),
(114, 'PANTALLA PROYECCION MANUAL', '100\" ', 1, 'Sala de situaci?n', ''),
(115, 'ESPIRALADORA OFICIO Y COMPONENTES', '', 1, 'Fotocopiadora', ''),
(116, 'CIZALLA', 'Guillotina oficio', 1, 'Fotocopiadora', ''),
(117, 'SOFTWARE CONTABLE', 'BTB software', 0, 'Ofic Fundaci?n', ''),
(118, 'MONITOR', 'Samsung BX 1950', 1, 'Ofic Presupuesto', ''),
(119, 'COPIADORA DIGITAL RICOH', 'AFICIO MP4500 - SERIE M2863601124', 1, 'Fotocopiadora', ''),
(120, 'ECOSOL', 'Panel calefactor ', 2, 'Ofic Fundaci?n', ''),
(121, 'ESCRITORIO/PUESTO DE TRABAJO', 'Puesto de trabajo ', 1, 'Ofic Presupuesto', ''),
(122, 'ESCRITORIO/PUESTO DE TRABAJO', 'Puesto de trabajo', 1, 'Ofic Presupuesto', ''),
(123, 'SILLA TESORERIA', 'con apoya brazos', 1, 'Ofic Fundaci?n', ''),
(124, 'TRITURADORA DE PAPEL', 'CIFRA 810C', 1, 'Ofic Fundaci?n', ''),
(125, 'AIRE  ACONDICIONADO', 'Daewoo splkit F/C 2500 W ', 1, 'Ofic Fundaci?n', ''),
(126, 'AIRE  ACONDICIONADO', 'Kendal 3200 W F/C', 1, 'Ofic Presupuesto', ''),
(127, 'NOTEBOOK', 'DELL INSPIRON 14 SERIE 5000', 1, 'Ofic Fundaci?n', ''),
(128, 'PC de escritorio - monitor LED 19\" Samsung', 'Sentey Mini SS1-2420 450W', 1, 'Fotocopiadora', ''),
(129, 'Puesto de trabajo ', 'Formato L, 1,70x0,6mts - 1 cajonera 4 cajones', 1, 'Ofic Fundaci?n', ''),
(130, 'Abrochadora ', 'Heavy Duty Hoodn 23/6 al 2', 1, 'Fotocopiadora', ''),
(131, 'Espiraladora anilladora de hojas', '', 1, 'Fotocopiadora', ''),
(132, 'FOTOCOPIADORA', 'RICOH MP 5002 SP', 1, 'Fotocopiadora', ''),
(133, 'IMPRESORA', 'Multifunci?n RICOH SP3710 SF', 1, 'Ofic Fundaci?n', ''),
(134, 'CAJA FUERTE', '', 0, 'Ofic Fundaci?n', ''),
(135, 'SILLA PARA ESCRITORIO', 'SILLA PC RESPALDO ALTO', 1, 'Jefe Dpto Presupuesto', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `locales`
--

CREATE TABLE `locales` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `piso` int(11) DEFAULT NULL,
  `departamento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `locales`
--

INSERT INTO `locales` (`id`, `descripcion`, `piso`, `departamento`) VALUES
(1, 'Aula 213', 2, 1),
(2, 'Aula 212', 2, 1),
(3, 'Aula 214', 2, 1),
(4, 'Soporte', 2, 1),
(5, 'Lab Suelos', 0, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(20) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `departamento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `tipo`, `password`, `departamento`) VALUES
(1, 'administrador', 1, '1234', 1),
(2, 'usuario', 2, '1234', 1),
(3, 'investigacion', 2, '1234', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `efectos`
--
ALTER TABLE `efectos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `fundacion`
--
ALTER TABLE `fundacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `locales`
--
ALTER TABLE `locales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `efectos`
--
ALTER TABLE `efectos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `fundacion`
--
ALTER TABLE `fundacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT de la tabla `locales`
--
ALTER TABLE `locales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
