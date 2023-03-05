-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 05, 2023 at 08:24 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `billing_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_details`
--

CREATE TABLE IF NOT EXISTS `admin_details` (
`id` int(11) NOT NULL,
  `admin_password` varchar(100) NOT NULL,
  `web_id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phoneno` bigint(20) NOT NULL,
  `shop_type` varchar(100) NOT NULL,
  `shop_name` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_details`
--

INSERT INTO `admin_details` (`id`, `admin_password`, `web_id`, `name`, `phoneno`, `shop_type`, `shop_name`, `address`, `email`) VALUES
(1, 'admin', 'admin', 'owner name', 0, 'SHOP_type', 'shop_name', 'address', 'email');

-- --------------------------------------------------------

--
-- Table structure for table `admin_login`
--

CREATE TABLE IF NOT EXISTS `admin_login` (
`id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phoneno` bigint(12) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_login`
--

INSERT INTO `admin_login` (`id`, `username`, `password`, `phoneno`) VALUES
(1, 'admin', 'admin', 86571616169);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
`id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `total_amt` bigint(20) DEFAULT '0',
  `total_paid` bigint(255) DEFAULT NULL,
  `total_pending` bigint(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `address`, `phone`, `date`, `total_amt`, `total_paid`, `total_pending`) VALUES
(21, 'rahul', 'trryyu', '45678', '2022-08-02', 2600, 2000, 600),
(22, 'xyz', 'asf', '456789', '2022-08-11', 4000, 4000, 0),
(31, 'pradnya', 'panvel', '345678764', '2022-08-12', 20000, 20000, 0),
(38, 'Rahul Varun', 'sgfh', '87654246', '2023-03-05', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customers_details`
--

CREATE TABLE IF NOT EXISTS `customers_details` (
`id` int(11) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_price` bigint(255) NOT NULL,
  `prod_quantity` bigint(255) NOT NULL DEFAULT '1',
  `customer_id` int(12) NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `total` bigint(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers_details`
--

INSERT INTO `customers_details` (`id`, `product_name`, `product_price`, `prod_quantity`, `customer_id`, `payment_status`, `total`, `date`) VALUES
(1, 'phone', 1000, 2, 21, 'Paid', 2000, '2023-03-05 07:13:31'),
(2, 'xyz', 30, 20, 21, 'Pending', 600, '2023-03-05 07:13:50'),
(3, 'abc', 2000, 10, 31, 'Paid', 20000, '2023-03-05 07:14:23');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
`product_id` int(11) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_mrp` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_price`, `product_mrp`) VALUES
(6, 'Rahul', 100, 0),
(7, 'Rahul', 100, 0),
(8, 'Rahul', 100, 0),
(9, 'Rahul', 100, 0),
(10, 'Rahul', 100, 0),
(11, 'Rahul', 100, 0),
(12, 'Rahul', 100, 0),
(13, 'Rahul', 100, 0),
(14, 'Rahul', 100, 0),
(15, 'phone', 1000, 0),
(16, 'xyz', 30, 0),
(17, 'abc', 2000, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_details`
--
ALTER TABLE `admin_details`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_login`
--
ALTER TABLE `admin_login`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers_details`
--
ALTER TABLE `customers_details`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
 ADD PRIMARY KEY (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_details`
--
ALTER TABLE `admin_details`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `admin_login`
--
ALTER TABLE `admin_login`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `customers_details`
--
ALTER TABLE `customers_details`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
