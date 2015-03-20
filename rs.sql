-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2015 at 03:59 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `rs`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
`comment_id` int(11) NOT NULL,
  `user_comment_id` int(11) NOT NULL,
  `comment_about_user_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE IF NOT EXISTS `driver` (
  `user_id` int(11) NOT NULL,
  `driver_license` varchar(20) NOT NULL,
  `driver_license_img` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`user_id`, `driver_license`, `driver_license_img`, `created_at`) VALUES
(11, '12', '12', '2015-03-19 03:19:54');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
`feedback_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `itinerary`
--

CREATE TABLE IF NOT EXISTS `itinerary` (
`itinerary_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `start_address` varchar(255) NOT NULL,
  `start_address_lat` double NOT NULL,
  `start_address_long` double NOT NULL,
  `pick_up_address` varchar(255) DEFAULT NULL,
  `pick_up_address_lat` double NOT NULL,
  `pick_up_address_long` double NOT NULL,
  `drop_address` varchar(255) DEFAULT NULL,
  `drop_address_lat` double NOT NULL,
  `drop_address_long` double NOT NULL,
  `end_address` varchar(255) NOT NULL,
  `end_address_lat` double NOT NULL,
  `end_address_long` double NOT NULL,
  `leave_date` datetime NOT NULL,
  `duration` int(3) NOT NULL,
  `cost` float NOT NULL,
  `description` text,
  `status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `itinerary`
--

INSERT INTO `itinerary` (`itinerary_id`, `driver_id`, `customer_id`, `start_address`, `start_address_lat`, `start_address_long`, `pick_up_address`, `pick_up_address_lat`, `pick_up_address_long`, `drop_address`, `drop_address_lat`, `drop_address_long`, `end_address`, `end_address_lat`, `end_address_long`, `leave_date`, `duration`, `cost`, `description`, `status`, `created_at`) VALUES
(2, 11, NULL, '123', 0, 0, '123', 0, 0, '123', 0, 0, '123', 0, 0, '2015-03-03 00:00:00', 3, 123, '123', 1, '2015-03-16 02:28:38'),
(3, 11, NULL, 'ABC', 0, 0, NULL, 0, 0, NULL, 0, 0, 'XYZ', 0, 0, '0000-00-00 00:00:00', 2, 12000, 'asasdas', 0, '2015-03-16 03:17:26'),
(4, 11, NULL, 'ABC', 0, 0, NULL, 0, 0, NULL, 0, 0, 'XYZ', 0, 0, '0000-00-00 00:00:00', 2, 12000, 'abcxyzletrungvi', 0, '2015-03-17 07:53:19');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE IF NOT EXISTS `rating` (
`rating_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating_user_id` int(11) NOT NULL,
  `rating` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE IF NOT EXISTS `staff` (
`staff_id` int(11) NOT NULL,
  `role` int(1) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `api_key` char(32) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `personalID` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`user_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `api_key` char(32) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `personalID` varchar(20) DEFAULT NULL,
  `personalID_img` varchar(255) DEFAULT NULL,
  `link_avatar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `email`, `password`, `api_key`, `fullname`, `phone`, `personalID`, `personalID_img`, `link_avatar`, `created_at`, `status`) VALUES
(11, 'thanhbkdn92@live.com', '$2a$10$e6ea3c6e3e60d5314aebauDNTTYqQB2kpU6xI4LHvm1jo1cFmfCVi', 'ce657571fcbe01921ce838df4cccddf4', 'Trần Duy Thành', '0938742126', '191745331', '123', '123', '2015-03-12 08:07:17', 3),
(13, 'nguyennhatcuong.it@gmail.com', '$2a$10$a82537093c7653f7715c2Oqx72UDMAWuXQv.RuMgE7j3XhICtF1EC', 'c5286d8206e9403d44ff6a6e5040d741', 'Nguyen Nhat Cuong', '484848', '', '', '', '2015-03-13 01:39:31', 2),
(14, 'cody@enclave.vn', '$2a$10$fbf9081549e0d7575eae1uxh09Op4.DCrmiUYnGSphHg6ZrtU76.i', '85a4429b2172ffd35322608a5831b899', NULL, NULL, NULL, NULL, NULL, '2015-03-13 01:47:03', 2),
(36, 'huy@gmail.com', '$2a$10$8a31b37cdcb229490cfafuqqzsN064ABoHfvcPVZ.L4jsgWsU0.0W', '1dcaab24324fb6d49894af24bc629e3e', NULL, NULL, NULL, NULL, NULL, '2015-03-13 10:22:43', 1),
(37, 'harold@enclave.vn', '$2a$10$dbd159bcc947ecea052b2eDuH7IBW4c/gDNlBKPQRICmctmbhrOdC', 'eefdf7110456167448b6c73b33c68f30', NULL, NULL, NULL, NULL, 'http://ep.imgci.com/PICTURES/CMS/20200/20259.jpg', '2015-03-16 02:24:07', 2),
(46, 'cody@enclave.v3n', '$2a$10$243fcd280687b67bc16daOPNxr0M2cPv96XnPifU4eZWqtPTX4uC2', 'e7d9918263fb085ef852142cabe44457', NULL, NULL, NULL, NULL, NULL, '2015-03-17 08:37:00', 1),
(47, 'cody@1enclave.v3n', '$2a$10$187d40864c063477de445uzYPGbwfDsW6KluFsNqV9/zeeS9A1KI6', '30b64ff98200e1e6da20003a62f34b3b', NULL, NULL, NULL, NULL, NULL, '2015-03-17 08:39:49', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE IF NOT EXISTS `vehicle` (
`vehicle_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `license_plate` varchar(20) NOT NULL,
  `reg_certificate` varchar(255) NOT NULL,
  `license_plate_img` varchar(255) NOT NULL,
  `vehicle_img` varchar(255) NOT NULL,
  `motor_insurance_img` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
 ADD PRIMARY KEY (`comment_id`), ADD KEY `user_comment_id` (`user_comment_id`), ADD KEY `comment_about_user_id` (`comment_about_user_id`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
 ADD PRIMARY KEY (`user_id`), ADD UNIQUE KEY `rs_driver_license` (`driver_license`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
 ADD PRIMARY KEY (`feedback_id`), ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `itinerary`
--
ALTER TABLE `itinerary`
 ADD PRIMARY KEY (`itinerary_id`), ADD KEY `customer_id` (`customer_id`), ADD KEY `driver_id` (`driver_id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
 ADD PRIMARY KEY (`rating_id`), ADD KEY `user_id` (`user_id`), ADD KEY `rating_user_id` (`rating_user_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
 ADD PRIMARY KEY (`staff_id`), ADD UNIQUE KEY `rs_staff_email` (`email`), ADD UNIQUE KEY `rs_staff_personalID` (`personalID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`user_id`), ADD UNIQUE KEY `email` (`email`), ADD UNIQUE KEY `rs_email` (`email`), ADD UNIQUE KEY `rs_apikey` (`api_key`), ADD UNIQUE KEY `rs_personalID` (`personalID`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
 ADD PRIMARY KEY (`vehicle_id`), ADD UNIQUE KEY `rs_license_plate` (`license_plate`), ADD UNIQUE KEY `rs_reg_certificate` (`reg_certificate`), ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `itinerary`
--
ALTER TABLE `itinerary`
MODIFY `itinerary_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `vehicle`
--
ALTER TABLE `vehicle`
MODIFY `vehicle_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_comment_id`) REFERENCES `user` (`user_id`),
ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`comment_about_user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `driver`
--
ALTER TABLE `driver`
ADD CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `itinerary`
--
ALTER TABLE `itinerary`
ADD CONSTRAINT `itinerary_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `user` (`user_id`),
ADD CONSTRAINT `itinerary_ibfk_3` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`user_id`);

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`rating_user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `vehicle`
--
ALTER TABLE `vehicle`
ADD CONSTRAINT `vehicle_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `driver` (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
