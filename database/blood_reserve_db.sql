-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2023 at 02:27 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blood_reserve_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrators`
--

CREATE TABLE `administrators` (
  `id` int(11) NOT NULL,
  `level` int(1) NOT NULL COMMENT '0=super admin, 1=bank admin',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_id` int(11) UNSIGNED DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(1) NOT NULL COMMENT '0=disabled, 1=enabled',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `administrator_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `status` int(1) NOT NULL COMMENT '0=disabled, 1=enabled',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL,
  `administrator_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `name`, `logo`, `email`, `contact`, `latitude`, `longitude`, `status`, `created_at`, `updated_at`, `administrator_id`) VALUES
(1, 'Quezon Medical Center', '63bc0a7529f38.png', 'quezon.medicalcenter@yahoo.com.ph', '042 717 6323', '13.942185371329694', '121.61246716976166', 1, '2023-01-09 12:37:09', '2023-01-09 12:37:09', '1'),
(2, 'Blood Bank 1', '63bc102ecd7fb.png', 'bloodbank2@gmail.com', '09123456789', '14.026154622842565', '121.81850897266717', 1, '2023-01-09 13:01:34', '2023-01-09 13:01:34', '1');

-- --------------------------------------------------------

--
-- Table structure for table `donors`
--

CREATE TABLE `donors` (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `type_id` varchar(255) NOT NULL,
  `donor_name` text NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `municipality_id` varchar(255) NOT NULL,
  `bank_id` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL,
  `administrator_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `donors`
--

INSERT INTO `donors` (`id`, `type_id`, `donor_name`, `address`, `contact`, `municipality_id`, `bank_id`, `created_at`, `updated_at`, `administrator_id`) VALUES
(00000000001, '1', 'ABANILLA, NICHEL P.', 'Brgy. Silangang Maligaya, Agdangan, Quezon', '9300664011', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000002, '5', 'ABELLANOSA, PRINCESS R.', 'Brgy. Poblacion 2, Agdangan, Quezon', '9225182826', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000003, '3', 'AGARIN, ZANDRO F.', 'Sitio Pantay 2, Brgy. Kanlurang Maligaya, Agdangan, Quezon', '9063531707', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000004, '3', 'AGARIN, WILLIAM R.', 'Brgy. Silangan Maligaya, Agdangan, Quezon', '9092072313', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000005, '7', 'AGBANLOG, GEROME P.', 'Brgy. Silangan Maligaya, Agdangan, Quezon', '9216814264', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000006, '1', 'AGUILA, ROGER A.', 'Brgy. Silangang Maligaya, Agdangan, Quezon', '9104103349', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000007, '5', 'AGUILAR, EMMANUEL V.', 'Brgy. Kanlurang Kalutan, Agdangan, Quezon', '9500815001', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000008, '5', 'AGUILAR, FERDINAND C.', 'Brgy. Poblacion 2, Agdangan, Quezon', '9186891200', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000009, '5', 'AGUILAR, NORIETO R.', 'Brgy. Poblacion 2, Agdangan, Quezon', '9109036750', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000010, '5', 'ALCANTARA, RODELIO G.', 'Brgy. , Agdangan, Quezon', '9109036750', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000011, '3', 'ALCANTARA, YURI CZAR H.', 'Brgy. Poblacion 1, Agdangan, Quezon', '9174790825', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000012, '7', 'ALPUERTO, ADRIAN H.', 'Brgy. Poblacion I, Agdangan, Quezon', '9306764447', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000013, '3', 'ALPUERTO, MELEJA Z.', 'Brgy. Poblacion 1, Agdangan, Quezon', '9089759598', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000014, '1', 'ALVAREZ, REYNANTE A.', 'BRGY. POBLACION, Agdangan, Quezon', '9126157012', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000015, '5', 'AMPARO, LUCIO G.', 'Brgy. Salvacion, Agdangan, Quezon', '9480923050', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000016, '7', 'AMPARO, KENN DAREN L.', 'Brgy. Poblacion, Agdangan, Quezon', '9561794015', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000017, '3', 'ANDA, KRIS MARREL A.', 'Brgy. Poblacion 2, Agdangan, Quezon', '9994899792', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000018, '1', 'ANDALIS, KRISTINE JOY G.', 'Brgy. Poblacion 2, Agdangan, Quezon', '930976991', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000019, '1', 'ANIEL, JULYCESS E.', 'Brgy. Binagbag, Agdangan, Quezon', '9357237832', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000020, '1', 'ANYAYAHAN, SHIERMAY G.', 'Brgy. Salvacion, Agdangan, Quezon', '9286387736', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000021, '5', 'AQUINO, JOEMAR M.', 'Brgy. Poblacion 2, Agdangan, Quezon', '9097555146', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000022, '5', 'AQUINO, JOHN RIC B.', 'Brgy. Silangan Maligaya, Agdangan, Quezon', '9289819786', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000023, '3', 'ARANDIA, JOHN LEO R.', 'Brgy. Silangan Calutan, Agdangan, Quezon', '9096973492', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000024, '7', 'ARANDIA, RENIEL N.', 'Brgy. Silangan Calutan, Agdangan, Quezon', '9501925455', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000025, '1', 'ARANDIA, LARRY D.', 'Brgy. Silangan Calutan, Agdangan, Quezon', '9466011962', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000026, '1', 'AREVALO, ARIEL L.', 'Brgy. Ibabang Kinagunan, Agdangan, Quezon', '9109036750', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000027, '1', 'ASILO, RONALDO P.', 'Brgy. Sildora, Agdangan, Quezon', '9186328839', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000028, '5', 'AUMENTADO, MELODY T.', 'Brgy. Ibabang Kinagunan, Agdangan, Quezon', '9300443444', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000029, '1', 'AYALA, NELSON M.', 'Brgy. Poblacion 2, Agdangan, Quezon', '9109036750', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000030, '5', 'BALANE, RAYMARK L.', 'BRGY. BINGBAG, Agdangan, Quezon', '9338677150', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000031, '1', 'BALTAZAR, NEIL CHRISON R.', 'Brgy. Poblacion I, Agdangan, Quezon', '9432120258', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000032, '3', 'BARREDA, ARTURO G.', 'Brgy. Ibabang Kinagunan, Agdangan, Quezon', '9109036750', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000033, '5', 'BARTOLOME, DENNY DEE P.', 'Brgy. Poblacion 1, Agdangan, Quezon', '9070826123', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000034, '3', 'BICO, PORFERIO S.', 'Brgy. Poblacion, Agdangan, Quezon', '9465536462', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000035, '5', 'BLANCO, SARAH MAE E.', 'Brgy. Poblacion 1, Agdangan, Quezon', '9269051953', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000036, '5', 'BUENDIA, DONALD MANUEL Z.', 'Brgy. Salvacion, Agdangan, Quezon', '9121799300', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000037, '1', 'BUENDIA, LOLITA B.', 'Brgy. Salvacion, Agdangan, Quezon', '9163928140', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000038, '5', 'BUENDIA, CALIXTO A.', 'Brgy. Binagbag, Agdangan, Quezon', '9121842767', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000039, '1', 'BUENDIA, JAYSON I.', 'Brgy. Binagbag, Agdangan, Quezon', '9079502554', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000040, '5', 'BUNDE, SOFRANIA G.', 'Brgy. Ibabang Kinaguman, Agdangan, Quezon', '9070404616', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000041, '5', 'CABILTES, JOHN KARL P.', 'Brgy. Poblacion 2, Agdangan, Quezon', '907081767', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000042, '1', 'CAEG, JOSE S.', 'BRGY. BINAGBAG, Agdangan, Quezon', '9109036750', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000043, '5', 'CAIG, SARAH P.', 'Brgty. Biragbay, Agdangan, Quezon', '9095302850', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000044, '3', 'CALIWARA, JOHN RONALD J.', 'Brgy. Poblacion 2, Agdangan, Quezon', '9321224525', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000045, '5', 'CASTILLO, MARLYN U.', 'Brgy. Santa Ana Poblacion 1, Agdangan, Quezon', '9489954145', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000046, '7', 'CLAVERIA, ELENA B.', 'Brgy. Binagbag, Agdangan, Quezon', '9104219037', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000047, '1', 'CLAVERIA, ARVIN B.', 'Brgy. Binagbag, Agdangan, Quezon', '9497164438', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000048, '1', 'CONSTANTINO, RENIEL N.', 'Brgy. Kanlurang Calutan, Agdangan, Quezon', '9078280565', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000049, '3', 'CONVENCIDO, FRANCIS D.', 'Brgy. Poblacion, Agdangan, Quezon', '9751087397', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000050, '3', 'CONVENCIDO, LAIZA D.', 'Brgy. Poblacion 2, Agdangan, Quezon', '9369040346', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000051, '7', 'CRISTOBAL, KISHA B.', 'Brgy. Poblacion 2, Agdangan, Quezon', '92231249096', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000052, '3', 'CRUZAT, RONEL D.', 'Brgy. Ilayang Kinagunan, Agdangan, Quezon', '9208841452', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000053, '1', 'CUETO, LUISITO M.', 'BRGY. BINAGBAG, Agdangan, Quezon', '9192207985', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000054, '5', 'CUSTODIO, RECHELLA F.', 'Brgy. Binagbag, Agdangan, Quezon', '9466011563', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000055, '3', 'CUSTODIO, JOHN MILES A.', 'Brgy. Ibabang Kinagunan, Agdangan, Quezon', '9092549909', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000056, '3', 'DE MESA, JEWISH P.', 'Unspecified, Agdangan, Quezon', '9109036750', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000057, '1', 'DE BORJA, AILENE C.', 'Brgy. Silangang Maligaya, Agdangan, Quezon', '9109036750', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000058, '3', 'DE MESA, EROA R.', 'Brgy. Ilayang Kinagunan, Agdangan, Quezon', '9473565387', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000059, '5', 'DE MESA, NESLON P.', 'Unspecified, Agdangan, Quezon', '9084363980', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000060, '5', 'DE MESA, GERRY R.', 'Brgy. Kanluran Calutan, Agdangan, Quezon', '9301707431', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000061, '3', 'DE MESA, ANGELITA D.', 'Brgy. Ilaya Kinagunan, Agdangan, Quezon', '9487589524', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000062, '5', 'DE MESA, JOHN CARLO L.', 'Brgy. Kanlurang Calutan, Agdangan, Quezon', '9109036750', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000063, '3', 'DEL ROSARIO, JOHN PAUL R.', 'Brgy. Salvacion, Agdangan, Quezon', '9109036750', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000064, '5', 'DELOS SANTOS, NELSON .', 'Brgy. Silangang Maligaya, Agdangan, Quezon', '9109036750', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000065, '1', 'DEOCAREZA, CARMELO R.', 'Brgy. Silangang Kalutan, Agdangan, Quezon', '9382545295', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000066, '1', 'DESALISA, ALMAR M.', 'Brgy. Binagbag, Agdangan, Quezon', '9479390084', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000067, '5', 'DIOCAREZA, JOHN CHRISTIAN D.', 'Brgy. Calutan, Agdangan, Quezon', '9199300481', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000068, '5', 'DISTRITO, RONALD O.', 'Sitio Punturan, Brgy. Kanlurang Calutan, Agdangan, Quezon', '9109036750', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000069, '1', 'DITCHOSO, LEILA Q.', 'Brgy. Poblacion 1, Agdangan, Quezon', '9489954145', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000070, '1', 'ECAL, VICTOR P.', 'Brgy. Sildora, Agdangan, Quezon', '9307441423', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000071, '3', 'EREVILLE, ANGELO F.', 'Brgy. Ilaya Kinagunan, Agdangan, Quezon', '946677707', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000072, '5', 'EREVILLE, ARMIL H.', 'Brgy. Ilaya Kinagunan, Agdangan, Quezon', '9474243203', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000073, '1', 'EROA, ROBERT D.', 'Brgy. Ilayang Kinagunan, Agdangan, Quezon', '9121759343', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000074, '3', 'ESTRADA, CATALINA C.', 'Brgy. Salvacion, Agdangan, Quezon', '9504349997', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000075, '1', 'ESTRADA, ELPIDIO A.', 'Brgy. Salvacion, Agdangan, Quezon', '989911858', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000076, '1', 'ESTRADA, RICKY N.', 'Brgy. Poblacion 2, Agdangan, Quezon', '9496327250', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000077, '5', 'FUENTES, JERIC O.', 'Brgy. Poblacion 2, Agdangan, Quezon', '9389651100', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000078, '3', 'GABOG, MELKENS M.', 'Brgy. Binagbag, Agdangan, Quezon', '9260515011', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000079, '3', 'GABOG, NELGIN M.', 'Brgy. Binagbag, Agdangan, Quezon', '9308199477', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000080, '5', 'GARCIA, DARILL A.', 'Brgy. Silangang Maligaya, Agdangan, Quezon', '9483216494', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000081, '5', 'GARCIA, MARK RYDELL A.', 'Brgy. Poblacion 1, Agdangan, Quezon', '9120361756', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000082, '5', 'GARCIA, SALOMON A.', 'Brgy. Poblacion 1, Agdangan, Quezon', '9167773554', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000083, '3', 'GARCIA, JR., DANTE A.', 'Unspecified, Agdangan, Quezon', '9361860255', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000084, '1', 'GARES, MARY GRACE P.', 'Brgy. Binagbag, Agdangan, Quezon', '9272220422', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000085, '5', 'GARIN, CHURGIL CALEB A.', 'Brgy. Poblacion 2, Agdangan, Quezon', '9169669783', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000086, '7', 'GENES, VICTORIA Z.', 'Brgy. Poblacion 2 , Agdangan, Quezon', '9074424828', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000087, '7', 'GINES, VICTORIA Z.', 'Brgy. Poblacion 2, Agdangan, Quezon', '907424828', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000088, '7', 'GIRES, VICTORIA Z.', 'Brgy. Poblacion 2, Agdangan, Quezon', '9097424828', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000089, '5', 'GONZALES, MARK JOSEPH L.', 'BRGY. POBLACION 2 , Agdangan, Quezon', '9392016346', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000090, '1', 'HERNANDEZ, CHRISTOPHER C.', 'BRGY. POBLACION 1, Agdangan, Quezon', '9072396967', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000091, '3', 'HERRERO, JR., ROGER D.', 'Brgy. Poblacion I, Agdangan, Quezon', '9502518114', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000092, '5', 'HURAÑO, ANGELITO P.', 'Brgy. Ibabang Kinagunan, Agdangan, Quezon', '9466695768', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000093, '5', 'JUSI, ARMEL G.', 'Brgy. Salvacion, Agdangan, Quezon', '9307516224', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000094, '1', 'JUSI, PEPETO P.', 'Brgy. Salvacion, Agdangan, Quezon', '9109036750', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000095, '5', 'JUSI, ORLAN E.', 'Brgy. Binagbag, Agdangan, Quezon', '9105172875', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000096, '5', 'JUSI, CARLO M.', 'Brgy. Salvacion, Agdangan, Quezon', '9306919776', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000097, '1', 'LACDAO, CARMEN A.', 'Brgy. Dayap, Agdangan, Quezon', '9075479453', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000098, '5', 'LANCION, EDILBERTO M.', 'Brgy. Poblacion 1, Agdangan, Quezon', '9391325702', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000099, '1', 'LANCION, JONICA D.', 'Brgy. Poblacion 1, Agdangan, Quezon', '9167511589', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000100, '1', 'LANUZO, BENEDICT G.', 'Brgy. Kanluran Calutan, Agdangan, Quezon', '9753032836', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000101, '5', 'LAUREZ, JIMMY R.', 'Brgy. Kanlurang Calutan, Agdangan, Quezon', '9109036750', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000102, '5', 'LAZO, HENRY E.', 'Brgy. Kanlurang Maligaya, Agdangan, Quezon', '9127523820', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000103, '3', 'LEBETANIA, LONALLY F.', 'BRGY. BINAGBAG, Agdangan, Quezon', '9352121362', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000104, '1', 'LILLO, ROMIL P.', 'Brgy. Ibabang Kinagunan, Agdangan, Quezon', '9109036750', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000105, '3', 'LLAGAS, ROSSEL S.', 'Brgy. Silangan Calutan, Agdangan, Quezon', '9215489578', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000106, '5', 'LLARENA, ENONE P.', 'Brgy. Sildora, Agdangan, Quezon', '9302986531', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000107, '5', 'LLORICA, MARION L.', 'Brgy. Salvador, Agdangan, Quezon', '9109036750', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000108, '5', 'LOURDES, LILIBETH O.', 'Brgy. Dayap, Agdangan, Quezon', '9123238827', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000109, '5', 'LOZANO, MARLON .', 'Brgy. Silangan Calutan, Agdangan, Quezon', '9613900556', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000110, '5', 'LUAREZ, JIMMY R.', 'Brgy. Kanlurang Calutan, Agdangan, Quezon', '9109036750', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000111, '5', 'LUCERO, AMANDO C.', 'Brgy. Ilayang Kinaguran, Agdangan, Quezon', '9106288862', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000112, '5', 'MAGBOO, RODEL E.', 'Brgy. Salvacion, Agdangan, Quezon', '9153700687', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000113, '5', 'MAGNO, RONELIZA .', 'Brgy. Ibabang Kinagunan, Agdangan, Quezon', '9091481976', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000114, '5', 'MALIGAYA, LEMUEL P.', 'Brgy. Silangan Maligaya, Agdangan, Quezon', '9309158694', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000115, '5', 'MANZANO, ROWENA B.', 'Brgy. Poblacion, Agdangan, Quezon', '9286863921', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000116, '3', 'MAPAYE, GOMER C.', 'Brgy. Poblacion 2, Agdangan, Quezon', '9109036750', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000117, '1', 'MAPAYE, JOEL L.', 'Brgy. Poblacion 1, Agdangan, Quezon', '9183813380', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000118, '5', 'MARASIGAN, CHARITO C.', 'Brgy. Sibungan Calutan, Agdangan, Quezon', '9106716638', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000119, '5', 'MENDOZA, EVELYN A.', 'Brgy. Silangan Maligaya, Agdangan, Quezon', '9104480635', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000120, '1', 'MENDOZA, CHRISTOPHER M.', 'Brgy. Sildora, Agdangan, Quezon', '9488696100', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000121, '5', 'MENDOZA, FORTUNATA M.', 'Brgy. Selduva, Agdangan, Quezon', '9129990435', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000122, '1', 'MERCADEJAS, DEANA DEN S.', 'Brgy. Ibaba Kinagunan, Agdangan, Quezon', '9099338618', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000123, '5', 'MERLE, ARNOLD M.', 'Brgy. Poblacion 2, Agdangan, Quezon', '90218056164', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000124, '5', 'MOLINA, JEREMY F.', 'Brgy. Poblacion 2, Agdangan, Quezon', '995637965', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000125, '3', 'MONTANEZ, FELIPA D.', 'Brgy. Poblacion I, Agdangan, Quezon', '9218070864', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000126, '1', 'MONTIERO, LYN A.', 'BRGY. POBLACION 1, Agdangan, Quezon', '9970956658', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000127, '1', 'MORSIQUILLO, DENNIS P.', 'Brgy. Poblacion 2, Agdangan, Quezon', '9109036750', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000128, '3', 'MURILLO, PETER D.', 'Brgy. Silangan Calutan, Agdangan, Quezon', '94647746158', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000129, '5', 'NATURA, JHON MELMAR P.', 'Brgy. Poblacion 2, Agdangan, Quezon', '9075175885', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000130, '5', 'NAVAL, ALADINO M.', 'Brgy. Binagbag, Agdangan, Quezon', '9198602257', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000131, '1', 'OBAÑA, JEFFREY P.', 'Brgy. Salvacion, Agdangan, Quezon', '9304007050', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000132, '1', 'OBAÑA, ELIZABETH P.', 'Brgy. Salvacion, Agdangan, Quezon', '9493301151', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000133, '1', 'OBAÑA, DARWIN P.', 'Brgy. Salvacion, Agdangan, Quezon', '9997920017', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000134, '3', 'OGMA, KAMIL P.', 'Brgy. Silangang Maligaya, Agdangan, Quezon', '9473203780', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000135, '1', 'OLA, ALVIN P.', 'Brgy. Ilayang Kinagunan, Agdangan, Quezon', '9104480624', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000136, '5', 'ORTIZ, VINCENT A.', 'Brgy. Poblacion, Agdangan, Quezon', '9455291687', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000137, '5', 'PABINO, REYNANTE D.', 'Brgy. Kanlurang Caluan, Agdangan, Quezon', '9105168372', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000138, '5', 'PABINO, RICARDO D.', 'Brgy. Kanlurang Calutan, Agdangan, Quezon', '9277318958', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000139, '5', 'PABINO, RENEBOY D.', 'Sitio Punturan, Brgy. Kanlurang Calutan, Agdangan, Quezon', '9109036750', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000140, '5', 'PAJES, MICHELLE M.', 'Brgy. Salvacion, Agdangan, Quezon', '9091109885', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000141, '5', 'PAREJA, ERLITA P.', 'Brgy. Ibabang Kinagunan, Agdangan, Quezon', '9288014950', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000142, '1', 'PATOK, MARLON G.', 'Brgy. Kanluaran, Agdangan, Quezon', '9109036750', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000143, '5', 'PATOK, JESSELE B.', 'Brgy. Kanlurang Calutan, Agdangan, Quezon', '905956397', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000144, '5', 'PAULY, EDCEL L.', 'Brgy. Poblacion 2, Agdangan, Quezon', '9070826135', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000145, '5', 'PAVINO, RENEL D.', 'Brgy. Kanlurang Calutan, Agdangan, Quezon', '9097310625', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000146, '3', 'PEÑAREDONDA, MICHIEL S.', 'Brgy. Sildora, Agdangan, Quezon', '9212288012', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000147, '1', 'PEDRYZUELA, BRYAN D.', 'Brgy. Sildora, Agdangan, Quezon', '9485408216', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000148, '5', 'PELINGON, JOSEPH R.', 'Brgy. Salvacion, Agdangan, Quezon', '9486164392', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000149, '5', 'PERLAS, KINS JHAN S.', 'Brgy. Kinagunan Haaba, Agdangan, Quezon', '9109036750', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000150, '3', 'PIRAL, GLORIA B.', 'Brgy. Silangan Maligaya, Agdangan, Quezon', '9109036750', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000151, '3', 'PIZARRO, RANDY R.', 'Brgy. Poblacion 2, Agdangan, Quezon', '9075318363', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000152, '5', 'POBEDA, MEDEL P.', 'Brgy. Kanlurang Calutan, Agdangan, Quezon', '9484850272', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000153, '5', 'PORTES, EFREN D.', 'Brgy. Silangan Calutan, Agdangan, Quezon', '9109036750', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000154, '3', 'PRINCIPE, JOEL P.', 'Brgy. Poblacion 2, Agdangan, Quezon', '9215583594', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000155, '1', 'PUEBLO, GLOVEL D.', 'Brgy. Kanlurang Calutan, Agdangan, Quezon', '9369701269', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000156, '5', 'PUNAY, ROZEL A.', 'Brgy. Poblacion 2, Agdangan, Quezon', '9065401519', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000157, '5', 'QUINABATO, RYAN CHRISTIAN B.', 'Unspecified, Agdangan, Quezon', '9123967615', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000158, '5', 'QUINCENA, JONATHAN A.', 'Brgy. Ibabang Kinagunan, Agdangan, Quezon', '9502522232', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000159, '1', 'RANCE, LUNINGNING D.', 'Brgy. Binabag, Agdangan, Quezon', '9998715839', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000160, '3', 'RAYMUNDODIA, JUAN PAULO A.', 'Brgy. Salvacion, Agdangan, Quezon', '9754300068', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000161, '1', 'REFORMA, JIMMEZEL P.', 'Brgy. Poblacion 1, Agdangan, Quezon', '9095813390', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000162, '3', 'REFORMA, KENNETH A.', 'Unspecified, Agdangan, Quezon', '9093719591', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000163, '1', 'REGALARIO, MARIO I.', 'Brgy. Ilayang Kinagunan, Agdangan, Quezon', '9109036750', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000164, '1', 'REGENCIA, MA. RIZZE P.', 'Brgy. Poblacion 2, Agdangan, Quezon', '9472050260', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000165, '1', 'REGIO, JOMER E.', 'Binagbag, Agdangan, Quezon', '9079899697', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000166, '1', 'RENDIZA, CHRISTIAN JOHNRENZ J.', 'Brgy. Ibaba Kinagunan, Agdangan, Quezon', '9070723465', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000167, '3', 'RIEGO, DELIA A.', 'Brgy. Salvacion, Agdangan, Quezon', '9125284542', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000168, '1', 'RIEGO, MELINDA E.', 'Brgy. Sildora, Agdangan, Quezon', '9212497277', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000169, '3', 'RIEGO, JR., BOYET C.', 'Brgy. Sieldona, Agdangan, Quezon', '9109036750', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000170, '3', 'RIOS, RENALYN C.', 'Brgy. Poblacion 2, Agdangan, Quezon', '9277685892', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000171, '3', 'RODIL, MARIANITA A.', 'Brgy. Sildora, Agdangan, Quezon', '9302906173', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000172, '7', 'ROSAL, JOSE RONAN A.', 'Brgy. Kanlurang Calutan, Agdangan, Quezon', '9091075561', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000173, '3', 'ROSARIO, JOHN PAUL R.', 'Brgy. Salvacion, Agdangan, Quezon', '9102902319', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000174, '5', 'ROSAS, GLEN CARLO P.', 'Brgy. Poblacion II, Agdangan, Quezon', '9109036750', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000175, '1', 'RUBIA, EMMANUEL O.', 'Brgy. Cidora, Agdangan, Quezon', '9109036750', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000176, '7', 'RUELOS, BRYAN C.', 'Brgy. Kinalgunon Ibaba, Agdangan, Quezon', '9109036750', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000177, '3', 'SALVADOR, RODELIO M.', 'Brgy. Silangan Calutan, Agdangan, Quezon', '9071975899', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000178, '1', 'SALVANIA, RAY JOSEPH Q.', 'Brgy. Poblacion 1, Agdangan, Quezon', '9499307916', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000179, '3', 'SALVATIERRA, MAXIMO H.', 'Brgy. Poblacion, Agdangan, Quezon', '9998839964', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000180, '7', 'TAMESIS, JENNIFER A.', 'Brgy. Ilayang Kinagunan, Agdangan, Quezon', '9383579658', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000181, '1', 'TAN, BEN C.', 'Brgy. Poblacion, Agdangan, Quezon', '9478815888', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000182, '5', 'TERADO, LORDAN G.', 'Brgy. Binagba, Agdangan, Quezon', '9109036750', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000183, '3', 'TINAMISAN, GERIC M.', 'Brgy. Poblacion 2, Agdangan, Quezon', '9079890874', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000184, '5', 'TOLENTINO, JOMER M.', 'BRGY. POBLACION 2, Agdangan, Quezon', '9309680990', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000185, '5', 'TRILLES, JOLLY U.', 'Brgy. Kanlurang Calutan, Agdangan, Quezon', '9979647934', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000186, '3', 'TUASOC, ALDRIAN R.', 'Brgy. Sildora, Agdangan, Quezon', '9262731772', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000187, '5', 'VALLE, MARVIN A.', 'Brgy. Poblacion 2, Agdangan, Quezon', '9453146452', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000188, '3', 'VELARDE, RUBEN V.', 'Brgy. Kanlurang Maligaya, Agdangan, Quezon', '9485173580', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000189, '3', 'VELARDE, JR., BUENAVENTURA P.', 'Brgy. Kanluran Maligaya, Agdangan, Quezon', '9109036750', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000190, '5', 'VELASQUEZ, HAROLD .', 'Brgy. Ibabaang Kinagunan, Agdangan, Quezon', '9972999748', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000191, '1', 'VERASTIGUE, RIX M.', 'Brgy. Kanlurang Maligaya, Agdangan, Quezon', '9093409839', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000192, '5', 'VERASTIGUE, DINA O.', 'Brgy. Kanlurang Maligaya, Agdangan, Quezon', '9074464106', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000193, '5', 'VILLACRUEL, MARKK JULIUS M.', 'Brgy. Poblacion 1, Agdangan, Quezon', '9173734076', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000194, '3', 'VILLACRUEL, JOHNVER L.', 'Brgy. Poblacion, Agdangan, Quezon', '9099429394', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000195, '1', 'VILLAMIN, EDUARDO D.', 'Brgy. Silangan Calutan, Agdangan, Quezon', '9087691903', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000196, '5', 'VILLARMEA, EDITHA A.', 'Brgy. Binagbag, Agdangan, Quezon', '9126416883', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000197, '5', 'VILLARUEL, REYSEN E.', 'Brgy. Ilayang Kinagunan, Agdangan, Quezon', '9060214197', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000198, '3', 'VILLARUEL, MARIO P.', 'Brgy. Kanlurang Kalutan, Agdangan, Quezon', '9397874040', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000199, '5', 'VILLARUEL, JUN-JUN L.', 'Brgy. Poblacion 2, Agdangan, Quezon', '9501045667', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000200, '5', 'VIRASTIGUE, CESAR P.', 'Brgy. Kanlurang Maligaya, Agdangan, Quezon', '9109036750', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000201, '5', 'ZABALLERO, MARIA CIELO L.', 'Unspecified, Agdangan, Quezon', '9465740606', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000202, '5', 'ZAMORA, JOEY A.', 'Brgy. Binagbag, Agdangan, Quezon', '9389446655', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000203, '5', 'ZAMORA, RENEBOY O.', 'Brgy. Binagbag, Agdangan, Quezon', '9122822181', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000204, '5', 'ZARA, LILIBETH G.', 'Brgy. Poblacion 2, Agdangan, Quezon', '9109036750', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000205, '5', 'ZARA, WILMAR B.', 'Brgy. Salvacion, Agdangan, Quezon', '9109036750', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000206, '5', 'ZOLETA, ALVIN L.', 'Brgy. Salvacion, Agdangan, Quezon', '9109036750', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000207, '1', 'ZOLETA, ROLLY C.', 'Brgy. Sildora, Agdangan, Quezon', '9464854545', '2', '2', '2023-01-09 13:02:43', '2023-01-09 13:02:43', '8'),
(00000000208, '5', 'ABAD, ELMER T.', 'Brgy. Tagbakin, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000209, '5', 'ABANTE, ELIZA M.', 'Brgy. Lubi, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000210, '5', 'ABANTE, CRISTINA L.', 'Brgy. Kilait, Atimonan, Quezon', '9306223264', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000211, '7', 'ABIA, MACARIO C.', 'Brgy. Labi, Atimonan, Quezon', '9462325921', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000212, '1', 'ACUÑA, RICARDO C.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000213, '1', 'ACUÑA, EDGARDO C.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000214, '5', 'ACUÑA, ARVEN A.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000215, '5', 'ACUÑA, HELEN D.', 'PUROK BARABA, BRGY. CARIDAD IBABA, Atimonan, Quezon', '9072159752', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000216, '3', 'ACUÑA, ISIDRO A.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9392299695', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000217, '5', 'ACUÑA, EDWARD D.', 'Brgy. Caridad Ibaba, Atimonan, Quezon', '9483987047', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000218, '5', 'ADAN, LUISITO Q.', 'Brgy. Mal. Ibaba, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000219, '5', 'ADARLO, JUNE ARMEL Q.', 'Brgy. San Rafael, Atimonan, Quezon', '9771350466', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000220, '3', 'ADAYA, ABEGAIL M.', 'Brgy. Habingan, Atimonan, Quezon', '9473412627', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000221, '1', 'ADAYA, RODNEY C.', 'Brgy. San Andres Labak, Atimonan, Quezon', '9663866081', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000222, '3', 'ADAYA, CORAZON E.', 'Purok 6, Brgy. Ponon, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000223, '3', 'AGCAOILI, MARCELINO D.', 'Brgy. Lubi, Atimonan, Quezon', '9974173364', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000224, '5', 'AGUHO, REYNALDO S.', 'Brgy. Talaba, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000225, '1', 'AGUIFLOR, JONA R.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9122636583', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000226, '1', 'AGUIFLOR, NORA R.', 'Brgy. Caridad Ibaba, Atimonan, Quezon', '9301903274', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000227, '5', 'AGUILAR, ROY JOSEPH A.', 'Brgy. Caridad Ibaba, Atimonan, Quezon', '9298933650', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000228, '5', 'AGUILAR, KENNETH LYNDON G.', 'Brgy. Balubad, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000229, '5', 'AGUILAR, RIZALITO R.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9121922012', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000230, '7', 'AGUILAR, RICHARD R.', 'Brgy. Zone 1, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000231, '1', 'AGUILAR, LEO ANGELO C.', 'Brgy. Lubi, Atimonan, Quezon', '9174285490', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000232, '1', 'AGUILAR, GIAR KENNETH G.', 'BRGY. TAGBAKIN, Atimonan, Quezon', '9207073077', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000233, '3', 'AGUILAR, GLENN B.', 'Brgy. Balubal, Atimonan, Quezon', '9298486136', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000234, '5', 'AGUILAR, JOHANNA MAE T.', 'QUEZON STREET, Atimonan, Quezon', '9177248472', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000235, '1', 'AGUILAR, II, NOEL A.', 'Brgy. Malinao Ilaya, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000236, '5', 'AGULTO, ABEGAIL A.', 'Brgy. Manggalayan Labak, Atimonan, Quezon', '9389879185', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000237, '1', 'ALBANTO, OLOREZ D.', 'Brgy. Zone I, Atimonan, Quezon', '9079164167', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000238, '5', 'ALCARAZ, LUZVIMINDA T.', 'Brgy. Buhangin, Atimonan, Quezon', '9566055448', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000239, '1', 'ALCAYDE, JR., JOHN MANUEL C.', 'BRGY. , Atimonan, Quezon', '9062820568', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000240, '3', 'ALCOY, MARY ANN D.', 'Brgy. Tagbakin, Atimonan, Quezon', '9123483671', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000241, '1', 'ALDEA, CHRSTIAN JAY .', 'Brgy. Zone 2, Atimonan, Quezon', '9158193914', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000242, '5', 'ALEGRE, BELLY L.', 'Brgy. Tagbakin, Atimonan, Quezon', '9108223665', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000243, '7', 'ALEGRE, NORMAN U.', 'Brgy. Lubi, Atimonan, Quezon', '9095408049', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000244, '1', 'ALEGRE, EDBERT V.', 'Brgy. Lakip, Atimonan, Quezon', '97101832292', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000245, '5', 'ALEGRE, AMADO Q.', 'Brgy. Zone 4, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000246, '5', 'ALMACHA, MARIANNE JOY D.', 'Brgy. Manggalayan Labak, Atimonan, Quezon', '9128382604', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000247, '3', 'ALMAGRO, ALDWIN M.', 'Brgy. San Isidro, Atimonan, Quezon', '9073740245', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000248, '3', 'ALMARIO, ALLAN M.', 'Brgy. Malusak, Atimonan, Quezon', '9072404035', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000249, '3', 'ALMEYDA, ELEONOR E.', 'Brgy. Lumutan, Atimonan, Quezon', '9484443722', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000250, '3', 'ALMEYDA, AL-ERICK R.', 'Brgy. Tagbakin, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000251, '7', 'ALMEYDA, ALBERT D.', 'Brgy. Tagbakin, Atimonan, Quezon', '9480835720', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000252, '5', 'ALMEYDA, EDREN JAY D.', 'Brgy. Poblacion Zone 2, Atimonan, Quezon', '9102694637', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000253, '5', 'ALMEYDA, DANTE R.', '1378 REGINO DIAZ STREET, BRGY. ZONE 3, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000254, '3', 'ALMOGUERA, MARICON A.', 'Brgy. Tagbakin, Atimonan, Quezon', '9489102547', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000255, '1', 'ALTAMIRA, RICARDO A.', 'Brgy. Zone 1, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000256, '5', 'ALTEA, RODERICK C.', 'BRGY. INALIG, Atimonan, Quezon', '9205682055', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000257, '7', 'ALTEA, DARWIN R.', 'Brgy. Lubi, Atimonan, Quezon', '9105544008', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000258, '5', 'ALTEA, REA A.', 'Brgy. Manggalayan, Atimonan, Quezon', '9099702248', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000259, '5', 'ALTEZ, SHARMEN R.', 'Brgy. Lubi, Atimonan, Quezon', '9485201332', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000260, '7', 'ALTEZ, IAN LEMUEL A.', 'BRGY. ZONE 4 POBLACION, Atimonan, Quezon', '9213652417', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000261, '1', 'ALVA, ANGELO V.', 'Brgy. Zone 2, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000262, '5', 'ALVA, LECATO B.', 'Brgy. Tagbakin, Atimonan, Quezon', '9185429817', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000263, '1', 'ALVA, JONATHAN T.', 'Brgy. Manggalayan Labak, Atimonan, Quezon', '9480009263', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000264, '1', 'ALVA, SHERWIN S.', 'Brgy. Zone 2, Atimonan, Quezon', '9093101192', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000265, '5', 'ALVA, LUCITO B.', 'BRGY. TAGBAKIN, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000266, '1', 'ALVA, JOEL RAY A.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9062974313', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000267, '3', 'ALVAREZ, PEDRO JAY C.', 'Brgy. Zone IV, Bagumbayan, Atimonan, Quezon', '9167022627', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000268, '1', 'ALVAREZ, ESTELLA A.', 'Brgy. Villa Ilaya, Atimonan, Quezon', '9091280386', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000269, '3', 'ALVAREZ, REN REN A.', 'Brgy. Habingan, Atimonan, Quezon', '9100027361', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000270, '3', 'ALVAREZ, VON EDGAR A.', 'Brgy. Lakip, Atimonan, Quezon', '9077268622', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000271, '3', 'ALVAREZ, JOSEPH I.', 'Brgy. Kulawit, Atimonan, Quezon', '9108029385', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000272, '5', 'ALVASAN, KHRISTINE V.', 'Brgy. Manggalasan Labak, Atimonan, Quezon', '9128076008', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000273, '3', 'ALZOLA, PRAHLAD P.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000274, '5', 'AMADO, ALMIRA Q.', 'Brgy. San Jose Balatok, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000275, '7', 'AMADO, MA. ELENA A.', 'Brgy. Malusak, Atimonan, Quezon', '9291195085', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000276, '5', 'AMADOR, RIALYN A.', 'Brgy. Tinandog, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000277, '7', 'AMALIAN, GERALD V.', 'Brgy. Tagbakin, Atimonan, Quezon', '9382533985', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000278, '1', 'AMANDY, RONALD L.', 'Brgy. San Rafael, Atimonan, Quezon', '9178424820', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000279, '5', 'AMANDY, MEL JAPHET B.', 'Brgy. Ponon, Atimonan, Quezon', '9475748914', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000280, '3', 'AMAZONA, JON-JON D.', 'Brgy. Buhangin, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000281, '3', 'AMBAS, RUEL A.', 'Brgy. Magsaysay, Atimonan, Quezon', '9287780854', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000282, '1', 'AMBE, JUDY B.', 'Brgy. Zone 2 Poblacion, Atimonan, Quezon', '9483256307', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000283, '7', 'AMBON, REX F.', 'Brgy. Villa Ibaba, Atimonan, Quezon', '9075670733', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000284, '5', 'AMERICA, ARMANDO L.', 'BRGY. MAHINAO ILAYA, Atimonan, Quezon', '9197064523', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000285, '7', 'AMORES, ARBEN JAIMARL V.', '1544 D. Ricafort Street, Brgy. Zone IV, Atimonan, Quezon', '92062708453', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000286, '1', 'AMORES, ADRIAN JOSEPH V.', '1544 Ricafort Street, Brgy. Zone IV, Atimonan, Quezon', '9487165253', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000287, '1', 'AMORES, ARNOLFO D.', 'BRGY. TINANDOG, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000288, '3', 'AMOSCO, CHRISTOPHER R.', 'Brgy. , Atimonan, Quezon', '9499668058', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000289, '1', 'AMPARO, RONILO L.', 'Brgy. Tagbakin, Atimonan, Quezon', '9073199815', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000290, '5', 'AMPARO, LAURO T.', 'Brgy. Buhangin, Atimonan, Quezon', '9469088627', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000291, '1', 'AMPARO, ANN MICHELLE D.', '709 DR. Ramon Soler Street, Atimonan, Quezon', '9771450532', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000292, '1', 'AMPARO, EDWIN E.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9500817141', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000293, '3', 'AMPARO, ALLAN A.', 'Brgy. Tagbakin, Atimonan, Quezon', '9485413043', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000294, '5', 'AMPARO, RENATO C.', 'Brgy. Labak, Atimonan, Quezon', '9293460093', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000295, '5', 'AMPARO, CRISTY .', 'Brgy. Manggalayan Labak, Atimonan, Quezon', '9978792132', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000296, '1', 'AMPARO, CHARLENE L.', 'Brgy. Zone 2, Atimonan, Quezon', '9300128896', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000297, '5', 'AMPARO, IMELDA T.', 'TAYUMAN 1, BRGY. BALUBAD, Atimonan, Quezon', '9070727183', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000298, '5', 'AMPARO, RUSSELL R.', 'Brgy. San Isidro, Atimonan, Quezon', '9094676590', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000299, '7', 'AMPARO, III, ANACLETO EUGENIO P.', 'Brgy. Zone 1, Atimonan, Quezon', '9157945143', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000300, '1', 'AMPER, JESTONI L.', 'B957 V. DE GRACIA STREEET, Atimonan, Quezon', '9086058878', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000301, '1', 'ANDA, LUCITA S.', 'Brgy. Manggalayan Labak, Atimonan, Quezon', '9066550600', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000302, '1', 'ANDA, MHYLA S.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9056972892', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000303, '1', 'ANDA, JEFF EVANDER M.', 'BRGY. TALABA, Atimonan, Quezon', '9508300496', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000304, '5', 'ANDA, RANDY A.', 'Brgy. Manggalang Labak, Atimonan, Quezon', '9309094451', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000305, '7', 'ANDA, ARJAY L.', 'Brgy. Lubi, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000306, '5', 'ANDA, MARK ANTHONY M.', 'Brgy. San Rafael, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000307, '1', 'ANDA, III, ANGEL LORENZ T.', 'Brgy. Zone 1, Atimonan, Quezon', '9239165689', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000308, '5', 'ANDAYA, MARWENLOU A.', 'Brgy. Malinao Ilaya, Atimonan, Quezon', '9073695783', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000309, '3', 'ANDAYA, ROSELYN L.', 'Brgy. San Isidro, Atimonan, Quezon', '910079176', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000310, '3', 'ANGARA, JOHN NIÑO G.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000311, '3', 'ANGELES, ROY P.', 'Brgy. San Isidro, Atimonan, Quezon', '9287870297', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000312, '5', 'ANGULO, BERNARDO R.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '950233866', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000313, '1', 'ANIEL, ROSALIA M.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9956915023', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000314, '5', 'ANOTCHE, MICHAEL B.', 'Brgy. Manggalang, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000315, '3', 'ANTONIO, MARICEL V.', 'Brgy. Rizal, Atimonan, Quezon', '9462053283', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000316, '5', 'ANUADA, FRANCISCO A.', 'Brgy. Malinao, Atimonan, Quezon', '9463268206', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000317, '5', 'ANYAYAHAN, MARVIN B.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000318, '1', 'ARANDELA, ALDRED L.', 'BRGY. SOKOL, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000319, '5', 'ARAYA, NOEL B.', 'PUROK 7, BRGY. HABINGAN, Atimonan, Quezon', '9481342107', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000320, '3', 'ARCHETA, JAN KARLO N.', 'Brgy. Poblacion Zone 4, Atimonan, Quezon', '97766676180', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000321, '1', 'AREGLADO, JOSELITO G.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6');
INSERT INTO `donors` (`id`, `type_id`, `donor_name`, `address`, `contact`, `municipality_id`, `bank_id`, `created_at`, `updated_at`, `administrator_id`) VALUES
(00000000322, '5', 'AREVALIO, ROBERTO L.', 'Brgy. Sakol, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000323, '5', 'AREVALO, ROBERTO L.', 'Brgy. Sokol, Atimonan, Quezon', '9395666764', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000324, '5', 'AREVALO, JAN JOSHUA L.', 'Brgy. Zone 3 Poblacion, Atimonan, Quezon', '9464786547', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000325, '3', 'AREVALO, ROMMEL O.', 'Brgy. Sapaan, Atimonan, Quezon', '9155474610', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000326, '1', 'AREVALO, MARIA LUISA T.', 'Brgy. Zone 4, Bagumbayan, Atimonan, Quezon', '9464688693', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000327, '5', 'ARIATE, MARY GRACE D.', 'Brgy. Manggalayan Labak, Atimonan, Quezon', '9090147485', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000328, '5', 'ARIVAL, ARNEL E.', 'Brgy. Angeles, Atimonan, Quezon', '9073204521', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000329, '3', 'ARLOS, LEONEL C.', 'Brgy. POBLACION Zone 4, Atimonan, Quezon', '9488891282', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000330, '5', 'ARRIOLA, JOSE C.', 'Brgy. San Isidro, Atimonan, Quezon', '9484943385', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000331, '1', 'ASEO, PRECIOSA A.', 'BRGY. TINANDOG, Atimonan, Quezon', '9127715560', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000332, '1', 'ASTO, JOVEN A.', 'BRGY. ZONE 2, Atimonan, Quezon', '9398623892', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000333, '1', 'AUMENTADO, MARC M.', 'Brgy. Zone 4, Atimonan, Quezon', '9484242816', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000334, '3', 'AUMENTADO, MIKKO ALLEN M.', 'Brgy. Zone 2, Atimonan, Quezon', '9292635035', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000335, '1', 'AURELIO , RONEL V.', 'BRGY. TAGBAKIN , Atimonan, Quezon', '9483178500', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000336, '5', 'AURELIS, ALBERTO A.', 'Brgy. Buhangin, Atimonan, Quezon', '9384121792', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000337, '1', 'AVELLANEDA, JEAN R.', 'BRGY. BUHANGIN, Atimonan, Quezon', '9482855137', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000338, '3', 'AVENILLA, ROLLAN P.', 'Brgy. Zone 3, Juez Andres Street, Atimonan, Quezon', '94106367479', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000339, '5', 'AVERION, SEVERINO F.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9502768884', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000340, '7', 'AVILA, AMELDA P.', 'Brgy. San Rafael, Atimonan, Quezon', '9215946951', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000341, '3', 'AVILA, EDWIN B.', 'Brgy. Lubi, Atimonan, Quezon', '9954621311', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000342, '5', 'AYNERA, JHON CARLO .', 'BRGY. ANGELES, Atimonan, Quezon', '9165875394', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000343, '5', 'AYOSO, ANTHONY Q.', '145 Brgy. Tagbakin, Atimonan, Quezon', '9079171555', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000344, '5', 'AYOSO, JOCELYN M.', 'Brgy. Malusak, Atimonan, Quezon', '9128720007', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000345, '5', 'BABAT, JULIETO M.', 'Brgy. San Isidro, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000346, '3', 'BACALA, VERNON A.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9399466920', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000347, '3', 'BACRAL, NONALYN B.', '042 Purok Taytay, Brgy. Tagbakin, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000348, '5', 'BAGUIO, ADORA B.', 'BRGY. BUHANGIN, Atimonan, Quezon', '9486448294', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000349, '3', 'BAIKKAH, NASRA V.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9301764069', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000350, '3', 'BALAGAT, RICHARD C.', 'BRGY. ZONE 4 POBLACION, Atimonan, Quezon', '9481912271', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000351, '1', 'BALAGTAS, SOLEDAD E.', 'Brgy. Tagbakin, Atimonan, Quezon', '9076596742', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000352, '3', 'BALAGTAS, MHYCHIEZOILA E.', 'Brgy. Tagbakin, Atimonan, Quezon', '9076596742', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000353, '1', 'BALANE, JOSEPH V.', 'Brgy. Rizal, Atimonan, Quezon', '94789624369', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000354, '1', 'BALDOZ, BERNIE F.', 'Brgy. Matanag, Atimonan, Quezon', '9305593230', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000355, '5', 'BALINILLO, MARY JOY I.', 'Brgy. Tagbakin, Atimonan, Quezon', '9293401485', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000356, '3', 'BALINSAYO, DITA C.', 'Brgy. Villa Ibaba, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000357, '1', 'BALITAAN, LARRY C.', 'Brgy. Zone 1, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000358, '1', 'BALITAON, RAMIL C.', 'Brgy. Zone 1, Atimonan, Quezon', '9124607108', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000359, '1', 'BALITAON, ALEXIS A.', 'Brgy. Zone 1, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000360, '1', 'BALITAON, LARRY C.', 'BRGY. BOULEVARD ZONE 1, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000361, '1', 'BALITAON, JESSIE JOHN M.', 'BRGY. ZONE 1, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000362, '5', 'BALOLOY, ALJHON R.', 'Brgy. Tagbakin, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000363, '5', 'BAMBICO, BERNIE H.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9496878760', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000364, '5', 'BANABAN, CARMELITA L.', 'Purok Dalampasigan, Brgy. Angeles, Atimonan, Quezon', '9177693274', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000365, '5', 'BANABAN, LUIGIE JOSHUA L.', 'Brgy. Angeles, Atimonan, Quezon', '9484809776', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000366, '5', 'BANDAYRIL, FHEALYN L.', 'Brgy. San Isidro, Atimonan, Quezon', '9489724219', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000367, '5', 'BARBA, DOMINGO M.', 'BRGY. VILLA IBABA, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000368, '3', 'BARRAMEDA, JURY T.', 'Brgy. Tinandog, Atimonan, Quezon', '9079093546', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000369, '5', 'BARRINO, LILIBETH P.', 'Brgy. Villa Ilaya, Atimonan, Quezon', '9301903346', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000370, '5', 'BARTOLOME, ANDREA P.', 'Brgy. Tagbakin, Atimonan, Quezon', '9194579451', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000371, '5', 'BASCO, JAYSON ORLAN E.', 'Brgy. Buhangin, Atimonan, Quezon', '9498793180', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000372, '5', 'BASCO, VALINTINA C.', 'Brgy. Zone 4, Atimonan, Quezon', '9257142210', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000373, '3', 'BATALIA, ELOISA EUNICE T.', 'Brgy. Malinao Ibaba, Atimonan, Quezon', '9488217830', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000374, '5', 'BAUTISTA, RONALD G.', 'Brgy. Buhangin, Atimonan, Quezon', '9182466738', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000375, '5', 'BAUTISTA, MARIA JULIE G.', 'Brgy. Malusak, Atimonan, Quezon', '9496322661', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000376, '5', 'BEGASA, MARICEL H.', 'Brgy. Zone 1, Atimonan, Quezon', '9203830719', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000377, '5', 'BENDAL, LARRY M.', 'BRGY. BUHANGIN, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000378, '3', 'BERBON, JOHN RENDELL A.', 'Brgy. San Rafael, Atimonan, Quezon', '9565174082', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000379, '3', 'BERBON, RADHELL A.', 'Brgy. San Rafael, Atimonan, Quezon', '9565209659', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000380, '1', 'BERMUDEZ, JUVVYLINDA B.', 'BRGY. BUHANGIN, Atimonan, Quezon', '9480933332', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000381, '5', 'BERON, ANGELITA A.', 'Brgy. Tagbakin, Atimonan, Quezon', '9123483571', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000382, '5', 'BESORIO, RIEL N.', 'BRGY. TAGBAKIN, Atimonan, Quezon', '9075623940', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000383, '5', 'BESORIO, VINCENT N.', 'BRGY. CARIDAD IBABA, Atimonan, Quezon', '9052262944', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000384, '1', 'BINOYA, DIANA ROSE R.', 'Brgy. Matanag, Atimonan, Quezon', '9482563623', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000385, '3', 'BISAYA, AMIR A.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9055818441', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000386, '5', 'BITUIN, ROMMEL S.', 'Brgy. Matanag, Atimonan, Quezon', '9463110613', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000387, '3', 'BITUIN, ALANILA E.', 'Brgy. Matanag, Atimonan, Quezon', '9098267407', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000388, '1', 'BLANCO, MARVIN R.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9366312800', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000389, '1', 'BO, MARA A.', 'Brgy. Inalig, Atimonan, Quezon', '9125902169', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000390, '3', 'BOISER, WILFREDO L.', 'PUROK MASIKIP, Caridad Ilanya, Atimonan, Quezon', '9192904482', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000391, '3', 'BOLFANI, MABELYN S.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9362611190', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000392, '1', 'BOLFANI, RAFAEL E.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9362611190', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000393, '5', 'BOLFANI, BRYAN A.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9055911827', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000394, '1', 'BONITA, KRYSTAL JHANE L.', 'Brgy. San Rafael, Atimonan, Quezon', '9285680618', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000395, '5', 'BORJA, OSCAR O.', 'Brgy. Caridad Ibaba, Atimonan, Quezon', '9106185706', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000396, '1', 'BORLAZA, DOMINIC C.', 'Brgy. Zone 2, Atimonan, Quezon', '9982765193', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000397, '5', 'BRIONES, ANGELICA P.', 'Brgy. San Jose Baklatok, Atimonan, Quezon', '9489157099', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000398, '7', 'BRIONES, JERRY O.', 'Reyes Street, Brgy. San Juan, Atimonan, Quezon', '9283408524', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000399, '3', 'BRIONES, MARVIN R.', 'Brgy. Kilait, Atimonan, Quezon', '9489371961', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000400, '3', 'BRIONES, AIZEL MARIE L.', 'Brgy. Kilait, Atimonan, Quezon', '9565520929', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000401, '1', 'BROZO, CARL ANDRE C.', 'Brgy. Zone 1, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000402, '3', 'BUAGAS, MA. ANGELIE A.', 'Brgy. San Isidro, Atimonan, Quezon', '9099902017', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000403, '3', 'BUELA, HERBERT N.', 'Brgy. Zone 1, Atimonan, Quezon', '9152765585', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000404, '5', 'BUSTAMANTE, ACE S.', 'Brgy. Tagbakin, Atimonan, Quezon', '9094148668', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000405, '3', 'CABAIS, NORA C.', 'Brgy. Angeles, Atimonan, Quezon', '9109449419', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000406, '3', 'CABALTERA, JOEL S.', 'Brgy. Caridad Ibaba, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000407, '5', 'CABAUATAN, SHERWIN A.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000408, '5', 'CABREZA, EXEQUEL A.', 'Brgy Zone 4 Poblacion, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000409, '1', 'CACABELOS, GEFFREY P.', 'Brgy. Angeles, Atimonan, Quezon', '9508227182', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000410, '3', 'CADELIÑA, MARK L.', 'Brgy. Angeles, Atimonan, Quezon', '9098015836', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000411, '5', 'CAHATOL, JOVITO S.', 'Purok Pipisik, Brgy. Caridad Ibaba, Atimonan, Quezon', '9472031004', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000412, '3', 'CAHULOGAN, ANNE H.', 'BRGY. SANTA CATALINA, Atimonan, Quezon', '9051766964', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000413, '1', 'CAINAG, SHERWIN S.', 'Brgy. San Andres Labak, Atimonan, Quezon', '9553025292', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000414, '5', 'CALIBJO, LAURENCE ALLAN L.', '527 OsmeÑa Street, Brgy. Zone III Poblacion, Atimonan, Quezon', '9165401502', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000415, '5', 'CALICA, RONNIE E.', 'Brgy. Sapaan, Atimonan, Quezon', '9467339915', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000416, '5', 'CALPITO, JEFFREY Q.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9451313616', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000417, '1', 'CAMARA, CESAR C.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9958217581', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000418, '3', 'CAMARA, ALLEN KEN R.', 'Brgy. Zone 4, Atimonan, Quezon', '9384183781', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000419, '1', 'CAMARA, RUSELL V.', 'Brgy. Montis Balaan, Atimonan, Quezon', '9351438653', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000420, '3', 'CAMBA, EVELYN M.', 'Brgy. Lumutan, Atimonan, Quezon', '9176145320', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000421, '5', 'CAMBA, CAIDIC GERIC L.', 'Brgy. Lumutang, Atimonan, Quezon', '9283408540', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000422, '1', 'CAMBA, ALFREDO C.', 'Brgy. Lumutan, Atimonan, Quezon', '9204930345', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000423, '1', 'CAMBA , RUBEN C.', 'Brgy. Lumutan, Atimonan, Quezon', '9984721381', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000424, '3', 'CAMBA, FRANCISCA G.', 'Brgy. Lumutan, Atimonan, Quezon', '9089683757', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000425, '5', 'CAMBA, LEONEL C.', 'Brgy. Lumutan, Atimonan, Quezon', '9213643136', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000426, '5', 'CAMBA, EDSEL E.', 'Brgy. Lumutan, Atimonan, Quezon', '9184307357', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000427, '3', 'CAMBA, MARLYN O.', 'Brgy. Lumutan, Atimonan, Quezon', '9071725511', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000428, '7', 'CAMBA, EDCEL L.', 'Brgy. Montes Balaon, Atimonan, Quezon', '9552992508', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000429, '3', 'CAMBA, ROMULO T.', 'Brgy. Montes Balaon, Atimonan, Quezon', '9754749541', '3', '1', '2023-01-09 13:06:35', '2023-01-09 13:06:35', '6'),
(00000000430, '5', 'CAMBO, FRANDY JADE L.', 'Brgy. Lumutan, Atimonan, Quezon', '9477636607', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000431, '3', 'CAMBRONERO, RIZA L.', 'Brgy. San Isidro, Atimonan, Quezon', '9076455486', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000432, '1', 'CAMILO, OSCAR LUCAS A.', 'Brgy. , Atimonan, Quezon', '9059406143', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000433, '5', 'CAMO, ARNEL O.', 'Angeles, Atimonan, Quezon', '9070714215', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000434, '3', 'CAMONGAY, EFREN H.', 'Brgy. Zone 3 Poblacion, Atimonan, Quezon', '9124878172', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000435, '1', 'CAMPADO, JR., ANTONIO A.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9959311191', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000436, '7', 'CAMPOMANES, HENRY C.', '987 Aguinaldo Street, Atimonan, Quezon', '9186137016', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000437, '3', 'CAMPOMANES, AIBEE N.', 'Brgy. Manggalayan Labak, Atimonan, Quezon', '9109602754', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000438, '7', 'CAMPOMANES, MEDINA D.', 'Brgy. Tagbaguin, Atimonan, Quezon', '9071201228', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000439, '7', 'CAMPONES, HENRY C.', 'Zone II, Atimonan, Quezon', '9186137016', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000440, '3', 'CAMPOS, ELMER D.', 'Brgy. Inalig, Atimonan, Quezon', '9203484940', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000441, '1', 'CAMPOS, LIEZEL J.', 'Brgy. Matanag, Atimonan, Quezon', '9485963102', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000442, '5', 'CAMPOSARYO, JANET L.', 'Brgy. Buhangin, Atimonan, Quezon', '9123483710', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000443, '1', 'CANADA, MARICRIS B.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9352784019', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000444, '5', 'CANALES, FRANCO G.', 'West Andres Street, Brgy. Zone 3, Atimonan, Quezon', '9303586000', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000445, '5', 'CANALES, EDUARD V.', 'Brgy. Rizal, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000446, '3', 'CANALES, MARCO G.', '#1429 Juez Andres, Atimonan, Quezon', '925570069', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000447, '1', 'CANALES, HONEY GRACE M.', 'Brgy. San Andres Labak, Atimonan, Quezon', '9363269050', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000448, '1', 'CANDELARIA, REYNALDO M.', 'Sitio 3, Brgy. Angeles, Atimonan, Quezon', '9107660059', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000449, '1', 'CANTILLO, RETCHEL O.', 'Brgy. Catalina, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000450, '3', 'CAPISTRANO, MARIA VIA G.', 'Brgy. Magsaysay, Atimonan, Quezon', '9097800734', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000451, '3', 'CARIAS, LUIS G.', 'Brgy. Poblacion, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000452, '3', 'CARIAS, SEVERO G.', 'Brgy. San Andres, Labak, Atimonan, Quezon', '9951478195', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000453, '3', 'CARIAS, POLICARPIO G.', 'Brgy. San Andres, Atimonan, Quezon', '9068119131', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000454, '1', 'CARIÑO, CHERRYLYN E.', 'Brgy. Buhangin, Atimonan, Quezon', '9276791500', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000455, '5', 'CARINGAL, JERWIN O.', 'Brgy. Malinao Ilaya, Atimonan, Quezon', '9264749246', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000456, '3', 'CARIZON, JERSON V.', 'Brgy. Baluba, Atimonan, Quezon', '9461624454', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000457, '3', 'CARIZON, MARVIN B.', 'Brgy. Balubad, Atimonan, Quezon', '9952026902', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000458, '1', 'CARREON, CARINA A.', 'Brgy. Kilait, Atimonan, Quezon', '9978831909', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000459, '3', 'CASTILLO, VILMA V.', 'Brgy. San Isidro, Atimonan, Quezon', '9484963625', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000460, '5', 'CASTOR, ENRICO V.', 'Brgy. Tagbakin, Atimonan, Quezon', '9095588394', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000461, '5', 'CASTROJERES, RYAN N.', 'Brgy. Angeles, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000462, '5', 'CATAPANG, CARMILA A.', 'Brgy. Bagumbayan, Zone 4, Atimonan, Quezon', '9501627400', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000463, '3', 'CENEDOZA, MARLON G.', 'DIVISION ILAYA, Brgy. Tagbakin, Atimonan, Quezon', '9488438859', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000464, '3', 'CENTENO, CHRISTINE ANN U.', 'Brgy. Zone 3, Atimonan, Quezon', '9305638844', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000465, '7', 'CENTINO, MARK ANTHONY A.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000466, '5', 'CERVANTES, MARE ANN T.', 'Brgy. Inalig, Atimonan, Quezon', '9216447688', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000467, '3', 'CERVANTES, ARVIN V.', 'Brgy. Inakig, Atimonan, Quezon', '9074245169', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000468, '1', 'CHAVEZ, MARIA LEILA S.', 'Brgy. Angeles, Atimonan, Quezon', '9562847557', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000469, '1', 'COLLANTES, PATRICK ALEXIS R.', 'BRGY. ZONE 3, Atimonan, Quezon', '9163383893', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000470, '5', 'COLLANTES, JR., LEANDRO L.', '1389 R. Diaz Street, Brgy. Zone 3, Atimonan, Quezon', '9328760465', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000471, '5', 'COMBO, JR., CONSTANCIO J.', 'Brgy. Angeles, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000472, '5', 'COMELIO, CHRISTIAN P.', 'Brgy. San Juan, Atimonan, Quezon', '9094275209', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000473, '1', 'CONCEPCION, DONDY .', 'Brgy. Santa Catalina, Atimonan, Quezon', '9169041421', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000474, '1', 'CORDERO, JERMYN C.', 'Brgy. Zone 3, Atimonan, Quezon', '9504645375', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000475, '3', 'CORPUS, ARCHIE O.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9062188653', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000476, '5', 'COSTELO, RAYMUND L.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000477, '5', 'CRISTOBAL, JAY-JAY D.', 'Brgy. Tagbakin, Atimonan, Quezon', '9326313333', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000478, '5', 'CUETO, EDWARD A.', 'Brgy. Poblacion, Zone 1, Atimonan, Quezon', '9463360893', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000479, '5', 'CURILAN, JEFFERSON S.', 'BRGY. MAGSAYSAY, Atimonan, Quezon', '9467276270', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000480, '5', 'CUSTOSA, FLORO N.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000481, '5', 'DAPULA, ORLANDO S.', 'BRGY. MAGSAYSAY, Atimonan, Quezon', '9395184831', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000482, '5', 'DASCO, GIOVANNI B.', 'Brgy. Lumutan, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000483, '3', 'DATARIO, VINCENT D.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9465454480', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000484, '5', 'DATOY, CHRISTIAN R.', 'Brgy. Malinao Ilaya, Atimonan, Quezon', '9053770068', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000485, '5', 'DAVID, JOSE MILARD A.', 'Brgy. Zone 1, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000486, '1', 'DE AMOR, LAISSA S.', 'Brgy. Sapaan, Atimonan, Quezon', '9971973116', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000487, '3', 'DE CASTRO, ZIEG MYRVIC A.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9300137087', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000488, '1', 'DE GUIA, NOEL R.', 'Brgy. Malinao Ilaya, Atimonan, Quezon', '9284715216', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000489, '5', 'DE GUZMAN, SUSANA V.', 'BRGY. SANTA CATALINA, Atimonan, Quezon', '9265446829', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000490, '3', 'DE JESUS, JUDITH B.', 'BRGY. SAN ISIDRO, Atimonan, Quezon', '9109121173', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000491, '3', 'DE LA PEÑA, EDITA S.', 'Brgy. Angeles, Atimonan, Quezon', '9203475083', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000492, '5', 'DE LEON, JOHNNY R.', 'Brgy. Tagbakin, Atimonan, Quezon', '9472284306', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000493, '5', 'DE LOS SANTOS, JONATHAN N.', 'Brgy. Buhangin, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000494, '1', 'DE TORRES, EDRIAN M.', 'Brgy. Malinao, Atimonan, Quezon', '9097377366', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000495, '1', 'DE TORRES, JOHN IAN E.', 'MALINAO ILAYA, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000496, '7', 'DE VERA, EMMA V.', 'BRGY. BUHANGIN, Atimonan, Quezon', '9993612126', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000497, '3', 'DECENA, ROSENDO R.', 'Brgy. Kulawit, Atimonan, Quezon', '9109029335', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000498, '5', 'DEFANTE, LAWRENCE V.', 'Brgy. Talaba, Atimonan, Quezon', '9420936022', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000499, '3', 'DEGUERO, YVETTE A.', 'Brgy. San Rafael, Atimonan, Quezon', '9064122841', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000500, '5', 'DEJURAS, MELVIN D.', 'Brgy. Tagbalen, Atimonan, Quezon', '9288082484', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000501, '1', 'DEL MUNDO, MANUEL A.', 'BRGY. ZONE 2, Atimonan, Quezon', '9154370924', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000502, '1', 'DELA CRUZ, MARIA CRISTENA H.', 'Brgy. Angeles, Atimonan, Quezon', '9500026735', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000503, '1', 'DELA TORRE, JIMMY R.', 'BRGY. TINANDOG, Atimonan, Quezon', '9097905122', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000504, '1', 'DELEZ, MEDARDO D.', 'Brgy. Rizal, Atimonan, Quezon', '9487257722', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000505, '3', 'DELEZ, MAURBEYN A.', 'Brgy. Zone 2 Poblacion, Atimonan, Quezon', '9956150093', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000506, '1', 'DELOS REYES, JOEL V.', 'BRGY. CARIDAD ILAYA, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000507, '3', 'DELOS SANTOS, JAYROLL A.', 'Brgy. Villa Ilaya, Atimonan, Quezon', '9486711976', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000508, '5', 'DELOS SANTOS, ROBERT C.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9756572972', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000509, '5', 'DEQUILLA, BEATREZ A.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9277824556', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000510, '5', 'DEQUITO, MARK DEXTER C.', 'Brgy. Malinao Ibaba, Atimonan, Quezon', '9460559399', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000511, '5', 'DEQUITO, ENRIQUE Y.', 'Brgy. Lakip, Atimonan, Quezon', '9485199619', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000512, '7', 'DESEO, JEFFREY J.', 'BRGY. SANTA CATALINA, Atimonan, Quezon', '9169041325', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000513, '3', 'DESEO, JOSEPH A.', 'Brgy. Balubad, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000514, '1', 'DESEO, CYRIL R.', 'Brgy. Manggalayan Labak, Atimonan, Quezon', '9452585893', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000515, '5', 'DESEO, VON CARLO T.', 'Brgy. Balubad, Atimonan, Quezon', '9663868438', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000516, '5', 'DETERA, EDERLYN V.', 'BRGY. RIZAL, Atimonan, Quezon', '9500817374', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000517, '3', 'DEZA, RONANTE M.', 'Brgy. Villa Ilaya, Atimonan, Quezon', '9065421104', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000518, '1', 'DEZA, MANUEL M.', 'Brgy. Malusak, Atimonan, Quezon', '9192697202', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000519, '5', 'DEZA, HALBERT V.', 'BRGY. VILLA ILAYA, Atimonan, Quezon', '9503693622', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000520, '3', 'DEZA, DIOSDADO J.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9070657872', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000521, '5', 'DIALA, DARWIN V.', 'Brgy. Inahig, Atimonan, Quezon', '9306136408', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000522, '3', 'DIGLUIS, MYLENE L.', 'Brgy. Magsaysay, Atimonan, Quezon', '9479755145', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000523, '3', 'DIMACULANGAN, ARGEM N.', 'Brgy. Tagbakin, Atimonan, Quezon', '9294380681', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000524, '5', 'DIMAILIG, MERIAM B.', 'Brgy. Caridad Ibaba, Atimonan, Quezon', '9101049367', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000525, '5', 'DIMALATA, ROWEL D.', 'Brgy. Malusak, Atimonan, Quezon', '9505381254', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000526, '7', 'DIMALIG, SARAH JANE F.', 'Brgy. Tagbakin, Atimonan, Quezon', '9077595020', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000527, '7', 'DIMAUMAHAN, EFREN B.', 'Brgy. Malusak, Atimonan, Quezon', '9108961149', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000528, '1', 'DIMAUNAHAN, CLEOFE P.', 'Brgy. Malusak, Atimonan, Quezon', '948706437', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000529, '7', 'DIMAUNAHAN, EFREN B.', 'Brgy. Sipapay, Atimonan, Quezon', '9108961149', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000530, '1', 'DIMAUNAHAN, KEN KIRBY P.', 'Brgy. Malusak, Atimonan, Quezon', '9486899030', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000531, '5', 'DIOKNO, ANDREA B.', 'Brgy. Lakip, Atimonan, Quezon', '92713118769', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000532, '3', 'DIZON, MICHAEL S.', 'Brgy. Zone 4, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000533, '1', 'DOCE, VIVIAN A.', 'Brgy. Balaba, Atimonan, Quezon', '9488438734', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000534, '1', 'DOCE, KRYSTELLE ANNE A.', 'Brgy. Talaba, Atimonan, Quezon', '9100647624', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000535, '1', 'DOCTOR, JUN O.', 'Brgy. Habingan, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000536, '3', 'DOMELITA, VICTORIA M.', 'Brgy. Lumutan, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000537, '3', 'DOMETITA, VICTORIA M.', 'Brgy. Lumutan, Atimonan, Quezon', '9072264914', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000538, '7', 'DUETES, JUDYANN T.', 'Brgy. Buhangin, Atimonan, Quezon', '9063855982', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000539, '7', 'DUETES, GARY I.', 'Brgy. Buhangin, Atimonan, Quezon', '9063855982', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000540, '1', 'DUMACIAN, TEOFILO F.', 'Brgy. Caridad Ibaba, Atimonan, Quezon', '9079411656', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000541, '5', 'EBRON, MARIA AILYN G.', 'BRGY. ZONE 1, Atimonan, Quezon', '9123176935', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000542, '3', 'EDISAN, JACQUILINE V.', 'Brgy. Zone 1, Atimonan, Quezon', '9463201275', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000543, '5', 'EDROLE, ARDEL D.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000544, '5', 'ELAD, MARIA RHIA PAZ S.', 'Brgy. Malusak, Atimonan, Quezon', '9506655246', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000545, '3', 'ELESIS, JOHNEL V.', 'Brgy. Lubi, Atimonan, Quezon', '9094396697', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000546, '1', 'ELIQUIO, ROWEN L.', 'Brgy. Beerd Zone 1, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000547, '5', 'EMPLEO, AIDA A.', 'BRGY. TINANDOG, Atimonan, Quezon', '9297910773', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000548, '1', 'ENOPIA, JENNYBEL E.', 'Brgy. Zone 1, Atimonan, Quezon', '9108891678', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000549, '3', 'ENOPIA, CHRISTIAN M.', 'Brgy. Lubi, Atimonan, Quezon', '909099975', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000550, '3', 'ENRIQUEZ, GLORIA L.', 'Brgy. Panan, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000551, '5', 'EPINO, RICARDO D.', 'Brgy. Buhangin, Atimonan, Quezon', '9076597212', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000552, '1', 'ERANDIO, GERMMAR P.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9464667357', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000553, '5', 'ERANDIO, ANDRES S.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9308677473', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000554, '5', 'ERMINO, MA. TERESITA C.', 'Brgy. Buhangin, Atimonan, Quezon', '9334511086', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000555, '5', 'ERMINO, ANTONIO F.', 'BRGY. BUHANGIN, Atimonan, Quezon', '9097510292', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000556, '3', 'EROLES, LORNA S.', 'Brgy. Montes Kallagan, Atimonan, Quezon', '9758843782', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000557, '3', 'ESCAMILLA, HERMINIO D.', 'Brgy. Buhangin, Atimonan, Quezon', '9286018762', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000558, '1', 'ESCASA, LOUBERT V.', '311 Osmena Street, Brgy. Zone 3, Atimonan, Quezon', '9072595907', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000559, '3', 'ESCASA, JOSEPHINE E.', 'Brgy. Malinao Ilaya, Atimonan, Quezon', '9292785674', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000560, '5', 'ESCASA, RODENE A.', 'Brgy. Sokol, Atimonan, Quezon', '9123422625', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000561, '1', 'ESCLANDA, EILEEN G.', 'Brgy. Angeles, Atimonan, Quezon', '9993694397', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000562, '3', 'ESCOSIA, EDWIN V.', 'Brgy. Santa Catalina, Atimonan, Quezon', '906695463', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000563, '1', 'ESCOVIDAL, ERICK L.', 'Brgy. Manggahan, Atimonan, Quezon', '9092302786', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000564, '1', 'ESCRITOR, ESPERANZA L.', 'Brgy. Sapaan, Atimonan, Quezon', '9278916847', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000565, '5', 'ESCRITOR, DAN CARMELO L.', 'Brgy. Sapaan, Atimonan, Quezon', '9277333403', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000566, '5', 'ESCULLAR, JULIUS R.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000567, '5', 'ESCULLAR, ADONIS C.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9057013978', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000568, '5', 'ESGUERRA, WENCESLAO R.', 'Brgy. Zone 3, Atimonan, Quezon', '9278203494', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000569, '1', 'ESGUERRA, JENIELYN D.', 'Brgy. Malusak, Atimonan, Quezon', '9464264248', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000570, '1', 'ESGUERRA, MARLON P.', 'Brgy. Lumutan, Atimonan, Quezon', '9486760506', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000571, '3', 'ESPANTO, MA. JENINA F.', 'Brgy. Angeles, Atimonan, Quezon', '9094307779', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000572, '1', 'ESPEDIDO, WILLIAM L.', 'Brgy. Malinao, Atimonan, Quezon', '9166683986', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000573, '5', 'ESPINOSA, THELMA S.', 'Brgy. Magsaysay, Atimonan, Quezon', '9358906878', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000574, '1', 'ESPINOSA, FRANCIS D.', 'Brgy. Villa Ibaba, Atimonan, Quezon', '9056270927', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000575, '5', 'ESPINOSA, JR., CRISOSTOMO A.', 'Brgy. Villa Ilaya, Atimonan, Quezon', '9214772313', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000576, '7', 'ESPLANA, EXCEL NICOLE C.', 'BRGY. TAGBAKIN, Atimonan, Quezon', '9467100928', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000577, '5', 'ESTERA, CHRISTIAN P.', 'BRGY. SANTA CATALINA, Atimonan, Quezon', '9505381223', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000578, '3', 'ESTERA, REX F.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000579, '3', 'ESTERA, DENNIS I.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9065164732', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000580, '3', 'ESTIPONA, GUILLERMO P.', 'Brgy. Matanag, Atimonan, Quezon', '9104490321', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000581, '1', 'ESTOCADO, ANGELIKA G.', 'Brgy. Sapaan, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000582, '1', 'ESTRADA, ENRICO R.', 'Brgy. Zone 3, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000583, '1', 'ESTRADA, ABEGAIL C.', 'Brgy. Talaba, Atimonan, Quezon', '9127276773', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000584, '3', 'ESTRADA, NORBEL A.', 'Brgy. Malusak, Atimonan, Quezon', '9480102382', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000585, '5', 'ESTROPE, RIZALDY G.', 'BRGY. C. ARIDAD ILAYA, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000586, '5', 'ESTROPE, ROLAND G.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9503296310', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000587, '1', 'EVANGELISTA, IVY JEIN S.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9059577543', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000588, '3', 'EVANGELISTA, JOHN PAUL V.', 'Brgy. Zone 2 Poblacion, Atimonan, Quezon', '9099772835', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000589, '5', 'FACUNLA, CLERK JANCY R.', 'Brgy. Angeles, Atimonan, Quezon', '9083465592', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000590, '5', 'FAJARDO, GLORIA G.', '495 Cerrudo St, Zone 1, Atimonan, Quezon', '9991827801', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000591, '1', 'FAJARDO, FAJIE G.', 'Brgy. Caridad Ibaba, Atimonan, Quezon', '9569530496', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000592, '1', 'FAJARDO, VEVENCIO C.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000593, '1', 'FAJARDO, EMAR L.', 'Brgy. Tagbalikin, Atimonan, Quezon', '9196174773', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000594, '5', 'FAJARDO, REDENTO L.', 'Brgy. Zone 4, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000595, '3', 'FARSARIO, DARIO A.', 'Brgy. Malusak, Atimonan, Quezon', '9483297667', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000596, '1', 'FERNANDEZ, DANILO B.', 'Purok 3, Brgy. PuÑon, Atimonan, Quezon', '9089813578', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000597, '5', 'FILIPONEO, ROSAVEL V.', 'Brgy. Lubi, Atimonan, Quezon', '9569148050', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000598, '1', 'FIRME, MARIO O.', 'Brgy. Villa Ibaba, Atimonan, Quezon', '9298390499', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000599, '3', 'FLOR, HAYDEE V.', 'BRGY. TINANDOG, Atimonan, Quezon', '9122780555', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000600, '5', 'FLORENTINO, NORMAN M.', 'Brgy. Inaclagan, Atimonan, Quezon', '9268419319', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000601, '3', 'FORNASA, RODANTE M.', 'Brgy. Malusak, Atimonan, Quezon', '9085597143', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000602, '1', 'FRAGA, MARIVIC A.', 'BRGY. CARIDAD IBABA, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000603, '1', 'FRANCISCO, NESTOR M.', 'Brgy. Malinao Ilaya, Atimonan, Quezon', '9473290736', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000604, '5', 'FRANCISCO, JAYPEE M.', 'Brgy. Caridad Ibaba, Atimonan, Quezon', '9108653739', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000605, '5', 'FRESTO, NANCY A.', 'Brgy. Angeles, Atimonan, Quezon', '9481342640', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000606, '3', 'GABLANCA, JHON CARLO M.', 'Brgy. Caridad Ibaba, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000607, '5', 'GAELA, RYAN C.', 'Brgy. Caridad Ibaba, Atimonan, Quezon', '9966762170', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000608, '1', 'GALANG, JA-ALBERT .', 'Brgy. Buhangin, Atimonan, Quezon', '9093487780', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000609, '1', 'GALOSO, GEORGELYN I.', 'Brgy. Magsaysay, Atimonan, Quezon', '9127752804', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000610, '5', 'GARATE, MARITES B.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000611, '3', 'GARATE, WILMA D.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9123483273', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000612, '5', 'GARCIA, AGNEL N.', 'Brgy. Caridad Ibaba, Atimonan, Quezon', '9508303592', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000613, '5', 'GARCIA, SOLOMON E.', 'BRGY. LAKIP, Atimonan, Quezon', '9102718337', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000614, '3', 'GARCIA, JEFFREY A.', 'Brgy. Buhangin, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000615, '7', 'GARCIA, JOEL C.', 'BRGY. TINANDOG, Atimonan, Quezon', '9182372035', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000616, '5', 'GARCIA, ELMER A.', 'Brgy. Zone 1, Atimonan, Quezon', '9480294502', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000617, '5', 'GARIGUEZ, FRANCIS E.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000618, '3', 'GARIN, ANGELICA G.', 'Brgy. Angeles, Atimonan, Quezon', '9461821363', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000619, '5', 'GASCO, JOHN GLENN M.', 'BRGY. ANGELES, Atimonan, Quezon', '9502816470', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000620, '5', 'GAZA, JHON IRVIN E.', 'Brgy. Talaba, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000621, '5', 'GENER, OLIVER E.', 'Brgy. Zone I, Atimonan, Quezon', '9489564934', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000622, '5', 'GENERALAO, JULIUS ANTHONY L.', 'Brgy. San Isidro, Atimonan, Quezon', '9505378508', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000623, '3', 'GILBUENA, MARK JHON S.', 'Brgy. Angeles, Atimonan, Quezon', '9306098353', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000624, '5', 'GILBUENA, RYAN S.', 'Brgy. Angeles, Atimonan, Quezon', '9480507835', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000625, '3', 'GLODOVEZA, ANA MARIE E.', 'Brgy. Malinao Ilaya, Atimonan, Quezon', '9300746946', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000626, '5', 'GLORIA, MELFRANCIS A.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9179164397', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000627, '1', 'GLORIOSO, MARY JANE E.', 'Brgy. Villa Ilaya, Atimonan, Quezon', '9078430170', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000628, '3', 'GLORIOSO, ALVIEN B.', 'Brgy. Tagbakin, Atimonan, Quezon', '9109427520', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000629, '3', 'GONZALES, JEUZENAR P.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9052363815', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000630, '5', 'GONZALES, LOVELY CREZYL R.', 'Brgy. Sapaan, Atimonan, Quezon', '9099933120', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000631, '3', 'GONZALES, EDZAR ROSDUM U.', 'Brgy. Sapaan, Atimonan, Quezon', '9298261465', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000632, '3', 'GONZALES, JENIFHIER F.', 'Brgy. Buhangin, Atimonan, Quezon', '9100604937', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000633, '7', 'GREGORIO, MARCELINO R.', 'Brgy. Villa Ilaya, Atimonan, Quezon', '9386602330', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000634, '5', 'GRIMALDO, JONNIL V.', 'BRGY. INALIG, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000635, '1', 'GUDANI, RONNEL E.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9489103769', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000636, '3', 'GUIAB, JESSEL M.', 'Brgy. Angeles, Atimonan, Quezon', '9109623777', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000637, '5', 'HACUTINA, MARY JANE G.', 'Brgy. Tagbakin, Atimonan, Quezon', '9750889973', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000638, '3', 'HAPONE, SHIRLEY A.', 'Brgy. Malusak, Atimonan, Quezon', '9075991284', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000639, '1', 'HAPONE, JOVEN A.', 'Brgy. Malusak, Atimonan, Quezon', '9075991284', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000640, '3', 'HERERA, SAGRARIO O.', 'Brgy. Magsaysay, Atimonan, Quezon', '9195056485', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000641, '5', 'HILADO, LEONARDO F.', 'Brgy. Tagbakin, Atimonan, Quezon', '9102188963', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000642, '5', 'IBASCO, ROMMEL B.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9488614830', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000643, '5', 'ILAGAN, ALFREDO L.', 'Bonifacio Street, Atimonan, Quezon', '9197058253', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000644, '5', 'ILAGAN, RANY P.', 'Brgy. Villa Ilaya, Atimonan, Quezon', '9129987872', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6');
INSERT INTO `donors` (`id`, `type_id`, `donor_name`, `address`, `contact`, `municipality_id`, `bank_id`, `created_at`, `updated_at`, `administrator_id`) VALUES
(00000000645, '5', 'ILAGAN, RANIEL P.', '1674 Bonifacio Street, Villa Ilaya, Atimonan, Quezon', '9486161572', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000646, '5', 'INAL, LEMUEL A.', 'Brgy. Rizal, Atimonan, Quezon', '9432823137', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000647, '5', 'INAL, REYLAN C.', 'Brgy. Inaclagan, Atimonan, Quezon', '9355057183', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000648, '5', 'INALISAN, MARK JAYCIL B.', 'Brgy. Buhangin, Atimonan, Quezon', '9950280485', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000649, '5', 'INOY, JOSELYN B.', 'Brgy. San Isidro, Atimonan, Quezon', '9487771009', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000650, '3', 'INOY, JR., FELIX A.', 'Brgy. San Isidro, Atimonan, Quezon', '9124120429', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000651, '5', 'JALI, BAMBEE G.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9066275695', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000652, '1', 'JARIEL, MANUEL N.', 'Brgy. Tagbakin, Atimonan, Quezon', '9486904097', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000653, '5', 'JAVIER, JOHN MICHAEL Z.', 'BRGY. ISKONG BATAY, Atimonan, Quezon', '9173550392', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000654, '5', 'JERESANO, JARMEL B.', 'BRGY. BUHANGIN, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000655, '1', 'JIMENEZ, MA. RESCY P.', 'Brgy. Buhangin, Atimonan, Quezon', '9494243890', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000656, '5', 'JOLO, ESPERANZA T.', 'BRGY. MALINAO IBABA, Atimonan, Quezon', '9288946718', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000657, '5', 'JOLO, ELVIRA T.', 'BRGY. MALINAO IBABA, Atimonan, Quezon', '9461821075', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000658, '3', 'JORDAN, LUISITO S.', 'Brgy. Montes Balaon, Atimonan, Quezon', '9359076715', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000659, '1', 'JOVEN, KREIL V.', 'Brgy. Inaclagan, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000660, '5', 'JURALBA, ROSALYN G.', 'Brgy. San Isidro, Atimonan, Quezon', '9123483241', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000661, '3', 'JUVIDA, CONDRADO P.', 'Brgy. Malusak, Atimonan, Quezon', '9093311614', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000662, '1', 'LABUNOS, VAN JAYSON E.', 'BRGY. SANTA CATALINA, Atimonan, Quezon', '9075472568', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000663, '5', 'LACISTE, BISMARK G.', 'Brgy. Caridad Ibaba, Atimonan, Quezon', '9326101384', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000664, '5', 'LACORTE, JULIETA D.', 'Brgy. Libak, Atimonan, Quezon', '9357955894', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000665, '5', 'LACUESTA, REMEDIOS A.', 'Unspecified, Atimonan, Quezon', '9085613132', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000666, '7', 'LADIMO, MARIZA M.', 'Brgy. Mangalayan Labak, Atimonan, Quezon', '9102251005', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000667, '5', 'LAGAHAN, MARISSA D.', 'Brgy. Catalina, Atimonan, Quezon', '9969735712', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000668, '3', 'LAGAYA, RIZALDY A.', 'Brgy. Zone 1, Atimonan, Quezon', '9109600962', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000669, '5', 'LAGAYA, ROLANDO A.', 'Brgy. Zone 1, Atimonan, Quezon', '9494693710', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000670, '5', 'LALOGO, OLIVER M.', 'Brgy. Malinao, Atimonan, Quezon', '9488439578', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000671, '5', 'LANUZA, CYRUS B.', 'Brgy. Tagbakin, Atimonan, Quezon', '9093252803', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000672, '5', 'LARANG, JR., ROMULO C.', 'Brgy. San Isidro, Atimonan, Quezon', '9504645194', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000673, '1', 'LAS PIÑAS, MARITES D.', 'Brgy. Poblacion Zone 2, Atimonan, Quezon', '9489047166', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000674, '5', 'LASCANO, RENIEL V.', 'Brgy. Inaclagan, Atimonan, Quezon', '9262503980', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000675, '1', 'LASHERAS, JOHN PHILLIP V.', 'Brgy. Zone 2, Atimonan, Quezon', '9479992574', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000676, '5', 'LASPIÑAS, ELIZABETH P.', 'Brgy. Kilait, Atimonan, Quezon', '9555714069', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000677, '3', 'LASQUETY, EUNICE KAY O.', 'Brgy. Lumutan, Atimonan, Quezon', '9126023509', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000678, '5', 'LASQUETY, JEFFREY M.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000679, '3', 'LASQUETY, JOHN VINCE C.', 'Brgy. Lumutan, Atimonan, Quezon', '9564752390', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000680, '5', 'LASQUETY, RAMIL R.', 'Brgy. Lumutan, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000681, '3', 'LAUDE, BRYAN ANGELO P.', 'BRGY. TINANDOG, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000682, '1', 'LAUDE, ROBERTO A.', 'Brgy. Caridad Ilanya, Atimonan, Quezon', '9331968838', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000683, '5', 'LAUDE, MICHAEL ANGELO T.', 'Brgy. Rizal, Atimonan, Quezon', '9209678968', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000684, '5', 'LAURENA, MARY ANN F.', 'Brgy. Tagbakin, Atimonan, Quezon', '9218573724', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000685, '5', 'LAVIDES, MERLIN A.', 'Brgy. Tagbakin, Atimonan, Quezon', '9464194493', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000686, '3', 'LAVIDES, RHONELL C.', 'Brgy. San Andres Bundok, Atimonan, Quezon', '9355057619', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000687, '3', 'LAVIDES, ARNEL O.', 'Brgy. San Andres Bundok, Atimonan, Quezon', '9169891593', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000688, '5', 'LAWIG, ROLANDO M.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9975271837', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000689, '3', 'LEA, ISABELITA A.', '194 Purok Palayan, Brgy. Balubad, Atimonan, Quezon', '9984283570', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000690, '5', 'LEAL, EDMUNDO L.', 'BRGY. CARIDAD ILAYA, Atimonan, Quezon', '9463450785', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000691, '5', 'LEVASTY, ELMER P.', 'Unspecified, Atimonan, Quezon', '9212333516', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000692, '5', 'LIBOT, WILFRED C.', 'Brgy. San Adnres Labak, Atimonan, Quezon', '9067963218', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000693, '1', 'LIGAYA, LORELA C.', 'Brgy. Zone 1, Atimonan, Quezon', '9091154960', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000694, '1', 'LIM, MICHAEL A.', 'BRGY. ZONE 4 POBLACION, Atimonan, Quezon', '9399260418', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000695, '7', 'LITA, REFERANTE C.', 'Brgy. Zone 3, Atimonan, Quezon', '9084737706', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000696, '5', 'LIWANAG, LIBRADA O.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9067346022', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000697, '1', 'LIWANAG, JR., ROLANDO M.', 'Brgy. Balubad, Atimonan, Quezon', '9184460908', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000698, '5', 'LOBERIO, TIRSO E.', 'Brgy. Malinao Ilaya, Atimonan, Quezon', NULL, '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000699, '3', 'LOPEZ, GINALYN A.', 'Brgy. Bagong Siang, Atimonan, Quezon', '9176562300', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000700, '1', 'LORENZANA, MARICAR A.', 'Brgy. Balubad, Atimonan, Quezon', '9288350940', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000701, '3', 'LOSLOSO, AILYN L.', 'Brgy. Buhangin, Atimonan, Quezon', '9162551863', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000702, '5', 'LOZANO, JENNIFER M.', 'Brgy. Manggalayan Labak, Atimonan, Quezon', '9464723087', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000703, '3', 'LUMIDA, EDGARDO E.', 'Brgy. Talaba, Atimonan, Quezon', '9676271728', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000704, '1', 'LUNA, JOLLY PEARL .', 'Brgy. San Andres, Atimonan, Quezon', '9351410215', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000705, '5', 'LUZANO, MARY JOY R.', 'Brgy. Poblacion 2, Atimonan, Quezon', '9175607433', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000706, '7', 'MAALIW, MINASAR V.', 'Brgy. Buhangin, Atimonan, Quezon', '9286923654', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000707, '5', 'MABUNGA, RONNIE U.', 'Brgy. Habingan, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000708, '5', 'MACABATA, JAYSON A.', 'Brgy. Inalig, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000709, '1', 'MACASINAG, FRANCIS JAY S.', 'Brgy. Balubad, Atimonan, Quezon', '9054013347', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000710, '5', 'MAGDATO, MARY JOY M.', 'Brgy. Angeles, Atimonan, Quezon', '9097322142', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000711, '3', 'MAGHIYUP, BERNIE L.', 'Brgy. Zone 3, Atimonan, Quezon', '9294200810', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000712, '3', 'MAGNO, ARNEL V.', 'Brgy. Malinao Ilaya, Atimonan, Quezon', '9322201600', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000713, '1', 'MAGRACIA, VIRGINIA M.', 'Brgy. Malinao Ilaya, Atimonan, Quezon', '9093017464', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000714, '5', 'MALABOSA, JANZEL R.', 'Brgy. Balubal, Atimonan, Quezon', '9067507941', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000715, '7', 'MALATE, ANTONIO F.', 'Villa Ibaba, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000716, '7', 'MALONDA, RONNEL C.', 'Brgy. Lumutan, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000717, '5', 'MANALO, MICHAEL ANGELO M.', 'Brgy. San Raphael, Atimonan, Quezon', '9489858362', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000718, '5', 'MANALO, JOCELYN M.', 'BRGY. SAN RAFAEL, Atimonan, Quezon', '9369172944', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000719, '1', 'MANALO, JONATHAN J.', 'BRGY. SAN RAFAEL, Atimonan, Quezon', '9079625493', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000720, '1', 'MANALO, MARLO G.', 'Brgy. Inaclagan, Atimonan, Quezon', '9179026461', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000721, '5', 'MANAOG, DENNIS S.', 'Brgy. Malusak, Atimonan, Quezon', '9504451635', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000722, '5', 'MANCAO, RONRON .', 'Brgy. Poblacion, Atimonan, Quezon', '9098827771', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000723, '1', 'MANGABA, JOHN N.', '471 OsmeÑa Street, Atimonan, Quezon', '9153076797', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000724, '5', 'MANGABA, ALAN N.', 'Brgy. Balubad, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000725, '3', 'MANGABA, HENRY E.', 'Brgy. Labi, Atimonan, Quezon', '9302998430', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000726, '5', 'MANGAO, RONEL C.', 'BRGY. BAGUMABAYAN, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000727, '3', 'MANLE, IVAN P.', 'Brgy. Balubad, Atimonan, Quezon', '9457869334', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000728, '3', 'MANLE, MARIA MAIDEN E.', 'Brgy. Balubad, Atimonan, Quezon', '9369139781', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000729, '5', 'MANRIQUE, MARK ANTHONY D.', 'Brgy. Zone 1, Atimonan, Quezon', '9995198509', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000730, '5', 'MANYO, BELINDA M.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9207004475', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000731, '3', 'MAPA, RAUL H.', 'Unspecified, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000732, '5', 'MAPA, JR., VICENTE C.', 'Brgy. San Jose Balatok, Atimonan, Quezon', '9386729403', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000733, '3', 'MAPAYE, RYAN N.', 'Brgy. Talaba, Atimonan, Quezon', '9498896877', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000734, '5', 'MAPAYE, JANRENZ .', 'Brgy. Tagbakin, Atimonan, Quezon', '939178243', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000735, '5', 'MARASIGAN, RACIELYN A.', 'Brgy. Tagbakin, Atimonan, Quezon', '9777273260', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000736, '1', 'MARASIGAN, MARK RITZER R.', 'Brgy. Manggalayan Labak, Atimonan, Quezon', '9074826212', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000737, '1', 'MARASIGAN, MERILYN M.', 'Brgy. San Isidro, Atimonan, Quezon', '939425012', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000738, '1', 'MARI , RALPH JOSEPH V.', '912 G. Orda St. , Atimonan, Quezon', '9198229845', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000739, '5', 'MAROON, REAGAN M.', 'Brgy. Malusak, Atimonan, Quezon', '9109598640', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000740, '3', 'MAROON, JEFFERSON V.', 'Brgy. Malusak, Atimonan, Quezon', '9300132043', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000741, '7', 'MAROON, ROLANDO M.', 'Brgy. Malusak, Atimonan, Quezon', '9168326541', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000742, '5', 'MARQUEZ, NOR L.', 'Brgy. Poblacion, Atimonan, Quezon', '9499654521', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000743, '1', 'MARTINEZ, MARIBEL G.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9485200609', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000744, '1', 'MARTINEZ, LORENA V.', 'Brgy. San Isidro, Atimonan, Quezon', '9205899320', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000745, '5', 'MARTINEZ, RUEL C.', 'Brgy. San Isidro, Atimonan, Quezon', '9071181006', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000746, '3', 'MARTINEZ, MARISSA M.', 'Brgy. Balubad, Atimonan, Quezon', '9205210110', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000747, '1', 'MARTINEZ, DANILO P.', 'Brgy. Lakip, Atimonan, Quezon', '9100729576', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000748, '3', 'MARTINEZ, NOVELITA A.', 'Brgy. Manggalayan, Atimonan, Quezon', '9100265146', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000749, '1', 'MARTINEZ, MA. SOTERA B.', 'Brgy. Malusak, Atimonan, Quezon', '9505967241', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000750, '1', 'MENDOZA, JOSEPH M.', 'BRGY. SANTA CATALINA, Atimonan, Quezon', '9756662325', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000751, '3', 'MENDOZA, LESTER T.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9077820504', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000752, '1', 'MENES, JOHN CARLO O.', 'Brgy. Zone 2, Atimonan, Quezon', '9466761574', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000753, '5', 'MERCADO, JESSICA N.', 'BRGY. BUHANGIN, Atimonan, Quezon', '9161061617', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000754, '5', 'MERIEL, EMERLITA P.', 'Brgy. Balaguhin, Atimonan, Quezon', '9483178309', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000755, '3', 'MERINGUA, JAYRA L.', 'Brgy. Bulubag, Atimonan, Quezon', '9984283570', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000756, '5', 'MERLE, RIO A.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9261302138', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000757, '1', 'MERLE, ROLANDO M.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9358781586', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000758, '5', 'MILAR, NEIL V.', 'Brgy. Ponon, Atimonan, Quezon', '9975884827', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000759, '1', 'MILLA, MEG P.', 'BRGY. BALUBAD, Atimonan, Quezon', '9505381170', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000760, '3', 'MIRRA, DENNIS C.', 'Brgy. Inaclagan, Atimonan, Quezon', '9363177058', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000761, '3', 'MOLENILLA, JERONE B.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9777700081', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000762, '5', 'MONFERO, DEMETRIA R.', 'Brgy. Zone 3, Atimonan, Quezon', '9204798193', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000763, '1', 'MONTEVIRGEN, MIKO AARON B.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9272523982', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000764, '1', 'MORALES, OSCAR A.', 'Brgy. Balubad, Atimonan, Quezon', '9098764202', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000765, '3', 'MORALES, AMADO F.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000766, '3', 'MORALES, FRANCISCO A.', 'Purok Ilaya, Atimonan, Quezon', '9093944611', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000767, '5', 'MORALES, WILBERT A.', 'Brgy. Caridad Ibaba, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000768, '5', 'MORALES, ROSALIE P.', 'Unspecified, Atimonan, Quezon', '3165278', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000769, '1', 'MORONDOZ, ANJANETTE .', 'Brgy. Mangalayan, Atimonan, Quezon', '9167049473', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000770, '5', 'MURILLO, MARY JANE A.', 'Brgy. Tagbakin, Atimonan, Quezon', '9094306866', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000771, '1', 'MURPHY, MA. LOURDES A.', 'Brgy. San Rafael, Atimonan, Quezon', '92207752144', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000772, '5', 'NACE, ERWIN B.', 'PUROK 4, BRGY. SAN RAFAEL, Atimonan, Quezon', '9179204651', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000773, '5', 'NALDO, JAY-R B.', 'Brgy. PuÃ‘on, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000774, '1', 'NANONG, CRISANTO C.', 'Brgy. Caridad Ibaba, Atimonan, Quezon', '9082211488', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000775, '3', 'NAPEÑAS, PHILIP P.', 'Brgy. Matanag, Atimonan, Quezon', '9465301675', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000776, '3', 'NAZARENO, JANICE L.', 'Brgy. Buhangin, Atimonan, Quezon', '9158384181', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000777, '5', 'NAZARENO, ERWIN R.', 'Brgy. Villa Ibaba, Atimonan, Quezon', '9355820108', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000778, '5', 'NERA, EDCEL MEDEL A.', 'Brgy. Tagbakin, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000779, '1', 'NERA, MICAHEL L.', 'Brgy. Malinao Ibaba, Atimonan, Quezon', '9095775662', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000780, '5', 'NERA, ALVIN A.', 'BRGY. MANGGALAWAN LABAK, Atimonan, Quezon', '9508227418', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000781, '5', 'NERA, EVANGERIC A.', 'Brgy. Tagbakin, Atimonan, Quezon', '9108014936', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000782, '5', 'NEVERA, NERELYN S.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9975229886', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000783, '5', 'NIALA, MONICA V.', 'Brgy. San Rafael, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000784, '1', 'NIERVA, ARNULFO G.', 'Brgy. Zone 3 Poblacion, Atimonan, Quezon', '9501361480', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000785, '3', 'NOLLES, NORLY L.', 'Brgy. Caridad, Atimonan, Quezon', '9283108932', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000786, '5', 'NORIESTA, CERNAN P.', 'Brgy. Talaba, Atimonan, Quezon', '910072199', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000787, '1', 'NOSA, REMELYN D.', 'Brgy. Angeles, Atimonan, Quezon', '9984283648', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000788, '5', 'NULLAR, MARIETTA M.', 'Brgy. Manggalayan Labak, Atimonan, Quezon', '9463450950', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000789, '5', 'OBENIETA, ARNOLD P.', 'Brgy. Montes Balaon, Atimonan, Quezon', '9772153776', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000790, '3', 'OBIEN, IDENORA H.', 'Brgy. Buhangin, Atimonan, Quezon', '9073433575', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000791, '5', 'OCAMPO, MARVIN P.', 'Brgy. Talaba, Atimonan, Quezon', '9092602037', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000792, '7', 'OLAVIAGA, RHODELIA B.', 'Purok Munting Sambat, Brgy. Tambakin, Atimonan, Quezon', '9093774683', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000793, '1', 'OLIGO, CHRISTOPHER L.', 'Brgy. Ponon, Atimonan, Quezon', '9051632867', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000794, '3', 'OLIVAR, ANGELO R.', 'Brgy. Malinao Ilaya, Atimonan, Quezon', '9955579845', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000795, '1', 'OLVIDA, MARY JOY F.', 'Brgy. Candad Ilaya, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000796, '5', 'OMBAO, EDELINA B.', 'Brgy. Malusak, Atimonan, Quezon', '9207054257', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000797, '1', 'OPE&NTILDE;A, JR., ROMAN O.', '179 Purok Pipisik, Brgy. Caridad Ibaba, Atimonan, Quezon', '9195646822', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000798, '5', 'ORDOÑA, RONALDO B.', 'Brgy. Rizal, Atimonan, Quezon', '948272376', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000799, '3', 'ORENSE, REGAN T.', 'Brgy. Lakip, Atimonan, Quezon', '9982894053', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000800, '3', 'ORIBE, ELSIE M.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9159191588', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000801, '5', 'ORIEL, ROFIL S.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000802, '3', 'ORIEL, EDEN E.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9058058697', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000803, '5', 'ORIEL, PAULINE JOANA S.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9051032482', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000804, '3', 'ORTIZ, RONALDO B.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000805, '5', 'ORTIZ, JOSELITO A.', 'Brgy. Caridad Ibaba, Atimonan, Quezon', '9101287115', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000806, '5', 'ORTIZ, JOSELITO E.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000807, '5', 'ORTIZ, GILBERT A.', 'Brgy. Labak, Atimonan, Quezon', '9498904717', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000808, '1', 'ORTIZ, MARLITO G.', 'Brgy. San Andres Bundok, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000809, '3', 'ORTIZ, ALEXIS JEHAN C.', 'Brgy. Zone 4, Atimonan, Quezon', '9076960323', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000810, '3', 'ORTIZ, II, FERNANDO A.', 'Brgy. Zone 4, Atimonan, Quezon', '9123477536', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000811, '5', 'ORTIZ, JR., BETHOVEN A.', '522 OsmeÑa Street, BRGY. ZONE 3, Atimonan, Quezon', '9483221875', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000812, '3', 'OSORIO, JAMAIKKA G.', 'Brgy. Angeles, Atimonan, Quezon', '9460832882', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000813, '5', 'PACUAN, JR., ERNESTO R.', 'Brgy. MalinaoA, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000814, '5', 'PADILLA, JOEL A.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000815, '5', 'PADILLA, FREDDERICK L.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000816, '5', 'PAJARILLO, MAYA B.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000817, '5', 'PALAGANAS, JR., NICASIO R.', 'Brgy. Malusak, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000818, '1', 'PALERMO, JOEL M.', 'BRGY. ZONE 2, Atimonan, Quezon', '9094704200', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000819, '1', 'PALERO, ENRIQUE V.', 'Brgy. Tagbakin, Atimonan, Quezon', '9059316604', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000820, '5', 'PANAL, ROIEANNE JENEL S.', 'Brgy. Zone 1 Poblacion, Atimonan, Quezon', '9562147015', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000821, '5', 'PANALIGAN, JAY-R M.', 'Brgy. Montes Kallagan, Atimonan, Quezon', '9362264398', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000822, '1', 'PANTIG, MARJON M.', 'Brgy. Tagbakin, Atimonan, Quezon', '9396515033', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000823, '3', 'PANTIG, JEIGH M.', 'Brgy. , Atimonan, Quezon', '9506656399', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000824, '1', 'PAR, NOLLY L.', 'Brgy. Sokol, Atimonan, Quezon', '9070657827', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000825, '5', 'PAR, CESAR S.', 'Brgy. Malusak, Atimonan, Quezon', '9096857850', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000826, '5', 'PAR, MA. ELIZABETH ANNE A.', 'Brgy. Malusak, Atimonan, Quezon', '90186258216', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000827, '5', 'PAR, FRANCIS RAYMOND P.', 'BRGY. RIZAL, Atimonan, Quezon', '9208965488', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000828, '5', 'PAR, RICHARD D.', 'Brgy. Matanag, Atimonan, Quezon', '9127140372', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000829, '7', 'PAR, JR., AVELINO M.', 'Brgy. Montes Balaon, Atimonan, Quezon', '9555711648', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000830, '5', 'PARAFINA, JHUN VINCENT O.', 'BRGY. MAGSAYSAY, Atimonan, Quezon', '9306416095', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000831, '3', 'PARAFINA, JOHN RUSSEL B.', 'Brgy. Caridad Ibaba, Atimonan, Quezon', '946142856', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000832, '1', 'PARAFINA, JULIET B.', 'Brgy. Malurak, Atimonan, Quezon', '9127443283', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000833, '1', 'PARAFINA, EDISON B.', 'Brgy. Lubi, Atimonan, Quezon', '9059307455', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000834, '3', 'PARCO, ECERMAN B.', 'Brgy. Iskong Bantay, Zone I, Atimonan, Quezon', '9302904109', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000835, '3', 'PARCO, ROGELINE C.', 'Brgy. Manggalayan Labak, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000836, '3', 'PARCO, RIZA B.', 'Brgy. Kulawit, Atimonan, Quezon', '9104301060', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000837, '5', 'PARCO, MILLIAN KEN P.', 'Brgy. Malinaw Ilaya, Atimonan, Quezon', '9285967166', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000838, '5', 'PARCO, ALLAN V.', 'Brgy. Angeles, Atimonan, Quezon', '9953298654', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000839, '3', 'PARCO, HECTOR A.', 'Brgy. Buhangin, Atimonan, Quezon', '9197391836', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000840, '3', 'PARCO, AGA MARK ARVIN B.', '1129 Angeles, Atimonan, Quezon', '9356262966', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000841, '5', 'PARDIÑAS, ROSARIO C.', 'Brgy. Zone 1, Poblacion, Atimonan, Quezon', '9487165137', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000842, '3', 'PARDINES, CHARITO M.', 'Brgy. Tagbakin, Atimonan, Quezon', '9184624928', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000843, '5', 'PARDITO, MACARIO E.', 'Brgy. Inalig, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000844, '1', 'PARDO, JOSE JAY V.', 'BRGY. TINANDOG, Atimonan, Quezon', '9206092198', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000845, '5', 'PARDO, BRIAN V.', 'BRGY. TINANDOG, Atimonan, Quezon', '9179285551', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000846, '1', 'PARDO, JR., LEONARDO A.', 'Brgy. Caridad Ibaba, Atimonan, Quezon', '951007125', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000847, '3', 'PAREDES, SHEILA R.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9757458307', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000848, '1', 'PARIAN, KYLAN NICOLE B.', 'BRGY. TAGBAKIN, Atimonan, Quezon', '9079092965', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000849, '3', 'PARIN, RICARDO GERRY D.', 'Brgy. Poblacion, Atimonan, Quezon', '9298425341', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000850, '5', 'PAROCHA, NENALYN A.', 'Brgy. Angeles, Atimonan, Quezon', '9078482893', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000851, '5', 'PAROLA, RUEL P.', 'Brgy. Caridad Ibaba, Atimonan, Quezon', '9100326109', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000852, '5', 'PASADILLA, HAROLD R.', 'BRGY. SANTA CATALINA, Atimonan, Quezon', '9971970309', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000853, '5', 'PASADILLA, ANGELICA R.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9265515608', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000854, '1', 'PASAMBA, LINO V.', 'R. Diaz Street, Brgy. Zone IV, Atimonan, Quezon', '917631828', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000855, '3', 'PASAMBA, MERCEDITA V.', 'Brgy. Matanag, Atimonan, Quezon', '9196110841', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000856, '1', 'PASAMBA, RAMIL A.', 'Brgy. Matanag, Atimonan, Quezon', '9215732375', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000857, '7', 'PATENIO, OSCAR P.', 'Brgy. Inalig, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000858, '1', 'PATIÑO, JOSE MACARIO ERNIE V.', 'Brgy. Tagbakin, Atimonan, Quezon', '9175012260', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000859, '7', 'PATIÑO, JR., AUGUSTO E.', 'BRGY. INALIG, Atimonan, Quezon', '9465468305', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000860, '3', 'PAULAR, JONATHAN E.', 'Brgy. Caridad Ibaba, Atimonan, Quezon', '9487499302', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000861, '3', 'PAULI, SUSANA V.', 'Brgy. Kilait, Atimonan, Quezon', '9367860466', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000862, '3', 'PAYLANDE, RODEL C.', 'Brgy. Kulawit, Atimonan, Quezon', '9097846928', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000863, '5', 'PAYNO, MARVIN B.', 'Brgy. Caridad Ibaba, Atimonan, Quezon', '9304036798', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000864, '5', 'PAZ, ALBERTA M.', 'Brgy. Villa Ibaba, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000865, '1', 'PAZ, HANZEL V.', 'Brgy. Malinao Ilaya, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000866, '1', 'PAZ, RITCMON R.', 'BRGY. TINANDOG, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000867, '3', 'PEALANE, RICKSON D.', 'BRGY. MALUSAK, Atimonan, Quezon', '9501722558', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000868, '1', 'PEÑA , JOSHUA DAN C.', 'Brgy. Caridad Ibaba, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000869, '5', 'PEDRIALVA, ZYRENELLE E.', 'BRGY. SAN ISIDRO, Atimonan, Quezon', '9219974455', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000870, '1', 'PERDEZ, EFREN C.', 'Brgy. Balunguhin, Atimonan, Quezon', '9107240245', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000871, '5', 'PEREYRA, JR., JOEL V.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9551768184', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000872, '3', 'PEREZ, DOMINIC R.', 'Brgy. Tagbakin, Atimonan, Quezon', '9392920770', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000873, '5', 'PEREZ, RONA G.', 'Brgy. Malinao, Atimonan, Quezon', '9473564280', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000874, '1', 'PERMEJO, ROMER C.', 'Brgy. Malusak, Atimonan, Quezon', '9196278275', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000875, '1', 'PERMIJO, ROSALIE P.', 'Brgy. Habingan, Atimonan, Quezon', '9484933719', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000876, '1', 'PETALLAR, JR., VIRGILIO L.', 'PUROK DALAMPASIGAN, BRGY. ANGELES, Atimonan, Quezon', '9077268583', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000877, '3', 'PINEDA, VOY BRANDY G.', 'Brgy. Kulawit, Atimonan, Quezon', '9465915033', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000878, '3', 'PIZARRO, RICARIO P.', 'Brgy. Manggalayan Labak, Atimonan, Quezon', '9298490463', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000879, '5', 'PONDEVIDA, CHERRY LYN E.', 'Brgy. Lumutan, Atimonan, Quezon', '9463718811', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000880, '5', 'PORNASDORO, MILDREN G.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9050281117', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000881, '5', 'POTES, JOSEPH J.', 'Brgy. Lumutan, Atimonan, Quezon', '9465229656', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000882, '3', 'PRANADA, JOVEN A.', 'BRGY. SAN ISIDRO, Atimonan, Quezon', '9485413391', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000883, '3', 'PRE, JOSEPH NATHANIEL S.', 'Brgy. Kilait, Atimonan, Quezon', '9090059302', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000884, '7', 'PRUDENTE, SHIELA MAY V.', 'Brgy. Villa Ilaya, Atimonan, Quezon', '9394933985', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000885, '5', 'PUJEDA, JAYSON R.', 'BRGY. ZONE 4, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000886, '3', 'PULOPOT, ALDRIN A.', 'Brgy. Talaba, Atimonan, Quezon', '9502777690', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000887, '1', 'QUEJANO, BERNARD T.', 'BRGY. CARIDAD IBABA, Atimonan, Quezon', '930197531', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000888, '5', 'QUEROZ, RONEL S.', 'Purok 1, Brgy. Lakip, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000889, '3', 'QUIMORA, AIREN Q.', 'Brgy. Canda Ibaba, Atimonan, Quezon', '9484800497', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000890, '3', 'QUISTO, MARIA LUISA V.', 'Brgy. Buhangin, Atimonan, Quezon', '9984283626', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000891, '1', 'RABI, APOLO P.', 'Brgy. Poblacion, Atimonan, Quezon', '9396555554', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000892, '5', 'RACELIS, CONSUELO R.', 'Brgy. Buhangin, Atimonan, Quezon', '9104490851', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000893, '5', 'RAMIREZ, JESSA MAE A.', 'Brgy. Manggalayan Labak, Atimonan, Quezon', '9457585883', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000894, '5', 'RAMIREZ, JEREMY A.', 'Brgy. Manggalayan Labak, Atimonan, Quezon', '9552991877', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000895, '3', 'RAMIREZ, EMMANUEL B.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9980679084', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000896, '3', 'RAMON, JOEL V.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9058562119', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000897, '3', 'RAMON, ERWIN V.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9260272689', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000898, '3', 'RAMON, RAQUEL A.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9262344595', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000899, '5', 'RAMON, MICHAEL A.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9557609526', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000900, '5', 'RAMON, JR., ABELARDO A.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9355280162', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000901, '5', 'RAMOS, CONCHITA P.', 'Brgy. Zone 1, Atimonan, Quezon', '93974543810', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000902, '1', 'RAMOS, BRYAN C.', '1330 Zamora Street, BRGY. ZONE 4, Atimonan, Quezon', '9273974891', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000903, '5', 'RAMOS, ARMANDO .', 'Caridad Ilanya, Atimonan, Quezon', '9092310778', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000904, '5', 'RAMOS, JOMAR .', 'Brgy. Zone 3, Atimonan, Quezon', '9272976873', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000905, '5', 'RAMOS, BENIGNO B.', 'Brgy. Zone 3, Atimonan, Quezon', '9504774797', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000906, '5', 'RAMOS, JR., CHARLIE E.', 'Brgy. Kilait, Atimonan, Quezon', '9077271404', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000907, '1', 'REA, RODELO L.', 'Brgy. Kulawit, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000908, '5', 'REA, REYNALDO L.', 'Brgy. Kulawit, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000909, '5', 'RECAÑA, CARLA B.', 'Brgy. Buhangin, Atimonan, Quezon', '9093233675', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000910, '3', 'RED, JOHN DAMMES P.', 'Brgy. Inalig , Atimonan, Quezon', '9991803951', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000911, '5', 'REGIO, SHEILA MARIE L.', 'Brgy. Poblacion Zone 3, Atimonan, Quezon', '9074732661', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000912, '3', 'REPASO, AMORSOLO V.', 'Brgy. Villa Ilaya, Atimonan, Quezon', '9487338516', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000913, '5', 'REPASO, ALFREDO V.', 'Brgy. Villa Ilaya, Atimonan, Quezon', '9078395767', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000914, '5', 'REPASO, RODEL E.', 'Brgy. Villa Ilaya, Atimonan, Quezon', '9128794485', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000915, '1', 'REPASO, NIÑO VAL E.', 'Brgy. Villa Ilaya, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000916, '1', 'RESTAN, ROCELYN A.', 'Brgy. Malinao Ilaya, Atimonan, Quezon', '9984849095', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000917, '5', 'RESTAR, JEIRUEL P.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9564753473', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000918, '5', 'RETIS, NESTOR T.', 'Brgy. San Isidro, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000919, '5', 'REUFRER, JOSEPH B.', 'BRGY. BUHANGIN, Atimonan, Quezon', '9995749238', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000920, '5', 'REYES, MARIETA A.', 'BRGY. ZONE 4, Atimonan, Quezon', '9214866378', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000921, '5', 'REYES, ARIEL Q.', 'BRGY. SANTA CATALINA, Atimonan, Quezon', '9277964212', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000922, '3', 'REYES, CHERRY ANN L.', 'Purok 1, Brgy. Habingan, Atimonan, Quezon', '9077725290', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000923, '5', 'REYES, ELIZABETH M.', 'Brgy. Malusak, Atimonan, Quezon', '9501088599', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000924, '3', 'REYES, JOHN ROMMIEL S.', 'Brgy. Buhangin, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000925, '3', 'REYES, ROSANA M.', 'Brgy. Ponon, Atimonan, Quezon', '9152142922', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000926, '3', 'REYES, MARICEL G.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9166980074', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000927, '5', 'REYES, GREGORIO A.', 'Brgy. Balubad, Atimonan, Quezon', '9283409775', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000928, '3', 'REYES, JOMARI D.', 'Brgy. Malinao Ilaya, Atimonan, Quezon', '9272214122', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000929, '5', 'REYES, JOSEPH T.', 'Brgy Zone 2, Atimonan, Quezon', '9126964444', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000930, '5', 'RICAFORT, PERLA S.', 'Brgy. Talaba, Atimonan, Quezon', '9098827501', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000931, '5', 'RICAFRANCA, SANDY P.', 'Brgy. San Rafael, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000932, '5', 'RICAFRANCA, KEVIN BRYAN P.', 'Brgy. San Rafael, Atimonan, Quezon', '9291298044', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000933, '5', 'RICAFRENTE, ANNABEL L.', 'Brgy. Caridad Ibaba, Atimonan, Quezon', '9460629395', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000934, '3', 'RICO, NOLILON C.', 'BRGY. TAGBAKIN, Atimonan, Quezon', '9199005279', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000935, '5', 'ROA, JOCELYN L.', 'Brgy. Ponon, Atimonan, Quezon', '9352597533', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000936, '3', 'ROALES, JAY AR D.', 'Brgy. Angeles, Atimonan, Quezon', '9306098232', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000937, '5', 'ROBLE, MERGIE D.', 'Brgy. Manggalayan Labak, Atimonan, Quezon', '9503623723', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000938, '3', 'ROBLES, TESSIE V.', 'Brgy. Ponon, Atimonan, Quezon', '9757603985', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000939, '3', 'ROBLES, ROMMEL C.', 'BRGY. PONON, Atimonan, Quezon', '9284655101', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000940, '3', 'ROCABO, MARIO E.', 'Brgy. Magsaysay, Atimonan, Quezon', '9262074614', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000941, '7', 'ROCAS, RONALD B.', '1949 Leon Guinto, Zone 1, Atimonan, Quezon', '9123455721', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000942, '3', 'RODIL, DENNIS A.', 'Brgy. Montes Balaon, Atimonan, Quezon', '9354443669', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000943, '5', 'RODRIGUEZ, JAN PAULO L.', 'Brgy. Balubad, Atimonan, Quezon', '9166283652', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000944, '1', 'ROGA, AMANDO P.', 'Brgy. Kilait, Atimonan, Quezon', '9071572385', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000945, '1', 'ROGA, RODEL S.', 'Brgy. Libi, Atimonan, Quezon', '9194360622', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000946, '5', 'ROLLERA, FREDERICK Q.', 'Brgy. , Atimonan, Quezon', '9396356503', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000947, '5', 'ROMUALDO, ALDRIN S.', 'Brgy. Tagbakin, Atimonan, Quezon', '9214873040', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000948, '7', 'ROMUAR, MARIA CELESTE R.', 'Brgy. Caridad Ibaba, Atimonan, Quezon', '9505275958', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000949, '3', 'RONQUILLO, ANTHONY R.', 'Brgy. Malusak, Atimonan, Quezon', '9307648534', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000950, '5', 'ROS, CARLOS R.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9190733856', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000951, '1', 'ROSALES, LORENZO A.', 'BRGY. SOTOL, Atimonan, Quezon', '9100604173', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000952, '1', 'ROSLINDA, JEPERSON B.', 'BRGY. ZONE 4 POBLACION, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000953, '1', 'ROTAQUIO, AIRHEEN G.', 'Brgy. Angeles, Atimonan, Quezon', '9304835653', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000954, '5', 'RUGA, CHRISTOPHER M.', 'Brgy. Tagbakin, Atimonan, Quezon', '9125654121', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000955, '5', 'SAAVEDRA, WILSON JARIUS M.', 'Brgy. Caridad, Atimonan, Quezon', '95055012040', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000956, '3', 'SAAVEDRA, ANGELITO E.', 'Brgy. Malusak, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000957, '5', 'SAAVEDRA, PERLA P.', 'Brgy. Malusak, Atimonan, Quezon', '9101051403', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000958, '3', 'SAAVEDRA, ROWENA Z.', 'Brgy. Manggalayan Labak, Atimonan, Quezon', '9357955891', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000959, '5', 'SAAVEDRA, CHRISTOPHER V.', 'Brgy. Labak, Atimonan, Quezon', '9095175210', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000960, '5', 'SAAVEDRA, GIOVANNI P.', 'Brgy. Zone 2, Atimonan, Quezon', '9778300972', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000961, '3', 'SAAVEDRA, DENNIS V.', 'Brgy. Sapaan, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000962, '3', 'SAAVEDRA, MILBERT P.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000963, '5', 'SAAVEDRA, HAROLD C.', 'Brgy. Zone 1, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000964, '1', 'SAAVEDRA, JOHN BRYAN N.', 'Brgy. Manggalayan Labak, Atimonan, Quezon', '9952435670', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000965, '5', 'SAAVERRA, JERWIN O.', 'Brgy. Inalig, Atimonan, Quezon', '9983202157', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000966, '1', 'SABAS, FRANCISCO FRANKLIN V.', 'Brgy. Baloguhin, Atimonan, Quezon', '9093289142', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000967, '5', 'SABAS, RODEL P.', 'Brgy. Balugahin, Atimonan, Quezon', '9489229157', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000968, '5', 'SABORDO, GIANNE JOY L.', 'Brgy. Ponon, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6');
INSERT INTO `donors` (`id`, `type_id`, `donor_name`, `address`, `contact`, `municipality_id`, `bank_id`, `created_at`, `updated_at`, `administrator_id`) VALUES
(00000000969, '5', 'SAJALBO, EDWIN C.', 'Zone IV Poblacion, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000970, '5', 'SALAMAT, CRIS NORMAN J.', 'Brgy. Tagbakin, Atimonan, Quezon', '9369158798', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000971, '5', 'SALES, EDMAR L.', 'Brgy. Rizal, Atimonan, Quezon', '9483915796', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000972, '3', 'SALINAS, CECILLE R.', 'Brgy. Malinao Ibaba, Atimonan, Quezon', '9128752654', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000973, '5', 'SALUDES, ROBERTO C.', 'BRGY. SAPAAN, Atimonan, Quezon', '9752831904', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000974, '3', 'SALUDES, LIZA S.', 'Brgy. Balubad, Atimonan, Quezon', '9217266082', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000975, '7', 'SALVADOR, CLINTON JAMES L.', 'Brgy. San Isidro, Atimonan, Quezon', '9109622469', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000976, '5', 'SAMSON, MARWIN R.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9281208815', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000977, '1', 'SAN JOSE, ARVIN M.', 'Brgy. Angeles, Atimonan, Quezon', '9509928174', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000978, '5', 'SANIEL, EMIL N.', 'Brgy. Zone 1, Poblacion, Atimonan, Quezon', '9192899456', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000979, '5', 'SANIEL, RONALDO F.', 'Brgy. Villa Ibaba, Atimonan, Quezon', '9309976257', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000980, '5', 'SANIEL, ZACARIAS G.', 'BRGY. BUHANGIN, Atimonan, Quezon', '9466291096', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000981, '5', 'SANIEL, RICARDO F.', 'Brgy. Villa Ibaba, Atimonan, Quezon', '9070657731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000982, '1', 'SANIEL, ELMOR A.', 'Brgy. Balubad, Atimonan, Quezon', '9226846804', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000983, '1', 'SANIEL, RONAN A.', 'Brgy. Balubad, Atimonan, Quezon', '9124102231', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000984, '5', 'SANIEL, LEOPOLDO V.', 'BRGY. BALUBAD, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000985, '5', 'SANIEL, MICHAEL B.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000986, '3', 'SANSAET, RENATO M.', 'Brgy. Malinao Ilaya, Atimonan, Quezon', '9464947468', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000987, '5', 'SANTAMARIA, JOBERT V.', 'Brgy. Lumutan, Atimonan, Quezon', '9203126254', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000988, '5', 'SANTANDER, FRANCISCO J.', 'Brgy. Inaclagan, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000989, '1', 'SANTANDER, FHILIP NESSANDER F.', 'Brgy. Caridad Ibaba, Atimonan, Quezon', '9100729631', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000990, '5', 'SANTIAGO, MICHAEL BRENT C.', 'BRGY. MAGSAYSAY, Atimonan, Quezon', '9465601870', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000991, '5', 'SANTIDAD, JEREMY M.', 'Brgy. Matanag, Atimonan, Quezon', '9385828512', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000992, '1', 'SANTOALLA, ANGELINA M.', 'Brgy. Balubad, Atimonan, Quezon', '9465588314', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000993, '7', 'SARDIA, RULINO E.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9291218146', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000994, '5', 'SARTE, BERNARD P.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9972232190', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000995, '1', 'SAYSON, KENNETH L.', 'BRGY. SANTA CATALINA, Atimonan, Quezon', '9504645031', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000996, '5', 'SEBIAL, ALDRIN M.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '946046507', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000997, '1', 'SEBOC, VICTORIA B.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9354093499', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000998, '5', 'SENON, SHAHANNI L.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9755371699', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000000999, '5', 'SOCORRO, JOHN RHOMIN M.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9305348390', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001000, '1', 'SOGONI, REGGIE A.', 'Brgy Lubi, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001001, '1', 'SOLANO, CLEOTILDE A.', 'BRGY. TINANDOG, Atimonan, Quezon', '9071200905', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001002, '1', 'SOLIS, JERVIN G.', 'BRGY. TAGBAKIN, Atimonan, Quezon', '9127984870', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001003, '5', 'SORITO, WENDELYN S.', 'Brgy. Mahinao, Atimonan, Quezon', '9126353807', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001004, '3', 'SORNO, LEIVEN LUKE L.', 'Brgy. Talaba, Atimonan, Quezon', '9464325529', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001005, '5', 'STO. DOMINGO, CRISTINA L.', 'Brgy. Malusak, Atimonan, Quezon', '9108273997', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001006, '3', 'SUMACAL, FERNANDO E.', 'Brgy. Lumutan, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001007, '5', 'SUMALINAO, IRISH F.', 'Brgy. Zone 4, Atimonan, Quezon', '9198913016', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001008, '5', 'TABANYAG, JERALYN M.', 'Brgy. Angeles, Atimonan, Quezon', '9097807883', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001009, '5', 'TABLANTE, RODANTE A.', 'Brgy. Malinao Ilaya, Atimonan, Quezon', '9238428210', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001010, '5', 'TABLATE, JR., TEODULO P.', 'Brgy. Caridad Ibaba, Atimonan, Quezon', '9187742736', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001011, '3', 'TAN, JOSE JIMMY M.', '444 MABINI STREET, Atimonan, Quezon', '9293407087', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001012, '1', 'TAN, RHODORA B.', 'Brgy. Zone 4, Poblacion, Atimonan, Quezon', '9177237962', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001013, '7', 'TAN CASTRO, JR., CAMILO B.', 'Unspecified, Atimonan, Quezon', '9178760092', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001014, '5', 'TANAY, AILEEN P.', 'Brgy. Tumandag, Atimonan, Quezon', '9076836736', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001015, '3', 'TARDECILLA, GERRY N.', 'Brgy. Libak, Atimonan, Quezon', '9460659115', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001016, '1', 'TERCIANO, MANUEL P.', 'Brgy. Montes Balaon, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001017, '5', 'TICSAY, MARLON REGAN Q.', 'Brgy. Talaba, Atimonan, Quezon', '9307284632', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001018, '5', 'TIERRA, KENNETH MARK ANTHONY B.', 'BRGY. SANTA CATALINA, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001019, '5', 'TIERRA, ROBERT E.', 'Brgy. Malinao Ilaya, Atimonan, Quezon', '9503623035', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001020, '1', 'TIERRA, REMYNETH V.', 'Brgy. Kilait, Atimonan, Quezon', '9128719733', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001021, '5', 'TIERRA, KAYE HAROLD V.', 'Brgy. Buhangin, Atimonan, Quezon', '9202024808', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001022, '3', 'TIERRA, HAYDEE V.', 'Brgy. Banhangin, Atimonan, Quezon', '9079106992', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001023, '5', 'TIQUE, RUEL E.', 'BRGY. MAGSAYSAY, Atimonan, Quezon', '9076829974', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001024, '5', 'TORRES, JOEFHEL .', 'Brgy. Tagbakin, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001025, '1', 'TORRES, JOSIELYN D.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9068190887', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001026, '5', 'TUNACAO, KEINYLLE S.', 'Brgy. Malirao Ilaya, Atimonan, Quezon', '9478778538', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001027, '5', 'TUNDAG, BERNARDO G.', 'Brgy. San Rafael, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001028, '5', 'TUPLANO, MYLEN M.', 'Brgy. San Isidro, Atimonan, Quezon', '9787250060', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001029, '1', 'UCANG, SONNY BOY M.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9673163256', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001030, '3', 'URGINO, CHONA G.', 'Brgy. Talaba, Atimonan, Quezon', '9955575842', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001031, '3', 'URSABIA, WALTER A.', '579 Brgy. San Isidro, Atimonan, Quezon', '9398866686', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001032, '5', 'URTAL, FROILAN A.', 'Brgy. Lubi, Atimonan, Quezon', '9351968931', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001033, '1', 'URTAL, LOURDES A.', 'Brgy. Lubi, Atimonan, Quezon', '946499550', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001034, '5', 'URTAL, II, EMETERIO L.', 'Brgy. Buhangin, Atimonan, Quezon', '9308677788', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001035, '7', 'URTOLA, MELISSA D.', 'Brgy. Soler Extension, Atimonan, Quezon', '9127987989', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001036, '1', 'VALDEZ, REX C.', 'Brgy. Kulawit, Atimonan, Quezon', '9484809244', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001037, '5', 'VALDEZ, RAMON D.', 'Brgy. Buhangin, Atimonan, Quezon', '9129988105', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001038, '3', 'VALENCIA, BILLY O.', '722 Dr. Ramon Soler Street, Brgy. Zone III, Atimonan, Quezon', '9300340410', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001039, '5', 'VALENCIA, ANTHONY .', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001040, '3', 'VALENZARIO, ELISA L.', 'Brgy. Zone 2 Poblacion, Atimonan, Quezon', '9463178345', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001041, '5', 'VALERA, CHRISTOPHER C.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9502306776', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001042, '1', 'VALES, RENZY V.', 'Brgy. Zone 10, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001043, '5', 'VALLESTEROS, MARIEL P.', 'Brgy. Manggalayang Labak, Atimonan, Quezon', '9481830876', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001044, '5', 'VALLESTEROS, KIM MARCIAL A.', 'Brgy. Zone 4, Atimonan, Quezon', '9296589602', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001045, '3', 'VALLESTEROS, KRISTELL E.', 'Brgy. Buhangin, Atimonan, Quezon', '9070830498', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001046, '7', 'VARGAS, RHANREBB V.', 'Brgy. Tagbakin, Atimonan, Quezon', '9269508399', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001047, '3', 'VASQUEZ, CLEVY T.', 'Brgy. Malinaw Ibaba, Atimonan, Quezon', '9292947509', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001048, '3', 'VELASCO, ANNIELIZA B.', 'Brgy. Balugahin, Atimonan, Quezon', '9984283752', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001049, '1', 'VELASCO, ELMER M.', 'Brgy. Labak, Atimonan, Quezon', '9465588388', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001050, '5', 'VELUZ, MERALD S.', 'Purok Munting Sambot, Brgy. Tagbakin, Atimonan, Quezon', '9126031784', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001051, '1', 'VERAN, EMMANUEL S.', 'P-7 Bryg. Habingan, Atimonan, Quezon', '9303585174', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001052, '5', 'VERAN, ALLAN M.', 'Sitio Ibaba, Brgy. Kulawit, Atimonan, Quezon', '9197064602', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001053, '5', 'VERANGA, DENNIS G.', 'Brgy. San Isidro, Atimonan, Quezon', '9101531715', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001054, '1', 'VERANGA, SHERWIN E.', 'Brgy. San Isidro, Atimonan, Quezon', '9092475602', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001055, '5', 'VERANGA, LORENZO CESAR F.', '1260 Gov. Castro Street, Brgy. Zone 3, Atimonan, Quezon', '9103629111', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001056, '1', 'VERANO, MELANIE D.', 'Brgy. Maligaya, Atimonan, Quezon', '9393012847', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001057, '5', 'VERASTIGUE, JONATHAN L.', 'Brgy. Lumutan, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001058, '5', 'VERASTIGUE, KIM RICHARD P.', 'Brgy. Malusak, Atimonan, Quezon', '9502768846', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001059, '5', 'VERASTIGUE, LEONORA Y.', 'Brgy. Habingan, Atimonan, Quezon', '9091148223', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001060, '3', 'VERASTIGUE, ERIC S.', 'Brgy. Habingan, Atimonan, Quezon', '9091148223', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001061, '1', 'VERASTIGUE, ROSALINA O.', 'Brgy. Habingan, Atimonan, Quezon', '9309753785', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001062, '3', 'VERASTIGUE, ALDOUS C.', 'Brgy. Malusak, Atimonan, Quezon', '9495895622', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001063, '5', 'VERASTIGUE, ALJOHN L.', 'Brgy. Angeles, Atimonan, Quezon', '9399403636', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001064, '3', 'VERASTIGUE, ARNOLD C.', 'Brgy. Lumuntan, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001065, '5', 'VERASTIGUE, ALFRED JOSEPH L.', 'Soler Street, Zone 2, Atimonan, Quezon', '9474610019', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001066, '5', 'VERDAGUER, MARK GERALD M.', 'Brgy. Caridad Ilaya, Atimonan, Quezon', '9301157275', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001067, '1', 'VERDAN, ANTONIO S.', 'Brgy. Lubi, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001068, '1', 'VERDAN, JONATHAN A.', 'Brgy. Lubi, Atimonan, Quezon', '9100528934', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001069, '3', 'VERDAN, DANIEL B.', 'Brgy. Lubi, Atimonan, Quezon', '9489159522', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001070, '7', 'VERDAN, EDILBERTO S.', 'Brgy. Lubi, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001071, '3', 'VERDAN, LEANDRO S.', 'BRGY. BUHANGIN, Atimonan, Quezon', '9504645235', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001072, '1', 'VERDAN, CHRISTINE JOY P.', 'BRGY. BUHANGIN, Atimonan, Quezon', '9504645235', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001073, '5', 'VERDAN, RECHELLE P.', 'Brgy. Manggalayan, Atimonan, Quezon', '9124121915', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001074, '3', 'VERGAÑO, NORMAN A.', 'Brgy. San Isidro, Atimonan, Quezon', '9076384851', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001075, '1', 'VERGANIO, LEO ANGELO A.', 'Brgy. Malinao Ibaba, Atimonan, Quezon', '9088410012', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001076, '3', 'VERGARA, RONALD O.', 'Unspecified, Atimonan, Quezon', '9075388065', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001077, '1', 'VERGARA, ELOISA P.', 'Brgy. San Isidro, Atimonan, Quezon', '9075388065', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001078, '5', 'VERZOSA, MA. CLAUDINE F.', 'Brgy. Zone 1, Atimonan, Quezon', '9275442816', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001079, '3', 'VESTIDAS, LEONORA P.', 'Brgy. Lumutan, Atimonan, Quezon', '9488048494', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001080, '1', 'VICENTE, ANDRIAN R.', 'Brgy. Zone 3, Atimonan, Quezon', '90199005080', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001081, '5', 'VIDAL, AMADO A.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9261172839', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001082, '3', 'VILA, DON MARK A.', 'Brgy. Tagbakin, Atimonan, Quezon', '9306625526', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001083, '5', 'VILA, RENNIEL G.', 'Brgy. Rizal, Atimonan, Quezon', '9466839615', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001084, '5', 'VILLA, CHRISTIAN N.', 'Brgy. Lakie, Atimonan, Quezon', '9129732167', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001085, '3', 'VILLA, RIO V.', 'Brgy. Labu, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001086, '1', 'VILLABROZA, JR., RONILO D.', 'Brgy. Lumuta, Atimonan, Quezon', '9072717284', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001087, '3', 'VILLACARLOS, ARNEL Q.', 'BRGY. ANGELES, Atimonan, Quezon', '9076209954', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001088, '5', 'VILLACARLOS, REX M.', 'Brgy. San Isidro, Atimonan, Quezon', '9079699523', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001089, '1', 'VILLACARLOS, CLIFFORD S.', 'Brgy. San Isidro, Atimonan, Quezon', '9094306493', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001090, '5', 'VILLACRUEL, ROSELLE G.', 'Brgy. Lubi, Atimonan, Quezon', '9396046919', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001091, '1', 'VILLAFLOR, AILEEN D.', 'Brgy. Andres Bundok, Atimonan, Quezon', '9161986394', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001092, '5', 'VILLAFLOR, JR., ROSAURO M.', 'Brgy. Lumutan, Atimonan, Quezon', '9388373090', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001093, '3', 'VILLAFRIA, RONNEL Q.', 'Brgy. Matanag, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001094, '1', 'VILLAMENA, MICHAEL G.', 'Brgy. San Andres, Atimonan, Quezon', '9069063226', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001095, '1', 'VILLAMIEL, HECTOR L.', 'Brgy. Zone 3, Atimonan, Quezon', '9216446479', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001096, '3', 'VILLAMIEL, MARLON CARLITO A.', 'Brgy. Buhangin, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001097, '1', 'VILLAMIEL, JUDEL J.', 'Brgy. Buhangin, Atimonan, Quezon', '9274150310', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001098, '5', 'VILLANIA, MART DALE A.', 'Brgy. Villa Ilaya, Atimonan, Quezon', '9150604211', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001099, '5', 'VILLANUEVA, MONETTE G.', 'Brgy. Angeles, Atimonan, Quezon', '9079307689', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001100, '1', 'VILLANUEVA, LEBELARDO S.', 'Brgy. Magsaysay, Atimonan, Quezon', '9501799076', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001101, '5', 'VILLANUEVA, MICO CHRISTOPHER B.', 'Brgy. Santa Catalina, Atimonan, Quezon', '9168861843', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001102, '1', 'VILLARAMA, ARIES JAY F.', 'Brgy. Tagbakin, Atimonan, Quezon', '9300441702', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001103, '3', 'VILLARAMA, JOEL A.', 'Brgy. Zone 3, Atimonan, Quezon', '9309868714', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001104, '3', 'VILLAREAL, ANGELINA L.', 'Brgy. Magsaysay, Atimonan, Quezon', '9129174748', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001105, '5', 'VILLARUBIA, LORELYN V.', 'Brgy. Zone 3, Atimonan, Quezon', '9499689058', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001106, '5', 'VILLARUBIA, JOVANI V.', 'Brgy. Zone 3, Atimonan, Quezon', '9460037922', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001107, '1', 'VILLASANTE, MARCELINO A.', 'OSMEÑA STREET, BRGY. Zone III, Atimonan, Quezon', '9481342415', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001108, '1', 'VILLASANTE, RENANTE I.', 'Brgy. Kilait, Atimonan, Quezon', '9759443137', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001109, '5', 'VILLASANTE, XAVIER D.', 'Brgy. Kilait, Atimonan, Quezon', '9455762232', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001110, '3', 'VILLASIN, JOHN MELCHOR T.', 'BRGY. LAKIP, Atimonan, Quezon', '9105008296', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001111, '1', 'VIVAR, JOHN DELMAR L.', 'BRGY. BUHANGIN, Atimonan, Quezon', '9483838553', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001112, '5', 'VIVAR, REINALDO P.', 'Brgy. Inalig, Atimonan, Quezon', '9285653373', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001113, '5', 'YOPYOP, JOEL P.', 'Brgy. Zone 3, Atimonan, Quezon', '9876399512', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001114, '5', 'YUBION, LEONITO G.', 'BRGY. INALIG, Atimonan, Quezon', '9508303731', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001115, '1', 'YUBION, ALVIN E.', 'BRGY. INALIG, Atimonan, Quezon', '9509928008', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001116, '5', 'ZATARAIN, RONALD BRYAN A.', 'Brgy. Zone 2, Atimonan, Quezon', '9154858748', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6'),
(00000001117, '5', 'ZATARAIN, JR., NESTER A.', 'Brgy. Zone 2, Atimonan, Quezon', '9774415939', '3', '1', '2023-01-09 13:06:36', '2023-01-09 13:06:36', '6');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventories`
--

CREATE TABLE `inventories` (
  `id` int(11) NOT NULL,
  `bank_id` int(11) UNSIGNED NOT NULL,
  `donor_id` varchar(255) NOT NULL,
  `type_id` varchar(255) NOT NULL,
  `evaluation_id` varchar(255) NOT NULL,
  `donated_at` datetime NOT NULL,
  `expired_at` datetime NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL,
  `administrator_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `municipalities`
--

CREATE TABLE `municipalities` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `status` int(1) NOT NULL COMMENT '0=disabled, 1=enabled',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL,
  `administrator_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `municipalities`
--

INSERT INTO `municipalities` (`id`, `name`, `logo`, `latitude`, `longitude`, `status`, `created_at`, `updated_at`, `administrator_id`) VALUES
(2, 'Agdangan', '63bc028222e8d.png', '13.875086237865823', '121.91381871700287', 1, '2023-01-09 12:03:14', '2023-01-09 12:18:36', '1'),
(3, 'Atimonan', '63bc02ad8b11c.png', '14.001909113548091', '121.92056179046631', 1, '2023-01-09 12:03:57', '2023-01-09 12:04:47', '1');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `id` int(1) NOT NULL,
  `symbol` varchar(25) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id`, `symbol`, `created_at`, `updated_at`) VALUES
(1, 'A+', '2023-01-07 19:06:40', '2023-01-07 19:06:40'),
(2, 'A-', '2023-01-07 19:06:40', '2023-01-07 19:06:40'),
(3, 'B+', '2023-01-07 19:06:57', '2023-01-07 19:06:57'),
(4, 'B-', '2023-01-07 19:06:57', '2023-01-07 19:06:57'),
(5, 'O+', '2023-01-07 19:07:10', '2023-01-07 19:07:10'),
(6, 'O-', '2023-01-07 19:07:10', '2023-01-07 19:07:10'),
(7, 'AB+', '2023-01-07 19:07:34', '2023-01-07 19:07:34'),
(8, 'AB-', '2023-01-07 19:07:34', '2023-01-07 19:07:34');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `role` int(1) NOT NULL COMMENT '0=super admin, 1=bank admin',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_id` int(11) UNSIGNED DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(1) NOT NULL COMMENT '0=disabled, 1=enabled',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `administrator_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `username`, `firstname`, `surname`, `email`, `contact`, `bank_id`, `password`, `status`, `created_at`, `updated_at`, `administrator_id`) VALUES
(1, 0, 'admin', 'Sajed', 'Mendoza', 'sajedhm@gmail.com', '09634905586', 0, '$2y$10$iXyaL12fZxvEC0jpMIOL4u5ZNcqabgVukEOMJy8j0TUdQ62aWhBiK', 1, '2023-01-08 14:40:14', '2023-01-08 14:40:14', '1'),
(5, 1, '63BB9193C0268', 'John', 'Wick', 'sajedhm@gmail.com', '09634905586', 2, '$2y$10$82yBVZ3TBEDA/I6SzqgKDeVjWsPEAQ6nsE3WFLdCf30M9L6jlZyd.', 1, '2023-01-09 04:01:23', '2023-01-09 04:01:23', '1'),
(6, 1, '63BC0AEF86BA5', 'Ryan', 'Villalon', 'ryanvillalon01@gmail.com', '09201210562', 1, '$2y$10$gqPHGSiT2RJJVrMGTx8M8eZy0jSsdx4IxP2iAfrkKiwG91PcrlMTy', 1, '2023-01-09 12:39:11', '2023-01-09 12:39:11', '1'),
(8, 1, '63BC10465142B', 'John', 'Villalon', 'ryanvillalon02@gmail.com', '0 920 121 0562', 2, '$2y$10$7BAo0luTPf6wBgiTfuii7uuq1rhs82B9XwaFq2KVEC8S0SfG1bf4q', 1, '2023-01-09 13:01:58', '2023-01-09 13:03:23', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrators`
--
ALTER TABLE `administrators`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `donors`
--
ALTER TABLE `donors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `inventories`
--
ALTER TABLE `inventories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bank_id` (`bank_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `municipalities`
--
ALTER TABLE `municipalities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrators`
--
ALTER TABLE `administrators`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `donors`
--
ALTER TABLE `donors`
  MODIFY `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1118;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventories`
--
ALTER TABLE `inventories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `municipalities`
--
ALTER TABLE `municipalities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
