-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 16, 2021 at 06:20 PM
-- Server version: 10.3.25-MariaDB-0ubuntu0.20.04.1
-- PHP Version: 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_app_simonster`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_app_setting`
--

CREATE TABLE `tb_app_setting` (
  `app_id` int(1) NOT NULL,
  `app_title` varchar(100) NOT NULL,
  `app_title_alt` varchar(50) NOT NULL,
  `fetch_data_time` int(11) NOT NULL,
  `footer_text` varchar(255) NOT NULL,
  `app_icon` varchar(255) NOT NULL,
  `app_logo_dark` varchar(255) NOT NULL,
  `app_logo_light` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_app_setting`
--

INSERT INTO `tb_app_setting` (`app_id`, `app_title`, `app_title_alt`, `fetch_data_time`, `footer_text`, `app_icon`, `app_logo_dark`, `app_logo_light`, `company_name`) VALUES
(1, 'Sistem Monitoring Suhu Data Center', 'SIMONSTER', 60000, 'SIMONSTER - DISKOMINFO KOTA TANGERANG', 'sites/simonster-icon.png', 'sites/logo-simonster-dark.png', 'sites/logo-simonster-light.png', 'DINAS KOMUNIKASI DAN INFORMATIKA KOTA TANGERANG');

-- --------------------------------------------------------

--
-- Table structure for table `tb_email_notifier`
--

CREATE TABLE `tb_email_notifier` (
  `email_id` int(11) NOT NULL,
  `email_address` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_login_data`
--

CREATE TABLE `tb_login_data` (
  `data_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cookie_value` varchar(255) DEFAULT NULL,
  `cookie_expire` int(11) DEFAULT NULL,
  `login_date` int(11) NOT NULL,
  `last_ip` varbinary(16) NOT NULL,
  `user_agent` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_login_data`
--

INSERT INTO `tb_login_data` (`data_id`, `user_id`, `cookie_value`, `cookie_expire`, `login_date`, `last_ip`, `user_agent`) VALUES
(1, 1, NULL, NULL, 1612288398, 0x7f000001, 'Chrome 88.0.4324.96 Linux'),
(2, 1, NULL, NULL, 1612288453, 0x7f000001, 'Chrome 88.0.4324.96 Linux'),
(3, 1, NULL, NULL, 1612288648, 0xc0a86414, 'Chrome 88.0.4324.104 Windows 10'),
(4, 1, NULL, NULL, 1612289007, 0x7f000001, 'Chrome 88.0.4324.96 Linux'),
(5, 1, NULL, NULL, 1612293325, 0x7f000001, 'Chrome 88.0.4324.96 Linux'),
(6, 1, NULL, NULL, 1612293366, 0xc0a86414, 'Chrome 88.0.4324.104 Windows 10'),
(7, 1, NULL, NULL, 1612340191, 0x7f000001, 'Chrome 88.0.4324.96 Linux'),
(8, 1, NULL, NULL, 1612351405, 0x7f000001, 'Chrome 88.0.4324.96 Linux'),
(9, 1, NULL, NULL, 1612376660, 0x7f000001, 'Chrome 88.0.4324.96 Linux'),
(10, 1, NULL, NULL, 1612377038, 0x7f000001, 'Chrome 88.0.4324.96 Linux'),
(11, 1, NULL, NULL, 1612425644, 0x7f000001, 'Chrome 88.0.4324.96 Linux'),
(12, 1, NULL, NULL, 1612426091, 0x7f000001, 'Chrome 88.0.4324.96 Linux'),
(13, 1, NULL, NULL, 1612430059, 0x7f000001, 'Chrome 88.0.4324.96 Linux'),
(14, 1, NULL, NULL, 1612571196, 0x7f000001, 'Chrome 88.0.4324.146 Linux'),
(15, 1, NULL, NULL, 1612576195, 0x7f000001, 'Chrome 88.0.4324.146 Linux'),
(16, 1, NULL, NULL, 1612656247, 0x7f000001, 'Chrome 88.0.4324.146 Linux'),
(17, 1, NULL, NULL, 1612658839, 0x7f000001, 'Chrome 88.0.4324.146 Linux'),
(18, 1, NULL, NULL, 1612661252, 0x7f000001, 'Firefox 68.0 Linux'),
(19, 1, NULL, NULL, 1612661952, 0x7f000001, 'Firefox 68.0 Linux'),
(20, 1, NULL, NULL, 1612665482, 0x7f000001, 'Chrome 88.0.4324.152 Linux'),
(21, 1, NULL, NULL, 1612782034, 0x7f000001, 'Firefox 85.0 Linux'),
(22, 1, NULL, NULL, 1612953748, 0x7f000001, 'Chrome 88.0.4324.152 Linux'),
(23, 1, NULL, NULL, 1612956181, 0x7f000001, 'Chrome 88.0.4324.152 Linux'),
(24, 1, NULL, NULL, 1612965623, 0x7f000001, 'Firefox 85.0 Linux'),
(25, 1, NULL, NULL, 1613042124, 0x7f000001, 'Firefox 85.0 Linux'),
(26, 1, NULL, NULL, 1613051389, 0x7f000001, 'Firefox 85.0 Linux'),
(27, 1, NULL, NULL, 1613051947, 0x7f000001, 'Firefox 85.0 Linux'),
(28, 1, NULL, NULL, 1613093939, 0x7f000001, 'Firefox 85.0 Linux'),
(29, 1, NULL, NULL, 1613094063, 0x7f000001, 'Firefox 85.0 Linux'),
(30, 1, NULL, NULL, 1613098890, 0x7f000001, 'Firefox 85.0 Linux'),
(31, 1, NULL, NULL, 1613099190, 0x7f000001, 'Firefox 85.0 Linux'),
(32, 1, NULL, NULL, 1613199240, 0x7f000001, 'Firefox 85.0 Linux'),
(33, 1, NULL, NULL, 1613209003, 0x7f000001, 'Firefox 85.0 Linux'),
(34, 1, NULL, NULL, 1613216049, 0x7f000001, 'Firefox 85.0 Linux'),
(35, 1, NULL, NULL, 1613244596, 0x7f000001, 'Firefox 85.0 Linux'),
(36, 1, NULL, NULL, 1613252295, 0x7f000001, 'Firefox 85.0 Linux'),
(37, 1, NULL, NULL, 1613256421, 0x7f000001, 'Firefox 85.0 Linux'),
(38, 1, NULL, NULL, 1613256865, 0x7f000001, 'Firefox 85.0 Linux'),
(39, 1, NULL, NULL, 1613282730, 0x7f000001, 'Firefox 85.0 Linux'),
(40, 1, NULL, NULL, 1613282999, 0x7f000001, 'Firefox 85.0 Linux'),
(41, 1, NULL, NULL, 1613283233, 0x7f000001, 'Firefox 85.0 Linux'),
(42, 1, NULL, NULL, 1613284721, 0x7f000001, 'Firefox 85.0 Linux'),
(43, 1, NULL, NULL, 1613285102, 0x7f000001, 'Firefox 85.0 Linux'),
(44, 1, NULL, NULL, 1613285521, 0x7f000001, 'Firefox 85.0 Linux'),
(45, 1, NULL, NULL, 1613286029, 0x7f000001, 'Firefox 85.0 Linux'),
(46, 1, NULL, NULL, 1613286905, 0x7f000001, 'Firefox 85.0 Linux'),
(47, 1, NULL, NULL, 1613287155, 0x7f000001, 'Firefox 85.0 Linux'),
(48, 1, NULL, NULL, 1613287338, 0x7f000001, 'Firefox 85.0 Linux'),
(49, 1, NULL, NULL, 1613287807, 0x7f000001, 'Firefox 85.0 Linux'),
(50, 1, NULL, NULL, 1613288366, 0x7f000001, 'Firefox 85.0 Linux'),
(51, 1, NULL, NULL, 1613296082, 0x7f000001, 'Firefox 85.0 Linux'),
(52, 1, NULL, NULL, 1613297525, 0x7f000001, 'Firefox 85.0 Linux'),
(53, 1, NULL, NULL, 1613301236, 0x7f000001, 'Firefox 85.0 Linux'),
(54, 1, NULL, NULL, 1613304910, 0x7f000001, 'Firefox 85.0 Linux'),
(55, 1, NULL, NULL, 1613305191, 0x7f000001, 'Firefox 85.0 Linux'),
(56, 1, NULL, NULL, 1613341895, 0x7f000001, 'Firefox 85.0 Linux'),
(57, 1, NULL, NULL, 1613345449, 0x7f000001, 'Firefox 85.0 Linux'),
(58, 1, NULL, NULL, 1613345965, 0x7f000001, 'Firefox 85.0 Linux'),
(59, 1, NULL, NULL, 1613346230, 0x7f000001, 'Firefox 85.0 Linux'),
(60, 1, NULL, NULL, 1613347835, 0x7f000001, 'Firefox 85.0 Linux'),
(61, 1, NULL, NULL, 1613347921, 0x7f000001, 'Firefox 85.0 Linux'),
(63, 1, NULL, NULL, 1613383754, 0x7f000001, 'Firefox 85.0 Linux'),
(64, 1, NULL, NULL, 1613400002, 0xc0a86429, 'Chrome 88.0.4324.152 Android'),
(65, 1, NULL, NULL, 1613400011, 0xc0a86427, 'Chrome 88.0.4324.152 Windows 10'),
(66, 1, NULL, NULL, 1613400227, 0xc0a86427, 'Chrome 88.0.4324.152 Windows 10'),
(67, 1, NULL, NULL, 1613400271, 0xc0a86429, 'Chrome 88.0.4324.152 Android'),
(68, 1, NULL, NULL, 1613401433, 0xc0a86429, 'Chrome 88.0.4324.152 Android'),
(69, 1, NULL, NULL, 1613402341, 0x7f000001, 'Firefox 85.0 Linux'),
(70, 1, NULL, NULL, 1613402499, 0x7f000001, 'Firefox 85.0 Linux'),
(71, 1, NULL, NULL, 1613403255, 0x7f000001, 'Firefox 85.0 Linux'),
(72, 1, NULL, NULL, 1613457208, 0x7f000001, 'Firefox 85.0 Linux'),
(73, 1, NULL, NULL, 1613457228, 0x7f000001, 'Firefox 85.0 Linux'),
(74, 1, NULL, NULL, 1613460223, 0x7f000001, 'Firefox 85.0 Linux'),
(75, 1, NULL, NULL, 1613460256, 0x7f000001, 'Firefox 85.0 Linux'),
(81, 1, NULL, NULL, 1613465067, 0x7f000001, 'Firefox 85.0 Linux'),
(82, 1, NULL, NULL, 1613465214, 0x7f000001, 'Firefox 85.0 Linux'),
(83, 4, NULL, NULL, 1613465416, 0x7f000001, 'Firefox 85.0 Linux'),
(84, 4, NULL, NULL, 1613465456, 0x7f000001, 'Firefox 85.0 Linux'),
(85, 1, NULL, NULL, 1613468645, 0x7f000001, 'Firefox 85.0 Linux'),
(86, 4, NULL, NULL, 1613468748, 0x7f000001, 'Firefox 85.0 Linux');

-- --------------------------------------------------------

--
-- Table structure for table `tb_logs`
--

CREATE TABLE `tb_logs` (
  `log_id` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_logs`
--

INSERT INTO `tb_logs` (`log_id`, `timestamp`, `message`) VALUES
(1, 1613211654, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at Server Room (23.1°C)</p>'),
(2, 1613211654, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at Server Room (55.8°C)</p>'),
(3, 1613211654, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at Server Room (13.79907°C)</p>'),
(4, 1613211714, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at Server Room (23°C)</p>'),
(5, 1613211714, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at Server Room (61.9°C)</p>'),
(6, 1613211714, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at Server Room (15.31102°C)</p>'),
(7, 1613211774, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at Server Room (23°C)</p>'),
(8, 1613211774, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at Server Room (68.2°C)</p>'),
(9, 1613211774, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at Server Room (16.82878°C)</p>'),
(10, 1613211834, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at Server Room (23.1°C)</p>'),
(11, 1613211834, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at Server Room (71.4°C)</p>'),
(12, 1613211834, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at Server Room (17.64897°C)</p>'),
(13, 1613211894, '<p class=\'text-warning\'><b>[]</b> Temperature at Server Room (23.2°C)</p>'),
(14, 1613211894, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (68.5°C)</p>'),
(15, 1613211894, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (17.08887°C)</p>'),
(16, 1613211921, '<p class=\'text-warning\'><b>[]</b> Temperature at Server Room (23.2°C)</p>'),
(17, 1613211921, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (63.2°C)</p>'),
(18, 1613211921, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.82408°C)</p>'),
(19, 1613211961, '<p class=\'text-warning\'><b>[]</b> Temperature at Server Room (23.3°C)</p>'),
(20, 1613211961, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (62.3°C)</p>'),
(21, 1613211961, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.69448°C)</p>'),
(22, 1613212020, '<p class=\'text-warning\'><b>[]</b> Temperature at Server Room (23.3°C)</p>'),
(23, 1613212020, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (61°C)</p>'),
(24, 1613212020, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.36564°C)</p>'),
(25, 1613212080, '<p class=\'text-warning\'><b>[]</b> Temperature at Server Room (23.3°C)</p>'),
(26, 1613212080, '<p class=\'text-warning\'><b>[]</b> Humidity at Server Room (59.6°C)</p>'),
(27, 1613212080, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.00453°C)</p>'),
(28, 1613212140, '<p class=\'text-warning\'><b>[]</b> Temperature at Server Room (23.3°C)</p>'),
(29, 1613212140, '<p class=\'text-warning\'><b>[]</b> Humidity at Server Room (58.3°C)</p>'),
(30, 1613212140, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (14.66247°C)</p>'),
(31, 1613212200, '<p class=\'text-warning\'><b>[]</b> Temperature at Server Room (23.2°C)</p>'),
(32, 1613212200, '<p class=\'text-warning\'><b>[]</b> Humidity at Server Room (57°C)</p>'),
(33, 1613212200, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (14.22025°C)</p>'),
(34, 1613212261, '<p class=\'text-warning\'><b>[]</b> Temperature at Server Room (23.1°C)</p>'),
(35, 1613212261, '<p class=\'text-warning\'><b>[]</b> Humidity at Server Room (56.3°C)</p>'),
(36, 1613212261, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (13.9364°C)</p>'),
(37, 1613212320, '<p class=\'text-warning\'><b>[]</b> Temperature at Server Room (23.1°C)</p>'),
(38, 1613212320, '<p class=\'text-warning\'><b>[]</b> Humidity at Server Room (60.2°C)</p>'),
(39, 1613212320, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (14.97221°C)</p>'),
(40, 1613212380, '<p class=\'text-warning\'><b>[]</b> Temperature at Server Room (23.1°C)</p>'),
(41, 1613212380, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (67.6°C)</p>'),
(42, 1613212380, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (16.78498°C)</p>'),
(43, 1613212440, '<p class=\'text-warning\'><b>[]</b> Temperature at Server Room (23.1°C)</p>'),
(44, 1613212440, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (71.6°C)</p>'),
(45, 1613212440, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (17.69332°C)</p>'),
(46, 1613212500, '<p class=\'text-warning\'><b>[]</b> Temperature at Server Room (23.2°C)</p>'),
(47, 1613212500, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (71.8°C)</p>'),
(48, 1613212500, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (17.83357°C)</p>'),
(49, 1613212560, '<p class=\'text-warning\'><b>[]</b> Temperature at Server Room (23.3°C)</p>'),
(50, 1613212560, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (63.7°C)</p>'),
(51, 1613212560, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (16.04194°C)</p>'),
(52, 1613212620, '<p class=\'text-warning\'><b>[]</b> Temperature at Server Room (23.4°C)</p>'),
(53, 1613212620, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (61.5°C)</p>'),
(54, 1613212620, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.58707°C)</p>'),
(55, 1613212680, '<p class=\'text-warning\'><b>[]</b> Temperature at Server Room (23.4°C)</p>'),
(56, 1613212680, '<p class=\'text-warning\'><b>[]</b> Humidity at Server Room (59.9°C)</p>'),
(57, 1613212680, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.17647°C)</p>'),
(58, 1613212689, '<p class=\'text-warning\'><b>[]</b> Temperature at Server Room (23.4°C)</p>'),
(59, 1613212689, '<p class=\'text-warning\'><b>[]</b> Humidity at Server Room (58.5°C)</p>'),
(60, 1613212689, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (14.80919°C)</p>'),
(61, 1613212749, '<p class=\'text-warning\'><b>[]</b> Temperature at Server Room (23.4°C)</p>'),
(62, 1613212749, '<p class=\'text-warning\'><b>[]</b> Humidity at Server Room (58.2°C)</p>'),
(63, 1613212749, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (14.72949°C)</p>'),
(64, 1613212809, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (14.36775°C)</p>'),
(65, 1613212869, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (14.12288)</p>'),
(66, 1613212928, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (14.30131)</p>'),
(67, 1613212988, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (66.7)</p>'),
(68, 1613212988, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (16.66928)</p>'),
(69, 1613213048, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (70.3)</p>'),
(70, 1613213048, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (17.49888)</p>'),
(71, 1613213092, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (72.4%)</p>'),
(72, 1613213092, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (18.06184°C)</p>'),
(73, 1613213140, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (65.6%)</p>'),
(74, 1613213140, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (16.59787°C)</p>'),
(75, 1613213199, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (62.5%)</p>'),
(76, 1613213199, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.83895°C)</p>'),
(77, 1613213618, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (65.8%)</p>'),
(78, 1613213677, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (69.6%)</p>'),
(79, 1613214270, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (67.1%)</p>'),
(80, 1613214451, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (63.5%)</p>'),
(81, 1613214458, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (61.4%)</p>'),
(82, 1613214469, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (61.2%)</p>'),
(83, 1613214898, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (69.7%)</p>'),
(84, 1613215038, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (65.8%)</p>'),
(85, 1613215099, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (62.2%)</p>'),
(86, 1613221288, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at  (0°C)</p>'),
(87, 1613221288, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at  (0%)</p>'),
(88, 1613221289, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at  (0°C)</p>'),
(89, 1613224867, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at  (0°C)</p>'),
(90, 1613224867, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at  (0%)</p>'),
(91, 1613224867, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at  (0°C)</p>'),
(92, 1613244603, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at  (0°C)</p>'),
(93, 1613244604, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at  (0%)</p>'),
(94, 1613244604, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at  (0°C)</p>'),
(95, 1613244628, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (66.4%)</p>'),
(96, 1613244711, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (69.9%)</p>'),
(97, 1613244771, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (63.2%)</p>'),
(98, 1613244805, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (61.4%)</p>'),
(99, 1613245225, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (66%)</p>'),
(100, 1613245285, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (69.7%)</p>'),
(101, 1613245405, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (63.5%)</p>'),
(102, 1613245465, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (61.3%)</p>'),
(103, 1613245857, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (67%)</p>'),
(104, 1613247130, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (63.9%)</p>'),
(105, 1613247190, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (68.5%)</p>'),
(106, 1613247310, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (66.2%)</p>'),
(107, 1613247318, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (62.2%)</p>'),
(108, 1613247378, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (62%)</p>'),
(109, 1613247763, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (66.2%)</p>'),
(110, 1613247819, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (67.5%)</p>'),
(111, 1613248000, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (63.2%)</p>'),
(112, 1613248044, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (61.3%)</p>'),
(113, 1613248433, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (66.4%)</p>'),
(114, 1613248493, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (67.1%)</p>'),
(115, 1613248613, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (68.6%)</p>'),
(116, 1613248673, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (62.8%)</p>'),
(117, 1613248716, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.81°C)</p>'),
(118, 1613248731, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.53°C)</p>'),
(119, 1613248790, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.42°C)</p>'),
(120, 1613248851, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.05°C)</p>'),
(121, 1613249091, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (62.1%)</p>'),
(122, 1613249091, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.83°C)</p>'),
(123, 1613249151, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (67.5%)</p>'),
(124, 1613249244, '<p class=\'\'><b>[]</b> Temperature at Server Room (23.6°C)</p>'),
(125, 1613249244, '<p class=\'\'><b>[]</b> Humidity at Server Room (71.4%)</p>'),
(126, 1613249244, '<p class=\'\'><b>[]</b> Dew Point at Server Room (18.13°C)</p>'),
(127, 1613249301, '<p class=\'\'><b>[]</b> Temperature at Server Room (23.7°C)</p>'),
(128, 1613249302, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (64.2%)</p>'),
(129, 1613249302, '<p class=\'\'><b>[]</b> Dew Point at Server Room (16.54°C)</p>'),
(130, 1613249354, '<p class=\'text-success\'><b>[NORMAL]</b> Temperature at Server Room (23.8°C)</p>'),
(131, 1613249354, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (61.8%)</p>'),
(132, 1613249354, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (16.04°C)</p>'),
(133, 1613249414, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.78°C)</p>'),
(134, 1613249476, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.26°C)</p>'),
(135, 1613249776, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (66%)</p>'),
(136, 1613249836, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (69.8%)</p>'),
(137, 1613249956, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (64.5%)</p>'),
(138, 1613250016, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (61.8%)</p>'),
(139, 1613250016, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (16.04°C)</p>'),
(140, 1613250065, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.66°C)</p>'),
(141, 1613250076, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.32°C)</p>'),
(142, 1613250136, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.26°C)</p>'),
(143, 1613250361, '<p class=\'text-success\'><b>[NORMAL]</b> Temperature at Server Room (23.6°C)</p>'),
(144, 1613250361, '<p class=\'text-success\'><b>[NORMAL]</b> Humidity at Server Room (55.2%)</p>'),
(145, 1613250362, '<p class=\'text-success\'><b>[NORMAL]</b> Dew Point at Server Room (14.1°C)</p>'),
(146, 1613250738, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (61.3%)</p>'),
(147, 1613250738, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.63°C)</p>'),
(148, 1613250798, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.21°C)</p>'),
(149, 1613251038, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.4°C)</p>'),
(150, 1613251098, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (67.4%)</p>'),
(151, 1613252362, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (66.3%)</p>'),
(152, 1613252543, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (63.2%)</p>'),
(153, 1613252543, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (16.3°C)</p>'),
(154, 1613252664, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (61%)</p>'),
(155, 1613252664, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.84°C)</p>'),
(156, 1613256426, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at  (°C)</p>'),
(157, 1613256426, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at  (%)</p>'),
(158, 1613256426, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at  (0°C)</p>'),
(159, 1613256872, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at  (°C)</p>'),
(160, 1613256872, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at  (%)</p>'),
(161, 1613256872, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at  (0°C)</p>'),
(162, 1613257266, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.02°C)</p>'),
(163, 1613259958, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at  (°C)</p>'),
(164, 1613259958, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at  (%)</p>'),
(165, 1613259958, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at  (0°C)</p>'),
(166, 1613259971, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (68.9%)</p>'),
(167, 1613260511, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (67.2%)</p>'),
(168, 1613260511, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.64°C)</p>'),
(169, 1613282462, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at  (°C)</p>'),
(170, 1613282463, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at  (%)</p>'),
(171, 1613282463, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at  (0°C)</p>'),
(172, 1613282738, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at  (°C)</p>'),
(173, 1613282738, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at  (%)</p>'),
(174, 1613282739, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at  (0°C)</p>'),
(175, 1613282753, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at  (°C)</p>'),
(176, 1613282754, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at  (%)</p>'),
(177, 1613282754, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at  (0°C)</p>'),
(178, 1613282858, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (69.4%)</p>'),
(179, 1613283008, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (69.6%)</p>'),
(180, 1613283240, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (61.4%)</p>'),
(181, 1613283240, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.75°C)</p>'),
(182, 1613283958, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at  (°C)</p>'),
(183, 1613283958, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at  (%)</p>'),
(184, 1613283958, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at  (0°C)</p>'),
(185, 1613283970, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at  (°C)</p>'),
(186, 1613283970, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at  (%)</p>'),
(187, 1613283970, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at  (0°C)</p>'),
(188, 1613284041, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (66.2%)</p>'),
(189, 1613284727, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at  (°C)</p>'),
(190, 1613284727, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at  (%)</p>'),
(191, 1613284727, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at  (0°C)</p>'),
(192, 1613284786, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (68.8%)</p>'),
(193, 1613284795, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at Network Room (90.3°C)</p>'),
(194, 1613284795, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Network Room (32.2%)</p>'),
(195, 1613284843, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Network Room (35.1%)</p>'),
(196, 1613284846, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (62.4%)</p>'),
(197, 1613284846, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (16.1°C)</p>'),
(198, 1613285108, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.59°C)</p>'),
(199, 1613285533, '<p class=\'text-warning\'><b>[WARNING]</b> Temperature at Network Room (16.8°C)</p>'),
(200, 1613285533, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at Network Room (93.3°C)</p>'),
(201, 1613285692, '<p class=\'text-warning\'><b>[WARNING]</b> Temperature at Network Room (11.3°C)</p>'),
(202, 1613285752, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Network Room (31.5%)</p>'),
(203, 1613286037, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (66.1%)</p>'),
(204, 1613286041, '<p class=\'text-warning\'><b>[WARNING]</b> Temperature at Network Room (28.2°C)</p>'),
(205, 1613286041, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at Network Room (99.5%)</p>'),
(206, 1613286062, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Network Room (38.4%)</p>'),
(207, 1613286065, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.35°C)</p>'),
(208, 1613286911, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at  (°C)</p>'),
(209, 1613286911, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at  (%)</p>'),
(210, 1613286911, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at  (0°C)</p>'),
(211, 1613287161, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.24°C)</p>'),
(212, 1613287164, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at Network Room (95.2%)</p>'),
(213, 1613287347, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at Network Room (90.5°C)</p>'),
(214, 1613287822, '<p class=\'text-warning\'><b>[WARNING]</b> Temperature at Network Room (33.7°C)</p>'),
(215, 1613288374, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at  (°C)</p>'),
(216, 1613288374, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at  (%)</p>'),
(217, 1613288374, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at  (0°C)</p>'),
(218, 1613288377, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at Network Room (6.6%)</p>'),
(219, 1613289663, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at Network Room (1.5°C)</p>'),
(220, 1613289663, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Network Room (65%)</p>'),
(221, 1613289666, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at  (°C)</p>'),
(222, 1613289666, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at  (%)</p>'),
(223, 1613289666, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at  (0°C)</p>'),
(224, 1613296089, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at  (°C)</p>'),
(225, 1613296089, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at  (%)</p>'),
(226, 1613296089, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at  (0°C)</p>'),
(227, 1613296092, '<p class=\'text-warning\'><b>[WARNING]</b> Temperature at Network Room (29.2°C)</p>'),
(228, 1613296867, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at  (°C)</p>'),
(229, 1613296867, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at  (%)</p>'),
(230, 1613296867, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at  (0°C)</p>'),
(231, 1613297532, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at  (°C)</p>'),
(232, 1613297532, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at  (%)</p>'),
(233, 1613297532, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at  (0°C)</p>'),
(234, 1613300463, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at Network Room (95.8%)</p>'),
(235, 1613300466, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at  (°C)</p>'),
(236, 1613300466, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at  (%)</p>'),
(237, 1613300466, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at  (0°C)</p>'),
(238, 1613301242, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at  (°C)</p>'),
(239, 1613301242, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at  (%)</p>'),
(240, 1613301242, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at  (0°C)</p>'),
(241, 1613301246, '<p class=\'text-warning\'><b>[WARNING]</b> Temperature at Network Room (28.2°C)</p>'),
(242, 1613304066, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at  (°C)</p>'),
(243, 1613304066, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at  (%)</p>'),
(244, 1613304066, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at  (0°C)</p>'),
(245, 1613304920, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at  (°C)</p>'),
(246, 1613304920, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at  (%)</p>'),
(247, 1613304920, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at  (0°C)</p>'),
(248, 1613304933, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at Network Room (99.3°C)</p>'),
(249, 1613307670, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at  (°C)</p>'),
(250, 1613307670, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at  (%)</p>'),
(251, 1613307670, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at  (0°C)</p>'),
(252, 1613341903, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at  (°C)</p>'),
(253, 1613341903, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at  (%)</p>'),
(254, 1613341904, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at  (0°C)</p>'),
(255, 1613343666, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at  (°C)</p>'),
(256, 1613343666, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at  (%)</p>'),
(257, 1613343666, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at  (0°C)</p>'),
(258, 1613345455, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at  (°C)</p>'),
(259, 1613345455, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at  (%)</p>'),
(260, 1613345455, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at  (0°C)</p>'),
(261, 1613345974, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at Network Room (97.9%)</p>'),
(262, 1613346237, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (62.4%)</p>'),
(263, 1613346237, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (16.1°C)</p>'),
(264, 1613346239, '<p class=\'text-warning\'><b>[WARNING]</b> Temperature at Network Room (12.3°C)</p>'),
(265, 1613346327, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at Network Room (99.2%)</p>'),
(266, 1613346360, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at Network Room (90.1%)</p>'),
(267, 1613346360, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at Network Room (2.2°C)</p>'),
(268, 1613346391, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.5°C)</p>'),
(269, 1613346394, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at Network Room (0.7°C)</p>'),
(270, 1613346394, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at Network Room (2.6%)</p>'),
(271, 1613347266, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at  (°C)</p>'),
(272, 1613347266, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at  (%)</p>'),
(273, 1613347266, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at  (0°C)</p>'),
(274, 1613347893, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at Network Room (8.8%)</p>'),
(275, 1613350992, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at  (°C)</p>'),
(276, 1613350992, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at  (%)</p>'),
(277, 1613350992, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at  (0°C)</p>'),
(278, 1613353827, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at  (°C)</p>'),
(279, 1613353827, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at  (%)</p>'),
(280, 1613353827, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at  (0°C)</p>'),
(281, 1613353831, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at Network Room (95.9°C)</p>'),
(282, 1613353831, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at Network Room (91.1%)</p>'),
(283, 1613354463, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at Network Room (1.1°C)</p>'),
(284, 1613354463, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at Network Room (93.9%)</p>'),
(285, 1613354466, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at  (°C)</p>'),
(286, 1613354466, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at  (%)</p>'),
(287, 1613354466, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at  (0°C)</p>'),
(288, 1613361664, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at Network Room (7.1°C)</p>'),
(289, 1613361667, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at  (°C)</p>'),
(290, 1613361667, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at  (%)</p>'),
(291, 1613361667, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at  (0°C)</p>'),
(292, 1613365262, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at Network Room (97.5%)</p>'),
(293, 1613365265, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at  (°C)</p>'),
(294, 1613365265, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at  (%)</p>'),
(295, 1613365265, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at  (0°C)</p>'),
(296, 1613368862, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at Network Room (2.2°C)</p>'),
(297, 1613368865, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at  (°C)</p>'),
(298, 1613368865, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at  (%)</p>'),
(299, 1613368865, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at  (0°C)</p>'),
(300, 1613383265, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at  (°C)</p>'),
(301, 1613383265, '<p class=\'text-warning\'><b>[WARNING]</b> Temperature at Network Room (14.1°C)</p>'),
(302, 1613383265, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at  (%)</p>'),
(303, 1613383265, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at  (0°C)</p>'),
(304, 1613383760, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at  (°C)</p>'),
(305, 1613383760, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at  (%)</p>'),
(306, 1613383760, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at  (0°C)</p>'),
(307, 1613383762, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at Network Room (92.2°C)</p>'),
(308, 1613386863, '<p class=\'text-warning\'><b>[WARNING]</b> Temperature at Network Room (16.1°C)</p>'),
(309, 1613386866, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at  (°C)</p>'),
(310, 1613386866, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at  (%)</p>'),
(311, 1613386866, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at  (0°C)</p>'),
(312, 1613394062, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at Network Room (0.7%)</p>'),
(313, 1613397663, '<p class=\'text-warning\'><b>[WARNING]</b> Temperature at Network Room (11.7°C)</p>'),
(314, 1613397666, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (68.5%)</p>'),
(315, 1613397667, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (16.42°C)</p>'),
(316, 1613400045, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at Network Room (95°C)</p>'),
(317, 1613400045, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Network Room (68%)</p>'),
(318, 1613400045, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at Network Room (93.6°C)</p>'),
(319, 1613400047, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at Network Room (91.2°C)</p>'),
(320, 1613400047, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Network Room (33.5%)</p>'),
(321, 1613400138, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at Network Room (8.3°C)</p>'),
(322, 1613400138, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Network Room (66.4%)</p>'),
(323, 1613400167, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Network Room (63.1%)</p>'),
(324, 1613400186, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at Network Room (92.2°C)</p>'),
(325, 1613400193, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at Network Room (5.4%)</p>'),
(326, 1613400278, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at Network Room (97.5°C)</p>'),
(327, 1613400286, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Network Room (35.9%)</p>'),
(328, 1613400303, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Network Room (61.6%)</p>'),
(329, 1613401331, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.35°C)</p>'),
(330, 1613401437, '<p class=\'text-warning\'><b>[WARNING]</b> Temperature at Network Room (27.9°C)</p>'),
(331, 1613401439, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.01°C)</p>'),
(332, 1613401465, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at Network Room (95.9°C)</p>'),
(333, 1613401465, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at Network Room (7.5%)</p>'),
(334, 1613401465, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at Network Room (99.7°C)</p>'),
(335, 1613401490, '<p class=\'text-warning\'><b>[WARNING]</b> Temperature at Network Room (13°C)</p>'),
(336, 1613402349, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at Network Room (92.4°C)</p>'),
(337, 1613402506, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.58°C)</p>'),
(338, 1613402848, '<p class=\'text-warning\'><b>[WARNING]</b> Temperature at Server Room (27.4°C)</p>'),
(339, 1613402982, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (16.49°C)</p>'),
(340, 1613402983, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at Network Room (6.3°C)</p>'),
(341, 1613403034, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at Network Room (97.5°C)</p>'),
(342, 1613403035, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at Network Room (8.4%)</p>'),
(343, 1613403261, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.05°C)</p>'),
(344, 1613403262, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at Network Room (6.2°C)</p>'),
(345, 1613403325, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at Network Room (3.4°C)</p>'),
(346, 1613403383, '<p class=\'text-warning\'><b>[WARNING]</b> Temperature at Network Room (31.6°C)</p>'),
(347, 1613403383, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Network Room (66.2%)</p>'),
(348, 1613403443, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Network Room (15.3°C)</p>'),
(349, 1613457225, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Network Room (16.2°C)</p>'),
(350, 1613457234, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (62.3%)</p>'),
(351, 1613457234, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.98°C)</p>'),
(352, 1613457235, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at Network Room (3°C)</p>'),
(353, 1613458867, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (67.7%)</p>'),
(354, 1613458937, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.28°C)</p>'),
(355, 1613458997, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (66.2%)</p>'),
(356, 1613458998, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at Network Room (0°C)</p>'),
(357, 1613458998, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Network Room (37.2%)</p>'),
(358, 1613459057, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (69.1%)</p>'),
(359, 1613459058, '<p class=\'text-warning\'><b>[WARNING]</b> Temperature at Network Room (15.1°C)</p>'),
(360, 1613459119, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (66.8%)</p>'),
(361, 1613459178, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.88°C)</p>'),
(362, 1613460356, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.28°C)</p>'),
(363, 1613460488, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at Network Room (91.9°C)</p>'),
(364, 1613460558, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at Network Room (96°C)</p>'),
(365, 1613461099, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Network Room (35.1%)</p>'),
(366, 1613461163, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Network Room (4.7°C)</p>'),
(367, 1613461221, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at Network Room (9.5°C)</p>'),
(368, 1613461221, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at Network Room (9.7%)</p>'),
(369, 1613461279, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at Network Room (7.4°C)</p>'),
(370, 1613461279, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at Network Room (8.9°C)</p>'),
(371, 1613461288, '<p class=\'text-warning\'><b>[WARNING]</b> Temperature at Network Room (31.6°C)</p>'),
(372, 1613461288, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at Network Room (7.9°C)</p>'),
(373, 1613461353, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Network Room (4.7°C)</p>'),
(374, 1613461414, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at Network Room (0.6%)</p>'),
(375, 1613461414, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at Network Room (0.8°C)</p>'),
(376, 1613461475, '<p class=\'text-warning\'><b>[WARNING]</b> Temperature at Network Room (15.4°C)</p>'),
(377, 1613461475, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Network Room (63.5%)</p>'),
(378, 1613461535, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at Network Room (2°C)</p>'),
(379, 1613461657, '<p class=\'text-warning\'><b>[WARNING]</b> Temperature at Network Room (27.4°C)</p>'),
(380, 1613461657, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Network Room (69.2%)</p>'),
(381, 1613461767, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at Network Room (1.2°C)</p>'),
(382, 1613461829, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at Network Room (90.5%)</p>'),
(383, 1613461887, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (62.9%)</p>'),
(384, 1613461888, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Network Room (30.8%)</p>'),
(385, 1613461948, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (66.6%)</p>'),
(386, 1613461948, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.79°C)</p>'),
(387, 1613461948, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at Network Room (6.2%)</p>'),
(388, 1613461948, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Network Room (4.3°C)</p>'),
(389, 1613462008, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (69.4%)</p>'),
(390, 1613462009, '<p class=\'text-warning\'><b>[WARNING]</b> Temperature at Network Room (33.3°C)</p>'),
(391, 1613462009, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Network Room (4.1°C)</p>'),
(392, 1613462069, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (62.9%)</p>'),
(393, 1613462069, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.28°C)</p>'),
(394, 1613462069, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at Network Room (94.1%)</p>'),
(395, 1613462128, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at Network Room (3.4°C)</p>'),
(396, 1613462128, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Network Room (37.3%)</p>'),
(397, 1613462128, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Network Room (15.3°C)</p>'),
(398, 1613462464, '<p class=\'text-warning\'><b>[WARNING]</b> Temperature at Network Room (13°C)</p>'),
(399, 1613462464, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Network Room (30.2%)</p>'),
(400, 1613462464, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at Network Room (2.3°C)</p>'),
(401, 1613462752, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at Network Room (4%)</p>'),
(402, 1613462752, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Network Room (16.1°C)</p>'),
(403, 1613462973, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (65.6%)</p>'),
(404, 1613462973, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (16.12°C)</p>'),
(405, 1613462973, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at Network Room (9.9°C)</p>'),
(406, 1613462973, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at Network Room (98.8%)</p>'),
(407, 1613465139, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at Network Room (9.6°C)</p>'),
(408, 1613465198, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (64%)</p>'),
(409, 1613465199, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (16.3°C)</p>'),
(410, 1613465199, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Network Room (4.6°C)</p>'),
(411, 1613465527, '<p class=\'text-warning\'><b>[WARNING]</b> Temperature at Network Room (30.1°C)</p>'),
(412, 1613465527, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Network Room (4°C)</p>'),
(413, 1613465588, '<p class=\'text-warning\'><b>[WARNING]</b> Temperature at Network Room (29.6°C)</p>'),
(414, 1613465588, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Network Room (15.9°C)</p>'),
(415, 1613465649, '<p class=\'text-warning\'><b>[WARNING]</b> Temperature at Network Room (31.6°C)</p>'),
(416, 1613465649, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Network Room (68.6%)</p>'),
(417, 1613465649, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Network Room (4.8°C)</p>'),
(418, 1613465709, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at Network Room (1.9°C)</p>'),
(419, 1613465709, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Network Room (65.8%)</p>'),
(420, 1613465709, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Network Room (16.5°C)</p>'),
(421, 1613465769, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (63.1%)</p>'),
(422, 1613465769, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (16.08°C)</p>'),
(423, 1613465770, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at Network Room (1°C)</p>'),
(424, 1613465830, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (67.3%)</p>'),
(425, 1613465830, '<p class=\'text-danger\'><b>[CRITICAL]</b> Temperature at Network Room (0.2°C)</p>'),
(426, 1613465830, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at Network Room (7.6°C)</p>'),
(427, 1613465891, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (70%)</p>'),
(428, 1613465891, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at Network Room (0.9°C)</p>'),
(429, 1613468570, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (63.9%)</p>'),
(430, 1613468570, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (16.47°C)</p>'),
(431, 1613468570, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at Network Room (6.5%)</p>'),
(432, 1613468570, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at Network Room (9°C)</p>'),
(433, 1613468632, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (61.7%)</p>'),
(434, 1613468632, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.92°C)</p>'),
(435, 1613468632, '<p class=\'text-warning\'><b>[WARNING]</b> Temperature at Network Room (32.2°C)</p>'),
(436, 1613468818, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Server Room (64.6%)</p>'),
(437, 1613468818, '<p class=\'text-warning\'><b>[WARNING]</b> Temperature at Network Room (29.1°C)</p>'),
(438, 1613468878, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.8°C)</p>'),
(439, 1613468878, '<p class=\'text-warning\'><b>[WARNING]</b> Humidity at Network Room (63.4%)</p>'),
(440, 1613468878, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at Network Room (3.8°C)</p>'),
(441, 1613469664, '<p class=\'text-danger\'><b>[CRITICAL]</b> Humidity at Network Room (99.6%)</p>'),
(442, 1613469664, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Network Room (15.1°C)</p>'),
(443, 1613469667, '<p class=\'text-warning\'><b>[WARNING]</b> Dew Point at Server Room (15.4°C)</p>'),
(444, 1613473264, '<p class=\'text-danger\'><b>[CRITICAL]</b> Dew Point at Network Room (2°C)</p>');

-- --------------------------------------------------------

--
-- Table structure for table `tb_menu`
--

CREATE TABLE `tb_menu` (
  `menu_id` int(11) NOT NULL,
  `menu_parent` int(11) DEFAULT NULL,
  `menu_label` varchar(100) NOT NULL,
  `menu_link` varchar(150) NOT NULL,
  `menu_icon` varchar(80) DEFAULT NULL,
  `menu_location` enum('mainmenu','submenu','content') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_menu`
--

INSERT INTO `tb_menu` (`menu_id`, `menu_parent`, `menu_label`, `menu_link`, `menu_icon`, `menu_location`) VALUES
(1, NULL, 'Dashboard', 'dashboard', 'fa fa-dashboard', 'mainmenu'),
(2, NULL, 'Sensor Data', 'sensor-data', 'fa fa-thermometer-2', 'mainmenu'),
(3, NULL, 'User Management', 'user-management', 'fa fa-users', 'mainmenu'),
(4, NULL, 'Application Settings', 'app-settings', 'fa fa-cogs', 'mainmenu'),
(9, 2, 'Ruang Server', 'sensor/MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', '', 'submenu'),
(11, NULL, 'Sensor Management', 'sensor-management', 'dw dw-chip', 'mainmenu'),
(12, NULL, 'Add Sensor', 'add-sensor', 'fa fa-plus-square', 'content'),
(13, NULL, 'Edit Sensor', 'edit-sensor', 'fa fa-pencil-square', 'content'),
(14, NULL, 'Delete Sensor', 'delete-sensor', 'fa fa-trash-o', 'content'),
(19, 2, 'Network Room', 'sensor/MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', NULL, 'submenu'),
(20, NULL, 'Notification Recipient', 'notification-recipient', 'fa fa-paper-plane', 'mainmenu'),
(21, NULL, 'Add Recipient', 'add-recipient', 'fa fa-plus-square', 'content'),
(22, NULL, 'Edit Recipient', 'edit-recipient', 'fa fa-pencil-square', 'content'),
(23, NULL, 'Delete Recipient', 'delete-recipient', 'fa fa-trash-o', 'content'),
(24, NULL, 'Add User', 'add-user', 'fa fa-plus-square', 'content'),
(25, NULL, 'Edit User', 'edit-user', 'fa fa-pencil-square', 'content'),
(26, NULL, 'Delete User', 'delete-user', 'fa fa-trash-o', 'content'),
(27, NULL, 'Access Management', 'access-management', 'fa fa-key', 'mainmenu'),
(28, NULL, 'Add Access', 'add-access', 'fa fa-plus-square', 'content'),
(29, NULL, 'Edit Access', 'edit-access', 'fa fa-pencil-square', 'content'),
(30, NULL, 'Delete Access', 'delete-access', 'fa fa-trash-o', 'content');

-- --------------------------------------------------------

--
-- Table structure for table `tb_roles`
--

CREATE TABLE `tb_roles` (
  `role_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_roles`
--

INSERT INTO `tb_roles` (`role_id`, `type_id`, `menu_id`) VALUES
(1, 2, 1),
(3, 2, 2),
(4, 2, 3),
(8, 2, 9),
(10, 2, 11),
(11, 2, 12),
(12, 2, 13),
(13, 2, 14),
(15, 2, 19),
(16, 2, 20),
(17, 2, 21),
(18, 2, 22),
(19, 2, 23),
(20, 2, 24),
(21, 2, 25),
(22, 2, 26),
(23, 1, 1),
(24, 1, 28),
(25, 1, 24),
(26, 1, 4),
(27, 1, 30),
(28, 1, 26),
(29, 1, 29),
(30, 1, 25),
(31, 1, 3),
(32, 1, 27);

-- --------------------------------------------------------

--
-- Table structure for table `tb_room_temp`
--

CREATE TABLE `tb_room_temp` (
  `temp_id` int(11) NOT NULL,
  `thermo_hash` varchar(512) DEFAULT NULL,
  `timestamp` int(11) NOT NULL,
  `temperature` decimal(3,1) NOT NULL,
  `humidity` decimal(3,1) NOT NULL,
  `dew_point` decimal(3,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_room_temp`
--

INSERT INTO `tb_room_temp` (`temp_id`, `thermo_hash`, `timestamp`, `temperature`, `humidity`, `dew_point`) VALUES
(1, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613211658, '23.1', '55.8', '13.8'),
(2, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613211716, '23.0', '61.9', '15.3'),
(3, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613211777, '23.0', '68.2', '16.8'),
(4, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613211837, '23.1', '71.4', '17.6'),
(5, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613211896, '23.2', '68.5', '17.1'),
(6, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613211923, '23.2', '63.2', '15.8'),
(7, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613211961, '23.3', '62.3', '15.7'),
(8, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613212020, '23.3', '61.0', '15.4'),
(9, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613212081, '23.3', '59.6', '15.0'),
(10, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613212140, '23.3', '58.3', '14.7'),
(11, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613212200, '23.2', '57.0', '14.2'),
(12, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613212261, '23.1', '56.3', '13.9'),
(13, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613212320, '23.1', '60.2', '15.0'),
(14, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613212380, '23.1', '67.6', '16.8'),
(15, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613212440, '23.1', '71.6', '17.7'),
(16, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613212500, '23.2', '71.8', '17.8'),
(17, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613212560, '23.3', '63.7', '16.0'),
(18, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613212620, '23.4', '61.5', '15.6'),
(19, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613212680, '23.4', '59.9', '15.2'),
(20, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613212689, '23.4', '58.5', '14.8'),
(21, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613212749, '23.4', '58.2', '14.7'),
(22, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613212809, '23.3', '57.2', '14.4'),
(23, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613212869, '23.3', '56.3', '14.1'),
(24, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613212928, '23.2', '57.3', '14.3'),
(25, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613212988, '23.2', '66.7', '16.7'),
(26, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613213049, '23.2', '70.3', '17.5'),
(27, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613213093, '23.3', '72.4', '18.1'),
(28, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613213140, '23.4', '65.6', '16.6'),
(29, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613213199, '23.4', '62.5', '15.8'),
(30, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613213223, '23.5', '60.8', '15.5'),
(31, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613213264, '23.5', '60.2', '15.3'),
(32, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613213326, '23.5', '59.2', '15.1'),
(33, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613213390, '23.5', '57.8', '14.7'),
(34, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613213451, '23.4', '56.6', '14.3'),
(35, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613213497, '23.4', '55.8', '14.1'),
(36, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613213557, '23.3', '55.7', '14.0'),
(37, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613213618, '23.3', '65.8', '16.6'),
(38, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613213677, '23.3', '69.6', '17.4'),
(39, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613213724, '23.4', '72.5', '18.2'),
(40, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613213765, '23.5', '65.9', '16.8'),
(41, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613213824, '23.5', '63.0', '16.1'),
(42, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613213851, '23.6', '61.1', '15.7'),
(43, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613213910, '23.6', '60.4', '15.5'),
(44, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613213929, '23.6', '58.9', '15.1'),
(45, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613213955, '23.6', '58.5', '15.0'),
(46, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613214025, '23.6', '57.9', '14.8'),
(47, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613214039, '23.5', '56.8', '14.4'),
(48, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613214080, '23.5', '56.6', '14.4'),
(49, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613214099, '23.5', '56.0', '14.2'),
(50, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613214171, '23.4', '55.5', '14.0'),
(51, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613214221, '23.4', '59.0', '14.9'),
(52, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613214272, '23.3', '67.1', '16.9'),
(53, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613214333, '23.4', '70.8', '17.8'),
(54, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613214392, '23.5', '71.7', '18.1'),
(55, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613214451, '23.6', '63.5', '16.3'),
(56, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613214458, '23.7', '61.4', '15.8'),
(57, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613214469, '23.7', '61.2', '15.8'),
(58, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613214516, '23.7', '60.8', '15.7'),
(59, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613214579, '23.7', '59.5', '15.4'),
(60, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613214636, '23.7', '58.0', '15.0'),
(61, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613214696, '23.6', '56.7', '14.5'),
(62, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613214756, '23.6', '55.9', '14.3'),
(63, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613214816, '23.5', '55.7', '14.1'),
(64, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613214898, '23.5', '69.7', '17.7'),
(65, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613214919, '23.5', '71.1', '18.0'),
(66, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613214977, '23.5', '71.8', '18.1'),
(67, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613215038, '23.7', '65.8', '16.9'),
(68, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613215099, '23.7', '62.2', '16.0'),
(69, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613215159, '23.7', '60.4', '15.6'),
(70, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613215217, '23.7', '58.8', '15.2'),
(71, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613215277, '23.7', '57.5', '14.8'),
(72, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613215337, '23.7', '56.5', '14.6'),
(73, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613215397, '23.5', '55.5', '14.1'),
(74, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613215457, '23.6', '55.3', '14.1'),
(75, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613215478, '23.4', '56.4', '14.2'),
(76, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613215538, '23.4', '56.6', '14.3'),
(77, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613215553, '23.3', '56.8', '14.3'),
(78, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613215598, '23.3', '56.9', '14.3'),
(79, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613215657, '23.2', '56.9', '14.2'),
(80, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613215717, '23.2', '57.1', '14.2'),
(81, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613215777, '23.1', '57.3', '14.2'),
(82, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613215838, '23.1', '57.5', '14.3'),
(83, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613215898, '23.0', '57.4', '14.1'),
(84, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613215958, '22.9', '57.5', '14.1'),
(85, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613216018, '22.9', '57.6', '14.1'),
(86, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613216057, '22.9', '57.7', '14.1'),
(87, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613216116, '22.8', '57.6', '14.0'),
(88, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613216176, '22.8', '57.7', '14.0'),
(89, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613216236, '22.8', '57.6', '14.0'),
(90, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613216295, '22.7', '57.6', '13.9'),
(91, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613216356, '22.7', '57.6', '13.9'),
(92, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613216416, '22.7', '57.6', '13.9'),
(93, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613216476, '22.6', '57.6', '13.8'),
(94, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613216536, '22.6', '57.6', '13.8'),
(95, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613216596, '22.6', '57.6', '13.8'),
(96, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613216655, '22.5', '57.6', '13.7'),
(97, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613216715, '22.5', '57.7', '13.8'),
(98, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613216728, '22.5', '57.7', '13.8'),
(99, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613216788, '22.5', '57.7', '13.8'),
(100, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613216848, '22.5', '57.7', '13.8'),
(101, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613244629, '23.3', '66.4', '16.7'),
(102, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613244651, '23.5', '71.9', '18.1'),
(103, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613244713, '23.5', '69.9', '17.7'),
(104, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613244772, '23.6', '63.2', '16.2'),
(105, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613244807, '23.7', '61.4', '15.8'),
(106, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613244865, '23.6', '60.3', '15.5'),
(107, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613244925, '23.7', '58.9', '15.2'),
(108, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613244985, '23.6', '57.5', '14.7'),
(109, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613245045, '23.6', '56.4', '14.4'),
(110, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613245105, '23.5', '55.6', '14.1'),
(111, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613245165, '23.4', '56.6', '14.3'),
(112, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613245228, '23.4', '66.0', '16.7'),
(113, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613245286, '23.4', '69.7', '17.6'),
(114, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613245345, '23.5', '71.6', '18.1'),
(115, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613245406, '23.6', '63.5', '16.3'),
(116, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613245467, '23.7', '61.3', '15.8'),
(117, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613245477, '23.7', '59.7', '15.4'),
(118, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613245537, '23.7', '59.3', '15.3'),
(119, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613245597, '23.7', '57.9', '14.9'),
(120, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613245657, '23.6', '56.6', '14.5'),
(121, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613245677, '23.5', '55.8', '14.2'),
(122, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613245738, '23.5', '55.5', '14.1'),
(123, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613245797, '23.4', '58.6', '14.8'),
(124, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613245858, '23.3', '67.0', '16.8'),
(125, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613246952, '23.6', '56.0', '14.3'),
(126, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613247012, '23.6', '55.9', '14.3'),
(127, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613247071, '23.5', '55.2', '14.0'),
(128, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613247132, '23.4', '63.9', '16.2'),
(129, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613247191, '23.4', '68.5', '17.3'),
(130, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613247252, '23.5', '71.8', '18.1'),
(131, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613247312, '23.6', '66.2', '16.9'),
(132, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613247319, '23.7', '62.2', '16.0'),
(133, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613247381, '23.7', '62.0', '16.0'),
(134, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613247439, '23.7', '60.2', '15.5'),
(135, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613247500, '23.7', '58.7', '15.1'),
(136, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613247559, '23.7', '57.4', '14.8'),
(137, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613247621, '23.6', '56.5', '14.5'),
(138, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613247630, '23.6', '55.7', '14.2'),
(139, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613247689, '23.5', '55.7', '14.1'),
(140, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613247749, '23.4', '57.3', '14.5'),
(141, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613247763, '23.4', '66.2', '16.7'),
(142, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613247819, '23.4', '67.5', '17.0'),
(143, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613247879, '23.4', '70.9', '17.8'),
(144, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613247939, '23.5', '70.3', '17.8'),
(145, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613248000, '23.6', '63.2', '16.2'),
(146, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613248044, '23.8', '61.3', '15.9'),
(147, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613248104, '23.8', '60.2', '15.6'),
(148, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613248114, '23.7', '58.7', '15.1'),
(149, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613248128, '23.7', '58.4', '15.1'),
(150, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613248188, '23.7', '58.1', '15.0'),
(151, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613248245, '23.7', '57.1', '14.7'),
(152, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613248262, '23.7', '56.3', '14.5'),
(153, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613248302, '23.7', '56.1', '14.4'),
(154, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613248363, '23.6', '55.5', '14.2'),
(155, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613248423, '23.6', '59.2', '15.2'),
(156, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613248433, '23.5', '66.4', '16.9'),
(157, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613248493, '23.5', '67.1', '17.0'),
(158, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613248553, '23.5', '70.9', '17.9'),
(159, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613248613, '23.7', '68.6', '17.6'),
(160, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613248673, '23.7', '62.8', '16.2'),
(161, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613248716, '23.8', '60.9', '15.8'),
(162, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613248731, '23.8', '59.8', '15.5'),
(163, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613248791, '23.8', '59.4', '15.4'),
(164, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613248851, '23.8', '58.0', '15.1'),
(165, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613248911, '23.7', '56.8', '14.6'),
(166, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613248971, '23.7', '56.0', '14.4'),
(167, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613249031, '23.6', '55.2', '14.1'),
(168, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613249091, '23.5', '62.1', '15.8'),
(169, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613249151, '23.5', '67.5', '17.1'),
(170, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613249193, '23.5', '71.3', '18.0'),
(171, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613249244, '23.6', '71.4', '18.1'),
(172, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613249302, '23.7', '64.2', '16.5'),
(173, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613249354, '23.8', '61.8', '16.0'),
(174, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613249414, '23.9', '60.4', '15.8'),
(175, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613249478, '23.8', '58.8', '15.3'),
(176, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613249537, '23.8', '57.6', '14.9'),
(177, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613249597, '23.7', '56.5', '14.6'),
(178, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613249657, '23.6', '55.6', '14.2'),
(179, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613249717, '23.5', '55.9', '14.2'),
(180, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613249777, '23.5', '66.0', '16.8'),
(181, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613249837, '23.5', '69.8', '17.7'),
(182, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613249897, '23.5', '72.1', '18.2'),
(183, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613249957, '23.7', '64.5', '16.6'),
(184, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613250018, '23.8', '61.8', '16.0'),
(185, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613250066, '23.8', '60.3', '15.7'),
(186, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613250077, '23.8', '59.0', '15.3'),
(187, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613250137, '23.8', '58.8', '15.3'),
(188, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613250182, '23.7', '57.5', '14.8'),
(189, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613250242, '23.7', '56.7', '14.6'),
(190, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613250302, '23.6', '55.9', '14.3'),
(191, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613250363, '23.6', '55.2', '14.1'),
(192, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613250742, '23.5', '61.3', '15.6'),
(193, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613250799, '23.8', '58.6', '15.2'),
(194, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613250862, '23.7', '57.3', '14.8'),
(195, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613250919, '23.7', '56.2', '14.5'),
(196, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613250980, '23.6', '55.4', '14.2'),
(197, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613251039, '23.5', '60.4', '15.4'),
(198, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613251101, '23.5', '67.4', '17.1'),
(199, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613252305, '23.5', '71.1', '18.0'),
(200, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613252364, '23.5', '66.3', '16.9'),
(201, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613252424, '23.5', '70.4', '17.8'),
(202, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613252483, '23.7', '71.6', '18.3'),
(203, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613252545, '23.7', '63.2', '16.3'),
(204, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613252666, '23.8', '61.0', '15.8'),
(205, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613257268, '23.8', '57.9', '15.0'),
(206, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613259974, '23.5', '68.9', '17.5'),
(207, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613260029, '22.2', '57.6', '13.4'),
(208, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613260090, '22.2', '57.8', '13.5'),
(209, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613260150, '22.1', '57.9', '13.4'),
(210, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613260211, '22.1', '58.0', '13.5'),
(211, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613260271, '22.1', '58.0', '13.5'),
(212, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613260331, '22.1', '58.0', '13.5'),
(213, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613260391, '22.0', '57.8', '13.3'),
(214, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613260452, '22.0', '59.7', '13.8'),
(215, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613260512, '22.0', '67.2', '15.6'),
(216, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613260524, '22.1', '71.0', '16.6'),
(217, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613260867, '22.1', '71.6', '16.7'),
(218, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613282816, '22.6', '57.5', '13.8'),
(219, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613282860, '23.4', '69.4', '17.5'),
(220, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613283012, '23.5', '69.6', '17.6'),
(221, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613283242, '23.6', '61.4', '15.8'),
(222, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613283996, '23.5', '56.3', '14.3'),
(223, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613284044, '23.4', '66.2', '16.7'),
(224, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613284794, '23.4', '68.8', '17.3'),
(227, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613284855, '23.7', '62.4', '16.1'),
(228, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613285110, '23.7', '60.4', '15.6'),
(230, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613285530, '23.5', '58.5', '14.9'),
(232, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613285691, '23.7', '57.4', '14.8'),
(233, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613285694, '11.3', '75.6', '66.9'),
(234, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613285751, '23.5', '56.8', '14.4'),
(235, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613285754, '62.8', '31.5', '56.5'),
(236, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613286040, '23.4', '66.1', '16.7'),
(237, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613286044, '28.2', '99.5', '78.7'),
(238, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613286064, '10.8', '38.4', '64.2'),
(239, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613286069, '23.7', '59.5', '15.4'),
(240, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613286916, '46.0', '41.2', '46.9'),
(241, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613287163, '23.8', '58.7', '15.2'),
(242, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613287165, '66.8', '95.2', '86.7'),
(243, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613287347, '23.1', '56.7', '14.0'),
(244, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613287349, '90.5', '60.2', '67.2'),
(245, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613287821, '22.9', '56.9', '13.9'),
(246, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613287823, '33.7', '20.8', '17.2'),
(247, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613288378, '68.8', '6.6', '18.8'),
(248, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613289665, '1.5', '65.0', '29.3'),
(249, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613296093, '29.2', '39.6', '65.7'),
(250, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613296866, '26.2', '18.8', '51.2'),
(251, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613297536, '44.6', '51.8', '28.0'),
(252, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613300466, '48.5', '95.8', '64.9'),
(253, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613301247, '28.2', '70.8', '43.9'),
(254, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613304065, '52.0', '51.3', '84.2'),
(255, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613304943, '62.8', '22.9', '99.3'),
(256, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613305201, '22.6', '57.3', '13.7'),
(257, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613305212, '79.8', '78.5', '71.8'),
(258, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613307669, '36.1', '15.5', '77.8'),
(259, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613341909, '86.5', '53.8', '41.3'),
(260, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613343666, '38.8', '74.3', '30.3'),
(261, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613345459, '88.5', '47.0', '82.4'),
(262, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613345973, '23.5', '71.3', '18.0'),
(263, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613345976, '79.6', '97.9', '62.1'),
(264, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613346238, '23.7', '62.4', '16.1'),
(265, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613346241, '12.3', '24.5', '54.8'),
(266, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613346326, '23.6', '55.9', '14.3'),
(267, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613346328, '55.6', '99.2', '55.3'),
(268, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613346360, '23.5', '54.8', '13.9'),
(269, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613346361, '88.2', '90.1', '2.2'),
(270, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613346393, '23.5', '60.8', '15.5'),
(271, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613346395, '0.7', '2.6', '86.5'),
(272, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613347265, '69.4', '60.4', '22.8'),
(273, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613347896, '82.4', '8.8', '77.6'),
(274, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613350866, '85.5', '58.2', '67.8'),
(275, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613353833, '95.9', '91.1', '32.6'),
(276, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613354465, '1.1', '93.9', '22.2'),
(277, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613361680, '36.1', '15.8', '7.1'),
(278, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613365275, '37.4', '97.5', '81.2'),
(279, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613368872, '2.2', '55.7', '56.5'),
(280, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613383266, '14.1', '60.5', '51.7'),
(281, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613383763, '72.2', '57.7', '92.2'),
(282, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613386864, '16.1', '26.5', '38.6'),
(283, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613394063, '42.8', '0.7', '57.9'),
(284, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613394066, '22.1', '55.5', '12.8'),
(285, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613397664, '11.7', '82.8', '18.6'),
(286, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613397667, '22.5', '68.5', '16.4'),
(287, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613400013, '22.7', '53.8', '12.9'),
(288, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613400017, '44.8', '53.9', '77.2'),
(289, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613400019, '22.7', '54.0', '12.9'),
(290, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613400020, '67.9', '24.2', '25.7'),
(291, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613400045, '22.7', '54.0', '12.9'),
(292, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613400046, '95.0', '68.0', '93.6'),
(293, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613400047, '91.2', '33.5', '77.2'),
(294, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613400072, '22.7', '54.0', '12.9'),
(295, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613400146, '22.6', '54.1', '12.9'),
(296, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613400153, '8.3', '66.4', '60.5'),
(297, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613400159, '22.6', '54.1', '12.9'),
(298, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613400166, '22.5', '54.1', '12.8'),
(299, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613400173, '66.6', '63.1', '69.4'),
(300, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613400176, '54.9', '10.3', '26.9'),
(301, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613400179, '22.5', '54.1', '12.8'),
(302, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613400180, '71.3', '73.7', '71.0'),
(303, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613400187, '92.2', '47.2', '20.5'),
(304, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613400190, '22.6', '54.1', '12.9'),
(305, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613400193, '22.5', '54.2', '12.8'),
(306, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613400194, '43.7', '5.4', '23.8'),
(307, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613400234, '22.5', '54.2', '12.8'),
(308, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613400236, '44.0', '57.6', '64.4'),
(309, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613400277, '22.5', '54.2', '12.8'),
(310, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613400278, '73.1', '23.8', '97.5'),
(311, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613400286, '54.8', '35.9', '63.4'),
(312, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613400290, '22.5', '54.1', '12.8'),
(313, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613400303, '47.1', '61.6', '51.8'),
(314, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613400304, '22.5', '54.1', '12.8'),
(315, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613401263, '53.2', '15.3', '77.7'),
(316, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613401331, '23.5', '60.2', '15.3'),
(317, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613401437, '27.9', '27.4', '49.7'),
(318, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613401439, '23.7', '58.2', '15.0'),
(319, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613401464, '23.9', '57.2', '14.9'),
(320, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613401465, '95.9', '7.5', '99.7'),
(321, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613401470, '83.7', '53.6', '26.2'),
(322, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613401473, '23.9', '57.3', '15.0'),
(323, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613401489, '24.0', '56.9', '14.9'),
(324, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613401490, '13.0', '57.0', '84.1'),
(325, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613401495, '41.4', '51.3', '24.1'),
(326, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613401498, '24.0', '56.8', '14.9'),
(327, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613402348, '25.5', '51.0', '14.6'),
(328, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613402349, '78.4', '46.7', '92.4'),
(329, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613402506, '26.3', '51.7', '15.6'),
(330, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613402507, '41.8', '42.4', '71.8'),
(331, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613402848, '27.4', '45.6', '14.6'),
(332, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613402982, '26.7', '53.5', '16.5'),
(333, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613402983, '6.3', '83.5', '69.4'),
(334, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613403035, '97.5', '8.4', '14.8'),
(335, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613403037, '26.6', '54.6', '16.7'),
(336, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613403261, '25.5', '52.4', '15.1'),
(337, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613403262, '6.2', '82.4', '76.9'),
(338, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613403324, '25.0', '51.1', '14.2'),
(339, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613403325, '71.4', '16.2', '3.4'),
(340, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613403382, '24.9', '50.7', '14.0'),
(341, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613403383, '31.6', '66.2', '84.7'),
(342, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613403442, '24.6', '50.2', '13.6'),
(343, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613403443, '81.1', '87.4', '15.3'),
(344, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613457224, '23.7', '54.0', '13.9'),
(345, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613457226, '73.7', '23.2', '16.2'),
(346, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613457235, '23.6', '62.3', '16.0'),
(347, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613457235, '3.0', '58.9', '70.4'),
(348, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613458864, '20.8', '74.2', '72.1'),
(349, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613458867, '23.6', '67.7', '17.3'),
(350, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613458938, '23.7', '59.2', '15.3'),
(351, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613458938, '77.0', '50.3', '27.4'),
(352, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613458997, '23.6', '66.2', '16.9'),
(353, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613458998, '0.0', '37.2', '43.6'),
(354, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613459057, '23.6', '69.1', '17.6'),
(355, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613459058, '15.1', '86.2', '19.4'),
(356, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613459119, '23.8', '66.8', '17.3'),
(357, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613459119, '57.1', '59.7', '44.9'),
(358, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613459178, '23.9', '60.8', '15.9'),
(359, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613459179, '89.0', '22.3', '21.1'),
(360, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613460356, '23.9', '58.5', '15.3'),
(361, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613460357, '69.9', '52.3', '24.3'),
(362, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613460452, '24.0', '57.1', '15.0'),
(363, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613460452, '41.7', '71.4', '39.0'),
(364, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613460488, '23.9', '55.1', '14.3'),
(365, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613460488, '49.5', '57.1', '91.9'),
(366, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613460557, '23.9', '54.6', '14.2'),
(367, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613460558, '96.0', '78.8', '24.5'),
(368, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613460975, '23.8', '53.8', '13.9'),
(369, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613460975, '49.6', '55.5', '53.3'),
(370, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613461038, '23.1', '54.4', '13.4'),
(371, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613461039, '69.9', '70.6', '20.5'),
(372, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613461099, '23.0', '54.3', '13.3'),
(373, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613461099, '67.9', '35.1', '22.1'),
(374, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613461162, '22.9', '54.3', '13.2'),
(375, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613461163, '70.6', '88.5', '4.7'),
(376, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613461221, '22.7', '54.3', '13.0'),
(377, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613461221, '9.5', '9.7', '12.7'),
(378, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613461279, '22.8', '54.3', '13.1'),
(379, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613461279, '7.4', '58.1', '8.9'),
(380, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613461288, '22.7', '54.3', '13.0'),
(381, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613461288, '31.6', '85.7', '7.9'),
(382, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613461353, '22.7', '54.3', '13.0'),
(383, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613461354, '39.6', '45.7', '4.7'),
(384, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613461414, '22.6', '54.2', '12.9'),
(385, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613461414, '20.3', '0.6', '0.8');
INSERT INTO `tb_room_temp` (`temp_id`, `thermo_hash`, `timestamp`, `temperature`, `humidity`, `dew_point`) VALUES
(386, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613461475, '22.6', '54.1', '12.9'),
(387, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613461475, '15.4', '63.5', '13.7'),
(388, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613461535, '22.5', '54.2', '12.8'),
(389, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613461535, '37.0', '58.4', '2.0'),
(390, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613461595, '22.5', '54.2', '12.8'),
(391, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613461596, '10.1', '53.8', '18.4'),
(392, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613461656, '22.4', '54.1', '12.7'),
(393, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613461657, '27.4', '69.2', '13.0'),
(394, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613461767, '22.3', '54.2', '12.6'),
(395, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613461767, '43.3', '42.3', '1.2'),
(396, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613461829, '22.3', '55.1', '12.9'),
(397, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613461829, '38.8', '90.5', '11.2'),
(398, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613461887, '22.2', '62.9', '14.8'),
(399, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613461888, '42.3', '30.8', '18.1'),
(400, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613461948, '22.3', '66.6', '15.8'),
(401, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613461948, '22.6', '6.2', '4.3'),
(402, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613462008, '22.5', '69.4', '16.6'),
(403, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613462009, '33.3', '60.0', '4.1'),
(404, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613462069, '22.7', '62.9', '15.3'),
(405, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613462069, '17.6', '94.1', '19.9'),
(406, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613462128, '22.8', '59.6', '14.5'),
(407, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613462128, '3.4', '37.3', '15.3'),
(408, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613462464, '13.0', '30.2', '2.3'),
(409, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613462467, '22.8', '57.6', '14.0'),
(410, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613462752, '23.1', '56.8', '14.1'),
(411, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613462752, '22.0', '4.0', '16.1'),
(412, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613462837, '23.1', '55.0', '13.6'),
(413, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613462837, '37.7', '15.5', '14.9'),
(414, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613462913, '22.9', '57.1', '14.0'),
(415, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613462913, '39.4', '54.7', '14.3'),
(416, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613462973, '22.9', '65.6', '16.1'),
(417, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613462974, '9.9', '98.8', '10.9'),
(418, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613465139, '23.6', '53.9', '13.7'),
(419, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613465139, '35.9', '44.4', '9.6'),
(420, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613465199, '23.5', '64.0', '16.3'),
(421, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613465199, '38.4', '23.9', '4.6'),
(422, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613465527, '23.8', '57.6', '14.9'),
(423, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613465527, '30.1', '79.1', '4.0'),
(424, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613465588, '23.7', '56.0', '14.4'),
(425, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613465588, '29.6', '26.7', '15.9'),
(426, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613465649, '23.7', '54.8', '14.1'),
(427, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613465649, '31.6', '68.6', '4.8'),
(428, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613465709, '23.6', '53.7', '13.7'),
(429, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613465709, '1.9', '65.8', '16.5'),
(430, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613465769, '23.5', '63.1', '16.1'),
(431, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613465770, '37.9', '86.2', '1.0'),
(432, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613465830, '23.5', '67.3', '17.1'),
(433, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613465830, '0.2', '57.3', '7.6'),
(434, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613465891, '23.6', '70.0', '17.8'),
(435, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613465891, '17.4', '89.9', '0.9'),
(436, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613468570, '23.7', '63.9', '16.5'),
(437, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613468570, '21.2', '6.5', '9.0'),
(438, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613468632, '23.7', '61.7', '15.9'),
(439, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613468632, '32.2', '54.9', '13.0'),
(440, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613468818, '23.9', '64.6', '16.8'),
(441, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613468818, '29.1', '12.4', '10.1'),
(442, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613468878, '23.9', '60.5', '15.8'),
(443, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613468879, '43.8', '63.4', '3.8'),
(444, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613469664, '19.9', '99.6', '15.1'),
(445, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613469667, '24.0', '58.6', '15.4'),
(446, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613473264, '36.6', '40.9', '2.0'),
(447, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1613473269, '23.1', '55.9', '13.8');

-- --------------------------------------------------------

--
-- Table structure for table `tb_thermometer`
--

CREATE TABLE `tb_thermometer` (
  `thermo_id` int(11) NOT NULL,
  `thermo_hash` varchar(512) NOT NULL,
  `installation_date` int(11) NOT NULL,
  `thermo_url` varchar(255) NOT NULL,
  `thermo_location` varchar(255) NOT NULL,
  `cron_schedule` varchar(13) NOT NULL,
  `is_active` enum('yes','no') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_thermometer`
--

INSERT INTO `tb_thermometer` (`thermo_id`, `thermo_hash`, `installation_date`, `thermo_url`, `thermo_location`, `cron_schedule`, `is_active`) VALUES
(49, 'MDRmODNlMzQxODlkMWZhYTk1NWU4MjcwODYzNWYzNzQzYzlhYTBmOTU0ZDk5ZTVkN2RjZjkzMTRlNGUyNDk4Yg', 1612976400, 'http://103.50.218.19:9000', 'Server Room', '1 * * * *', 'yes'),
(68, 'MDg0MmUzZTAwYzM3ZjhjMGJlYTA0ZjM5MGUyMjVkODcwMGFmZDIzN2E3MGVhODMxMWUwZmI3MjQxOGQ2N2ViMg', 1613235600, 'https://localhost/suhu-app/dummy', 'Network Room', '1 * * * *', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `user_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_realname` varchar(150) NOT NULL,
  `user_email` varchar(150) NOT NULL,
  `user_picture` varchar(255) NOT NULL,
  `user_token` varchar(512) DEFAULT NULL,
  `is_active` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`user_id`, `type_id`, `user_name`, `user_password`, `user_realname`, `user_email`, `user_picture`, `user_token`, `is_active`) VALUES
(1, 2, 'ridwannaim', '$argon2id$v=19$m=2048,t=4,p=3$VmVHQmZyWUs0a0oyNVRpUg$VVxutFvhiAFe6LMq///6tS7UmMXRFvTP96LpXwCLPSs', 'Muhammad Ridwan Naim', 'muhammadridwannaim@gmail.com', 'MTU1MzhiZmItZjhhNS1iMjhmYzVkMC03YzA3LTcwNTVlY2Vk/9a050822173e30d27980ec44dd12e719_GxYeBht2tx33eL6v5Q13w_lWeMiuNI_2678_021495876_boLA9u_1613402488.webp', NULL, 'Y'),
(4, 1, 'noplanalderson', '$argon2id$v=19$m=2048,t=4,p=3$eEJxVGI1WXFCcG5UUjc0WA$fTaGKvT1Em+2whGUi9H6RwqWzwahzT6FbH7lmMnAHq8', 'Noplan Alderson', 'mrneem@protonmail.com', 'default.png', NULL, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user_type`
--

CREATE TABLE `tb_user_type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_user_type`
--

INSERT INTO `tb_user_type` (`type_id`, `type_name`) VALUES
(1, 'userman'),
(2, 'employee');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_app_setting`
--
ALTER TABLE `tb_app_setting`
  ADD PRIMARY KEY (`app_id`);

--
-- Indexes for table `tb_email_notifier`
--
ALTER TABLE `tb_email_notifier`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `tb_login_data`
--
ALTER TABLE `tb_login_data`
  ADD PRIMARY KEY (`data_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tb_logs`
--
ALTER TABLE `tb_logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `tb_menu`
--
ALTER TABLE `tb_menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `tb_roles`
--
ALTER TABLE `tb_roles`
  ADD PRIMARY KEY (`role_id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `tb_room_temp`
--
ALTER TABLE `tb_room_temp`
  ADD PRIMARY KEY (`temp_id`),
  ADD KEY `tb_room_temp_ibfk_1` (`thermo_hash`);

--
-- Indexes for table `tb_thermometer`
--
ALTER TABLE `tb_thermometer`
  ADD PRIMARY KEY (`thermo_id`),
  ADD UNIQUE KEY `thermo_hash` (`thermo_hash`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `tb_user_type`
--
ALTER TABLE `tb_user_type`
  ADD PRIMARY KEY (`type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_email_notifier`
--
ALTER TABLE `tb_email_notifier`
  MODIFY `email_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_login_data`
--
ALTER TABLE `tb_login_data`
  MODIFY `data_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `tb_logs`
--
ALTER TABLE `tb_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=445;

--
-- AUTO_INCREMENT for table `tb_menu`
--
ALTER TABLE `tb_menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tb_roles`
--
ALTER TABLE `tb_roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `tb_room_temp`
--
ALTER TABLE `tb_room_temp`
  MODIFY `temp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=448;

--
-- AUTO_INCREMENT for table `tb_thermometer`
--
ALTER TABLE `tb_thermometer`
  MODIFY `thermo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_user_type`
--
ALTER TABLE `tb_user_type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_login_data`
--
ALTER TABLE `tb_login_data`
  ADD CONSTRAINT `tb_login_data_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_roles`
--
ALTER TABLE `tb_roles`
  ADD CONSTRAINT `tb_roles_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `tb_user_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_roles_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `tb_menu` (`menu_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_room_temp`
--
ALTER TABLE `tb_room_temp`
  ADD CONSTRAINT `tb_room_temp_ibfk_1` FOREIGN KEY (`thermo_hash`) REFERENCES `tb_thermometer` (`thermo_hash`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD CONSTRAINT `tb_user_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `tb_user_type` (`type_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;