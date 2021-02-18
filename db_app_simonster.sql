-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 18, 2021 at 03:33 PM
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
(1, 'Sistem Monitoring Suhu Data Center', 'SIMONSTER', 120000, 'SIMONSTER - DISKOMINFO KOTA TANGERANG', 'app_icon/simonster-icon_PezWKXCz8oBwHy9LprsY7g_BOoCYvzs_6984_439082561_LauOSR_1613634369.webp', 'app_logo_dark/logo-simonster-dark_AlQs4ThOtYeh0ywFJJVBrg_MJoRwmcE_7946_460893215_TrwlbL_1613634369.webp', 'app_logo_light/logo-simonster-light_DRJnMoUxcU0AKp98NeYm1Q_sKFeDaYx_8462_508413269_6E5MUK_1613634369.webp', 'DINAS KOMUNIKASI DAN INFORMATIKA KOTA TANGERANG');

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
-- Table structure for table `tb_logs`
--

CREATE TABLE `tb_logs` (
  `log_id` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(4, 1, 'userman', '$argon2id$v=19$m=2048,t=4,p=3$MzFaYWtHT1V3a2lWZ2tqTQ$184peklxAFz5vk8zmWmQYnCqJ37sjDt3YHYZ3fNQjHc', 'User Manager', 'userman@somewhere.com', 'default.png', NULL, 'Y'),
(5, 2, 'employee', '$argon2id$v=19$m=2048,t=4,p=3$LjluUzRpUHNzaDJvMmszaw$23nO/SqswKSe3XaXOvkIwdJKq6Id54LCoarDQlYP1zA', 'Employee', 'employee@somewhere.com', 'default.png', NULL, 'Y');

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
-- AUTO_INCREMENT for table `tb_logs`
--
ALTER TABLE `tb_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `temp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_thermometer`
--
ALTER TABLE `tb_thermometer`
  MODIFY `thermo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_user_type`
--
ALTER TABLE `tb_user_type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

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