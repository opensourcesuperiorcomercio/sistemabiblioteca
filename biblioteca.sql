-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-11-2019 a las 23:28:57
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bibliografia`
--

CREATE TABLE `bibliografia` (
  `id` int(11) NOT NULL,
  `fechaAlta` datetime NOT NULL,
  `fechaBaja` date NOT NULL,
  `idEstado` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `autores` varchar(100) NOT NULL,
  `anioPublicacion` int(11) NOT NULL,
  `idEditorial` int(11) NOT NULL,
  `ISBN` char(13) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `tejuelo` varchar(20) NOT NULL,
  `idCategoriaCDU` int(11) NOT NULL,
  `idMateriaCDU` int(11) NOT NULL,
  `idSubmateriaCDU` int(11) NOT NULL,
  `edicion` int(11) NOT NULL,
  `lugarImpresion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `bibliografia`
--

INSERT INTO `bibliografia` (`id`, `fechaAlta`, `fechaBaja`, `idEstado`, `titulo`, `autores`, `anioPublicacion`, `idEditorial`, `ISBN`, `descripcion`, `tejuelo`, `idCategoriaCDU`, `idMateriaCDU`, `idSubmateriaCDU`, `edicion`, `lugarImpresion`) VALUES
(13, '2019-09-06 17:56:01', '1900-01-01', 1, 'DICCIONARIO TECNICO INGLES ESPAÑOL', 'G. MALGORN', 1990, 1, '842830923x', 'Terminologia cientifica y tecnica.', '1', 1, 1, 1, 15, 'ESPAÑA'),
(15, '2019-09-06 18:21:00', '1900-01-01', 1, 'PROGRAMACION EN JAVASCRIPT', 'YO', 2019, 1, '1111111', 'LIBRO DE PRUEBA', '1', 1, 1, 1, 1, 'ACA'),
(16, '2019-09-06 18:23:44', '1900-01-01', 1, '111', '111', 0, 1, '11', '11', '1', 1, 1, 1, 0, '111'),
(17, '2019-09-06 18:29:44', '1900-01-01', 1, '11', '11', 11, 1, '11', '11', '1', 1, 1, 1, 11, '11'),
(18, '2019-09-10 18:21:56', '1900-01-01', 1, 'PRUEBA MARTES', 'qqq', 1212, 1, '12313213', 'LIBRO DE PRUEBA', '', 1, 1, 1, 1, '1'),
(19, '2019-09-10 18:24:31', '1900-01-01', 1, 'PRUEBA MARTES', 'qqq', 1212, 1, '12313213', 'LIBRO DE PRUEBA', '1', 1, 1, 1, 1, '1'),
(20, '2019-09-10 18:25:37', '1900-01-01', 1, 'PYTHON CON JAVASCRIPT', 'MATIAS', 2019, 1, '123456789', 'PRUEBA', '1', 1, 1, 1, 2, 'SAN JUSTO'),
(21, '2019-10-17 21:26:06', '1900-01-01', 1, 'NUEVOS PERFILES DEL DERECHO DE FAMILIA', 'AIDA KEMELMAJER DE CARLUCCI; LEONARDO B. PEREZ GALLARDO', 2006, 1, '9507277536', 'Sobre actualidad del derecho civil, de relaciones familiares, sociedades conyugales, etc', '1', 1, 1, 1, 1, 'SANTA FE, ARGENTINA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoriacdu`
--

CREATE TABLE `categoriacdu` (
  `numeromateria` int(11) NOT NULL,
  `nombremateria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoriacdu`
--

INSERT INTO `categoriacdu` (`numeromateria`, `nombremateria`) VALUES
(0, 'CIENCIA Y CONOCIMIENTO'),
(1, 'FILOSOFIA Y PSICOLOGIA'),
(2, 'RELIGION Y TEOLOGIA'),
(3, 'CIENCIAS SOCIALES'),
(4, 'VACANTE'),
(5, 'MATEMATICAS Y CIENCIAS NATURALES'),
(6, 'CIENCIAS APLICADAS, MEDICINA Y TECNOLOGIA'),
(7, 'BELLAS ARTES, JUEGOS, ESPECTACULOS Y DEPORTES'),
(8, 'LENGUAJE, LINGUISTICA Y LITERATURA'),
(9, 'GEOGRAFIA, BIOGRAFIA E HISTORIA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiacdu`
--

CREATE TABLE `materiacdu` (
  `numerocategoria` int(11) NOT NULL,
  `numeromateria` int(11) NOT NULL,
  `nombremateria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `materiacdu`
--

INSERT INTO `materiacdu` (`numerocategoria`, `numeromateria`, `nombremateria`) VALUES
(0, 2, 'Biblioteconomía.  \n'),
(0, 6, 'Organizaciones. Asociaciones. Congresos. Exposiciones. Instituciones científicas.  \n'),
(0, 8, 'Poligrafías en general. Colecciones. Homenajes.  \n'),
(0, 9, 'Manuscritos. Libros raros y curiosos. Bibliofilia.  \n'),
(1, 11, 'Metafísica. Ontología. Cosmología.  \n'),
(1, 13, 'Filosofía de la mente y del espíritu. Metafísica de la vida espiritual.  \n'),
(1, 14, 'Sistemas filosóficos.  \n'),
(1, 16, 'Lógica. Teoría del conocimiento. Epistemología. Metodología de la lógica.  \n'),
(1, 17, 'Ética. Moral. \n'),
(2, 21, 'Teología natural.  \n'),
(2, 22, 'La Biblia.  \n'),
(2, 23, 'Teología dogmática.  \n'),
(2, 24, 'Teología moral. Teología práctica.  \n'),
(2, 25, 'Teología pastoral.  \n'),
(2, 26, 'Iglesia cristiana en general. Organización y liturgia.  \n'),
(2, 27, 'Historia general de la Iglesia cristiana. Órdenes y congregaciones religiosas.  \n'),
(2, 28, 'Iglesias cristianas. Comunidades y sectas.  \n'),
(2, 29, 'Religiones no cristianas. Mitología.  \n'),
(3, 31, 'Sociología. Estadística. Demografía.  \n'),
(3, 32, 'Política.  \n'),
(3, 33, 'Economía en general.  \n'),
(3, 35, 'Administración pública en general.  \n'),
(3, 36, 'Trabajo social. Ayuda social.  \n'),
(3, 39, 'Etnografía. Etnología.  \n'),
(5, 51, 'Matemáticas.  \n'),
(5, 52, 'Astronomía. Astrofísica. Investigación espacial. Geodesia.  \n'),
(5, 53, 'Física.  \n'),
(5, 54, 'Química.  \n'),
(5, 55, 'Geología y ciencias afines. Geología regional.  \n'),
(5, 56, 'Paleontología. Fósiles.  \n'),
(5, 57, 'Ciencias biológicas en general.  \n'),
(5, 58, 'Botánica.  \n'),
(5, 59, 'Zoología.  \n'),
(6, 61, 'Medicina.  \n'),
(6, 62, 'Tecnología en general. Máquinas en general, sus propiedades y características.  \n'),
(6, 63, 'Agricultura.  \n'),
(6, 64, 'Economía doméstica. Cuidado y administración del hogar. Hostelería.  \n'),
(6, 66, 'Industria química. Tecnología química. Industrias afines.  \n'),
(6, 69, 'Construcción. Trabajos y materiales de construcción en general.  \n'),
(7, 71, 'Urbanismo. Ordenación del territorio.  \n'),
(7, 72, 'Arquitectura.  \n'),
(7, 73, 'Artes plásticas. Escultura.  \n'),
(7, 75, 'Pintura.  \n'),
(7, 76, 'Artes gráficas. Grabados.  \n'),
(7, 77, 'Fotografía.  \n'),
(7, 78, 'Música. Géneros musicales. Métodos y estudios de Música para los distintos instrumentos.  \n'),
(7, 79, 'Diversiones. Juegos. Deportes. Espectáculos públicos.  \n'),
(8, 81, 'Lingüística y lenguas.  \n'),
(8, 82, 'Literatura general.  \n'),
(8, 87, 'Literaturas clásicas. Historia y crítica. Obras.  89 Otras literaturas.  \n'),
(9, 91, 'Geografía general. Historia de la geografía.  \n'),
(9, 93, 'Historia.  \n'),
(9, 94, 'Historia de la Edad Media y Moderna en general.  \n');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `id` int(11) NOT NULL,
  `idbibliografia` int(11) NOT NULL,
  `idusuariofinal` int(11) NOT NULL,
  `idoperador` int(11) NOT NULL,
  `fechasolicitud` datetime NOT NULL,
  `fechadevolucion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `submateriacdu`
--

CREATE TABLE `submateriacdu` (
  `numeromateria` int(11) NOT NULL,
  `numerosubmateria` int(11) NOT NULL,
  `nombresubmateria` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `submateriacdu`
--

INSERT INTO `submateriacdu` (`numeromateria`, `numerosubmateria`, `nombresubmateria`) VALUES
(0, 1, 'Ciencia y conocimiento en general. Organización del trabajo intelectual. Divulgación de la ciencia.  \n'),
(0, 2, 'Documentación en general. Producción documental. Centros de documentación.  \n'),
(0, 3, 'Escritura. Sistemas de escritura. Signos y símbolos. Representaciones gráficas en general.  \n'),
(0, 4, 'Ciencia y tecnología de los ordenadores. Informática.  \n'),
(0, 5, 'Estudios teóricos de organización en general. Metodología. Análisis, síntesis, clasificación y taxonomía. Sistematización en general.  \n'),
(0, 6, 'Normalización en general y normas.  \n'),
(0, 7, 'Teoría de la comunicación y del control en general. Cibernética.  \n'),
(0, 8, 'Civilización, progreso y cultura en general.  \n'),
(0, 9, 'Humanidades.  \n'),
(1, 11, 'Bibliografías universales.  \n'),
(1, 16, 'Bibliografías especiales.  \n'),
(1, 17, 'Catálogos en general.  \n'),
(1, 19, 'Catálogos especiales.  \n'),
(3, 30, 'Enciclopedias y diccionarios enciclopédicos generales. Obras de referencia general. Estudios y crítica sobre esta clase de obras.  \n'),
(5, 50, 'Publicaciones seriadas. Publicaciones periódicas. Estudios y críticas sobre estas obras.  \n'),
(6, 69, 'Museos. Galerías. Exposiciones permanentes. Museología.  \n'),
(7, 70, 'Periodismo. La Prensa (concepto, ética, administración y control, organización comercial y editorial).  \n'),
(13, 133, 'Ciencias ocultas. Ocultismo.  \n'),
(22, 225, 'Nuevo Testamento.  \n'),
(26, 268, 'Catequesis.  \n'),
(28, 282, 'Iglesia Católica Romana.  \n'),
(29, 292, 'Antiguas religiones griega y romana. Mitología clásica.  \n'),
(29, 296, 'Judaísmo.  \n'),
(29, 297, 'El Islam. \n'),
(30, 303, 'Métodos de las Ciencias Sociales (investigación, selección, recopilación de datos, análisis).  \n'),
(30, 308, 'Sociografía. Situación social. Geografía social.  \n'),
(31, 311, 'Ciencia estadística. Teoría de la estadística.  \n'),
(31, 312, 'Estadística de la población.  \n'),
(31, 314, 'Demografía. Estudios de la población.  \n'),
(31, 316, 'Sociología.  \n'),
(32, 321, 'Formas de organización política.  \n'),
(32, 322, 'Relaciones entre el Estado y la Iglesia. Política religiosa.  \n'),
(32, 324, 'Elecciones. Plebiscitos. Referéndum.  \n'),
(32, 325, 'Migración. Emigración, colonización.  \n'),
(32, 326, 'Esclavitud.  \n'),
(32, 327, 'Política internacional. Relaciones internacionales. Política exterior.  \n'),
(32, 328, 'Parlamentos y gobiernos.  \n'),
(32, 329, 'Partidos políticos. Movimientos políticos.  \n'),
(33, 330, 'Ciencia económica. Economía política. Doctrinas económicas.  \n'),
(33, 331, 'Trabajo.  \n'),
(33, 332, 'Economía regional, territorial.  \n'),
(33, 334, 'Formas de organización y cooperación en la economía. Cooperativismo.  \n'),
(33, 336, 'Finanzas. Hacienda pública.  \n'),
(33, 338, 'Política económica. Organización, planificación y producción.  \n'),
(33, 339, 'Comercio en general. Relaciones económicas internacionales. Economía mundial.  \n'),
(34, 344, 'Derecho penal especial (militar, marítimo, aéreo).  \n'),
(34, 347, 'Derecho civil. Derecho privado.  \n'),
(34, 348, 'Derecho canónico. Derecho eclesiástico.  \n'),
(34, 349, 'Derechos especiales. Ramas especiales del Derecho.  \n'),
(35, 351, 'Funciones propias de la Administración. Legislación administrativa en general.  \n'),
(35, 352, 'Administración local.  \n'),
(35, 353, 'Administración regional. Administración autonómica.  \n'),
(35, 354, 'Administración central.  \n'),
(35, 355, 'Asuntos militares. Arte de la guerra.  \n'),
(36, 364, 'Asistencia social.  \n'),
(36, 366, 'Consumismo.  \n'),
(36, 368, 'Seguros.  \n'),
(37, 374, 'Enseñanza y educación extraescolares.  \n'),
(37, 376, 'Enseñanza y educación de grupos especiales.  \n'),
(37, 377, 'Formación profesional. Enseñanzas técnicas.  \n'),
(37, 378, 'Enseñanza superior. Universidades y escuelas especiales con estatus universitario.  \n'),
(39, 391, 'Vestimenta. Indumentaria. Moda.  \n'),
(39, 392, 'Usos y costumbres en la vida privada.  \n'),
(39, 393, 'Muerte. Funerales. Ritos funerarios.  \n'),
(39, 394, 'Vida pública. Vida social.  \n'),
(39, 395, 'Ceremonial. Etiqueta. Protocolo.  \n'),
(39, 398, 'Folclore.  \n'),
(50, 502, 'Estudio, conservación y protección de la naturaleza.  \n'),
(50, 504, 'Ciencias del medio ambiente.  \n'),
(51, 511, 'Aritmética. Teoría de los números.  \n'),
(51, 512, 'Álgebra.  \n'),
(51, 514, 'Geometría.  \n'),
(51, 517, 'Análisis matemático.  \n'),
(52, 521, 'Astronomía teórica. Mecánica celeste. Astrometría.  \n'),
(52, 523, 'Sistema solar.  \n'),
(52, 524, 'Estrellas. El universo.  \n'),
(52, 527, 'Astronomía náutica. Aeronáutica.  \n'),
(52, 528, 'Geodesia. Topografía. Cartografía.  \n'),
(53, 531, 'Mecánica general. Mecánica de los cuerpos sólidos y rígidos.  \n'),
(53, 532, 'Mecánica de los fluidos. Hidráulica.  \n'),
(53, 533, 'Mecánica de los gases. Aerodinámica.  \n'),
(53, 534, 'Acústica.  \n'),
(53, 535, 'Óptica.  \n'),
(53, 536, 'Termodinámica.  \n'),
(53, 537, 'Electricidad. Magnetismo.  \n'),
(54, 542, 'Química experimental.  \n'),
(54, 543, 'Química analítica.  \n'),
(54, 544, 'Química física.  \n'),
(54, 546, 'Química inorgánica.  \n'),
(54, 547, 'Química orgánica.  \n'),
(54, 548, 'Cristalografía.  \n'),
(54, 549, 'Mineralogía.  \n'),
(55, 552, 'Petrología. Petrografía.  \n'),
(55, 553, 'Geología económica. Minerografía. Yacimientos de minerales.  \n'),
(55, 556, 'Hidrosfera. Agua en general. Hidrología.  \n'),
(57, 572, 'Antropología.  \n'),
(57, 573, 'Biología general.  \n'),
(57, 574, 'Ecología general.  \n'),
(57, 575, 'Genética.  \n'),
(57, 576, 'Biología celular. Citología.  \n'),
(57, 577, 'Bioquímica. Biología molecular. Biofísica.  578 Virología.  579 Microbiología.  \n'),
(58, 582, 'Botánica sistemática.  \n'),
(59, 592, 'Invertebrados.  \n'),
(59, 594, 'Moluscos.  \n'),
(59, 595, 'Articulados.  \n'),
(59, 598, 'Saurópsidos (reptiles).  \n'),
(59, 599, 'Mamíferos.\n'),
(61, 611, 'Anatomía.  \n'),
(61, 612, 'Fisiología.  \n'),
(61, 613, 'Higiene. Sanidad privada.  \n'),
(61, 614, 'Sanidad pública. Prevención de accidentes.  \n'),
(61, 615, 'Medicamentos. Farmacología. Terapéutica física. Toxicología. Naturopatía. Medicina popular.  \n'),
(61, 616, 'Patología general. Medicina clínica. Terapéutica.  \n'),
(61, 617, 'Cirugía. Ortopedia. Oftalmología.  \n'),
(61, 618, 'Ginecología. Obstetricia.  \n'),
(61, 619, 'Medicina veterinaria.  \n'),
(62, 620, 'Ensayo de materiales. Centrales de energía. Economía de la energía.  621 Ingeniería mecánica. Técnica en general.  \n'),
(62, 622, 'Minería.  \n'),
(62, 623, 'Ingeniería militar.  \n'),
(62, 624, 'Ingeniería civil.  \n'),
(62, 625, 'Técnica de las vías de comunicación terrestres.  \n'),
(62, 626, 'Ingeniería hidráulica. Construcciones en general. Canales, riegos, drenajes.  \n'),
(62, 627, 'Cursos de agua naturales. Trabajos hidráulicos en los ríos y en el mar. Embalses y centrales hidroeléctricas.  \n'),
(62, 628, 'Ingeniería sanitaria. Agua. Saneamiento. Ingeniería de la iluminación. Higiene urbana (desechos).  \n'),
(62, 629, 'Ingeniería del transporte. Técnica de los medios de transporte. Vehículos en general.  \n'),
(63, 630, 'Silvicultura. Ingeniería forestal.  \n'),
(63, 631, 'Agronomía. Técnicas agrícolas.  \n'),
(63, 632, 'Enfermedades y plagas de las plantas. Fitopatología.  \n'),
(63, 633, 'Cultivos específicos. Cereales. Forrajes.  \n'),
(63, 634, 'Horticultura en general. Árboles frutales. Viticultura.  \n'),
(63, 635, 'Horticultura especial. Plantas comestibles (hortalizas). Floricultura. Jardinería.  \n'),
(63, 636, 'Zootecnia general. Ganadería, cría de animales.  \n'),
(63, 637, 'Productos de los animales domésticos, de la caza y de la pesca.  \n'),
(63, 638, 'Cría de insectos. Apicultura. Sericultura.  \n'),
(63, 639, 'Caza y pesca industriales. Piscicultura.  \n'),
(64, 643, 'La vivienda.  \n'),
(64, 649, 'Cuidado doméstico de niños, enfermos e invitados.  \n'),
(65, 651, 'Organización y técnicas de trabajo en las oficinas.  \n'),
(65, 654, 'Organización y gestión de la telecomunicación.  \n'),
(65, 655, 'Industrias gráficas. Industrias del libro. Imprenta. Editoriales. Librerías.  \n'),
(65, 656, 'Organización y gestión de los transportes. Servicio postal.  \n'),
(65, 657, 'Contabilidad. Auditoría.  \n'),
(65, 658, 'Organización de empresas. Técnica comercial.  \n'),
(65, 659, 'Publicidad y propaganda. Información comercial. Relaciones públicas.  \n'),
(66, 661, 'Productos químicos en general.  \n'),
(66, 662, 'Pirotecnia. Explosivos. Combustibles.  \n'),
(66, 663, 'Microbiología y micología industriales. Bebidas. Estimulantes.  \n'),
(66, 664, 'Fabricación y conservación de alimentos sólidos.  \n'),
(66, 665, 'Fabricación de aceites, grasas y ceras. Adhesivos. Gomas. Resinas.  \n'),
(66, 666, 'Industria del vidrio, cerámica, cemento y hormigón.  \n'),
(66, 667, 'Industrias del color. Fabricación y uso de colorantes, tintas, pinturas, etc.  \n'),
(66, 669, 'Metalurgia.  \n'),
(67, 671, 'Joyería. Industrias de los metales y piedras preciosas.  \n'),
(67, 672, 'Industrias de artículos de hierro y acero en general, metales no ferrosos ni preciosos.  \n'),
(67, 674, 'Madera e industria de la madera.  \n'),
(67, 675, 'Industria de cuero. Tratamiento de pieles.  \n'),
(67, 676, 'Industria del papel y cartón.  \n'),
(67, 677, 'Industria textil.  \n'),
(67, 678, 'Industria del caucho. Industria de los plásticos.  \n'),
(67, 679, 'Industria del cable y de la cordelería. Industrias de la piedra y otros productos naturales.  \n'),
(68, 681, 'Mecánica de precisión. Relojería. Balanzas, básculas.  \n'),
(68, 683, 'Ferretería. Cerrajería. Lámparas de combustión. Estufas, hornos, calentadores.  \n'),
(68, 684, 'Industria del mueble y afines. Tapicería.  \n'),
(68, 685, 'Guarnicionería. Marroquinería. Zapatería. Artículos de viaje, deportes y juegos.  \n'),
(68, 686, 'Encuadernación. Dorado. Artículos de oficina.  \n'),
(68, 687, 'Industria del vestido. Artículos de tocador.  \n'),
(68, 688, 'Artículos de fantasía. Juguetes. Artículos de decoración.  \n'),
(68, 689, 'Bricolaje. Aficiones técnicas o manuales.  \n'),
(69, 691, 'Materiales de construcción y componentes.  \n'),
(69, 692, 'Partes estructurales y elementos de la construcción.  \n'),
(69, 693, 'Albañilería. Construcciones de hormigón y acero.  \n'),
(69, 694, 'Construcción de madera. Carpintería. Ebanistería.  \n'),
(69, 696, 'Instalaciones y servicios en la construcción (sanitarios, de gas, vapor, electricidad).  \n'),
(69, 697, 'Instalaciones de calefacción, ventilación y climatización en los edificios.  \n'),
(71, 715, 'Ordenación del paisaje. Parques y jardines.  \n'),
(72, 721, 'Edificios en general.  \n'),
(72, 725, 'Edificios públicos. Edificios comerciales. Edificios administrativos.  \n'),
(72, 726, 'Edificios religiosos. Edificios funerarios.  \n'),
(72, 727, 'Edificios docentes. Edificios con finalidad científica y cultural.  \n'),
(72, 728, 'Viviendas en general.  \n'),
(73, 736, 'Arte de tallar piedras preciosas. Sigilografía.  \n'),
(73, 737, 'Numismática.  \n'),
(73, 738, 'Cerámica. Alfarería.  \n'),
(73, 739, 'Trabajos artísticos en metal.  \n'),
(74, 741, 'Dibujo en general.  \n'),
(74, 742, 'Perspectiva en dibujo.  \n'),
(74, 743, 'Dibujo anatómico.  \n'),
(74, 744, 'Dibujo lineal y geométrico. Dibujo técnico.  \n'),
(74, 745, 'Artesanía decorativa.  \n'),
(74, 746, 'Trabajos manuales de aguja, rafia, mimbre, etc.  \n'),
(74, 747, 'Decoraciones de interiores.  \n'),
(74, 748, 'Vidrios y cristales artísticos.  \n'),
(77, 771, 'Equipo fotográfico.  \n'),
(77, 772, 'Procedimientos fotomecánicos de reproducción.  \n'),
(77, 778, 'Aplicaciones de la fotografía.  \n'),
(79, 792, 'Teatro. Teoría y técnica teatral.  \n'),
(79, 793, 'Diversiones de sociedad. Baile.  \n'),
(79, 794, 'Juegos de tablero y mesa.  \n'),
(79, 796, 'Deportes. Juegos. Gimnasia. Ejercicios físicos.  \n'),
(79, 797, 'Deportes acuáticos. Deportes aéreos.  \n'),
(79, 798, 'Deportes hípicos.  \n'),
(79, 799, 'Pesca deportiva. Caza deportiva. Tiro deportivo.  \n'),
(80, 806, 'Lenguas ibéricas.  \n'),
(80, 807, 'Lenguas clásicas.  \n'),
(81, 811, 'Clasificación general de las lenguas.  811.11 Lenguas germánicas.  \n'),
(90, 902, 'Arqueología.  \n'),
(90, 903, 'Prehistoria. Restos prehistóricos.  \n'),
(90, 904, 'Restos culturales de tiempos históricos.  \n'),
(90, 908, 'Descripción geográfico-histórica de un territorio, una localidad.  \n'),
(91, 910, 'Geografía como ciencia. Cuestiones generales. Viajes.  \n'),
(91, 912, 'Mapas. Atlas geográficos. Globos terráqueos.  \n'),
(91, 913, 'Geografía del mundo antiguo. Geografía regional en general.  \n'),
(91, 914, 'Geografía de Europa.  \n'),
(91, 915, 'Geografía de Asia.  \n'),
(91, 916, 'Geografía de África.  \n'),
(91, 917, 'Geografía de América del Norte y Central.  917.2 Geografía de México.  \n'),
(91, 918, 'Geografía de América del Sur.  \n'),
(91, 919, 'Geografía de Australia, Oceanía y de las regiones polares.  \n'),
(92, 929, 'Biografías.  \n'),
(93, 930, 'Ciencias auxiliares de la historia.  \n'),
(93, 931, 'Historia del mundo antiguo.  \n'),
(94, 940, 'Historia de Europa.  \n'),
(95, 950, 'Historia de Asia.  \n'),
(96, 960, 'Historia de África.  \n'),
(97, 970, 'Historia de América del Norte y América Central.  \n'),
(97, 972, 'Historia de México.  \n'),
(98, 980, 'Historia de América del Sur.  \n'),
(98, 981, 'Historia de Brasil.  \n'),
(98, 982, 'Historia de Argentina.  \n'),
(98, 983, 'Historia de Chile.  \n'),
(98, 984, 'Historia de Bolivia.  \n'),
(98, 985, 'Historia de Perú.  \n'),
(98, 987, 'Historia de Venezuela.  \n'),
(99, 990, 'Historia de Australia, Oceanía y de las regiones polares.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariofinal`
--

CREATE TABLE `usuariofinal` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `documento` int(11) NOT NULL,
  `telefono` decimal(15,0) NOT NULL,
  `domicilio` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuariofinal`
--

INSERT INTO `usuariofinal` (`id`, `nombre`, `apellido`, `documento`, `telefono`, `domicilio`) VALUES
(1, 'asd', 'asd', 12, '13', '13'),
(2, 'asd', '444', 1414, '1414', '15545'),
(3, 'sdfsdff', 'uyu6', 45, '566', '555');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariosdesistema`
--

CREATE TABLE `usuariosdesistema` (
  `id` int(11) NOT NULL,
  `nombreDeUsuario` varchar(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `telefono` decimal(15,0) NOT NULL,
  `password` varchar(70) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuariosdesistema`
--

INSERT INTO `usuariosdesistema` (`id`, `nombreDeUsuario`, `nombre`, `apellido`, `telefono`, `password`, `email`) VALUES
(1, 'matias', 'Matias', 'Santa Cruz', '3498474547', '2d934b0d13238aa287149d4c3c4224308a75968958f6f9c96c37fb056c1b9b09', 'matias.santa.cruz.96@gmail.com'),
(2, 'daianam', 'Daiana', 'Mandrille', '3491587410', 'B4CA3A29535F0FFE7150E01F71F8D242D707DD243B6D3FF2BE06DD615648AE67', 'daimandrille@gmail.com'),
(3, 'grossoc', 'Claudio', 'Grosso', '3498443127', '94B4395D0900ED546FA36D2E77C4048117551CD518D37D884C451A36A66D18ED', 'lu4fxi@gmail.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bibliografia`
--
ALTER TABLE `bibliografia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categoriacdu`
--
ALTER TABLE `categoriacdu`
  ADD PRIMARY KEY (`numeromateria`);

--
-- Indices de la tabla `materiacdu`
--
ALTER TABLE `materiacdu`
  ADD PRIMARY KEY (`numeromateria`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuariofinal`
--
ALTER TABLE `usuariofinal`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuariosdesistema`
--
ALTER TABLE `usuariosdesistema`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bibliografia`
--
ALTER TABLE `bibliografia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuariofinal`
--
ALTER TABLE `usuariofinal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuariosdesistema`
--
ALTER TABLE `usuariosdesistema`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
