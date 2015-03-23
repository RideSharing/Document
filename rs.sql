-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2015 at 11:01 AM
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
  `status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`user_id`, `driver_license`, `driver_license_img`, `status`, `created_at`) VALUES
(11, '12', '12', 0, '2015-03-19 03:19:54');

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
  `pick_up_address_lat` double DEFAULT NULL,
  `pick_up_address_long` double DEFAULT NULL,
  `drop_address` varchar(255) DEFAULT NULL,
  `drop_address_lat` double DEFAULT NULL,
  `drop_address_long` double DEFAULT NULL,
  `end_address` varchar(255) NOT NULL,
  `end_address_lat` double NOT NULL,
  `end_address_long` double NOT NULL,
  `leave_date` datetime NOT NULL,
  `duration` int(3) NOT NULL,
  `cost` float NOT NULL,
  `description` text,
  `status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `role`, `email`, `password`, `api_key`, `fullname`, `personalID`, `created_at`) VALUES
(6, 1, 'thanhbkdn92@gmail.com', '$2a$10$d8a473a9c43c2a9cff944uRam09vEg9n4.JX4pOyXX4Z4ip4hlEVW', 'd1731316ef910efd86e5a2ca674d2867', ' ', ' ', '2015-03-20 03:01:10'),
(13, 1, 'thanhbkdn912@gmail.com', '$2a$10$97a8560b5bdbede6af112utIlksBWCt/iozq5mfmwbM9tMS.9DQtS', '7ba556d4fb84a890970fa03b76f1c597', ' ', '191745', '2015-03-23 03:29:09'),
(14, 1, 'abc@gmail.com', '$2a$10$a8e04c1138f705c839533uGLsDWpiOYRatJ5LW9iwzybDYeuZ2nHm', '887042ca11b6b1b5a6edc34332f8afcb', ' ', ' ', '2015-03-23 03:36:30');

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
  `personalID_img` text,
  `link_avatar` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(1) NOT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `email`, `password`, `api_key`, `fullname`, `phone`, `personalID`, `personalID_img`, `link_avatar`, `created_at`, `status`, `locked`) VALUES
(11, 'thanh123@gmail.com', '$2a$10$84e2e3d8d5874dd1611c5uqxp4O4D4.34TPHafNdIhlmuPUOjQUh.', 'ce657571fcbe01921ce838df4cccddf4', 'Thanh Stupid', '0938742126', '15975382456', '123', '123', '2015-03-12 08:07:17', 6, 0),
(13, 'nguyennhatcuong.it@gmail.com', '$2a$10$a82537093c7653f7715c2Oqx72UDMAWuXQv.RuMgE7j3XhICtF1EC', 'c5286d8206e9403d44ff6a6e5040d741', 'Nguyen Nhat Cuong', '484848', '', '', '', '2015-03-13 01:39:31', 2, 0),
(37, 'harold@enclave.vn', '$2a$10$29b8ad6c0e86b810d8b11O8deL46NdZ1L0OoUntHYxLGf/8e1h4du', 'eefdf7110456167448b6c73b33c68f30', 'Huy Harold', '0905699669', '123123', '/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsK\nCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRT/2wBDAQMEBAUEBQkFBQkUDQsNFBQUFBQU\nFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBT/wAARCAB4AKADASIA\nAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA\nAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3\nODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm\np6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA\nAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx\nBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK\nU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3\nuLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD81KKK\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoooo\nAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACi\niigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoop0cTzOFjRnb0UZNA0m3ZDa\nKtabpd1q94traQmacgnbkAADqSTwAO5PAq5qPhi9060N2Tb3VqrBHms7hJlRj0DbSduccZ69qDeG\n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', '2015-03-16 02:24:07', 2, 0),
(56, 'hanley@enclave.vn', '$2a$10$0dfaef977f1051ddf8c1cOyD8Ia/6WV/9Vj6qlQY.fDMXejV064Bq', '896ab200784ab8bc7c64db8b08d92164', NULL, NULL, NULL, NULL, NULL, '2015-03-20 10:24:42', 1, 0),
(57, 'dauxanhrauma@gmail.com', '$2a$10$0b993898860c47704aea5uXWd64i0vB/IqgxDf.brY9/P3lehC9.y', '12e83fd9f47b2e3cf52db8152f23e13f', NULL, NULL, NULL, NULL, NULL, '2015-03-23 01:28:10', 1, 0),
(58, 'huy@enclave.vn', '$2a$10$0867702af30772dd391c5uJQV7/aEiXrVq.58EcmsNbZQMj/OQCAG', '0e4cca82ae478897a7d4ab8105ec5ee8', NULL, NULL, NULL, NULL, NULL, '2015-03-23 01:56:54', 1, 0);

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
 ADD PRIMARY KEY (`staff_id`), ADD UNIQUE KEY `rs_staff_email` (`email`);

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
MODIFY `itinerary_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=59;
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
