-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 29, 2023 at 02:02 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `document_type_id` int(11) DEFAULT NULL,
  `id_number` int(11) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `cell_phone_number` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `document_type_id`, `id_number`, `name`, `cell_phone_number`, `email`, `address`) VALUES
(1, 1, 123654, 'Luis', '+58 4128127856', 'luisperez@gmail.com', 'EL Valle');

-- --------------------------------------------------------

--
-- Table structure for table `client_address`
--

CREATE TABLE `client_address` (
  `id` int(11) NOT NULL,
  `address` varchar(30) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client_address`
--

INSERT INTO `client_address` (`id`, `address`, `client_id`) VALUES
(1, 'Catia', 1);

-- --------------------------------------------------------

--
-- Table structure for table `document_types`
--

CREATE TABLE `document_types` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `document_types`
--

INSERT INTO `document_types` (`id`, `name`) VALUES
(1, 'V'),
(2, 'E'),
(3, 'G'),
(4, 'J'),
(5, 'P');

-- --------------------------------------------------------

--
-- Table structure for table `dollar_prices`
--

CREATE TABLE `dollar_prices` (
  `id` int(11) NOT NULL,
  `price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dollar_prices`
--

INSERT INTO `dollar_prices` (`id`, `price`) VALUES
(1, 20),
(2, 50),
(3, 60),
(4, 70);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `employee_type_id` int(11) DEFAULT NULL,
  `document_type_id` int(11) DEFAULT NULL,
  `id_number` int(11) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `cell_phone_number` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `is_employed` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `employee_type_id`, `document_type_id`, `id_number`, `name`, `cell_phone_number`, `email`, `is_employed`) VALUES
(1, 1, 1, 123654, 'Maria', '+58 45698712', 'maria@gmail.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee_types`
--

CREATE TABLE `employee_types` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_types`
--

INSERT INTO `employee_types` (`id`, `name`) VALUES
(1, 'delivery'),
(2, 'customer support'),
(3, 'web developer'),
(4, 'marketing manager'),
(5, 'manager');

-- --------------------------------------------------------

--
-- Table structure for table `meeting_media`
--

CREATE TABLE `meeting_media` (
  `id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `banners` tinyint(1) DEFAULT NULL,
  `web` tinyint(1) DEFAULT NULL,
  `social_media` tinyint(1) DEFAULT NULL,
  `frills` tinyint(1) DEFAULT NULL,
  `newspaper` tinyint(1) DEFAULT NULL,
  `magazines` tinyint(1) DEFAULT NULL,
  `internet` tinyint(1) DEFAULT NULL,
  `for_a_friend` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `meeting_media`
--

INSERT INTO `meeting_media` (`id`, `client_id`, `banners`, `web`, `social_media`, `frills`, `newspaper`, `magazines`, `internet`, `for_a_friend`) VALUES
(1, 1, 1, 1, 1, 1, 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `dollar_prices_id` int(11) DEFAULT NULL,
  `code` varchar(30) DEFAULT NULL,
  `product` varchar(30) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `dollar_prices_id`, `code`, `product`, `stock`, `description`) VALUES
(1, 1, '1123654', 'camisa blanca unitalla', 100, 'camisa de algodon blanca, para todas las tallas');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `review` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `client_id`, `product_id`, `review`) VALUES
(1, 1, 1, 'Excelente calidad');

-- --------------------------------------------------------

--
-- Table structure for table `shopping_car`
--

CREATE TABLE `shopping_car` (
  `id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `document_type_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `dollar_prices_id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `client_address_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shopping_car`
--

INSERT INTO `shopping_car` (`id`, `client_id`, `document_type_id`, `product_id`, `dollar_prices_id`, `amount`, `date`, `client_address_id`) VALUES
(1, 1, 1, 1, 1, 20, '2023-01-18', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_type_id` (`document_type_id`);

--
-- Indexes for table `client_address`
--
ALTER TABLE `client_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `document_types`
--
ALTER TABLE `document_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dollar_prices`
--
ALTER TABLE `dollar_prices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_type_id` (`employee_type_id`),
  ADD KEY `document_type_id` (`document_type_id`);

--
-- Indexes for table `employee_types`
--
ALTER TABLE `employee_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meeting_media`
--
ALTER TABLE `meeting_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dollar_prices_id` (`dollar_prices_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `shopping_car`
--
ALTER TABLE `shopping_car`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `document_type_id` (`document_type_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `dollar_prices_id` (`dollar_prices_id`),
  ADD KEY `client_address_id` (`client_address_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `client_address`
--
ALTER TABLE `client_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `document_types`
--
ALTER TABLE `document_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `dollar_prices`
--
ALTER TABLE `dollar_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employee_types`
--
ALTER TABLE `employee_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `meeting_media`
--
ALTER TABLE `meeting_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shopping_car`
--
ALTER TABLE `shopping_car`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`document_type_id`) REFERENCES `document_types` (`id`);

--
-- Constraints for table `client_address`
--
ALTER TABLE `client_address`
  ADD CONSTRAINT `client_address_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`);

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`employee_type_id`) REFERENCES `employee_types` (`id`),
  ADD CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`document_type_id`) REFERENCES `document_types` (`id`);

--
-- Constraints for table `meeting_media`
--
ALTER TABLE `meeting_media`
  ADD CONSTRAINT `meeting_media_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`dollar_prices_id`) REFERENCES `dollar_prices` (`id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `shopping_car`
--
ALTER TABLE `shopping_car`
  ADD CONSTRAINT `shopping_car_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `shopping_car_ibfk_2` FOREIGN KEY (`document_type_id`) REFERENCES `document_types` (`id`),
  ADD CONSTRAINT `shopping_car_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `shopping_car_ibfk_4` FOREIGN KEY (`dollar_prices_id`) REFERENCES `dollar_prices` (`id`),
  ADD CONSTRAINT `shopping_car_ibfk_5` FOREIGN KEY (`client_address_id`) REFERENCES `client_address` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;