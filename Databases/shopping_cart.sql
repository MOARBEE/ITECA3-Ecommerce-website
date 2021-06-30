-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 30, 2021 at 11:59 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping_cart`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart`
--

CREATE TABLE `tbl_cart` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `member_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `order_status` varchar(255) NOT NULL,
  `order_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`id`, `customer_id`, `amount`, `name`, `address`, `city`, `state`, `zip`, `country`, `payment_type`, `order_status`, `order_at`) VALUES
(33, 2, 240000, 'Muhammed Arbee', '15 Roshini Street, Shalimar Ridge, House', 'Heidelberg', 'Gauteng', '1438', 'South Africa', 'PAYPAL', 'PENDING', '2021-06-29 13:58:47'),
(34, 2, 60000, 'Muhammed Arbee', '15 Roshini Street, Shalimar Ridge, House', 'Heidelberg', 'Gauteng', '1438', 'South Africa', 'PAYPAL', 'PENDING', '2021-06-29 14:12:11');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_item`
--

CREATE TABLE `tbl_order_item` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `item_price` double NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_order_item`
--

INSERT INTO `tbl_order_item` (`id`, `order_id`, `product_id`, `item_price`, `quantity`) VALUES
(35, 33, 13, 240000, 1),
(36, 34, 1, 60000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment`
--

CREATE TABLE `tbl_payment` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `payment_response` text NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `id` int(8) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `price` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`id`, `name`, `code`, `image`, `price`) VALUES
(1, 'Toyota RunX 140', 'Tyotarnx', 'product/toyotarunxcart.jpg', 60000.00),
(2, 'Toyota Hilux 3.0 D-4D', 'Tyotahilux', 'product/toyotahiluxcart.jpg', 165000.00),
(3, 'Land Rover Discovery', 'lrover', 'product/landrovercart.jpg', 120000.00),
(4, 'VW Polo 1.6', 'vwpolo1.6', 'product/vwpolocart.jpg', 100000.00),
(5, 'BMW 118i facelift', 'bmw118iflift', 'product/bmw1seriescart.jpg', 150000.00),
(6, 'Isuzu KB 350 double cab', 'isukb350', 'product/isuzucart.jpg', 145000.00),
(7, 'Jeep Compass 2.0 Limited', 'jeepcmpas2.0', 'product/jeepcart.jpg', 280000.00),
(8, 'Mercedes Benz C180 AMG', 'mbenzc180', 'product/mercedescart.jpg', 270000.00),
(9, 'Hyundai H100 Bakkie 2.5', 'hyundaih100', 'product/hyundaicart.jpg', 200000.00),
(10, 'Audi TT 2.0 DSG', 'auditt2.0', 'product/audittcart.jpg', 150000.00),
(11, 'Hyundai Elantra 1.6 GLS', 'hyundaielntra1.6', 'product/hyundaielantracart.jpg', 137000.00),
(12, 'Alfa Romeo Giulietta 1.4Tbi Progression', 'alfaromeog1.4', 'product/alfaromeocart.jpg', 130000.00),
(13, 'Mini Cooper S', 'minicoops', 'product/minicoopercart.jpg', 240000.00),
(14, 'Mercedes Benz GLA 200', 'mbenzgla200', 'product/mercbenzglacart.jpg', 290000.00),
(15, 'Hyundai Accent 1.6 GL', 'hyundaiacc1.6', 'product/hyundaiaccentcart.jpg', 150000.00),
(16, 'Mercedes A45 AMG', 'mbenza45', 'product/mercbenza45cart.jpg', 440000.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order_item`
--
ALTER TABLE `tbl_order_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_code` (`code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `tbl_order_item`
--
ALTER TABLE `tbl_order_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
