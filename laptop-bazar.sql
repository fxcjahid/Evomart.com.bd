-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2023 at 08:53 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laptop-bazar`
--

-- --------------------------------------------------------

--
-- Table structure for table `activations`
--

CREATE TABLE `activations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `completed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activations`
--

INSERT INTO `activations` (`id`, `user_id`, `code`, `completed`, `completed_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'YQzGnwG7CSXkFrF9YxHIYTjhphu5fdaB', 1, '2023-08-24 06:32:06', '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(2, 2, 'FXlAbkcoSj8BE8oiGRyRZziYlCDiqRjt', 1, '2023-08-24 12:42:45', '2023-08-24 06:42:45', '2023-08-24 06:42:45'),
(3, 3, 'T1FW6UlrHrWxFvdI56EMRhucjqjzilDV', 1, '2023-08-24 12:43:38', '2023-08-24 06:43:38', '2023-08-24 06:43:38');

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `attribute_set_id` int(10) UNSIGNED NOT NULL,
  `is_filterable` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `attribute_set_id`, `is_filterable`, `created_at`, `updated_at`, `slug`) VALUES
(1, 1, 1, '2023-08-24 07:24:10', '2023-08-24 07:24:10', 'laptop-brand'),
(2, 1, 0, '2023-08-24 07:35:07', '2023-08-24 07:35:07', 'color-family'),
(3, 1, 0, '2023-08-24 07:36:45', '2023-08-24 07:36:45', 'display'),
(4, 1, 0, '2023-08-24 07:37:06', '2023-08-24 07:37:06', 'cpu-core-quantity'),
(5, 1, 0, '2023-08-24 07:38:05', '2023-08-24 07:38:05', 'ssd'),
(6, 1, 0, '2023-08-24 07:38:34', '2023-08-24 07:38:34', 'hdd'),
(7, 1, 1, '2023-08-24 07:39:25', '2023-08-26 06:36:57', 'ram'),
(8, 1, 0, '2023-08-24 07:39:56', '2023-08-24 07:39:56', 'processor'),
(9, 1, 0, '2023-08-24 07:40:39', '2023-08-24 07:40:39', 'processor-brand'),
(12, 1, 0, '2023-08-24 09:02:01', '2023-08-24 09:02:01', 'resolution');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_categories`
--

CREATE TABLE `attribute_categories` (
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_categories`
--

INSERT INTO `attribute_categories` (`attribute_id`, `category_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(7, 1),
(7, 2),
(7, 3),
(7, 4),
(7, 5),
(7, 6),
(9, 1),
(9, 2),
(9, 3),
(9, 4);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_sets`
--

CREATE TABLE `attribute_sets` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_sets`
--

INSERT INTO `attribute_sets` (`id`, `created_at`, `updated_at`) VALUES
(1, '2023-08-24 07:21:45', '2023-08-24 07:21:45');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_set_translations`
--

CREATE TABLE `attribute_set_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `attribute_set_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_set_translations`
--

INSERT INTO `attribute_set_translations` (`id`, `attribute_set_id`, `locale`, `name`) VALUES
(1, 1, 'en', 'Specification');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_translations`
--

CREATE TABLE `attribute_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_translations`
--

INSERT INTO `attribute_translations` (`id`, `attribute_id`, `locale`, `name`) VALUES
(1, 1, 'en', 'Laptop Brand'),
(2, 2, 'en', 'Color Family'),
(3, 3, 'en', 'Display'),
(4, 4, 'en', 'CPU Core Quantity'),
(5, 5, 'en', 'SSD'),
(6, 6, 'en', 'HDD'),
(7, 7, 'en', 'RAM'),
(8, 8, 'en', 'Processor'),
(9, 9, 'en', 'Processor Brand'),
(12, 12, 'en', 'Resolution');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` int(10) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `position` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_values`
--

INSERT INTO `attribute_values` (`id`, `attribute_id`, `position`, `created_at`, `updated_at`) VALUES
(1, 1, 0, '2023-08-24 07:24:10', '2023-08-24 07:24:10'),
(2, 1, 1, '2023-08-24 07:24:10', '2023-08-24 07:24:10'),
(3, 1, 2, '2023-08-24 07:24:10', '2023-08-24 07:24:10'),
(4, 1, 3, '2023-08-24 07:24:10', '2023-08-24 07:24:10'),
(5, 1, 4, '2023-08-24 07:24:10', '2023-08-24 07:24:10'),
(6, 1, 5, '2023-08-24 07:24:10', '2023-08-24 07:24:10'),
(7, 1, 6, '2023-08-24 07:24:10', '2023-08-24 07:24:10'),
(8, 1, 7, '2023-08-24 07:24:10', '2023-08-24 07:24:10'),
(9, 1, 8, '2023-08-24 07:24:10', '2023-08-24 07:24:10'),
(10, 1, 9, '2023-08-24 07:24:11', '2023-08-24 07:24:11'),
(11, 1, 10, '2023-08-24 07:24:11', '2023-08-24 07:24:11'),
(12, 2, 0, '2023-08-24 07:35:07', '2023-08-24 07:35:07'),
(13, 2, 1, '2023-08-24 07:35:07', '2023-08-24 07:35:07'),
(14, 2, 2, '2023-08-24 07:35:07', '2023-08-24 07:35:07'),
(15, 2, 3, '2023-08-24 07:35:07', '2023-08-24 07:35:07'),
(16, 3, 0, '2023-08-24 07:36:45', '2023-08-24 07:36:45'),
(17, 3, 1, '2023-08-24 07:36:46', '2023-08-24 07:36:46'),
(18, 3, 2, '2023-08-24 07:36:46', '2023-08-24 07:36:46'),
(19, 3, 3, '2023-08-24 07:36:46', '2023-08-24 07:36:46'),
(20, 3, 4, '2023-08-24 07:36:46', '2023-08-24 07:36:46'),
(21, 3, 5, '2023-08-24 07:36:46', '2023-08-24 07:36:46'),
(22, 3, 6, '2023-08-24 07:36:46', '2023-08-24 07:36:46'),
(23, 3, 7, '2023-08-24 07:36:46', '2023-08-24 07:36:46'),
(24, 4, 0, '2023-08-24 07:37:06', '2023-08-24 07:37:06'),
(25, 4, 1, '2023-08-24 07:37:06', '2023-08-24 07:37:06'),
(26, 4, 2, '2023-08-24 07:37:06', '2023-08-24 07:37:06'),
(27, 5, 0, '2023-08-24 07:38:05', '2023-08-24 07:38:05'),
(28, 5, 1, '2023-08-24 07:38:05', '2023-08-24 07:38:05'),
(29, 5, 2, '2023-08-24 07:38:05', '2023-08-24 07:38:05'),
(30, 5, 3, '2023-08-24 07:38:05', '2023-08-24 07:38:05'),
(31, 5, 4, '2023-08-24 07:38:05', '2023-08-24 07:38:05'),
(32, 6, 0, '2023-08-24 07:38:34', '2023-08-24 07:38:34'),
(33, 6, 1, '2023-08-24 07:38:34', '2023-08-24 07:38:34'),
(34, 6, 2, '2023-08-24 07:38:34', '2023-08-24 07:38:34'),
(35, 6, 3, '2023-08-24 07:38:35', '2023-08-24 07:38:35'),
(36, 7, 0, '2023-08-24 07:39:25', '2023-08-24 07:39:25'),
(37, 7, 1, '2023-08-24 07:39:25', '2023-08-24 07:39:25'),
(38, 7, 2, '2023-08-24 07:39:25', '2023-08-24 07:39:25'),
(39, 7, 3, '2023-08-24 07:39:25', '2023-08-24 07:39:25'),
(40, 7, 4, '2023-08-24 07:39:25', '2023-08-24 07:39:25'),
(41, 7, 5, '2023-08-24 07:39:25', '2023-08-24 07:39:25'),
(42, 8, 0, '2023-08-24 07:39:56', '2023-08-24 07:39:56'),
(43, 8, 1, '2023-08-24 07:39:56', '2023-08-24 07:39:56'),
(44, 8, 2, '2023-08-24 07:39:56', '2023-08-24 07:39:56'),
(45, 8, 3, '2023-08-24 07:39:57', '2023-08-24 07:39:57'),
(46, 8, 4, '2023-08-24 07:39:57', '2023-08-24 07:39:57'),
(47, 9, 0, '2023-08-24 07:40:39', '2023-08-24 07:40:39'),
(48, 9, 1, '2023-08-24 07:40:39', '2023-08-24 07:40:39'),
(49, 9, 2, '2023-08-24 07:40:39', '2023-08-24 07:40:39'),
(50, 9, 3, '2023-08-24 07:40:39', '2023-08-24 07:40:39'),
(51, 9, 4, '2023-08-24 07:40:39', '2023-08-24 07:40:39'),
(52, 9, 5, '2023-08-24 07:40:39', '2023-08-24 07:40:39'),
(64, 1, 11, '2023-08-24 08:45:36', '2023-08-24 08:45:36'),
(65, 3, 8, '2023-08-24 08:48:27', '2023-08-24 08:48:27'),
(66, 9, 6, '2023-08-24 08:51:51', '2023-08-24 08:51:51'),
(67, 8, 5, '2023-08-24 08:52:44', '2023-08-24 08:52:44'),
(68, 12, 0, '2023-08-24 09:02:01', '2023-08-24 09:02:01'),
(69, 12, 1, '2023-08-24 09:02:01', '2023-08-24 09:02:01'),
(70, 12, 2, '2023-08-24 09:02:01', '2023-08-24 09:02:01'),
(71, 12, 3, '2023-08-24 09:02:01', '2023-08-24 09:02:01'),
(72, 12, 4, '2023-08-24 09:02:01', '2023-08-24 09:02:01'),
(73, 12, 5, '2023-08-24 09:02:01', '2023-08-24 09:02:01'),
(74, 12, 6, '2023-08-24 09:02:01', '2023-08-24 09:02:01'),
(75, 2, 4, '2023-08-24 09:03:54', '2023-08-24 09:03:54'),
(76, 2, 5, '2023-08-24 09:03:54', '2023-08-24 09:03:54'),
(77, 2, 6, '2023-08-24 09:03:54', '2023-08-24 09:03:54'),
(78, 2, 7, '2023-08-24 09:03:54', '2023-08-24 09:03:54'),
(79, 8, 6, '2023-08-24 09:13:20', '2023-08-24 09:13:20'),
(80, 8, 7, '2023-08-24 09:13:20', '2023-08-24 09:13:20'),
(81, 8, 8, '2023-08-24 09:13:20', '2023-08-24 09:13:20'),
(82, 8, 9, '2023-08-24 09:14:42', '2023-08-24 09:14:42'),
(83, 1, 12, '2023-08-24 09:19:19', '2023-08-24 09:19:19'),
(84, 8, 10, '2023-08-24 09:47:35', '2023-08-24 09:47:35'),
(85, 8, 11, '2023-08-24 10:06:30', '2023-08-24 10:06:30'),
(86, 8, 12, '2023-08-24 10:20:45', '2023-08-24 10:20:45'),
(87, 8, 13, '2023-08-24 10:24:54', '2023-08-24 10:24:54'),
(88, 8, 14, '2023-08-24 10:30:02', '2023-08-24 10:30:02'),
(89, 8, 15, '2023-08-24 10:34:10', '2023-08-24 10:34:10'),
(90, 8, 16, '2023-08-24 10:41:09', '2023-08-24 10:41:09'),
(91, 8, 17, '2023-08-24 10:45:27', '2023-08-24 10:45:27'),
(92, 8, 18, '2023-08-26 06:41:20', '2023-08-26 06:41:20'),
(93, 8, 19, '2023-08-26 06:41:20', '2023-08-26 06:41:20'),
(94, 8, 20, '2023-08-26 06:41:21', '2023-08-26 06:41:21'),
(95, 8, 21, '2023-08-26 06:41:21', '2023-08-26 06:41:21'),
(96, 8, 22, '2023-08-26 06:41:21', '2023-08-26 06:41:21'),
(97, 8, 23, '2023-08-26 06:41:22', '2023-08-26 06:41:22'),
(98, 8, 24, '2023-08-26 06:41:22', '2023-08-26 06:41:22'),
(99, 8, 25, '2023-08-26 06:41:22', '2023-08-26 06:41:22');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_value_translations`
--

CREATE TABLE `attribute_value_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `attribute_value_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_value_translations`
--

INSERT INTO `attribute_value_translations` (`id`, `attribute_value_id`, `locale`, `value`) VALUES
(1, 1, 'en', 'HP'),
(2, 2, 'en', 'Laptop Brand'),
(3, 3, 'en', 'MSI'),
(4, 4, 'en', 'LG'),
(5, 5, 'en', 'ASUS'),
(6, 6, 'en', 'ACER'),
(7, 7, 'en', 'LENOVO'),
(8, 8, 'en', 'RAZER'),
(9, 9, 'en', 'MICROSOFT'),
(10, 10, 'en', 'DELL'),
(11, 11, 'en', 'HUAWEI'),
(12, 12, 'en', 'Black'),
(13, 13, 'en', 'White'),
(14, 14, 'en', 'Sliver'),
(15, 15, 'en', 'Gold'),
(16, 16, 'en', '6.3-inch AMOLED'),
(17, 17, 'en', '4.7-inch screen IPS'),
(18, 18, 'en', '6.1-inche IPS LCD'),
(19, 19, 'en', '13-inch Retina'),
(20, 20, 'en', '16-inch Retina'),
(21, 21, 'en', '17.3-inch 4K'),
(22, 22, 'en', '15.6 inch FHD LED'),
(23, 23, 'en', '65 inch FHD'),
(24, 24, 'en', 'Dual Core'),
(25, 25, 'en', 'Quad Core'),
(26, 26, 'en', 'Octa Core'),
(27, 27, 'en', '128GB'),
(28, 28, 'en', '256GB'),
(29, 29, 'en', '512GB'),
(30, 30, 'en', '1TB'),
(31, 31, 'en', '2TB'),
(32, 32, 'en', '500GB'),
(33, 33, 'en', '1TB'),
(34, 34, 'en', '2TB'),
(35, 35, 'en', '4TB'),
(36, 36, 'en', '2GB'),
(37, 37, 'en', '4GB'),
(38, 38, 'en', '8GB'),
(39, 39, 'en', '6GB'),
(40, 40, 'en', '12GB'),
(41, 41, 'en', '16GB'),
(42, 42, 'en', '10th Gen. Intel Core i7'),
(43, 43, 'en', '10th Gen. Intel Core i5'),
(44, 44, 'en', 'Kirin 990 5G (7 nm+)'),
(45, 45, 'en', 'Apple A13 Bionic (7 nm+)'),
(46, 46, 'en', 'Qualcomm SM8250 Snapdragon 865 (7 nm+)'),
(47, 47, 'en', 'INTEL'),
(48, 48, 'en', 'AMD'),
(49, 49, 'en', 'SNAPDRAGON'),
(50, 50, 'en', 'MEDIATEK'),
(51, 51, 'en', 'A11 BIONIC'),
(52, 52, 'en', 'A10 FUSION'),
(64, 64, 'en', 'WALTON'),
(65, 65, 'en', '14 inch FHD'),
(66, 66, 'en', 'Celeron N4020'),
(67, 67, 'en', 'Celeron N4020'),
(68, 68, 'en', '1280 × 800  (HD, WXGA), 16:10'),
(69, 69, 'en', '1366×768 (HD), 16:9'),
(70, 70, 'en', '1600×900 (HD+), 16:9'),
(71, 71, 'en', '1920×1080 (Full HD, FHD, 1080p), 16:9'),
(72, 72, 'en', '2256×1504, 3:2'),
(73, 73, 'en', '2736×1824, 3:2'),
(74, 74, 'en', '2560×1440 (WQHD, QHD), 16:9'),
(75, 75, 'en', 'Space Grey'),
(76, 76, 'en', 'Brown'),
(77, 77, 'en', 'Olive'),
(78, 78, 'en', 'Blue'),
(79, 79, 'en', '12th Gen'),
(80, 80, 'en', '13th Gen'),
(81, 81, 'en', '9th Gen'),
(82, 82, 'en', 'core i5 12 gen'),
(83, 83, 'en', 'APPLE'),
(84, 84, 'en', 'Celeron N4500'),
(85, 85, 'en', 'Core i3 11th Gen'),
(86, 86, 'en', 'Celeron N4120'),
(87, 87, 'en', 'Ryzen 5 6600H'),
(88, 88, 'en', 'Ryzen 5 5625U'),
(89, 89, 'en', 'Core i7-11800H'),
(90, 90, 'en', 'Pentium Silver N5030'),
(91, 91, 'en', 'Ryzen 5 7520U'),
(92, 92, 'en', 'Intel Core i3'),
(93, 93, 'en', 'Intel Core i5'),
(94, 94, 'en', 'Intel Core i7'),
(95, 95, 'en', 'Intel Core i9'),
(96, 96, 'en', 'AMD Ryzen 3'),
(97, 97, 'en', 'AMD Ryzen 5'),
(98, 98, 'en', 'AMD Ryzen 7'),
(99, 99, 'en', 'AMD Ryzen 9');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `slug`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'msi', 1, '2023-08-24 07:11:20', '2023-08-24 07:11:20'),
(2, 'nokia', 1, '2023-08-24 08:53:10', '2023-08-24 08:53:10'),
(3, 'sony', 1, '2023-08-24 08:53:28', '2023-08-24 08:53:28'),
(7, 'lg', 1, '2023-08-24 08:54:17', '2023-08-24 08:54:17'),
(9, 'lenovo', 1, '2023-08-24 08:55:25', '2023-08-24 08:55:25'),
(10, 'microsoft', 1, '2023-08-24 08:56:01', '2023-08-24 08:56:01'),
(11, 'asus', 1, '2023-08-24 08:56:10', '2023-08-24 08:56:10'),
(12, 'acer', 1, '2023-08-24 08:56:18', '2023-08-24 08:56:18'),
(13, 'dell', 1, '2023-08-24 08:56:27', '2023-08-24 08:56:27'),
(14, 'hp', 1, '2023-08-24 08:56:43', '2023-08-24 08:56:43'),
(15, 'oneplus', 1, '2023-08-24 08:56:50', '2023-08-24 08:56:50'),
(16, 'huawei', 1, '2023-08-24 08:56:58', '2023-08-24 08:56:58'),
(17, 'samsung', 1, '2023-08-24 08:57:06', '2023-08-24 08:57:06'),
(18, 'apple', 1, '2023-08-24 08:57:12', '2023-08-24 08:57:12'),
(19, 'walton', 1, '2023-08-24 10:38:03', '2023-08-24 10:38:03'),
(20, 'amd', 1, '2023-08-26 06:34:42', '2023-08-26 06:34:42'),
(21, 'google-pixel', 1, '2023-08-26 06:58:25', '2023-08-26 06:58:25'),
(23, 'oppo', 1, '2023-08-26 07:17:17', '2023-08-26 07:17:17'),
(24, 'vivo', 1, '2023-08-26 07:30:52', '2023-08-26 07:31:00'),
(25, 'realme', 1, '2023-08-26 07:40:16', '2023-08-26 07:40:16');

-- --------------------------------------------------------

--
-- Table structure for table `brand_translations`
--

CREATE TABLE `brand_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `brand_id` int(11) NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brand_translations`
--

INSERT INTO `brand_translations` (`id`, `brand_id`, `locale`, `name`) VALUES
(1, 1, 'en', 'MSI'),
(2, 2, 'en', 'NOKIA'),
(3, 3, 'en', 'SONY'),
(4, 4, 'en', 'NIKE'),
(5, 5, 'en', 'Adidas'),
(6, 6, 'en', 'Beats'),
(7, 7, 'en', 'LG'),
(8, 8, 'en', 'Reebok'),
(9, 9, 'en', 'Lenovo'),
(10, 10, 'en', 'Microsoft'),
(11, 11, 'en', 'ASUS'),
(12, 12, 'en', 'Acer'),
(13, 13, 'en', 'Dell'),
(14, 14, 'en', 'HP'),
(15, 15, 'en', 'OnePlus'),
(16, 16, 'en', 'Huawei'),
(17, 17, 'en', 'Samsung'),
(18, 18, 'en', 'Apple'),
(19, 19, 'en', 'WALTON'),
(20, 20, 'en', 'AMD'),
(21, 21, 'en', 'Google Pixel'),
(22, 22, 'en', 'intel'),
(23, 23, 'en', 'OPPO'),
(24, 24, 'en', 'Vivo'),
(25, 25, 'en', 'Realme');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(10) UNSIGNED DEFAULT NULL,
  `is_searchable` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `slug`, `position`, `is_searchable`, `is_active`, `created_at`, `updated_at`) VALUES
(1, NULL, 'laptop', NULL, 1, 1, '2023-08-24 07:11:59', '2023-08-24 07:11:59'),
(2, NULL, 'hot-brands', NULL, 0, 1, '2023-08-24 07:22:46', '2023-08-24 07:22:46'),
(3, NULL, 'all-laptops', NULL, 0, 1, '2023-08-24 07:22:59', '2023-08-24 07:22:59'),
(4, NULL, 'macbook', NULL, 0, 1, '2023-08-24 07:23:11', '2023-08-24 07:23:11'),
(5, NULL, 'desktop', NULL, 1, 1, '2023-08-26 04:57:03', '2023-08-26 04:57:03'),
(6, 5, 'desktop-offer', NULL, 0, 1, '2023-08-26 04:58:13', '2023-08-26 04:58:33'),
(7, 5, 'star-pc', NULL, 0, 1, '2023-08-26 04:58:26', '2023-08-26 04:58:26'),
(8, 5, 'gaming-pc', NULL, 0, 1, '2023-08-26 04:58:41', '2023-08-26 04:58:41'),
(9, 5, 'brand-pc', NULL, 0, 1, '2023-08-26 04:59:08', '2023-08-26 04:59:08'),
(10, 5, 'apple-mac-mini', NULL, 0, 1, '2023-08-26 04:59:28', '2023-08-26 04:59:28'),
(11, 5, 'apple-mac-pro', NULL, 0, 1, '2023-08-26 04:59:40', '2023-08-26 04:59:40'),
(12, 5, 'show-all-desktop', NULL, 0, 1, '2023-08-26 04:59:53', '2023-08-26 04:59:53'),
(13, 1, 'all-laptop', NULL, 0, 1, '2023-08-26 05:01:28', '2023-08-26 05:01:28'),
(14, 1, 'gaming-laptop', NULL, 0, 1, '2023-08-26 05:01:41', '2023-08-26 05:01:41'),
(15, 1, 'premium-ultrabook', NULL, 0, 1, '2023-08-26 05:01:51', '2023-08-26 05:01:51'),
(16, 1, 'laptop-bag', NULL, 0, 1, '2023-08-26 05:02:00', '2023-08-26 05:02:00'),
(17, 1, 'laptop-accessories', NULL, 0, 1, '2023-08-26 05:02:09', '2023-08-26 05:02:09'),
(18, 13, 'asus', NULL, 0, 1, '2023-08-26 05:02:51', '2023-08-26 05:02:51'),
(19, 13, 'acer', NULL, 0, 1, '2023-08-26 05:03:04', '2023-08-26 05:03:04'),
(20, 13, 'hp', NULL, 0, 1, '2023-08-26 05:03:13', '2023-08-26 05:03:13'),
(21, 13, 'lenovo', NULL, 0, 1, '2023-08-26 05:03:23', '2023-08-26 05:03:23'),
(22, 13, 'gigabyte', NULL, 0, 1, '2023-08-26 05:03:31', '2023-08-26 05:03:31'),
(23, 13, 'dell', NULL, 0, 1, '2023-08-26 05:03:39', '2023-08-26 05:03:39'),
(24, 13, 'samsung', NULL, 0, 1, '2023-08-26 05:03:54', '2023-08-26 05:03:54'),
(25, 13, 'xiaomi', NULL, 0, 1, '2023-08-26 05:04:03', '2023-08-26 05:04:03'),
(26, 13, 'toshiba', NULL, 0, 1, '2023-08-26 05:04:12', '2023-08-26 05:04:12'),
(27, 13, 'walton', NULL, 0, 1, '2023-08-26 05:04:23', '2023-08-26 05:04:23'),
(28, 13, 'razer', NULL, 0, 1, '2023-08-26 05:04:31', '2023-08-26 05:04:31'),
(29, NULL, 'mobiles', NULL, 1, 1, '2023-08-26 05:07:03', '2023-08-26 05:07:03'),
(30, 29, 'smartphones', NULL, 0, 1, '2023-08-26 05:07:14', '2023-08-26 05:07:14'),
(31, 29, 'android', NULL, 0, 1, '2023-08-26 05:07:25', '2023-08-26 05:07:25'),
(32, 29, 'iphone', NULL, 0, 1, '2023-08-26 05:07:40', '2023-08-26 05:07:40'),
(33, 29, 'featured', NULL, 0, 1, '2023-08-26 05:07:49', '2023-08-26 05:07:49'),
(34, 29, 'refurbished', NULL, 0, 1, '2023-08-26 05:07:58', '2023-08-26 05:07:58'),
(35, 29, 'brands', NULL, 0, 1, '2023-08-26 05:08:14', '2023-08-26 05:08:14'),
(36, NULL, 'mobile-accessories', NULL, 1, 1, '2023-08-26 05:10:15', '2023-08-26 05:10:15'),
(37, 36, 'cases-covers', NULL, 0, 1, '2023-08-26 05:10:31', '2023-08-26 05:10:31'),
(38, 36, 'cables', NULL, 0, 1, '2023-08-26 05:10:43', '2023-08-26 05:10:43'),
(39, 36, 'chargers', NULL, 0, 1, '2023-08-26 05:10:53', '2023-08-26 05:10:53'),
(40, 36, 'power-bank', NULL, 0, 1, '2023-08-26 05:11:03', '2023-08-26 05:11:03'),
(41, 36, 'headphones', NULL, 0, 1, '2023-08-26 05:11:12', '2023-08-26 05:11:12'),
(42, 36, 'screen-protectors', NULL, 0, 1, '2023-08-26 05:11:30', '2023-08-26 05:11:30'),
(43, NULL, 'computer-accessories', NULL, 0, 1, '2023-08-26 05:12:01', '2023-08-26 05:12:01'),
(44, 43, 'monitors', NULL, 0, 1, '2023-08-26 05:12:15', '2023-08-26 05:12:15'),
(45, 43, 'keyboard-mouse', NULL, 0, 1, '2023-08-26 05:12:27', '2023-08-26 05:12:27'),
(46, 43, 'pendrive', NULL, 0, 1, '2023-08-26 05:12:37', '2023-08-26 05:12:37'),
(47, 36, 'speaker', NULL, 0, 1, '2023-08-26 05:12:55', '2023-08-26 05:12:55'),
(48, 43, 'speaker-EGTpXxlN', NULL, 0, 1, '2023-08-26 05:13:35', '2023-08-26 05:13:35'),
(49, NULL, 'camera', NULL, 1, 1, '2023-08-26 05:16:33', '2023-08-26 05:16:33'),
(50, 49, 'action-camera', NULL, 0, 1, '2023-08-26 05:16:41', '2023-08-26 05:16:41'),
(51, 49, 'camera-lenses', NULL, 0, 1, '2023-08-26 05:16:53', '2023-08-26 05:16:53'),
(52, 49, 'digital-camera', NULL, 0, 1, '2023-08-26 05:17:02', '2023-08-26 05:17:02'),
(53, 49, 'dslr', NULL, 0, 1, '2023-08-26 05:17:11', '2023-08-26 05:17:17'),
(54, 49, 'handycam', NULL, 0, 1, '2023-08-26 05:17:28', '2023-08-26 05:17:28'),
(55, 49, 'mirrorless-camera', NULL, 0, 1, '2023-08-26 05:17:44', '2023-08-26 05:17:44'),
(56, 49, 'camera-flash', NULL, 0, 1, '2023-08-26 05:18:04', '2023-08-26 05:18:04'),
(57, 49, 'camera-accessories', NULL, 0, 1, '2023-08-26 05:18:17', '2023-08-26 05:18:17'),
(58, 43, 'camera-tripod', NULL, 0, 1, '2023-08-26 05:18:25', '2023-08-26 05:18:25'),
(59, NULL, 'monitors-4QcekmQe', NULL, 1, 1, '2023-08-26 05:47:41', '2023-08-26 05:47:41'),
(60, 59, 'msi', NULL, 0, 1, '2023-08-26 05:48:08', '2023-08-26 05:48:08'),
(61, 59, 'acer-LHevmiIF', NULL, 0, 1, '2023-08-26 05:48:18', '2023-08-26 05:48:18'),
(62, 59, 'benq', NULL, 0, 1, '2023-08-26 05:48:36', '2023-08-26 05:48:36'),
(63, 59, 'lg', NULL, 0, 1, '2023-08-26 05:48:47', '2023-08-26 05:48:47'),
(64, 59, 'lenovo-8kZw55Gy', NULL, 0, 1, '2023-08-26 05:48:55', '2023-08-26 05:48:55'),
(65, 59, 'hp-pKEV45Na', NULL, 0, 1, '2023-08-26 05:49:04', '2023-08-26 05:49:04'),
(66, 59, 'dell-M2PYbZnl', NULL, 0, 1, '2023-08-26 05:49:13', '2023-08-26 05:49:13'),
(67, 59, 'samsung-T69E5Wfb', NULL, 0, 1, '2023-08-26 05:49:22', '2023-08-26 05:49:22'),
(68, 59, 'gigabyte-Rq4fy3qC', NULL, 0, 1, '2023-08-26 05:49:31', '2023-08-26 05:49:31'),
(69, 59, 'asus-nJvbVRxv', NULL, 0, 1, '2023-08-26 05:49:39', '2023-08-26 05:49:39'),
(70, 59, 'viewsonic', NULL, 0, 1, '2023-08-26 05:49:56', '2023-08-26 05:49:56'),
(71, 59, 'huawei', NULL, 0, 1, '2023-08-26 05:50:04', '2023-08-26 05:50:04'),
(72, 59, 'xiaomi-QQqUnxtC', NULL, 0, 1, '2023-08-26 05:50:12', '2023-08-26 05:50:12'),
(73, 59, 'aoc', NULL, 0, 1, '2023-08-26 05:50:20', '2023-08-26 05:50:20'),
(74, 59, 'philips', NULL, 0, 1, '2023-08-26 05:50:28', '2023-08-26 05:50:28'),
(75, 59, 'walton-YPEukhgK', NULL, 0, 1, '2023-08-26 05:50:37', '2023-08-26 05:50:37'),
(76, NULL, 'networking', NULL, 0, 1, '2023-08-26 05:59:00', '2023-08-26 05:59:00'),
(77, 76, 'router', NULL, 0, 1, '2023-08-26 05:59:25', '2023-08-26 05:59:25'),
(78, 76, 'pocket-router', NULL, 0, 1, '2023-08-26 05:59:38', '2023-08-26 05:59:38'),
(79, 76, 'lan-card', NULL, 0, 1, '2023-08-26 05:59:52', '2023-08-26 05:59:52'),
(80, 76, 'networking-cable', NULL, 0, 1, '2023-08-26 06:00:06', '2023-08-26 06:00:06'),
(81, 76, 'patch-cord', NULL, 0, 1, '2023-08-26 06:00:14', '2023-08-26 06:00:14'),
(82, 76, 'connector', NULL, 0, 1, '2023-08-26 06:00:26', '2023-08-26 06:00:26'),
(83, 76, 'splicer-machine', NULL, 0, 1, '2023-08-26 06:00:35', '2023-08-26 06:00:35'),
(84, 76, 'crimping-tool', NULL, 0, 1, '2023-08-26 06:00:49', '2023-08-26 06:00:49'),
(85, 76, 'faceplate', NULL, 0, 1, '2023-08-26 06:01:01', '2023-08-26 06:01:01'),
(86, 76, 'patch-panel', NULL, 0, 1, '2023-08-26 06:01:10', '2023-08-26 06:01:10'),
(87, 76, 'media-converter', NULL, 0, 1, '2023-08-26 06:01:19', '2023-08-26 06:01:19');

-- --------------------------------------------------------

--
-- Table structure for table `category_translations`
--

CREATE TABLE `category_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_translations`
--

INSERT INTO `category_translations` (`id`, `category_id`, `locale`, `name`) VALUES
(1, 1, 'en', 'Laptop'),
(2, 2, 'en', 'Hot Brands'),
(3, 3, 'en', 'All Laptops'),
(4, 4, 'en', 'Macbook'),
(5, 5, 'en', 'Desktop'),
(6, 6, 'en', 'Desktop Offer'),
(7, 7, 'en', 'Star PC'),
(8, 8, 'en', 'Gaming PC'),
(9, 9, 'en', 'Brand PC'),
(10, 10, 'en', 'Apple Mac Mini'),
(11, 11, 'en', 'Apple Mac Pro'),
(12, 12, 'en', 'Show All Desktop'),
(13, 13, 'en', 'All Laptop'),
(14, 14, 'en', 'Gaming Laptop'),
(15, 15, 'en', 'Premium Ultrabook'),
(16, 16, 'en', 'Laptop Bag'),
(17, 17, 'en', 'Laptop Accessories'),
(18, 18, 'en', 'Asus'),
(19, 19, 'en', 'Acer'),
(20, 20, 'en', 'HP'),
(21, 21, 'en', 'Lenovo'),
(22, 22, 'en', 'Gigabyte'),
(23, 23, 'en', 'Dell'),
(24, 24, 'en', 'Samsung'),
(25, 25, 'en', 'Xiaomi'),
(26, 26, 'en', 'Toshiba'),
(27, 27, 'en', 'Walton'),
(28, 28, 'en', 'Razer'),
(29, 29, 'en', 'Mobiles'),
(30, 30, 'en', 'Smartphones'),
(31, 31, 'en', 'Android'),
(32, 32, 'en', 'iPhone'),
(33, 33, 'en', 'Featured'),
(34, 34, 'en', 'Refurbished'),
(35, 35, 'en', 'Brands'),
(36, 36, 'en', 'Mobile Accessories'),
(37, 37, 'en', 'Cases & Covers'),
(38, 38, 'en', 'Cables'),
(39, 39, 'en', 'Chargers'),
(40, 40, 'en', 'Power Bank'),
(41, 41, 'en', 'Headphones'),
(42, 42, 'en', 'Screen Protectors'),
(43, 43, 'en', 'Computer Accessories'),
(44, 44, 'en', 'Monitors'),
(45, 45, 'en', 'Keyboard & Mouse'),
(46, 46, 'en', 'Pendrive'),
(47, 47, 'en', 'Speaker'),
(48, 48, 'en', 'Speaker'),
(49, 49, 'en', 'Camera'),
(50, 50, 'en', 'Action Camera'),
(51, 51, 'en', 'Camera Lenses'),
(52, 52, 'en', 'Digital Camera'),
(53, 53, 'en', 'DSLR'),
(54, 54, 'en', 'Handycam'),
(55, 55, 'en', 'Mirrorless Camera'),
(56, 56, 'en', 'Camera Flash'),
(57, 57, 'en', 'Camera Accessories'),
(58, 58, 'en', 'Camera Tripod'),
(59, 59, 'en', 'Monitors'),
(60, 60, 'en', 'MSI'),
(61, 61, 'en', 'Acer'),
(62, 62, 'en', 'BenQ'),
(63, 63, 'en', 'LG'),
(64, 64, 'en', 'Lenovo'),
(65, 65, 'en', 'HP'),
(66, 66, 'en', 'Dell'),
(67, 67, 'en', 'Samsung'),
(68, 68, 'en', 'GIGABYTE'),
(69, 69, 'en', 'Asus'),
(70, 70, 'en', 'Viewsonic'),
(71, 71, 'en', 'HUAWEI'),
(72, 72, 'en', 'XIAOMI'),
(73, 73, 'en', 'AOC'),
(74, 74, 'en', 'PHILIPS'),
(75, 75, 'en', 'Walton'),
(76, 76, 'en', 'Networking'),
(77, 77, 'en', 'Router'),
(78, 78, 'en', 'Pocket Router'),
(79, 79, 'en', 'LAN Card'),
(80, 80, 'en', 'Networking Cable'),
(81, 81, 'en', 'Patch Cord'),
(82, 82, 'en', 'Connector'),
(83, 83, 'en', 'Splicer Machine'),
(84, 84, 'en', 'Crimping Tool'),
(85, 85, 'en', 'Faceplate'),
(86, 86, 'en', 'Patch Panel'),
(87, 87, 'en', 'Media Converter');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(18,4) UNSIGNED DEFAULT NULL,
  `is_percent` tinyint(1) NOT NULL,
  `free_shipping` tinyint(1) NOT NULL,
  `minimum_spend` decimal(18,4) UNSIGNED DEFAULT NULL,
  `maximum_spend` decimal(18,4) UNSIGNED DEFAULT NULL,
  `usage_limit_per_coupon` int(10) UNSIGNED DEFAULT NULL,
  `usage_limit_per_customer` int(10) UNSIGNED DEFAULT NULL,
  `used` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_categories`
--

CREATE TABLE `coupon_categories` (
  `coupon_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `exclude` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_products`
--

CREATE TABLE `coupon_products` (
  `coupon_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `exclude` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_translations`
--

CREATE TABLE `coupon_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `coupon_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cross_sell_products`
--

CREATE TABLE `cross_sell_products` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `cross_sell_product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currency_rates`
--

CREATE TABLE `currency_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(8,4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currency_rates`
--

INSERT INTO `currency_rates` (`id`, `currency`, `rate`, `created_at`, `updated_at`) VALUES
(1, 'USD', 1.0000, '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(2, 'BDT', 1.0000, '2023-08-24 10:46:57', '2023-08-24 10:46:57');

-- --------------------------------------------------------

--
-- Table structure for table `default_addresses`
--

CREATE TABLE `default_addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `address_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `entity_files`
--

CREATE TABLE `entity_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `file_id` int(10) UNSIGNED NOT NULL,
  `entity_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity_id` bigint(20) UNSIGNED NOT NULL,
  `zone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `entity_files`
--

INSERT INTO `entity_files` (`id`, `file_id`, `entity_type`, `entity_id`, `zone`, `created_at`, `updated_at`) VALUES
(58, 48, 'Modules\\Product\\Entities\\Product', 12, 'base_image', '2023-08-24 09:25:30', '2023-08-24 09:25:30'),
(59, 49, 'Modules\\Product\\Entities\\Product', 12, 'additional_images', '2023-08-24 09:25:30', '2023-08-24 09:25:30'),
(72, 54, 'Modules\\Product\\Entities\\Product', 17, 'base_image', '2023-08-24 09:32:39', '2023-08-24 09:32:39'),
(73, 55, 'Modules\\Product\\Entities\\Product', 17, 'additional_images', '2023-08-24 09:32:39', '2023-08-24 09:32:39'),
(74, 60, 'Modules\\Product\\Entities\\Product', 17, 'additional_images', '2023-08-24 09:32:39', '2023-08-24 09:32:39'),
(80, 61, 'Modules\\Product\\Entities\\Product', 19, 'base_image', '2023-08-24 09:36:07', '2023-08-24 09:36:07'),
(81, 65, 'Modules\\Product\\Entities\\Product', 19, 'additional_images', '2023-08-24 09:36:07', '2023-08-24 09:36:07'),
(82, 66, 'Modules\\Product\\Entities\\Product', 19, 'additional_images', '2023-08-24 09:36:07', '2023-08-24 09:36:07'),
(83, 68, 'Modules\\Product\\Entities\\Product', 20, 'base_image', '2023-08-24 09:37:00', '2023-08-24 09:37:00'),
(84, 75, 'Modules\\Product\\Entities\\Product', 20, 'additional_images', '2023-08-24 09:37:00', '2023-08-24 09:37:00'),
(85, 74, 'Modules\\Product\\Entities\\Product', 20, 'additional_images', '2023-08-24 09:37:00', '2023-08-24 09:37:00'),
(86, 73, 'Modules\\Product\\Entities\\Product', 20, 'additional_images', '2023-08-24 09:37:00', '2023-08-24 09:37:00'),
(92, 76, 'Modules\\Product\\Entities\\Product', 21, 'base_image', '2023-08-24 09:40:54', '2023-08-24 09:40:54'),
(93, 77, 'Modules\\Product\\Entities\\Product', 21, 'additional_images', '2023-08-24 09:40:55', '2023-08-24 09:40:55'),
(94, 78, 'Modules\\Product\\Entities\\Product', 21, 'additional_images', '2023-08-24 09:40:55', '2023-08-24 09:40:55'),
(95, 79, 'Modules\\Product\\Entities\\Product', 21, 'additional_images', '2023-08-24 09:40:55', '2023-08-24 09:40:55'),
(97, 81, 'Modules\\Product\\Entities\\Product', 23, 'base_image', '2023-08-24 09:46:42', '2023-08-24 09:46:42'),
(98, 83, 'Modules\\Product\\Entities\\Product', 23, 'additional_images', '2023-08-24 09:46:42', '2023-08-24 09:46:42'),
(99, 84, 'Modules\\Product\\Entities\\Product', 23, 'additional_images', '2023-08-24 09:46:42', '2023-08-24 09:46:42'),
(100, 85, 'Modules\\Product\\Entities\\Product', 23, 'additional_images', '2023-08-24 09:46:42', '2023-08-24 09:46:42'),
(103, 82, 'Modules\\Product\\Entities\\Product', 24, 'base_image', '2023-08-24 09:47:56', '2023-08-24 09:47:56'),
(104, 86, 'Modules\\Product\\Entities\\Product', 24, 'additional_images', '2023-08-24 09:47:56', '2023-08-24 09:47:56'),
(105, 87, 'Modules\\Product\\Entities\\Product', 25, 'base_image', '2023-08-24 09:51:47', '2023-08-24 09:51:47'),
(106, 90, 'Modules\\Product\\Entities\\Product', 25, 'additional_images', '2023-08-24 09:51:47', '2023-08-24 09:51:47'),
(107, 89, 'Modules\\Product\\Entities\\Product', 25, 'additional_images', '2023-08-24 09:51:47', '2023-08-24 09:51:47'),
(108, 88, 'Modules\\Product\\Entities\\Product', 25, 'additional_images', '2023-08-24 09:51:47', '2023-08-24 09:51:47'),
(109, 80, 'Modules\\Product\\Entities\\Product', 22, 'base_image', '2023-08-24 09:54:00', '2023-08-24 09:54:00'),
(110, 91, 'Modules\\Product\\Entities\\Product', 26, 'base_image', '2023-08-24 09:54:26', '2023-08-24 09:54:26'),
(111, 92, 'Modules\\Product\\Entities\\Product', 26, 'additional_images', '2023-08-24 09:54:26', '2023-08-24 09:54:26'),
(112, 93, 'Modules\\Product\\Entities\\Product', 26, 'additional_images', '2023-08-24 09:54:26', '2023-08-24 09:54:26'),
(113, 94, 'Modules\\Product\\Entities\\Product', 26, 'additional_images', '2023-08-24 09:54:26', '2023-08-24 09:54:26'),
(114, 67, 'Modules\\Product\\Entities\\Product', 18, 'base_image', '2023-08-24 09:54:45', '2023-08-24 09:54:45'),
(115, 70, 'Modules\\Product\\Entities\\Product', 18, 'additional_images', '2023-08-24 09:54:45', '2023-08-24 09:54:45'),
(116, 71, 'Modules\\Product\\Entities\\Product', 18, 'additional_images', '2023-08-24 09:54:45', '2023-08-24 09:54:45'),
(117, 72, 'Modules\\Product\\Entities\\Product', 18, 'additional_images', '2023-08-24 09:54:45', '2023-08-24 09:54:45'),
(118, 73, 'Modules\\Product\\Entities\\Product', 18, 'additional_images', '2023-08-24 09:54:45', '2023-08-24 09:54:45'),
(119, 56, 'Modules\\Product\\Entities\\Product', 16, 'base_image', '2023-08-24 09:55:24', '2023-08-24 09:55:24'),
(120, 57, 'Modules\\Product\\Entities\\Product', 16, 'additional_images', '2023-08-24 09:55:25', '2023-08-24 09:55:25'),
(121, 58, 'Modules\\Product\\Entities\\Product', 16, 'additional_images', '2023-08-24 09:55:25', '2023-08-24 09:55:25'),
(122, 59, 'Modules\\Product\\Entities\\Product', 16, 'additional_images', '2023-08-24 09:55:25', '2023-08-24 09:55:25'),
(124, 95, 'Modules\\Product\\Entities\\Product', 27, 'base_image', '2023-08-24 09:59:23', '2023-08-24 09:59:23'),
(125, 96, 'Modules\\Product\\Entities\\Product', 27, 'additional_images', '2023-08-24 09:59:23', '2023-08-24 09:59:23'),
(126, 97, 'Modules\\Product\\Entities\\Product', 27, 'additional_images', '2023-08-24 09:59:23', '2023-08-24 09:59:23'),
(127, 98, 'Modules\\Product\\Entities\\Product', 27, 'additional_images', '2023-08-24 09:59:23', '2023-08-24 09:59:23'),
(128, 99, 'Modules\\Product\\Entities\\Product', 28, 'base_image', '2023-08-24 10:01:44', '2023-08-24 10:01:44'),
(129, 100, 'Modules\\Product\\Entities\\Product', 28, 'additional_images', '2023-08-24 10:01:44', '2023-08-24 10:01:44'),
(130, 101, 'Modules\\Product\\Entities\\Product', 28, 'additional_images', '2023-08-24 10:01:44', '2023-08-24 10:01:44'),
(131, 102, 'Modules\\Product\\Entities\\Product', 29, 'base_image', '2023-08-24 10:04:57', '2023-08-24 10:04:57'),
(132, 103, 'Modules\\Product\\Entities\\Product', 29, 'additional_images', '2023-08-24 10:04:57', '2023-08-24 10:04:57'),
(133, 104, 'Modules\\Product\\Entities\\Product', 29, 'additional_images', '2023-08-24 10:04:57', '2023-08-24 10:04:57'),
(134, 105, 'Modules\\Product\\Entities\\Product', 30, 'base_image', '2023-08-24 10:05:28', '2023-08-24 10:05:28'),
(135, 108, 'Modules\\Product\\Entities\\Product', 30, 'additional_images', '2023-08-24 10:05:28', '2023-08-24 10:05:28'),
(136, 107, 'Modules\\Product\\Entities\\Product', 30, 'additional_images', '2023-08-24 10:05:28', '2023-08-24 10:05:28'),
(137, 106, 'Modules\\Product\\Entities\\Product', 30, 'additional_images', '2023-08-24 10:05:28', '2023-08-24 10:05:28'),
(138, 110, 'Modules\\Product\\Entities\\Product', 31, 'base_image', '2023-08-24 10:10:48', '2023-08-24 10:10:48'),
(139, 113, 'Modules\\Product\\Entities\\Product', 31, 'additional_images', '2023-08-24 10:10:48', '2023-08-24 10:10:48'),
(140, 114, 'Modules\\Product\\Entities\\Product', 31, 'additional_images', '2023-08-24 10:10:48', '2023-08-24 10:10:48'),
(141, 115, 'Modules\\Product\\Entities\\Product', 31, 'additional_images', '2023-08-24 10:10:48', '2023-08-24 10:10:48'),
(144, 109, 'Modules\\Product\\Entities\\Product', 32, 'base_image', '2023-08-24 10:11:59', '2023-08-24 10:11:59'),
(145, 112, 'Modules\\Product\\Entities\\Product', 32, 'additional_images', '2023-08-24 10:11:59', '2023-08-24 10:11:59'),
(146, 120, 'Modules\\Product\\Entities\\Product', 33, 'base_image', '2023-08-24 10:16:07', '2023-08-24 10:16:07'),
(147, 123, 'Modules\\Product\\Entities\\Product', 33, 'additional_images', '2023-08-24 10:16:07', '2023-08-24 10:16:07'),
(148, 122, 'Modules\\Product\\Entities\\Product', 33, 'additional_images', '2023-08-24 10:16:07', '2023-08-24 10:16:07'),
(149, 121, 'Modules\\Product\\Entities\\Product', 33, 'additional_images', '2023-08-24 10:16:07', '2023-08-24 10:16:07'),
(150, 116, 'Modules\\Product\\Entities\\Product', 34, 'base_image', '2023-08-24 10:16:31', '2023-08-24 10:16:31'),
(151, 118, 'Modules\\Product\\Entities\\Product', 34, 'additional_images', '2023-08-24 10:16:31', '2023-08-24 10:16:31'),
(152, 119, 'Modules\\Product\\Entities\\Product', 34, 'additional_images', '2023-08-24 10:16:31', '2023-08-24 10:16:31'),
(153, 117, 'Modules\\Product\\Entities\\Product', 34, 'additional_images', '2023-08-24 10:16:31', '2023-08-24 10:16:31'),
(158, 124, 'Modules\\Product\\Entities\\Product', 35, 'base_image', '2023-08-24 10:21:53', '2023-08-24 10:21:53'),
(159, 127, 'Modules\\Product\\Entities\\Product', 35, 'additional_images', '2023-08-24 10:21:53', '2023-08-24 10:21:53'),
(160, 126, 'Modules\\Product\\Entities\\Product', 35, 'additional_images', '2023-08-24 10:21:53', '2023-08-24 10:21:53'),
(161, 125, 'Modules\\Product\\Entities\\Product', 35, 'additional_images', '2023-08-24 10:21:53', '2023-08-24 10:21:53'),
(165, 135, 'Modules\\Product\\Entities\\Product', 36, 'base_image', '2023-08-24 10:25:58', '2023-08-24 10:25:58'),
(166, 137, 'Modules\\Product\\Entities\\Product', 36, 'additional_images', '2023-08-24 10:25:59', '2023-08-24 10:25:59'),
(167, 136, 'Modules\\Product\\Entities\\Product', 36, 'additional_images', '2023-08-24 10:25:59', '2023-08-24 10:25:59'),
(168, 138, 'Modules\\Product\\Entities\\Product', 37, 'base_image', '2023-08-24 10:27:51', '2023-08-24 10:27:51'),
(169, 139, 'Modules\\Product\\Entities\\Product', 37, 'additional_images', '2023-08-24 10:27:51', '2023-08-24 10:27:51'),
(170, 140, 'Modules\\Product\\Entities\\Product', 37, 'additional_images', '2023-08-24 10:27:51', '2023-08-24 10:27:51'),
(171, 141, 'Modules\\Product\\Entities\\Product', 37, 'additional_images', '2023-08-24 10:27:51', '2023-08-24 10:27:51'),
(172, 142, 'Modules\\Product\\Entities\\Product', 37, 'additional_images', '2023-08-24 10:27:51', '2023-08-24 10:27:51'),
(177, 143, 'Modules\\Product\\Entities\\Product', 38, 'base_image', '2023-08-24 10:30:44', '2023-08-24 10:30:44'),
(178, 146, 'Modules\\Product\\Entities\\Product', 38, 'additional_images', '2023-08-24 10:30:44', '2023-08-24 10:30:44'),
(179, 145, 'Modules\\Product\\Entities\\Product', 38, 'additional_images', '2023-08-24 10:30:44', '2023-08-24 10:30:44'),
(180, 144, 'Modules\\Product\\Entities\\Product', 38, 'additional_images', '2023-08-24 10:30:44', '2023-08-24 10:30:44'),
(181, 147, 'Modules\\Product\\Entities\\Product', 39, 'base_image', '2023-08-24 10:32:53', '2023-08-24 10:32:53'),
(182, 148, 'Modules\\Product\\Entities\\Product', 39, 'additional_images', '2023-08-24 10:32:53', '2023-08-24 10:32:53'),
(183, 149, 'Modules\\Product\\Entities\\Product', 39, 'additional_images', '2023-08-24 10:32:53', '2023-08-24 10:32:53'),
(188, 150, 'Modules\\Product\\Entities\\Product', 40, 'base_image', '2023-08-24 10:35:03', '2023-08-24 10:35:03'),
(189, 153, 'Modules\\Product\\Entities\\Product', 40, 'additional_images', '2023-08-24 10:35:03', '2023-08-24 10:35:03'),
(190, 152, 'Modules\\Product\\Entities\\Product', 40, 'additional_images', '2023-08-24 10:35:03', '2023-08-24 10:35:03'),
(191, 151, 'Modules\\Product\\Entities\\Product', 40, 'additional_images', '2023-08-24 10:35:03', '2023-08-24 10:35:03'),
(192, 154, 'Modules\\Product\\Entities\\Product', 41, 'base_image', '2023-08-24 10:40:43', '2023-08-24 10:40:43'),
(193, 155, 'Modules\\Product\\Entities\\Product', 41, 'additional_images', '2023-08-24 10:40:43', '2023-08-24 10:40:43'),
(194, 156, 'Modules\\Product\\Entities\\Product', 41, 'additional_images', '2023-08-24 10:40:43', '2023-08-24 10:40:43'),
(195, 157, 'Modules\\Product\\Entities\\Product', 41, 'additional_images', '2023-08-24 10:40:43', '2023-08-24 10:40:43'),
(196, 158, 'Modules\\Product\\Entities\\Product', 41, 'additional_images', '2023-08-24 10:40:43', '2023-08-24 10:40:43'),
(201, 159, 'Modules\\Product\\Entities\\Product', 42, 'base_image', '2023-08-24 10:42:07', '2023-08-24 10:42:07'),
(202, 160, 'Modules\\Product\\Entities\\Product', 42, 'additional_images', '2023-08-24 10:42:08', '2023-08-24 10:42:08'),
(203, 161, 'Modules\\Product\\Entities\\Product', 42, 'additional_images', '2023-08-24 10:42:08', '2023-08-24 10:42:08'),
(204, 162, 'Modules\\Product\\Entities\\Product', 42, 'additional_images', '2023-08-24 10:42:08', '2023-08-24 10:42:08'),
(209, 163, 'Modules\\Product\\Entities\\Product', 43, 'base_image', '2023-08-24 10:46:10', '2023-08-24 10:46:10'),
(210, 166, 'Modules\\Product\\Entities\\Product', 43, 'additional_images', '2023-08-24 10:46:10', '2023-08-24 10:46:10'),
(211, 165, 'Modules\\Product\\Entities\\Product', 43, 'additional_images', '2023-08-24 10:46:10', '2023-08-24 10:46:10'),
(212, 164, 'Modules\\Product\\Entities\\Product', 43, 'additional_images', '2023-08-24 10:46:10', '2023-08-24 10:46:10'),
(213, 167, 'Modules\\Product\\Entities\\Product', 44, 'base_image', '2023-08-24 10:48:45', '2023-08-24 10:48:45'),
(214, 168, 'Modules\\Product\\Entities\\Product', 44, 'additional_images', '2023-08-24 10:48:46', '2023-08-24 10:48:46'),
(215, 169, 'Modules\\Product\\Entities\\Product', 44, 'additional_images', '2023-08-24 10:48:46', '2023-08-24 10:48:46'),
(216, 170, 'Modules\\Product\\Entities\\Product', 44, 'additional_images', '2023-08-24 10:48:46', '2023-08-24 10:48:46'),
(218, 172, 'Modules\\Menu\\Entities\\MenuItem', 2, 'background_image', '2023-08-26 05:35:29', '2023-08-26 05:35:29'),
(222, 176, 'Modules\\Product\\Entities\\Product', 45, 'base_image', '2023-08-26 06:43:06', '2023-08-26 06:43:06'),
(223, 177, 'Modules\\Product\\Entities\\Product', 46, 'base_image', '2023-08-26 06:47:08', '2023-08-26 06:47:08'),
(228, 178, 'Modules\\Product\\Entities\\Product', 47, 'base_image', '2023-08-26 06:59:00', '2023-08-26 06:59:00'),
(229, 179, 'Modules\\Product\\Entities\\Product', 48, 'base_image', '2023-08-26 06:59:48', '2023-08-26 06:59:48'),
(230, 180, 'Modules\\Product\\Entities\\Product', 48, 'additional_images', '2023-08-26 06:59:48', '2023-08-26 06:59:48'),
(231, 181, 'Modules\\Product\\Entities\\Product', 48, 'additional_images', '2023-08-26 06:59:48', '2023-08-26 06:59:48'),
(233, 182, 'Modules\\Product\\Entities\\Product', 50, 'base_image', '2023-08-26 07:04:15', '2023-08-26 07:04:15'),
(234, 187, 'Modules\\Product\\Entities\\Product', 49, 'base_image', '2023-08-26 07:05:16', '2023-08-26 07:05:16'),
(235, 183, 'Modules\\Product\\Entities\\Product', 51, 'base_image', '2023-08-26 07:06:53', '2023-08-26 07:06:53'),
(236, 184, 'Modules\\Product\\Entities\\Product', 51, 'additional_images', '2023-08-26 07:06:53', '2023-08-26 07:06:53'),
(237, 185, 'Modules\\Product\\Entities\\Product', 51, 'additional_images', '2023-08-26 07:06:53', '2023-08-26 07:06:53'),
(238, 186, 'Modules\\Product\\Entities\\Product', 51, 'additional_images', '2023-08-26 07:06:53', '2023-08-26 07:06:53'),
(239, 188, 'Modules\\Product\\Entities\\Product', 52, 'base_image', '2023-08-26 07:08:17', '2023-08-26 07:08:17'),
(240, 193, 'Modules\\Product\\Entities\\Product', 53, 'base_image', '2023-08-26 07:11:15', '2023-08-26 07:11:15'),
(241, 189, 'Modules\\Product\\Entities\\Product', 54, 'base_image', '2023-08-26 07:11:44', '2023-08-26 07:11:44'),
(242, 190, 'Modules\\Product\\Entities\\Product', 54, 'additional_images', '2023-08-26 07:11:44', '2023-08-26 07:11:44'),
(243, 191, 'Modules\\Product\\Entities\\Product', 54, 'additional_images', '2023-08-26 07:11:44', '2023-08-26 07:11:44'),
(244, 195, 'Modules\\Product\\Entities\\Product', 55, 'base_image', '2023-08-26 07:13:47', '2023-08-26 07:13:47'),
(247, 196, 'Modules\\Product\\Entities\\Product', 57, 'base_image', '2023-08-26 07:18:51', '2023-08-26 07:18:51'),
(248, 198, 'Modules\\Product\\Entities\\Product', 57, 'additional_images', '2023-08-26 07:18:51', '2023-08-26 07:18:51'),
(249, 197, 'Modules\\Product\\Entities\\Product', 56, 'base_image', '2023-08-26 07:19:16', '2023-08-26 07:19:16'),
(250, 199, 'Modules\\Product\\Entities\\Product', 58, 'base_image', '2023-08-26 07:21:40', '2023-08-26 07:21:40'),
(251, 200, 'Modules\\Product\\Entities\\Product', 59, 'base_image', '2023-08-26 07:23:17', '2023-08-26 07:23:17'),
(252, 201, 'Modules\\Product\\Entities\\Product', 59, 'additional_images', '2023-08-26 07:23:17', '2023-08-26 07:23:17'),
(253, 202, 'Modules\\Product\\Entities\\Product', 60, 'base_image', '2023-08-26 07:24:04', '2023-08-26 07:24:04'),
(254, 203, 'Modules\\Product\\Entities\\Product', 61, 'base_image', '2023-08-26 07:26:38', '2023-08-26 07:26:38'),
(255, 204, 'Modules\\Product\\Entities\\Product', 61, 'additional_images', '2023-08-26 07:26:38', '2023-08-26 07:26:38'),
(258, 205, 'Modules\\Product\\Entities\\Product', 62, 'base_image', '2023-08-26 07:32:06', '2023-08-26 07:32:06'),
(259, 206, 'Modules\\Product\\Entities\\Product', 62, 'additional_images', '2023-08-26 07:32:06', '2023-08-26 07:32:06'),
(260, 210, 'Modules\\Product\\Entities\\Product', 64, 'base_image', '2023-08-26 07:35:45', '2023-08-26 07:35:45'),
(261, 211, 'Modules\\Product\\Entities\\Product', 64, 'additional_images', '2023-08-26 07:35:45', '2023-08-26 07:35:45'),
(262, 207, 'Modules\\Product\\Entities\\Product', 63, 'base_image', '2023-08-26 07:36:00', '2023-08-26 07:36:00'),
(263, 208, 'Modules\\Product\\Entities\\Product', 63, 'additional_images', '2023-08-26 07:36:00', '2023-08-26 07:36:00'),
(264, 209, 'Modules\\Product\\Entities\\Product', 63, 'additional_images', '2023-08-26 07:36:00', '2023-08-26 07:36:00'),
(265, 212, 'Modules\\Product\\Entities\\Product', 65, 'base_image', '2023-08-26 07:38:48', '2023-08-26 07:38:48'),
(266, 213, 'Modules\\Product\\Entities\\Product', 65, 'additional_images', '2023-08-26 07:38:48', '2023-08-26 07:38:48'),
(267, 214, 'Modules\\Product\\Entities\\Product', 66, 'base_image', '2023-08-26 07:39:36', '2023-08-26 07:39:36'),
(268, 216, 'Modules\\Product\\Entities\\Product', 67, 'base_image', '2023-08-26 07:44:13', '2023-08-26 07:44:13'),
(269, 218, 'Modules\\Product\\Entities\\Product', 67, 'additional_images', '2023-08-26 07:44:13', '2023-08-26 07:44:13'),
(272, 215, 'Modules\\Product\\Entities\\Product', 68, 'base_image', '2023-08-26 07:45:39', '2023-08-26 07:45:39'),
(273, 217, 'Modules\\Product\\Entities\\Product', 68, 'additional_images', '2023-08-26 07:45:39', '2023-08-26 07:45:39'),
(274, 219, 'Modules\\Product\\Entities\\Product', 69, 'base_image', '2023-08-26 07:48:39', '2023-08-26 07:48:39'),
(275, 220, 'Modules\\Product\\Entities\\Product', 70, 'base_image', '2023-08-26 07:48:51', '2023-08-26 07:48:51'),
(276, 221, 'Modules\\Product\\Entities\\Product', 70, 'additional_images', '2023-08-26 07:48:51', '2023-08-26 07:48:51'),
(277, 223, 'Modules\\Product\\Entities\\Product', 71, 'base_image', '2023-08-26 07:52:47', '2023-08-26 07:52:47'),
(278, 224, 'Modules\\Product\\Entities\\Product', 71, 'additional_images', '2023-08-26 07:52:47', '2023-08-26 07:52:47'),
(279, 222, 'Modules\\Product\\Entities\\Product', 72, 'base_image', '2023-08-26 07:53:06', '2023-08-26 07:53:06'),
(280, 227, 'Modules\\Product\\Entities\\Product', 73, 'base_image', '2023-08-26 07:58:17', '2023-08-26 07:58:17'),
(281, 228, 'Modules\\Product\\Entities\\Product', 73, 'additional_images', '2023-08-26 07:58:17', '2023-08-26 07:58:17'),
(282, 229, 'Modules\\Product\\Entities\\Product', 74, 'base_image', '2023-08-26 08:02:11', '2023-08-26 08:02:11'),
(283, 230, 'Modules\\Product\\Entities\\Product', 75, 'base_image', '2023-08-26 08:05:24', '2023-08-26 08:05:24'),
(284, 231, 'Modules\\Product\\Entities\\Product', 75, 'additional_images', '2023-08-26 08:05:24', '2023-08-26 08:05:24'),
(285, 232, 'Modules\\Product\\Entities\\Product', 75, 'additional_images', '2023-08-26 08:05:24', '2023-08-26 08:05:24'),
(286, 233, 'Modules\\Product\\Entities\\Product', 76, 'base_image', '2023-08-26 08:07:10', '2023-08-26 08:07:10'),
(287, 234, 'Modules\\Product\\Entities\\Product', 77, 'base_image', '2023-08-26 08:09:44', '2023-08-26 08:09:44'),
(288, 235, 'Modules\\Product\\Entities\\Product', 78, 'base_image', '2023-08-26 08:10:26', '2023-08-26 08:10:26'),
(289, 236, 'Modules\\Product\\Entities\\Product', 78, 'additional_images', '2023-08-26 08:10:26', '2023-08-26 08:10:26'),
(290, 237, 'Modules\\Product\\Entities\\Product', 78, 'additional_images', '2023-08-26 08:10:26', '2023-08-26 08:10:26'),
(291, 238, 'Modules\\Product\\Entities\\Product', 78, 'additional_images', '2023-08-26 08:10:26', '2023-08-26 08:10:26'),
(293, 240, 'Modules\\Product\\Entities\\Product', 80, 'base_image', '2023-08-26 08:14:08', '2023-08-26 08:14:08'),
(294, 241, 'Modules\\Product\\Entities\\Product', 80, 'additional_images', '2023-08-26 08:14:08', '2023-08-26 08:14:08'),
(295, 239, 'Modules\\Product\\Entities\\Product', 79, 'base_image', '2023-08-26 08:14:30', '2023-08-26 08:14:30'),
(296, 242, 'Modules\\Product\\Entities\\Product', 81, 'base_image', '2023-08-26 08:17:09', '2023-08-26 08:17:09'),
(297, 243, 'Modules\\Product\\Entities\\Product', 82, 'base_image', '2023-08-26 08:17:26', '2023-08-26 08:17:26'),
(298, 244, 'Modules\\Product\\Entities\\Product', 82, 'additional_images', '2023-08-26 08:17:26', '2023-08-26 08:17:26'),
(299, 245, 'Modules\\Product\\Entities\\Product', 83, 'base_image', '2023-08-26 08:20:04', '2023-08-26 08:20:04'),
(300, 247, 'Modules\\Product\\Entities\\Product', 84, 'base_image', '2023-08-26 08:43:26', '2023-08-26 08:43:26'),
(301, 248, 'Modules\\Product\\Entities\\Product', 84, 'additional_images', '2023-08-26 08:43:26', '2023-08-26 08:43:26'),
(302, 249, 'Modules\\Product\\Entities\\Product', 84, 'additional_images', '2023-08-26 08:43:26', '2023-08-26 08:43:26'),
(303, 253, 'Modules\\Brand\\Entities\\Brand', 18, 'logo', '2023-08-26 10:06:49', '2023-08-26 10:06:49'),
(304, 254, 'Modules\\Brand\\Entities\\Brand', 17, 'logo', '2023-08-26 10:07:13', '2023-08-26 10:07:13'),
(305, 255, 'Modules\\Brand\\Entities\\Brand', 16, 'logo', '2023-08-26 10:07:40', '2023-08-26 10:07:40'),
(306, 256, 'Modules\\Brand\\Entities\\Brand', 15, 'logo', '2023-08-26 10:08:02', '2023-08-26 10:08:02'),
(307, 257, 'Modules\\Brand\\Entities\\Brand', 14, 'logo', '2023-08-26 10:08:26', '2023-08-26 10:08:26'),
(308, 258, 'Modules\\Brand\\Entities\\Brand', 13, 'logo', '2023-08-26 10:08:48', '2023-08-26 10:08:48'),
(309, 259, 'Modules\\Brand\\Entities\\Brand', 12, 'logo', '2023-08-26 10:09:22', '2023-08-26 10:09:22'),
(310, 260, 'Modules\\Brand\\Entities\\Brand', 11, 'logo', '2023-08-26 10:09:51', '2023-08-26 10:09:51'),
(311, 263, 'Modules\\Brand\\Entities\\Brand', 7, 'logo', '2023-08-26 10:11:49', '2023-08-26 10:11:49'),
(312, 265, 'Modules\\Brand\\Entities\\Brand', 9, 'logo', '2023-08-26 10:11:59', '2023-08-26 10:11:59'),
(313, 266, 'Modules\\Brand\\Entities\\Brand', 10, 'logo', '2023-08-26 10:12:07', '2023-08-26 10:12:07'),
(314, 262, 'Modules\\Brand\\Entities\\Brand', 3, 'logo', '2023-08-26 10:13:14', '2023-08-26 10:13:14'),
(315, 261, 'Modules\\Brand\\Entities\\Brand', 2, 'logo', '2023-08-26 10:13:35', '2023-08-26 10:13:35'),
(316, 264, 'Modules\\Brand\\Entities\\Brand', 1, 'logo', '2023-08-26 10:13:44', '2023-08-26 10:13:44'),
(317, 267, 'Modules\\Category\\Entities\\Category', 1, 'logo', '2023-08-26 10:17:10', '2023-08-26 10:17:10'),
(318, 268, 'Modules\\Category\\Entities\\Category', 29, 'logo', '2023-08-26 10:18:23', '2023-08-26 10:18:23'),
(320, 277, 'Modules\\Category\\Entities\\Category', 5, 'logo', '2023-08-27 04:42:11', '2023-08-27 04:42:11'),
(321, 278, 'Modules\\Category\\Entities\\Category', 36, 'logo', '2023-08-27 04:43:49', '2023-08-27 04:43:49'),
(322, 279, 'Modules\\Category\\Entities\\Category', 49, 'logo', '2023-08-27 04:44:25', '2023-08-27 04:44:25'),
(329, 5, 'Modules\\Product\\Entities\\Product', 2, 'base_image', '2023-08-27 05:04:10', '2023-08-27 05:04:10'),
(330, 5, 'Modules\\Product\\Entities\\Product', 2, 'additional_images', '2023-08-27 05:04:10', '2023-08-27 05:04:10'),
(331, 7, 'Modules\\Product\\Entities\\Product', 2, 'additional_images', '2023-08-27 05:04:10', '2023-08-27 05:04:10'),
(332, 1, 'Modules\\Product\\Entities\\Product', 1, 'base_image', '2023-08-27 05:06:47', '2023-08-27 05:06:47'),
(333, 4, 'Modules\\Product\\Entities\\Product', 1, 'additional_images', '2023-08-27 05:06:47', '2023-08-27 05:06:47'),
(334, 3, 'Modules\\Product\\Entities\\Product', 1, 'additional_images', '2023-08-27 05:06:47', '2023-08-27 05:06:47'),
(335, 2, 'Modules\\Product\\Entities\\Product', 1, 'additional_images', '2023-08-27 05:06:47', '2023-08-27 05:06:47'),
(336, 10, 'Modules\\Product\\Entities\\Product', 4, 'base_image', '2023-08-27 05:08:27', '2023-08-27 05:08:27'),
(337, 12, 'Modules\\Product\\Entities\\Product', 4, 'additional_images', '2023-08-27 05:08:27', '2023-08-27 05:08:27'),
(338, 13, 'Modules\\Product\\Entities\\Product', 4, 'additional_images', '2023-08-27 05:08:27', '2023-08-27 05:08:27'),
(339, 16, 'Modules\\Product\\Entities\\Product', 3, 'base_image', '2023-08-27 05:51:40', '2023-08-27 05:51:40'),
(340, 15, 'Modules\\Product\\Entities\\Product', 3, 'additional_images', '2023-08-27 05:51:40', '2023-08-27 05:51:40'),
(341, 14, 'Modules\\Product\\Entities\\Product', 5, 'base_image', '2023-08-27 05:52:03', '2023-08-27 05:52:03'),
(342, 16, 'Modules\\Product\\Entities\\Product', 5, 'additional_images', '2023-08-27 05:52:04', '2023-08-27 05:52:04'),
(343, 15, 'Modules\\Product\\Entities\\Product', 5, 'additional_images', '2023-08-27 05:52:04', '2023-08-27 05:52:04'),
(344, 24, 'Modules\\Product\\Entities\\Product', 6, 'base_image', '2023-08-27 05:52:17', '2023-08-27 05:52:17'),
(345, 25, 'Modules\\Product\\Entities\\Product', 6, 'additional_images', '2023-08-27 05:52:17', '2023-08-27 05:52:17'),
(346, 26, 'Modules\\Product\\Entities\\Product', 6, 'additional_images', '2023-08-27 05:52:17', '2023-08-27 05:52:17'),
(347, 27, 'Modules\\Product\\Entities\\Product', 6, 'additional_images', '2023-08-27 05:52:17', '2023-08-27 05:52:17'),
(348, 28, 'Modules\\Product\\Entities\\Product', 7, 'base_image', '2023-08-27 05:52:50', '2023-08-27 05:52:50'),
(349, 29, 'Modules\\Product\\Entities\\Product', 7, 'additional_images', '2023-08-27 05:52:50', '2023-08-27 05:52:50'),
(350, 30, 'Modules\\Product\\Entities\\Product', 8, 'base_image', '2023-08-27 05:53:46', '2023-08-27 05:53:46'),
(351, 31, 'Modules\\Product\\Entities\\Product', 8, 'additional_images', '2023-08-27 05:53:46', '2023-08-27 05:53:46'),
(352, 32, 'Modules\\Product\\Entities\\Product', 8, 'additional_images', '2023-08-27 05:53:46', '2023-08-27 05:53:46'),
(353, 33, 'Modules\\Product\\Entities\\Product', 8, 'additional_images', '2023-08-27 05:53:46', '2023-08-27 05:53:46'),
(354, 34, 'Modules\\Product\\Entities\\Product', 8, 'additional_images', '2023-08-27 05:53:46', '2023-08-27 05:53:46'),
(355, 37, 'Modules\\Product\\Entities\\Product', 9, 'base_image', '2023-08-27 05:54:39', '2023-08-27 05:54:39'),
(356, 38, 'Modules\\Product\\Entities\\Product', 10, 'base_image', '2023-08-27 05:55:26', '2023-08-27 05:55:26'),
(357, 39, 'Modules\\Product\\Entities\\Product', 10, 'additional_images', '2023-08-27 05:55:26', '2023-08-27 05:55:26'),
(358, 40, 'Modules\\Product\\Entities\\Product', 10, 'additional_images', '2023-08-27 05:55:26', '2023-08-27 05:55:26'),
(359, 35, 'Modules\\Product\\Entities\\Product', 11, 'base_image', '2023-08-27 05:58:09', '2023-08-27 05:58:09'),
(360, 36, 'Modules\\Product\\Entities\\Product', 11, 'additional_images', '2023-08-27 05:58:09', '2023-08-27 05:58:09'),
(361, 35, 'Modules\\Product\\Entities\\Product', 11, 'additional_images', '2023-08-27 05:58:09', '2023-08-27 05:58:09'),
(362, 42, 'Modules\\Product\\Entities\\Product', 13, 'base_image', '2023-08-27 06:05:31', '2023-08-27 06:05:31'),
(363, 45, 'Modules\\Product\\Entities\\Product', 13, 'additional_images', '2023-08-27 06:05:31', '2023-08-27 06:05:31'),
(364, 46, 'Modules\\Product\\Entities\\Product', 13, 'additional_images', '2023-08-27 06:05:31', '2023-08-27 06:05:31'),
(365, 47, 'Modules\\Product\\Entities\\Product', 13, 'additional_images', '2023-08-27 06:05:31', '2023-08-27 06:05:31'),
(366, 41, 'Modules\\Product\\Entities\\Product', 14, 'base_image', '2023-08-27 06:06:42', '2023-08-27 06:06:42'),
(367, 44, 'Modules\\Product\\Entities\\Product', 14, 'additional_images', '2023-08-27 06:06:42', '2023-08-27 06:06:42'),
(368, 43, 'Modules\\Product\\Entities\\Product', 14, 'additional_images', '2023-08-27 06:06:42', '2023-08-27 06:06:42'),
(369, 41, 'Modules\\Product\\Entities\\Product', 14, 'additional_images', '2023-08-27 06:06:42', '2023-08-27 06:06:42'),
(370, 50, 'Modules\\Product\\Entities\\Product', 15, 'base_image', '2023-08-27 06:07:26', '2023-08-27 06:07:26'),
(371, 51, 'Modules\\Product\\Entities\\Product', 15, 'additional_images', '2023-08-27 06:07:26', '2023-08-27 06:07:26'),
(372, 52, 'Modules\\Product\\Entities\\Product', 15, 'additional_images', '2023-08-27 06:07:26', '2023-08-27 06:07:26'),
(373, 53, 'Modules\\Product\\Entities\\Product', 15, 'additional_images', '2023-08-27 06:07:26', '2023-08-27 06:07:26'),
(374, 284, 'Modules\\Brand\\Entities\\Brand', 25, 'logo', '2023-08-27 06:12:50', '2023-08-27 06:12:50'),
(375, 285, 'Modules\\Brand\\Entities\\Brand', 24, 'logo', '2023-08-27 06:13:05', '2023-08-27 06:13:05'),
(376, 282, 'Modules\\Brand\\Entities\\Brand', 23, 'logo', '2023-08-27 06:13:15', '2023-08-27 06:13:15'),
(377, 283, 'Modules\\Brand\\Entities\\Brand', 21, 'logo', '2023-08-27 06:13:30', '2023-08-27 06:13:30'),
(378, 280, 'Modules\\Brand\\Entities\\Brand', 20, 'logo', '2023-08-27 06:13:45', '2023-08-27 06:13:45'),
(379, 281, 'Modules\\Brand\\Entities\\Brand', 19, 'logo', '2023-08-27 06:13:58', '2023-08-27 06:13:58');

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `user_id`, `filename`, `disk`, `path`, `extension`, `mime`, `size`, `created_at`, `updated_at`) VALUES
(1, 1, 'summit-e13-flip-evo-a13mt-01-500x500.webp', 'public_storage', 'media/VMRwBRGVIMiy5lGUUhIsFOqBm0rwxMJawUUhchoz.webp', 'webp', 'image/webp', '12228', '2023-08-24 07:14:43', '2023-08-24 07:14:43'),
(2, 1, 'summit-e13-flip-evo-a13mt-02-500x500.webp', 'public_storage', 'media/vV84v3MZTgpdYqSS5hBP8hlmQJPgKau20O9oflTj.webp', 'webp', 'image/webp', '11966', '2023-08-24 07:15:42', '2023-08-24 07:15:42'),
(3, 1, 'summit-e13-flip-evo-a13mt-03-500x500.webp', 'public_storage', 'media/EbFOQrOQLxDLpN1Me2v025yYn9aIdNXxkw3kaqFA.webp', 'webp', 'image/webp', '15178', '2023-08-24 07:15:53', '2023-08-24 07:15:53'),
(4, 1, 'summit-e13-flip-evo-a13mt-04-500x500.webp', 'public_storage', 'media/ExqEiDRQ5S3aG47OmUwKJfGFMQOiiGGzZFrE6IlM.webp', 'webp', 'image/webp', '13684', '2023-08-24 07:16:02', '2023-08-24 07:16:02'),
(5, 2, 'gf63-thin-01-500x500.webp', 'public_storage', 'media/ooDGuOAn4amvYxBrqBQnrsHKTh2SYzOchwYdKt4i.webp', 'webp', 'image/webp', '10268', '2023-08-24 08:02:01', '2023-08-24 08:02:01'),
(6, 2, 'gf63-thin-04-500x500.jpg', 'public_storage', 'media/b0lDrBHNOJ4WuhzuaCTHt4tqyPsBC48UAmFGSAJz.jpg', 'jpg', 'image/jpeg', '16251', '2023-08-24 08:03:05', '2023-08-24 08:03:05'),
(7, 2, 'gf63-thin-04-500x500.jpg', 'public_storage', 'media/L6d1EiTN2OSFN1aQwH1qsYO5Yn8OGZ4AKEP55uRW.jpg', 'jpg', 'image/jpeg', '16251', '2023-08-24 08:03:44', '2023-08-24 08:03:44'),
(8, 2, 'prelude-n40-pro-01-500x500.webp', 'public_storage', 'media/Y4nTNFbkZAk75ltb4Q376B7JPJBvxvxL5lkItoIZ.webp', 'webp', 'image/webp', '9700', '2023-08-24 08:38:42', '2023-08-24 08:38:42'),
(9, 2, 'prelude-n40-pro-02-500x500.webp', 'public_storage', 'media/mdWUuqGj0vLYDWw8w2ZtX8LILFhQhPXS3mmLHPYS.webp', 'webp', 'image/webp', '6210', '2023-08-24 08:38:56', '2023-08-24 08:38:56'),
(10, 3, 'travelmate-tmp214-53-01-500x500.jpg', 'public_storage', 'media/7v1x29YI2b3p9desrz0znD0rTanYZYYiI4GdtV0P.jpg', 'jpg', 'image/jpeg', '25453', '2023-08-24 08:43:06', '2023-08-24 08:43:06'),
(11, 3, 'travelmate-tmp214-53-02-500x500.jpg', 'public_storage', 'media/THC6WopCOuSuqbkT65RwYywBGHXfXLe4E3xTmwcQ.jpg', 'jpg', 'image/jpeg', '20980', '2023-08-24 08:43:54', '2023-08-24 08:43:54'),
(12, 3, 'travelmate-tmp214-53-03-500x500.jpg', 'public_storage', 'media/6mIhfS9hNlUHjAw25URPBDazVtKLp1oLaZwALnov.jpg', 'jpg', 'image/jpeg', '21263', '2023-08-24 08:43:55', '2023-08-24 08:43:55'),
(13, 3, 'travelmate-tmp214-53-04-500x500.jpg', 'public_storage', 'media/JFclGW8KLplJDGS8OLL5pPb2bxkvtRWM2M0J18xT.jpg', 'jpg', 'image/jpeg', '21330', '2023-08-24 08:43:55', '2023-08-24 08:43:55'),
(14, 3, 'modern-15-a11mu-01-500x500.webp', 'public_storage', 'media/Npxi1nrpTDtEN8wK02JrJAldEa7q7By09CCg0ZSo.webp', 'webp', 'image/webp', '8342', '2023-08-24 08:53:29', '2023-08-24 08:53:29'),
(15, 3, 'modern-15-a11mu-01-500x500.webp', 'public_storage', 'media/Lz4AvrNSsd432pMF7jR1P89ye3NBnO2Z4XgOY2Ip.webp', 'webp', 'image/webp', '8342', '2023-08-24 08:54:31', '2023-08-24 08:54:31'),
(16, 3, 'modern-15-a11mu-02-500x500.webp', 'public_storage', 'media/QqP0DRwTJ66EEAbrOJQmZMnqcdlgBsIQdwHijId3.webp', 'webp', 'image/webp', '6704', '2023-08-24 08:54:32', '2023-08-24 08:54:32'),
(17, 2, 'prelude-n40-pro-01-500x500.webp', 'public_storage', 'media/P9Ksr8gZQU1cyhtLcLaSx5CKCi18PJWxEpe3xwW2.webp', 'webp', 'image/webp', '9700', '2023-08-24 08:54:51', '2023-08-24 08:54:51'),
(18, 3, 'aspire-3-a315-24p-01-500x500.webp', 'public_storage', 'media/IV2teW9UUMmEdTCGrul5vY66r3vdEqUuPa1Tu26c.webp', 'webp', 'image/webp', '15528', '2023-08-24 09:01:29', '2023-08-24 09:01:29'),
(19, 3, 'aspire-3-a315-24p-02-500x500.webp', 'public_storage', 'media/vEFisjZvr1lXIb8B6pnSKFqx4lmAl2HGnqmzawNF.webp', 'webp', 'image/webp', '14574', '2023-08-24 09:01:41', '2023-08-24 09:01:41'),
(20, 3, 'aspire-3-a315-24p-03-500x500.webp', 'public_storage', 'media/ABQ7tvA4d6bdMrvXbR695qgKIyQC2y3Jyhwwgls6.webp', 'webp', 'image/webp', '14192', '2023-08-24 09:01:41', '2023-08-24 09:01:41'),
(21, 3, 'aspire-3-a315-24p-04-500x500.webp', 'public_storage', 'media/t0XLjKVPeUaxTH6Mol2VoSkY1dmvKC7MzKBC8cF9.webp', 'webp', 'image/webp', '11596', '2023-08-24 09:01:42', '2023-08-24 09:01:42'),
(22, 2, 'surface-pro-9-graphite-01-500x500.webp', 'public_storage', 'media/aatI7rzvUI8wvQKWwxj39GQRDp8RgSbCPULjC7xm.webp', 'webp', 'image/webp', '12460', '2023-08-24 09:03:55', '2023-08-24 09:03:55'),
(23, 2, 'surface-pro-9-graphite-03-500x500.webp', 'public_storage', 'media/fRMODNPvhViNnpDzsL94V1Byu0WNYsP65kdGUJMT.webp', 'webp', 'image/webp', '3142', '2023-08-24 09:04:10', '2023-08-24 09:04:10'),
(24, 3, 'aspire-3-a315-24p-01-500x500.webp', 'public_storage', 'media/S5QEvuMdpwa25BBEp1kOvKVA9rRu9ycSxV5h2kk0.webp', 'webp', 'image/webp', '15528', '2023-08-24 09:06:32', '2023-08-24 09:06:32'),
(25, 3, 'aspire-3-a315-24p-02-500x500.webp', 'public_storage', 'media/Y8rJ4iRTnhYCSGtiSlSh1dW3p4RFd57gxuDL9mnN.webp', 'webp', 'image/webp', '14574', '2023-08-24 09:06:47', '2023-08-24 09:06:47'),
(26, 3, 'aspire-3-a315-24p-03-500x500.webp', 'public_storage', 'media/guxMStqZrhD1nivGErk2dW2NTC0M0eE8Qg5By6hN.webp', 'webp', 'image/webp', '14192', '2023-08-24 09:06:48', '2023-08-24 09:06:48'),
(27, 3, 'aspire-3-a315-24p-04-500x500.webp', 'public_storage', 'media/cws9V41NLPw0fEt9us75EG7Wx50rHtodloylI5Qg.webp', 'webp', 'image/webp', '11596', '2023-08-24 09:06:48', '2023-08-24 09:06:48'),
(28, 2, 'surface-pro-9-graphite-01-500x500.webp', 'public_storage', 'media/KKShzq1v1Pg1MFSIAZEdpoD0rVi3IqggZBgqJfPs.webp', 'webp', 'image/webp', '12460', '2023-08-24 09:08:40', '2023-08-24 09:08:40'),
(29, 2, 'surface-pro-9-graphite-03-500x500.webp', 'public_storage', 'media/3bNyf88AitrABHSRSsKV0Adkm3xyqp09JJm6ewlr.webp', 'webp', 'image/webp', '3142', '2023-08-24 09:08:55', '2023-08-24 09:08:55'),
(30, 3, 'ideapad-1-15ada7-01-500x500.webp', 'public_storage', 'media/GedNSMHTKnJ9nnVxGLoV7w8IYJa164IUUMBcz5WF.webp', 'webp', 'image/webp', '9170', '2023-08-24 09:12:51', '2023-08-24 09:12:51'),
(31, 3, 'ideapad-1-15ada7-05-500x500 - Copy.webp', 'public_storage', 'media/CwdpaATGb4lgEpTU7QBaWbxAWnf9VLYmA1VnRHkh.webp', 'webp', 'image/webp', '5474', '2023-08-24 09:13:11', '2023-08-24 09:13:11'),
(32, 3, 'ideapad-1-15ada7-02-500x500 - Copy.webp', 'public_storage', 'media/v9sumnzHOtpau7OnQnRgXn1UCMBiv5KfqChqcItc.webp', 'webp', 'image/webp', '10392', '2023-08-24 09:13:12', '2023-08-24 09:13:12'),
(33, 3, 'ideapad-1-15ada7-03-500x500 - Copy.webp', 'public_storage', 'media/JWbZm3RQzVQdujFlqf51WY6H8usKbatXAtqvAstC.webp', 'webp', 'image/webp', '6928', '2023-08-24 09:13:12', '2023-08-24 09:13:12'),
(34, 3, 'ideapad-1-15ada7-04-500x500 - Copy.webp', 'public_storage', 'media/lx3cN3yrBNivvEsBgbrSVAFI4SZV7dS5QgY9BrGo.webp', 'webp', 'image/webp', '22718', '2023-08-24 09:13:12', '2023-08-24 09:13:12'),
(35, 1, 'oyIoqGHxEmizRExHXmXi2Y4Hsip5RZm7aVsRrJZN.jpeg', 'public_storage', 'media/mKWxnQUMx1FRZcT0P3cy5lsSCyJ9wiXciwFd1I3p.jpg', 'jpg', 'image/jpeg', '24475', '2023-08-24 09:16:04', '2023-08-24 09:16:04'),
(36, 1, 'uVIn12sWRQzXEW56BnVIy223NFajfer5i2uTo4ST.jpeg', 'public_storage', 'media/34QGPuEQZi9LhPp6DJ3IW1y9uITSCQIy7JrEyuPQ.jpg', 'jpg', 'image/jpeg', '7694', '2023-08-24 09:16:27', '2023-08-24 09:16:27'),
(37, 2, 'aspire-5-an515-57g-52hf-01-500x500.webp', 'public_storage', 'media/TZHZudnew86liLilElkMA5gR8p9FlEif1vVXhyb0.webp', 'webp', 'image/webp', '12720', '2023-08-24 09:16:56', '2023-08-24 09:16:56'),
(38, 3, 'ideapad-slim-3i-0010-500x500.jpg', 'public_storage', 'media/1ObsqyDzA3YIlqgtnJTbcZlFLScRyTAFlYpX5OMF.jpg', 'jpg', 'image/jpeg', '36316', '2023-08-24 09:17:45', '2023-08-24 09:17:45'),
(39, 3, 'ideapad-slim-3i-001-500x500.jpg', 'public_storage', 'media/S6HMC7RJcv4Cjudwyr17UlDryQzGZoyu5KluFkFy.jpg', 'jpg', 'image/jpeg', '32416', '2023-08-24 09:17:56', '2023-08-24 09:17:56'),
(40, 3, 'ideapad-slim-3i-002-500x500.jpg', 'public_storage', 'media/VZZwMtY7G0jCcO016lCmn3aLGcq3L7pQjvjzj8lb.jpg', 'jpg', 'image/jpeg', '26623', '2023-08-24 09:17:57', '2023-08-24 09:17:57'),
(41, 1, 'kYNLiQAnCD0Wt88CWNT9B571YAN3xbTvvkkw2hYg.jpeg', 'public_storage', 'media/JV3eTjRAa7lctKf70qyjWSzwJYBmlXiGu9lUd9ml.jpg', 'jpg', 'image/jpeg', '12910', '2023-08-24 09:22:43', '2023-08-24 09:22:43'),
(42, 3, 'modern-15-b13m-05-500x500.webp', 'public_storage', 'media/u8BbyvnUOalXmBuVNVr30gSzw2nW04w53LYO5vvw.webp', 'webp', 'image/webp', '16446', '2023-08-24 09:23:01', '2023-08-24 09:23:01'),
(43, 1, '91HfUFp3iiCs37vb7QNhK81RB3seG5Op5eA7vGZQ.jpeg', 'public_storage', 'media/FA7tn4OyrRHI1NWnugjXRr7YojQffbhCHmyw9rzU.jpg', 'jpg', 'image/jpeg', '9560', '2023-08-24 09:23:07', '2023-08-24 09:23:07'),
(44, 1, 'wAD9FfWYGYhQXQXMUIVpaSdSuGvKV5dyGxgo1I0C.jpeg', 'public_storage', 'media/fY2bhPActTQ0CUuCmswObR5lvJMbeUNjekBiQKEs.jpg', 'jpg', 'image/jpeg', '10045', '2023-08-24 09:23:10', '2023-08-24 09:23:10'),
(45, 3, 'modern-15-b13m-03-500x500.webp', 'public_storage', 'media/8XJ6ZmS474KzEF0eQgnyc5xmkVWlJYFRMNb6PmbM.webp', 'webp', 'image/webp', '10498', '2023-08-24 09:23:13', '2023-08-24 09:23:13'),
(46, 3, 'modern-15-b13m-01-500x500.webp', 'public_storage', 'media/41ZiEYvtq1AtLQsdb1zwRumoknKq6HNUFTCIEZxU.webp', 'webp', 'image/webp', '16672', '2023-08-24 09:23:13', '2023-08-24 09:23:13'),
(47, 3, 'modern-15-b13m-04-500x500.webp', 'public_storage', 'media/sYGKUK3cJzU6DreoaJrv5xMduYloIb46zhHwlhic.webp', 'webp', 'image/webp', '9326', '2023-08-24 09:23:14', '2023-08-24 09:23:14'),
(48, 2, 'ideapad-slim-3i-8-500x500.jpg', 'public_storage', 'media/EHovosblcpo4DhsGEMWOf4kmw0g5mBdfygjAnu2w.jpg', 'jpg', 'image/jpeg', '36316', '2023-08-24 09:23:56', '2023-08-24 09:23:56'),
(49, 2, 'ideapad-slim-3i-002-500x500.jpg', 'public_storage', 'media/OVJMXSyQMCeQyUERc9IwPCWJeT3RWhzzPY9npECB.jpg', 'jpg', 'image/jpeg', '26623', '2023-08-24 09:24:05', '2023-08-24 09:24:05'),
(50, 3, 'aspire-3-a315-59-01-500x500.webp', 'public_storage', 'media/SW4kvIBEE8T4VY5ngjCi5kWvqobF5z9pT0XspEOr.webp', 'webp', 'image/webp', '15448', '2023-08-24 09:28:01', '2023-08-24 09:28:01'),
(51, 3, 'aspire-3-a315-59-02-500x500.webp', 'public_storage', 'media/VAdyiIN1RxSFOj70fb2tlLY63rn4JufBFPeNlzxd.webp', 'webp', 'image/webp', '4016', '2023-08-24 09:28:14', '2023-08-24 09:28:14'),
(52, 3, 'aspire-3-a315-59-03-500x500.webp', 'public_storage', 'media/yjDchSGv0oHWmM0xNU247r31nFxgjdCwODG6OOdb.webp', 'webp', 'image/webp', '1654', '2023-08-24 09:28:15', '2023-08-24 09:28:15'),
(53, 3, 'aspire-3-a315-59-04-500x500.webp', 'public_storage', 'media/rnE03jTzVsfU6i9eTzOrGYujYR7M8kTmYzt6a2xW.webp', 'webp', 'image/webp', '2060', '2023-08-24 09:28:15', '2023-08-24 09:28:15'),
(54, 1, 'b4OaNTZTzb9w1oayiPtdiuwi6wsHCUcPlYPWZX7U.jpeg', 'public_storage', 'media/63VyvHpHNaz0JMAsjUvNRzNBotrJmxGtC3UYqy5X.jpg', 'jpg', 'image/jpeg', '40991', '2023-08-24 09:29:40', '2023-08-24 09:29:40'),
(55, 1, 'pamB8rBFzdupPjMZZ8C0CxLTEYM8jJLnHRjAaG9l.jpeg', 'public_storage', 'media/deruLHsJrJQVI6mTJ0Sdn4Nhm8pSS5f2G28mNDyp.jpg', 'jpg', 'image/jpeg', '30559', '2023-08-24 09:30:27', '2023-08-24 09:30:27'),
(56, 2, 'katana-gf66-12uc-01-500x500.webp', 'public_storage', 'media/MozoDxUUY2uJVcqEgBTMovCoZrDOlbQps1YoJxQ8.webp', 'webp', 'image/webp', '147832', '2023-08-24 09:30:27', '2023-08-24 09:30:27'),
(57, 2, 'katana-gf66-12uc-03-500x500.webp', 'public_storage', 'media/ReBuKrVybUXvSbA9vxRYTO7ZAuZcJGZQicLwUUn5.webp', 'webp', 'image/webp', '78618', '2023-08-24 09:30:47', '2023-08-24 09:30:47'),
(58, 2, 'katana-gf66-12uc-02-500x500.webp', 'public_storage', 'media/XD8v6qaeKNWmKpVnOjV1vI0POmNjthdMLXAcxVNF.webp', 'webp', 'image/webp', '89556', '2023-08-24 09:30:47', '2023-08-24 09:30:47'),
(59, 2, 'katana-gf66-12uc-04-500x500.webp', 'public_storage', 'media/VzrXPpeYrGqVUrdyVa1vkgM7tfdgf4H0B7AmdMJr.webp', 'webp', 'image/webp', '107862', '2023-08-24 09:30:47', '2023-08-24 09:30:47'),
(60, 1, 'L5LOTN6bFQERMBisMPffOntLjDgRFbzzXAJe3w5M.jpeg', 'public_storage', 'media/BzPNI9y6s20TkzHcyObgUyqA3JxdVVxmue3d0de5.jpg', 'jpg', 'image/jpeg', '20050', '2023-08-24 09:30:59', '2023-08-24 09:30:59'),
(61, 3, 'v14-g2-01-500x500.webp', 'public_storage', 'media/tBVouRBtXxkNGK6sgicacyWCT4H5gW7z2oUwHsp4.webp', 'webp', 'image/webp', '9230', '2023-08-24 09:33:06', '2023-08-24 09:33:06'),
(62, 3, 'v14-g2-02-500x500.webp', 'public_storage', 'media/VADeXlwYHOxS7ROue9OE6WRuugY8olyUlvRWUCUX.webp', 'webp', 'image/webp', '12472', '2023-08-24 09:33:21', '2023-08-24 09:33:21'),
(63, 3, 'v14-g2-03-500x500.webp', 'public_storage', 'media/uNSjooHoCIopCgnJyqwLdhLIhMFBPdUh8fS1HHIE.webp', 'webp', 'image/webp', '3936', '2023-08-24 09:33:21', '2023-08-24 09:33:21'),
(64, 2, 'katana-gf66-12uc-04-500x500.webp', 'public_storage', 'media/pJ76snIBCsZlXvRPSsvcO5rBRmDoLsy4qXt7fWCW.webp', 'webp', 'image/webp', '107862', '2023-08-24 09:33:22', '2023-08-24 09:33:22'),
(65, 3, 'v14-g2-02-500x500.webp', 'public_storage', 'media/FFtXnYHT9NNmAf3Hb8VsCIk0pFd3QofLKFU0O578.webp', 'webp', 'image/webp', '12472', '2023-08-24 09:33:50', '2023-08-24 09:33:50'),
(66, 3, 'v14-g2-03-500x500.webp', 'public_storage', 'media/iIbaOtKLSQbzlqFAOZ33K5erTwbOq1yhHsqQaY4K.webp', 'webp', 'image/webp', '3936', '2023-08-24 09:33:51', '2023-08-24 09:33:51'),
(67, 2, 'sword-15-a12vf-01-500x500 (1).webp', 'public_storage', 'media/HT8sThVTmFK6VYCaQFO6jVnjCZeRgHV7PSJbOR7Y.webp', 'webp', 'image/webp', '10466', '2023-08-24 09:34:47', '2023-08-24 09:34:47'),
(68, 1, 'e8dSzOjUGqrdgHLCmb4WaXlbdGtMnb6Lz5bnHZ4e.jpeg', 'public_storage', 'media/DFDNcIbUpcKwsWG3GHSeFQsEkMDifOjIgfuHyoOY.jpg', 'jpg', 'image/jpeg', '53250', '2023-08-24 09:34:55', '2023-08-24 09:34:55'),
(69, 2, 'sword-15-a12vf-02-500x500.webp', 'public_storage', 'media/yxplksdyTIb7o55FCgdoNrSq7ZRA0NNWvr1aZi4b.webp', 'webp', 'image/webp', '6898', '2023-08-24 09:35:07', '2023-08-24 09:35:07'),
(70, 2, 'sword-15-a12vf-03-500x500.webp', 'public_storage', 'media/jWE1vKJBvgLWHpjNJpaCywRhEwvG3HEEZDB8965A.webp', 'webp', 'image/webp', '13142', '2023-08-24 09:35:08', '2023-08-24 09:35:08'),
(71, 2, 'sword-15-a12vf-04-500x500.webp', 'public_storage', 'media/09rzWtsS192PKmJtvWnGF3OeZs8ms0kOmYmbvL5V.webp', 'webp', 'image/webp', '3972', '2023-08-24 09:35:08', '2023-08-24 09:35:08'),
(72, 2, 'sword-15-a12vf-05-500x500.webp', 'public_storage', 'media/MJrYaRXK2UYSZWYDxFxAD6iJIyoH7lPYkdh0wAwt.webp', 'webp', 'image/webp', '3688', '2023-08-24 09:35:09', '2023-08-24 09:35:09'),
(73, 1, 'gnuv9zB3FcckFfr74LHVHrXYUpKb7tzVRf4yVsWd.jpeg', 'public_storage', 'media/QFBanHmS8CGgr8342o2hKFz0D42k98QOTdByOs1I.jpg', 'jpg', 'image/jpeg', '41153', '2023-08-24 09:35:10', '2023-08-24 09:35:10'),
(74, 1, 'ZsRHJJSjNWHA3j4tnBMuAIbRdJWk1KNcAVZNT3u5.jpeg', 'public_storage', 'media/cGLKF4oJykJgDd3zilrPjsJTnTypXkSVQnCJ96Hr.jpg', 'jpg', 'image/jpeg', '14566', '2023-08-24 09:35:23', '2023-08-24 09:35:23'),
(75, 1, 'hxVZCbXwJOjv7YbJtoTplupsnutqmMEenRdLb9Ll.jpeg', 'public_storage', 'media/KwLvmB4xVNwHg4zje0UYtyehucfPhMywDuigxVeX.jpg', 'jpg', 'image/jpeg', '18097', '2023-08-24 09:35:35', '2023-08-24 09:35:35'),
(76, 3, 'travelmate-tmp214-53-01-500x500.jpg', 'public_storage', 'media/uwdzxKKFxhuFkzW6oHqQNzNIwzZOWrLImr4T0xpI.jpg', 'jpg', 'image/jpeg', '25453', '2023-08-24 09:38:44', '2023-08-24 09:38:44'),
(77, 3, 'travelmate-tmp214-53-02-500x500.jpg', 'public_storage', 'media/WJjDXJ6o8nIAG5vQPzGJ0fBXnYda3hpiQxM3sx0g.jpg', 'jpg', 'image/jpeg', '20980', '2023-08-24 09:38:58', '2023-08-24 09:38:58'),
(78, 3, 'travelmate-tmp214-53-03-500x500.jpg', 'public_storage', 'media/B2d90OsShqTPDmPWwkGAG6zGMxSCHsZJfcu9lTrO.jpg', 'jpg', 'image/jpeg', '21263', '2023-08-24 09:38:59', '2023-08-24 09:38:59'),
(79, 3, 'travelmate-tmp214-53-04-500x500.jpg', 'public_storage', 'media/tNstIbA85o0cKtAgPlAgZAh2kypuitc2jpR6djQB.jpg', 'jpg', 'image/jpeg', '21330', '2023-08-24 09:38:59', '2023-08-24 09:38:59'),
(80, 2, 'aspire-7-a715-5g-01-500x500.webp', 'public_storage', 'media/n6OzdPV2Dp28EJyVVUPd1J3fcOGmRuXS9nvklhfh.webp', 'webp', 'image/webp', '12674', '2023-08-24 09:41:00', '2023-08-24 09:41:00'),
(81, 3, 'modern-14-c13m-01-500x500.webp', 'public_storage', 'media/78ZbgWYIo4QdbCWsHbn4II6zcSZQQgIzqCrYAotS.webp', 'webp', 'image/webp', '16828', '2023-08-24 09:44:25', '2023-08-24 09:44:25'),
(82, 2, 'vivobook-15-x515ea-01-500x500.jpg', 'public_storage', 'media/2iieNSaJVcxAsRpCyG8bXRLrGsLjgVJw9f9QNkWE.jpg', 'jpg', 'image/jpeg', '23306', '2023-08-24 09:44:38', '2023-08-24 09:44:38'),
(83, 3, 'modern-14-c13m-03-500x500.webp', 'public_storage', 'media/bgvugSVtGuCnHJ3BwkOtHHS5BMqofKalor7jWN8K.webp', 'webp', 'image/webp', '10318', '2023-08-24 09:44:40', '2023-08-24 09:44:40'),
(84, 3, 'modern-14-c13m-02-500x500.webp', 'public_storage', 'media/38ZRENdYlMxnpnxepxBBQtgOl59AyikuPOiIkiRG.webp', 'webp', 'image/webp', '17736', '2023-08-24 09:44:41', '2023-08-24 09:44:41'),
(85, 3, 'modern-14-c13m-04-500x500.webp', 'public_storage', 'media/fe9CSBk21054MrtgHvlfGX1Lv7vjwYW9oCqfoF7e.webp', 'webp', 'image/webp', '9528', '2023-08-24 09:44:41', '2023-08-24 09:44:41'),
(86, 2, 'vivobook-15-x515ea-003-500x500.jpg', 'public_storage', 'media/oW8JuSFSgcxaYJmMLMapE6Wbgm1E9cT6o9y2P9Mj.jpg', 'jpg', 'image/jpeg', '15455', '2023-08-24 09:44:48', '2023-08-24 09:44:48'),
(87, 2, 'ideapad-1-15ada7-04-500x500.webp', 'public_storage', 'media/gw2e0CyzyBa8qTY4goUEPCVCFgkZZK6P8WOQ8fxO.webp', 'webp', 'image/webp', '22718', '2023-08-24 09:50:30', '2023-08-24 09:50:30'),
(88, 2, 'ideapad-1-15ada7-03-500x500.webp', 'public_storage', 'media/XR6nz5u6RpgHqokoFmUqgaghzp0Q7sYf014Ie1J2.webp', 'webp', 'image/webp', '6928', '2023-08-24 09:51:08', '2023-08-24 09:51:08'),
(89, 2, 'ideapad-1-15ada7-02-500x500.webp', 'public_storage', 'media/vxJ4XMFDcQhWzCpTvYHw6V6waD50FaXUVW17rAK3.webp', 'webp', 'image/webp', '10392', '2023-08-24 09:51:08', '2023-08-24 09:51:08'),
(90, 2, 'ideapad-1-15ada7-01-500x500.webp', 'public_storage', 'media/Vu9SxZmbKU2niSytY0EeusJdOoJpwORndDV17QPh.webp', 'webp', 'image/webp', '9170', '2023-08-24 09:51:09', '2023-08-24 09:51:09'),
(91, 3, 'extensa-14-ex214-53-543w-001-500x500.webp', 'public_storage', 'media/LmZI7kq8ZSJ0h9wIkgaPd0C1KUXYJCqq7FDYOC8B.webp', 'webp', 'image/webp', '10154', '2023-08-24 09:51:37', '2023-08-24 09:51:37'),
(92, 3, 'extensa-14-ex214-53-543w-002-500x500 - Copy.webp', 'public_storage', 'media/dhGsXQN4ERrTPICkHuTE5bbmSsRiZGbkojFhJVHK.webp', 'webp', 'image/webp', '9148', '2023-08-24 09:52:05', '2023-08-24 09:52:05'),
(93, 3, 'extensa-14-ex214-53-543w-003-500x500.webp', 'public_storage', 'media/iKd03fUwCei5mVm0YsTGhtfV6xjOTfleHeOEyLPb.webp', 'webp', 'image/webp', '9734', '2023-08-24 09:52:05', '2023-08-24 09:52:05'),
(94, 3, 'extensa-14-ex214-53-543w-004-500x500.webp', 'public_storage', 'media/eiEYO8Nq2XfvokltmX5KWBSx7NPtsP8jYclz8UT7.webp', 'webp', 'image/webp', '9086', '2023-08-24 09:52:06', '2023-08-24 09:52:06'),
(95, 3, 'ideapad-slim-3i-arctic-grey-01-500x500.webp', 'public_storage', 'media/Rcyq1ARZHvFYUJ8oxl0q2TTlHHRUuxt1nmJRCIaD.webp', 'webp', 'image/webp', '10280', '2023-08-24 09:57:16', '2023-08-24 09:57:16'),
(96, 3, 'ideapad-slim-3i-arctic-grey-03-500x500.webp', 'public_storage', 'media/Mxk4Smd4jjpLXdOn9WEv3sLO5KyAMSzyWY14rAYr.webp', 'webp', 'image/webp', '6824', '2023-08-24 09:57:31', '2023-08-24 09:57:31'),
(97, 3, 'ideapad-slim-3i-arctic-grey-02-500x500.webp', 'public_storage', 'media/gFCTX0GF4IA2LkF3l3PltqaGmVAyU9mcuUOHRurJ.webp', 'webp', 'image/webp', '6788', '2023-08-24 09:57:31', '2023-08-24 09:57:31'),
(98, 3, 'ideapad-slim-3i-arctic-grey-04-500x500.webp', 'public_storage', 'media/wcQ5mhN7nzx7zladmGf5WhLn958hCwBVkTZkB0wK.webp', 'webp', 'image/webp', '11550', '2023-08-24 09:57:32', '2023-08-24 09:57:32'),
(99, 2, 'katana-15-b12udxk-01-500x500.webp', 'public_storage', 'media/r4Vd6YYTmF33yPTPma82DsJAJRjMsWuXUTLxTiXL.webp', 'webp', 'image/webp', '12632', '2023-08-24 09:59:44', '2023-08-24 09:59:44'),
(100, 2, 'katana-15-b12udxk-03-500x500.webp', 'public_storage', 'media/pojaLcWwpeH0oeHQJEhUjD5BIHnrkDZ3MCIHMEx7.webp', 'webp', 'image/webp', '4606', '2023-08-24 10:00:10', '2023-08-24 10:00:10'),
(101, 2, 'katana-15-b12udxk-02-500x500.webp', 'public_storage', 'media/MSW4g0iR3WtY8rtNwpypdxYbK2ookreopKM91Szm.webp', 'webp', 'image/webp', '11556', '2023-08-24 10:00:11', '2023-08-24 10:00:11'),
(102, 3, 'vivobook-e410ma-01-500x500.webp', 'public_storage', 'media/9fOlR1Eb8r5m2sytqMzlzeY4BXPRj1Sya49KWtKN.webp', 'webp', 'image/webp', '9622', '2023-08-24 10:02:24', '2023-08-24 10:02:24'),
(103, 3, 'vivobook-e410ma-02-500x500.webp', 'public_storage', 'media/CxrYLRY4wxOCFRTUSzjPFCXqM8CtlgcNxSm3dM6b.webp', 'webp', 'image/webp', '7986', '2023-08-24 10:02:37', '2023-08-24 10:02:37'),
(104, 3, 'vivobook-e410ma-03-500x500.webp', 'public_storage', 'media/zeBWeoLIeNDzn5TfqOPKJydrNTqq00OYDyKA6Zw1.webp', 'webp', 'image/webp', '6470', '2023-08-24 10:02:37', '2023-08-24 10:02:37'),
(105, 2, 'vivobook-x515ka-slate-grey-01-500x500.webp', 'public_storage', 'media/qlU21tDMqGmynNStqONdTYBwh4KsH1aziqqY52B6.webp', 'webp', 'image/webp', '15126', '2023-08-24 10:03:38', '2023-08-24 10:03:38'),
(106, 2, 'vivobook-x515ka-03-500x500.webp', 'public_storage', 'media/zSKe4bRwv5bUBf29FxENSUhMKwvNl5xMquBNEV2N.webp', 'webp', 'image/webp', '4300', '2023-08-24 10:03:54', '2023-08-24 10:03:54'),
(107, 2, 'vivobook-x515ka-01-500x500.webp', 'public_storage', 'media/DypUaBeRW7Chr85waPqV8G4fqpYLg6W6EF0NlSli.webp', 'webp', 'image/webp', '17998', '2023-08-24 10:03:55', '2023-08-24 10:03:55'),
(108, 2, 'vivobook-x515ka-slate-grey-02-500x500.webp', 'public_storage', 'media/1ZX732Ntc8ThgnUc4sWgtrHHNDlyuz30ao4mdfcu.webp', 'webp', 'image/webp', '10426', '2023-08-24 10:03:55', '2023-08-24 10:03:55'),
(109, 2, 'ideapad-slim-3i-arctic-grey-01-500x500.webp', 'public_storage', 'media/HrkUWStgiaB03GA7cNrVveFosl43pOagBIyYgK6y.webp', 'webp', 'image/webp', '10280', '2023-08-24 10:08:06', '2023-08-24 10:08:06'),
(110, 3, 'ideapad-slim-3i-abyss-blue-04-500x500.webp', 'public_storage', 'media/NNPpZcOhi9tj0RXbbiTcN1XRggyRCK7ui6AY13v8.webp', 'webp', 'image/webp', '13526', '2023-08-24 10:08:15', '2023-08-24 10:08:15'),
(111, 2, 'ideapad-slim-3i-arctic-grey-02-500x500.webp', 'public_storage', 'media/5l7tB6mIM3kTu9ZaCpj4s23x0sXc2K1eycxIsGES.webp', 'webp', 'image/webp', '6788', '2023-08-24 10:08:21', '2023-08-24 10:08:21'),
(112, 2, 'ideapad-slim-3i-arctic-grey-03-500x500.webp', 'public_storage', 'media/sBLYMXMsuVsbiEe8T0ftHLztgrALn2Yr36gDScsy.webp', 'webp', 'image/webp', '6824', '2023-08-24 10:08:22', '2023-08-24 10:08:22'),
(113, 3, 'ideapad-slim-3i-abyss-blue-01-500x500.webp', 'public_storage', 'media/tnNSACWvbEu7UubLLgMzU58ZN5SrWtCIP2NqeSEn.webp', 'webp', 'image/webp', '6326', '2023-08-24 10:08:30', '2023-08-24 10:08:30'),
(114, 3, 'ideapad-slim-3i-abyss-blue-02-500x500.webp', 'public_storage', 'media/sEriBHZb2d0RGzFyC6lxyzexNoQldvFUo4cefZy2.webp', 'webp', 'image/webp', '10408', '2023-08-24 10:08:31', '2023-08-24 10:08:31'),
(115, 3, 'ideapad-slim-3i-abyss-blue-03-500x500.webp', 'public_storage', 'media/QkRpkr7C9QiK5E8tns8jwWHXgSSKG7YxyQQ6Jatb.webp', 'webp', 'image/webp', '9754', '2023-08-24 10:08:31', '2023-08-24 10:08:31'),
(116, 3, 'travelmate-tmp214-53-01-500x500.jpg', 'public_storage', 'media/mvEj4Ik01tVdwER1fOi2g71ZSUt25hZCWHPyOZdY.jpg', 'jpg', 'image/jpeg', '25453', '2023-08-24 10:13:40', '2023-08-24 10:13:40'),
(117, 3, 'travelmate-tmp214-53-02-500x500.jpg', 'public_storage', 'media/d65sCAwtkhQCNZ5sp1X42JjJ7eqZkAi8ofBHh4bM.jpg', 'jpg', 'image/jpeg', '20980', '2023-08-24 10:13:57', '2023-08-24 10:13:57'),
(118, 3, 'travelmate-tmp214-53-03-500x500.jpg', 'public_storage', 'media/R3ZPElC7Hly9fLsUdQIA8fdOGulPNeqwMzurENe3.jpg', 'jpg', 'image/jpeg', '21263', '2023-08-24 10:14:00', '2023-08-24 10:14:00'),
(119, 3, 'travelmate-tmp214-53-04-500x500.jpg', 'public_storage', 'media/L8ev9Wp2n5HRe1mIMnqZmTelut1nW4N4Wg6IxLPv.jpg', 'jpg', 'image/jpeg', '21330', '2023-08-24 10:14:01', '2023-08-24 10:14:01'),
(120, 2, 'summit-e16-flip-evo-a13mt-01-500x500.webp', 'public_storage', 'media/ysxkf58CCtG18aFaYvcNa2ukFh3LTsmnVL4acyU0.webp', 'webp', 'image/webp', '8036', '2023-08-24 10:14:23', '2023-08-24 10:14:23'),
(121, 2, 'summit-e16-flip-evo-a13mt-05-500x500.webp', 'public_storage', 'media/AV13XPFmvb7fGhBaYOYFlANb8XeT4qatViOyVlw7.webp', 'webp', 'image/webp', '9962', '2023-08-24 10:14:43', '2023-08-24 10:14:43'),
(122, 2, 'summit-e16-flip-evo-a13mt-03-500x500.webp', 'public_storage', 'media/V7k5MO8IDXh0ayhU1StM96pTckdVED1RzShsJBfz.webp', 'webp', 'image/webp', '5776', '2023-08-24 10:14:44', '2023-08-24 10:14:44'),
(123, 2, 'summit-e16-flip-evo-a13mt-02-500x500.webp', 'public_storage', 'media/5EBbRcP1yiY8p2WUG4zuBLkzyKl9PLZ72WwwoHKa.webp', 'webp', 'image/webp', '10112', '2023-08-24 10:14:44', '2023-08-24 10:14:44'),
(124, 2, 'prelude-n41-pro-01-500x500.webp', 'public_storage', 'media/T5z0n6scIzuWpQAXw1vtxQvXG4ptVqOd8Hj3HnF5.webp', 'webp', 'image/webp', '13672', '2023-08-24 10:18:05', '2023-08-24 10:18:05'),
(125, 2, 'prelude-n41-pro-04-500x500.webp', 'public_storage', 'media/rsUrGVexVNqnbEHTU42PRrBCrHCxu6hFJGLT6Yrj.webp', 'webp', 'image/webp', '12936', '2023-08-24 10:18:20', '2023-08-24 10:18:20'),
(126, 2, 'prelude-n41-pro-03-500x500.webp', 'public_storage', 'media/h2HLRanS6zLeH8yOjzUWiqmwDSNm4IFp3CZxYy65.webp', 'webp', 'image/webp', '5990', '2023-08-24 10:18:21', '2023-08-24 10:18:21'),
(127, 2, 'prelude-n41-pro-02-500x500.webp', 'public_storage', 'media/lNKRZcNZ3HLhSMTfwdHOJHKAa94yxWCetvIdZUHb.webp', 'webp', 'image/webp', '11722', '2023-08-24 10:18:21', '2023-08-24 10:18:21'),
(128, 3, 'gf63-thin-11uc-05-500x500.jpg', 'public_storage', 'media/LfwSqvbZ8eQ2yfMADddJh7h31dM3YyLwNgdM86pc.jpg', 'jpg', 'image/jpeg', '27704', '2023-08-24 10:19:24', '2023-08-24 10:19:24'),
(129, 3, 'gf63-thin-11uc-01-500x500.jpg', 'public_storage', 'media/5aIxzDMMBQPZwrcf6SrgmzBertuqXk6msu0tEVYC.jpg', 'jpg', 'image/jpeg', '37997', '2023-08-24 10:19:39', '2023-08-24 10:19:39'),
(130, 3, 'gf63-thin-11uc-02-500x500.jpg', 'public_storage', 'media/wDUL2tiEAmzPHxbXQSoYGf8d2n5x5KORQOYD4ZcC.jpg', 'jpg', 'image/jpeg', '14458', '2023-08-24 10:19:39', '2023-08-24 10:19:39'),
(131, 3, 'gf63-thin-11uc-03-500x500.jpg', 'public_storage', 'media/fYGqvJgddxJEy57ywLAUmWish9bo1BP8m0gdRo2X.jpg', 'jpg', 'image/jpeg', '16251', '2023-08-24 10:19:39', '2023-08-24 10:19:39'),
(132, 3, 'gf63-thin-11uc-04-500x500.jpg', 'public_storage', 'media/QEmhIhaC6cbtGLkE8lyDkm2ZBmpmPNQ1DnndonIh.jpg', 'jpg', 'image/jpeg', '13116', '2023-08-24 10:19:40', '2023-08-24 10:19:40'),
(133, 3, 'gf63-thin-11uc-01-500x500.jpg', 'public_storage', 'media/6hK2oFIJesxD03xHLzj0tvUbhblLABGCoybj2CLD.jpg', 'jpg', 'image/jpeg', '37997', '2023-08-24 10:20:17', '2023-08-24 10:20:17'),
(134, 3, 'gf63-thin-11uc-05-500x500.jpg', 'public_storage', 'media/putaUB5Ng7U0uLShuSS3CaxMNJmkBMOHbpqkG2ab.jpg', 'jpg', 'image/jpeg', '27704', '2023-08-24 10:20:31', '2023-08-24 10:20:31'),
(135, 2, 'nitro-5-an515-46-r3u8-01-500x500.webp', 'public_storage', 'media/22VQ3kB3dhLtjktV8XZOtzwM2qaOEeFAHaHvCopH.webp', 'webp', 'image/webp', '15226', '2023-08-24 10:23:26', '2023-08-24 10:23:26'),
(136, 2, 'nitro-5-an515-46-r3u8-03-500x500.webp', 'public_storage', 'media/sDCmwM11Y0uWzUwVGVtKHRja2J0L21j9YqO1XHh9.webp', 'webp', 'image/webp', '16392', '2023-08-24 10:23:37', '2023-08-24 10:23:37'),
(137, 2, 'nitro-5-an515-46-r3u8-02-500x500.webp', 'public_storage', 'media/NTsnlTlTYcHmBcDaGqpg5I7Xh8of6biE3BiaFJ6k.webp', 'webp', 'image/webp', '16580', '2023-08-24 10:23:37', '2023-08-24 10:23:37'),
(138, 3, 'gf63-thin-11uc-01-500x500.jpg', 'public_storage', 'media/kFviNVMF0I1hoeCi3Ti6BPDHtUiDKnw2H1TQ218d.jpg', 'jpg', 'image/jpeg', '37997', '2023-08-24 10:24:56', '2023-08-24 10:24:56'),
(139, 3, 'gf63-thin-11uc-03-500x500.jpg', 'public_storage', 'media/JFYUFKzSfqnXmgilF16BAV8bkZbcRCVMpmbnuaz8.jpg', 'jpg', 'image/jpeg', '16251', '2023-08-24 10:25:24', '2023-08-24 10:25:24'),
(140, 3, 'gf63-thin-11uc-02-500x500.jpg', 'public_storage', 'media/RhKt1NB9icn0snRLIhBZcjK4MwHUsQZi2z9plYup.jpg', 'jpg', 'image/jpeg', '14458', '2023-08-24 10:25:24', '2023-08-24 10:25:24'),
(141, 3, 'gf63-thin-11uc-04-500x500.jpg', 'public_storage', 'media/b5WcegzwPrNpkVHaAXnBQXXQ6MXWsd98iL5ZdHHF.jpg', 'jpg', 'image/jpeg', '13116', '2023-08-24 10:25:24', '2023-08-24 10:25:24'),
(142, 3, 'gf63-thin-11uc-05-500x500.jpg', 'public_storage', 'media/QXBdcDqSLgANTYUcgKuBvQOj4jvAeuiePOss2c8e.jpg', 'jpg', 'image/jpeg', '27704', '2023-08-24 10:25:25', '2023-08-24 10:25:25'),
(143, 2, 'ideapad-3-14aba7-01-500x500.webp', 'public_storage', 'media/1wgJrCGf0lrCObY6HEkRJmZ8fcQw3VtThXAYLMxO.webp', 'webp', 'image/webp', '32738', '2023-08-24 10:28:01', '2023-08-24 10:28:01'),
(144, 2, 'ideapad-3-14aba7-06-500x500.webp', 'public_storage', 'media/JFsDFYZkXSX4zEQFsQPg0sXMwKIKhCKiszwwutKy.webp', 'webp', 'image/webp', '2080', '2023-08-24 10:28:16', '2023-08-24 10:28:16'),
(145, 2, 'ideapad-3-14aba7-04-500x500.webp', 'public_storage', 'media/ev8pPirJIuDQ9ytXR0XsMAeZ90GluFlnrXvsmMdm.webp', 'webp', 'image/webp', '4558', '2023-08-24 10:28:17', '2023-08-24 10:28:17'),
(146, 2, 'ideapad-3-14aba7-03-500x500.webp', 'public_storage', 'media/nlX8xCXlL4vA0GQQDE8ur7pTZAxMGTHgEp5NvokE.webp', 'webp', 'image/webp', '23120', '2023-08-24 10:28:17', '2023-08-24 10:28:17'),
(147, 3, 'ideapad-slim-3i-arctic-grey-01-500x500.webp', 'public_storage', 'media/1rMG7Ff6tKG143zTAAnvfsNawb6VO7CrdXnAmqZ2.webp', 'webp', 'image/webp', '10280', '2023-08-24 10:30:07', '2023-08-24 10:30:07'),
(148, 3, 'ideapad-slim-3i-arctic-grey-02-500x500.webp', 'public_storage', 'media/EK1ztu8fGmJjZUTB7DhuP8CRJRIeuYFURr961v8A.webp', 'webp', 'image/webp', '6788', '2023-08-24 10:30:19', '2023-08-24 10:30:19'),
(149, 3, 'ideapad-slim-3i-arctic-grey-03-500x500.webp', 'public_storage', 'media/8X9goyS4F8x4Z9mpsHlKi1bLYP9ZcHWasn7AaGTi.webp', 'webp', 'image/webp', '6824', '2023-08-24 10:30:19', '2023-08-24 10:30:19'),
(150, 2, 'creator-z16-a11uet-03-500x500.jpg', 'public_storage', 'media/qofawKGoPbcqWAb78JR03nXChe0q2m8wujUHl1pP.jpg', 'jpg', 'image/jpeg', '24758', '2023-08-24 10:32:07', '2023-08-24 10:32:07'),
(151, 2, 'creator-z16-a11uet-05-500x500.jpg', 'public_storage', 'media/grv2fd1XiGhE7Kc3hPLsUDID6uUl8dhlg45cyU3b.jpg', 'jpg', 'image/jpeg', '9722', '2023-08-24 10:32:21', '2023-08-24 10:32:21'),
(152, 2, 'creator-z16-a11uet-02-500x500.jpg', 'public_storage', 'media/IkwBAlfRsfaygc7EwiEQ7qgoibHzjaHTba7INCUn.jpg', 'jpg', 'image/jpeg', '32444', '2023-08-24 10:32:21', '2023-08-24 10:32:21'),
(153, 2, 'creator-z16-a11uet-06-500x500.jpg', 'public_storage', 'media/2ma6JCn2OgDzcbrFCA3peDuEWvnGANY86IaHD0bb.jpg', 'jpg', 'image/jpeg', '20589', '2023-08-24 10:32:22', '2023-08-24 10:32:22'),
(154, 3, 'gf63-thin-01-500x500.webp', 'public_storage', 'media/PjTKt4kVxlZkDbwjiLAUBcKvTcRndZANy5NFMZj0.webp', 'webp', 'image/webp', '10268', '2023-08-24 10:37:03', '2023-08-24 10:37:03'),
(155, 3, 'gf63-thin-03-500x500.jpg', 'public_storage', 'media/2d055f4NixO2nXPhvg5YlDwX1C13N5zvDAGlAtDE.jpg', 'jpg', 'image/jpeg', '13116', '2023-08-24 10:37:21', '2023-08-24 10:37:21'),
(156, 3, 'gf63-thin-02-500x500.jpg', 'public_storage', 'media/CBlQ4exkTlNJBYmGP4N7559smgzJfZ9CqcpQ7oJr.jpg', 'jpg', 'image/jpeg', '14458', '2023-08-24 10:37:21', '2023-08-24 10:37:21'),
(157, 3, 'gf63-thin-04-500x500.jpg', 'public_storage', 'media/1BaaAASvScwce8MPke3e2RIaIarpYczFNWVjfIGC.jpg', 'jpg', 'image/jpeg', '16251', '2023-08-24 10:37:21', '2023-08-24 10:37:21'),
(158, 3, 'gf63-thin-05-500x500.jpg', 'public_storage', 'media/EyYAdhcmhWCzra9eYaCSEvJfetsgsPdU5iTxWopi.jpg', 'jpg', 'image/jpeg', '27704', '2023-08-24 10:37:22', '2023-08-24 10:37:22'),
(159, 2, 'prelude-n41-pro-01-500x500 (1).webp', 'public_storage', 'media/Wt8FfFXeOzFt8AfQAi9LFwcFdsN8v3T3UUBhHU7U.webp', 'webp', 'image/webp', '13672', '2023-08-24 10:39:38', '2023-08-24 10:39:38'),
(160, 2, 'prelude-n41-pro-04-500x500 (1).webp', 'public_storage', 'media/tRiZrksGCubRxkpu6dfU0DrzDihHC7SZhOMLufx9.webp', 'webp', 'image/webp', '12936', '2023-08-24 10:39:52', '2023-08-24 10:39:52'),
(161, 2, 'prelude-n41-pro-03-500x500 (1).webp', 'public_storage', 'media/hq9AMbr3oQ57kvdoogMORamg5IJJzvFC0m6kmu33.webp', 'webp', 'image/webp', '5990', '2023-08-24 10:39:52', '2023-08-24 10:39:52'),
(162, 2, 'prelude-n41-pro-02-500x500 (1).webp', 'public_storage', 'media/WRDp0kCzN6fBkzfCiBeutj60nEfI0HrU9w8by8Lp.webp', 'webp', 'image/webp', '11722', '2023-08-24 10:39:52', '2023-08-24 10:39:52'),
(163, 2, 'ideapad-1-15ada7-04-500x500 (1).webp', 'public_storage', 'media/kgoDvTY6r4tkpvsSDOVC22ubWiYMxWRFQoUhJy1s.webp', 'webp', 'image/webp', '22718', '2023-08-24 10:43:44', '2023-08-24 10:43:44'),
(164, 2, 'ideapad-1-15ada7-05-500x500.webp', 'public_storage', 'media/5XOFk93NmKlQuw9Blc3hbsnuqLhuztulVHVyMDjB.webp', 'webp', 'image/webp', '5474', '2023-08-24 10:43:58', '2023-08-24 10:43:58'),
(165, 2, 'ideapad-1-15ada7-03-500x500 (1).webp', 'public_storage', 'media/UUD88uurNxaiXTvlPyGwWo0PHiwte2xp81ar6Svh.webp', 'webp', 'image/webp', '6928', '2023-08-24 10:43:58', '2023-08-24 10:43:58'),
(166, 2, 'ideapad-1-15ada7-01-500x500 (1).webp', 'public_storage', 'media/Lt7RrNnPzVODScRz0K5a1Xle2oYYyH86vbwMADse.webp', 'webp', 'image/webp', '9170', '2023-08-24 10:43:59', '2023-08-24 10:43:59'),
(167, 3, 'aspire-7-a715-42g-r2ne-01-500x500.webp', 'public_storage', 'media/Ily0UtaR6FX6iV1U36VOE0H5yzVXqRbECebWyXxz.webp', 'webp', 'image/webp', '18448', '2023-08-24 10:46:42', '2023-08-24 10:46:42'),
(168, 3, 'aspire-7-a715-42g-r2ne-02-500x500.webp', 'public_storage', 'media/rNgdcI9PmWXKAGu0gb2Ce3KCChalaz8ASjAjM690.webp', 'webp', 'image/webp', '15490', '2023-08-24 10:46:55', '2023-08-24 10:46:55'),
(169, 3, 'aspire-7-a715-42g-r2ne-03-500x500.webp', 'public_storage', 'media/O2hrbkkPg7doxbLCPuQZ8haG22CmEuEi43nXwgOZ.webp', 'webp', 'image/webp', '15536', '2023-08-24 10:46:55', '2023-08-24 10:46:55'),
(170, 3, 'aspire-7-a715-42g-r2ne-04-500x500.webp', 'public_storage', 'media/c3kZMDbhkbnT2TXbccEWEvyBEe0CXpPgYwAGooN8.webp', 'webp', 'image/webp', '10206', '2023-08-24 10:46:56', '2023-08-24 10:46:56'),
(171, 1, 'r28gsyypi1oT531dU1MY1EjSskTWQbRIm7OHyTCl.png', 'public_storage', 'media/pJmbh1s714pjnZwcnnivEsrVqZaHFzYqcNjqoNRV.png', 'png', 'image/png', '4483', '2023-08-24 10:52:51', '2023-08-24 10:52:51'),
(172, 1, 'sYz5yv4PFARhTermBT1eIeQFM1kbKgLLZFPwq0XM.jpeg', 'public_storage', 'media/qE6QDFFXRTSTSRBv9YcQDDdNleDxOUYjDZikJkzR.jpg', 'jpg', 'image/jpeg', '17637', '2023-08-26 05:32:11', '2023-08-26 05:32:11'),
(173, 1, 'kTJZ8JjEO16NYuj28aN9f88c1SKIm9ELvYOE8pvC.png', 'public_storage', 'media/JFfowCFJle9IUOueK15QAl5i9yFjA18PFequ5xby.png', 'png', 'image/png', '115448', '2023-08-26 06:10:11', '2023-08-26 06:10:11'),
(174, 1, '5siKhRlEDQFmbiJRwCNBW3rDsbG7m1r2PibvtNeF.png', 'public_storage', 'media/4kXlxwtdQH4vkVm93Qt0NfUjY7Ke7i2eHQqlUboX.png', 'png', 'image/png', '50693', '2023-08-26 06:11:59', '2023-08-26 06:11:59'),
(175, 1, 'yl6rNkswnKQzh7mouQ0HpagRLwBpnq3Mt9LZMRak.png', 'public_storage', 'media/EFiEPXXCIep8LXQqY0wfr95qL2tB24syz0fBrvVr.png', 'png', 'image/png', '26118', '2023-08-26 06:12:02', '2023-08-26 06:12:02'),
(176, 2, 'athlon-200ge-desktop-pc-001-500x500.webp', 'public_storage', 'media/np75dr7uhSY0h4q2M5ZbzKtdbyq4mzfpEICuQIZi.webp', 'webp', 'image/webp', '24206', '2023-08-26 06:33:09', '2023-08-26 06:33:09'),
(177, 2, 'ryzen-5-4600g-desktop-pc-001-500x500.webp', 'public_storage', 'media/CEcMsxMH17xpmcSkD8gFmz0kZKDf2PBn320rMmcj.webp', 'webp', 'image/webp', '24996', '2023-08-26 06:45:16', '2023-08-26 06:45:16'),
(178, 2, 'ryzen-5-5600g-desktop-pc-00001-500x500.webp', 'public_storage', 'media/cyfs2Ka08VNj7bg2goKdcaSzGhPRs7CudACprOnu.webp', 'webp', 'image/webp', '20806', '2023-08-26 06:51:36', '2023-08-26 06:51:36'),
(179, 3, 'pixel-6a-sage-01-500x500.webp', 'public_storage', 'media/pdydYFxpDVhXyQ4nHAAvwjdyHrTNS5KWdLXHDNZT.webp', 'webp', 'image/webp', '126312', '2023-08-26 06:52:33', '2023-08-26 06:52:33'),
(180, 3, 'pixel-6a-sage-03-500x500.webp', 'public_storage', 'media/iFhsedGJST8eIp1sw7HXPryljNoAHf5JrN3irCOR.webp', 'webp', 'image/webp', '70406', '2023-08-26 06:52:53', '2023-08-26 06:52:53'),
(181, 3, 'pixel-6a-sage-01-500x500.webp', 'public_storage', 'media/HFrYuH2JDG5r8iknbLAVWxuOgcyXSlHepob4nC3t.webp', 'webp', 'image/webp', '126312', '2023-08-26 06:52:53', '2023-08-26 06:52:53'),
(182, 2, 'core-i3-10100-desktop-pc-01-500x500.webp', 'public_storage', 'media/bbBN6pbDLHrWY40FQPJlwOZg77xotJSIODiEft1f.webp', 'webp', 'image/webp', '23792', '2023-08-26 07:02:15', '2023-08-26 07:02:15'),
(183, 3, 'galaxy-a14-01-500x500.webp', 'public_storage', 'media/mI8ada4j5j1umavaRTuews62GXecYLoTH8yKw36E.webp', 'webp', 'image/webp', '120046', '2023-08-26 07:03:42', '2023-08-26 07:03:42'),
(184, 3, 'galaxy-a14-green-500x500.webp', 'public_storage', 'media/xD4edeSdd7FRo5PihW5zupvlr46py3f4eqO5veR4.webp', 'webp', 'image/webp', '21724', '2023-08-26 07:04:11', '2023-08-26 07:04:11'),
(185, 3, 'galaxy-a14-red-500x500.webp', 'public_storage', 'media/R7b4SNLOsTWhQPfajGpZHAWzM4tG5PygweL2OLoV.webp', 'webp', 'image/webp', '185356', '2023-08-26 07:04:12', '2023-08-26 07:04:12'),
(186, 3, 'galaxy-a14-silver-500x500.webp', 'public_storage', 'media/EQhD8jSKGCq45MY5KLkehyJn4WWedaIl0KVX5kOq.webp', 'webp', 'image/webp', '21956', '2023-08-26 07:04:12', '2023-08-26 07:04:12'),
(187, 2, 'ryzen-5-5600g-desktop-pc-00001-500x500 (1).webp', 'public_storage', 'media/iSsMjWJGJr2Ra6cn5t1KGL06sbnae4bOqxT18Cm0.webp', 'webp', 'image/webp', '20806', '2023-08-26 07:05:08', '2023-08-26 07:05:08'),
(188, 2, 'ryzen-9-5900x-gaming-desktop-pc-0001-500x500.webp', 'public_storage', 'media/d4EuUl05specY7JhTOmvXDd17B3Ci2Kdaf0tuUxZ.webp', 'webp', 'image/webp', '23526', '2023-08-26 07:07:10', '2023-08-26 07:07:10'),
(189, 3, 'galaxy-f13-001-500x500.webp', 'public_storage', 'media/UTd2jkiZxGF1LuYSvm42KX3CuZOsm81oBN0E1Ahk.webp', 'webp', 'image/webp', '9134', '2023-08-26 07:08:58', '2023-08-26 07:08:58'),
(190, 3, 'galaxy-f13-nightsky-green-500x500 - Copy.webp', 'public_storage', 'media/UpnGKOMP00W8drfqwuAzp5RZRbjE0rfcWDc0B5DI.webp', 'webp', 'image/webp', '12000', '2023-08-26 07:09:22', '2023-08-26 07:09:22'),
(191, 3, 'galaxy-f13-sunrise-copper-500x500.webp', 'public_storage', 'media/JRyuPYYXOycBPASKotwgk6E92BNqE7e4JfjfGHLb.webp', 'webp', 'image/webp', '12130', '2023-08-26 07:09:23', '2023-08-26 07:09:23'),
(192, 2, 'ryzen-5-7600x-gaming-desktop-pc-0001-500x500.webp', 'public_storage', 'media/E6JmUazzrRfk3dHnqmSiBqxbFO8XwEEhlqV2E8On.webp', 'webp', 'image/webp', '17548', '2023-08-26 07:09:33', '2023-08-26 07:09:33'),
(193, 2, 'ryzen-5-7600x-gaming-desktop-pc-0001-500x500.webp', 'public_storage', 'media/Lmjc8apgBuWJ90svFV8veRlt9Wx00a1pQtTNyTBC.webp', 'webp', 'image/webp', '17548', '2023-08-26 07:11:06', '2023-08-26 07:11:06'),
(194, 2, 'ryzen-9-7950x-gaming-desktop-pc-0001-500x500.webp', 'public_storage', 'media/0zjBvq7XZbMM7pTChbaOUk6vQrkGWQxC3AwpuKe2.webp', 'webp', 'image/webp', '15230', '2023-08-26 07:12:30', '2023-08-26 07:12:30'),
(195, 2, 'ryzen-9-7950x-gaming-desktop-pc-0001-500x500.webp', 'public_storage', 'media/K4RltsPyFpnCDJlJNIQg9yjEjgfMv3zNTeN2V43b.webp', 'webp', 'image/webp', '15230', '2023-08-26 07:13:40', '2023-08-26 07:13:40'),
(196, 3, 'a77s-black-500x500.webp', 'public_storage', 'media/qwzf5YX0QgcNP2Nnysg82TYL8IX3JUuTS4qntEct.webp', 'webp', 'image/webp', '7626', '2023-08-26 07:14:57', '2023-08-26 07:14:57'),
(197, 2, 'ryzen-5-5500-gaming-desktop-pc-001-500x500.webp', 'public_storage', 'media/96dPo3ACJCoN41UvNUcpqMrfYqmdWUS8uCbgi8pm.webp', 'webp', 'image/webp', '28818', '2023-08-26 07:15:00', '2023-08-26 07:15:00'),
(198, 3, 'a77s-orange-500x500.webp', 'public_storage', 'media/NdPURiSLg5nSCj0tCymScYkbNVpInA19rpMj9rQB.webp', 'webp', 'image/webp', '7174', '2023-08-26 07:15:08', '2023-08-26 07:15:08'),
(199, 2, 'core-i5-10400-gigabyte-desktop-pc-01-500x500.webp', 'public_storage', 'media/G4MePBqb3WhfBoYUAMCeiZY5wCSOGAGufA4qGL1I.webp', 'webp', 'image/webp', '17220', '2023-08-26 07:20:38', '2023-08-26 07:20:38'),
(200, 3, 'f21s-pro-dawnlight-gold-500x500.webp', 'public_storage', 'media/pPFMsxWgbz7zRz9mT5EC8myn1pihHpM2evNS5WIS.webp', 'webp', 'image/webp', '7202', '2023-08-26 07:22:07', '2023-08-26 07:22:07'),
(201, 3, 'f21s-pro-dawnlight-gold-500x500.webp', 'public_storage', 'media/hoVCi613w9WNqlZWN6O4to434ERaHRJJmbCXmWl5.webp', 'webp', 'image/webp', '7202', '2023-08-26 07:22:27', '2023-08-26 07:22:27'),
(202, 2, 'ryzen-7-5700g-budget-desktop-pc-03-500x500.webp', 'public_storage', 'media/hH0utlv8k4zagtqNSPB3M3X7CHpYvTQNrtrd7b2N.webp', 'webp', 'image/webp', '27204', '2023-08-26 07:23:03', '2023-08-26 07:23:03'),
(203, 3, 'reno8-t-orange-500x500.webp', 'public_storage', 'media/oTtZL7jj0HU5VpdFNxMxgWr72OieWb1ttD7UEw9Y.webp', 'webp', 'image/webp', '8128', '2023-08-26 07:25:25', '2023-08-26 07:25:25'),
(204, 3, 'reno8-t-black-500x500.webp', 'public_storage', 'media/C3LwxhR73dBB2OTa9n5V71T9PH79UbPG2k1yLWeZ.webp', 'webp', 'image/webp', '7388', '2023-08-26 07:25:40', '2023-08-26 07:25:40'),
(205, 3, 'v25e-black-500x500.webp', 'public_storage', 'media/5fmei8IXGylD2qIzfkCn4aomTkpqRSmDbpSNo0HZ.webp', 'webp', 'image/webp', '9550', '2023-08-26 07:28:41', '2023-08-26 07:28:41'),
(206, 3, 'v25e-gold-500x500.webp', 'public_storage', 'media/bhwFKXTsIzONYzosh2j8pXNXfY64cMOEHyEUAav9.webp', 'webp', 'image/webp', '10048', '2023-08-26 07:28:52', '2023-08-26 07:28:52'),
(207, 2, 'ideacentre-3-01-500x500.jpg', 'public_storage', 'media/fAdgRuVOBeqjJY8aipRqMHZWZj1pB83K3YbZ1KsC.jpg', 'jpg', 'image/jpeg', '22925', '2023-08-26 07:31:15', '2023-08-26 07:31:15'),
(208, 2, 'ideacentre-3-02-500x500.jpg', 'public_storage', 'media/FnF8F2214I8CK5mSrx2doaAwQyxJ4Ot9MNkNvzOt.jpg', 'jpg', 'image/jpeg', '19779', '2023-08-26 07:31:42', '2023-08-26 07:31:42'),
(209, 2, 'ideacentre-3-03-500x500.jpg', 'public_storage', 'media/MF0U7uKCKevSZg8paWjrYWyJE0cjPvKUIDfgpERN.jpg', 'jpg', 'image/jpeg', '22158', '2023-08-26 07:31:43', '2023-08-26 07:31:43'),
(210, 3, 'v27e-lavender-500x500.webp', 'public_storage', 'media/OPDuYT5xBjRsyGX8spGtTpTBxTFtS48jkPiIwEJe.webp', 'webp', 'image/webp', '7674', '2023-08-26 07:34:45', '2023-08-26 07:34:45'),
(211, 3, 'v27e-black-500x500.webp', 'public_storage', 'media/9uEZ3qNkd8tm7F6ed6UutTZPcrrJZzt2omO3PLZ8.webp', 'webp', 'image/webp', '8386', '2023-08-26 07:34:57', '2023-08-26 07:34:57'),
(212, 3, 'v25-5g-blue-500x500.webp', 'public_storage', 'media/uf2eCPHOr9aMHWoQClb6ir4R0zkhQMQdcmfqEssX.webp', 'webp', 'image/webp', '11286', '2023-08-26 07:37:51', '2023-08-26 07:37:51'),
(213, 3, 'v25-5g-gold-500x500.webp', 'public_storage', 'media/F5f9sS3ZZF5H0H6TwDabCjGphy8UQL1gNcvP07oW.webp', 'webp', 'image/webp', '9966', '2023-08-26 07:37:59', '2023-08-26 07:37:59'),
(214, 2, 'kaiman-ex-g-01-500x500.jpg', 'public_storage', 'media/gXiHSp8s8l8Ub8Dwh8PacLOy7A1z7tcNnZfrGl80.jpg', 'jpg', 'image/jpeg', '21462', '2023-08-26 07:38:27', '2023-08-26 07:38:27'),
(215, 2, '280-pro-g9-01-500x500.webp', 'public_storage', 'media/Ku1lS2IskE1tH0uGdzIGcEhDRc5gsPhAEcvuo8ST.webp', 'webp', 'image/webp', '4070', '2023-08-26 07:42:01', '2023-08-26 07:42:01'),
(216, 3, 'realme-9-pro-plus-green-500x500.webp', 'public_storage', 'media/KzYWXm24jObSS0fGpp0shgY5TuHI8ubo2jxqMs8p.webp', 'webp', 'image/webp', '17598', '2023-08-26 07:42:05', '2023-08-26 07:42:05'),
(217, 2, '280-pro-g9-02-500x500.webp', 'public_storage', 'media/jw8ILvN3Q3E3deG8Tcag47KffKpNa1zlL3tQ765z.webp', 'webp', 'image/webp', '4272', '2023-08-26 07:42:11', '2023-08-26 07:42:11'),
(218, 3, 'realme-9-pro-plus-blue-500x500.webp', 'public_storage', 'media/6hNgl0OrxhG8fyUrnNrW9tLO0cRCIVijhT5gfXHS.webp', 'webp', 'image/webp', '19506', '2023-08-26 07:42:16', '2023-08-26 07:42:16'),
(219, 2, 'veriton-m200-h610-01-500x500.webp', 'public_storage', 'media/NYEopAuAnnSJhdTZPYGd17A09tmucS5M67D27Bao.webp', 'webp', 'image/webp', '4262', '2023-08-26 07:47:20', '2023-08-26 07:47:20'),
(220, 3, '11-green-500x500.webp', 'public_storage', 'media/UZRaYFVNDtpPzgh91q2uyziZZL4gfv28yJWPKi8O.webp', 'webp', 'image/webp', '10558', '2023-08-26 07:47:46', '2023-08-26 07:47:46'),
(221, 3, '11-black-500x500.webp', 'public_storage', 'media/bClzC6niUfcuJgGPMZklDkBysGCC6z11wEcKkL1w.webp', 'webp', 'image/webp', '10538', '2023-08-26 07:47:57', '2023-08-26 07:47:57'),
(222, 2, 'veriton-m200-h610-01-500x500 (1).webp', 'public_storage', 'media/8qJNTKrOvBq7O4coMUKa85osUP7eLFL4mwUl2BYT.webp', 'webp', 'image/webp', '4262', '2023-08-26 07:51:31', '2023-08-26 07:51:31'),
(223, 3, 'oneplus-nord-ce-3-lite-5g-green-500x500.webp', 'public_storage', 'media/g4LbO9BTn6O3749zXjUkT4mc7NIWTHuKvRuhd6tO.webp', 'webp', 'image/webp', '8838', '2023-08-26 07:51:59', '2023-08-26 07:51:59'),
(224, 3, 'oneplus-nord-ce-3-lite-5g-black-500x500.webp', 'public_storage', 'media/vPbRaA2WGOIVX7ntz4LyfeEk9bYxU6Pb1Xmoad77.webp', 'webp', 'image/webp', '9626', '2023-08-26 07:52:09', '2023-08-26 07:52:09'),
(225, 2, 'mag-infinite-10th-01-500x500.webp', 'public_storage', 'media/fUb5K496Flc7YjDYQYamUtdmEgJvzkObghKsPPw5.webp', 'webp', 'image/webp', '6896', '2023-08-26 07:55:28', '2023-08-26 07:55:28'),
(226, 2, 'mag-infinite-10th-02-500x500.webp', 'public_storage', 'media/xtYctrh0bI3gVgN3cKyyiAINJC44oDLQPhdEAESm.webp', 'webp', 'image/webp', '7772', '2023-08-26 07:55:36', '2023-08-26 07:55:36'),
(227, 2, 'mag-infinite-10th-01-500x500.webp', 'public_storage', 'media/WqT1EUvyWcug2ATrlGqj8H4R5JbZauHQso4J0bVY.webp', 'webp', 'image/webp', '6896', '2023-08-26 07:58:01', '2023-08-26 07:58:01'),
(228, 2, 'mag-infinite-10th-02-500x500.webp', 'public_storage', 'media/96GweRLwgTCvgzdS2BtuDhfR7KRftuWDJHsRTzW9.webp', 'webp', 'image/webp', '7772', '2023-08-26 07:58:10', '2023-08-26 07:58:10'),
(229, 2, 'ryzen-5-5600g-eid-special-desktop-pc-01-500x500.webp', 'public_storage', 'media/AVRZvibfwxVJcU9OQyp6oYJg7oMaI8PQM5m4Mc69.webp', 'webp', 'image/webp', '23764', '2023-08-26 08:00:16', '2023-08-26 08:00:16'),
(230, 3, 'galaxy-m53-5g-001-500x500.webp', 'public_storage', 'media/2l1jcgjXY2SbnIpkCFi8mSSXBLtTAWQHrHmrZ1Uy.webp', 'webp', 'image/webp', '11420', '2023-08-26 08:04:34', '2023-08-26 08:04:34'),
(231, 3, 'galaxy-m53-5g-brown-500x500.webp', 'public_storage', 'media/5iXp5GXx6EebKMAvKdmWcIjunr0jEJ9xETGzw86Y.webp', 'webp', 'image/webp', '17170', '2023-08-26 08:04:44', '2023-08-26 08:04:44'),
(232, 3, 'galaxy-m53-5g-green-500x500.webp', 'public_storage', 'media/VnZ7FdXeUZThjW39cak82255UUr2AXqK2mNauaTx.webp', 'webp', 'image/webp', '17366', '2023-08-26 08:04:44', '2023-08-26 08:04:44'),
(233, 2, 'core-i7-10700-custom-desktop-pc-0001-500x500.webp', 'public_storage', 'media/hum4cGPu6jMLBnmv96u9wp7qbarcUBYmAwZx7obG.webp', 'webp', 'image/webp', '30048', '2023-08-26 08:05:05', '2023-08-26 08:05:05'),
(234, 2, 'core-i7-13700k-gaming-desktop-pc-0001-500x500.webp', 'public_storage', 'media/UugMgF5vAP8q2rFJl1O5qsvCRKqOXUIVS98yHwbh.webp', 'webp', 'image/webp', '22932', '2023-08-26 08:08:40', '2023-08-26 08:08:40'),
(235, 3, 'galaxy-a52s-5g-01-500x500.webp', 'public_storage', 'media/2tVyz1BIpha12qvJNdkaF5cH3e9BLlUM9Lmw1lax.webp', 'webp', 'image/webp', '105174', '2023-08-26 08:09:43', '2023-08-26 08:09:43'),
(236, 3, 'galaxy-a52s-5g-black-500x500.webp', 'public_storage', 'media/KmIoz8t20NidnFtmhqU0OnzwJp1Uj9pXFsGh1KLt.webp', 'webp', 'image/webp', '141678', '2023-08-26 08:09:58', '2023-08-26 08:09:58'),
(237, 3, 'galaxy-a52s-5g-mint-500x500.webp', 'public_storage', 'media/nc0CXYuRGxSFFZa8pl9imuxZFZy0GVL87KRUlcmQ.webp', 'webp', 'image/webp', '194810', '2023-08-26 08:09:59', '2023-08-26 08:09:59'),
(238, 3, 'galaxy-a52s-5g-white-500x500.webp', 'public_storage', 'media/s7G1SIhiOMM8KQ1g0YGfqqWPVO61H2Cib6ZQrcXc.webp', 'webp', 'image/webp', '145696', '2023-08-26 08:09:59', '2023-08-26 08:09:59'),
(239, 2, 'core-i9-13900k-gaming-desktop-pc-0001-500x500.webp', 'public_storage', 'media/mJS3xidnwkecj5SUSomAZE2z6RVMtLqj6TBHRX2q.webp', 'webp', 'image/webp', '24754', '2023-08-26 08:11:36', '2023-08-26 08:11:36'),
(240, 3, 'p50-pro-gold-500x500.webp', 'public_storage', 'media/UYdhKXDc1RVzAP1R5wswWOuirCbBttIlaKnAPtaA.webp', 'webp', 'image/webp', '122010', '2023-08-26 08:13:13', '2023-08-26 08:13:13'),
(241, 3, 'p50-pro-black-500x500.webp', 'public_storage', 'media/riPXdbefa8LMt23pv9u4ZpNhG8mPREdtOd4YezEN.webp', 'webp', 'image/webp', '132042', '2023-08-26 08:13:23', '2023-08-26 08:13:23'),
(242, 2, 'core-i9-12900k-gaming-desktop-pc-0001-500x500.webp', 'public_storage', 'media/i293OWKMFrOW8hdNKcyhcUSAsU038bjFICCSprx9.webp', 'webp', 'image/webp', '22410', '2023-08-26 08:16:06', '2023-08-26 08:16:06'),
(243, 3, 'v23e-sunshine-gold-500x500.webp', 'public_storage', 'media/opraoMocRZpN4HRcQ0f2YC7MLHS5OmCwaH0we3DZ.webp', 'webp', 'image/webp', '8742', '2023-08-26 08:16:26', '2023-08-26 08:16:26'),
(244, 3, 'v23e-sunshine-coast-500x500.webp', 'public_storage', 'media/xtXVEG1ZCTvcvLXWw5DU99yapQjR2LnOzWVXBKnq.webp', 'webp', 'image/webp', '9606', '2023-08-26 08:16:39', '2023-08-26 08:16:39'),
(245, 2, 'core-i7-13700k-gaming-desktop-pc-0001-500x500 (1).webp', 'public_storage', 'media/OqME3xbm7XBbrBvDoEDbFhZXbYQ3zo0iIuk8VZkH.webp', 'webp', 'image/webp', '22932', '2023-08-26 08:19:16', '2023-08-26 08:19:16'),
(246, 3, 'iphone-14-pro-max-deep-purple-01-500x500.webp', 'public_storage', 'media/KQ81fQSCOR9VbuiZjrlH0Ani2KwLjgLchC4GAKHI.webp', 'webp', 'image/webp', '7354', '2023-08-26 08:38:15', '2023-08-26 08:38:15'),
(247, 3, 'iphone-14-pro-max-deep-purple-01-500x500.webp', 'public_storage', 'media/3eSXuLK9D9AMKMKrjICHDJcq29zYK1v7eXgc9IW3.webp', 'webp', 'image/webp', '7354', '2023-08-26 08:41:57', '2023-08-26 08:41:57'),
(248, 3, 'iphone-14-pro-max-deep-purple-02-500x500.webp', 'public_storage', 'media/vO00MuKiGXbrMR4clI3mpxEhJeQp5aLrd9JvCqLZ.webp', 'webp', 'image/webp', '4630', '2023-08-26 08:42:07', '2023-08-26 08:42:07'),
(249, 3, 'iphone-14-pro-max-deep-purple-03-500x500.webp', 'public_storage', 'media/s3J6N6SjERN5UGjWgW3O8IEWEh9o14NfEem1v1p0.webp', 'webp', 'image/webp', '10804', '2023-08-26 08:42:08', '2023-08-26 08:42:08'),
(250, 1, 'kSSkGodUfAKYy1UVZ8CicO8oay5PKO4L3DdEE9Tw.png', 'public_storage', 'media/fiGxfbfK91EwwcpxnRyTkxd9MSRSjEkZ4YY5Ob1Z.png', 'png', 'image/png', '36455', '2023-08-26 09:28:13', '2023-08-26 09:28:13'),
(251, 1, 'VVyvSfw4dAZI57qelPofORurzNNc7rDlsxVbTO5m.png', 'public_storage', 'media/jAH9YH7lrXufvXaa0NNbFGS7T4K2yzujjDWaktna.png', 'png', 'image/png', '23812', '2023-08-26 09:28:16', '2023-08-26 09:28:16'),
(252, 1, 'kRb5N2mGVnso21KKTsxenE4GuH3fjej5r2m8vY8V.png', 'public_storage', 'media/mmzuvZkft5T389i0rqqLVW3NWmkQJAZTyncbmPWX.png', 'png', 'image/png', '61739', '2023-08-26 09:35:35', '2023-08-26 09:35:35'),
(253, 1, 'jZG1juhijMhWSrn8B4jgsX5x4Vb8dOTdZTtGNACo.png', 'public_storage', 'media/agfw9HcRh0ikVWF2uKg1842vscewXMRgyx3HhJVC.png', 'png', 'image/png', '2732', '2023-08-26 10:06:44', '2023-08-26 10:06:44'),
(254, 1, 'nshpkDL124reDq8apPXBcpVrnV8ABDzC88R5gg3K.png', 'public_storage', 'media/PxHsBbVfUQP9ddQgIYR9ODcoYWt6U85CiAHlxAcB.png', 'png', 'image/png', '1994', '2023-08-26 10:07:08', '2023-08-26 10:07:08');
INSERT INTO `files` (`id`, `user_id`, `filename`, `disk`, `path`, `extension`, `mime`, `size`, `created_at`, `updated_at`) VALUES
(255, 1, 'SbgS1CCecSpvvnBeBmG6xP49q2NymXQzJpiHbMAi.png', 'public_storage', 'media/f0AVnKX1b9PclvWwmUKlDTYbXHLc8lduT9d0JOfb.png', 'png', 'image/png', '6102', '2023-08-26 10:07:35', '2023-08-26 10:07:35'),
(256, 1, 'JwT1Wydv8ADuSHBh7ZtCaWLkuO2Jy9WYZRovQW1W.png', 'public_storage', 'media/8InpozDbqjb4KR57ajVCyWmuTLCL9yPXMyDMItRy.png', 'png', 'image/png', '1907', '2023-08-26 10:07:57', '2023-08-26 10:07:57'),
(257, 1, 'j2WP3lfi8JTanXQsxrNDclJAb2RHKxBOtlQwlK2g.png', 'public_storage', 'media/XiSCCboGhx3z12czTPUX5LgvDbdudNzT7dOrU6zc.png', 'png', 'image/png', '2008', '2023-08-26 10:08:21', '2023-08-26 10:08:21'),
(258, 1, '8bmlnpJluQBwAAJolyS708652aY6Kj8dEmYQ7woo.png', 'public_storage', 'media/shdwDHtCeM6wRGgewZr9fSvpz3XSu5s598laI4KI.png', 'png', 'image/png', '1456', '2023-08-26 10:08:43', '2023-08-26 10:08:43'),
(259, 1, 'rCfwklCfNTBKz4JGeloPqqI7BTS8PdYibzEkB8mS.png', 'public_storage', 'media/uLtATvFrhZr1Zb8gzoSezYddiIEmxaLXPv7afOf7.png', 'png', 'image/png', '2879', '2023-08-26 10:09:17', '2023-08-26 10:09:17'),
(260, 1, 'JnH5uK3QY3mOamQ8NsHCbtqj0xULHsjOTHtHTbeO.png', 'public_storage', 'media/CW2iTtc9qAAgK6tmkhzkiPyzSXNOZTW3AwrfSRpA.png', 'png', 'image/png', '1790', '2023-08-26 10:09:45', '2023-08-26 10:09:45'),
(261, 1, 'cpX550XTke137wP71XC4bd6vGf68l6emVynXq3HJ.png', 'public_storage', 'media/s32h39Qxb5Onm6PxZ3iC3fGM6yK1m21bLfoOJOqh.png', 'png', 'image/png', '1454', '2023-08-26 10:11:35', '2023-08-26 10:11:35'),
(262, 1, 'Quysi8IloZADWNe2ZxeK98PN4FgHpoQWBXSnhlQV.png', 'public_storage', 'media/hAs8CnJ2k8LWKMar0hhO5Oh3DtMYJOnu7ikiSyGx.png', 'png', 'image/png', '2853', '2023-08-26 10:11:35', '2023-08-26 10:11:35'),
(263, 1, 'P9UF8sprnzBNqEnbAd2j82UA4b0fzk85uIZp4H4s.png', 'public_storage', 'media/gE67rZTM0d6f35Nst5TbjWqX1srfkuTNrXsLl57M.png', 'png', 'image/png', '2281', '2023-08-26 10:11:36', '2023-08-26 10:11:36'),
(264, 1, '8DfT3LNUhYbei3YrhJ1FscMVKiPPQi43LdCY29Am.png', 'public_storage', 'media/QBIVSYHCDnL2ZwI5ssQ5WGLG0AFUQ4rAEiVxtxmR.png', 'png', 'image/png', '5876', '2023-08-26 10:11:37', '2023-08-26 10:11:37'),
(265, 1, 'vW30vojYODrqYBs9x3ToIpBHm1zyrKU7ZhmD9SQG.png', 'public_storage', 'media/GaGqmjuQJ8OBv2dLBgl6OvzTtRq1FrYiCvmc0hbN.png', 'png', 'image/png', '3193', '2023-08-26 10:11:37', '2023-08-26 10:11:37'),
(266, 1, 'HSvr36xBFke3Jh6mbDaeAG8jJZ4RH78ousrLr1i2.png', 'public_storage', 'media/mBbB9HbvA5XAKWaGoemmMyaAjB4n2bydnGpiClLc.png', 'png', 'image/png', '4677', '2023-08-26 10:11:38', '2023-08-26 10:11:38'),
(267, 1, '2cZfkz85nXxlSTySz6R8m34u5UQLfiRQVyKjF8hm.png', 'public_storage', 'media/xjpR5BZDQMMlS5Dx3XUgo7QKy9mhxN9EcsK8VDgd.png', 'png', 'image/png', '4184', '2023-08-26 10:17:04', '2023-08-26 10:17:04'),
(268, 1, 'UAP07Ygha9iXNfG1Rh6DYWrwVQ3HfkuqetLaLc6M.jpeg', 'public_storage', 'media/A7AaM3gCWpS2g2vmrqjAC5MnerrjDnet9JhTBj9c.jpg', 'jpg', 'image/jpeg', '2358', '2023-08-26 10:18:17', '2023-08-26 10:18:17'),
(271, 1, 'lapitapi-2.png', 'public_storage', 'media/yjysW8IwXsnHFFxdXQhPNDebnMZoX6wZ3mUb6N5G.png', 'png', 'image/png', '1132', '2023-08-26 10:36:37', '2023-08-26 10:36:37'),
(274, 1, 'lapitapi-3.png', 'public_storage', 'media/k9x0L077vFlNZ8Cwd9z5lnOKekEm6V2tawV2boc0.png', 'png', 'image/png', '1448', '2023-08-26 10:41:14', '2023-08-26 10:41:14'),
(275, 1, 'lapitapi-50 (1).png', 'public_storage', 'media/pUJhtBZ2tyncOQ8DzqO8ATHVWhd1mAj1Mk08PsVQ.png', 'png', 'image/png', '320', '2023-08-26 10:44:43', '2023-08-26 10:44:43'),
(277, 1, 'desktop (1).png', 'public_storage', 'media/WNixVa0ScVV684p8c39ZF7Vv338FErnEQvchoCO6.png', 'png', 'image/png', '15787', '2023-08-27 04:42:04', '2023-08-27 04:42:04'),
(278, 1, 'Head-set.png', 'public_storage', 'media/iwhiZ55UYdSbbSndr5LP9mui6kSkAGToprn33iHR.png', 'png', 'image/png', '18239', '2023-08-27 04:43:02', '2023-08-27 04:43:02'),
(279, 1, 'Camera.png', 'public_storage', 'media/RFzwR9NCEfkQpFRIbzRFrJZiKKePECl8RsrIP7rt.png', 'png', 'image/png', '22870', '2023-08-27 04:44:19', '2023-08-27 04:44:19'),
(280, 1, 'AMD_Logo.png', 'public_storage', 'media/k0vf9gwgzb5YdU7IjKMLkkxgte3ZUyQodDWfWIaB.png', 'png', 'image/png', '5752', '2023-08-27 06:12:37', '2023-08-27 06:12:37'),
(281, 1, 'Walton.png', 'public_storage', 'media/6dq6Mg2EZwmFvk1C04N1x1zwylPE78YbeYy1ncbm.png', 'png', 'image/png', '20607', '2023-08-27 06:12:37', '2023-08-27 06:12:37'),
(282, 1, 'Oppo-logo.png', 'public_storage', 'media/dI6zHDgvQRWCWa3qw9gs6f9lx0TuXrPh43UGTYLv.png', 'png', 'image/png', '8881', '2023-08-27 06:12:38', '2023-08-27 06:12:38'),
(283, 1, 'Pixel.png', 'public_storage', 'media/y36V3NTZ5HW1LgSKjhOllLIiX77K4C7eJ4ZGjSko.png', 'png', 'image/png', '17269', '2023-08-27 06:12:38', '2023-08-27 06:12:38'),
(284, 1, 'Real-me.png', 'public_storage', 'media/6yn9MNfCweC08SjQE5d6AYxnqjKN5z90Vvwk2Ho7.png', 'png', 'image/png', '20285', '2023-08-27 06:12:39', '2023-08-27 06:12:39'),
(285, 1, 'vivo-png.png', 'public_storage', 'media/1TyeVYLdn345KfU9Qf6Gs80OX0V8J90XX90EmjxU.png', 'png', 'image/png', '27384', '2023-08-27 06:12:40', '2023-08-27 06:12:40');

-- --------------------------------------------------------

--
-- Table structure for table `flash_sales`
--

CREATE TABLE `flash_sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_sale_products`
--

CREATE TABLE `flash_sale_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `flash_sale_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `end_date` date NOT NULL,
  `price` decimal(18,4) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_sale_product_orders`
--

CREATE TABLE `flash_sale_product_orders` (
  `flash_sale_product_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_sale_translations`
--

CREATE TABLE `flash_sale_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `flash_sale_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `campaign_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-08-26 05:24:17', '2023-08-26 05:24:17'),
(2, 1, '2023-08-26 09:49:36', '2023-08-26 09:49:36');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `page_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(10) UNSIGNED DEFAULT NULL,
  `is_root` tinyint(1) NOT NULL DEFAULT 0,
  `is_fluid` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `parent_id`, `category_id`, `page_id`, `type`, `url`, `icon`, `target`, `position`, `is_root`, `is_fluid`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, NULL, 'URL', NULL, NULL, '_self', 0, 1, 0, 1, '2023-08-26 05:24:17', '2023-08-26 05:24:17'),
(2, 1, 1, 1, NULL, 'category', NULL, 'las la-car-battery', '_self', 0, 0, 0, 1, '2023-08-26 05:24:55', '2023-08-26 05:35:29'),
(3, 1, 1, 5, NULL, 'category', NULL, NULL, '_self', 2, 0, 0, 1, '2023-08-26 05:26:40', '2023-08-26 10:26:01'),
(4, 1, 1, 43, NULL, 'category', NULL, NULL, '_self', 3, 0, 0, 1, '2023-08-26 05:27:20', '2023-08-26 10:26:15'),
(5, 1, 1, 4, NULL, 'category', NULL, NULL, '_self', 1, 0, 0, 1, '2023-08-26 05:27:48', '2023-08-26 05:27:53'),
(6, 1, 1, 36, NULL, 'category', NULL, NULL, '_self', NULL, 0, 0, 1, '2023-08-26 05:28:16', '2023-08-26 10:26:17'),
(7, 1, 1, 29, NULL, 'category', NULL, NULL, '_self', NULL, 0, 0, 1, '2023-08-26 05:36:03', '2023-08-26 05:36:03'),
(8, 1, 1, 49, NULL, 'category', NULL, NULL, '_self', NULL, 0, 0, 1, '2023-08-26 05:36:23', '2023-08-26 05:36:30'),
(9, 1, 1, 2, NULL, 'category', NULL, NULL, '_self', NULL, 0, 0, 0, '2023-08-26 05:37:05', '2023-08-26 06:07:13'),
(10, 1, 1, 59, NULL, 'category', NULL, NULL, '_self', NULL, 0, 0, 1, '2023-08-26 05:53:59', '2023-08-26 10:26:35'),
(11, 1, 1, 76, NULL, 'category', NULL, NULL, '_self', NULL, 0, 0, 1, '2023-08-26 06:01:36', '2023-08-26 06:01:36'),
(12, 2, NULL, NULL, NULL, 'URL', NULL, NULL, '_self', 0, 1, 0, 1, '2023-08-26 09:49:36', '2023-08-26 09:49:36'),
(13, 2, 12, NULL, 1, 'page', NULL, NULL, '_self', 0, 0, 0, 1, '2023-08-26 09:59:17', '2023-08-26 10:01:15'),
(14, 2, 12, NULL, 2, 'page', NULL, NULL, '_self', 1, 0, 0, 1, '2023-08-26 09:59:37', '2023-08-26 10:01:15'),
(15, 2, 12, NULL, 3, 'page', NULL, NULL, '_self', 2, 0, 0, 1, '2023-08-26 10:00:04', '2023-08-26 10:01:15'),
(16, 2, 12, NULL, 5, 'page', NULL, NULL, '_self', 4, 0, 0, 1, '2023-08-26 10:00:20', '2023-08-26 10:01:16'),
(17, 2, 12, NULL, 4, 'page', NULL, NULL, '_self', 3, 0, 0, 1, '2023-08-26 10:01:11', '2023-08-26 10:01:16');

-- --------------------------------------------------------

--
-- Table structure for table `menu_item_translations`
--

CREATE TABLE `menu_item_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_item_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_item_translations`
--

INSERT INTO `menu_item_translations` (`id`, `menu_item_id`, `locale`, `name`) VALUES
(1, 1, 'bn_BD', 'root'),
(2, 1, 'en', 'root'),
(3, 2, 'en', 'Laptop'),
(4, 3, 'en', 'Desktop'),
(5, 4, 'en', 'Computer Accessories'),
(6, 5, 'en', 'Macbook'),
(7, 6, 'en', 'Mobile Accessories'),
(8, 7, 'en', 'Mobiles'),
(9, 8, 'en', 'Camera'),
(10, 9, 'en', 'Hot Brands'),
(11, 10, 'en', 'Monitors'),
(12, 11, 'en', 'Networking'),
(13, 12, 'bn_BD', 'root'),
(14, 12, 'en', 'root'),
(15, 13, 'en', 'About Us'),
(16, 14, 'en', 'Return Policy'),
(17, 15, 'en', 'Help & FAQ'),
(18, 16, 'en', 'Terms & Conditions'),
(19, 17, 'en', 'Privacy Policy');

-- --------------------------------------------------------

--
-- Table structure for table `menu_translations`
--

CREATE TABLE `menu_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_translations`
--

INSERT INTO `menu_translations` (`id`, `menu_id`, `locale`, `name`) VALUES
(1, 1, 'en', 'Primary Menu'),
(2, 2, 'en', 'Our Services');

-- --------------------------------------------------------

--
-- Table structure for table `meta_data`
--

CREATE TABLE `meta_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `entity_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meta_data`
--

INSERT INTO `meta_data` (`id`, `entity_type`, `entity_id`, `created_at`, `updated_at`) VALUES
(1, 'Modules\\Brand\\Entities\\Brand', 1, '2023-08-24 07:11:20', '2023-08-24 07:11:20'),
(2, 'Modules\\Product\\Entities\\Product', 1, '2023-08-24 07:17:21', '2023-08-24 07:17:21'),
(3, 'Modules\\Product\\Entities\\Product', 2, '2023-08-24 08:04:05', '2023-08-24 08:04:05'),
(4, 'Modules\\Product\\Entities\\Product', 3, '2023-08-24 08:44:35', '2023-08-24 08:44:35'),
(5, 'Modules\\Product\\Entities\\Product', 4, '2023-08-24 08:44:55', '2023-08-24 08:44:55'),
(6, 'Modules\\Brand\\Entities\\Brand', 2, '2023-08-24 08:53:10', '2023-08-24 08:53:10'),
(7, 'Modules\\Brand\\Entities\\Brand', 3, '2023-08-24 08:53:28', '2023-08-24 08:53:28'),
(8, 'Modules\\Brand\\Entities\\Brand', 4, '2023-08-24 08:53:40', '2023-08-24 08:53:40'),
(9, 'Modules\\Brand\\Entities\\Brand', 5, '2023-08-24 08:53:48', '2023-08-24 08:53:48'),
(10, 'Modules\\Brand\\Entities\\Brand', 6, '2023-08-24 08:54:01', '2023-08-24 08:54:01'),
(11, 'Modules\\Brand\\Entities\\Brand', 7, '2023-08-24 08:54:17', '2023-08-24 08:54:17'),
(12, 'Modules\\Brand\\Entities\\Brand', 8, '2023-08-24 08:54:27', '2023-08-24 08:54:27'),
(13, 'Modules\\Brand\\Entities\\Brand', 9, '2023-08-24 08:55:25', '2023-08-24 08:55:25'),
(14, 'Modules\\Brand\\Entities\\Brand', 10, '2023-08-24 08:56:01', '2023-08-24 08:56:01'),
(15, 'Modules\\Brand\\Entities\\Brand', 11, '2023-08-24 08:56:10', '2023-08-24 08:56:10'),
(16, 'Modules\\Brand\\Entities\\Brand', 12, '2023-08-24 08:56:19', '2023-08-24 08:56:19'),
(17, 'Modules\\Brand\\Entities\\Brand', 13, '2023-08-24 08:56:27', '2023-08-24 08:56:27'),
(18, 'Modules\\Brand\\Entities\\Brand', 14, '2023-08-24 08:56:43', '2023-08-24 08:56:43'),
(19, 'Modules\\Brand\\Entities\\Brand', 15, '2023-08-24 08:56:51', '2023-08-24 08:56:51'),
(20, 'Modules\\Brand\\Entities\\Brand', 16, '2023-08-24 08:56:58', '2023-08-24 08:56:58'),
(21, 'Modules\\Brand\\Entities\\Brand', 17, '2023-08-24 08:57:06', '2023-08-24 08:57:06'),
(22, 'Modules\\Brand\\Entities\\Brand', 18, '2023-08-24 08:57:12', '2023-08-24 08:57:12'),
(23, 'Modules\\Product\\Entities\\Product', 5, '2023-08-24 08:58:10', '2023-08-24 08:58:10'),
(24, 'Modules\\Product\\Entities\\Product', 6, '2023-08-24 09:05:47', '2023-08-24 09:05:47'),
(25, 'Modules\\Product\\Entities\\Product', 7, '2023-08-24 09:11:21', '2023-08-24 09:11:21'),
(26, 'Modules\\Product\\Entities\\Product', 8, '2023-08-24 09:15:33', '2023-08-24 09:15:33'),
(27, 'Modules\\Product\\Entities\\Product', 9, '2023-08-24 09:19:45', '2023-08-24 09:19:45'),
(28, 'Modules\\Product\\Entities\\Product', 10, '2023-08-24 09:20:40', '2023-08-24 09:20:40'),
(29, 'Modules\\Product\\Entities\\Product', 11, '2023-08-24 09:20:43', '2023-08-24 09:20:43'),
(30, 'Modules\\Product\\Entities\\Product', 12, '2023-08-24 09:24:40', '2023-08-24 09:24:40'),
(31, 'Modules\\Product\\Entities\\Product', 13, '2023-08-24 09:25:05', '2023-08-24 09:25:05'),
(32, 'Modules\\Product\\Entities\\Product', 14, '2023-08-24 09:25:16', '2023-08-24 09:25:16'),
(33, 'Modules\\Product\\Entities\\Product', 15, '2023-08-24 09:30:52', '2023-08-24 09:30:52'),
(34, 'Modules\\Product\\Entities\\Product', 16, '2023-08-24 09:31:28', '2023-08-24 09:31:28'),
(35, 'Modules\\Product\\Entities\\Product', 17, '2023-08-24 09:32:39', '2023-08-24 09:32:39'),
(36, 'Modules\\Product\\Entities\\Product', 18, '2023-08-24 09:35:34', '2023-08-24 09:35:34'),
(37, 'Modules\\Product\\Entities\\Product', 19, '2023-08-24 09:36:07', '2023-08-24 09:36:07'),
(38, 'Modules\\Product\\Entities\\Product', 20, '2023-08-24 09:37:00', '2023-08-24 09:37:00'),
(39, 'Modules\\Product\\Entities\\Product', 21, '2023-08-24 09:40:55', '2023-08-24 09:40:55'),
(40, 'Modules\\Product\\Entities\\Product', 22, '2023-08-24 09:43:01', '2023-08-24 09:43:01'),
(41, 'Modules\\Product\\Entities\\Product', 23, '2023-08-24 09:46:42', '2023-08-24 09:46:42'),
(42, 'Modules\\Product\\Entities\\Product', 24, '2023-08-24 09:46:46', '2023-08-24 09:46:46'),
(43, 'Modules\\Product\\Entities\\Product', 25, '2023-08-24 09:51:47', '2023-08-24 09:51:47'),
(44, 'Modules\\Product\\Entities\\Product', 26, '2023-08-24 09:54:26', '2023-08-24 09:54:26'),
(45, 'Modules\\Product\\Entities\\Product', 27, '2023-08-24 09:59:23', '2023-08-24 09:59:23'),
(46, 'Modules\\Product\\Entities\\Product', 28, '2023-08-24 10:01:44', '2023-08-24 10:01:44'),
(47, 'Modules\\Product\\Entities\\Product', 29, '2023-08-24 10:04:57', '2023-08-24 10:04:57'),
(48, 'Modules\\Product\\Entities\\Product', 30, '2023-08-24 10:05:28', '2023-08-24 10:05:28'),
(49, 'Modules\\Product\\Entities\\Product', 31, '2023-08-24 10:10:48', '2023-08-24 10:10:48'),
(50, 'Modules\\Product\\Entities\\Product', 32, '2023-08-24 10:10:58', '2023-08-24 10:10:58'),
(51, 'Modules\\Product\\Entities\\Product', 33, '2023-08-24 10:16:07', '2023-08-24 10:16:07'),
(52, 'Modules\\Product\\Entities\\Product', 34, '2023-08-24 10:16:31', '2023-08-24 10:16:31'),
(53, 'Modules\\Product\\Entities\\Product', 35, '2023-08-24 10:20:05', '2023-08-24 10:20:05'),
(54, 'Modules\\Product\\Entities\\Product', 36, '2023-08-24 10:25:36', '2023-08-24 10:25:36'),
(55, 'Modules\\Product\\Entities\\Product', 37, '2023-08-24 10:27:51', '2023-08-24 10:27:51'),
(56, 'Modules\\Product\\Entities\\Product', 38, '2023-08-24 10:30:25', '2023-08-24 10:30:25'),
(57, 'Modules\\Product\\Entities\\Product', 39, '2023-08-24 10:32:53', '2023-08-24 10:32:53'),
(58, 'Modules\\Product\\Entities\\Product', 40, '2023-08-24 10:34:41', '2023-08-24 10:34:41'),
(59, 'Modules\\Brand\\Entities\\Brand', 19, '2023-08-24 10:38:03', '2023-08-24 10:38:03'),
(60, 'Modules\\Product\\Entities\\Product', 41, '2023-08-24 10:40:43', '2023-08-24 10:40:43'),
(61, 'Modules\\Product\\Entities\\Product', 42, '2023-08-24 10:41:33', '2023-08-24 10:41:33'),
(62, 'Modules\\Product\\Entities\\Product', 43, '2023-08-24 10:45:48', '2023-08-24 10:45:48'),
(63, 'Modules\\Product\\Entities\\Product', 44, '2023-08-24 10:48:46', '2023-08-24 10:48:46'),
(64, 'Modules\\Product\\Entities\\Product', 45, '2023-08-26 06:33:57', '2023-08-26 06:33:57'),
(65, 'Modules\\Brand\\Entities\\Brand', 20, '2023-08-26 06:34:43', '2023-08-26 06:34:43'),
(66, 'Modules\\Product\\Entities\\Product', 46, '2023-08-26 06:47:08', '2023-08-26 06:47:08'),
(67, 'Modules\\Product\\Entities\\Product', 47, '2023-08-26 06:52:44', '2023-08-26 06:52:44'),
(68, 'Modules\\Product\\Entities\\Product', 48, '2023-08-26 06:57:06', '2023-08-26 06:57:06'),
(69, 'Modules\\Product\\Entities\\Product', 49, '2023-08-26 06:57:08', '2023-08-26 06:57:08'),
(70, 'Modules\\Brand\\Entities\\Brand', 21, '2023-08-26 06:58:25', '2023-08-26 06:58:25'),
(71, 'Modules\\Product\\Entities\\Product', 50, '2023-08-26 07:03:20', '2023-08-26 07:03:20'),
(72, 'Modules\\Brand\\Entities\\Brand', 22, '2023-08-26 07:03:48', '2023-08-26 07:03:48'),
(73, 'Modules\\Product\\Entities\\Product', 51, '2023-08-26 07:06:53', '2023-08-26 07:06:53'),
(74, 'Modules\\Product\\Entities\\Product', 52, '2023-08-26 07:08:17', '2023-08-26 07:08:17'),
(75, 'Modules\\Product\\Entities\\Product', 53, '2023-08-26 07:10:42', '2023-08-26 07:10:42'),
(76, 'Modules\\Product\\Entities\\Product', 54, '2023-08-26 07:11:44', '2023-08-26 07:11:44'),
(77, 'Modules\\Product\\Entities\\Product', 55, '2023-08-26 07:13:47', '2023-08-26 07:13:47'),
(78, 'Modules\\Product\\Entities\\Product', 56, '2023-08-26 07:16:22', '2023-08-26 07:16:22'),
(79, 'Modules\\Brand\\Entities\\Brand', 23, '2023-08-26 07:17:17', '2023-08-26 07:17:17'),
(80, 'Modules\\Product\\Entities\\Product', 57, '2023-08-26 07:17:57', '2023-08-26 07:17:57'),
(81, 'Modules\\Product\\Entities\\Product', 58, '2023-08-26 07:21:40', '2023-08-26 07:21:40'),
(82, 'Modules\\Product\\Entities\\Product', 59, '2023-08-26 07:23:17', '2023-08-26 07:23:17'),
(83, 'Modules\\Product\\Entities\\Product', 60, '2023-08-26 07:24:04', '2023-08-26 07:24:04'),
(84, 'Modules\\Product\\Entities\\Product', 61, '2023-08-26 07:26:38', '2023-08-26 07:26:38'),
(85, 'Modules\\Product\\Entities\\Product', 62, '2023-08-26 07:30:29', '2023-08-26 07:30:29'),
(86, 'Modules\\Brand\\Entities\\Brand', 24, '2023-08-26 07:30:53', '2023-08-26 07:30:53'),
(87, 'Modules\\Product\\Entities\\Product', 63, '2023-08-26 07:35:25', '2023-08-26 07:35:25'),
(88, 'Modules\\Product\\Entities\\Product', 64, '2023-08-26 07:35:45', '2023-08-26 07:35:45'),
(89, 'Modules\\Product\\Entities\\Product', 65, '2023-08-26 07:38:48', '2023-08-26 07:38:48'),
(90, 'Modules\\Product\\Entities\\Product', 66, '2023-08-26 07:39:36', '2023-08-26 07:39:36'),
(91, 'Modules\\Brand\\Entities\\Brand', 25, '2023-08-26 07:40:16', '2023-08-26 07:40:16'),
(92, 'Modules\\Product\\Entities\\Product', 67, '2023-08-26 07:44:13', '2023-08-26 07:44:13'),
(93, 'Modules\\Product\\Entities\\Product', 68, '2023-08-26 07:44:15', '2023-08-26 07:44:15'),
(94, 'Modules\\Product\\Entities\\Product', 69, '2023-08-26 07:48:39', '2023-08-26 07:48:39'),
(95, 'Modules\\Product\\Entities\\Product', 70, '2023-08-26 07:48:52', '2023-08-26 07:48:52'),
(96, 'Modules\\Product\\Entities\\Product', 71, '2023-08-26 07:52:47', '2023-08-26 07:52:47'),
(97, 'Modules\\Product\\Entities\\Product', 72, '2023-08-26 07:53:06', '2023-08-26 07:53:06'),
(98, 'Modules\\Product\\Entities\\Product', 73, '2023-08-26 07:57:42', '2023-08-26 07:57:42'),
(99, 'Modules\\Product\\Entities\\Product', 74, '2023-08-26 08:02:11', '2023-08-26 08:02:11'),
(100, 'Modules\\Product\\Entities\\Product', 75, '2023-08-26 08:05:24', '2023-08-26 08:05:24'),
(101, 'Modules\\Product\\Entities\\Product', 76, '2023-08-26 08:07:10', '2023-08-26 08:07:10'),
(102, 'Modules\\Product\\Entities\\Product', 77, '2023-08-26 08:09:44', '2023-08-26 08:09:44'),
(103, 'Modules\\Product\\Entities\\Product', 78, '2023-08-26 08:10:26', '2023-08-26 08:10:26'),
(104, 'Modules\\Product\\Entities\\Product', 79, '2023-08-26 08:13:03', '2023-08-26 08:13:03'),
(105, 'Modules\\Product\\Entities\\Product', 80, '2023-08-26 08:14:08', '2023-08-26 08:14:08'),
(106, 'Modules\\Product\\Entities\\Product', 81, '2023-08-26 08:17:09', '2023-08-26 08:17:09'),
(107, 'Modules\\Product\\Entities\\Product', 82, '2023-08-26 08:17:27', '2023-08-26 08:17:27'),
(108, 'Modules\\Product\\Entities\\Product', 83, '2023-08-26 08:20:04', '2023-08-26 08:20:04'),
(109, 'Modules\\Product\\Entities\\Product', 84, '2023-08-26 08:43:26', '2023-08-26 08:43:26'),
(110, 'Modules\\Page\\Entities\\Page', 1, '2023-08-26 09:55:40', '2023-08-26 09:55:40'),
(111, 'Modules\\Page\\Entities\\Page', 2, '2023-08-26 09:57:09', '2023-08-26 09:57:09'),
(112, 'Modules\\Page\\Entities\\Page', 3, '2023-08-26 09:57:51', '2023-08-26 09:57:51'),
(113, 'Modules\\Page\\Entities\\Page', 4, '2023-08-26 09:58:30', '2023-08-26 09:58:30'),
(114, 'Modules\\Page\\Entities\\Page', 5, '2023-08-26 09:58:53', '2023-08-26 09:58:53');

-- --------------------------------------------------------

--
-- Table structure for table `meta_data_translations`
--

CREATE TABLE `meta_data_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `meta_data_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meta_data_translations`
--

INSERT INTO `meta_data_translations` (`id`, `meta_data_id`, `locale`, `meta_title`, `meta_description`) VALUES
(1, 1, 'en', NULL, NULL),
(2, 2, 'en', NULL, NULL),
(3, 3, 'en', NULL, NULL),
(4, 4, 'en', NULL, NULL),
(5, 5, 'en', NULL, NULL),
(6, 6, 'en', NULL, NULL),
(7, 7, 'en', NULL, NULL),
(8, 8, 'en', NULL, NULL),
(9, 9, 'en', NULL, NULL),
(10, 10, 'en', NULL, NULL),
(11, 11, 'en', NULL, NULL),
(12, 12, 'en', NULL, NULL),
(13, 13, 'en', NULL, NULL),
(14, 14, 'en', NULL, NULL),
(15, 15, 'en', NULL, NULL),
(16, 16, 'en', NULL, NULL),
(17, 17, 'en', NULL, NULL),
(18, 18, 'en', NULL, NULL),
(19, 19, 'en', NULL, NULL),
(20, 20, 'en', NULL, NULL),
(21, 21, 'en', NULL, NULL),
(22, 22, 'en', NULL, NULL),
(23, 23, 'en', NULL, NULL),
(24, 24, 'en', NULL, NULL),
(25, 25, 'en', NULL, NULL),
(26, 26, 'en', NULL, NULL),
(27, 27, 'en', NULL, NULL),
(28, 28, 'en', NULL, NULL),
(29, 29, 'en', NULL, NULL),
(30, 30, 'en', NULL, NULL),
(31, 31, 'en', NULL, NULL),
(32, 32, 'en', NULL, NULL),
(33, 33, 'en', NULL, NULL),
(34, 34, 'en', NULL, NULL),
(35, 35, 'en', NULL, NULL),
(36, 36, 'en', NULL, NULL),
(37, 37, 'en', NULL, NULL),
(38, 38, 'en', NULL, NULL),
(39, 39, 'en', NULL, NULL),
(40, 40, 'en', NULL, NULL),
(41, 41, 'en', NULL, NULL),
(42, 42, 'en', NULL, NULL),
(43, 43, 'en', NULL, NULL),
(44, 44, 'en', NULL, NULL),
(45, 45, 'en', NULL, NULL),
(46, 46, 'en', NULL, NULL),
(47, 47, 'en', NULL, NULL),
(48, 48, 'en', NULL, NULL),
(49, 49, 'en', NULL, NULL),
(50, 50, 'en', NULL, NULL),
(51, 51, 'en', NULL, NULL),
(52, 52, 'en', NULL, NULL),
(53, 53, 'en', NULL, NULL),
(54, 54, 'en', NULL, NULL),
(55, 55, 'en', NULL, NULL),
(56, 56, 'en', NULL, NULL),
(57, 57, 'en', NULL, NULL),
(58, 58, 'en', NULL, NULL),
(59, 59, 'en', NULL, NULL),
(60, 60, 'en', NULL, NULL),
(61, 61, 'en', NULL, NULL),
(62, 62, 'en', NULL, NULL),
(63, 63, 'en', NULL, NULL),
(64, 64, 'en', NULL, NULL),
(65, 65, 'en', NULL, NULL),
(66, 66, 'en', NULL, NULL),
(67, 67, 'en', NULL, NULL),
(68, 68, 'en', NULL, NULL),
(69, 69, 'en', NULL, NULL),
(70, 70, 'en', NULL, NULL),
(71, 71, 'en', NULL, NULL),
(72, 72, 'en', NULL, NULL),
(73, 73, 'en', NULL, NULL),
(74, 74, 'en', NULL, NULL),
(75, 75, 'en', NULL, NULL),
(76, 76, 'en', NULL, NULL),
(77, 77, 'en', NULL, NULL),
(78, 78, 'en', NULL, NULL),
(79, 79, 'en', NULL, NULL),
(80, 80, 'en', NULL, NULL),
(81, 81, 'en', NULL, NULL),
(82, 82, 'en', NULL, NULL),
(83, 83, 'en', NULL, NULL),
(84, 84, 'en', NULL, NULL),
(85, 85, 'en', NULL, NULL),
(86, 86, 'en', NULL, NULL),
(87, 87, 'en', NULL, NULL),
(88, 88, 'en', NULL, NULL),
(89, 89, 'en', NULL, NULL),
(90, 90, 'en', NULL, NULL),
(91, 91, 'en', NULL, NULL),
(92, 92, 'en', NULL, NULL),
(93, 93, 'en', NULL, NULL),
(94, 94, 'en', NULL, NULL),
(95, 95, 'en', NULL, NULL),
(96, 96, 'en', NULL, NULL),
(97, 97, 'en', NULL, NULL),
(98, 98, 'en', NULL, NULL),
(99, 99, 'en', NULL, NULL),
(100, 100, 'en', NULL, NULL),
(101, 101, 'en', NULL, NULL),
(102, 102, 'en', NULL, NULL),
(103, 103, 'en', NULL, NULL),
(104, 104, 'en', NULL, NULL),
(105, 105, 'en', NULL, NULL),
(106, 106, 'en', NULL, NULL),
(107, 107, 'en', NULL, NULL),
(108, 108, 'en', NULL, NULL),
(109, 109, 'en', NULL, NULL),
(110, 110, 'en', NULL, NULL),
(111, 111, 'en', NULL, NULL),
(112, 112, 'en', NULL, NULL),
(113, 113, 'en', NULL, NULL),
(114, 114, 'en', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_07_02_230147_migration_cartalyst_sentinel', 1),
(2, '2014_10_14_200250_create_settings_table', 1),
(3, '2014_10_26_162751_create_files_table', 1),
(4, '2014_10_30_191858_create_pages_table', 1),
(5, '2014_11_31_125848_create_page_translations_table', 1),
(6, '2015_02_27_105241_create_entity_files_table', 1),
(7, '2015_11_20_184604486385_create_translations_table', 1),
(8, '2015_11_20_184604743083_create_translation_translations_table', 1),
(9, '2017_05_29_155126144426_create_products_table', 1),
(10, '2017_05_30_155126416338_create_product_translations_table', 1),
(11, '2017_08_02_153217_create_options_table', 1),
(12, '2017_08_02_153348_create_option_translations_table', 1),
(13, '2017_08_02_153406_create_option_values_table', 1),
(14, '2017_08_02_153736_create_option_value_translations_table', 1),
(15, '2017_08_03_156576_create_product_options_table', 1),
(16, '2017_08_17_170128_create_related_products_table', 1),
(17, '2017_08_17_175236_create_up_sell_products_table', 1),
(18, '2017_08_17_175828_create_cross_sell_products_table', 1),
(19, '2017_11_09_141332910964_create_categories_table', 1),
(20, '2017_11_09_141332931539_create_category_translations_table', 1),
(21, '2017_11_26_083614526622_create_meta_data_table', 1),
(22, '2017_11_26_083614526828_create_meta_data_translations_table', 1),
(23, '2018_01_24_125642_create_product_categories_table', 1),
(24, '2018_02_04_150917488267_create_coupons_table', 1),
(25, '2018_02_04_150917488698_create_coupon_translations_table', 1),
(26, '2018_03_11_181317_create_coupon_products_table', 1),
(27, '2018_03_15_091937_create_coupon_categories_table', 1),
(28, '2018_04_18_154028776225_create_reviews_table', 1),
(29, '2018_05_17_115822452977_create_currency_rates_table', 1),
(30, '2018_07_03_124153537506_create_sliders_table', 1),
(31, '2018_07_03_124153537695_create_slider_translations_table', 1),
(32, '2018_07_03_133107770172_create_slider_slides_table', 1),
(33, '2018_07_03_133107770486_create_slider_slide_translations_table', 1),
(34, '2018_07_28_190524758357_create_attribute_sets_table', 1),
(35, '2018_07_28_190524758497_create_attribute_set_translations_table', 1),
(36, '2018_07_28_190524758646_create_attributes_table', 1),
(37, '2018_07_28_190524758877_create_attribute_translations_table', 1),
(38, '2018_07_28_190524759461_create_product_attributes_table', 1),
(39, '2018_08_01_001919718631_create_tax_classes_table', 1),
(40, '2018_08_01_001919718935_create_tax_class_translations_table', 1),
(41, '2018_08_01_001919723551_create_tax_rates_table', 1),
(42, '2018_08_01_001919723781_create_tax_rate_translations_table', 1),
(43, '2018_08_03_195922206748_create_attribute_values_table', 1),
(44, '2018_08_03_195922207019_create_attribute_value_translations_table', 1),
(45, '2018_08_04_190524764275_create_product_attribute_values_table', 1),
(46, '2018_08_07_135631306565_create_orders_table', 1),
(47, '2018_08_07_135631309451_create_order_products_table', 1),
(48, '2018_08_07_135631309512_create_order_product_options_table', 1),
(49, '2018_08_07_135631309624_create_order_product_option_values_table', 1),
(50, '2018_09_11_213926106353_create_transactions_table', 1),
(51, '2018_09_19_081602135631_create_order_taxes_table', 1),
(52, '2018_09_19_103745_create_setting_translations_table', 1),
(53, '2018_10_01_224852175056_create_wish_lists_table', 1),
(54, '2018_10_04_185608_create_search_terms_table', 1),
(55, '2018_11_03_160015_create_menus_table', 1),
(56, '2018_11_03_160138_create_menu_translations_table', 1),
(57, '2018_11_03_160753_create_menu_items_table', 1),
(58, '2018_11_03_160804_create_menu_item_translation_table', 1),
(59, '2019_02_05_162605_add_position_to_slider_slides_table', 1),
(60, '2019_02_09_164343_remove_file_id_from_slider_slides_table', 1),
(61, '2019_02_09_164434_add_file_id_to_slider_slide_translations_table', 1),
(62, '2019_02_14_103408_create_attribute_categories_table', 1),
(63, '2019_08_09_164759_add_slug_column_to_attributes_table', 1),
(64, '2019_11_01_201511_add_special_price_type_column_to_products_table', 1),
(65, '2019_11_23_193101_add_value_column_to_order_product_options_table', 1),
(66, '2020_01_04_211424_add_icon_column_to_menu_items_table', 1),
(67, '2020_01_05_160502_add_direction_column_to_slider_slide_translations_table', 1),
(68, '2020_01_05_234014_add_speed_column_to_sliders_table', 1),
(69, '2020_01_05_235014_add_fade_column_to_sliders_table', 1),
(70, '2020_01_15_000346259038_create_flash_sales_table', 1),
(71, '2020_01_15_000346259349_create_flash_sale_translations_table', 1),
(72, '2020_01_23_011234_create_flash_sale_products_table', 1),
(73, '2020_01_30_015722_create_flash_sale_product_orders_table', 1),
(74, '2020_02_22_215943_delete_meta_keywords_column_from_meta_data_translations_table', 1),
(75, '2020_03_05_214602901973_create_brands_table', 1),
(76, '2020_03_05_214602902369_create_brand_translations_table', 1),
(77, '2020_03_06_234605_add_brand_id_column_to_products_table', 1),
(78, '2020_04_06_211526_add_note_column_to_orders_table', 1),
(79, '2020_04_28_034118164376_create_tags_table', 1),
(80, '2020_04_28_034118164618_create_tag_translations_table', 1),
(81, '2020_04_28_225657_create_product_tags_table', 1),
(82, '2020_05_10_041616_create_updater_scripts_table', 1),
(83, '2020_10_07_175000_create_addresses_table', 1),
(84, '2020_10_07_175004_create_default_addresses_table', 1),
(85, '2020_11_21_163822_add_downloads_columns_to_products_table', 1),
(86, '2021_01_08_203241_change_shipping_method_column_in_orders_table', 1),
(87, '2021_01_09_172744_add_phone_column_to_users_table', 1),
(88, '2021_01_11_170516_create_order_downloads_table', 1),
(89, '2023_05_04_194556_rename_column_virtual_to_is_virtual', 1);

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL,
  `is_global` tinyint(1) NOT NULL DEFAULT 1,
  `position` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `type`, `is_required`, `is_global`, `position`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'checkbox', 0, 0, 0, NULL, '2023-08-24 07:26:31', '2023-08-24 07:31:03'),
(2, 'dropdown', 0, 0, 1, NULL, '2023-08-24 07:27:33', '2023-08-24 07:31:03'),
(3, 'radio', 0, 0, 2, NULL, '2023-08-24 07:28:25', '2023-08-24 07:31:03'),
(4, 'dropdown', 1, 0, 0, NULL, '2023-08-24 09:09:46', '2023-08-24 09:20:43'),
(5, 'checkbox', 0, 0, 1, NULL, '2023-08-24 09:11:04', '2023-08-24 09:20:43'),
(6, 'checkbox', 0, 0, 0, NULL, '2023-08-27 05:00:51', '2023-08-27 05:00:51');

-- --------------------------------------------------------

--
-- Table structure for table `option_translations`
--

CREATE TABLE `option_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `option_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `option_translations`
--

INSERT INTO `option_translations` (`id`, `option_id`, `locale`, `name`) VALUES
(1, 1, 'en', 'Laptop Storage'),
(2, 2, 'en', 'Laptop Ram'),
(3, 3, 'en', 'Laptop Color'),
(4, 4, 'en', 'Laptop Ram'),
(5, 5, 'en', 'Laptop Storage'),
(6, 6, 'en', 'Color');

-- --------------------------------------------------------

--
-- Table structure for table `option_values`
--

CREATE TABLE `option_values` (
  `id` int(10) UNSIGNED NOT NULL,
  `option_id` int(10) UNSIGNED NOT NULL,
  `price` decimal(18,4) UNSIGNED DEFAULT NULL,
  `price_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `option_values`
--

INSERT INTO `option_values` (`id`, `option_id`, `price`, `price_type`, `position`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'fixed', 0, '2023-08-24 07:26:32', '2023-08-24 07:26:32'),
(2, 1, 300.0000, 'fixed', 1, '2023-08-24 07:26:32', '2023-08-24 07:26:32'),
(3, 1, 500.0000, 'fixed', 2, '2023-08-24 07:26:32', '2023-08-24 07:26:32'),
(4, 2, NULL, 'fixed', 0, '2023-08-24 07:27:33', '2023-08-24 07:27:33'),
(5, 2, NULL, 'fixed', 1, '2023-08-24 07:27:33', '2023-08-24 07:27:33'),
(6, 2, 200.0000, 'fixed', 2, '2023-08-24 07:27:33', '2023-08-24 07:27:33'),
(7, 2, 400.0000, 'fixed', 3, '2023-08-24 07:27:33', '2023-08-24 07:27:33'),
(8, 3, NULL, 'fixed', 0, '2023-08-24 07:28:25', '2023-08-24 07:28:25'),
(9, 3, 100.0000, 'fixed', 1, '2023-08-24 07:28:25', '2023-08-24 07:28:25'),
(10, 3, 130.0000, 'fixed', 2, '2023-08-24 07:28:25', '2023-08-24 07:28:25'),
(11, 3, NULL, 'fixed', 3, '2023-08-24 07:28:25', '2023-08-24 07:28:25'),
(12, 4, NULL, 'fixed', 0, '2023-08-24 09:09:46', '2023-08-24 09:09:46'),
(13, 4, NULL, 'fixed', 1, '2023-08-24 09:09:46', '2023-08-24 09:09:46'),
(14, 4, 200.0000, 'fixed', 2, '2023-08-24 09:09:47', '2023-08-24 09:09:47'),
(15, 4, 400.0000, 'fixed', 3, '2023-08-24 09:09:47', '2023-08-24 09:09:47'),
(16, 5, NULL, 'fixed', 0, '2023-08-24 09:11:04', '2023-08-24 09:11:04'),
(17, 5, 300.0000, 'fixed', 1, '2023-08-24 09:11:04', '2023-08-24 09:11:04'),
(18, 5, 500.0000, 'fixed', 2, '2023-08-24 09:11:04', '2023-08-24 09:11:04'),
(19, 6, NULL, 'fixed', 0, '2023-08-27 05:00:51', '2023-08-27 05:00:51'),
(20, 6, NULL, 'fixed', 1, '2023-08-27 05:00:52', '2023-08-27 05:00:52'),
(21, 6, NULL, 'fixed', 2, '2023-08-27 05:00:52', '2023-08-27 05:00:52');

-- --------------------------------------------------------

--
-- Table structure for table `option_value_translations`
--

CREATE TABLE `option_value_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `option_value_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `option_value_translations`
--

INSERT INTO `option_value_translations` (`id`, `option_value_id`, `locale`, `label`) VALUES
(1, 1, 'en', '500GB'),
(2, 2, 'en', '1TB'),
(3, 3, 'en', '2TB'),
(4, 4, 'en', '4GB'),
(5, 5, 'en', '8GB'),
(6, 6, 'en', '16GB'),
(7, 7, 'en', '32GB'),
(8, 8, 'en', 'Space Grey'),
(9, 9, 'en', 'Silver'),
(10, 10, 'en', 'Gold'),
(11, 11, 'en', 'Black'),
(12, 12, 'en', '4GB'),
(13, 13, 'en', '8GB'),
(14, 14, 'en', '16GB'),
(15, 15, 'en', '32GB'),
(16, 16, 'en', '500GB'),
(17, 17, 'en', '1TB'),
(18, 18, 'en', '2TB'),
(19, 19, 'en', 'White'),
(20, 20, 'en', 'Black'),
(21, 21, 'en', 'Silver');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_address_1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_address_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_zip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_address_1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_address_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_zip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_total` decimal(18,4) UNSIGNED NOT NULL,
  `shipping_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_cost` decimal(18,4) UNSIGNED NOT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `discount` decimal(18,4) UNSIGNED NOT NULL,
  `total` decimal(18,4) UNSIGNED NOT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` decimal(18,4) NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_downloads`
--

CREATE TABLE `order_downloads` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `file_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `unit_price` decimal(18,4) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `line_total` decimal(18,4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_product_options`
--

CREATE TABLE `order_product_options` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_product_id` int(10) UNSIGNED NOT NULL,
  `option_id` int(10) UNSIGNED NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_product_option_values`
--

CREATE TABLE `order_product_option_values` (
  `order_product_option_id` int(10) UNSIGNED NOT NULL,
  `option_value_id` int(10) UNSIGNED NOT NULL,
  `price` decimal(18,4) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_taxes`
--

CREATE TABLE `order_taxes` (
  `order_id` int(10) UNSIGNED NOT NULL,
  `tax_rate_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(15,4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `slug`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'about-us', 1, '2023-08-26 09:55:40', '2023-08-26 09:55:40'),
(2, 'return-policy', 1, '2023-08-26 09:57:09', '2023-08-26 09:57:09'),
(3, 'help-faq', 1, '2023-08-26 09:57:51', '2023-08-26 09:57:51'),
(4, 'privacy-policy', 1, '2023-08-26 09:58:30', '2023-08-26 09:58:30'),
(5, 'terms-of-service', 1, '2023-08-26 09:58:53', '2023-08-26 09:58:53');

-- --------------------------------------------------------

--
-- Table structure for table `page_translations`
--

CREATE TABLE `page_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `page_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_translations`
--

INSERT INTO `page_translations` (`id`, `page_id`, `locale`, `name`, `body`) VALUES
(1, 1, 'en', 'About Us', '<h1>About Us</h1>\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\r\n<li>In luctus nunc id lectus pellentesque lacinia.</li>\r\n<li>Pellentesque laoreet mi molestie tortor aliquam, sed hendrerit nisi consectetur.</li>\r\n<li>Nam sed sapien sed lacus placerat euismod in consectetur ex.</li>\r\n<li>Sed et odio ultrices, semper sem sed, scelerisque libero.</li>\r\n<li>Proin ut ex varius libero viverra pellentesque.<br /><br /></li>\r\n</ul>\r\n<h2 class=\"avs awd awx axv chx\">Our mission</h2>\r\n<div class=\"lk lx yr aaj aaq czb\">\r\n<div class=\"cwz cxe cxr\">\r\n<p class=\"awb awr axs\">Aliquet nec orci mattis amet quisque ullamcorper neque, nibh sem. At arcu, sit dui mi, nibh dui, diam eget aliquam. Quisque id at vitae feugiat egestas ac. Diam nulla orci at in viverra scelerisque eget. Eleifend egestas fringilla sapien.</p>\r\n<div class=\"kw uk avy awq axt\">\r\n<p>Faucibus commodo massa rhoncus, volutpat. Dignissim sed eget risus enim. Mattis mauris semper sed amet vitae sed turpis id. Id dolor praesent donec est. Odio penatibus risus viverra tellus varius sit neque erat velit. Faucibus commodo massa rhoncus, volutpat. Dignissim sed eget risus enim. Mattis mauris semper sed amet vitae sed turpis id.</p>\r\n<p class=\"kw\">Et vitae blandit facilisi magna lacus commodo. Vitae sapien duis odio id et. Id blandit molestie auctor fermentum dignissim. Lacus diam tincidunt ac cursus in vel. Mauris varius vulputate et ultrices hac adipiscing egestas. Iaculis convallis ac tempor et ut. Ac lorem vel integer orci.<br /><br /></p>\r\n<h2 class=\"avs awd awx axv chx\">Our values</h2>\r\n<p class=\"lk avz awr axs\">Lorem ipsum dolor sit amet consect adipisicing elit. Possimus magnam voluptatum cupiditate veritatis in accusamus quisquam.<br /><br /></p>\r\n<h2 class=\"avs awd awx axv chx\">Our team</h2>\r\n<p class=\"lk avz awr axs\">Sit facilis neque ab nulla vel. Cum eos in laudantium. Temporibus eos totam in dolorum. Nemo vel facere repellendus ut eos dolores similique.</p>\r\n<ol>\r\n<li class=\"lk avz awr axs\">Team 01</li>\r\n<li class=\"lk avz awr axs\">Team 02</li>\r\n<li class=\"lk avz awr axs\">Team 03</li>\r\n<li class=\"lk avz awr axs\">Team 04</li>\r\n<li class=\"lk avz awr axs\">Team 05</li>\r\n<li class=\"lk avz awr axs\">Team 06</li>\r\n</ol>\r\n</div>\r\n</div>\r\n</div>'),
(2, 2, 'en', 'Return Policy', '<h1>Return Policy</h1>\r\n<p>&nbsp;</p>\r\n<p>Studio Lorem Ipsum will accept returns of UNWORN MERCHANDISE within 14 days of receipt of your order. If 14 days have gone by since receipt of your order, unfortunately we can&rsquo;t offer you a refund or exchange.</p>\r\n<p>&nbsp;</p>\r\n<p>To be eligible for a return, your item must be unused and in the same condition that you received it. It must also be in the original packaging.</p>\r\n<p>To complete your return, we require a receipt or proof of purchase.</p>\r\n<h4>Refunds (if applicable)</h4>\r\n<p>Once your return is received and inspected, we will send you an email to notify you that we have received your returned item. We will also notify you of the approval or rejection of your refund.<br />If you are approved, then your refund will be processed, and a credit will automatically be applied to your credit card or original method of payment, within a certain amount of days.</p>\r\n<h4>Late or missing refunds (if applicable)</h4>\r\n<ul>\r\n<li>If you haven&rsquo;t received a refund yet, first check your bank account again.</li>\r\n<li>Then contact your credit card company, it may take some time before your refund is officially posted.</li>\r\n<li>Next contact your bank. There is often some processing time before a refund is posted.</li>\r\n<li>If you&rsquo;ve done all of this and you still have not received your refund yet, please contact us.</li>\r\n</ul>\r\n<h4>Gifts</h4>\r\n<p>If the item was marked as a gift when purchased and shipped directly to you, you&rsquo;ll receive a gift credit for the value of your return. Once the returned item is received, a gift certificate will be mailed to you.</p>\r\n<p>&nbsp;</p>\r\n<p>If the item wasn&rsquo;t marked as a gift when purchased, or the gift giver had the order shipped to themselves to give to you later, we will send a refund to the gift giver and he will find out about your return.</p>\r\n<h4>Shipping</h4>\r\n<p>To return your product, you can request to return the product within 14 days of receipt of your order, and we will email you the return label which you can use to ship the product. Once your return is received and inspected, the refund will be processed to your original method of payment.</p>\r\n<p>&nbsp;</p>\r\n<h4>Call for more details</h4>\r\n<p>+880832384923</p>'),
(3, 3, 'en', 'Help & FAQ', '<h1>Help &amp; FAQ</h1>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<h4>What does LOREM mean?</h4>\r\n<p>&lsquo;Lorem ipsum dolor sit amet, consectetur adipisici elit&hellip;&rsquo; (complete text) is dummy text that is not meant to mean anything. It is used as a placeholder in magazine layouts, for example, in order to give an impression of the finished document. The text is intentionally unintelligible so that the viewer is not distracted by the content. The language is not real Latin and even the first word &lsquo;Lorem&rsquo; does not exist. It is said that the lorem ipsum text has been common among typesetters since the 16th century.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<h4>Why do we use it?</h4>\r\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<h4>Where does it come from?</h4>\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<h4>Where can I get some?</h4>\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<h4>Why do we use Lorem Ipsum?</h4>\r\n<p>Many times, readers will get distracted by readable text when looking at the layout of a page. Instead of using filler text that says &ldquo;Insert content here,&rdquo; Lorem Ipsum uses a normal distribution of letters, making it resemble standard English. This makes it easier for designers to focus on visual elements, as opposed to what the text on a page actually says. Lorem Ipsum is absolutely necessary in most design cases, too. Web design projects like landing pages, website redesigns and so on only look as intended when they\'re fully-fleshed out with content.</p>'),
(4, 4, 'en', 'Privacy Policy', '<h1>Privacy Policy</h1>\r\n<p>&nbsp;</p>\r\n<p>Your privacy is as important to us as it is to you. We know you hate SPAM and so do we. That is why we will never sell or share your information with anyone without your express permission. We respect your rights and will do everything in our power to protect your personal information. In the interest of full disclosure, we provide this notice explaining our online information collection practices. This privacy notice discloses the privacy practices for&nbsp;<a href=\"https://envaysoft.com/\">EnvaySoft</a>&nbsp;(herein known as we, us and our company) and applies solely to information collected by this web site.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<h4>Information Collection, Use, and Sharing</h4>\r\n<p>We are the sole owners of the information collected on this site. We only have access to information that you voluntarily give us via email or other direct contact from you. We will not sell or rent this information to anyone. We will use your information to respond to you, regarding the reason you contacted us. We will not share your information with any third party outside of our organization, other than as necessary to fulfill your request, e.g. to ship an order.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<h4>Disclosure</h4>\r\n<p>This site uses Google web analytics service. Google may record mouse clicks, mouse movements, scrolling activity as well as text you type in this website. This site does not use Google to collect any personally identifiable information entered in this website. Google does track your browsing habits across web sites which do not use Google services.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<h4>Security</h4>\r\n<p>We take precautions to protect your information. When you submit sensitive information via the website, your information is protected both online and offline.</p>\r\n<p>Wherever we collect sensitive information (such as credit card data), that information is encrypted and transmitted to us in a secure way. You can verify this by looking for a closed lock icon at the bottom of your web browser, or looking for &ldquo;https&rdquo; at the beginning of the address of the web page.</p>\r\n<p>While we use encryption to protect sensitive information transmitted online, we also protect your information offline. Only employees who need the information to perform a specific job (for example, billing or customer service) are granted access to personally identifiable information. The computers/servers in which we store personally identifiable information are kept in a secure environment.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<h4>Email Policy</h4>\r\n<p>The following are situations in which you may provide Your Information to us:</p>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li>\r\n<p>When you fill out forms or fields through our Services.</p>\r\n</li>\r\n<li>\r\n<p>When you register for an account with our Service.</p>\r\n</li>\r\n<li>\r\n<p>When you create a subscription for our newsletter or Services.</p>\r\n</li>\r\n<li>\r\n<p>When you provide responses to a survey.</p>\r\n</li>\r\n<li>\r\n<p>When you answer questions on a quiz.</p>\r\n</li>\r\n<li>\r\n<p>When you join or enroll in an event through our Services.</p>\r\n</li>\r\n<li>\r\n<p>When you order services or products from, or through our Service.</p>\r\n</li>\r\n<li>\r\n<p>When you provide information to us through a third-party application, service or Website.</p>\r\n</li>\r\n</ul>'),
(5, 5, 'en', 'Terms of Service', '<h1>Terms of Service</h1>\r\n<p>&nbsp;</p>\r\n<p>This website is operated by a.season. Throughout the site, the terms &ldquo;we&rdquo;, &ldquo;us&rdquo; and &ldquo;our&rdquo; refer to a.season. a.season offers this website, including all information, tools and services available from this site to you, the user, conditioned upon your acceptance of all terms, conditions, policies and notices stated here.</p>\r\n<p>&nbsp;</p>\r\n<p>By visiting our site and/ or purchasing something from us, you engage in our &ldquo;Service&rdquo; and agree to be bound by the following terms and conditions (&ldquo;Terms of Service&rdquo;, &ldquo;Terms&rdquo;), including those additional terms and conditions and policies referenced herein and/or available by hyperlink. These Terms of Service apply to all users of the site, including without limitation users who are browsers, vendors, customers, merchants, and/ or contributors of content.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<h4>Online Store Terms</h4>\r\n<p>By agreeing to these Terms of Service, you represent that you are at least the age of majority in your state or province of residence, or that you are the age of majority in your state or province of residence and you have given us your consent to allow any of your minor dependents to use this site.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<h4>General Conditions</h4>\r\n<p>We reserve the right to refuse service to anyone for any reason at any time.<br />You understand that your content (not including credit card information), may be transferred unencrypted and involve (a) transmissions over various networks; and (b) changes to conform and adapt to technical requirements of connecting networks or devices. Credit card information is always encrypted during transfer over networks.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<h4>License</h4>\r\n<p>You must not:</p>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li>Republish material from&nbsp;<span class=\"highlight preview_website_name\">Website Name</span></li>\r\n<li>Sell, rent or sub-license material from&nbsp;<span class=\"highlight preview_website_name\">Website Name</span></li>\r\n<li>Reproduce, duplicate or copy material from&nbsp;<span class=\"highlight preview_website_name\">Website Name</span></li>\r\n<li>Redistribute content from&nbsp;<span class=\"highlight preview_website_name\">Website Name</span></li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<h4>Disclaimer</h4>\r\n<p>To the maximum extent permitted by applicable law, we exclude all representations:</p>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li>limit or exclude our or your liability for death or personal injury;</li>\r\n<li>limit or exclude our or your liability for fraud or fraudulent misrepresentation;</li>\r\n<li>limit any of our or your liabilities in any way that is not permitted under applicable law; or</li>\r\n<li>exclude any of our or your liabilities that may not be excluded under applicable law.</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>As long as the website and the information and services on the website are provided free of charge, we will not be liable for any loss or damage of any nature.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `persistences`
--

CREATE TABLE `persistences` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `persistences`
--

INSERT INTO `persistences` (`id`, `user_id`, `code`, `created_at`, `updated_at`) VALUES
(1, 1, 'bJ94ns8gUUgwYrlCAL5XFDfnjgkuB2EZ', '2023-08-24 06:41:24', '2023-08-24 06:41:24'),
(2, 3, 'BeDFr4YElyHiR6yQCJBV9sQMVSbbUvPQ', '2023-08-24 06:58:34', '2023-08-24 06:58:34'),
(3, 2, 'YVjkEgOWG3Dit1USJ7pO77RJa3pq80qG', '2023-08-24 06:58:37', '2023-08-24 06:58:37'),
(4, 2, 'CweA0dzLJOWLM5qGFtqbPk9Q6megktjT', '2023-08-24 06:59:35', '2023-08-24 06:59:35'),
(5, 1, 'UbEziWKo84VUMvmz78oBG0i9cjzDgZQN', '2023-08-24 07:07:10', '2023-08-24 07:07:10'),
(6, 1, 'qg22zsToRv6MRUtxNqNCjVCIsIoYU6WV', '2023-08-26 04:52:25', '2023-08-26 04:52:25'),
(7, 1, 'xxHfk6VpHUB2Q7FlUGWParoJZna2UkP1', '2023-08-26 05:35:17', '2023-08-26 05:35:17'),
(8, 2, 'WFRCBn0pocy9xyTro3kYk3LMFEzn43EE', '2023-08-26 06:24:54', '2023-08-26 06:24:54'),
(9, 3, 'CnUjiJKCqnKH54DtZ99Wth8gf6CMNg7W', '2023-08-26 06:48:11', '2023-08-26 06:48:11'),
(10, 1, 'F5CZr9YkEur6TrGQA8NxjKvjXtSr8Czs', '2023-08-27 04:09:21', '2023-08-27 04:09:21');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_class_id` int(10) UNSIGNED DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(18,4) UNSIGNED NOT NULL,
  `special_price` decimal(18,4) UNSIGNED DEFAULT NULL,
  `special_price_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `special_price_start` date DEFAULT NULL,
  `special_price_end` date DEFAULT NULL,
  `selling_price` decimal(18,4) UNSIGNED DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manage_stock` tinyint(1) NOT NULL DEFAULT 0,
  `qty` int(11) DEFAULT NULL,
  `in_stock` tinyint(1) NOT NULL DEFAULT 1,
  `viewed` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL,
  `new_from` datetime DEFAULT NULL,
  `new_to` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_virtual` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `brand_id`, `tax_class_id`, `slug`, `price`, `special_price`, `special_price_type`, `special_price_start`, `special_price_end`, `selling_price`, `sku`, `manage_stock`, `qty`, `in_stock`, `viewed`, `is_active`, `new_from`, `new_to`, `deleted_at`, `created_at`, `updated_at`, `is_virtual`) VALUES
(1, 1, NULL, 'msi-summit-e13-flip-evo-a13mt-core-i7-13th-gen-134-fhd-120hz-touch-laptop', 700.0000, NULL, 'fixed', NULL, NULL, 700.0000, NULL, 0, NULL, 1, 10, 1, NULL, NULL, NULL, '2023-08-24 07:17:21', '2023-08-27 06:14:25', 0),
(2, 1, NULL, 'msi-gf63-thin-12ucx-core-i5-12th-gen-rtx-2050-4gb-graphics-156-fhd-144hz-gaming-laptop', 135.0000, 105.0000, 'fixed', NULL, NULL, 105.0000, 'S9NHU6XW', 0, NULL, 1, 9, 1, NULL, NULL, NULL, '2023-08-24 08:04:05', '2023-08-27 06:14:37', 0),
(3, 19, NULL, 'walton-prelude-n40-pro-celeron-n4020-14-fhd-laptop', 500.0000, NULL, 'fixed', NULL, NULL, 500.0000, NULL, 0, NULL, 1, 10, 1, NULL, NULL, NULL, '2023-08-24 08:44:34', '2023-08-30 06:39:48', 0),
(4, 12, NULL, 'acer-travelmate-tmp214-53-core-i3-11th-gen-8gb-ram-14-fhd-laptop', 600.0000, NULL, 'fixed', NULL, NULL, 600.0000, NULL, 0, NULL, 1, 1, 1, NULL, NULL, NULL, '2023-08-24 08:44:55', '2023-08-27 06:14:48', 0),
(5, 1, NULL, 'msi-modern-15-a11mu-core-i7-11th-gen-156-fhd-laptop', 900.0000, NULL, 'fixed', NULL, NULL, 900.0000, NULL, 0, NULL, 1, 1, 1, NULL, NULL, NULL, '2023-08-24 08:58:09', '2023-08-24 09:06:14', 0),
(6, 12, NULL, 'acer-aspire-3-a315-24p-ryzen-5-7520u-156-fhd-laptop', 640.0000, NULL, 'fixed', NULL, NULL, 640.0000, NULL, 0, NULL, 1, 1, 1, NULL, NULL, NULL, '2023-08-24 09:05:47', '2023-08-24 09:06:03', 0),
(7, 10, NULL, 'microsoft-surface-pro-9-core-i5-12th-gen-8gb-ram-512gb-ssd-13-multi-touch-laptop-qhb-00017', 1500.0000, NULL, 'fixed', NULL, NULL, 1500.0000, NULL, 0, NULL, 1, 1, 1, NULL, NULL, NULL, '2023-08-24 09:11:20', '2023-08-24 09:13:38', 0),
(8, 9, NULL, 'lenovo-ideapad-1-15ada7-amd-ryzen-3-3250u-156-fhd-laptop', 501.0000, NULL, 'fixed', NULL, NULL, 501.0000, NULL, 0, NULL, 1, 1, 1, NULL, NULL, NULL, '2023-08-24 09:15:32', '2023-08-30 06:41:19', 0),
(9, 12, NULL, 'acer-aspire-5-an515-57g-52hf-core-i5-12th-gen-rtx-2050-4gb-graphics-156-fhd-gaming-laptop', 890.0000, NULL, 'fixed', NULL, NULL, 890.0000, NULL, 0, NULL, 1, 1, 1, NULL, NULL, NULL, '2023-08-24 09:19:44', '2023-08-27 03:49:04', 0),
(10, 9, NULL, 'lenovo-ideapad-slim-3i-11th-gen-core-i3-256gb-ssd-156-full-hd-laptop-with-windows-11', 520.0000, NULL, 'fixed', NULL, NULL, 520.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-24 09:20:39', '2023-08-24 09:20:39', 0),
(11, 18, NULL, 'apple-macbook-pro-2019-model-13-inch-intel-core-i5-14ghz-8gb-128gb', 897.0000, NULL, 'fixed', NULL, NULL, 897.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-24 09:20:43', '2023-08-24 09:20:43', 0),
(12, 9, NULL, 'lenovo-ideapad-slim-3i-11th-gen-core-i3-8gb-ram-14-fhd-laptop-with-windows-11', 510.0000, NULL, 'fixed', NULL, NULL, 510.0000, NULL, 0, NULL, 1, 1, 1, NULL, NULL, NULL, '2023-08-24 09:24:40', '2023-08-24 09:27:00', 0),
(13, 1, NULL, 'msi-modern-15-b13m-core-i5-13th-gen-156-fhd-laptop', 950.0000, NULL, 'fixed', NULL, NULL, 950.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-24 09:25:05', '2023-08-24 09:25:05', 0),
(14, 14, NULL, 'hp-spectre-156-4k-ultra-hd-touch-screen-laptop-intel-i7-8th-gen', 1234.0000, NULL, 'fixed', NULL, NULL, 1234.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-24 09:25:15', '2023-08-24 09:25:15', 0),
(15, 12, NULL, 'acer-aspire-3-a315-59-core-i5-12th-gen-156-fhd-laptop', 800.0000, NULL, 'fixed', NULL, NULL, 800.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-24 09:30:51', '2023-08-24 09:30:51', 0),
(16, 1, NULL, 'msi-katana-gf66-12uc-core-i5-12th-gen-rtx-3050-4gb-graphics-156-fhd-gaming-laptop', 1027.0000, NULL, 'fixed', NULL, NULL, 1027.0000, NULL, 0, NULL, 1, 1, 1, NULL, NULL, NULL, '2023-08-24 09:31:27', '2023-09-11 06:42:40', 0),
(17, 11, NULL, 'asus-rog-zephyrus-s-gx502gv-gaming-laptop-intel-i7-9750h-32gb-ram', 1568.0000, NULL, 'fixed', NULL, NULL, 1568.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-24 09:32:39', '2023-08-24 09:32:39', 0),
(18, 1, NULL, 'msi-sword-15-a12ucx-core-i5-12th-gen-rtx-2050-4gb-graphics-156-fhd-gaming-laptop', 1219.0000, NULL, 'fixed', NULL, NULL, 1219.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-24 09:35:34', '2023-08-24 09:35:34', 0),
(19, 9, NULL, 'lenovo-v14-core-i3-11th-gen-14-full-hd-laptop', 550.0000, NULL, 'fixed', NULL, NULL, 550.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-24 09:36:06', '2023-08-24 09:36:06', 0),
(20, NULL, NULL, 'dell-xps-13-9380-133-4k-uhd-3840x2160-multi-touch-ips-display-intel-core-i7-8565u', 1199.6600, NULL, 'fixed', NULL, NULL, 1199.6600, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-24 09:36:59', '2023-08-24 09:36:59', 0),
(21, 12, NULL, 'acer-travelmate-tmp214-53-core-i7-11th-gen-14-fhd-laptop', 850.0000, NULL, 'fixed', NULL, NULL, 850.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-24 09:40:54', '2023-08-24 09:40:54', 0),
(22, 12, NULL, 'acer-aspire-7-a715-51g-core-i5-12th-gen-gtx-1650-4gb-graphics-156-fhd-gaming-laptop', 910.0000, NULL, 'fixed', NULL, NULL, 910.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-24 09:43:01', '2023-08-24 09:43:01', 0),
(23, NULL, NULL, 'msi-modern-14-c13m-core-i7-13th-gen-14-fhd-laptop', 1150.0000, NULL, 'fixed', NULL, NULL, 1150.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-24 09:46:42', '2023-08-24 09:46:42', 0),
(24, 11, NULL, 'asus-vivobook-x515ma-celeron-n4500-156-hd-laptop', 370.0000, NULL, 'fixed', NULL, NULL, 370.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-24 09:46:45', '2023-08-24 09:46:45', 0),
(25, 9, NULL, 'lenovo-ideapad-1-15amn7-amd-ryzen-5-156-fhd-laptop-with-ddr5-ram', 546.0000, NULL, 'fixed', NULL, NULL, 546.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-24 09:51:46', '2023-08-24 09:51:46', 0),
(26, 12, NULL, 'acer-extensa-14-ex214-53-543w-core-i5-12th-gen-14-fhd-laptop', 850.0000, NULL, 'fixed', NULL, NULL, 850.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-24 09:54:25', '2023-08-24 09:54:25', 0),
(27, 9, NULL, 'lenovo-ideapad-slim-3i-core-i3-11th-gen-4gb-ram-156-fhd-laptop', 540.0000, NULL, 'fixed', NULL, NULL, 540.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-24 09:59:22', '2023-08-24 09:59:22', 0),
(28, 1, NULL, 'msi-katana-15-b12udxk-core-i5-12th-gen-rtx-3050-4gb-graphics-156-fhd-gaming-laptop', 1265.0000, NULL, 'fixed', NULL, NULL, 1265.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-24 10:01:43', '2023-08-24 10:01:43', 0),
(29, 11, NULL, 'asus-vivobook-e210ma-celeron-n4020-116-hd-laptop', 400.0000, NULL, 'fixed', NULL, NULL, 400.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-24 10:04:56', '2023-08-24 10:04:56', 0),
(30, 11, NULL, 'asus-vivobook-x515ka-celeron-n4500-156-fhd-laptop', 370.0000, NULL, 'fixed', NULL, NULL, 370.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-24 10:05:28', '2023-08-24 10:05:28', 0),
(31, 9, NULL, 'lenovo-ideapad-slim-3i-core-i3-11th-gen-14-fhd-laptop-abyss-blue', 600.0000, NULL, 'fixed', NULL, NULL, 600.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-24 10:10:47', '2023-08-24 10:10:47', 0),
(32, 9, NULL, 'lenovo-ideapad-slim-3i-core-i3-11th-gen-512gb-ssd-14-fhd-laptop', 555.0000, NULL, 'fixed', NULL, NULL, 555.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-24 10:10:57', '2023-08-24 10:10:57', 0),
(33, 1, NULL, 'msi-summit-e16-flip-evo-a13mt-core-i7-13th-gen-16gb-ram-16-fhd-165hz-touch-laptop', 1671.0000, NULL, 'fixed', NULL, NULL, 1671.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-24 10:16:06', '2023-08-24 10:16:06', 0),
(34, 12, NULL, 'acer-travelmate-tmp214-53-core-i7-11th-gen-512gb-ssd-14-fhd-laptop', 910.0000, NULL, 'fixed', NULL, NULL, 910.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-24 10:16:30', '2023-08-24 10:16:30', 0),
(35, NULL, NULL, 'walton-prelude-n41-pro-celeron-n4120-14-fhd-laptop', 388.0000, NULL, 'fixed', NULL, NULL, 388.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-24 10:20:05', '2023-08-24 10:20:05', 0),
(36, 12, NULL, 'acer-nitro-5-an515-46-r3u8-ryzen-5-6600h-rtx-3050-4gb-graphics-156-qhd-165hz-gaming-laptop', 1072.0000, NULL, 'fixed', NULL, NULL, 1072.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-24 10:25:35', '2023-08-24 10:25:35', 0),
(37, 1, NULL, 'msi-gf63-thin-11uc-core-i5-11th-gen-512gb-ssd-rtx-3050-max-q-4gb-graphics-156-fhd', 1100.0000, NULL, 'fixed', NULL, NULL, 1100.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-24 10:27:50', '2023-08-24 10:27:50', 0),
(38, 9, NULL, 'lenovo-ideapad-3-14aba7-ryzen-5-5625u-14-fhd-laptop', 596.0000, NULL, 'fixed', NULL, NULL, 596.0000, NULL, 0, NULL, 1, 2, 1, NULL, NULL, NULL, '2023-08-24 10:30:24', '2023-08-27 05:02:16', 0),
(39, 9, NULL, 'lenovo-ideapad-slim-3i-core-i3-11th-gen-14-fhd-laptop', 600.0000, NULL, 'fixed', NULL, NULL, 600.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-24 10:32:52', '2023-08-24 10:32:52', 0),
(40, NULL, NULL, 'msi-creator-z16-a11uet-core-i7-11th-gen-rtx-3060-max-q-6gb-graphics-16-qhd-gaming-laptop', 1718.0000, NULL, 'fixed', NULL, NULL, 1718.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-24 10:34:40', '2023-08-24 10:34:40', 0),
(41, 1, NULL, 'msi-gf63-thin-12ucx-core-i5-12th-gen-rtx-2050-4gb-graphics-156-fhd-144hz', 1100.0000, NULL, 'fixed', NULL, NULL, 1100.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-24 10:40:42', '2023-08-24 10:40:42', 0),
(42, 19, NULL, 'walton-prelude-n50-pro-pentium-silver-n5030-14-fhd-laptop', 398.0000, NULL, 'fixed', NULL, NULL, 398.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-24 10:41:32', '2023-08-24 10:41:32', 0),
(43, 9, NULL, 'lenovo-ideapad-1-15amn7-amd-ryzen-5-512gb-ssd-156-fhd-laptop-with-ddr5-ram', 590.0000, NULL, 'fixed', NULL, NULL, 590.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-24 10:45:47', '2023-08-24 10:45:47', 0),
(44, 12, NULL, 'acer-aspire-7-a715-42g-r2ne-ryzen-5-5500u-gtx-1650-4gb-graphics-156-fhd', 900.0000, NULL, 'fixed', NULL, NULL, 900.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-24 10:48:45', '2023-08-24 10:48:45', 0),
(45, 20, NULL, 'amd-athlon-200ge-desktop-pc', 18999.0000, NULL, 'fixed', NULL, NULL, 18999.0000, NULL, 0, NULL, 1, 4, 1, NULL, NULL, NULL, '2023-08-26 06:33:55', '2023-08-26 06:43:14', 0),
(46, 20, NULL, 'amd-ryzen-5-4600g-desktop-pc', 25700.0000, NULL, 'fixed', NULL, NULL, 25700.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-26 06:47:08', '2023-08-26 06:47:08', 0),
(47, 20, NULL, 'amd-ryzen-5-5600g-custom-desktop-pc', 26699.0000, NULL, 'fixed', NULL, NULL, 26699.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-26 06:52:44', '2023-08-26 06:52:44', 0),
(48, 21, NULL, 'google-pixel-6a-android-smartphone-6128gb-sage', 39000.0000, NULL, 'fixed', NULL, NULL, 39000.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-26 06:57:06', '2023-08-26 06:59:48', 0),
(49, 20, NULL, 'amd-ryzen-5-5600g-custom-desktop-pc-x2o0KspP', 26699.0000, NULL, 'fixed', NULL, NULL, 26699.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-26 06:57:08', '2023-08-26 06:57:08', 0),
(50, NULL, NULL, 'intel-10th-gen-core-i3-10100-desktop-pc', 27499.0000, NULL, 'fixed', NULL, NULL, 27499.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-26 07:03:20', '2023-08-26 07:04:15', 0),
(51, 17, NULL, 'samsung-galaxy-a14-smartphone-464gb', 26399.0000, NULL, 'fixed', NULL, NULL, 26399.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-26 07:06:52', '2023-08-26 07:06:52', 0),
(52, 20, NULL, 'amd-ryzen-9-5900x-gaming-desktop-pc', 141999.0000, NULL, 'fixed', NULL, NULL, 141999.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-26 07:08:17', '2023-08-26 07:08:17', 0),
(53, 20, NULL, 'amd-ryzen-5-7600x-gaming-desktop-pc', 118448.0000, NULL, 'fixed', NULL, NULL, 118448.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-26 07:10:42', '2023-08-26 07:10:42', 0),
(54, 17, NULL, 'samsung-galaxy-f13-smartphone-464gb', 25739.0000, NULL, 'fixed', NULL, NULL, 25739.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-26 07:11:43', '2023-08-26 07:11:43', 0),
(55, 20, NULL, 'amd-ryzen-9-7950x-gaming-desktop-pc', 374898.0000, NULL, 'fixed', NULL, NULL, 374898.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-26 07:13:47', '2023-08-26 07:13:47', 0),
(56, 20, NULL, 'amd-ryzen-5-5500-gaming-desktop-pc', 29699.0000, NULL, 'fixed', NULL, NULL, 29699.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-26 07:16:22', '2023-08-26 07:16:22', 0),
(57, 23, NULL, 'oppo-a77s-smartphone-8128gb', 27489.0000, NULL, 'fixed', NULL, NULL, 27489.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-26 07:17:56', '2023-08-26 07:18:51', 0),
(58, NULL, NULL, 'intel-10th-gen-core-i5-10400-gigabyte-special-desktop-pc', 38200.0000, NULL, 'fixed', NULL, NULL, 38200.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-26 07:21:40', '2023-08-26 07:21:40', 0),
(59, 23, NULL, 'oppo-f21s-pro-smartphone-8128gb', 32989.0000, NULL, 'fixed', NULL, NULL, 32989.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-26 07:23:17', '2023-08-26 07:23:17', 0),
(60, 20, NULL, 'amd-ryzen-7-5700g-budget-desktop-pc', 33999.0000, NULL, 'fixed', NULL, NULL, 33999.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-26 07:24:03', '2023-08-26 07:24:03', 0),
(61, 23, NULL, 'oppo-reno8-t-smartphone-8128gb', 36289.0000, NULL, 'fixed', NULL, NULL, 36289.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-26 07:26:38', '2023-08-26 07:26:38', 0),
(62, 24, NULL, 'vivo-v25e-smartphone-8128gb', 35199.0000, NULL, 'fixed', NULL, NULL, 35199.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-26 07:30:29', '2023-08-26 07:32:06', 0),
(63, 9, NULL, 'lenovo-ideacentre-3-amd-athlon-silver-3050u-4gb-ram-1tb-hdd-brand-pc', 29600.0000, NULL, 'fixed', NULL, NULL, 29600.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-26 07:35:25', '2023-08-26 07:35:25', 0),
(64, 24, NULL, 'vivo-v27e-smartphone-8256gb', 38499.0000, NULL, 'fixed', NULL, NULL, 38499.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-26 07:35:45', '2023-08-26 07:35:45', 0),
(65, 24, NULL, 'vivo-v25-5g-smartphone-8256gb', 52799.0000, NULL, 'fixed', NULL, NULL, 52799.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-26 07:38:48', '2023-08-26 07:38:48', 0),
(66, 19, NULL, 'walton-kaiman-ex-g-wdpc710023-intel-core-i3-7100-desktop-pc', 43550.0000, NULL, 'fixed', NULL, NULL, 43550.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-26 07:39:36', '2023-08-26 07:39:36', 0),
(67, 25, NULL, 'realme-9-pro-smartphone-8128gb', 40698.0000, NULL, 'fixed', NULL, NULL, 40698.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-26 07:44:13', '2023-08-26 07:44:13', 0),
(68, 14, NULL, 'hp-pro-tower-280-g9-core-i3-12th-gen-4gb-ram-desktop-pc', 49500.0000, NULL, 'fixed', NULL, NULL, 49500.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-26 07:44:14', '2023-08-26 07:44:14', 0),
(69, 12, NULL, 'acer-veriton-m200-h610-core-i3-12th-gen-brand-pc', 58000.0000, NULL, 'fixed', NULL, NULL, 58000.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-26 07:48:38', '2023-08-26 07:48:38', 0),
(70, 15, NULL, 'oneplus-11-5g-smartphone-8128gb-oneplus-11-5g-smartphone-8128gb', 98989.0000, NULL, 'fixed', NULL, NULL, 98989.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-26 07:48:51', '2023-08-26 07:48:51', 0),
(71, 15, NULL, 'oneplus-nord-ce-3-lite-5g-smartphone-8128gb', 39589.0000, NULL, 'fixed', NULL, NULL, 39589.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-26 07:52:46', '2023-08-26 07:52:46', 0),
(72, 12, NULL, 'acer-veriton-m200-h610-core-i3-12th-gen-brand-pc-uH3fYnRP', 58000.0000, NULL, 'fixed', NULL, NULL, 58000.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-26 07:53:06', '2023-08-26 07:53:06', 0),
(73, 1, NULL, 'msi-mag-infinite-10th-gen-core-i7-256gb-ssd-1tb-hdd-16gb-ram-1660-super-graphics-card-gaming-brand-pc', 1.0000, NULL, 'fixed', NULL, NULL, 1.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-26 07:57:42', '2023-08-26 07:57:42', 0),
(74, 20, NULL, 'amd-ryzen-5-5600g-basic-video-editing-desktop-pc', 53999.0000, NULL, 'fixed', NULL, NULL, 53999.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-26 08:02:10', '2023-08-26 08:02:10', 0),
(75, 17, NULL, 'samsung-galaxy-m53-5g-smartphone-8128gb', 64459.0000, NULL, 'fixed', NULL, NULL, 64459.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-26 08:05:24', '2023-08-26 08:05:24', 0),
(76, NULL, NULL, 'intel-10th-gen-core-i7-10700-custom-desktop-pc', 51699.0000, NULL, 'fixed', NULL, NULL, 51699.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-26 08:07:09', '2023-08-26 08:07:09', 0),
(77, NULL, NULL, 'intel-13th-gen-core-i7-13700k-gaming-desktop-pc', 171999.0000, NULL, 'fixed', NULL, NULL, 171999.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-26 08:09:44', '2023-08-26 08:09:44', 0),
(78, 17, NULL, 'samsung-galaxy-a52s-5g-smartphone-8128gb', 68199.0000, NULL, 'fixed', NULL, NULL, 68199.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-26 08:10:26', '2023-08-26 08:10:26', 0),
(79, NULL, NULL, 'intel-13th-gen-core-i9-13900k-gaming-desktop-pc', 374999.0000, NULL, 'fixed', NULL, NULL, 374999.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-26 08:13:03', '2023-08-26 08:13:03', 0),
(80, 16, NULL, 'huawei-p50-pro-smartphone-8256gb-huawei-p50-pro-smartphone-8256gb', 99000.0000, NULL, 'fixed', NULL, NULL, 99000.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-26 08:14:08', '2023-08-26 08:14:08', 0),
(81, NULL, NULL, 'intel-12th-gen-core-i9-12900k-gaming-desktop-pc', 323999.0000, NULL, 'fixed', NULL, NULL, 323999.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-26 08:17:09', '2023-08-26 08:17:09', 0),
(82, 24, NULL, 'vivo-v23e-smartphone-8128gb-vivo-v23e-smartphone-8128gb-vivo-v23e-smartphone-8128gb', 30789.0000, NULL, 'fixed', NULL, NULL, 30789.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-26 08:17:26', '2023-08-26 08:17:26', 0),
(83, NULL, NULL, 'intel-13th-gen-core-i7-13700k-gaming-desktop-pc-2jqRYIvd', 171999.0000, NULL, 'fixed', NULL, NULL, 171999.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-26 08:20:04', '2023-08-26 08:20:04', 0),
(84, 18, NULL, 'apple-iphone-14-pro-max-512gb-deep-purple-singapore', 198000.0000, NULL, 'fixed', NULL, NULL, 198000.0000, NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, '2023-08-26 08:43:25', '2023-08-26 08:43:25', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_attributes`
--

INSERT INTO `product_attributes` (`id`, `product_id`, `attribute_id`) VALUES
(165, 12, 1),
(166, 12, 2),
(167, 12, 3),
(168, 12, 5),
(169, 12, 7),
(170, 12, 8),
(171, 12, 9),
(190, 17, 1),
(191, 17, 2),
(192, 17, 3),
(193, 17, 12),
(194, 17, 4),
(195, 17, 5),
(196, 17, 6),
(197, 17, 7),
(198, 17, 8),
(199, 17, 9),
(200, 19, 1),
(201, 19, 2),
(202, 19, 3),
(203, 19, 4),
(204, 19, 5),
(205, 19, 6),
(206, 19, 7),
(207, 19, 8),
(208, 19, 8),
(209, 19, 9),
(210, 19, 12),
(211, 20, 1),
(212, 20, 2),
(213, 20, 3),
(214, 20, 12),
(215, 20, 4),
(216, 20, 5),
(217, 20, 6),
(218, 20, 7),
(219, 20, 8),
(220, 20, 9),
(227, 21, 1),
(228, 21, 2),
(229, 21, 3),
(230, 21, 4),
(231, 21, 5),
(232, 21, 6),
(233, 21, 7),
(234, 21, 8),
(235, 21, 9),
(236, 21, 12),
(244, 23, 1),
(245, 23, 2),
(246, 23, 3),
(247, 23, 4),
(248, 23, 5),
(249, 23, 6),
(250, 23, 7),
(251, 23, 8),
(252, 23, 9),
(253, 23, 12),
(261, 24, 1),
(262, 24, 2),
(263, 24, 3),
(264, 24, 6),
(265, 24, 7),
(266, 24, 8),
(267, 24, 9),
(268, 22, 1),
(269, 22, 2),
(270, 22, 3),
(271, 22, 5),
(272, 22, 7),
(273, 22, 8),
(274, 22, 9),
(275, 26, 1),
(276, 26, 2),
(277, 26, 3),
(278, 26, 4),
(279, 26, 5),
(280, 26, 6),
(281, 26, 7),
(282, 26, 8),
(283, 26, 9),
(284, 26, 12),
(285, 18, 1),
(286, 18, 2),
(287, 18, 3),
(288, 18, 5),
(289, 18, 7),
(290, 18, 9),
(299, 27, 1),
(300, 27, 2),
(301, 27, 3),
(302, 27, 4),
(303, 27, 5),
(304, 27, 6),
(305, 27, 7),
(306, 27, 8),
(307, 27, 9),
(308, 27, 12),
(309, 28, 1),
(310, 28, 2),
(311, 28, 3),
(312, 28, 5),
(313, 28, 7),
(314, 28, 8),
(315, 28, 9),
(316, 29, 1),
(317, 29, 2),
(318, 29, 3),
(319, 29, 4),
(320, 29, 5),
(321, 29, 6),
(322, 29, 7),
(323, 29, 8),
(324, 29, 9),
(325, 29, 12),
(326, 30, 1),
(327, 30, 2),
(328, 30, 3),
(329, 30, 6),
(330, 30, 7),
(331, 30, 8),
(332, 30, 9),
(333, 31, 1),
(334, 31, 2),
(335, 31, 3),
(336, 31, 4),
(337, 31, 5),
(338, 31, 6),
(339, 31, 7),
(340, 31, 8),
(341, 31, 9),
(342, 31, 12),
(350, 32, 1),
(351, 32, 2),
(352, 32, 3),
(353, 32, 6),
(354, 32, 7),
(355, 32, 8),
(356, 32, 9),
(357, 33, 1),
(358, 33, 2),
(359, 33, 3),
(360, 33, 5),
(361, 33, 7),
(362, 33, 8),
(363, 33, 9),
(364, 34, 1),
(365, 34, 2),
(366, 34, 3),
(367, 34, 4),
(368, 34, 5),
(369, 34, 6),
(370, 34, 7),
(371, 34, 8),
(372, 34, 9),
(373, 34, 12),
(381, 35, 1),
(382, 35, 2),
(383, 35, 3),
(384, 35, 5),
(385, 35, 7),
(386, 35, 8),
(387, 35, 9),
(395, 36, 1),
(396, 36, 2),
(397, 36, 3),
(398, 36, 5),
(399, 36, 7),
(400, 36, 8),
(401, 36, 9),
(402, 37, 1),
(403, 37, 2),
(404, 37, 3),
(405, 37, 4),
(406, 37, 5),
(407, 37, 6),
(408, 37, 7),
(409, 37, 8),
(410, 37, 9),
(411, 37, 12),
(419, 38, 1),
(420, 38, 2),
(421, 38, 3),
(422, 38, 5),
(423, 38, 7),
(424, 38, 8),
(425, 38, 9),
(426, 39, 1),
(427, 39, 2),
(428, 39, 3),
(429, 39, 4),
(430, 39, 5),
(431, 39, 6),
(432, 39, 7),
(433, 39, 8),
(434, 39, 9),
(435, 39, 12),
(443, 40, 1),
(444, 40, 2),
(445, 40, 3),
(446, 40, 5),
(447, 40, 7),
(448, 40, 8),
(449, 40, 9),
(450, 41, 1),
(451, 41, 2),
(452, 41, 3),
(453, 41, 4),
(454, 41, 5),
(455, 41, 6),
(456, 41, 7),
(457, 41, 8),
(458, 41, 9),
(459, 41, 12),
(467, 42, 1),
(468, 42, 2),
(469, 42, 3),
(470, 42, 5),
(471, 42, 7),
(472, 42, 8),
(473, 42, 9),
(481, 43, 1),
(482, 43, 2),
(483, 43, 3),
(484, 43, 5),
(485, 43, 7),
(486, 43, 8),
(487, 43, 9),
(488, 44, 1),
(489, 44, 2),
(490, 44, 3),
(491, 44, 4),
(492, 44, 5),
(493, 44, 6),
(494, 44, 7),
(495, 44, 8),
(496, 44, 9),
(497, 44, 12),
(499, 45, 8),
(500, 45, 7),
(501, 45, 5),
(502, 46, 8),
(503, 46, 5),
(504, 46, 7),
(511, 47, 8),
(512, 47, 5),
(513, 47, 7),
(514, 48, 7),
(515, 48, 2),
(519, 50, 8),
(520, 50, 5),
(521, 50, 7),
(522, 49, 8),
(523, 51, 7),
(524, 51, 2),
(525, 52, 8),
(526, 52, 5),
(527, 52, 7),
(531, 53, 5),
(532, 53, 7),
(533, 53, 8),
(534, 54, 7),
(535, 54, 2),
(536, 55, 5),
(537, 55, 7),
(538, 55, 8),
(544, 57, 7),
(545, 57, 2),
(546, 56, 5),
(547, 56, 7),
(548, 56, 8),
(549, 58, 8),
(550, 58, 5),
(551, 58, 7),
(552, 59, 7),
(553, 59, 2),
(554, 60, 8),
(555, 60, 5),
(556, 60, 7),
(557, 61, 7),
(558, 61, 2),
(561, 62, 7),
(562, 62, 2),
(567, 64, 7),
(568, 64, 2),
(569, 63, 3),
(570, 63, 5),
(571, 63, 7),
(572, 63, 8),
(573, 65, 7),
(574, 65, 2),
(575, 66, 8),
(576, 66, 5),
(577, 66, 6),
(578, 66, 7),
(579, 67, 7),
(580, 67, 2),
(584, 68, 8),
(585, 68, 6),
(586, 68, 7),
(587, 69, 8),
(588, 69, 6),
(589, 69, 7),
(590, 70, 7),
(591, 70, 2),
(592, 71, 7),
(593, 71, 2),
(594, 72, 8),
(595, 72, 6),
(596, 72, 7),
(600, 73, 5),
(601, 73, 7),
(602, 73, 8),
(603, 74, 8),
(604, 74, 5),
(605, 74, 6),
(606, 74, 7),
(607, 75, 7),
(608, 75, 2),
(609, 76, 8),
(610, 76, 5),
(611, 76, 6),
(612, 76, 7),
(613, 77, 8),
(614, 77, 5),
(615, 77, 7),
(616, 78, 7),
(617, 78, 2),
(621, 80, 7),
(622, 80, 2),
(623, 79, 8),
(624, 79, 5),
(625, 79, 7),
(626, 81, 8),
(627, 81, 5),
(628, 81, 7),
(629, 82, 7),
(630, 82, 2),
(631, 83, 8),
(632, 83, 5),
(633, 83, 7),
(634, 84, 7),
(635, 84, 2),
(652, 2, 1),
(653, 2, 8),
(654, 2, 9),
(655, 2, 7),
(656, 2, 4),
(657, 2, 5),
(658, 2, 3),
(659, 2, 2),
(660, 1, 1),
(661, 1, 5),
(662, 1, 2),
(663, 1, 3),
(664, 1, 7),
(665, 1, 8),
(666, 1, 9),
(667, 4, 1),
(668, 4, 2),
(669, 4, 3),
(670, 4, 5),
(671, 4, 7),
(672, 4, 8),
(673, 4, 9),
(674, 3, 1),
(675, 3, 2),
(676, 3, 3),
(677, 3, 4),
(678, 3, 5),
(679, 3, 7),
(680, 3, 8),
(681, 3, 9),
(682, 5, 1),
(683, 5, 2),
(684, 5, 3),
(685, 5, 4),
(686, 5, 5),
(687, 5, 6),
(688, 5, 7),
(689, 5, 8),
(690, 5, 9),
(691, 6, 1),
(692, 6, 2),
(693, 6, 3),
(694, 6, 4),
(695, 6, 5),
(696, 6, 6),
(697, 6, 6),
(698, 6, 8),
(699, 6, 9),
(700, 6, 12),
(701, 7, 1),
(702, 7, 2),
(703, 7, 3),
(704, 7, 5),
(705, 7, 7),
(706, 7, 8),
(707, 7, 9),
(708, 8, 1),
(709, 8, 2),
(710, 8, 3),
(711, 8, 4),
(712, 8, 5),
(713, 8, 6),
(714, 8, 7),
(715, 8, 8),
(716, 8, 9),
(717, 8, 12),
(718, 9, 1),
(719, 9, 2),
(720, 9, 3),
(721, 9, 4),
(722, 9, 5),
(723, 9, 7),
(724, 9, 8),
(725, 9, 9),
(726, 10, 1),
(727, 10, 2),
(728, 10, 3),
(729, 10, 4),
(730, 10, 5),
(731, 10, 6),
(732, 10, 7),
(733, 10, 8),
(734, 10, 9),
(735, 10, 12),
(736, 11, 1),
(737, 11, 2),
(738, 11, 3),
(739, 11, 5),
(740, 11, 7),
(741, 11, 8),
(742, 11, 12),
(743, 13, 1),
(744, 13, 2),
(745, 13, 3),
(746, 13, 4),
(747, 13, 5),
(748, 13, 6),
(749, 13, 7),
(750, 13, 8),
(751, 13, 9),
(752, 13, 12),
(753, 14, 1),
(754, 14, 2),
(755, 14, 3),
(756, 14, 5),
(757, 14, 6),
(758, 14, 7),
(759, 14, 8),
(760, 14, 12),
(761, 15, 1),
(762, 15, 2),
(763, 15, 3),
(764, 15, 4),
(765, 15, 5),
(766, 15, 6),
(767, 15, 7),
(768, 15, 8),
(769, 15, 9),
(770, 15, 12);

-- --------------------------------------------------------

--
-- Table structure for table `product_attribute_values`
--

CREATE TABLE `product_attribute_values` (
  `product_attribute_id` int(10) UNSIGNED NOT NULL,
  `attribute_value_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_attribute_values`
--

INSERT INTO `product_attribute_values` (`product_attribute_id`, `attribute_value_id`) VALUES
(165, 7),
(166, 12),
(166, 13),
(166, 14),
(167, 65),
(168, 28),
(169, 38),
(170, 79),
(171, 47),
(190, 5),
(191, 12),
(191, 13),
(191, 15),
(192, 17),
(192, 18),
(192, 19),
(193, 68),
(193, 69),
(193, 71),
(194, 24),
(195, 27),
(195, 28),
(195, 29),
(196, 32),
(196, 33),
(197, 36),
(197, 37),
(197, 39),
(197, 40),
(198, 42),
(198, 43),
(199, 47),
(200, 7),
(201, 12),
(201, 13),
(201, 14),
(202, 19),
(202, 20),
(202, 22),
(203, 24),
(204, 27),
(204, 28),
(204, 29),
(205, 32),
(206, 36),
(206, 37),
(206, 38),
(207, 42),
(207, 43),
(208, 42),
(208, 43),
(209, 47),
(210, 68),
(211, 10),
(212, 12),
(212, 13),
(212, 14),
(213, 17),
(213, 19),
(214, 68),
(214, 69),
(214, 70),
(214, 72),
(215, 24),
(216, 27),
(216, 28),
(216, 30),
(217, 32),
(217, 34),
(218, 36),
(218, 37),
(218, 38),
(218, 39),
(219, 42),
(220, 47),
(227, 6),
(228, 12),
(228, 13),
(228, 14),
(229, 19),
(229, 20),
(229, 22),
(230, 24),
(231, 27),
(231, 28),
(231, 29),
(232, 32),
(233, 36),
(233, 37),
(233, 38),
(234, 42),
(234, 43),
(235, 47),
(236, 68),
(244, 3),
(245, 12),
(245, 13),
(245, 14),
(246, 19),
(246, 20),
(246, 22),
(247, 24),
(248, 27),
(248, 28),
(248, 29),
(249, 32),
(250, 36),
(250, 37),
(250, 38),
(251, 42),
(251, 43),
(252, 47),
(253, 68),
(261, 5),
(262, 14),
(263, 22),
(264, 33),
(265, 37),
(266, 84),
(267, 47),
(268, 6),
(269, 12),
(270, 22),
(271, 29),
(272, 38),
(273, 79),
(274, 47),
(275, 6),
(276, 12),
(276, 13),
(276, 14),
(277, 19),
(277, 20),
(277, 22),
(278, 24),
(279, 27),
(279, 28),
(279, 29),
(280, 32),
(281, 36),
(281, 37),
(281, 38),
(282, 42),
(282, 43),
(283, 47),
(284, 68),
(285, 3),
(286, 12),
(286, 13),
(287, 22),
(288, 29),
(289, 38),
(290, 47),
(299, 7),
(300, 12),
(300, 13),
(300, 14),
(301, 19),
(301, 20),
(301, 22),
(302, 24),
(303, 27),
(303, 28),
(303, 29),
(304, 32),
(305, 36),
(305, 37),
(305, 38),
(306, 42),
(306, 43),
(307, 47),
(308, 68),
(309, 3),
(310, 12),
(311, 22),
(312, 30),
(313, 41),
(314, 79),
(315, 47),
(316, 5),
(317, 12),
(317, 13),
(317, 14),
(318, 19),
(318, 20),
(318, 22),
(319, 24),
(320, 27),
(320, 28),
(320, 29),
(321, 32),
(322, 36),
(322, 37),
(322, 38),
(323, 42),
(324, 47),
(325, 68),
(326, 5),
(327, 14),
(328, 22),
(329, 33),
(330, 37),
(331, 84),
(332, 47),
(333, 7),
(334, 12),
(334, 13),
(334, 14),
(335, 19),
(335, 20),
(335, 22),
(336, 24),
(337, 27),
(337, 28),
(337, 29),
(338, 32),
(339, 36),
(339, 37),
(339, 38),
(340, 42),
(341, 47),
(342, 68),
(350, 7),
(351, 14),
(351, 75),
(352, 65),
(353, 32),
(354, 38),
(355, 85),
(356, 47),
(357, 3),
(358, 12),
(359, 20),
(360, 30),
(361, 41),
(362, 80),
(363, 47),
(364, 6),
(365, 12),
(365, 13),
(365, 14),
(366, 19),
(366, 20),
(366, 22),
(367, 24),
(368, 27),
(368, 28),
(368, 29),
(369, 32),
(370, 36),
(370, 37),
(370, 38),
(371, 42),
(372, 47),
(373, 68),
(381, 64),
(382, 12),
(383, 65),
(384, 28),
(385, 38),
(386, 67),
(387, 47),
(395, 6),
(396, 12),
(397, 22),
(398, 30),
(399, 38),
(400, 87),
(401, 48),
(402, 3),
(403, 12),
(403, 13),
(403, 14),
(404, 19),
(404, 20),
(404, 22),
(405, 24),
(406, 27),
(406, 28),
(406, 29),
(407, 32),
(408, 36),
(408, 37),
(408, 38),
(409, 42),
(410, 47),
(411, 68),
(419, 7),
(420, 12),
(420, 75),
(421, 65),
(422, 28),
(423, 38),
(424, 88),
(425, 48),
(426, 7),
(427, 12),
(427, 13),
(427, 14),
(428, 19),
(428, 20),
(428, 22),
(429, 24),
(430, 27),
(430, 28),
(430, 29),
(431, 32),
(432, 36),
(432, 37),
(432, 38),
(433, 43),
(434, 47),
(435, 68),
(443, 3),
(444, 12),
(444, 75),
(445, 20),
(446, 29),
(447, 41),
(448, 89),
(449, 47),
(450, 3),
(451, 12),
(451, 13),
(451, 14),
(452, 19),
(452, 20),
(452, 22),
(453, 24),
(454, 27),
(454, 28),
(454, 29),
(455, 32),
(456, 36),
(456, 37),
(456, 38),
(457, 42),
(458, 47),
(459, 68),
(467, 64),
(468, 12),
(469, 65),
(470, 28),
(471, 38),
(472, 90),
(473, 47),
(481, 7),
(482, 14),
(482, 75),
(483, 22),
(484, 29),
(485, 38),
(486, 91),
(487, 48),
(488, 6),
(489, 12),
(489, 13),
(489, 14),
(490, 19),
(490, 20),
(490, 22),
(491, 24),
(492, 27),
(492, 28),
(492, 29),
(493, 32),
(494, 36),
(494, 37),
(494, 38),
(495, 42),
(496, 47),
(497, 68),
(499, 96),
(500, 36),
(500, 37),
(500, 38),
(500, 39),
(501, 28),
(501, 29),
(502, 97),
(503, 27),
(503, 28),
(503, 29),
(504, 37),
(504, 38),
(504, 39),
(504, 40),
(504, 41),
(511, 97),
(512, 28),
(512, 29),
(513, 38),
(513, 39),
(513, 40),
(513, 41),
(514, 36),
(514, 37),
(514, 39),
(515, 12),
(515, 13),
(515, 14),
(519, 92),
(520, 28),
(520, 29),
(521, 38),
(521, 39),
(521, 40),
(521, 41),
(522, 96),
(523, 36),
(523, 37),
(523, 39),
(524, 12),
(524, 13),
(524, 14),
(524, 15),
(525, 99),
(526, 29),
(526, 30),
(527, 40),
(527, 41),
(531, 28),
(531, 29),
(532, 38),
(532, 41),
(533, 97),
(534, 36),
(534, 37),
(534, 39),
(535, 12),
(535, 13),
(535, 14),
(535, 15),
(536, 29),
(536, 30),
(536, 31),
(537, 38),
(537, 40),
(537, 41),
(538, 99),
(544, 36),
(544, 37),
(544, 38),
(544, 39),
(545, 12),
(545, 13),
(545, 14),
(545, 15),
(546, 28),
(546, 29),
(547, 38),
(547, 40),
(547, 41),
(548, 97),
(549, 93),
(550, 28),
(550, 29),
(551, 38),
(551, 41),
(552, 36),
(552, 37),
(552, 38),
(552, 39),
(553, 12),
(553, 13),
(553, 14),
(553, 15),
(554, 98),
(555, 28),
(555, 29),
(556, 38),
(556, 40),
(556, 41),
(557, 36),
(557, 37),
(557, 38),
(557, 39),
(558, 12),
(558, 13),
(558, 14),
(558, 15),
(561, 37),
(561, 38),
(561, 39),
(562, 12),
(562, 13),
(562, 14),
(562, 15),
(567, 37),
(567, 38),
(567, 39),
(568, 12),
(568, 13),
(568, 14),
(568, 15),
(569, 65),
(570, 28),
(570, 29),
(571, 38),
(571, 39),
(571, 40),
(572, 96),
(573, 37),
(573, 38),
(573, 39),
(574, 12),
(574, 13),
(574, 14),
(574, 15),
(575, 92),
(576, 28),
(577, 33),
(578, 38),
(578, 41),
(579, 37),
(579, 38),
(579, 39),
(580, 12),
(580, 13),
(580, 14),
(580, 15),
(584, 92),
(585, 33),
(586, 37),
(586, 38),
(587, 92),
(588, 33),
(589, 37),
(589, 38),
(590, 37),
(590, 38),
(590, 39),
(591, 12),
(591, 13),
(591, 14),
(591, 15),
(592, 37),
(592, 38),
(592, 39),
(593, 12),
(593, 13),
(593, 14),
(594, 92),
(595, 33),
(596, 37),
(596, 38),
(600, 28),
(600, 29),
(600, 30),
(601, 38),
(601, 41),
(602, 94),
(603, 97),
(604, 28),
(605, 33),
(606, 41),
(607, 37),
(607, 38),
(607, 39),
(608, 12),
(608, 13),
(608, 14),
(608, 15),
(609, 94),
(610, 29),
(611, 33),
(612, 41),
(613, 94),
(614, 29),
(614, 30),
(615, 41),
(616, 37),
(616, 38),
(616, 39),
(617, 12),
(617, 13),
(617, 14),
(617, 15),
(621, 37),
(621, 38),
(621, 39),
(622, 12),
(622, 13),
(622, 14),
(622, 15),
(623, 95),
(624, 30),
(624, 31),
(625, 41),
(626, 95),
(627, 29),
(627, 30),
(628, 41),
(629, 37),
(629, 38),
(629, 39),
(630, 12),
(630, 13),
(630, 14),
(630, 15),
(631, 94),
(632, 29),
(632, 30),
(633, 41),
(634, 39),
(635, 12),
(635, 14),
(635, 15),
(635, 75),
(652, 3),
(653, 42),
(654, 47),
(655, 36),
(655, 37),
(656, 24),
(657, 27),
(657, 29),
(658, 20),
(659, 12),
(659, 13),
(659, 14),
(660, 3),
(661, 27),
(661, 28),
(661, 29),
(662, 12),
(662, 13),
(662, 14),
(663, 16),
(663, 17),
(663, 19),
(664, 36),
(664, 37),
(664, 39),
(665, 42),
(665, 43),
(665, 44),
(666, 47),
(666, 48),
(666, 49),
(666, 50),
(667, 6),
(668, 12),
(668, 14),
(668, 15),
(669, 19),
(669, 21),
(670, 27),
(670, 28),
(670, 29),
(671, 36),
(671, 37),
(671, 38),
(672, 43),
(673, 47),
(674, 1),
(675, 12),
(675, 14),
(675, 15),
(676, 19),
(677, 24),
(678, 28),
(679, 38),
(680, 67),
(681, 47),
(682, 3),
(683, 12),
(683, 13),
(683, 14),
(684, 19),
(684, 20),
(685, 24),
(686, 27),
(686, 28),
(686, 29),
(687, 32),
(687, 33),
(688, 36),
(688, 37),
(688, 38),
(689, 42),
(689, 43),
(690, 47),
(691, 6),
(692, 12),
(692, 13),
(692, 14),
(693, 19),
(693, 20),
(693, 22),
(694, 24),
(695, 27),
(695, 28),
(695, 29),
(696, 32),
(696, 33),
(697, 32),
(698, 42),
(698, 43),
(699, 47),
(700, 68),
(701, 9),
(702, 12),
(702, 14),
(703, 19),
(704, 29),
(705, 38),
(706, 79),
(707, 47),
(708, 7),
(709, 12),
(709, 13),
(709, 14),
(710, 19),
(710, 20),
(710, 22),
(711, 24),
(712, 27),
(712, 28),
(712, 29),
(713, 32),
(714, 36),
(714, 37),
(714, 38),
(715, 42),
(715, 43),
(716, 47),
(717, 68),
(718, 6),
(719, 12),
(719, 14),
(720, 22),
(721, 26),
(722, 29),
(723, 38),
(724, 79),
(725, 47),
(726, 7),
(727, 12),
(727, 13),
(727, 14),
(728, 20),
(728, 21),
(728, 22),
(729, 24),
(730, 27),
(730, 28),
(730, 29),
(731, 32),
(732, 36),
(732, 37),
(732, 38),
(733, 42),
(733, 43),
(734, 47),
(735, 68),
(736, 83),
(737, 13),
(737, 14),
(737, 15),
(737, 75),
(738, 19),
(738, 20),
(738, 21),
(738, 22),
(739, 27),
(739, 28),
(739, 29),
(739, 30),
(740, 36),
(740, 37),
(740, 39),
(740, 40),
(741, 42),
(741, 43),
(741, 45),
(742, 68),
(742, 69),
(742, 70),
(743, 3),
(744, 12),
(744, 13),
(744, 14),
(745, 19),
(745, 20),
(745, 22),
(746, 24),
(747, 27),
(747, 28),
(747, 29),
(748, 32),
(749, 36),
(749, 37),
(749, 38),
(750, 42),
(750, 43),
(751, 47),
(752, 68),
(753, 1),
(754, 12),
(754, 14),
(754, 15),
(754, 75),
(755, 19),
(755, 20),
(755, 21),
(756, 27),
(756, 28),
(756, 29),
(757, 32),
(758, 36),
(758, 37),
(758, 39),
(759, 42),
(760, 68),
(760, 70),
(760, 72),
(761, 6),
(762, 12),
(762, 13),
(762, 14),
(763, 19),
(763, 20),
(763, 22),
(764, 24),
(765, 27),
(765, 28),
(765, 29),
(766, 32),
(767, 36),
(767, 37),
(767, 38),
(768, 42),
(768, 43),
(769, 47),
(770, 68);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`product_id`, `category_id`) VALUES
(1, 1),
(2, 1),
(2, 2),
(2, 3),
(2, 13),
(2, 14),
(2, 15),
(3, 1),
(3, 3),
(3, 75),
(4, 1),
(4, 2),
(4, 3),
(4, 61),
(5, 1),
(5, 2),
(5, 3),
(7, 1),
(7, 3),
(8, 13),
(8, 14),
(8, 15),
(8, 21),
(8, 64),
(9, 1),
(9, 2),
(9, 3),
(9, 19),
(9, 61),
(10, 1),
(10, 61),
(10, 64),
(11, 1),
(11, 2),
(11, 3),
(11, 4),
(12, 1),
(12, 2),
(12, 3),
(14, 1),
(14, 2),
(14, 3),
(16, 1),
(16, 2),
(16, 3),
(17, 1),
(17, 2),
(17, 3),
(18, 1),
(18, 2),
(18, 3),
(22, 1),
(22, 3),
(24, 1),
(24, 2),
(24, 3),
(25, 1),
(25, 2),
(25, 3),
(28, 1),
(28, 2),
(28, 3),
(30, 1),
(30, 2),
(30, 3),
(32, 1),
(32, 2),
(32, 3),
(33, 1),
(33, 2),
(33, 3),
(35, 1),
(35, 3),
(36, 1),
(36, 2),
(36, 3),
(38, 1),
(38, 2),
(38, 3),
(42, 1),
(42, 3),
(43, 1),
(43, 3),
(45, 5),
(45, 6),
(47, 5),
(47, 6),
(48, 29),
(48, 31),
(49, 5),
(49, 6),
(50, 5),
(50, 6),
(51, 29),
(51, 31),
(52, 5),
(52, 6),
(53, 5),
(53, 6),
(54, 29),
(54, 31),
(55, 5),
(55, 6),
(56, 5),
(56, 6),
(57, 29),
(57, 31),
(58, 5),
(58, 6),
(59, 29),
(59, 31),
(60, 5),
(60, 6),
(61, 29),
(61, 31),
(62, 29),
(62, 31),
(63, 5),
(63, 6),
(63, 7),
(63, 8),
(63, 9),
(64, 29),
(64, 31),
(65, 29),
(65, 31),
(66, 5),
(66, 7),
(66, 8),
(67, 29),
(67, 31),
(68, 5),
(68, 7),
(68, 9),
(69, 5),
(69, 9),
(70, 29),
(70, 31),
(71, 29),
(71, 31),
(72, 5),
(72, 7),
(72, 9),
(73, 5),
(73, 6),
(73, 7),
(73, 9),
(74, 5),
(74, 7),
(74, 8),
(74, 9),
(75, 29),
(75, 31),
(76, 5),
(76, 6),
(76, 7),
(76, 8),
(77, 5),
(77, 8),
(78, 29),
(78, 31),
(79, 5),
(79, 8),
(80, 29),
(80, 31),
(81, 5),
(81, 7),
(81, 8),
(82, 29),
(82, 31),
(83, 5),
(83, 8),
(83, 9),
(84, 29),
(84, 30),
(84, 32),
(84, 34);

-- --------------------------------------------------------

--
-- Table structure for table `product_options`
--

CREATE TABLE `product_options` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `option_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_options`
--

INSERT INTO `product_options` (`product_id`, `option_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 6),
(11, 4),
(11, 5);

-- --------------------------------------------------------

--
-- Table structure for table `product_tags`
--

CREATE TABLE `product_tags` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_tags`
--

INSERT INTO `product_tags` (`product_id`, `tag_id`) VALUES
(1, 3),
(2, 3),
(14, 3);

-- --------------------------------------------------------

--
-- Table structure for table `product_translations`
--

CREATE TABLE `product_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_translations`
--

INSERT INTO `product_translations` (`id`, `product_id`, `locale`, `name`, `description`, `short_description`) VALUES
(1, 1, 'en', 'MSI Summit E13 Flip Evo A13MT Core i7 13th Gen 13.4\" FHD+ 120Hz Touch Laptop', '<h2>MSI Summit E13 Flip Evo A13MT Core i7 13th Gen 13.4\" FHD+ Touch Laptop</h2>\r\n<p>The MSI Summit E13 Flip Evo A13MT is a 2 in 1 laptop with a 360&deg; Flip design. It has a 16:10 display ratio. Its sleek edges and brushed line engravings are the result of an intricate CNC process. The laptop is powered by an Intel Core i7-1360P processor (18M Cache, 2.20 GHz up to 5.00 GHz) and features a 13.4\" FHD+ 120Hz display with 100% sRGB coverage. MSI Summit E13 Flip Evo A13MT comes with 32GB of LPDDR5 RAM and a 1TB NVMe SSD. The laptop is integrated with Intel Iris Xe graphics. MSI Pen support enhances creativity, while enterprise-grade security safeguards data. It offers Thunderbolt 4 to ensure ultimate connectivity, and the exclusive MSI Center allows advanced optimization.</p>\r\n<h3>13th Gen Intel Core i7 Processor</h3>\r\n<p>The MSI Summit E13 Flip Evo A13MT laptop is equipped with the Intel Core i7-1360P processor. With its 18M Cache and base clock of 2.20 GHz, capable of turbo boosting up to an impressive 5.00 GHz, this laptop ensures seamless multitasking and smooth execution of demanding tasks.</p>\r\n<h3>Golden Ratio Display</h3>\r\n<p>The MSI Summit E13 Flip Evo A13MT Laptop utilizes a 16:10 display to fully demonstrate the appeal of the Golden Ratio: 1.618. It is designed for users to have the most comfortable visual experience for long term use. The 13-inch lightweight body is compatible with the MSI Pen making this combination of a compact and aesthetically pleasing laptop design fit for any work environment.</p>\r\n<h3>MSI Pen Support</h3>\r\n<p>MSI Summit E13 Flip Evo A13MT comes with an MSI Pen. The MSI Pen sets a whole new standard for how sketching, note-taking, copyrighting and signing documents will be as part of your day-to-day workflow.</p>\r\n<h3>Enjoy password-free experience</h3>\r\n<p>The&nbsp;MSI Summit E13 Flip Evo A13MT 13.4\" laptop comes with&nbsp;IR FHD type (30fps@1080p) Camera and&nbsp;Fingerprint Security. It enables you to use the laptop without having to type in passwords.</p>\r\n<h2>Buy MSI Summit E13 Flip Evo A13MT Core i7 13th Gen 13.4\" Laptop from Star Tech</h2>\r\n<p>In Bangladesh, you can get original&nbsp;MSI Summit E13 Flip Evo A13MT Core i7 13th Gen 13.4\" Laptop&nbsp;From Star Tech. We have a large collection of latest&nbsp;MSI Premium Ultrabook Laptop&nbsp;to purchase. Order Online Or Visit your Nearest&nbsp;<a href=\"https://www.startech.com.bd/\" target=\"\">Star Tech</a>&nbsp;Shop to get yours at lowest price. The MSI Summit E13 Flip Evo A13MT Core i7 13th Gen 13.4\" Laptop comes with 2 years warranty.</p>', NULL),
(2, 2, 'en', 'MSI GF63 THIN 12UCX Core i5 12th Gen RTX 2050 4GB Graphics 15.6\" FHD 144hz Gaming Laptop', '<section id=\"description\" class=\"description bg-white m-tb-15\">\r\n<div class=\"full-description\">\r\n<h2>MSI GF63 THIN 12UCX Core i5 12th Gen RTX 2050 4GB Graphics 15.6\" FHD 144hz Gaming Laptop</h2>\r\n<p>The MSI GF63 THIN 12UCX Gaming&nbsp;Laptop&nbsp;is an impressive machine designed for gamers who demand high-performance hardware. This laptop boasts a 15.6-inch Full HD display with a resolution of 1920 x 1080 and a fast refresh rate of 144Hz, providing users with smooth and fluid visuals during gaming sessions. The laptop is powered by an Intel Core i5-12450H (12M Cache, 3.30 GHz up to 4.40 GHz), which is a high-performance CPU that can handle demanding tasks with ease. It comes with a DDR IV 8GB RAM, operating at 3200MHz, ensuring smooth multitasking and efficient processing. For graphics, the MSI GF63 THIN 12UCX Gaming Laptop is equipped with an NVIDIA RTX 2050 graphics card with 4GB of GDDR6 memory. This graphics card provides stunning visuals and an immersive gaming experience with realistic graphics and high frame rates. The laptop also comes with a 512GB NVMe PCIe SSD Gen4x4 storage solution, which provides lightning-fast read and writes speeds. This storage solution does not have DRAM, but its performance is still impressive. The MSI GF63 THIN 12UCX Gaming Laptop has a 45% NTSC IPS-Level display, which provides accurate color reproduction and excellent viewing angles. It also features Intel Wi-Fi 6 AX201(2*2 ax) and Bluetooth 5.2 for fast and reliable wireless connectivity. This laptop has a 3-cell, 52.4Whr battery, which provides users with up to 8 hours of use on a single charge. Overall, the MSI GF63 THIN 12UCX Gaming Laptop is a powerful and efficient gaming machine that is perfect for gamers who need a reliable and high-performance laptop.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<h2>Buy MSI GF63 THIN 12UCX Core i5 12th Gen RTX 2050 4GB Graphics 15.6\" FHD 144hz Gaming Laptop from the best Laptop Shop in BD</h2>\r\n<p>In Bangladesh, you can get original&nbsp;MSI GF63 THIN 12UCX Core i5 12th Gen RTX 2050 4GB Graphics 15.6\" FHD 144hz Gaming Laptop&nbsp;From Star Tech. We have a large collection of the latest&nbsp;MSI Laptops to purchase. Order Online Or Visit your Nearest&nbsp;&nbsp;Shop to get yours at the lowest price. The&nbsp;MSI GF63 THIN 12UCX Core i5 12th Gen Gaming Laptop comes with 02 year International Warranty.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n</div>\r\n</section>\r\n<section id=\"latest-price\" class=\"latest-price bg-white m-tb-15\">\r\n<div class=\"section-head\">\r\n<h2>What is the price of MSI GF63 THIN 12UCX Core i5 12th Gen Gaming Laptop in Bangladesh?</h2>\r\n</div>\r\n<p>The latest price of MSI GF63 THIN 12UCX Core i5 12th Gen Gaming Laptop in Bangladesh is 108,500৳. You can buy the MSI GF63 THIN 12UCX Core i5 12th Gen Gaming Laptop at best price from our website or visit any of our showrooms.</p>\r\n</section>', NULL),
(3, 3, 'en', 'Walton Prelude N40 Pro Celeron N4020 14\" FHD Laptop', '<h2>Walton Prelude N40 Pro Celeron N4020 14\" FHD Laptop</h2>\r\n<p>The Walton Prelude N40 Pro Laptop is powered by an Intel Celeron N4020 Processor (4MB Cache, 1.10 GHz up to 2.80 GHz). The laptop comes with 8GB DDR4 2666MHz RAM and 256GB SATAIII M.2 2280 SSD for storage. It features a crystal-clear 14.0\" FHD display, a high-speed storage solution, a portable design, an abundance of ports for connectivity, and even includes a Bengali font on the keyboard. With its Intel Celeron N4020 processor, Intel UHD Graphics 600, and ample memory and storage options, this laptop offers a well-rounded package for work, entertainment, and productivity.</p>\r\n<h3>Crystal Clear Display</h3>\r\n<p>The Walton Prelude N40 Pro boasts a 14.0\" FHD (1920x1080) 16:9 panel with a slim 3.0mm bezel, ensuring a visually immersive experience. Whether you\'re streaming videos, editing photos, or working on documents, the crystal-clear display delivers sharp visuals and vibrant colors, enhancing your viewing pleasure.</p>\r\n<h3>High-Speed Storage</h3>\r\n<p>The Walton Prelude N40 Pro offers high-speed storage for speedy boot-up times and snappy program launches with a 256GB M.2 2280 SSD using a SATA interface. Additionally, the&nbsp;laptop&nbsp;has an extendable storage slot that lets you increase the storage capacity to 512GB. By doing this, you can be sure that you have enough room for your files, documents, and multimedia content.</p>\r\n<h3>Lightweight &amp; Portable</h3>\r\n<p>This Walton Prelude N40 Pro is incredibly thin and portable, weighing only 1.29kg with the absolute minimum and 36WH battery. Its thin profile, which measures 17.9 mm in thickness, makes it simple to carry in your luggage or backpack so you can continue to be productive while on the go.</p>\r\n<h3>Plenty of Ports</h3>\r\n<p>The&nbsp;Walton Prelude N40 Pro Laptop offers a variety of ports to meet your connectivity needs. It includes one USB 2.0 port, one USB 3.2 Gen 1 port (Type A), one USB 3.2 Gen 1 port (Type C), an HDMI output port, a 2-in-1 audio jack for headphones and microphones, and a DC-in jack.</p>\r\n<h3>Bengali Font on Keyboard</h3>\r\n<p>The Walton Prelude N40 Pro includes a multi-language isolated keyboard, which features a Bengali font. This allows users who require Bengali input to type comfortably and efficiently, enhancing their overall user experience.</p>\r\n<h2>Buy Walton Prelude N40 Pro Celeron N4020 14\" FHD Laptop from Star Tech</h2>\r\n<p>In Bangladesh, you can get original&nbsp;Walton Prelude N40 Pro Celeron N4020 14\" FHD Laptop From . We have a large collection of latest&nbsp;Walton Laptop to purchase. Order Online Or Visit your Nearest Shop to get yours at lowest price. The Walton Prelude N40 Pro Celeron N4020 14\" FHD Laptop comes with 1 year warranty.</p>', NULL),
(4, 4, 'en', 'Acer TravelMate TMP214-53 Core i3 11th Gen 8GB RAM 14\" FHD Laptop', '<h2>Acer TravelMate TMP214-53 Core i3 11th Gen 8GB RAM 14\" FHD Laptop</h2>\r\n<p>The&nbsp;Acer TravelMate TMP214-53 Laptop comes with&nbsp;Intel Core i3-1115G4 Processor (6M Cache, 3.00 GHz up to 4.10 GHz) and 8GB DDR4 3200MHz RAM. It features a 512 GB M.2 NVME SSD. This laptop has Integrated-Intel UHD Graphics and a 14\" IPS Full HD (1920X1080) Display with a Wide Viewing Angle of up to 170 Degrees. It runs on the Free DOS operating system. It has a 48 Wh 3-cell Li-ion battery and the Battery life lasts up to 10 hours. It comes with a 3-pin 45 W AC adapter. The laptop has two built-in stereo speakers (1.5Wx2=3W). It has a Standard Keyboard and HD Cam with Mic. It has been designed with 4 x USB 3.1 (Including 1 power-off charging &amp; 1 Type C), 1 x HDMI, 1 x VGA, 1 x Headset/speaker jack, and a power port. The Acer TravelMate TMP214-53 has 3 years of warranty (Battery Adapter 01 year).</p>', NULL),
(5, 5, 'en', 'MSI Modern 15 A11MU Core i7 11th Gen 15.6\" FHD Laptop', '<h2>MSI Modern 15 A11MU Core i7 11th Gen 15.6\" FHD Laptop</h2>\r\n<p>The MSI Modern 15 A11MU is a sleek and powerful laptop designed for productivity and performance. It features a 15.6\" Full HD display with a resolution of 1920x1080, providing crisp and vibrant visuals for your work and entertainment needs. The laptop is equipped with an Intel Core i7-1195G7 processor, which offers a base clock speed of 2.90 GHz and a turbo boost speed of up to 5.00 GHz. This high-performance processor, coupled with its 12MB cache, ensures smooth multitasking and efficient handling of demanding applications. With 8GB of DDR4 3200MHz RAM, the Modern 15 A11MU offers ample memory for seamless multitasking and smooth operation. The 512GB SSD provides fast storage and quick access to your files, allowing for swift boot times and rapid data transfer speeds. Whether you\'re working on large projects or storing a vast media collection, the ample storage capacity ensures you have enough space to accommodate your needs. The MSI Modern 15 A11MU is its backlit keyboard, which enhances visibility in low-light environments and adds a stylish touch to the overall design. Additionally, the laptop includes a Type-C port, which offers versatile connectivity options for external devices and high-speed data transfer. The MSI Modern 15 A11MU is a powerful and portable laptop that combines excellent performance with modern features. Whether you\'re a professional seeking a reliable work companion or a casual user looking for a versatile device, this laptop delivers on both fronts.</p>\r\n<h2>Buy&nbsp;MSI Modern 15 A11MU Core i7 11th Gen 15.6\" FHD Laptop&nbsp;from the best Laptop Shop in BD</h2>\r\n<p>In Bangladesh, you can get original&nbsp;MSI Modern 15 A11MU Core i7 11th Gen 15.6\" FHD Laptop&nbsp;From Star Tech. We have a large collection of the latest&nbsp;MSI Laptops&nbsp;to purchase. Order Online Or Visit your Nearest&nbsp;Star Tech&nbsp;Shop to get yours at the lowest price. The&nbsp;MSI Modern 15 A11MU Core i7 11th Gen FHD Laptop comes with 02 year International Warranty.</p>', 'Key Features\r\nMPN: 9S7-155266-1069\r\nModel: Modern 15 A11MU\r\nProcessor: Intel Core i7-1195G7 (12M Cache, 2.90 GHz up to 5.00 GHz)\r\nMemory: 8GB DDR4 3200MHz RAM, Storage: 512GB SSD\r\nDisplay: 15.6\" FHD (1920x1080)\r\nFeatures: Backlit Keyboard, Type-C'),
(6, 6, 'en', 'Acer Aspire 3 A315-24P Ryzen 5 7520U 15.6\" FHD Laptop', '<h2>Acer Aspire 3 A315-24P Ryzen 5 7520U 15.6\" FHD Laptop</h2>\r\n<p>Acer Aspire 3 A315-24P Laptop comes with AMD Ryzen 5 7520U (2.8 GHz up to 4.3 GHz)&nbsp; Processor. It comes with 8GB DDR5 RAM, 512GB PCIe Gen4 SSD, and AMD Radeon dual-core Graphics. The Acer Aspire 3 A315-24P Laptop is also featured with a 15.6\" FHD (1920x1080) high-brightness Acer ComfyView LED-backlit TFT LCD Display. The laptop is equipped with an HD webcam and stereo speaker. It runs on Windows 11 Home operating system. For connectivity options, it comes with IEEE 802.11a/b/g/n/ac and Bluetooth 5.1. It has been designed with 1x HDMI, 2x USB 3.2 port, and 1x USB Type-C port with DC-in. The Acer Aspire 3 A315-24P Multi-gesture touchpad, supports two-finger scroll; pinch; gestures to open Cortana, Action Center, multitasking; application commands. It has a 99-/100-/103-key Acer keyboard layout with international language support including indicators of CapsLock and F4/Microphone mute. The laptop is powered by a 40 Wh 3 cell Lithium Ion battery and comes with a 3-pin 45 W AC adapter.</p>\r\n<h2>Buy Acer Aspire 3 A315-24P Ryzen 5 7520U 15.6\" FHD Laptop from the best Laptop Shop in Bangladesh: Star Tech</h2>\r\n<p>In Bangladesh, you can get original&nbsp;Acer Aspire 3 A315-24P Ryzen 5 7520U 15.6\" FHD Laptop&nbsp;From Star Tech. We have a large collection of latest&nbsp;Acer Laptop&nbsp;to purchase. Order Online Or Visit your Nearest&nbsp;Star Tech&nbsp;Shop to get yours at lowest price. The Acer Aspire 3 A315-24P Laptop comes with 2 years warranty.</p>', 'Key Features\r\nMPN: NX.KDESI.004\r\nModel: Aspire 3 A315-24P\r\nProcessor: AMD Ryzen 5 7520U (2.8 GHz up to 4.3 GHz)\r\nRAM: 8GB DDR5, Storage: 512GB SSD\r\nDisplay: 15.6\" FHD (1920x1080) TFT LCD\r\nFeatures: Stereo Speaker, HD webcam'),
(7, 7, 'en', 'Microsoft Surface Pro 9 Core i5 12th Gen 8GB RAM 512GB SSD 13\" Multi-Touch Laptop (QHB-00017)', '<h2>Microsoft Surface Pro 9 Core i5 12th Gen 8GB RAM 512GB&nbsp;SSD 13\" Multi-Touch Laptop (QHB-00017)</h2>\r\n<p>The Microsoft Surface Pro 9 for Business is great for traveling workers because of its mix of performance and mobility. The PixelSense 13\" touchscreen has a high resolution and supports 10-point touch. Wi-Fi 6E (802.11ax) connectivity makes it simple to stay connected for emails and video conversations. The Surface Pro 9 is also compatible with the Surface Signature Keyboard and the Surface Slim Pen 2 (both of which are offered separately).</p>\r\n<h3>12th Gen Intel Core Performance</h3>\r\n<p>The Microsoft Surface Pro 9 laptop\'s 12th Gen Intel Core i5-1245U 10-Core CPU offers performance cores that can be clocked up to 4.4 GHz to power demanding programs, while efficiency cores manage background activities and multitasking. The Surface Pro 9 also comes with 8GB of LPDDR5 RAM and 512GB of M.2 NVMe PCIe SSD storage. The Surface Pro 9 not only provides performance, but it can also tackle your duties with up to 15.5 hours of battery life on a single charge (battery life may vary based on use).</p>\r\n<h3>13\" PixelSense Touchscreen</h3>\r\n<p>The&nbsp;Microsoft Surface Pro 9&nbsp;Core i5 12th Gen 13\" Multi-Touch Laptop features a virtually edge-to-edge 13\" PixelSense touchscreen with Think Large. The display offers a high-quality experience with a 2880 x 1920 resolution at 267 ppi and a 3:2 aspect ratio. The display has a dynamic refresh rate of 120 Hz. The display supports Dolby Vision IQ and has a brightness of up to 450 nits. The screen supports 10-point touch, so you can use your fingers or a pen to interact with it. The built-in kickstand lets you choose the best viewing position for you.</p>\r\n<h3>Connectivity</h3>\r\n<p>Wi-Fi 6E (802.11ax) wireless connectivity allows you to stay connected while on the road. With usual use, the 13\" Surface Pro 9 may get up to 15.5 hours of battery life on a single charge (this may vary depending on usage). You may use the Surface Pro 9 with a Surface Signature Keyboard (available separately) to simulate a typical laptop experience. Bluetooth 5.2 may also connect to other gadgets and devices.</p>\r\n<h2>Thunderbolt 4</h2>\r\n<p>The Microsoft Surface Pro 9 13\" Multi-Touch&nbsp;<a href=\"https://www.startech.com.bd/laptop-notebook\" target=\"\">Laptop</a>&nbsp;offers Thunderbolt 4, which is a hardware interface that uses the reversible USB Type-C connection and has a maximum throughput of 40 Gb/s when utilized with compatible devices. The port also delivers data through USB4 at up to 20 Gb/s, and the dual-bandwidth DisplayPort allows you to connect either one 8K monitor or up to two 4K monitors at the same time. In addition, you may daisy link up to six devices from a single port.</p>\r\n<h2>Buy&nbsp;Microsoft Surface Pro 9 Core i5 12th Gen 8GB RAM 512GB&nbsp;SSD 13\" Multi-Touch Laptop (QHB-00017)&nbsp;from the best Laptop Shop in BD</h2>\r\n<p>In Bangladesh, you can get the original&nbsp;Microsoft Surface Pro 9 Core i5 12th Gen 8GB RAM 512GB SSD 13\" Multi-Touch Laptop (QHB-00017)&nbsp;from Star Tech. We have a large collection of the latest Microsoft&nbsp;<a href=\"https://www.startech.com.bd/laptop-notebook/laptop\" target=\"\">Laptops&nbsp;</a>to purchase. Order Online Or Visit your Nearest&nbsp;<a href=\"https://www.startech.com.bd/\" target=\"_blank\" rel=\"noopener\">Star Tech Shop</a>&nbsp;to get yours at the lowest price. The Microsoft Surface Pro 9 Core i5 12th Gen 13\" Laptop comes with a 01-year warranty.</p>', 'Key Features\r\nMPN: QHB-00017\r\nModel: Surface Pro 9\r\nProcessor: Intel Core i5-1245U (12M Cache, up to 4.40 GHz)\r\nRAM: 8GB LPDDR5, Storage: 512GB SSD\r\nDisplay:13\" (2880 x 1920) PixelSense Flow MultiTouch\r\nFeatures: Thunderbolt 4'),
(8, 8, 'en', 'Lenovo IdeaPad 1 15ADA7 AMD Ryzen 3 3250U 15.6\" FHD Laptop', '<h2>Lenovo IdeaPad 1 15ADA7 AMD Ryzen 3 3250U 15.6\" FHD Laptop</h2>\r\n<p>The Lenovo IdeaPad 1 15ADA7 AMD Ryzen 3 3250U 15.6&prime;\" FHD Laptop is powered by an AMD Ryzen 3 3250U processor with AMD Radeon graphics (2.6 GHz to 3.5 GHz). The robust CPU in this laptop makes it possible to complete any task and enjoy quality gaming. A 15.6-inch FHD (1920 x 1080) micro-edge, 220 nit, Anti-Glare Display with a small bezel is present. The 512 GB PCIe NVMe M.2 SSD and 8 GB DDR4-2400 MHz RAM used in the laptops result in an excessively quick boot-up time. A Standard Keyboard is what you\'ll receive. For easy carrying, the laptop\'s weight is reduced to 1.6 kg. Lenovo IdeaPad 1 15ADA7 AMD Ryzen 3 3250U 15.6\" FHD Laptop comes with a 03 years Limited Warranty (Terms &amp; Conditions Apply As Per Lenovo).</p>', 'Key Features\r\nMPN: 82R1004WIN\r\nModel: IdeaPad 1 15ADA7\r\nProcessor: AMD Ryzen 3 3250U (2.6 GHz up to 3.5 GHz)\r\nRAM: 8GB 2400MHz, Storage: 512GB SSD\r\nDisplay: 15.6\" FHD (1920X1080)\r\nFeatures: Backlit Keyboard, Type-C, Privacy shutter'),
(9, 9, 'en', 'Acer Aspire 5 AN515-57G-52HF Core i5 12th Gen RTX 2050 4GB Graphics 15.6\" FHD Gaming Laptop', '<h2>Acer Aspire 5 AN515-57G-52HF Core i5 12th Gen RTX 2050 4GB Graphics 15.6\" FHD Gaming Laptop</h2>\r\n<p>Acer Aspire 5 AN515-57G-52HF Gaming Laptop comes powered by Intel Core i5-1240P Processor (12M Cache, up to 4.40 GHz) and 8GB DDR4 RAM. It comes with 512 GB PCIe Gen4 16 Gb/s NVMe SSD for storage options. It is integrated with NVIDIA GeForce RTX 2050 with 4 GB of dedicated GDDR6 Graphics. This&nbsp;laptop&nbsp;features a 15.6\" display with IPS (In-Plane Switching) technology, Full HD 1920 x 1080, and Acer ComfyView LED-backlit TFT LCD. In this exclusive gaming laptop, Acer CoolBoost technology, and quad exhaust port design. Here Intel Wi-Fi 6 solutions (160Mhz channels, which deliver 2.4 Gbps of theoretical throughput) and Bluetooth 5.0 Network &amp; Wireless Connectivity are available. This laptop has been designed with 1 X USB Type-C port, 1 X USB 3.2 Gen 1 port, and 1 X USB 2.0 port. It is designed with an air inlet keyboard that upgrades the thermal performance by expelling up to 10% more heat than a non-air inlet keyboard. And for extra performance, tune your fan to experience engineered solutions to maximize productivity. In this gaming laptop, the Better audio delivers a competitive edge as well as a more immersive experience through dual 2W speakers. Intensify your gaming experience and heighten your sense of awareness with two-way AI noise cancelation technology. The Aspire 5 features a metal cover and an elevating hinge design with ergonomic features letting you play in your comfort. The Acer Aspire 5 AN515-57G-52HF comes with 02-year warranty.</p>', 'Key Features\r\nMPN: UN.K9TSI.009\r\nModel: Aspire 5 AN515-57G-52HF\r\nProcessor: Intel Core i5-1240P Processor (12M Cache, up to 4.40 GHz)\r\nRAM: 8GB DDR4, Storage: 512GB SSD\r\nGraphics: GeForce RTX 2050 4GB\r\nFeatures: Backlit Keyboard, Type-C'),
(10, 10, 'en', 'Lenovo IdeaPad Slim 3i 11th Gen Core i3 256GB SSD 15.6\" Full HD Laptop with Windows 11', '<h2>Lenovo IdeaPad Slim 3i 11th Gen Core i3 256GB SSD 15.6\" Full HD Laptop with Windows 11</h2>\r\n<p>Lenovo IP Slim Laptop comes with an intel core i3-1115G4 Processor (6MB cache, 3.0 GHz up to 4.1 GHz) with Integrated Intel UHD Graphics. This Lenovo IP Slim comes with 4GB DDR4 3200MHz RAM (Expandable up to 12GB), 256GB M.2 2242 PCIe 3.0x4 NVMe SSD and you can do more with your PC. This Lenovo Laptop also has a 45Wh Battery, Dolby Audio, 2x, Array, Stereo speakers, 1.5W x2, and Dolby Audio with an Extra SSD slot. The Lenovo IdeaPad Slim 3i (15) is priced as an everyday-use laptop but engineered as something much more. This laptop also featured with 15.6\" FHD (1920&Atilde;&mdash;1080) 250nits Anti-glare, Full-size English (US) keyboard, SD card reader, Bluetooth Version 5.0, 802.11ax, 2&Atilde;&mdash;2 Wireless LAN, Headphone/mic combo with 1x USB 3.2 Gen 1, 1x USB 2.0, 1x USB-C 3.2 Gen 1 (support data transfer only) and FW TPM 2.0, Camera Privacy Shutter, 720p Webcam with Privacy Shutter. The numeric keypad will speed up your productivity, whether you are working on the family budget or preparing a spreadsheet. Narrow bezels on two sides make the most of the 15.6\" IdeaPad Slim 3i&acirc;&euro;&trade;s up to FHD display and give the laptop itself a clean, contemporary look. Dual speakers with Dolby Audio optimize sound so you\'ll love what you hear as well as what you see.&nbsp;This exclusive IdeaPad Slim 3i (15) laptop is packed with advanced technology, but sometimes the straightforward approach works best. The webcam with a physical shutter. When you are done with your video chat, simply close the shutter and make your webcam hacker-proof. This Lenovo IdeaPad Slim 3i offers 2 years Limited Warranty (Terms &amp; Conditions Apply As Per Lenovo).</p>', 'Key Features\r\nMPN: 82H801WHIN\r\nModel: IdeaPad Slim 3i\r\nProcessor: Intel Core i3-1115G4 (6MB cache, 3.0 GHz upto 4.1 GHz)\r\nRAM & SSD: 4GB 3200Mhz RAM + 256GB SSD\r\nDisplay: 15.6\" FHD (1920Ã—1080)\r\nFeatures: Backlit Keyboard, Dolby Audio'),
(11, 11, 'en', 'Apple MacBook Pro 2019 Model (13-Inch, Intel Core i5, 1.4Ghz, 8GB, 128GB)', '<h1>Apple MacBook Pro 2019</h1>\r\n<p>A touch of genius. The Apple 13.3\" MacBook Pro with Touch Bar is faster and more powerful than before, yet remarkably thinner and lighter. It has the brightest, most colorful Mac notebook display ever. And it introduces the Touch Bar - a Multi-Touch enabled strip of glass built into the keyboard for instant access to tools you want, right when you want them. The new MacBook Pro is built on groundbreaking ideas. And it\'s ready for yours.</p>\r\n<p>Thunderbolt 3 Compatible</p>\r\n<p>The Thunderbolt 3 is a revolutionary USB-C cable that can be used to transfer 4K video in seconds, connect your laptop to a TV screen or other device, or provide power and charge your laptop faster than ever before. The Apple MacBook Pro has four Thunderbolt 3 ports so you can take advantage of this lightening fast, high pixel connection.</p>\r\n<p><strong>Sleek and Stylish</strong></p>\r\n<p>The MacBook Pro has a thin body that is easily transported in a backpack or briefcase. The space gray finish is stylish and durable, and features like the ergonomic keyboard and large glass trackpad make it easy to use. The High Sierra operating system is intuitive and features a practical array of apps including iCloud.</p>\r\n<p><strong>Touch Bar with Touch ID</strong></p>\r\n<p>The Apple 256GB MacBook Pro includes a touch sensitive LED bar instead of the function keys at the top of the keyboard. This bar displays options that work best with the app you are currently using and don\'t require the memorization needed to keep track of the uses of each function key. Touch ID is integrated into this Apple laptop\'s power button and can be used to authorize purchases in Apple Pay. The Touch ID accurately scans your fingerprint so it can match it with the Secure Enclave in the laptop\'s Apple T2 co-processor chip. Make payments with ease and peace of mind knowing that Touch ID technology operates with the highest degree of precision.</p>\r\n<h4>&nbsp;</h4>\r\n<h4>Technical Details:</h4>\r\n<table id=\"productDetails_techSpec_section_1\" class=\"a-keyvalue prodDetTable\" role=\"presentation\">\r\n<tbody>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Screen Size</th>\r\n<td class=\"a-size-base\">13.3 inches</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Screen Resolution</th>\r\n<td class=\"a-size-base\">2560 x 1600</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Processor</th>\r\n<td class=\"a-size-base\">3.1 GHz core_i5</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">RAM</th>\r\n<td class=\"a-size-base\">8 GB LPDDR3</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Memory Speed</th>\r\n<td class=\"a-size-base\">2133 GHz</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Hard Drive</th>\r\n<td class=\"a-size-base\">256 GB 256GB PCIe SSD</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Graphics Coprocessor</th>\r\n<td class=\"a-size-base\">NVIDIA GeForce 320M</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Chipset Brand</th>\r\n<td class=\"a-size-base\">Intel</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Wireless Type</th>\r\n<td class=\"a-size-base\">802.11b</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Ninth-generation 6-Core Intel Core i7 Processor Stunning 16-inch Retina Display with True Tone technology Touch Bar and Touch ID Amd Radeon Pro 5300M Graphics with GDDR6 memory'),
(12, 12, 'en', 'Lenovo IdeaPad Slim 3i 11th Gen Core i3 8GB RAM 14\" FHD Laptop with Windows 11', '<h2>Lenovo IdeaPad Slim 3i 11th Gen Core i3 8GB RAM 14\" FHD Laptop with Windows 11</h2>\r\n<p>Lenovo IP Slim Laptop comes with intel core i3-1115G4 Processor (6MB cache, 3.0 GHz up to 4.1 GHz) with Integrated Intel UHD Graphics. This Lenovo IP Slim comes with 8GB DDR4 3200MHz RAM (Expandable up to 12GB), 256GB M.2 2242 PCIe 3.0x4 NVMe SSD and you can do more with your PC. This Lenovo Laptop also has a 45Wh Battery, Dolby Audio, 2x, Array, Stereo speakers, 1.5W x2, Dolby Audio with an Extra SSD slot. The Lenovo IdeaPad Slim 3i (15) is priced as an everyday-use laptop but engineered as something much more. This laptop also featured with 14\" FHD (1920&Atilde;&mdash;1080) 250nits Anti-glare, Full-size English (US) keyboard, SD card reader, Bluetooth Version 5.0, 802.11ax, 2&Atilde;&mdash;2 Wireless LAN, Headphone/mic combo with 1x USB 3.2 Gen 1, 1x USB 2.0, 1x USB-C 3.2 Gen 1 (support data transfer only) and FW TPM 2.0, Camera Privacy Shutter, 720p Webcam with Privacy Shutter. The numeric keypad will speed up your productivity, whether you are working on the family budget or preparing a spreadsheet. Narrow bezels on two sides make the most of the 14\" IdeaPad Slim 3i&acirc;&euro;&trade;s up to FHD display and give the laptop itself a clean, contemporary look. Dual speakers with Dolby Audio optimize sound so, you\'ll love, what you hear as well as what you see.&nbsp;This exclusive IdeaPad Slim 3i (15) laptop is packed with advanced technology, but sometimes the straightforward approach works best. The webcam with a physical shutter. When you\'re done with your video chat, simply close the shutter and make your webcam hacker-proof. This Lenovo IdeaPad Slim 3i offers 3 years Limited Warranty (Terms &amp; Conditions Apply As Per Lenovo).</p>', 'Key Features\r\nMPN: 82H7013EIN\r\nModel: IdeaPad Slim 3i\r\nProcessor: Intel Core i3-1115G4 (6MB cache, 3.0 GHz upto 4.1 GHz)\r\nRAM: 8GB 3200Mhz, Storage: 256GB SSD\r\nDisplay: 14\" FHD (1920 x 1080)\r\nFeatures: Backlight keyboard, Stereo speakers'),
(13, 13, 'en', 'MSI Modern 15 B13M Core i5 13th Gen 15.6\" FHD Laptop', '<h2>MSI Modern 15 B13M Core i5 13th Gen 15.6\" FHD Laptop</h2>\r\n<p>The MSI Modern 15 B13M is a powerful and sleek laptop designed for productivity and multimedia tasks. It features a 13th-generation Intel Core i5-1335U processor with a base clock speed of 3.40 GHz and a turbo boost speed of up to 4.60 GHz. This ensures smooth performance and efficient multitasking capabilities. With 16GB of DDR4 3200MHz RAM, the laptop offers ample memory for running multiple applications simultaneously and handling demanding tasks. The 512GB NVMe PCIe Gen3x4 SSD provides fast storage and quick access to files, ensuring faster boot times and reduced loading times for applications. The laptop sports a 15.6-inch Full HD display with a resolution of 1920x1080 pixels, delivering crisp and vibrant visuals for an immersive viewing experience. The slim bezels around the display provide a more expansive screen-to-body ratio, enhancing the overall aesthetics of the laptop. The MSI Modern 15 B13M is its backlit keyboard, which enables comfortable typing even in low-light environments. It includes a Type-C USB 3.2 Gen2 port that supports Power Delivery charging, allowing you to charge compatible devices quickly. Additionally, it offers one Type-A USB 3.2 Gen2 port and two Type-A USB 2.0 ports for connecting peripherals and external storage devices. The MSI Modern 15 B13M combines a powerful processor, ample RAM, fast storage, and a high-resolution display to deliver a reliable and efficient computing experience. Its sleek design and convenient features make it a suitable choice for professionals, students, and multimedia enthusiasts alike.</p>\r\n<h2>Buy&nbsp;MSI Modern 15 B13M Core i5 13th Gen 15.6\" FHD Laptop&nbsp;from the best Laptop Shop in BD</h2>\r\n<p>In Bangladesh, you can get original&nbsp;MSI Modern 15 B13M Core i5 13th Gen 15.6\" FHD Laptop&nbsp;From Star Tech. We have a large collection of the latest&nbsp;MSI Laptops&nbsp;to purchase. Order Online Or Visit your Nearest&nbsp;Star Tech&nbsp;Shop to get yours at the lowest price. The&nbsp;MSI Modern 15 B13M Core i5 13th Gen 15.6\" FHD Laptop comes with 02 year International Warranty.</p>', 'Key Features\r\nMPN: CB51335U16GXXDX11EMH\r\nModel: Modern 15 B13M\r\nProcessor: Intel Core i5-1335U (12M Cache, 3.40 GHz, up to 4.60 GHz)\r\nRAM: 16GB DDR4 3200MHz RAM, Storage: 512GB NVMe PCIe Gen3x4 SSD\r\nDisplay: 15.6\" FHD (1920x1080)\r\nFeatures: Backlight Keyboard, Type-C'),
(14, 14, 'en', 'HP Spectre 15.6\" 4K Ultra HD Touch-Screen Laptop Intel i7 8th Gen', '<p><span class=\"a-list-item\">LATEST 8TH GENERATION CPU: Intel Core i7-8500</span></p>\r\n<p>&nbsp;</p>\r\n<p><span class=\"a-list-item\">UNMATCHED PERFORMANCE:16 GB DDR4-2133 SDRAM (2 x 8 GB) of system memory for intense multitasking and gaming, smoothly run your graphics-heavy PC games and video-editing</span></p>\r\n<p>&nbsp;</p>\r\n<p><span class=\"a-list-item\">SUPERIOR SPEED and Advanced Wireless connectivity: Fast Data Access with 512GB solid state drive PCIe NVMe 4x3 Lane, a flash-based SSD with no moving parts, resulting in faster start-up times data access. Advanced Wireless Connectivity: Intel 802.11ac (2x2) Wi-Fi and Bluetooth 4.2 Combo</span></p>\r\n<p>&nbsp;</p>\r\n<p><strong><span class=\"a-list-item\">Specification:</span></strong></p>\r\n<table id=\"productDetails_techSpec_section_1\" class=\"a-keyvalue prodDetTable\" role=\"presentation\">\r\n<tbody>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Screen Size</th>\r\n<td class=\"a-size-base\">15.6 inches</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Screen Resolution</th>\r\n<td class=\"a-size-base\">3840 x 2160</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Max Screen Resolution</th>\r\n<td class=\"a-size-base\">3840 x 2160</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Processor</th>\r\n<td class=\"a-size-base\">1.8 GHz Intel Core i7</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">RAM</th>\r\n<td class=\"a-size-base\">16 GB DDR</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Memory Speed</th>\r\n<td class=\"a-size-base\">2400 MHz</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Hard Drive</th>\r\n<td class=\"a-size-base\">512 GB SSD</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Graphics Coprocessor</th>\r\n<td class=\"a-size-base\">NVIDIA GeForce MX150</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Chipset Brand</th>\r\n<td class=\"a-size-base\">NVIDIA</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Card Description</th>\r\n<td class=\"a-size-base\">Dedicated</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Graphics Card Ram Size</th>\r\n<td class=\"a-size-base\">2 GB</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Wireless Type</th>\r\n<td class=\"a-size-base\">802.11ac</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Average Battery Life (in hours)</th>\r\n<td class=\"a-size-base\">13 hours</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'LATEST 8TH GENERATION CPU: Intel Core i7-8500 UNMATCHED PERFORMANCE:16 GB DDR4-2133 SDRAM (2 x 8 GB) of system memory for intense multitasking and gaming, smoothly run your graphics-heavy PC games and video-editing'),
(15, 15, 'en', 'Acer Aspire 3 A315-59 Core i5 12th Gen 15.6\" FHD Laptop', '<h2>Acer Aspire 3 A315-59 Core i5 12th Gen 15.6\" FHD Laptop</h2>\r\n<p>Acer Aspire 3 A315-59 Laptop comes with Intel Core i5-1235U (12M Cache, 3.30 GHz, up to 4.40 GHz). It comes with 8GB (4GBx2) DDR4 RAM, 512GB PCIe Gen4 SSD, and AMD Radeon dual-core Graphics. The Acer Aspire 3 A315-59 Laptop is also featured with a 15.6\" FHD (1920x1080) high-brightness Acer ComfyView LED-backlit TFT LCD Display. The laptop is equipped with an HD webcam and stereo speaker. It runs on Windows 11 Home operating system. For connectivity options, it comes with an RJ45 port, IEEE 802.11a/b/g/n/ac, and Bluetooth 5.0. It has been designed with 1x HDMI, 2x USB 3.2 port, and 1x USB Type-C port with DC-in. The Acer Aspire 3 A315-59 Multi-gesture touchpad, supports two-finger scroll; pinch; gestures to open Cortana, Action Center, multitasking; application commands. It has a 99-/100-/103-key Acer keyboard layout with international language support including indicators of CapsLock and F4/Microphone mute. The laptop is powered by a 40 Wh 3 cell Lithium Ion battery and comes with a 3-pin 45 W AC adapter.</p>\r\n<h2>Buy Acer Aspire 3 A315-59 Core i5 12th Gen 15.6\" FHD Laptop from the best Laptop Shop in Bangladesh: Star Tech</h2>\r\n<p>In Bangladesh, you can get original&nbsp;Acer Aspire 3 A315-59 Core i5 12th Gen 15.6\" FHD Laptop&nbsp;From Star Tech. We have a large collection of latest&nbsp;Acer Laptop&nbsp;to purchase. Order Online Or Visit your Nearest&nbsp;Star Tech&nbsp;Shop to get yours at lowest price. The Acer Aspire 3 A315-59 Laptop comes with 2 years warranty.</p>', 'MPN: NX.K6TSI.002\r\nModel: Aspire 3 A315-59\r\nProcessor: Intel Core i5-1235U (12M Cache, 3.30 GHz, up to 4.40 GHz)\r\nRAM: 8GB DDR4, Storage: 512GB SSD\r\nDisplay: 15.6\" FHD (1920x1080) TFT LCD\r\nFeatures: Stereo Speaker, HD webcam'),
(16, 16, 'en', 'MSI Katana GF66 12UC Core i5 12th Gen RTX 3050 4GB Graphics 15.6\" FHD Gaming Laptop', '<h2>MSI Katana GF66 12UC Core i7 12th Gen RTX 3050 4GB Graphics 15.6\" FHD Gaming Laptop</h2>\r\n<p>MSI Katana GF66 12UC powered by Intel Core i5-12450H (12M Cache, 3.30 GHz up to 4.40 GHz) with Nvidia RTX 3050 4GB GDDR6 Graphics. This MSI Katana GF66 12UC features performance and efficiency cores, providing an unprecedented boost in multitasking work and heavy games. MSI Katana GF66 12UC Laptop is as powerful and sturdy as a blade and optimized to unleash true performance during gameplay. Katana GF66 runs at optimum performance with an exclusive red illumination keyboard so that you can shine on the battlefield. Here using Nvidia RTX 3050 4GB GDDR6 graphics card will give you higher performance. In this gaming laptop, the 144Hz IPS-level display brings you striking visuals and a smooth refresh rate so you never miss a thing. This gaming laptop is featured with Exclusive Cooler Boost 5 Technology, MSI Center with exclusive gaming mode, and High-Resolution Audio ready. Here added the latest Wi-Fi 6 features are Intel Wi-Fi 6 AX201(2 x 2 ax) and Bluetooth V5.1 wireless connectivity, which is 3X faster than Wi-Fi 5, designed to deliver lightning-fast gameplay, the best streaming, and the most immersive communication experience. Play on the most optimal gaming settings with Intel Wi-Fi 6. The MSI Katana GF66 11UC Gaming Laptop comes with exclusive red illumination and is built on solid metal shielding with 1.7mm of key travel for better responsiveness. Its new ergonomically designed keyboard will meet all the needs. The exclusive MSI Katana GF66 12UC Gaming Laptop comes with 02 year International Warranty.</p>\r\n<h2>Buy MSI Katana GF66 12UC Core i5 12th Gen RTX 3050 4GB Graphics 15.6\" FHD Gaming Laptop from the best Laptop Shop in BD</h2>\r\n<p>In Bangladesh, you can get original&nbsp;MSI Katana GF66 12UC Core i5 12th Gen RTX 3050 4GB Graphics 15.6\" FHD Gaming Laptop&nbsp;From Star Tech. We have a large collection of the latest&nbsp;MSI Laptops to purchase. Order Online Or Visit your Nearest&nbsp;&nbsp;Shop to get yours at the lowest price. The&nbsp;MSI Katana GF66 12UC Core i5 12th Gen RTX 3050 4GB Graphics 15.6\" FHD Gaming Laptop comes with 02 year International Warranty.</p>', 'Key Features\r\nMPN: 12UC-893BD-BB51245H8GXXDX11EM\r\nModel: Katana GF66 12UC\r\nProcessor: Intel Core i5-12450H (12M Cache, 3.30 GHz up to 4.40 GHz)\r\nRAM: 8GB DDR4 3200MHz, SSD: 512GB NVMe PCIe Gen4\r\nGraphics: Nvidia RTX 3050 4GB GDDR6\r\nFeatures: Backlight Keyboard, Type-C'),
(17, 17, 'en', 'ASUS ROG Zephyrus S GX502GV Gaming Laptop Intel i7-9750H, 32GB RAM', '<p>Armed with the power and versatility to slice through both AAA games and professional work, the ROG Zephyrus S GX502 redefines the bounds of Windows 10 ultra-slim gaming. Its innovative cooling design unleashes the true potential of the latest 9th Gen Intel Core i7 CPU and NVIDIA GeForce RTX 2060 GPU, allowing them to take full advantage of the ultra-responsive 144Hz/3ms PANTONE Validated display. Its adaptability shines with G-SYNC and Optimus modes, giving you the freedom to shift between exceptionally smooth gameplay and better battery life on the go.</p>\r\n<p>&nbsp;</p>\r\n<p><strong><span class=\"a-list-item\">Specifications:</span></strong></p>\r\n<table id=\"productDetails_techSpec_section_1\" class=\"a-keyvalue prodDetTable\" role=\"presentation\">\r\n<tbody>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Screen Size</th>\r\n<td class=\"a-size-base\">15.6 inches</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Screen Resolution</th>\r\n<td class=\"a-size-base\">1920 x 1080</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Max Screen Resolution</th>\r\n<td class=\"a-size-base\">1920 x 1080</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Processor</th>\r\n<td class=\"a-size-base\">2.6 GHz Intel Core i7</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">RAM</th>\r\n<td class=\"a-size-base\">32 GB DDR4</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Memory Speed</th>\r\n<td class=\"a-size-base\">2666 MHz</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Hard Drive</th>\r\n<td class=\"a-size-base\">1000 GB flash_memory_solid_state</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Graphics Coprocessor</th>\r\n<td class=\"a-size-base\">NVIDIA GeForce RTX 2060</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Chipset Brand</th>\r\n<td class=\"a-size-base\">NVIDIA</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Card Description</th>\r\n<td class=\"a-size-base\">Dedicated</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Graphics Card Ram Size</th>\r\n<td class=\"a-size-base\">6.00</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Wireless Type</th>\r\n<td class=\"a-size-base\">802.11ac</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Processor: Intel i7-9750H Six Core Processor (12MB Cache, 2.6MHz-4.5GHz) 45W RAM: 32GB DDR4 2666MHz (16GB On Board) | Hard Drive: 1TB NVMe Solid State Drive'),
(18, 18, 'en', 'MSI Sword 15 A12UCX Core i5 12th Gen RTX 2050 4GB Graphics 15.6\" FHD Gaming Laptop', '<h2>MSI Sword 15 A12UCX Core i5 12th Gen RTX 2050 4GB Graphics 15.6\" FHD Gaming Laptop</h2>\r\n<p>The MSI Sword 15 A12UCX is a powerful gaming&nbsp;laptop&nbsp;that offers high-performance features for an immersive gaming experience. It is equipped with a 12th-generation Intel Core i5 processor, specifically the Alder Lake i5-12450H, which ensures smooth gameplay and efficient multitasking. The laptop comes with an NVIDIA GeForce RTX 2050 graphics card with 4GB of GDDR6 memory, delivering stunning visuals and realistic graphics for gaming and multimedia applications. The Sword 15 A12UCX features a 15.6-inch Full HD display with a resolution of 1920x1080 pixels. The display has a high refresh rate of 144Hz, ensuring smooth and fluid visuals during fast-paced gaming sessions. The IPS-level panel provides wide viewing angles and accurate color reproduction, with 45% NTSC color coverage. The laptop is equipped with 8GB of DDR5 RAM, which enables smooth multitasking and fast data processing. It also includes a 512GB NVMe PCIe SSD Gen4x4 for high-speed storage and quick loading times for games, applications, and files. Connectivity options on the Sword 15 A12UCX include Intel Wi-Fi 6 AX201 with 2x2 ax support, offering fast and reliable wireless internet connectivity. It also features Bluetooth 5.2 for seamless wireless connections with compatible devices. The laptop comes pre-installed with Windows 11 Home Standard Single Language, providing a secure and user-friendly operating system. The Sword 15 A12UCX is powered by a 3-cell, 53.5Whr battery, which offers decent battery life for gaming and productivity tasks. It also features an integrated SoC (System on a Chip) design, which combines various components into a single chip for improved power efficiency and performance. The MSI Sword 15 A12UCX is a gaming laptop that combines powerful hardware, a high-refresh-rate display, and fast storage to deliver an exceptional gaming experience. It is suitable for gamers and content creators who require a portable and capable machine for their demanding tasks.</p>\r\n<h2>Buy MSI Sword 15 A12UCX Core i5 12th Gen RTX 2050 4GB Graphics 15.6\" FHD Gaming Laptop&nbsp;from the best Laptop Shop in BD</h2>\r\n<p>In Bangladesh, you can get original&nbsp;MSI Sword 15 A12UCX Core i5 12th Gen RTX 2050 4GB Graphics 15.6\" FHD Gaming Laptop&nbsp;From Star Tech. We have a large collection of latest&nbsp;MSI Gaming Laptop&nbsp;to purchase. Order Online Or Visit your Nearest&nbsp;Star Tech&nbsp;Shop to get yours at lowest price. The MSI Sword 15 A12UCX Core i5 12th Gen 15.6\" FHD Gaming Laptop comes with 02 years International Warranty.</p>', 'Key Features\r\nModel: Sword 15 A12UCX\r\nProcessor: Intel Core i5-12450H (12M Cache, 3.30 GHz up to 4.40 GHz)\r\nRAM: 8GB DDR5, Storage: 512GB SSD\r\nGraphics: RTX 2050 4GB GDDR6\r\nFeatures: 15.6\" 144Hz Display, Backlit Keyboard'),
(19, 19, 'en', 'Lenovo V14 Core i3 11th Gen 14\" Full HD Laptop', '<h2>Lenovo V14 Core i3 11th Gen 14\" Full HD Laptop</h2>\r\n<p>The Lenovo V14 is powered by Intel Core i3-1115G4 (6M Cache, 3.00 GHz up to 4.10 GHz) with Integrated Intel UHD Graphics. It comes with 4GB of DDR4 3200Mhz RAM and a hybrid combination of 1TB HDD storage. The Lenovo V14 comes with a 14\" display, with four-sided narrow bezels, which gives the V14 Gen 2 laptop an 88% screen-to-body ratio. Avoid distractions and focus on the FHD (1920 x 1080) antiglare display, in up to 300 nits brightness, for quality visuals. This Laptop also has 0.3M, 720p HD and a Full-sized standard keyboard with Precision Touchpad, Webcam privacy shutter, Trusted Platform Module (TPM) 2.0 firmware, Webcam privacy shutter, and Kensington lock slot. The Lenovo V14 is equipped with WiFi 6 802.11ax and Bluetooth 5.0 wireless connectivity. The Lenovo V14 Gen 2 laptop protects your data and your privacy. Trusted Platform Module (TPM) 2.0 firmware encrypts critical business data, while a physical webcam shutters. The Latest Lenovo V14 Laptop offers 03 years Limited Warranty (Terms &amp; Conditions Apply As Per Lenovo).</p>', 'MPN: 82KA013JIN\r\nModel: V14\r\nProcessor: Intel Core i3-1115G4 (6M Cache, 3.00 GHz up to 4.10 GHz)\r\nRAM: 4GB 3200Mhz, Storage: 1TB HDD\r\nDisplay: 14\" FHD (1920 x 1080)\r\nFeatures: Type-C'),
(20, 20, 'en', 'Dell XPS 13 9380, 13.3\" 4K UHD (3840X2160) Multi-Touch IPS Display, Intel Core i7-8565U', '<p><span class=\"a-list-item\">World\'s smallest 13-inch laptop; The smaller, thinner, lighter 4K Ultra HD XPS 13 is ready for take-off and also Star performances with the new 8th Gen Intel Core processors, more Cores mean increased performance.</span></p>\r\n<p>&nbsp;</p>\r\n<p><span class=\"a-list-item\">World\'s most innovative HD Webcam; we\'ve miniaturised the HD Webcam to fit it into the top inginityedge border making the 13-inch laptop more gorgeous than ever.</span></p>\r\n<p>&nbsp;</p>\r\n<p><span class=\"a-list-item\">Next-gen Dell Cinema; colors burst, sound rumbles, streaming is Seamless and Dell has combined specialized hardware and software to make every scene more stunning.</span></p>\r\n<p>&nbsp;</p>\r\n<p><span class=\"a-list-item\">Recycle-friendly: 90% of the laptop\'s Parts can be easily recycled or reused, and the white bamboo Packaging trays are 100% recyclable.</span></p>\r\n<p>&nbsp;</p>\r\n<p><span class=\"a-list-item\">The XPS 13 is cut from a single block of aluminum, so it\'s more durable than a machine that\'s pieced together. Inspired by the aerospace industry, The carbon fiber and woven glass fiber of the palm rest allow for maximum strength and minimal weight. Corning Gorilla Glass 4 is tough, damage resistant, durable and elegant and better able to withstand damage from drops.</span></p>\r\n<p>&nbsp;</p>\r\n<p><strong><span class=\"a-list-item\">Specifications:</span></strong></p>\r\n<table id=\"productDetails_techSpec_section_1\" class=\"a-keyvalue prodDetTable\" role=\"presentation\">\r\n<tbody>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Screen Size</th>\r\n<td class=\"a-size-base\">13.3 inches</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Max Screen Resolution</th>\r\n<td class=\"a-size-base\">3840X2160 pixels</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Processor</th>\r\n<td class=\"a-size-base\">1.8 GHz Core i7 8550U</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">RAM</th>\r\n<td class=\"a-size-base\">16 GB LPDDR3</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Memory Speed</th>\r\n<td class=\"a-size-base\">4.6 GHz</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Hard Drive</th>\r\n<td class=\"a-size-base\">512 GB SSD</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Graphics Coprocessor</th>\r\n<td class=\"a-size-base\">Intel UHD Graphics</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Chipset Brand</th>\r\n<td class=\"a-size-base\">intel</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Card Description</th>\r\n<td class=\"a-size-base\">Integrated</td>\r\n</tr>\r\n<tr>\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\">Wireless Type</th>\r\n<td class=\"a-size-base\">802.11ac</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'World\'s smallest 13-inch laptop; The smaller, thinner, lighter 4K Ultra HD XPS 13 is ready for take-off and also Star performances with the new 8th Gen Intel Core processors, more Cores mean increased performance.');
INSERT INTO `product_translations` (`id`, `product_id`, `locale`, `name`, `description`, `short_description`) VALUES
(21, 21, 'en', 'Acer TravelMate TMP214-53 Core i7 11th Gen 14\" FHD Laptop', '<h2>Acer TravelMate TMP214-53 Core i7 11th Gen 14\" FHD Laptop</h2>\r\n<p>The&nbsp;Acer TravelMate TMP214-53 Laptop comes with&nbsp;Intel Core i7-1165G7 Processor (12M Cache, 2.80 GHz up to 4.70 GHz, with IPU) and 8GB DDR4 3200MHz RAM. It features a 1TB 5400 RPM HDD. This laptop has Integrated-Intel UHD Graphics and a 14\" IPS Full HD (1920X1080) Display with a Wide Viewing Angle of up to 170 Degrees. It runs on the Free DOS operating system. It has a 48 Wh 3-cell Li-ion battery and the Battery life lasts up to 10 hours. It comes with a 3-pin 45 W AC adapter. The laptop has two built-in stereo speakers (1.5Wx2=3W). It has a Standard Keyboard and HD Cam with Mic. It has been designed with 4 x USB 3.1 (Including 1 power-off charging &amp; 1 Type C), 1 x HDMI, 1 x VGA, 1 x Headset/speaker jack, and a power port. The Acer TravelMate TMP214-53 has 3 years of warranty (Battery Adapter 01 year).</p>', 'MPN: NX.VPLSI.00Z\r\nModel: TravelMate TMP214-53\r\nProcessor: Intel Core i7-1165G7 (12M Cache, 2.80 GHz up to 4.70 GHz, with IPU)\r\nRAM: 8GB 3200MHz, Storage: 1TB HDD\r\nDisplay: 14.0\" IPS Full HD\r\nFeatures: Finger Print Reader'),
(22, 22, 'en', 'Acer Aspire 7 A715-51G Core i5 12th Gen GTX 1650 4GB Graphics 15.6\" FHD Gaming Laptop', '<h2>Acer Aspire 7 A715-51G Core i5 12th Gen GTX 1650 4GB Graphics 15.6\" FHD Gaming Laptop</h2>\r\n<p>Acer Aspire 7 A715-51G Gaming Laptop comes powered by Intel Core i5-1240P Processor (12M Cache, up to 4.40 GHz) and 8GB DDR4 RAM. It comes with 512 GB&nbsp;PCIe Gen3, 8 Gb/s, NVMe SSD&nbsp;for storage options. It is integrated with NVIDIA GeForce GTX 1650 with 4 GB of dedicated GDDR6 Graphics. This&nbsp;laptop&nbsp;features a 15.6\" display with IPS (In-Plane Switching) technology, Full HD 1920 x 1080, and Acer ComfyView LED-backlit TFT LCD. In this exclusive gaming laptop, Acer CoolBoost technology, and quad exhaust port design. Here Intel Wi-Fi 6 solutions (160Mhz channels, which deliver 2.4 Gbps of theoretical throughput) and Bluetooth 5.0 Network &amp; Wireless Connectivity are available. This laptop has been designed with 1 X USB Type-C port, 1 X USB 3.2 Gen 1 port, and 1 X USB 2.0 port. It is designed with an air inlet keyboard that upgrades the thermal performance by expelling up to 10% more heat than a non-air inlet keyboard. And for extra performance, tune your fan to experience engineered solutions to maximize productivity. In this gaming laptop, the Better audio delivers a competitive edge as well as a more immersive experience through dual 2W speakers. The Acer Aspire 7 A715-51G comes with a 02-year warranty.</p>', 'Key Features\r\nMPN: NH.QGBSI.003\r\nModel: Aspire 7 A715-51G\r\nProcessor: Intel Core i5-1240P Processor (12M Cache, up to 4.40 GHz)\r\nRAM: 8GB DDR4, Storage: 512GB SSD\r\nGraphics: GeForce GTX 1650 4GB\r\nFeatures: Backlit Keyboard, Type-C'),
(23, 23, 'en', 'MSI Modern 14 C13M Core i7 13th Gen 14\" FHD Laptop', '<h2>MSI Modern 14 C13M Core i7 13th Gen 14\" FHD Laptop</h2>\r\n<p>The MSI Modern 14 C13M is a sleek and powerful laptop designed for modern professionals and content creators. It is equipped with a 13th generation Intel Core i7-1355U processor, offering impressive performance with its 12M Cache and base clock speed of 3.70 GHz. With Turbo Boost technology, the processor can reach a maximum speed of 5.00 GHz, ensuring smooth multitasking and efficient processing. To support seamless multitasking and smooth performance, the laptop features 16GB of DDR4 3200MHz RAM. This ample memory capacity allows users to run multiple applications simultaneously without experiencing any lag or slowdowns. The 512GB NVMe PCIe Gen3x4 SSD storage provides fast data access speeds, allowing for quick boot times and swift file transfers. The MSI Modern 14 C13M boasts a vibrant 14-inch Full HD display with a resolution of 1920x1080 pixels. The high-quality display offers crisp and detailed visuals, making it ideal for multimedia consumption, creative work, and everyday tasks. This laptop is a backlight keyboard, which enhances productivity by allowing users to comfortably work even in low-light environments. Additionally, the inclusion of a Type-C port provides convenient connectivity options for various peripherals and devices. The MSI Modern 14 C13M Core i7 13th Gen 14\" FHD Laptop is a powerful and stylish option for professionals and content creators seeking a portable device with excellent performance, ample storage, and a high-quality display.</p>\r\n<h2>Buy&nbsp;MSI Modern 14 C13M Core i7 13th Gen 14\" FHD Laptop&nbsp;from the best Laptop Shop in BD</h2>\r\n<p>In Bangladesh, you can get original&nbsp;MSI Modern 14 C13M Core i7 13th Gen 14\" FHD Laptop&nbsp;From Star Tech. We have a large collection of the latest&nbsp;MSI Laptops to purchase. Order Online Or Visit your Nearest&nbsp;&nbsp;Shop to get yours at the lowest price. The&nbsp;MSI Modern 14 C13M Core i7 13th Gen 14\" FHD Laptop comes with 02 year International Warranty.</p>', 'Model: Modern 14 C13M\r\nProcessor: Intel Core i7-1355U (12M Cache, 3.70 GHz, up to 5.00 GHz)\r\nRAM: 16GB DDR4 3200MHz RAM, Storage: 512GB NVMe PCIe Gen3x4 SSD\r\nDisplay: 14\" FHD (1920x1080)\r\nFeatures: Backlight Keyboard, Type-C'),
(24, 24, 'en', 'Asus Vivobook X515MA Celeron N4500 15.6\" HD Laptop', '<h2>Asus Vivobook X515MA Celeron N4500&nbsp;15.6\" HD Laptop</h2>\r\n<p>The Asus Vivobook X515MA laptop comes with Intel Celeron N4500 Processor (4M Cache, 1.10 GHz up to 2.80 GHz) and 4GB DDR4 RAM. It has a 1TB SATA 5400RPM 2.5\" HDD and it also comes with 1x M.2 2280 PCIe 3.0x2 Slot. This laptop has been integrated with Intel UHD Graphics 600 and it has a 15.6-inch HD (1366 x 768) display with a 16:9 aspect ratio. It runs on Windows 11 Home operating system. This whole system is powered by a 37WHrs, 2S1P, 2-cell Li-ion battery and comes with a &Atilde;&cedil;4.0, 33W AC Adapter, Output: 19V DC, 1.75A, 33W, Input: 100-240V AC 50/60Hz universal. This laptop has a VGA Webcam and Built-in speaker with SonicMaster. The Asus Vivobook X515MA offers Wi-Fi 5(802.11ac) and Bluetooth 4.1 (Dual band) 1*1 for wireless connectivity. The laptop is designed with 1x USB 3.0 Gen 1, 2x USB 2.0, 1 x HDMI ports. The Asus Vivobook X515MA Laptop comes with 2 years International Limited Warranty (Battery 1 year).</p>', 'Key Features\r\nMPN: BQ635T\r\nModel: Vivobook X515MA\r\nProcessor: Intel Celeron N4500 (4M Cache, 1.10 GHz up to 2.80 GHz)\r\nRAM: 4GB DDR4, Storage: 1TB 5400RPM HDD\r\nDisplay: 15.6\" HD (1366 x 768)\r\nFeatures: Backlit Keyboard, Type-C'),
(25, 25, 'en', 'Lenovo IdeaPad 1 15AMN7 AMD Ryzen 5 15.6\" FHD Laptop with DDR5 RAM', '<h2>Lenovo IdeaPad 1 15AMN7 AMD Ryzen 5 15.6\" FHD Laptop with DDR5 RAM</h2>\r\n<p>The Lenovo IdeaPad 1 15AMN7&nbsp;is a stylish and powerful laptop that offers high-performance computing for a variety of jobs. This laptop can perform complex programs with ease thanks to an AMD Ryzen 5 7520U (2.8 GHz up to 4.3 GHz). The processor has four cores and eight threads, allowing you to multitask effectively and effortlessly. This laptop has 8GB DDR5-5500 Memory, which offers smooth performance even while running many apps at the same time. The 256 GB SSD PCIe offers plenty of storage capacity for your data, documents, and multimedia files. SSD technology enables rapid boot-up and load times, allowing you to complete your tasks quickly. The AMD Radeon 610M graphics provides exceptional graphics performance, making this laptop suitable for gaming and video editing. The 14-inch FHD (1920x1080) display provides clear and sharp graphics, letting you view high-quality entertainment without pixelation or blurring. This Lenovo IdeaPad 1 15AMN7&nbsp;is a powerful and flexible laptop that can meet a variety of computing demands. Whether you\'re a student, professional, or gamer, this laptop is a dependable option that can manage your workload with ease.</p>\r\n<h2>Buy Lenovo IdeaPad 1 15AMN7 AMD Ryzen 5 15.6\" FHD Laptop with DDR5 RAM from the best Computer Shop in BD</h2>\r\n<p>In Bangladesh, you can get the original&nbsp;Lenovo IdeaPad 1 14AMN7 AMD Ryzen 5 15.6\" FHD Laptop&nbsp;from Star Tech. We have a large collection of the latest&nbsp;Lenovo&nbsp;Laptops&nbsp;to purchase. Order Online Or Visit your Nearest&nbsp;Star Tech Shop&nbsp;to get yours at the lowest price. The Lenovo IdeaPad 1 15AMN7&nbsp;AMD Ryzen 5 15.6\" FHD Laptop&nbsp;comes with &nbsp;2 years warranty ( Battery adapter 1 year).</p>', 'Key Features\r\nMPN: 82VVG008YIN\r\nModel: IdeaPad 1 15AMN7\r\nProcessor: AMD Ryzen 5 7520U (2.8 GHz up to 4.3 GHz)\r\nRAM: 8GB DDR5 5500MHz, Storage: 256GB SSD\r\nDisplay: 15.6\" FHD (1920X1080)\r\nFeatures: Type-C'),
(26, 26, 'en', 'Acer Extensa 14 EX214-53-543W Core i5 12th Gen 14\" FHD Laptop', '<h2>Acer Extensa 14 EX214-53-543W Core i5 12th Gen 14\" FHD Laptop</h2>\r\n<p>The Acer Extensa 14 EX214-53-543W Laptop is powered by an Intel Core i5-1240P processor (12M Cache, up to 4.40 GHz). The laptop has a 14.0\" Full HD display with IPS (In-Plane Switching) technology that provides vibrant and immersive visuals. Crisp and clear images are provided by a 1920 x 1080 resolution, a 16:9 aspect ratio, and a high-brightness Acer ComfyView LED-backlit TFT LCD panel. The display also has a wide viewing angle of up to 170 degrees, allowing for comfortable viewing from a variety of angles. The laptop comes with 8GB of DDR4 RAM. It also has a 512GB PCIe M.2 NVMe SSD. Equipped with a 50 Wh battery, the laptop offers decent on-the-go battery life. The keyboard has an Acer layout with media control keys, while the touchpad supports multi-gesture input and has advanced features like Windows Hello Certification. It supports Wi-Fi 6E, Gigabit Ethernet, and Bluetooth 5.2 for seamless wireless connectivity. The laptop has multiple USB ports, an HDMI port, and an audio jack for connecting external devices. It features a high-definition webcam, Acer Purified. Voice technology for clear audio, and TrueHarmony technology for enhanced sound quality.</p>\r\n<p>&nbsp;</p>', 'MPN: NX.EGWSI.003\r\nModel: Extensa 14 EX214-53-543W\r\nProcessor: Intel Core i5-1240P Processor (12M Cache, up to 4.40 GHz)\r\nRAM: 8GB DDR4, Storage: 512GB SSD\r\nDisplay: 14\" FHD (1920 x 1080)\r\nFeatures: Dual Speaker and Integrated Microphone'),
(27, 27, 'en', 'Lenovo IdeaPad Slim 3i Core i3 11th Gen 4GB RAM 15.6\" FHD Laptop', '<h2>Lenovo IdeaPad Slim 3i Core i3 11th Gen 4GB RAM 15.6\" FHD Laptop</h2>\r\n<p>The Lenovo IdeaPad Slim 3i is a high-performance&nbsp;laptop&nbsp;that comes with impressive specifications. Powered by an Intel Core i3-1115G4 (6M Cache, 3.00 GHz up to 4.10 GHz), this laptop offers speedy and efficient performance for multitasking, browsing, and streaming. It also comes with 4GB DDR4 3200 memory and a 1TB HDD, providing ample storage space for your important files and data. The 15.6\" FHD 250N AG display ensures an excellent visual experience with its crisp and clear display, while the UHD graphics card enables users to enjoy stunning visuals while gaming or streaming. The laptop also features a 720P camera with a privacy shutter, allowing users to securely participate in video conferences and online meetings. This Lenovo IdeaPad Slim 3i Laptop comes with Dolby sound, which delivers a superior audio experience for music, movies, and games. It also has a for seamless productivity and a backlit keyboard for typing in low-light settings. This laptop runs on Windows 11 Home and comes with AC WiFi 5x2 and Bluetooth 5.0 for fast and reliable internet connectivity. It also has a firmware TPM 2.0 chip to protect your data and files from unauthorized access. Overall, the Lenovo IdeaPad Slim 3i is a great choice for those seeking a powerful and efficient laptop for work or play.</p>', 'MPN: 82H8023GIN\r\nModel: IdeaPad Slim 3i\r\nProcessor: Intel Core i3-1115G4 (6M Cache, 3.00 GHz up to 4.10 GHz)\r\nRAM: 4GB RAM, Storage: 1TB HDD\r\nDisplay: 15.6\" FHD (1920 x 1080)\r\nFeatures: Backlight keyboard, Type-C'),
(28, 28, 'en', 'MSI Katana 15 B12UDXK Core i5 12th Gen RTX 3050 4GB Graphics 15.6\" FHD Gaming Laptop', '<h2>MSI Katana 15 B12UDXK Core i5 12th Gen RTX 3050 4GB Graphics 15.6\" FHD Gaming Laptop</h2>\r\n<p>The MSI Katana 15 B12UDXK is a powerful gaming laptop designed for immersive gaming experiences, creative design works, browsing, video editing, office work, movies, music, and more. The laptop is equipped with an Intel Core i5-12450H (12M Cache, 3.30 GHz up to 4.40 GHz) processor, providing excellent performance for demanding tasks. The graphics department is handled by the Nvidia RTX 3050 graphics chipset with 4GB of dedicated GDDR6 memory, delivering smooth and detailed visuals for gaming and other graphics-intensive applications. The display of the MSI Katana 15 B12UDXK is a 15.6-inch Full HD panel with a slim bezel design, offering an immersive viewing experience. It features an IPS-level panel with a 144Hz refresh rate, ensuring smooth and fluid visuals during gameplay. The display supports a 45% NTSC color gamut for vibrant and accurate colors. This laptop comes with 16GB of DDR5 RAM, consisting of 2 x 8GB removable modules. The memory operates at a fast 4800MHz speed, providing efficient multitasking and smooth performance. The laptop has a total of 2 memory slots, with a maximum memory support of up to 64GB. The MSI Katana 15 B12UDXK offers a spacious 1TB NVMe PCIe SSD, allowing for fast boot times and ample storage space for games, applications, and media files. Additionally, it has an expansion slot available for adding SSD if desired. Connectivity options include LAN, Wi-Fi, and Bluetooth 5.2, providing flexible options for network connectivity and wireless peripherals. The laptop is equipped with a variety of ports, including 1 x USB 2.0 Type A, 2 x USB 3.2 Type A Gen 1, and 1 x USB 3.2 Gen 1 Type C (USB C / Thunderbolt port). It also features an HDMI port for connecting to external displays. The MSI Katana 15 B12UDXK comes with a 4-zone RGB gaming keyboard with backlit functionality, allowing for customization and enhanced visibility in low-light environments. It includes a numeric keypad for convenient number input. The laptop features a touchpad for cursor control and navigation. The features of the laptop include a high-definition (HD) webcam, 2 x 2W speakers for audio output, and a firmware TPM 2.0 security chip for enhanced system security. The battery is a 3-cell unit with a capacity of 53.5Whr, providing up to approximately 4.5 hours of battery backup. The laptop comes with a 180W AC adapter for charging. The MSI Katana 15 B12UDXK runs on the Windows 11 Home operating system, offering a user-friendly interface and access to a wide range of software and applications.</p>\r\n<h2>Buy&nbsp;MSI Katana 15 B12UDXK Core i5 12th Gen RTX 3050 4GB Graphics 15.6\" FHD Gaming Laptop&nbsp;from the best Laptop Shop in BD</h2>\r\n<p>In Bangladesh, you can get original&nbsp;MSI Katana 15 B12UDXK Core i5 12th Gen RTX 3050 4GB Graphics 15.6\" FHD Gaming Laptop&nbsp;From Star Tech. We have a large collection of the latest&nbsp;MSI Laptops to purchase. Order Online Or Visit your Nearest&nbsp;Shop to get yours at the lowest price. The&nbsp;MSI Katana 15 B12UDXK Core i5 12th Gen 15.6\" Gaming Laptop comes with 02 year International Warranty.</p>', 'Key Features\r\nModel: Katana 15 B12UDXK\r\nProcessor: Intel Core i5-12450H (12M Cache, 3.30 GHz up to 4.40 GHz)\r\nRAM: 16GB DDR5 4800MHz, SSD: 1TB NVMe PCIe Gen4\r\nGraphics: Nvidia RTX 3050 4GB GDDR6\r\nFeatures: Backlight Keyboard, Type-C'),
(29, 29, 'en', 'Asus Vivobook E210MA Celeron N4020 11.6\" HD Laptop', '<h2>Asus Vivobook E210MA Celeron N4020 11.6\" HD Laptop</h2>\r\n<p>The Asus Vivobook E210MA Celeron N4020 11.6\" HD Laptop is a compact and lightweight laptop designed for everyday computing tasks. It is equipped with a reliable Intel Celeron N4020 processor, which provides a balance of performance and power efficiency. With a base clock speed of 1.10 GHz and a maximum turbo frequency of 2.80 GHz, this dual-core processor can handle common tasks such as web browsing, document editing, and multimedia playback with ease. The laptop comes with 4GB of DDR4 RAM, which is sufficient for multitasking and running basic applications smoothly. It also features a 256GB PCIEG3 SSD for storage, offering a decent amount of space to store your files, documents, and multimedia content. The Asus Vivobook E210MA sports an 11.6-inch HD display with a resolution of 1366 x 768 pixels. While it may not offer the highest pixel density, it provides crisp and clear visuals for everyday use. The laptop also features a chiclet keyboard, which provides a comfortable typing experience, and a Type-C port, which allows for fast data transfer and device connectivity. The Asus Vivobook E210MA Celeron N4020 11.6\" HD Laptop is a budget-friendly option that caters to users who prioritize portability and basic computing needs. It is suitable for students, travelers, and individuals who require a compact laptop for everyday tasks.</p>', 'MPN: E210MA-GJ534W\r\nModel: E210MA\r\nProcessor: Intel Celeron N4020 (4M Cache, 1.10 GHz up to 2.80 GHz)\r\nRAM: 4GB DDR4, Storage: 256GB PCIEG3 SSD\r\nDisplay: 11.6-inch, HD (1366 x 768)\r\nFeatures: Backlit Keyboard, Type-C'),
(30, 30, 'en', 'Asus Vivobook X515KA Celeron N4500 15.6\" FHD Laptop', '<h2>Asus Vivobook X515KA Celeron N4500 15.6\" FHD Laptop</h2>\r\n<p>The Asus Vivobook X515KA&nbsp;Laptop&nbsp;comes with Intel Celeron N4500 Processor (4M Cache, 1.10 GHz up to 2.80 GHz) and 4GB DDR4 RAM. It has a 1TB SATA 5400RPM 2.5\" HDD and it also comes with a 1x M.2 2280 PCIe 3.0x2 Slot. This laptop has been integrated with Intel UHD Graphics and it has a 15.6-inch HD (1280 X 720) display with a 16:9 aspect ratio. It runs on Windows 11 Home operating system. This whole system is powered by a 37WHrs, 2S1P, 2-cell Li-ion battery and comes with a &cedil;4.0, 33W AC Adapter, Output: 19V DC, 1.75A, 33W, Input: 100-240V AC 50/60Hz universal. This laptop has a VGA Webcam and a Built-in speaker with SonicMaster. The Asus Vivobook X515KA&nbsp;offers Wi-Fi 5(802.11ac) and Bluetooth 4.1 (Dual band) 1*1 for wireless connectivity. The laptop is designed with 2 x USB 2.0 Type-A, 1 x USB 3.2 Gen 1 Type-A, 1 x USB 3.2 Gen 1 Type-A &amp; 1 x HDMI. The Asus Vivobook X515KA&nbsp;Laptop comes with 2 years International Limited Warranty (Battery 1 year).</p>', 'MPN: EJ149W-X515KA\r\nModel: Vivobook X515KA\r\nProcessor: Intel Celeron N4500 (4M Cache, 1.10 GHz up to 2.80 GHz)\r\nRAM: 4GB DDR4 RAM, Storage: 1TB 5400RPM HDD\r\nDisplay: 15.6\" FHD (1920x1080)\r\nFeatures: Backlit Keyboard, Type-C'),
(31, 31, 'en', 'Lenovo IdeaPad Slim 3i Core i3 11th Gen 14\" FHD Laptop Abyss Blue', '<h2>Lenovo IdeaPad Slim 3i Core i3 11th Gen 14\" FHD Laptop Abyss Blue</h2>\r\n<p>The Lenovo IdeaPad Slim 3i is a compact and versatile laptop designed for everyday use. It is powered by the Intel Core i3-1115G4 processor, offering a balance of performance and efficiency. The processor has a base clock speed of 3.00 GHz, with the ability to boost up to 4.10 GHz when required. With 6MB of cache, it enables quick access to frequently used data, resulting in smoother multitasking and faster application launches. The laptop is equipped with 8GB of RAM, allowing for seamless multitasking and smooth application operation. It provides ample storage space with a 1TB HDD, offering enough room for storing files, documents, and multimedia content. Featuring a 14\" Full HD display with a resolution of 1920 x 1080 pixels, the laptop delivers crisp and vibrant visuals. Whether you\'re working on spreadsheets, watching movies, or browsing the web, the display provides an immersive viewing experience. The Lenovo IdeaPad Slim 3i incorporates several notable features. It includes a backlight keyboard, enabling comfortable typing even in low-light environments. The laptop has a Type-C port and an M.2 slot, providing versatile connectivity options and future upgrade potential. It is equipped with a 720P webcam and a privacy shutter, ensuring secure video conferencing and protecting your privacy when the camera is not in use. The laptop boasts UHD graphics, enhancing your multimedia experience with improved visuals and smoother playback. It also features Dolby Sound technology, delivering rich and immersive audio quality. Running on Windows 11 Home, the laptop offers a user-friendly and intuitive operating system. It supports AC WiFi 5 for fast and reliable wireless connectivity and Bluetooth 5.0 for seamless pairing with compatible devices. The laptop is finished in an attractive A.Grey shade, providing a sleek and modern appearance. This Lenovo IdeaPad Slim 3i incorporates FW TPM 2.0 (Trusted Platform Module), enhancing security through hardware-based encryption of sensitive data. Whether you\'re using the laptop for work, entertainment, or everyday tasks, it provides a reliable and feature-rich computing experience in a portable form factor.</p>', 'MPN: 82H701KBIN\r\nModel: IdeaPad Slim 3i\r\nProcessor: Intel Core i3-1115G4 (6M Cache, 3.00 GHz up to 4.10 GHz)\r\nRAM: 8GB RAM, Storage: 1TB HDD\r\nDisplay: 14\" FHD (1920 x 1080)\r\nFeatures: Backlight keyboard, Type-C'),
(32, 32, 'en', 'Lenovo IdeaPad Slim 3i Core i3 11th Gen 512GB SSD 14\" FHD Laptop', '<h2>Lenovo IdeaPad Slim 3i Core i3 11th Gen 512GB SSD 14\" FHD Laptop</h2>\r\n<p>The Lenovo IdeaPad Slim 3i is a versatile and compact laptop designed for daily use. It is powered by the Intel Core i3-1115G4 processor, striking a balance between performance and efficiency. The processor operates at a base clock speed of 3.00 GHz, with the ability to boost up to 4.10 GHz when necessary. With 6MB of cache, it enables quick access to frequently accessed data, resulting in smooth multitasking and faster application launches. The laptop is equipped with 8GB of RAM, ensuring seamless multitasking and efficient application operation. It offers ample storage space with a 512GB SSD, providing sufficient room for storing files, documents, and multimedia content. The laptop features a 14\" Full HD display with a resolution of 1920 x 1080 pixels, delivering crisp and vibrant visuals. Whether you\'re working on spreadsheets, watching movies, or browsing the web, the display offers an immersive viewing experience. The Lenovo IdeaPad Slim 3i incorporates several notable features. It includes a backlit keyboard, enabling comfortable typing even in low-light environments. The laptop is equipped with a Type-C port and an M.2 slot, offering versatile connectivity options and potential future upgrades. It features a 720P webcam with a privacy shutter, ensuring secure video conferencing and protecting your privacy when the camera is not in use. The laptop enhances your multimedia experience with UHD graphics, delivering improved visuals and smoother playback. Additionally, it incorporates Dolby Sound technology, providing rich and immersive audio quality. The laptop runs on the user-friendly and intuitive Windows 11 Home operating system. It supports fast and reliable wireless connectivity with AC WiFi 5 and seamless pairing with compatible devices through Bluetooth 5.0. The laptop features an attractive A. Grey finish, offering a sleek and modern appearance. The Lenovo IdeaPad Slim 3i incorporates FW TPM 2.0 (Trusted Platform Module) for enhanced security through hardware-based encryption of sensitive data. Whether you\'re using it for work, entertainment, or everyday tasks, this laptop delivers a reliable and feature-rich computing experience in a portable form factor.</p>\r\n<h2>Buy&nbsp;Lenovo IdeaPad Slim 3i Core i3 11th Gen 512GB SSD 14\" FHD Laptop&nbsp;from the best Laptop Shop in BD</h2>\r\n<p>In Bangladesh, you can get the original&nbsp;Lenovo IdeaPad Slim 3i Core i3 11th Gen 512GB SSD 14\" FHD Laptop&nbsp;from Star Tech. We have a large collection of the latest&nbsp;Lenovo&nbsp;Laptops&nbsp;to purchase. Order Online Or Visit your Nearest&nbsp;Shop&nbsp;to get yours at the lowest price. The Lenovo IdeaPad Slim 3i Core i3 11th Gen 512GB SSD 14\" FHD Laptop&nbsp;comes with &nbsp;2 years warranty ( Battery adapter 1 year).</p>', 'MPN: 82H701KCIN\r\nModel: IdeaPad Slim 3i\r\nProcessor: Intel Core i3-1115G4 (6M Cache, 3.00 GHz up to 4.10 GHz)\r\nRAM: 8GB RAM, Storage: 512GB SSD\r\nDisplay: 14\" FHD (1920 x 1080)\r\nFeatures: Backlight keyboard, Type-C'),
(33, 33, 'en', 'MSI Summit E16 Flip Evo A13MT Core i7 13th Gen 16GB RAM 16\" FHD+ 165Hz Touch Laptop', '<h2>MSI Summit E16 Flip Evo A13MT Core i7 13th Gen 16GB RAM 16\" FHD+ 165Hz Touch Laptop</h2>\r\n<p>The MSI Summit E16 Flip Evo A13MT is a powerful and versatile laptop designed for professionals and creators. It is powered by the latest Intel Core i7-1360P processor, with a base clock speed of 2.20GHz and a maximum turbo frequency of 5.00GHz, and 16GB of LPDDR5 RAM. The Summit E16 Flip Evo A13MT features a 16\" FHD+ display with a resolution of 1920x1200 and a 165Hz refresh rate. The display also has a touch screen, which allows you to interact with the laptop in a more natural and intuitive way. This makes the Summit E16 Flip Evo A13MT well-suited for tasks such as photo editing, graphic design, and web development. The laptop also features a 360-degree flip design, which allows you to easily switch between laptop, tablet, tent, and stand modes. It is equipped with a 1TB SSD, which provides plenty of space for all your documents, photos, videos, and more. The laptop also features a fingerprint sensor for added security and a backlit keyboard for comfortable typing in low-light conditions. This&nbsp;<a href=\"https://www.startech.com.bd/laptop-notebook/laptop/msi-laptop\" target=\"\">MSI Laptop</a>&nbsp;is an excellent choice for you.</p>\r\n<h3>Golden Ratio Display</h3>\r\n<p>The MSI Summit E16 Flip Evo A13MT is designed with the user\'s visual comfort in mind. The laptop features a 16:10 FHD+ display, which provides a wider and more immersive viewing experience compared to traditional 16:9 displays. The Summit E16 Flip Evo A13MT also comes with an MSI Pen, which allows you to take notes, draw, and navigate the screen with precision. The pen is designed to provide a natural and intuitive writing experience, which makes it perfect for tasks such as digital painting and sketching.</p>\r\n<h2>Buy MSI Summit E16 Flip Evo A13MT Core i7 13th Gen 16\" FHD+ 165Hz Touch Laptop from the best Laptop Shop in BD</h2>\r\n<p>In Bangladesh, you can get original&nbsp;<a href=\"https://www.startech.com.bd/msi-summit-e16-flip-evo-a13mt-core-i7-13th-gen-laptop\" target=\"\">MSI Summit E16 Flip Evo A13MT Core i7 13th Gen 16GB RAM 16\" FHD+ 165Hz Touch Laptop</a>&nbsp;From Star Tech. We have a large collection of latest&nbsp;<a href=\"https://www.startech.com.bd/laptop-notebook/Gaming-Laptop/msi\" target=\"\">MSI Gaming Laptop</a>&nbsp;to purchase. Order Online Or Visit your Nearest&nbsp;<a href=\"https://www.startech.com.bd/\" target=\"\">Star Tech</a>&nbsp;Shop to get yours at lowest price. The MSI Summit E16 Flip Evo A13MT Laptop comes with 2 Years warranty.</p>', 'Model: Summit E16 Flip Evo A13MT\r\nProcessor: Intel Core i7-1360P (18M Cache, 2.20 GHz up to 5.00 GHz)\r\nRAM: 16GB LPDDR5, Storage: 1TB SSD\r\nDisplay: 16\" FHD+ (1920x1200) 165Hz Touchscreen\r\nFeatures: 360° Flip design, Fingerprint, Backlit Keyboard'),
(34, 34, 'en', 'Acer TravelMate TMP214-53 Core i7 11th Gen 512GB SSD 14\" FHD Laptop', '<h2>Acer TravelMate TMP214-53 Core i7 11th Gen 512GB SSD 14\" FHD Laptop</h2>\r\n<p>The&nbsp;Acer TravelMate TMP214-53 Laptop comes with&nbsp;Intel Core i7-1165G7 Processor (12M Cache, 2.80 GHz up to 4.70 GHz, with IPU) and 8GB DDR4 3200MHz RAM. It features a 512 GB M.2 NVME SSD. This laptop has Integrated-Intel UHD Graphics and a 14\" IPS Full HD (1920X1080) Display with a Wide Viewing Angle of up to 170 Degrees. It runs on the Free DOS operating system. It has a 48 Wh 3-cell Li-ion battery and the Battery life lasts up to 10 hours. It comes with a 3-pin 45 W AC adapter. The laptop has two built-in stereo speakers (1.5Wx2=3W). It has a Standard Keyboard and HD Cam with Mic. It has been designed with 4 x USB 3.1 (Including 1 power-off charging &amp; 1 Type C), 1 x HDMI, 1 x VGA, 1 x Headset/speaker jack, and a power port. The Acer TravelMate TMP214-53 has 3 years of warranty (Battery Adapter 01 year).</p>', 'MPN: NX.VPLSI.00X\r\nModel: TravelMate TMP214-53\r\nProcessor: Intel Core i7-1165G7 (12M Cache, 2.80 GHz up to 4.70 GHz, with IPU)\r\nRAM: 8GB 3200MHz, Storage: 512 GB SSD\r\nDisplay: 14\" IPS Full HD (1920X1080)\r\nFeatures: Finger Print Reader'),
(35, 35, 'en', 'Walton Prelude N41 Pro Celeron N4120 14\" FHD Laptop', '<h2>Walton Prelude N41 Pro Celeron N4120 14\" FHD Laptop</h2>\r\n<p>The Walton Prelude N41 Pro Laptop is powered by an Intel Celeron N4120 Processor (4MB Cache, 1.10 GHz up to 2.60 GHz). The laptop comes with 8GB DDR4 2666MHz RAM and 256GB SATAIII M.2 2280 SSD for storage. It features a crystal-clear 14.0\" FHD display, a high-speed storage solution, a portable design, an abundance of ports for connectivity, and even includes a Bengali font on the keyboard. With its Intel Celeron N4120 processor, Intel UHD Graphics 600, and ample memory and storage options, this laptop offers a well-rounded package for work, entertainment, and productivity.</p>\r\n<h3>Crystal Clear Display</h3>\r\n<p>The Walton Prelude N41 Pro boasts a 14.0\" FHD (1920x1080) 16:9 panel with a slim 3.0mm bezel, ensuring a visually immersive experience. Whether you\'re streaming videos, editing photos, or working on documents, the crystal-clear display delivers sharp visuals and vibrant colors, enhancing your viewing pleasure.</p>\r\n<h3>High-Speed Storage</h3>\r\n<p>The Walton Prelude N41 Pro offers high-speed storage for speedy boot-up times and snappy program launches with a 256GB M.2 2280 SSD using a SATA interface. Additionally, the&nbsp;laptop&nbsp;has an extendable storage slot that lets you increase the storage capacity to 512GB. By doing this, you can be sure that you have enough room for your files, documents, and multimedia content.</p>\r\n<h3>Lightweight &amp; Portable</h3>\r\n<p>This Walton Prelude N41 Pro is incredibly thin and portable, weighing only 1.29kg with the absolute minimum and 36WH battery. Its thin profile, which measures 17.9 mm in thickness, makes it simple to carry in your luggage or backpack so you can continue to be productive while on the go.</p>\r\n<h3>Plenty of Ports</h3>\r\n<p>The&nbsp;Walton Prelude N41 Pro Laptop offers a variety of ports to meet your connectivity needs. It includes one USB 2.0 port, one USB 3.2 Gen 1 port (Type A), one USB 3.2 Gen 1 port (Type C), an HDMI output port, a 2-in-1 audio jack for headphones and microphones, and a DC-in jack.</p>\r\n<h3>Bengali Font on Keyboard</h3>\r\n<p>The Walton Prelude N41 Pro includes a multi-language isolated keyboard, which features a Bengali font. This allows users who require Bengali input to type comfortably and efficiently, enhancing their overall user experience.</p>\r\n<h2>Buy Walton Prelude N41 Pro Celeron N4120 14\" FHD Laptop from Star Tech</h2>\r\n<p>In Bangladesh, you can get original&nbsp;Walton Prelude N41 Pro Celeron N4120 14\" FHD Laptop&nbsp;From Star Tech. We have a large collection of latest&nbsp;Walton Laptop to purchase. Order Online Or Visit your Nearest&nbsp;Shop to get yours at lowest price. The Walton Prelude N41 Pro Celeron N4120 14\" FHD Laptop comes with 1 year warranty.</p>', 'Model: Prelude N41 Pro\r\nProcessor: Intel Celeron N4120 (4MB Cache, 1.10 GHz up to 2.60 GHz)\r\nRAM: 8GB DDR4, Storage: 256GB SSD\r\nDisplay: 14\" FHD (1920x1080)\r\nFeatures: Bangla Keyboard, Type-C'),
(36, 36, 'en', 'Acer Nitro 5 AN515-46-R3U8 Ryzen 5 6600H RTX 3050 4GB Graphics 15.6\" QHD 165Hz Gaming Laptop', '<h2>Acer Nitro 5 AN515-46-R3U8 Ryzen 5 6600H RTX 3050 4GB Graphics 15.6\" QHD 165Hz Gaming Laptop</h2>\r\n<p>Acer Nitro 5 AN515-46-R3U8 Gaming Laptop comes powered by AMD Ryzen 5 6600H (16MB L3 Cache, 3.3GHz, Up to 4.5GHz) and 8GB DDR5 RAM. It comes with 1TB PCIe Gen4, 16 Gb/s NVMe SSD for storage options. It is integrated with NVIDIA GeForce RTX 3050 with 4GB of dedicated GDDR6 Graphics. This<a href=\"https://www.startech.com.bd/laptop-notebook/laptop\" target=\"_blank\" rel=\"noopener\">&nbsp;laptop&nbsp;</a>is featured with a 15.6\" display with IPS (In-Plane Switching) technology, QHD 2560 x 1440, high-brightness (300 nits) Acer ComfyViewTM LED-backlit TFT LCD, supporting 165 Hz, 3 ms Overdrive. In this exclusive gaming laptop, Acer CoolBoost technology, and quad exhaust port design. Here Intel Wi-Fi 6 solutions (160Mhz channels, which deliver 2.4 Gbps of theoretical throughput) and Bluetooth 5.0 Network &amp; Wireless Connectivity are available. This laptop has been designed with 1x USB 3.2 Gen 1 Port, 1x USB 3.2 Gen 2 Port with power-off charging, 1x USB 3.2 Gen 2 Port, 1x USB Type-C Port. It offers an RGB keyboard and takes command of the inner workings of the laptop via the dedicated NitroSense Key. The WASD and arrow keys are also highlighted for easy visibility while the key response itself is immediate with a mere 1.6mm travel distance. In this gaming laptop, the Better audio delivers a competitive edge as well as a more immersive experience through dual 2W speakers. With DTS:X Ultra, sounds are clear and can be delivered in a 3D spatial soundscape, allowing you to hear where your opponents are coming from with pinpoint precision. The Acer Nitro 5 AN515-46-R3U8 comes with 02-year warranty.</p>', 'MPN: NH.QH2SI.005\r\nModel: Nitro 5 AN515-46-R3U8\r\nProcessor: AMD Ryzen 5 6600H (16MB L3 Cache, 3.3GHz, Up to 4.5GHz)\r\nRAM: 8GB DDR5, Storage: 1TB SSD\r\nGraphics: GeForce RTX 3050 4GB\r\nFeatures: Backlit Keyboard, Type-C'),
(37, 37, 'en', 'MSI GF63 THIN 11UC Core i5 11th Gen 512GB SSD RTX 3050 Max-Q 4GB Graphics 15.6\" FHD', '<section id=\"description\" class=\"description bg-white m-tb-15\">\r\n<div class=\"full-description\">\r\n<h2>MSI GF63 THIN 11UC Core i5 11th Gen 512GB SSD RTX 3050 Max-Q 4GB Graphics 15.6\" FHD Gaming Laptop</h2>\r\n<p>The MSI GF63 THIN 11UC is powered by the latest Intel Core i5-11400H Processor (12M Cache, 2.70 GHz up to 4.50 GHz), which is up to 40% performance gains over the previous generation. This processor is featured with greater power and this 8-core processor supports up to 4.6GHz dual-core frequency to maximize efficiency in gameplay, multi-task work, and productivity. This Gaming laptop comes with NVIDIA RTX 3050 4GB Max-Q Graphics, That fastest your laptop and you will enjoy the excellent performance, this gaming laptop is specially made for gamers and creators. Here, The 15.6\" FHD (1920*1080), 60Hz 45%NTSC IPS-Level brings you the most vibrant visuals so you never miss a beat. In this MSI Gaming laptop, Resizable BAR is an advanced PCI Express feature that enables the CPU to access the entire GPU frame buffer at once and improve performance and also this gaming laptop featured Intel Wi-Fi 6 AX201(2 x 2 ax), Gb LAN, and Bluetooth 5.1 Network &amp; Wireless Connectivity. This Laptop has 1x Type-C USB 3.2 Gen 1, 3x Type-A USB 3.2 Gen 1, 1x (4K @ 30Hz) HDMI, 1x Mic-in/Headphone-out Combo Jack (1/8\"), that provides universal connectivity. It helps to Immerse yourself in lossless music and enjoy the premium sound quality with Hi-Resolution Audio. Experience and listen to audio the way it was intended. In this Laptop, the in-game 3D surround sound and make finite control over your music, movies, and conference calls. This New MSI GF63 THIN 11UC with core i5 11th gen gaming laptop comes with 02 years International Warranty.</p>\r\n</div>\r\n</section>\r\n<section id=\"ask-question\" class=\"ask-question q-n-r-section bg-white m-tb-15\">\r\n<div class=\"section-head\">\r\n<div class=\"title-n-action\">&nbsp;</div>\r\n</div>\r\n</section>', 'Model: GF63 Thin 11UC\r\nProcessor: Intel Core i5-11400H (12M Cache, 2.70 GHz up to 4.50 GHz)\r\nRAM: 8GB DDR4 3200MHz, Storage: 512GB SSD\r\nGraphics: RTX 3050 Max-Q 4GB\r\nFeatures: Red keyboard with Anti-Ghost key'),
(38, 38, 'en', 'Lenovo IdeaPad 3 14ABA7 Ryzen 5 5625U 14\" FHD Laptop', '<h2>Lenovo IdeaPad 3 14ABA7 Ryzen 5 5625U 14\" FHD Laptop</h2>\r\n<p>The Lenovo IdeaPad 3 14ABA7 Ryzen 5 5625U is a high-performance&nbsp;<a href=\"https://www.startech.com.bd/laptop-notebook/laptop\" target=\"\">laptop</a>&nbsp;with an AMD Ryzen 5 5625U processor, which has a 16MB L3 cache and runs at 2.3GHz, with a maximum clock speed of 4.3GHz. It comes with 8GB of RAM that runs at 3200MHz and a 256GB NVMe PCIe SSD, which offers fast read and write speeds. The laptop features a 14\" FHD (1920x1080) TN display with 250nits brightness and an anti-glare coating that reduces glare and reflections. It has integrated AMD Radeon Graphics, which offers smooth graphics performance for video editing, gaming, and other intensive tasks. The Lenovo IdeaPad 3 14ABA7 Ryzen 5 5625U comes with various connectivity options, including a Type-C port, a privacy shutter, 1x USB 2.0, 1x USB 3.2 Gen 1, 1x USB-C 3.2 Gen 1, 1x HDMI 1.4b, 1x card reader, and a headphone/microphone combo jack (3.5mm). The USB-C port supports data transfer, Power Delivery 3.0, and DisplayPort 1.2, making it easy to connect to external displays or charge the laptop. The Lenovo IdeaPad 3 14ABA7 Ryzen 5 5625U is a powerful laptop that offers fast performance, smooth graphics, and a range of connectivity options, making it ideal for both personal and professional use.</p>\r\n<h2>Buy Lenovo IdeaPad 3 14ABA7 Ryzen 5 5625U 14\" FHD Laptop from the best Computer Shop in BD</h2>\r\n<p>In Bangladesh, you can get the original&nbsp;<a href=\"https://www.startech.com.bd/lenovo-ideapad-3-14aba7-ryzen-5-5625u-fhd-laptop\" target=\"\">Lenovo IdeaPad 3 14ABA7 Ryzen 5 5625U 14\" FHD Laptop</a>&nbsp;from Star Tech. We have a large collection of the latest&nbsp;<a href=\"https://www.startech.com.bd/laptop-notebook/laptop/lenovo-laptop\" target=\"\">Lenovo&nbsp;Laptops</a>&nbsp;to purchase. Order Online Or Visit your Nearest&nbsp;<a href=\"https://www.startech.com.bd/\" target=\"_blank\" rel=\"noopener\">Star Tech Shop</a>&nbsp;to get yours at the lowest price. The Lenovo IdeaPad 3 14ABA7 Ryzen 5 5625U 14\" FHD Laptop&nbsp;comes with&nbsp; 02 years Limited Warranty (Terms &amp; Conditions Apply As Per Lenovo).</p>', 'Key Features\r\nMPN: 82RM006EIN\r\nModel: IdeaPad 3 14ABA7\r\nProcessor: AMD Ryzen 5 5625U (16MB L3 Cache, 2.3GHz, up to 4.3GHz)\r\nRAM: 8GB 3200MHZ RAM, SSD: 256GB NVMe PCIe\r\nDisplay: 14\" FHD (1920x1080)\r\nFeatures: Type-C, Privacy Shutter'),
(39, 39, 'en', 'Lenovo IdeaPad Slim 3i Core i3 11th Gen 14\" FHD Laptop', '<h2>Lenovo IdeaPad Slim 3i Core i3 11th Gen 14\" FHD Laptop</h2>\r\n<p>The Lenovo IdeaPad Slim 3i Core i3 11th Gen 14\" FHD Laptop is a compact and versatile laptop designed for everyday use. Powered by the Intel Core i3-1115G4 processor, it offers a balance of performance and efficiency. The processor has a base clock speed of 3.00 GHz, which can be boosted up to 4.10 GHz when needed. With 6MB of cache, it provides quick access to frequently used data, resulting in smoother multitasking and faster application launches. The laptop comes equipped with 8GB of RAM, allowing for seamless multitasking and smooth operation of applications. It offers ample storage space with a 1TB HDD, providing enough room to store your files, documents, and multimedia content. Featuring a 14\" Full HD display with a resolution of 1920 x 1080 pixels, the laptop delivers crisp and vibrant visuals. Whether you\'re working on spreadsheets, watching movies, or browsing the web, the display offers an immersive viewing experience. The Lenovo IdeaPad Slim 3i also includes several noteworthy features. It has a backlight keyboard, allowing you to work comfortably even in low-light environments. The laptop has a Type-C port and an M.2 slot, providing versatile connectivity options and the potential for future upgrades. It is equipped with a 720P webcam and a privacy shutter, ensuring secure video conferencing and protecting your privacy when the camera is not in use. The laptop boasts UHD graphics, enhancing your multimedia experience with improved visuals and smoother playback. It also features Dolby Sound technology, delivering rich and immersive audio quality. Running on Windows 11 Home, the laptop offers a user-friendly and intuitive operating system. It supports AC WiFi 5 for fast and reliable wireless connectivity and Bluetooth 5.0 for seamless pairing with compatible devices. The laptop is finished in an attractive shade of A.Grey, providing a sleek and modern look. This Lenovo IdeaPad Slim 3i incorporates FW TPM 2.0 (Trusted Platform Module), which enhances security by providing hardware-based encryption for sensitive data. Whether you\'re using the laptop for work, entertainment, or everyday tasks, it offers a reliable and feature-rich computing experience in a portable form factor.</p>', 'MPN: 82H701KAIN\r\nModel: IdeaPad Slim 3i\r\nProcessor: Intel Core i3-1115G4 (6M Cache, 3.00 GHz up to 4.10 GHz)\r\nRAM: 8GB RAM, Storage: 1TB HDD\r\nDisplay: 14\" FHD (1920 x 1080)\r\nFeatures: Backlight keyboard, Type-C'),
(40, 40, 'en', 'MSI Creator Z16 A11UET Core i7 11th Gen RTX 3060 Max-Q 6GB Graphics 16\" QHD Gaming Laptop', '<h2>MSI Creator Z16 A11UET Core i7 11th Gen RTX 3060 Max-Q 6GB Graphics 16\" QHD Gaming Laptop</h2>\r\n<p>MSI Creator Z16 A11UET powered by Intel Core i7-11800H Processor (24M Cache, 2.30 GHz up to 4.60 GHz) with NVIDIA GeForce RTX 3060 Laptop GPU 6GB GDDR6 Graphics. The new Creator Z16 applies the Golden Ratio to product design with innovative technology. Here, the processor gives you cross-generation power to satisfy your multitasking and pro-level processing tasks. The Creator Z16 Gaming Laptop gives you more time to pursue your ideal muse from the best processor. This gaming laptop featured with 16GB (8GB x 2) DDR4 3200MHz RAM, 512GB NVMe PCIe Gen3x4 SSD and NVIDIA GeForce RTX 3060 Max-Q 6GB GDDR6 Graphics. In this gaming laptop, the GPUs will help you bring it to life. With 2x the rendering performance and up to 2x the graphics memory of the 20 Series, editing up to 8K HDR RAW video and working with extra-large 3D models is snappier than ever. Up the ante with better performance on the battery to work on the go, and you will enjoy the rich, pixel-accurate display that will catch every detail, now with 1440p options. The MSI Creator Z16 A11UET gaming laptop designed with a 16:10 display echoes the Golden Ratio 1.618, the perfect ratio considered as the law of beauty. This aspect ratio display gives an extra 11% room than 16&iuml;&frac14;&scaron;9 to check workspace and timeline in Adobe applications. With people-centric design philosophy, the Creator Z16 gaming laptop is equipped with a touch screen for intuitive interactions, letting you create elaborate works seamlessly. The Creator Z16 gives you accurate colors, that Visualize your artistic works with the brilliant True Pixel display. It also helps to Deliver vibrant images with QHD+ resolution, DCI-P3(Typical) 100% color gamut, factory-calibrated Delta-E &lt; 2 out of the box accuracy, and True Color Technology. This MSI gaming laptop has 4 x Stereo Speakers and experiences a whole new level of audio with a world-class Dynaudio sound system. With Speaker Tuning Engine, it also helps to generate a sonorous bass and clean, crisp vocal let you enjoy an immersive auditory sensation. Plus lossless music and the premium sound quality with Hi-Resolution Audio. In this MSI gaming laptop, the latest Wi-Fi 6E provides stunning speed while keeping the network smooth and stable even when crowded environment. With its outstanding throughput and low latency, you will always enjoy the smooth streaming of online videos. The Latest MSI Creator Z16 A11UET offers 02 years warranty.</p>', 'MPN: 270BD-LG71180H16GXXDX10EMH\r\nModel: Creator Z16 A11UET\r\nProcessor: Intel Core i7-11800H (24M Cache, 2.30 GHz up to 4.60 GHz)\r\nRAM: 16GB (8GB x 2) DDR4 3200MHz\r\nSSD: 512GB NVMe PCIe Gen3x4\r\nGraphics: NVIDIA RTX 3060 Max-Q 6GB GDDR6'),
(41, 41, 'en', 'MSI GF63 THIN 12UCX Core i5 12th Gen RTX 2050 4GB Graphics 15.6\" FHD 144hz', '<h2>MSI GF63 THIN 12UCX Core i5 12th Gen RTX 2050 4GB Graphics 15.6\" FHD 144hz Gaming Laptop</h2>\r\n<p>The MSI GF63 THIN 12UCX Gaming&nbsp;Laptop&nbsp;is an impressive machine designed for gamers who demand high-performance hardware. This laptop boasts a 15.6-inch Full HD display with a resolution of 1920 x 1080 and a fast refresh rate of 144Hz, providing users with smooth and fluid visuals during gaming sessions. The laptop is powered by an Intel Core i5-12450H (12M Cache, 3.30 GHz up to 4.40 GHz), which is a high-performance CPU that can handle demanding tasks with ease. It comes with a DDR IV 8GB RAM, operating at 3200MHz, ensuring smooth multitasking and efficient processing. For graphics, the MSI GF63 THIN 12UCX Gaming Laptop is equipped with an NVIDIA RTX 2050 graphics card with 4GB of GDDR6 memory. This graphics card provides stunning visuals and an immersive gaming experience with realistic graphics and high frame rates. The laptop also comes with a 512GB NVMe PCIe SSD Gen4x4 storage solution, which provides lightning-fast read and writes speeds. This storage solution does not have DRAM, but its performance is still impressive. The MSI GF63 THIN 12UCX Gaming Laptop has a 45% NTSC IPS-Level display, which provides accurate color reproduction and excellent viewing angles. It also features Intel Wi-Fi 6 AX201(2*2 ax) and Bluetooth 5.2 for fast and reliable wireless connectivity. This laptop has a 3-cell, 52.4Whr battery, which provides users with up to 8 hours of use on a single charge. Overall, the MSI GF63 THIN 12UCX Gaming Laptop is a powerful and efficient gaming machine that is perfect for gamers who need a reliable and high-performance laptop.</p>', 'Model: GF63 THIN 12UCX\r\nProcessor: Intel Core i5-12450H (12M Cache, 3.30 GHz up to 4.40 GHz)\r\nRAM: 8GB DDR4 3200MHz, Storage: 512GB NVMe PCIe SSD\r\nGraphics: NVIDIA RTX 2050 4GB GDDR6\r\nFeatures: Backlight Keyboard, Type-C'),
(42, 42, 'en', 'Walton Prelude N50 Pro Pentium Silver N5030 14\" FHD Laptop', '<h2>Walton Prelude N50 Pro Pentium Silver N5030 14\" FHD Laptop</h2>\r\n<p>The Walton Prelude N50 Pro Laptop is powered by an Intel Pentium Silver N5030 Processor (4MB Cache, 1.10 GHz up to 3.10 GHz). The laptop comes with 8GB DDR4 2666MHz RAM and 256GB SATAIII M.2 2280 SSD for storage. It features a crystal-clear 14.0\" FHD display, a high-speed storage solution, a portable design, an abundance of ports for connectivity, and even includes a Bengali font on the keyboard. With its Intel Pentium Silver N5030 processor, Intel UHD Graphics 605, and ample memory and storage options, this laptop offers a well-rounded package for work, entertainment, and productivity.</p>\r\n<h3>Crystal Clear Display</h3>\r\n<p>The Walton Prelude N50 Pro boasts a 14.0\" FHD (1920x1080) 16:9 panel with a slim 3.0mm bezel, ensuring a visually immersive experience. Whether you\'re streaming videos, editing photos, or working on documents, the crystal-clear display delivers sharp visuals and vibrant colors, enhancing your viewing pleasure.</p>\r\n<h3>High-Speed Storage</h3>\r\n<p>The Walton Prelude N50 Pro offers high-speed storage for speedy boot-up times and snappy program launches with a 256GB M.2 2280 SSD using a SATA interface. Additionally, the&nbsp;laptop&nbsp;has an extendable storage slot that lets you increase the storage capacity to 512GB. By doing this, you can be sure that you have enough room for your files, documents, and multimedia content.</p>\r\n<h3>Lightweight &amp; Portable</h3>\r\n<p>This Walton Prelude N50 Pro is incredibly thin and portable, weighing only 1.35kg. Its thin profile, which measures 17.9 mm in thickness, makes it simple to carry in your luggage or backpack so you can continue to be productive while on the go.</p>\r\n<h3>Plenty of Ports</h3>\r\n<p>The&nbsp;Walton Prelude N50 Pro Laptop offers a variety of ports to meet your connectivity needs. It includes one USB 2.0 port, one USB 3.2 Gen 1 port (Type A), one USB 3.2 Gen 1 port (Type C), an HDMI output port, a 2-in-1 audio jack for headphones and microphones, and a DC-in jack.</p>\r\n<h3>Bengali Font on Keyboard</h3>\r\n<p>The Walton Prelude N50 Pro includes a multi-language isolated keyboard, which features a Bengali font. This allows users who require Bengali input to type comfortably and efficiently, enhancing their overall user experience.</p>\r\n<h2>Buy Walton Prelude N50 Pro Pentium Silver N5030 14\" FHD Laptop from Star Tech</h2>\r\n<p>In Bangladesh, you can get original&nbsp;Walton Prelude N50 Pro Pentium Silver N5030 14\" FHD Laptop&nbsp;From Star Tech. We have a large collection of latest&nbsp;Walton Laptop to purchase. Order Online Or Visit your Nearest&nbsp;Shop to get yours at lowest price. The Walton Prelude N50 Pro Pentium Silver N5030 14\" FHD Laptop comes with 1 year warranty.</p>', 'Model: Prelude N50 Pro\r\nProcessor: Intel Pentium Silver N5030 (4MB Cache, 1.10 GHz up to 3.10 GHz)\r\nRAM: 8GB DDR4, Storage: 256GB SSD\r\nDisplay: 14\" FHD (1920x1080)\r\nFeatures: Bangla Keyboard, Type-C');
INSERT INTO `product_translations` (`id`, `product_id`, `locale`, `name`, `description`, `short_description`) VALUES
(43, 43, 'en', 'Lenovo IdeaPad 1 15AMN7 AMD Ryzen 5 512GB SSD 15.6\" FHD Laptop with DDR5 RAM', '<h2>Lenovo IdeaPad 1 15AMN7 AMD Ryzen 5 512GB SSD 15.6\" FHD Laptop with DDR5 RAM</h2>\r\n<p>The Lenovo IdeaPad 1 15AMN7&nbsp;is a stylish and powerful laptop that offers high-performance computing for a variety of jobs. This laptop can perform complex programs with ease thanks to an AMD Ryzen 5 7520U (2.8 GHz up to 4.3 GHz). The processor has four cores and eight threads, allowing you to multitask effectively and effortlessly. This laptop has 8GB DDR5-5500 Memory, which offers smooth performance even while running many apps at the same time. The 512GB SSD PCIe offers plenty of storage capacity for your data, documents, and multimedia files. SSD technology enables rapid boot-up and load times, allowing you to complete your tasks quickly. The AMD Radeon 610M graphics provides exceptional graphics performance, making this laptop suitable for gaming and video editing. The 14-inch FHD (1920x1080) display provides clear and sharp graphics, letting you view high-quality entertainment without pixelation or blurring. This Lenovo IdeaPad 1 15AMN7&nbsp;is a powerful and flexible laptop that can meet a variety of computing demands. Whether you\'re a student, professional, or gamer, this laptop is a dependable option that can manage your workload with ease.</p>\r\n<h2>Buy Lenovo IdeaPad 1 15AMN7 AMD Ryzen 5 512GB 15.6\" FHD Laptop with DDR5 RAM from the best Computer Shop in BD</h2>\r\n<p>In Bangladesh, you can get the original&nbsp;<a href=\"https://www.startech.com.bd/lenovo-ideapad-1-15amn7-amd-ryzen-5-laptop\" target=\"\">Lenovo IdeaPad 1 14AMN7 AMD Ryzen 5 15.6\" FHD Laptop</a>&nbsp;from Star Tech. We have a large collection of the latest&nbsp;Lenovo&nbsp;<a href=\"https://www.startech.com.bd/laptop-notebook/laptop\" target=\"\">Laptops&nbsp;</a>to purchase. Order Online Or Visit your Nearest&nbsp;<a href=\"https://www.startech.com.bd/\" target=\"_blank\" rel=\"noopener\">Star Tech Shop</a>&nbsp;to get yours at the lowest price. The Lenovo IdeaPad 1 15AMN7&nbsp;AMD Ryzen 5 15.6\" FHD Laptop&nbsp;comes with &nbsp;2 years warranty ( Battery adapter 1 year).</p>', 'Model: IdeaPad 1 15AMN7\r\nProcessor: AMD Ryzen 5 7520U (2.8 GHz up to 4.3 GHz)\r\nRAM: 8GB DDR5 5500MHz, Storage: 512GB M.2 NVMe SSD\r\nDisplay: 15.6\" FHD (1920X1080)\r\nFeatures: Type-C, Privacy shutter'),
(44, 44, 'en', 'Acer Aspire 7 A715-42G-R2NE Ryzen 5 5500U GTX 1650 4GB Graphics 15.6\" FHD', '<h2>Acer Aspire 7 A715-42G-R2NE Ryzen 5 5500U GTX 1650 4GB Graphics 15.6\" FHD Gaming Laptop</h2>\r\n<p>Acer Aspire 7 A715-42G-R2NE Gaming Laptop comes powered by AMD Ryzen 5 5500U Processor (8M Cache, 2.1GHz up to 4.0GHz, 6 cores) and 8GB DDR4 RAM. It comes with 512GB PCIe Gen4, 16 Gb/s NVMe SSD for storage options. It is integrated with NVIDIA GeForce GTX 1650 with 4 GB of dedicated GDDR6 Graphics. This&nbsp;laptop&nbsp;is featured with a 15.6\" display with IPS (In-Plane Switching) technology, Full HD 1920 x 1080, Acer ComfyView LED-backlit TFT LCD. In this exclusive gaming laptop, Acer CoolBoost technology, and quad exhaust port design. Here Intel Wi-Fi 6 solutions (160Mhz channels, which deliver 2.4 Gbps of theoretical throughput) and Bluetooth 5.0 Network &amp; Wireless Connectivity are available. This laptop has been designed with 1 X USB Type-C port, 1 X USB 3.2 Gen 1 port, and 1 X USB 2.0 port. It offers an RGB keyboard and takes command of the inner workings of the laptop via the dedicated NitroSense Key. The WASD and arrow keys are also highlighted for easy visibility while the key response itself is immediate with a mere 1.6mm travel distance. In this gaming laptop, the Better audio delivers a competitive edge as well as a more immersive experience through dual 2W speakers. With DTS:X Ultra, sounds are clear and can be delivered in a 3D spatial soundscape, allowing you to hear where your opponents are coming from with pinpoint precision. The Acer Aspire 7 A715-42G-R2NE comes with 02-year warranty.</p>', 'MPN: NH.QAYSI.004\r\nModel: Aspire 7 A715-42G-R2NE\r\nProcessor: AMD Ryzen 5 5500U (8M Cache, 2.1GHz up to 4.0GHz)\r\nRAM: 8GB DDR4, Storage: 512GB SSD\r\nGraphics: GeForce GTX 1650 4GB\r\nFeatures: Backlit Keyboard, Type-C'),
(45, 45, 'en', 'AMD Athlon 200GE Desktop PC', '<h2>AMD Athlon 200GE Desktop PC</h2>\r\n<p>The AMD Athlon 200GE Desktop PC is a budget-friendly system with capable performance, featuring the AMD Athlon 200GE AM4 Socket Desktop Processor with Radeon Vega 3 Graphics for everyday computing and basic graphics needs. Paired with the MSI A320M-A Pro AMD Micro-ATX Motherboard, it provides a reliable foundation. The PC includes 4GB of Netac Basic DDR4 2666MHz Desktop RAM for essential multitasking and a TEAM T-FORCE VULCAN Z 256GB SATA SSD for fast storage access. Housed in the MaxGreen 2810BG ATX Casing, this compact and functional desktop PC is an affordable option for web browsing, document processing, and basic multimedia tasks.</p>', 'Model: Athlon 200GE Desktop PC\r\nAMD Athlon 200GE AM4 Socket Desktop Processor with Radeon Vega 3 Graphics\r\nMSI A320M-A Pro AMD Micro-ATX Motherboard (C)\r\nTEAM T-FORCE VULCAN Z 256GB SATA SSD\r\nNetac Basic 4GB DDR4 2666MHZ Desktop RAM'),
(46, 46, 'en', 'AMD Ryzen 5 4600G Desktop PC', '<h2>AMD Ryzen 5 4600G Desktop PC</h2>\r\n<p>The AMD Ryzen 5 4600G Desktop PC is a powerful and efficient system, featuring the AMD Ryzen 5 4600G Processor with Radeon Graphics for excellent computing and graphics performance. It is paired with the MSI A520M-A Pro AM4 AMD Micro-ATX Motherboard, providing a reliable and feature-rich platform. The PC comes with 8GB of G.Skill RIPJAWS-V 3200MHz DDR4 Desktop RAM for smooth multitasking, and an HP EX900 PLUS 256GB M.2 PCIe NVMe Internal SSD for fast storage access. Housed in the MaxGreen 2810BG ATX Casing, this desktop PC offers a stylish and compact design, making it a great choice for productivity tasks and light gaming.</p>', 'Model: Ryzen 5 4600G Desktop PC\r\nAMD Ryzen 5 4600G Processor with Radeon Graphics\r\nMSI A520M-A Pro AM4 AMD Micro-ATX Motherboard (C)\r\nG.Skill RIPJAWS-V 8GB DDR4 3200MHz RAM\r\nHP EX900 PLUS 256GB M.2 PCIe NVMe SSD'),
(47, 47, 'en', 'AMD Ryzen 5 5600G Custom Desktop PC', '<h2>AMD Ryzen 5 5600G Custom Desktop PC</h2>\r\n<p>The AMD Ryzen 5 5600G Custom Desktop PC from Star Tech features an AMD Ryzen 5 5600G Processor with Radeon Graphics (Chinese Edition), MSI A520M-A Pro AM4 AMD Micro-ATX Motherboard, Team T-Force VULCAN TUF Gaming Alliance 8GB 3200MHz DDR4 Desktop RAM, MaxGreen 2810BG ATX Casing, and HP EX900 M.2 250GB PCIe NVMe Internal SSD. It offers powerful performance and efficient computing for both work and gaming.</p>', 'Model: Ryzen 5 5600G Desktop PC\r\nAMD Ryzen 5 5600G Processor with Radeon Graphics (Chinese Edition)\r\nMSI A520M-A Pro AM4 AMD Micro-ATX Motherboard (C)\r\nTeam T-Force VULCAN TUF Gaming Alliance 8GB 3200MHz DDR4 RAM\r\nHP EX900 M.2 250GB PCIe NVMe Internal SSD'),
(48, 48, 'en', 'Google Pixel 6a Android Smartphone (6/128GB) Sage', '<h2>Google Pixel 6a Android Smartphone (6/128GB)&nbsp;Sage</h2>\r\n<p>The&nbsp;Google Pixel 6a comes with a&nbsp;6.1-inch OLED display with an FHD+ resolution of 1080 x 2400 pixels with a 20:9 aspect ratio and a pixel density of around 429 ppi. It also has HDR and Corning Gorilla Glass 3 protection, as well as an always-on display feature. This phone is powered by Google Tensor for fast performance.&nbsp;Google Tensor is a custom-built chip that makes Pixel phones faster and more intelligent, allowing you to do more on your phone. It comes with&nbsp;6 GB LPDDR5 RAM and 128 GB UFS 3.1 storage. The adaptive battery system can deliver over 24-hour battery life and with the extreme battery saver mode it can last up to 72 hours.</p>\r\n<h3>Google Tensor custom-built chip for Pixel phones</h3>\r\n<p>Google Tensor-powered Pixel phones use artificial intelligence and machine learning to accomplish ever-more complex tasks, such as immediately translating messages and videos without internet access or exposing the material you need at the right time.&nbsp;Google Pixel 6a&nbsp;makes apps launch fast, pages and images load quickly, and everything runs smoothly with the help of the Google Tensor chip. It is a 5nm octa-core processor that has&nbsp;2x2.80 GHz Cortex-X1 &amp; 2x2.25 GHz Cortex-A76 &amp; 4x1.80 GHz Cortex-A55.&nbsp;Pixel phones get better with time, becoming more personalized and helpful</p>\r\n<h3>Dual Camera Setup</h3>\r\n<p>The Pixel 6a\'s dual-camera system features a 12.2 MP wide lens with an f/1.7 aperture and a 12 MP ultra-wide lens with an f/2.2 aperture, as well as dual-LED flash, Pixel Shift, Auto-HDR, and panorama features. It can record 4K video at 30 or 60 fps, as well as 1080p video at 30, 60, 120, or 240 fps, with gyro-EIS and OIS stabilization. The front-facing camera is an 8 MP lens with an f/2.0 aperture, which can record 1080p video at 30 fps. The Pixel 6a has some unique camera features.</p>\r\n<h3>Protection and privacy</h3>\r\n<p>Google Pixel 6a is a water-friendly phone with IP67 protection. The Pixel 6a can take a little water and dust. So you can take your phone wherever you go.&nbsp;The Titan M2 chip and Google Tensor security core give Pixel an extra layer of hardware security, so it&rsquo;s more resilient to attacks. It has an under-display optical fingerprint sensor. Fingerprint Unlock is a secure and reliable way to unlock your phone.</p>\r\n<h3>Android experiences built for you</h3>\r\n<p>The&nbsp;Google Pixel 6a offers a customizable Pixel interface.&nbsp;Get things done easier and faster with Material You. And the colors across Pixel even complement the wallpaper image you choose. With Live Translate, you can chat in 11 languages, interpret face-to-face conversations, and translate signs with the camera. It does not require an internet connection.&nbsp;Every few months, your Pixel gets automatic software updates that send new features, tricks, and apps right to your phone.</p>', 'Model: Pixel 6a\r\nDisplay: 6.1-inch FHD+ OLED display, up to 60 Hz\r\nProcessor: Google Tensor Octa-core (5 nm)\r\nCamera: Dual 12.2MP + 12MP on rear, 8MP front\r\nFeatures: IP67, eSIM, Under Display Fingerprint'),
(49, 49, 'en', 'AMD Ryzen 5 5600G Custom Desktop PC', '<h2>AMD Ryzen 5 5600G Custom Desktop PC</h2>\r\n<p>The AMD Ryzen 5 5600G Custom Desktop PC from Star Tech features an AMD Ryzen 5 5600G Processor with Radeon Graphics (Chinese Edition), MSI A520M-A Pro AM4 AMD Micro-ATX Motherboard, Team T-Force VULCAN TUF Gaming Alliance 8GB 3200MHz DDR4 Desktop RAM, MaxGreen 2810BG ATX Casing, and HP EX900 M.2 250GB PCIe NVMe Internal SSD. It offers powerful performance and efficient computing for both work and gaming.</p>', 'Model: Ryzen 5 5600G Desktop PC\r\nAMD Ryzen 5 5600G Processor with Radeon Graphics (Chinese Edition)\r\nMSI A520M-A Pro AM4 AMD Micro-ATX Motherboard (C)\r\nTeam T-Force VULCAN TUF Gaming Alliance 8GB 3200MHz DDR4 RAM\r\nHP EX900 M.2 250GB PCIe NVMe Internal SSD'),
(50, 50, 'en', 'Intel 10th Gen Core i3-10100 Desktop PC', '<h2>Intel 10th Gen Core i3-10100 Desktop PC</h2>\r\n<p>The Intel 10th Gen Core i3-10100 Desktop PC includes an Intel 10th Gen Core i3-10100 Processor, ASRock H510M-HDV/M.2 10th and 11th Gen Micro ATX Motherboard, 8GB of PNY XLR8 3200MHz DDR4 Desktop Gaming RAM, a Team MP33 256GB M.2 PCIe SSD, and comes in the Revenger BULLET Mini Tower Micro ATX RGB Gaming Case with a built-in Power Supply.</p>', 'Model: 10th Gen Desktop PC\r\nIntel 10th Gen Core i3 10100 Processor\r\nASRock H510M-HDV/M.2 10th and 11th Gen Micro ATX Motherboard\r\nPNY XLR8 8GB DDR4 3200MHz Desktop Gaming RAM\r\nTeam MP33 256GB M.2 PCIe SSD'),
(51, 51, 'en', 'Samsung Galaxy A14 Smartphone (4/64GB)', '<h2>Samsung Galaxy A14 Smartphone (4/64GB)</h2>\r\n<p>The Samsung Galaxy A14 has a 6.6-inch Full HD+ PLS LCD screen. It has a waterdrop notch for the front camera. The rear camera has a triple 50+5+2 MP resolution, PDAF, f/1.8 aperture, ultrawide, dedicated macro camera, and Full HD video recording capabilities. The front-facing camera has an 8-megapixel resolution. The Galaxy A14 features a 5000 mAh battery with 15W fast charging. It has 4 GB of RAM, an octa-core CPU running at up to 2.0 GHz, and a Mali-G52 GPU. The chipset is a Mediatek Helio G80 (12 nm). The device has an internal storage capacity of 64 GB and a dedicated MicroSD slot. This phone has a fingerprint sensor on the side.</p>', 'Model: Galaxy A14\r\nDisplay: 6.6-inch FHD+ (1080 x 2408)\r\nProcessor: Mediatek MT6769 Helio G80 (12 nm)\r\nCamera: Triple 50+5+2MP Rear, 13MP Front\r\nFeatures: 5000mAh Li-Ion Battery'),
(52, 52, 'en', 'AMD Ryzen 9 5900X Gaming Desktop PC', '<h2>AMD Ryzen 9 5900X Gaming Desktop PC</h2>\r\n<p>The AMD Ryzen 9 5900X Gaming Desktop PC comes equipped with the AMD Ryzen 9 5900X processor and the MSI MAG B550M MORTAR MAX WIFI AMD AM4 Micro-ATX Motherboard. This Gaming Desktop PC delivers unmatched processing power and seamless connectivity. Enjoy smooth gameplay and lightning-fast application launches with the TEAM T-Force DELTA TUF Gaming RGB 16GB 3200MHz DDR4 CL16 RAM. Store your vast gaming library and multimedia content on the Samsung 980 1TB PCIe 3.0 M.2 NVMe SSD. Immerse yourself in stunning visuals and impressive frame rates with the Colorful iGame GeForce RTX 3060 Ultra W OC 12G L-V 12GB GDDR6 Graphics Card. The Antec NeoEco Gold 850W Modular Power Supply ensures stable and efficient power delivery for all your gaming needs. Keep your CPU running cool even during intense gaming sessions with the Lian Li Galahad 240mm Closed-Loop AIO Liquid CPU Cooler in sleek black. All these heavy components are housed in the stylish and durable Antec AX90 Mid-Tower ATX Gaming Case.</p>', 'Model: Ryzen 9 5900X Gaming Desktop PC\r\nAMD Ryzen 9 5900X Processor\r\nMSI MAG B550M MORTAR MAX WIFI AMD AM4 Micro-ATX Motherboard\r\nTEAM T-Force DELTA TUF Gaming RGB 16GB RAM + Samsung 980 1TB SSD\r\nColorful iGame GeForce RTX 3060 Ultra W OC 12G L-V 12GB GDDR6 Graphics Card'),
(53, 53, 'en', 'AMD Ryzen 5 7600X Gaming Desktop PC', '<h2>AMD Ryzen 5 7600X Gaming Desktop PC</h2>\r\n<p>The AMD Ryzen 5 7600X Gaming Desktop PC is equipped with the AMD Ryzen 5 7600X processor and backed by the GIGABYTE B650M DS3H DDR5 AMD AM5 Micro-ATX Motherboard. This Gaming Desktop PC offers lightning-fast performance and impressive multitasking capabilities. The Kingston FURY Beast 16GB 6000MHz DDR5 RGB Desktop RAM ensures smooth gameplay and seamless application launches. Store your favorite games and files on the lightning-quick Samsung 980 Pro 500GB PCIe 4.0 M.2 NVMe SSD. The Colorful GeForce RTX 3060 NB DUO 8GB-V 8GB GDDR6 Graphics Card guarantees stunning visuals and immersive gaming experiences. To keep everything cool, the DeepCool AK620 High-Performance Dual Tower CPU Cooler is in place. With the reliable Antec NeoEco Gold 650W Modular Power Supply and the stylish Antec AX90 Mid-Tower ATX Gaming Case, this gaming desktop PC not only delivers top-notch performance but also looks great in any gaming setup.</p>', 'Model: Ryzen 5 7600X Gaming Desktop PC\r\nAMD Ryzen 5 7600X Processor\r\nGIGABYTE B650M DS3H DDR5 AMD AM5 Micro-ATX Motherboard\r\nKingston FURY Beast 16GB 6000MHz RAM + Samsung 980 Pro 500GB SSD\r\nColorful GeForce RTX 3060 NB DUO 8GB-V 8GB GDDR6 Graphics Card'),
(54, 54, 'en', 'Samsung Galaxy F13 Smartphone (4/64GB)', '<h2>Samsung Galaxy F13 Smartphone (4/64GB)</h2>\r\n<p>The Samsung Galaxy F13 has a 6.6-inch Full HD+ PLS LCD screen. It has a waterdrop notch for the front camera. The rear camera is a triple 50+5+2 with PDAF, f/1.8 aperture, ultrawide, depth sensor, LED flash, and other features, as well as Full HD video recording. The front-facing camera has an 8-megapixel resolution. The Galaxy F13 features a 6000 mAh battery with 15W fast charging. It has 4GB of RAM, an octa-core CPU running at up to 2.0 GHz, and a Mali-G52 GPU. The Exynos 850 (8 nm) chipset powers it. The device has an internal storage capacity of 64GB and a dedicated MicroSD slot. This phone has a fingerprint sensor on the side.</p>', 'Model: Galaxy F13\r\nDisplay: 6.6\" FHD+ PLS LCD Touchscreen\r\nProcessor: Octa-Core 2GHz, Exynos 850 (8nm)\r\nCamera: Triple 50+5+2 MP on Rear, 8MP Selfie\r\nFeatures: 6000mAh Battery, Side Mounted Fingerprint'),
(55, 55, 'en', 'AMD Ryzen 9 7950X Gaming Desktop PC', '<h2>AMD Ryzen 9 7950X Gaming Desktop PC</h2>\r\n<p>The AMD Ryzen 9 7950X Gaming Desktop PC is powered by the mighty AMD Ryzen 9 7950X processor and backed by the GIGABYTE B650M AORUS ELITE AX DDR5 AMD AM5 Micro-ATX Motherboard. Experience seamless multitasking and smooth gaming with Kingston FURY Beast 16GB 6000MHz DDR5 RGB Desktop RAM. Store all your favorite games and media on the lightning-fast Samsung PM9A1 2TB M.2 PCIe Gen 4.0 NVMe SSD. Prepare for jaw-dropping visuals and mind-blowing frame rates with the Colorful iGame GeForce RTX 4080 16GB Vulcan OC-V GDDR6X Graphics Card. The Antec HCG 1000 Gold Fully Modular Power Supply ensures stable and reliable power delivery for the most demanding gaming sessions. Keep your CPU running cool with the Corsair iCUE H150i ELITE CAPELLIX XT RGB Liquid CPU Cooler. All these top-notch components are housed in the sleek and stylish Lian Li LANCOOL III RGB Mid-Tower E-ATX Gaming Case.</p>', 'Model: Ryzen 9 7950X Gaming Desktop PC\r\nAMD Ryzen 9 7950X Processor\r\nGIGABYTE B650M AORUS ELITE AX DDR5 AMD AM5 Micro-ATX Motherboard\r\nKingston FURY Beast 16GB 6000MHz RAM + Samsung PM9A1 2TB SSD\r\nColorful iGame GeForce RTX 4080 16GB Vulcan OC-V GDDR6X Graphics Card'),
(56, 56, 'en', 'AMD Ryzen 5 5500 Gaming Desktop PC', '<h2>AMD Ryzen 5 5500 Gaming Desktop PC</h2>\r\n<p>The AMD Ryzen 5 5500 Gaming Desktop PC is a powerful setup catering to gaming enthusiasts. It features the AMD Ryzen 5 5500 Processor for impressive gaming performance and multitasking capabilities. Paired with the BIOSTAR A520MH MICRO ATX AMD AM4 MOTHERBOARD, the PC offers a stable and efficient platform. With 8GB of Team Elite Plus Red 3200MHz DDR4 U-DIMM Desktop RAM, the PC ensures smooth multitasking and a responsive gaming experience. The HP EX900 M.2 250GB PCIe NVMe Internal SSD provides fast storage access, resulting in reduced loading times for games and applications. The Colorful GeForce GT710-2GD3-V 2GB Graphics Card enhances gaming visuals, delivering a satisfactory gaming experience in less demanding titles. Housed in the Revenger BULLET Mini Tower Micro ATX RGB Gaming Case with a built-in Power Supply, this AMD Ryzen 5 5500 Gaming Desktop PC offers both performance and convenience for an immersive gaming setup.</p>', 'Model: Ryzen 5 5500 Gaming Desktop PC\r\nAMD Ryzen 5 5500 Processor\r\nBIOSTAR A520MH MICRO ATX AMD AM4 MOTHERBOARD\r\nTeam Elite Plus Red 8GB RAM + HP EX900 M.2 250GB PCIe NVMe SSD\r\nColorful GeForce GT710-2GD3-V 2GB Graphics Card'),
(57, 57, 'en', 'OPPO A77s Smartphone (8/128GB)', '<h2>OPPO A77s Smartphone (8/128GB)</h2>\r\n<p>The Oppo A77s has a 6.56-inch HD+ IPS LCD screen. It has a front camera with a left waterdrop notch. The rear camera has dual 50+2 MP resolution, PDAF, depth sensor, f/1.8 aperture, and Full HD video recording. The front-facing camera has an 8-megapixel resolution. The Oppo A77s features a 5000 mAh battery with 33W rapid charging. It has 8 GB of RAM, an octa-core CPU that runs at up to 2.4 GHz, and an Adreno 610 GPU. The Qualcomm Snapdragon 680 4G (6 nm) chipset powers it. The phone has 128 GB of internal storage as well as a dedicated MicroSD slot. This phone has a fingerprint sensor on the side.</p>\r\n<h3>90Hz Colour-Rich Display</h3>\r\n<p>The OPPO A77s comes with a&nbsp;6.56-inch large and vivid Colour-Rich Display. Read or game all night with AI Eye Comfort and blue light reduction designed to provide the least strenuous eye experience possible.</p>\r\n<h3>8GB + Up to 8GB Extended RAM</h3>\r\n<p>The&nbsp;OPPO A77s is powered by a Qualcomm SM6225 Snapdragon 680 4G (6 nm) processor. It is equipped with 8GB LPDDR4x RAM and 128GB of&nbsp;UFS2.2 storage.&nbsp;OPPO A77s now supports up to 8GB Extended RAM via the latest OTA updates.</p>\r\n<h3>5000mAh Battery with 33W SUPERVOOC Charging</h3>\r\n<p>OPPO A77s comes equipped with an ultra-large 5000mAh battery. It lets you make calls or stream your favorite tunes all day long. And thanks to the Superfast 33W charging gets you out the door fast.</p>', 'MPN: CPH2473\r\nModel: A77s\r\nDisplay: 6.56\" HD+ 90Hz Colour-Rich Display\r\nProcessor: Qualcomm SM6225 Snapdragon 680 4G (6 nm)\r\nCamera: Dual 50+2 MP on Rear, 8MP Front\r\nFeatures: IP54, 8GB Extended RAM, Side Fingerprint, 33W SUPERVOOC'),
(58, 58, 'en', 'Intel 10th Gen Core i5-10400 GIGABYTE Special Desktop PC', '<h2>Intel 10th Gen Core i5-10400 GIGABYTE Special Desktop PC</h2>\r\n<p>The Intel 10th Gen Core i5-10400 GIGABYTE Special Desktop PC features the Intel 10th Gen Core i5-10400 Processor paired with the GIGABYTE H510M H Intel 10th and 11th Gen Micro ATX Motherboard to ensures stable and efficient performance. With 8GB of GIGABYTE DDR4 2666MHz Heatsink Desktop RAM, multitasking is smooth and efficient, providing a responsive experience. The GIGABYTE 256GB NVMe M.2 SSD ensures fast storage access, quick boot times, and smooth data transfers. The Desktop PC is powered by the reliable GIGABYTE P450B 450W 80 Plus Bronze Certified Power Supply. All these components are housed in the stylish GIGABYTE C200 Glass RGB LED Casing. The PC features a sleek design with customizable RGB lighting for added aesthetics. The Intel 10th Gen Core i5-10400 GIGABYTE Special Desktop PC is a great choice for users seeking a budget-friendly system for everyday computing needs and light gaming, while also enjoying a touch of style with its illuminated casing.</p>', 'Model: GIGABYTE Special Desktop PC\r\nIntel 10th Gen Core i5-10400 Processor\r\nGIGABYTE H510M H Intel 10th and 11th Gen Micro ATX Motherboard\r\nGIGABYTE 8GB DDR4 2666MHz Heatsink Desktop RAM\r\nGIGABYTE 256GB NVMe M.2 SSD'),
(59, 59, 'en', 'OPPO F21s Pro Smartphone (8/128GB)', '<h2>OPPO F21s Pro Smartphone (8/128GB)</h2>\r\n<p>The Oppo F21s Pro has a 6.43-inch Full HD+ AMOLED screen. It sports a punch-hole front camera on the left side. The rear camera has a triple 64+2+2 Megapixel resolution, PDAF, LED flash, f/1.7 aperture, microscope, depth sensor, and other features, as well as Full HD video recording capability. The front-facing camera has a resolution of 32 MP. The Oppo F21s Pro features a 4500 mAh battery with 33W rapid charging. It has 8 GB of RAM, an octa-core CPU that runs at up to 2.4 GHz, and an Adreno 610 GPU. The Qualcomm Snapdragon 680 4G (6 nm) chipset powers it. The&nbsp;phone&nbsp;has 128 GB of internal storage as well as a dedicated MicroSD slot. This phone has an optical in-display fingerprint sensor.</p>\r\n<h3>Flagship IMX709 Selfie Sensor</h3>\r\n<p>OPPO F21s Pro comes with&nbsp;SONY IMX709 Flagship Selfie Sensor. Exclusively Customized by OPPO and built with Sony hardware, this Next Generation RGBW sensor introduces white pixels that are more sensitive to light, capturing 60% more light while reducing 35% noise.</p>\r\n<h3>64MP AI Triple Camera</h3>\r\n<p>OPPO F21s Pro comes with a 64MP Main Camera, 2MP Microlens, and 2MP Depth Camera. The 64MP camera delivers a whole new level of clarity, guaranteeing every scene is a masterpiece and every shot is a perfect shot.</p>\r\n<h3>90Hz AMOLED Eye-Care Display</h3>\r\n<p>OPPO F21s Pro Smartphone has a 6.43 inch AMOLED Eye-Care Display, 90Hz refresh rate, and 180Hz touch sampling. It ensures high responsiveness and smooth scrolling. The AMOLED FHD+ Eye-Care Display protects eyes from harmful blue light.</p>\r\n<h3>Qualcomm Snapdragon 6nm Processor</h3>\r\n<p>OPPO F21s Pro Smartphone is powered by the Qualcomm SM6225 Snapdragon 680 6nm Processor. The new generation Qualcomm Snapdragon 6nm processor is designed to deliver a long-lasting superior performance while conserving power.</p>\r\n<h3>Up to 5GB RAM Expansion</h3>\r\n<p>OPPO F21s Pro is equipped with 8GB RAM and 128GB of storage. It supports virtual RAM for more multitasking. The RAM Expansion capacity of borrowing up to 5GB from unused ROM, makes for a smooth phone performance as you skip between your favorite apps</p>\r\n<h3>Orbit Light</h3>\r\n<p>The OPPO F21s Pro features an orbit light at the back of the device. Let the multiple beautiful orbit light reminds you of all your important notifications, messages, and even calls even when the phone is placed upside down.</p>\r\n<h3>33W SUPERVOOC</h3>\r\n<p>The&nbsp;OPPO F21s Pro Smartphone is powered by a&nbsp;4500mAh long-life battery. And with the&nbsp;33W SUPERVOOC,&nbsp;5 mins of charge can offer more than 2.68 hours of talk time.</p>\r\n<h3>IPX4 Waterproof</h3>\r\n<p>With OPPO F21s Pro, we no longer have to worry about water-related phone failures. IPX4 means this phone won&rsquo;t get wrecked by splashes from any direction.</p>', 'MPN: CPH2461\r\nModel: F21s Pro\r\nDisplay: 6.43\" FHD+ 90Hz AMOLED Eye-Care Display\r\nProcessor: Qualcomm SM6225 Snapdragon 680 4G (6 nm)\r\nCamera: Triple 64+2+2 MP on Rear, 32MP Front\r\nFeatures: IPX4, In-Display Fingerprint, 33W SUPERVOOC'),
(60, 60, 'en', 'AMD Ryzen 7 5700G Budget Desktop PC', '<p>AMD Ryzen 7 5700G Budget Desktop PC The AMD Ryzen 7 5700G Budget Desktop PC is a powerful and affordable option for those looking to build or upgrade their desktop computer. It features the AMD Ryzen 7 5700G Processor with Radeon Graphics, providing a high-performance computing experience along with integrated graphics capabilities. The processor itself is based on the Zen 3 architecture and features 8 cores and 16 threads, making it suitable for demanding tasks such as gaming, content creation, and multitasking. With a base clock speed of 3.8 GHz and a maximum boost clock of 4.6 GHz, the Ryzen 7 5700G delivers excellent performance in both single-threaded and multi-threaded applications. The MSI A520M-A PRO AM4 AMD ATX MOTHERBOARD is a reliable and feature-packed motherboard that supports the Ryzen 7 5700G processor. It provides a stable platform for the CPU and offers various connectivity options, including USB ports, SATA ports, and expansion slots for adding additional components like graphics cards or storage drives. To complement the processor and motherboard, the system includes 8GB of Team Elite Plus Red 3200MHz DDR4 RAM. While 8GB is considered the minimum for modern computing, it might be beneficial to consider upgrading to a higher capacity for better multitasking performance and future-proofing the system. The Revenger BULLET Mini Tower Micro ATX RGB Gaming Case with Power Supply is a compact and affordable case that provides ample space for all the components. It offers good airflow and cable management options, ensuring efficient cooling and a clean interior layout. The Netac N930E Pro 256GB NVMe M.2 2280 SSD is included in the system. This solid-state drive (SSD) provides fast and reliable storage performance, allowing for quick boot times and speedy data access. The AMD Ryzen 7 5700G Budget Desktop PC offers a powerful processor with integrated graphics, a reliable motherboard, sufficient RAM, and a capable storage solution. It\'s a great choice for budget-conscious users who still want excellent performance for their everyday computing needs, including gaming, content creation, and more.</p>', 'Model: Ryzen 7 5700G Budget\r\nAMD Ryzen 7 5700G Processor with Radeon Graphics\r\nMSI A520M-A PRO AM4 AMD ATX MOTHERBOARD (CN)\r\nG.Skill RIPJAWS-V 8GB DDR4 3200MHz Desktop RAM\r\nNetac N930E Pro 256GB NVMe M.2 2280 SSD'),
(61, 61, 'en', 'OPPO Reno8 T Smartphone (8/128GB)', '<h2>OPPO Reno8 T Smartphone (8/128GB)</h2>\r\n<p>The Oppo Reno8 T has a 6.43-inch Full HD+ AMOLED screen. It sports a punch-hole front camera on the left side. The rear camera is triple 100+2+2 MP with PDAF, LED flash, microscope, depth sensor, and other capabilities, as well as Full HD video recording capability. The front-facing camera has a resolution of 32 MP. The Oppo Reno8 T has a 5000 mAh battery with 33W fast charging. It features 8 GB of RAM, an octa-core CPU that runs at up to 2.2 GHz, and a Mali-G57 MC2 GPU. It runs on a MediaTek Helio G99 (6 nm) chipset. The smartphone has 256 GB of internal storage as well as a dedicated MicroSD slot. This phone has an optical fingerprint sensor built into the display.</p>\r\n<h3>100MP Portrait Camera</h3>\r\n<p>OPPO Reno8 T comes&nbsp;with an upgraded 100MP Portrait Camera that enables exquisite image clarity to give you unprecedented editing and cropping abilities. Eliminate or alter unwanted photo elements and open a world of imaginative possibility. It is empowered by AI technology, a neural network algorithm that reduces facial blurring to give you flawless portraits, even in low-light conditions.</p>\r\n<h3>Orbit Light</h3>\r\n<p>OPPO Reno8 T has an&nbsp;Orbit Light on the back of the phone that provides notifications for new messages, charging status, and more. These colors are fully customizable to meet your preferences and mood.</p>\r\n<h3>90Hz AMOLED Eye-Care Display</h3>\r\n<p>OPPO Reno8 T Smartphone comes with a dazzling 100% DCI-P3 high-color gamut, and a 90Hz refresh rate that keeps your eyes fresh, guaranteeing that the show will go on in brilliant, natural colors.</p>\r\n<h3>RAM Expansion Up to 8GB</h3>\r\n<p>The OPPO Reno8 T comes with 8GB RAM and 128GB of storage. RAM Expansion also turns unused storage space into operational memory, ensuring a seamless and powerful experience.</p>\r\n<h3>5000mAh Battery &amp; 33W SUPERVOOC</h3>\r\n<p>The Reno8 T is powered by a massive 5000mAh battery and comes with support for the SUPERVOOC charging system. It charges 54% in 30 minutes and just 5-minute charge provides 2 Hours of Calling.</p>', 'MPN: CPH2481\r\nModel: Reno8 T\r\nDisplay: 6.43\" FHD+ 90Hz AMOLED Eye-Care Display\r\nProcessor: Mediatek MT8781 Helio G99 (6nm)\r\nCamera: Triple 100+2+2 MP on Rear, 32MP Front\r\nFeatures: In-Display Fingerprint, 33W SUPERVOOC'),
(62, 62, 'en', 'Vivo V25e Smartphone (8/128GB)', '<h2>Vivo V25e Smartphone (8/128GB)</h2>\r\n<p>The Vivo V25e has a 6.44-inch Full HD+ AMOLED screen. It has a waterdrop notch for the front camera. The rear camera has a triple 64+2+2 MP resolution, PDAF, OIS, depth sensor, macro lens, dual-LED flash, and other features, as well as Full HD video recording. The front-facing camera has a resolution of 32 MP. The Vivo V25e features a 4500 mAh battery with 44W Fast Charging. It has 8 GB of RAM, an octa-core CPU that runs at up to 2.2 GHz, and a Mali-G57 MC2 GPU. It runs on a MediaTek Helio G99 (6 nm) chipset. The device has 128 GB of internal storage as well as a shared MicroSD slot. This phone has an in-display (optical) fingerprint sensor.</p>\r\n<h3>Color Changing Glass</h3>\r\n<p>Vivo V25e comes with color-changing technology that will captivate and enchant you, the colors will radiate from the palm of your hand. Unleash all shades of the sunrise and the changing colors of the sunset.</p>\r\n<h3>64MP OIS Bokeh Flare Portrait</h3>\r\n<p>Vivo V25e smartphone comes with all the cameras you need to encapsulate your moments, fitted into this contemporary designed window. Bokeh Flare Portrait blurs out the background to give you picture-perfect shots, and you can play with the flare to immortalize your moments. The 32MP selfie camera in the front allows you to take HD photos that can be enlarged and cropped in many creative ways with details.</p>\r\n<h3>8GB RAM + 8GB Extended RAM</h3>\r\n<p>The Vivo V25e comes equipped with 8GB of RAM and it also supports virtual memory extension. Up to 8GB of your idle ROM space can be used as extended RAM to make switching between apps even smoother.</p>', 'Model: V25e\r\nDisplay: 6.44\" FHD+ 90Hz AMOLED Display\r\nProcessor: Mediatek MT8781 Helio G99 (6nm)\r\nCamera: Triple 64+2+2 MP on Rear, 32MP Front\r\nFeatures: In-display Fingerprint, 44W FlashCharge'),
(63, 63, 'en', 'Lenovo IdeaCentre 3 AMD Athlon Silver 3050U 4GB RAM 1TB HDD Brand PC', '<h2>Lenovo IdeaCentre 3 AMD Athlon Silver 3050U 4GB RAM 1TB HDD Brand PC</h2>\r\n<div>The Lenovo IdeaCentre 3 computer has an AMD Athlon Silver 3050U processor (2.3 GHz up to 3.2GHz). This crucial business desktop has integrated AMD Radeon graphics, 4GB of 2400 MHz RAM, and an AMD SoC platform. It also has 1TB of 7200 rpm SATA storage to offer improved usability. A standard USB Keyboard &amp; Mouse are included among its fundamental parts. Additionally, it offers an integrated gigabit LAN and Intel HD graphics with the Intel B360 chipset. It has a DVD writer and operates on the open-source DOS operating system. High-speed network and wireless communication are ensured by its 802.11bgn and Bluetooth 4.0, and secure data transmission is provided by its USB 3.0, USB 2.0, RJ-45, HDMI, and VGA ports. This best-in-class security and manageability in a space-saving design come with 3 years of limited warranty facility.</div>', 'MPN: 90MV00CULK\r\nModel: IdeaCentre 3\r\nProcessor: AMD Athlon Silver 3050U (2.3 GHz up to 3.2GHz)\r\nRAM: 4GB 2400MHz\r\nStorage: 1TB 7200 RPM HDD\r\nLenovo Original USB Keyboard & Mouse'),
(64, 64, 'en', 'Vivo V27e Smartphone (8/256GB)', '<h2>Vivo V27e Smartphone (8/256GB)</h2>\r\n<p>The Vivo V27e has a 6.62-inch Full HD+ AMOLED screen. It has a front-facing camera with a punch-hole design. The rear camera has a triple 64+2+2 MP resolution, PDAF, OIS, depth sensor, macro lens, Ring-LED flash, and 4K video recording capabilities. The front-facing camera has a resolution of 32 MP. The Vivo V27e features a 4600 mAh battery with 66W Fast Charging. It has 8 GB of RAM, an octa-core CPU that runs at up to 2.2 GHz, and a Mali-G57 MC2 GPU. It runs on a MediaTek Helio G99 (6 nm) chipset. The device has 256GB of internal storage as well as a shared MicroSD slot. This phone has an in-display (optical) fingerprint sensor.</p>\r\n<h3>Aura Light Portrait</h3>\r\n<p>Vivo V27e smartphone comes with a ring light. Capture more vivid moments at night. Aura Light intelligently detects low ambient light and adds brightness for radiant, delicate complexions. Low-Light Portrait uses a series of algorithms to add brightness and balance in darker settings for portraits that send out great vibes.</p>\r\n<h3>8GB RAM + 8GB Extended RAM</h3>\r\n<p>The Vivo V27e comes equipped with 8GB of RAM and it also supports virtual memory extension. Up to 8GB of your idle ROM space can be used as extended RAM to make switching between apps even smoother.</p>\r\n<h3>66W FlashCharge</h3>\r\n<p>Vivo V27e is powered by a 4600 mAh Battery and offers 66W FlashCharge. It&nbsp;can be charged from 1% to 50% in about 19 minutes. Enjoy peace of mind with built-in 24-dimension security protection to charge quickly with your mind at ease.</p>\r\n<h3>Durable and Resistant</h3>\r\n<p>Vivo V27e is IP54 water-resistant and dust-resistant and can withstand falls from a height of one meter. It lets you use the device without having to worry.</p>', 'Model: V27e\r\nDisplay: 6.62\" FHD+ 120Hz AMOLED Display\r\nProcessor: Mediatek MT8781 Helio G99 (6nm)\r\nCamera: Triple 64+2+2 MP on Rear, 32MP Front\r\nFeatures: IP54, In-display Fingerprint, 66W FlashCharge'),
(65, 65, 'en', 'Vivo V25 5G Smartphone (8/256GB)', '<h2>Vivo V25 5G Smartphone (8/256GB)</h2>\r\n<p>The Vivo V25 5G has a 6.44-inch Full HD+ AMOLED screen. It has a waterdrop notch for the front camera. The rear camera has a triple 64+8+2 MP resolution, PDAF, OIS, ultrawide, macro lens, LED flash, and 4K video recording capabilities. The front-facing camera has a resolution of 50 MP. The Vivo V25 5G features a 4500 mAh battery with 44W Fast Charging. It has 8GB of RAM, an octa-core CPU running at up to 2.4 GHz, and a Mali-G68 MC4 GPU. It runs on a MediaTek Dimensity 900 (6 nm) chipset. The device has an internal storage capacity of 256 GB and a shared MicroSD slot. This phone has an in-display (optical) fingerprint sensor.</p>\r\n<h3>Color Changing Glass</h3>\r\n<p>Vivo V25 5G comes with color-changing technology that will captivate and enchant you, the colors will radiate from the palm of your hand. Special ripple pattern that gives you all the beautiful hues of blue or unleash all shades of the sunrise and the changing colors of the sunset.</p>\r\n<h3>64MP OIS Bokeh Flare Portrait</h3>\r\n<p>Vivo V25 5G smartphone comes with all the cameras you need to encapsulate your moments, fitted into this contemporary-designed window. Bokeh Flare Portrait blurs out the background to give you picture-perfect shots, and you can play with the flare to immortalize your moments. The 32MP selfie camera in the front allows you to take HD photos that can be enlarged and cropped in many creative ways with details.</p>\r\n<h3>8GB RAM + 8GB Extended RAM</h3>\r\n<p>The Vivo V25 5G comes equipped with 8GB of RAM and it also supports virtual memory extension. Up to 8GB of your idle ROM space can be used as extended RAM to make switching between apps even smoother.</p>', 'Model: V25 5G\r\nDisplay: 6.44\" FHD+ 90Hz AMOLED Display\r\nProcessor: Mediatek MT6877 Dimensity 900 (6 nm)\r\nCamera: Triple 64+8+2 MP on Rear, 50MP Front\r\nFeatures: In-display Fingerprint, 44W FlashCharge'),
(66, 66, 'en', 'Walton Kaiman Ex G WDPC710023 Intel Core i3-7100 Desktop PC', '<h2>Walton Kaiman Ex G WDPC710023 Intel Core i3-7100 Desktop PC</h2>\r\n<p>Walton Kaiman Ex G WDPC710023 Desktop PC comes with Intel Core i3-7100 Processor (3M Cache, 3.90 GHz, 2 Cores, 4 Threads), 8GB DDR4-2400MHz RAM (Expandable upto 32GB), 1 TB SATA 3.5\" 7200 RPM HDD, 256GB M.2 2280 NVMe SSD(Included), Intel HD Graphics 630 and Windows 10 operating system. This Desktop PC featured with Intel Q270 Chipset, High Definition Audio, Realtek ALC887 codec, Realtek Gbe LAN Chip (10/ 100/ 1000 Mbit) and 350W 80+ Bronze power. Here, Back Panel IO ports : 1 x PS/2 keyboard/mouse port, 1 x D-Sub port, 1 x DVI-D port, 1 x HDMI port, 4 x USB 3.1, 2 x USB 2.0, 1 x RJ-45 ports, 1 x optical S/PDIF Out connector, 5 x audio jacks (Center/Subwoofer Speaker Out, Rear Speaker Out, Line In, Line Out, Mic In), 1 x PCI Express 3.0 x16 slot, running at x16, 1 x PCI Express 2.0 x4 slot, 1 x PCI Express3.0 x1 slot, 2 x PCI slots are available. This new Walton Kaiman Ex G WDPC710023 Intel Core i3-7100 Desktop PC has 02 years warranty.</p>', 'Model: Kaiman Ex G WDPC710023\r\nIntel Core i3-7100 Processor (3M Cache, 3.90 GHz, 2 Cores, 4 Threads)\r\n8GB DDR4-2400MHz RAM\r\n1TB 7200RPM HDD,\r\n256GB M.2 NVMe SSD'),
(67, 67, 'en', 'Realme 9 Pro+ Smartphone (8/128GB)', '<h2>Realme 9 Pro+ Smartphone (8/128GB)</h2>\r\n<p>The Realme 9 Pro+ has a 6.4-inch Full HD+ Super AMOLED screen. It has a Full-View punch-hole design on the left side. The rear camera has a triple 50+8+2 MP resolution, PDAF, OIS, a dedicated macro camera, an ultrawide lens, and 4K video recording. The front-facing camera has a resolution of 16 MP. The Realme 9 Pro+ features a 4500 mAh battery with 60W Fast Charging. It has 8 GB of RAM, an octa-core CPU that can run at up to 2.5 GHz, and a Mali-G68 MC4 GPU. It runs on a MediaTek Dimensity 920 (6 nm) chipset. The device has 128 GB of internal storage and no MicroSD card slot. This phone has an optical in-display fingerprint sensor.</p>\r\n<h3>Sony IMX766 OIS Flagship Camera</h3>\r\n<p>Realme 9 Pro+ offers ProLight Imaging Technology paired with the flagship Sony IMX766 imaging sensor. The large 1/1.56\'\' sensor captures up to 63.8% more light than the previous generation, further enhancing the ability to deliver brighter, more detailed shots. This phone features optical Image Stabilization to reduce blur and advanced AI features, like our AI Noise Reduction Engine 3.0, ensure your low-light photos look crisper and more detailed.</p>\r\n<h3>MediaTek Dimensity 920 5G Processor</h3>\r\n<p>The Realme 9 Pro+ is powered by MediaTek Dimensity 920 5G Processor.&nbsp;The octa-core CPU boosts 2 Cortex-A78 performance cores running at up to 2.5GHz for snappier app response and performance. The all-new Arm Mali-G68 GPU features up to 9% faster gaming performance. Perfect for energy-efficient, high-performance gaming.</p>\r\n<h3>Vapor Chamber Cooling System</h3>\r\n<p>Realme 9 Pro+ comes with a 5-layer cooling system that features one of the largest vapor chambers in the industry. Covering 100% of heat source components, it can reduce the core temperature by up to 10&deg;C.</p>\r\n<h3>90Hz Super AMOLED Display</h3>\r\n<p>Realme 9 Pro+ Smartphone comes with a 6.4-inch Super AMOLED display that has been expertly calibrated to give excellent color accuracy. And thanks to the 90Hz high refresh rate, every swipe, scroll, and tap feels instantaneous.</p>\r\n<h3>Dolby Atmos Dual Stereo Speakers</h3>\r\n<p>The Realme 9 Pro+ looks good and sounds even better thanks to the&nbsp;Dolby Atmos Dual Speakers. It features&nbsp;X-axis Linear Motor and produces crystal-clear audio. The phone has a&nbsp;3.5mm headphone jack. It is also Hi-res certified.</p>\r\n<h3>60W SuperDart Charge</h3>\r\n<p>The&nbsp;Realme 9 Pro+ Smartphone is powered by a 4500mAh battery that lasts all day long with a single charge. You can get a 50% charge in around 15mins with the 60W SuperDart charger.</p>', 'Model: realme 9 Pro+\r\nDisplay: 6.4\" FHD+ 90Hz Super AMOLED Display\r\nProcessor: Mediatek Dimensity 920 5G (6 nm)\r\nCamera: Triple 50+8+2 MP on Rear, 16MP Front\r\nFeatures: In-display Fingerprint, 60W SuperDart Charge, Vapor Chamber Cooling System'),
(68, 68, 'en', 'HP Pro Tower 280 G9 Core i3 12th Gen 4GB RAM Desktop PC', '<h2>HP Pro Tower 280 G9 Core i3 12th Gen 8GB RAM Desktop PC</h2>\r\n<p>The HP 280 Pro G9 Core i3 12th Gen Tower&nbsp;<a href=\"https://www.startech.com.bd/desktops/brand-pc\" target=\"\">Brand PC</a>&nbsp;features Intel Core i3-12100 (12M Cache, 3.30 GHz to 4.30 GHz) processors with innovative Hybrid Core technology, which provides improved performance to power more effective workdays. With 4GB RAM and 1TB HDD, you can multitask and do even more. To reduce the environmental effect, it contains up to 60% post-consumer recycled materials. Its internal chassis and bezel design allow for greater airflow, resulting in optimal cooling efficiency. Two USB 2.0 ports, two USB 3.2 Gen 1 port, two USB 2.0 ports with Smart Power On, two USB 3.2 Gen 1 ports, one DisplayPort 1.4 port, one HDMI 1.4b connection, one RJ45 Ethernet port, and one Universal audio jack are available on the front. It includes an 18.5\" LED display as well as a mouse and keyboard. It also comes with Intel UHD Graphics and Intel B660. It features a 180-watt power supply. The HP 280 Pro G9 Core i3 12th Gen Tower Brand PC helps optimize business resources. Equipped with a powerful Intel processor, essential tools, and security features for business, this affordably priced and easy-to-set-up PC has a scalable and functional design that can grow with your business.</p>', 'MPN: 6Q2P8PA\r\nModel: 280 Pro G9\r\nProcessor: Intel Core i3-12100 (12M Cache, 3.30 GHz to 4.30 GHz)\r\nMemory: 4GB DDR4 RAM\r\nStorage: 1TB 7200 rpm SATA HDD\r\nHP P204v 19.5 Inch HD LED Monitor( Not Included)'),
(69, 69, 'en', 'Acer Veriton M200-H610 Core i3 12th Gen Brand PC', '<h2>Acer Veriton M200-H610 Core i3 12th Gen Brand PC</h2>\r\n<p>The Acer Veriton M200-H610 Core i3 12th Gen Brand PC is designed for business and productivity tasks. It comes with a mini tower form factor that provides a compact yet expandable design. The desktop PC is powered by the 12th Generation Intel Core i3-12100 Processor with four cores and eight threads. With a base frequency of 3.30 GHz and a max turbo frequency of 4.30 GHz, it can handle demanding applications smoothly. The brand PC comes with 8GB DDR4 RAM, which can be expanded up to 64 GB using 2-DIMM modules. It is equipped with a 1TB 7200 RPM SATA hard drive. The Acer Veriton M200-H610 desktop computer features a variety of I/O ports, including USB 2.0 and USB 3.2 ports, audio combo jack, VGA, HDMI, DisplayPort, and more, enabling easy connectivity to peripherals and external devices. The Acer Veriton M200-H610 also offers expansion slots, including PCIe and M.2 slots, allowing for future upgrades and enhanced functionality. It features a gigabit Ethernet LAN for fast and reliable network connectivity. The PC comes with a DVD RW drive for optical media needs. The Acer Veriton M200-H610 comes with an ACER 19.5\" HD LED backlit monitor, ACER USB keyboard, ACER USB optical mouse with a mouse pad, and a 250W power supply unit.</p>', 'Model: Veriton M200-H610\r\nProcessor: Intel Core i3-12100 (12M Cache, up to 4.30 GHz)\r\nRAM: 8GB DDR4, Storage: 1TB HDD\r\nMonitor: Acer 19.5\" HD Monitor\r\nUSB Keyboard and Mouse'),
(70, 70, 'en', 'OnePlus 11 5G Smartphone (8/128GB) OnePlus 11 5G Smartphone (8/128GB)', '<h2>OnePlus 11 5G Smartphone (8/128GB)</h2>\r\n<p>The OnePlus 11 5G has a 6.7-inch QHD+ LTPO2 Fluid AMOLED screen. It has a punch-hole front camera on the left side. The rear camera has a triple 64+48+32 MP resolution, as well as Multi-directional PDAF, laser AF, OIS, telephoto, 2x optical zoom, Hasselblad Color Calibration, 1/1.56&prime;&prime;, 1.0m, f/1.8 aperture, and 8K video recording. The front-facing camera has a resolution of 16 Megapixels. The OnePlus 11 5G comes with a 5000 mAh battery that supports 100W fast charging. It has 8GB of RAM, an octa-core CPU that runs at up to 3.2 GHz, and an Adreno 740 GPU. The Qualcomm Snapdragon 8 Gen 2 (4 nm) chipset powers it. The device has 128GB of internal storage and no MicroSD card slot. This phone has an optical in-display fingerprint sensor.</p>\r\n<h3>Qualcomm Snapdragon 8 Gen 2</h3>\r\n<p>The OnePlus 11 5G Smartphone is turbocharged by industry-leading hardware using the Snapdragon 8 Gen 2, LPDDR5X RAM, and up to UFS4.0. This ultimate device is designed for those who are driven to exceed, hypercar-like performance powers your digital journey in the fast lane. The Snapdragon 8 Gen 2 offers up to 4.35X faster AI, 35% faster CPU, and 25% faster rendering.</p>\r\n<h3>8GB LPDDR5X RAM + 128GB UFS4.0</h3>\r\n<p>OnePlus 11 comes with 8 GB of next-gen LPDDR5X RAM. RAM-Vita compresses apps and intelligently allocates RAM for future-proof fluency. It is up to 33% faster, 30% wider bandwidth, and is 20% more efficient. The phone can keep up to 44 apps alive.</p>\r\n<h3>5000 mAh Battery + 100W SUPERVOOC Charging</h3>\r\n<p>The OnePlus 11 5G is powered by a 5000 mAh supersized battery. It comes with 100W Charging on Smart Rapid Charge Mode which takes 25 mins to charge 1-100%.</p>\r\n<h3>3rd Generation Hasselblad Camera for Mobile</h3>\r\n<p>OnePlus 11 is co-developed with Hasselblad. The phone has a Main 50MP IMX890 with OIS Quad-pixel sensor, Aperture f/1.88, AF, Ultra Wide 48MP IMX581 FoV 115&deg;, Sensor Size 1/2\", AF, Portrait Tele 32MP IMX709 RGBW sensor, 2x optical zoom, AF, Accu-spectrum Light-color Identifier 13-channel multi-spectral sensor. Along with the main camera sensor, the IMX709 portrait tele lens delivers DSLR-like depth-tracking, natural bokeh and flares. Benchmarked against Hasselblad optical standards, it simulates professional natural bokeh and flare effects captured by a Hasselblad camera with XCD 30mm and 65mm lenses for portraits in perfection.</p>\r\n<h3>120 Hz 2K Super Fluid AMOLED with Dolby Vision</h3>\r\n<p>OnePlus 11 5G Smartphone comes with a stunning 6.7&rdquo; 120 Hz 2K Super Fluid AMOLED display that incorporates advanced LTPO technology. More power-efficient, the refresh rate dynamically scales almost instantly from 1 Hz to 120 Hz with third-generation LTPO calibration.</p>\r\n<h3>Dual &ldquo;Reality&rdquo; Speakers powered by Dolby Atmos</h3>\r\n<p>The OnePlus 11 is equipped with Dolby Atmos. By employing a similar aural structure used in premium laptops, powerful speakers immerse you in our most cinematic audio ever with directional spatial audio. It is fully compatible with Dolby-enabled content on major streaming platforms, including Netflix, Disney+, Paramount+, Amazon Music, Tidal and more. Discover the Dolby difference.</p>', 'Model: 11 5G\r\nDisplay: 6.7\" QHD+ 120Hz Super Fluid AMOLED Display\r\nProcessor: Qualcomm SM8550-AB Snapdragon 8 Gen 2 (4 nm)\r\nCamera: Triple 64+48+32 MP on Rear, 16MP Front\r\nFeatures: In-display Fingerprint, 100W SUPERVOOC');
INSERT INTO `product_translations` (`id`, `product_id`, `locale`, `name`, `description`, `short_description`) VALUES
(71, 71, 'en', 'OnePlus Nord CE 3 Lite 5G Smartphone (8/128GB)', '<h2>OnePlus Nord CE 3 Lite 5G Smartphone (8/128GB)</h2>\r\n<p>The OnePlus Nord CE 3 Lite 5G has a 6.56-inch HD+ IPS LCD screen. It has a punch-hole notch for the front camera. The back camera is Triple 108+2+2 MP with PDAF, f/1.8 aperture, depth sensor, LED flash, and other features, as well as Full HD video recording. The front-facing camera has an 8-megapixel resolution. The OnePlus Nord CE 3 Lite 5G has a 5000 mAh battery that supports 67W fast charging. It has 8 GB of RAM, an octa-core CPU that runs at up to 2.3 GHz, and an Adreno 619 GPU. The chipset is a Qualcomm SM6375 Snapdragon 695 5G (6 nm). The device has 128 GB of internal storage as well as a dedicated MicroSD slot. This phone has a fingerprint sensor on the side.</p>\r\n<h3>120 Hz Display and&nbsp;Dual Stereo Speakers</h3>\r\n<p>OnePlus Nord CE 3 Lite smartphone is designed with a 6.72\" FHD+ 120 Hz Display. The 120 Hz adaptive refresh rate saves on battery so you can binge-watch longer. And for the whole cinematic experience, put your headphones away and tune in to the booming dual stereo speakers.</p>\r\n<h3>8GB Virtual RAM Expansion</h3>\r\n<p>The OnePlus Nord CE 3 Lite is equipped with 8GB of LPDDR4X RAM and it also offers 8GB of expandable virtual RAM. It lets you swipe and switch between apps at a blistering speed.</p>\r\n<h3>5000mAh Battery with 67W SUPERVOOC Charging</h3>\r\n<p>OnePlus Nord CE 3 Lite 5G comes equipped with an ultra-large 5000mAh battery. It lets you make calls or stream your favorite tunes all day long. And thanks to the 67W SUPERVOOC fast charging gets you out the door fast.</p>', 'Model: Nord CE 3 Lite 5G\r\nDisplay: 6.72\" FHD+ 120 Hz Display\r\nProcessor: Qualcomm SM6375 Snapdragon 695 5G (6 nm)\r\nCamera: Triple 108+2+2 MP on Rear, 16MP Front\r\nFeatures: Side Fingerprint, 67W SUPERVOOC'),
(72, 72, 'en', 'Acer Veriton M200-H610 Core i3 12th Gen Brand PC', '<h2>Acer Veriton M200-H610 Core i3 12th Gen Brand PC</h2>\r\n<p>The Acer Veriton M200-H610 Core i3 12th Gen Brand PC is designed for business and productivity tasks. It comes with a mini tower form factor that provides a compact yet expandable design. The desktop PC is powered by the 12th Generation Intel Core i3-12100 Processor with four cores and eight threads. With a base frequency of 3.30 GHz and a max turbo frequency of 4.30 GHz, it can handle demanding applications smoothly. The brand PC comes with 8GB DDR4 RAM, which can be expanded up to 64 GB using 2-DIMM modules. It is equipped with a 1TB 7200 RPM SATA hard drive. The Acer Veriton M200-H610 desktop computer features a variety of I/O ports, including USB 2.0 and USB 3.2 ports, audio combo jack, VGA, HDMI, DisplayPort, and more, enabling easy connectivity to peripherals and external devices. The Acer Veriton M200-H610 also offers expansion slots, including PCIe and M.2 slots, allowing for future upgrades and enhanced functionality. It features a gigabit Ethernet LAN for fast and reliable network connectivity. The PC comes with a DVD RW drive for optical media needs. The Acer Veriton M200-H610 comes with an ACER 19.5\" HD LED backlit monitor, ACER USB keyboard, ACER USB optical mouse with a mouse pad, and a 250W power supply unit.</p>', 'Model: Veriton M200-H610\r\nProcessor: Intel Core i3-12100 (12M Cache, up to 4.30 GHz)\r\nRAM: 8GB DDR4, Storage: 1TB HDD\r\nMonitor: Acer 19.5\" HD Monitor\r\nUSB Keyboard and Mouse'),
(73, 73, 'en', 'MSI MAG Infinite 10th Gen Core i7 256GB SSD 1TB HDD 16GB RAM 1660 Super Graphics Card Gaming Brand PC', '<h2>MSI MAG Infinite 10th Gen Core i7 256GB SSD 1TB HDD 16GB RAM 1660 Super Graphics Card Gaming Brand PC</h2>\r\n<p>The MSI MAG Infinite 10th Gen Gaming<a href=\"https://www.startech.com.bd/desktops/brand-pc\" target=\"\">&nbsp;Brand PC&nbsp;</a>is intended for gamers who have an insatiable desire to play and want an infinite number of options. The Infinite series uses MSI\'s unique Silent Storm Cooling thermal design, which results in unequaled cooling efficiency and assassin-like silence. The Infinite series gaming PC is ready to face the most demanding battleground. Over the previous generation, computing power has increased by 40%. MSI Desktop equips the 10th Generation Intel Core i7 CPU with the most computing power for an unsurpassed gaming experience. The MSI Desktop supports the latest Wi-Fi 6 802.11ax standard, with speeds of up to 2.4 Gbps, three times faster than Ethernet LAN, and 75% less latency than the previous generation. MSI\'s Wi-Fi 6 technology is expected to dispel the wireless connection speed myth. With the most recent advancements, you can always get the most out of your system. MSI Infinite series components are easily accessible and may be upgraded at any time. Whether you\'re upgrading storage or updating your CPU or graphics card, you can always keep your gaming setup up to date with the latest hardware.</p>', 'MPN: 1483BD-B710700166S616G1TS25X11EMHAH1\r\nModel: MSI MAG Infinite 10th\r\nProcessor: Intel Core i7-10700 (16M Cache, up to 4.80 GHz)\r\nRAM: 16GB 2666MHz DDR4\r\nStorage: 256GB SSD + 1TB HDD\r\nGraphics: GeForce GTX 1660 Super AERO ITX 6G'),
(74, 74, 'en', 'AMD Ryzen 5 5600G Basic Video Editing Desktop PC', '<h2>AMD Ryzen 5 5600G Basic Video Editing Desktop PC</h2>\r\n<p>The AMD Ryzen 5 5600G Basic Video Editing Build is a powerful and feature-rich computer that offers high-end performance and speed. The system is powered by the AMD Ryzen 5 5600G Processor with Radeon Graphics (Chinese Edition), which provides smooth and efficient performance, making it ideal for gaming and other demanding applications. The motherboard in this PC is the ASRock B450M-HDV R4.0 AMD Motherboard, which is designed to provide stable and reliable performance. It offers support for the latest technologies and features, including DDR4 memory, M.2 SSDs, and PCIe 3.0. To complement the powerful processor and motherboard, the system comes with two 8GB sticks of CORSAIR VENGEANCE RGB RS DDR4 3200MHz RAM. This memory provides fast data transfer speeds and excellent multitasking capabilities. For storage, the PC includes an HP EX900 M.2 250GB PCIe NVMe Internal SSD, which offers lightning-fast read and write speeds. Additionally, there is a Seagate Internal 1TB SATA Barracuda HDD (CRP) for additional storage capacity. The Antec AX20 Mid-Tower ATX Gaming Case is an attractive and functional case that offers plenty of room for expansion and customization. It features a tempered glass side panel and RGB lighting to create a visually stunning system. To power, the system, the Antec CUPRUM STRIKE CSK 450W 80 Plus Bronze Power Supply provides efficient and reliable power delivery. This ensures that the system runs smoothly and without any hiccups. For display, the ViewSonic VA2209-H 22\" IPS Full HD Monitor offers clear and crisp visuals with a resolution of 1920x1080. The A4TECH OP-620D 2X Click Optical Mouse and A4TECH KRS-83 Wired Multimedia Keyboard provide reliable input devices for comfortable and efficient computing.</p>', 'Model: Basic Video Editing Desktop PC\r\nAMD Ryzen 5 5600G Processor with Radeon Graphics (Chinese Edition)\r\nASRock B450M-HDV R4.0 AMD Motherboard\r\nCorsair 16GB 3200MHz DDR4 RAM + HP EX900 250GB SSD\r\nViewSonic VA2209-H 22\" IPS Full HD Monitor'),
(75, 75, 'en', 'Samsung Galaxy M53 5G Smartphone (8/128GB)', '<h2>Samsung Galaxy M53 5G Smartphone (8/128GB)</h2>\r\n<p>The Samsung Galaxy M53 5G features a 6.7-inch Full HD+ Super AMOLED Plus screen. It has a front camera with a punch hole in the center. The rear camera is a Quad 108+8+2+2 with PDAF, LED flash, ultrawide, depth sensor, dedicated macro camera, and other features, as well as Ultra HD video recording. The front-facing camera has a resolution of 32 MP. The Galaxy M53 5G features a 5000 mAh battery with 25W fast charging. It has 8 GB of RAM, an octa-core CPU that runs at up to 2.4 GHz, and a Mali-G68 MC4 GPU. It runs on a MediaTek Density 900 (6 nm) chipset. The device has 128 GB of internal storage as well as a shared MicroSD slot. This phone has a fingerprint sensor on the side.</p>', 'Model: Galaxy M53 5G\r\nDisplay: 6.7\" FHD+ Super AMOLED Plus 120Hz Infinity-O Display\r\nProcessor: MediaTek MT6877 Dimensity 900 (6 nm)\r\nCamera: Quad 108+8+2+2 MP on Rear, 32MP Selfie\r\nFeatures: Side Mounted Fingerprint, 25W Fast Charging'),
(76, 76, 'en', 'Intel 10th Gen Core i7-10700 Custom Desktop PC', '<h2>Intel 10th Gen Core i7-10700 Desktop PC</h2>\r\n<p>The Intel 10th Gen Core i7-10700 Desktop PC includes an Intel 10th Gen Core i7-10700 Processor, GIGABYTE B560M DS3H PLUS 10th and 11th Gen Micro ATX Motherboard, HP EX900 M.2 500GB PCIe NVMe Internal SSD, Corsair Vengeance LPX 8GB 3200MHz DDR4 Desktop RAM, and comes in the PC Power Ice Cube Desktop Gaming Casing with a built-in Power Supply.</p>', 'Model: 10th Gen Desktop PC\r\nIntel 10th Gen Core i7-10700 Processor\r\nGigabyte B560M DS3H Plus 10th and 11th Gen Micro ATX Motherboard\r\nCorsair DOMINATOR PLATINUM RGB 8GB DDR4 3600MHz RAM\r\nAcer FA100 512GB M.2 SSD + Western Digital 1TB HDD'),
(77, 77, 'en', 'Intel 13th Gen Core i7 13700K Gaming Desktop PC', '<h2>Intel 13th Gen Core i7 13700K Gaming Desktop PC</h2>\r\n<p>The Intel 13th Gen Core i7-13700K Gaming Desktop PC is a high-performance gaming setup designed for gaming enthusiasts. It features the Intel 13th Gen Core i7-13700K Raptor Lake Processor paired with the Gigabyte Z790 UD DDR5 12th &amp; 13th Gen Motherboard, 16GB of Kingston FURY Beast 6000MHz DDR5 RGB Desktop RAM, and the Colorful GeForce RTX 3060 Ti NB DUO V2 LHR-V 8GB GDDR6 Graphics Card. The Desktop PC is powered by the Corsair RM750e 750W 80 Plus Gold Fully Modular Power Supply and is housed in the stylish Lian Li LANCOOL II Mesh RGB Gaming Case (Black). For storage, it includes a Samsung 980 Pro 1TB PCIe 4.0 M.2 NVMe SSD, and to keep the CPU cool, the Lian Li Galahad 240mm Closed-Loop AIO Liquid CPU Cooler (Black) is utilized.</p>', 'Model: 13th Gen Gaming Desktop PC\r\nIntel 13th Gen Core i7 13700K Raptor Lake Processor\r\nGIGABYTE Z790 UD DDR5 12th & 13th Gen Motherboard\r\nKingston FURY Beast 16GB RAM + Samsung 980 Pro 1TB NVMe SSD\r\nColorful GeForce RTX 3060 Ti NB DUO V2 LHR-V 8GB GDDR6 Graphics Card'),
(78, 78, 'en', 'Samsung Galaxy A52s 5G Smartphone (8/128GB)', '<h2>Samsung Galaxy A52s 5G Smartphone (8/128GB)</h2>\r\n<p>The Samsung Galaxy A52s 5G has a 6.5-inch Full HD+ Super AMOLED screen. It has a front camera with a punch-hole in the center. The rear camera is a Quad 64+12+5+5 with PDAF, OIS, ultrawide, depth sensor, dedicated macro camera, and other features, as well as Ultra HD video recording. The front-facing camera has a resolution of 32 MP. The battery on the Galaxy A52s 5G is 4500 mAh and supports 25W fast charging. It has 8 GB of RAM, an octa-core CPU that runs at up to 2.3 GHz, and an Adreno 618 GPU. The Qualcomm Snapdragon 720G (8 nm) chipset powers it. The smartphone has 128 GB of internal storage as well as a shared MicroSD slot. This phone has an optical fingerprint sensor built into the display.</p>', 'Model: Galaxy A52s 5G\r\nDisplay: 6.5\" FHD+ Super AMOLED 120Hz Infinity-O Display\r\nProcessor: Qualcomm SM7325 Snapdragon 778G 5G (6 nm)\r\nCamera: Quad 64+12+5+5 MP on Rear, 32MP Selfie\r\nFeatures: IP67, Under display Fingerprint, 25W Fast Charging'),
(79, 79, 'en', 'Intel 13th Gen Core i9 13900K Gaming Desktop PC', '<h2>Intel 13th Gen Core i9 13900K Gaming Desktop PC</h2>\r\n<p>The Intel 13th Gen Core i9-13900K Gaming Desktop PC is a high-performance powerhouse designed for gaming enthusiasts. It features the Intel 13th Gen Core i9-13900K Raptor Lake Processor paired with the GIGABYTE Z790 UD AX 13th &amp; 12th Gen ATX Motherboard, and comes equipped with 16GB of Kingston FURY Beast 6000MHz DDR5 RGB Desktop RAM. The PC boasts a spacious 2TB Samsung PM9A1 M.2 PCIe Gen 4.0 NVMe SSD for lightning-fast storage access. To keep the CPU cool during intensive tasks, it utilizes the Corsair iCUE H150i ELITE CAPELLIX XT RGB Liquid CPU Cooler. The PC is housed in the stylish Lian Li LANCOOL III Mid-Tower E-ATX Gaming Case. For graphics power, it features the Colorful iGame GeForce RTX 4080 16GB Vulcan OC-V GDDR6X Graphics Card. The PC is powered by the Corsair RM1000e 1000W 80 Plus Gold Fully Modular Power Supply, providing reliable and efficient power delivery for a seamless gaming experience.</p>', 'Model: 13th Gen Gaming Desktop PC\r\nIntel 13th Gen Core i9 13900K Raptor Lake Processor\r\nGIGABYTE Z790 UD AX 13th & 12th Gen ATX Motherboard\r\nKingston FURY Beast 16GB RAM + Samsung PM9A1 2TB NVMe SSD\r\nColorful iGame GeForce RTX 4080 16GB Vulcan OC-V GDDR6X Graphics Card'),
(80, 80, 'en', 'HUAWEI P50 Pro Smartphone (8/256GB) HUAWEI P50 Pro Smartphone (8/256GB)', '<h2>HUAWEI P50 Pro Smartphone (8/256GB)</h2>\r\n<p>The HUAWEI P50 Pro is a high-end smartphone that has a 6.6-inch OLED 120Hz True-Chroma Display. The camera system on the HUAWEI P50 Pro is particularly impressive, featuring a quad-camera setup with a 50MP primary sensor, a 64MP telephoto sensor, a 13MP ultrawide sensor, and a 40MP monochrome sensor. This setup allows for exceptional low-light performance, impressive zoom capabilities, and stunning image quality overall. On the front, there is a 13MP selfie camera housed in a centered punch-hole cutout. The HUAWEI P50 Pro features a 4360 mAh battery with 66W fast charging. It has 8GB of Memory, an octa-core Qualcomm SM8350 Snapdragon 888 4G (5 nm), and an Adreno 660 GPU. The smartphone has 256GB of internal storage as well as a dedicated MicroSD slot. This phone has an under-display fingerprint sensor.</p>', 'Model: P50 Pro\r\nDisplay: 6.6-inch OLED 120Hz True-Chroma Display\r\nProcessor: Qualcomm SM8350 Snapdragon 888 4G (5 nm)\r\nCamera: Quad 50+64+13+40 MP on Rear, 13MP Front\r\nFeatures: IP68, Under Display Fingerprint'),
(81, 81, 'en', 'Intel 12th Gen Core i9-12900K Gaming Desktop PC', '<h2>Intel 12th Gen Core i9-12900K Gaming Desktop PC</h2>\r\n<p>The Intel 12th Gen Core i9-12900K Gaming Desktop PC is a high-performance setup designed for gaming enthusiasts. It features the Intel 12th Gen Core i9-12900K Alder Lake Processor paired with the GIGABYTE Z790 UD AX 13th &amp; 12th Gen ATX Motherboard. The PC comes with 16GB of Kingston FURY Beast 6000MHz DDR5 RGB Desktop RAM and a Samsung 980 Pro 1TB PCIe 4.0 M.2 NVMe SSD for fast storage access. To keep the CPU cool during gaming, it uses the Corsair iCUE H150i ELITE CAPELLIX XT RGB Liquid CPU Cooler. The PC is housed in the stylish Lian Li LANCOOL III Mid-Tower E-ATX Gaming Case, and for graphics power, it features the Colorful GeForce RTX 4080 16GB NB EX-V GDDR6X Graphics Card. The PC is powered by the reliable Corsair HX Series HX850 850W 80+ Platinum Full-Modular ATX Power Supply for stable performance. It\'s a top-tier gaming machine, delivering an immersive gaming experience for demanding gamers.</p>', 'Model: 12th Gen Gaming Desktop PC\r\nIntel 12th Gen Core i9-12900K Alder Lake Processor\r\nGIGABYTE Z790 UD AX 13th & 12th Gen ATX Motherboard\r\nKingston FURY Beast 16GB RAM +Samsung 980 Pro 1TB NVMe SSD\r\nColorful GeForce RTX 4080 16GB NB EX-V GDDR6X Graphics Card'),
(82, 82, 'en', 'Vivo V23e Smartphone (8/128GB) Vivo V23e Smartphone (8/128GB) Vivo V23e Smartphone (8/128GB)', '<h2>Vivo V23e Smartphone (8/128GB)</h2>\r\n<p>The Vivo V23e has a 6.44-inch Full HD+ AMOLED screen. It has a waterdrop notch for the front camera. The rear camera has a triple 64+8+2 MP resolution, PDAF, ultrawide, macro lens, dual-LED flash, and 4K video recording capabilities. The front-facing camera has a resolution of 50 MP. The Vivo V23e features a 4050 mAh battery with 44W Fast Charging. It has 8 GB of RAM, an octa-core CPU with a clock speed of up to 2.05 GHz, and a Mali-G57 MC2 GPU. The chipset is a Mediatek Helio G96 (12 nm). The device has 128 GB of internal storage as well as a shared MicroSD slot. This phone has an in-display (optical) fingerprint sensor.</p>\r\n<h3>50MP AF Portrait Selfie</h3>\r\n<p>Vivo V23e smartphone comes with a 50MP selfie camera that provides you with a high sharp and clear resolution. It has a 50MP AF front camera with ISOCELL 3.0 (pixel isolation technology) gives you stunning details and colors in every photo. Steadiface Selfie Video ensures your face remains stable and clear in the picture. With Multi-Style Portrait, you can take perfect portraits in a variety of distinct styles.</p>\r\n<h3>8GB RAM + 4GB Extended RAM</h3>\r\n<p>The Vivo V23e comes equipped with 8GB of RAM and it also supports virtual memory extension. Up to 4GB of your idle ROM space can be used as extended RAM to make switching between apps even smoother.</p>', 'Model: V23e\r\nDisplay: 6.44\" FHD+ AMOLED Display\r\nProcessor: Mediatek Helio G96 (12 nm)\r\nCamera: Triple 64+8+2 MP on Rear, 50MP Front\r\nFeatures: In-display Fingerprint, 44W FlashCharge'),
(83, 83, 'en', 'Intel 13th Gen Core i7 13700K Gaming Desktop PC', '<h2>Intel 13th Gen Core i7 13700K Gaming Desktop PC</h2>\r\n<p>The Intel 13th Gen Core i7-13700K Gaming Desktop PC is a high-performance gaming setup designed for gaming enthusiasts. It features the Intel 13th Gen Core i7-13700K Raptor Lake Processor paired with the Gigabyte Z790 UD DDR5 12th &amp; 13th Gen Motherboard, 16GB of Kingston FURY Beast 6000MHz DDR5 RGB Desktop RAM, and the Colorful GeForce RTX 3060 Ti NB DUO V2 LHR-V 8GB GDDR6 Graphics Card. The Desktop PC is powered by the Corsair RM750e 750W 80 Plus Gold Fully Modular Power Supply and is housed in the stylish Lian Li LANCOOL II Mesh RGB Gaming Case (Black). For storage, it includes a Samsung 980 Pro 1TB PCIe 4.0 M.2 NVMe SSD, and to keep the CPU cool, the Lian Li Galahad 240mm Closed-Loop AIO Liquid CPU Cooler (Black) is utilized.</p>', 'Model: 13th Gen Gaming Desktop PC\r\nIntel 13th Gen Core i7 13700K Raptor Lake Processor\r\nGIGABYTE Z790 UD DDR5 12th & 13th Gen Motherboard\r\nKingston FURY Beast 16GB RAM + Samsung 980 Pro 1TB NVMe SSD\r\nColorful GeForce RTX 3060 Ti NB DUO V2 LHR-V 8GB GDDR6 Graphics Card'),
(84, 84, 'en', 'Apple iPhone 14 Pro Max 512GB Deep Purple (Singapore)', '<h2>Apple iPhone 14 Pro Max 512GB Deep Purple (Singapore)</h2>\r\n<p>The Apple iPhone 14 Pro Max is the latest model of the iPhone series, featuring the latest technology and advanced features that are designed to provide users with a seamless and unparalleled mobile experience. The device is powered by the latest A16 Bionic chip, providing exceptional performance and power efficiency. The 6.7-inch Super Retina XDR display, with ProMotion technology, delivers an immersive visual experience with incredibly vibrant colors and deep blacks. The device comes equipped with a triple-camera system, including a 48MP main, 12MP ultra-wide, and 12MP telephoto lens, allowing users to capture stunning photos and videos.&nbsp;This iPhone 14 Pro Max has a 512GB internal storage capacity, offering ample space for all your photos, videos, and apps. It has been designed for durability with Ceramic Shield. It also offers water resistance and a surgical-grade stainless steel body. The Deep Purple color option adds a luxurious and elegant touch to the device\'s overall design.</p>\r\n<h3>Introducing Dynamic Island</h3>\r\n<p>The Dynamic Island on the iPhone 14 Pro Max is a convenient feature that allows users to easily access and manage important notifications and activities on their devices. It appears on the home screen or in any app when the phone is unlocked and provides a quick overview of things like current music playing, timers, AirDrop connections, and directions from Maps. Users can expand the activity to see more detail by touching and holding it or swiping from the center to the right or left side. They can also collapse the activity to make the Dynamic Island smaller by swiping from the right or left side towards the center. Additionally, users can switch between two activities by swiping from one side or the other. This makes it easy to stay on top of important notifications and activities without having to navigate away from the current app or screen.</p>\r\n<h3>Always-On display</h3>\r\n<p>The iPhone 14 Pro Max display can operate with a refresh rate as low as 1 Hz with a new low-power mode and uses improved technology that allows the display to dim the entire Lock Screen. The display dims when you lock your device or leave it idle. Always-On display also uses multiple coprocessors in the A16 Bionic to refresh the display using minimal power.&nbsp;You can customize your Always-On display by personalizing your Lock Screen with photos, wallpapers with stylized fonts and colors, and widgets.&nbsp;When iPhone is turned face down or in your pocket, it goes dark to save battery life.</p>\r\n<h3>All-new 48MP Main camera with advanced quad-pixel sensor</h3>\r\n<p>The latest iPhone 14 Pro Max from Apple comes with a pro camera system. The main camera is 48MP for up to 4x the resolution, 12MP Telephoto for up to 2x better low-light photos and 12MP Ultra Wide for sharper, brighter macro shots. The quad-pixel sensor on the Main camera makes the most of 48 megapixels by adapting to what you&rsquo;re shooting. You can also snap your sharpest, most colorful close-ups and group shots, thanks to a new TrueDepth front camera with autofocus and a larger aperture. The TrueDepth camera and A16 Bionic also power Face ID, the most secure facial authentication in a smartphone</p>\r\n<h3>Emergency SOS, Crash Detection</h3>\r\n<p>iPhone 14 Pro Max can detect a severe car crash, then call emergency services and notify your emergency contacts. It can detect&nbsp;Sudden speed shifts,&nbsp;Abrupt changes in direction,&nbsp;Cabin pressure changes, and Loud sound levels of impact and then send an alert to save your life.</p>', 'Model: iPhone 14 Pro Max\r\nDisplay: 6.7\" Super Retina XDR Always-On display\r\nProcessor: A16 Bionic chip, Storage: 512GB\r\nCamera: 48MP + 12MP + 12MP Rear, 12MP Front\r\nFeatures: Dynamic Island, Face ID, eSIM Support');

-- --------------------------------------------------------

--
-- Table structure for table `related_products`
--

CREATE TABLE `related_products` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `related_product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `related_products`
--

INSERT INTO `related_products` (`product_id`, `related_product_id`) VALUES
(2, 1),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(8, 1),
(11, 35),
(11, 36),
(11, 84);

-- --------------------------------------------------------

--
-- Table structure for table `reminders`
--

CREATE TABLE `reminders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `completed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `reviewer_id` int(10) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `reviewer_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_approved` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `permissions`, `created_at`, `updated_at`) VALUES
(1, '{\"admin.users.index\":true,\"admin.users.create\":true,\"admin.users.edit\":true,\"admin.users.destroy\":true,\"admin.roles.index\":true,\"admin.roles.create\":true,\"admin.roles.edit\":true,\"admin.roles.destroy\":true,\"admin.products.index\":true,\"admin.products.create\":true,\"admin.products.edit\":true,\"admin.products.destroy\":true,\"admin.brands.index\":true,\"admin.brands.create\":true,\"admin.brands.edit\":true,\"admin.brands.destroy\":true,\"admin.attributes.index\":true,\"admin.attributes.create\":true,\"admin.attributes.edit\":true,\"admin.attributes.destroy\":true,\"admin.attribute_sets.index\":true,\"admin.attribute_sets.create\":true,\"admin.attribute_sets.edit\":true,\"admin.attribute_sets.destroy\":true,\"admin.options.index\":true,\"admin.options.create\":true,\"admin.options.edit\":true,\"admin.options.destroy\":true,\"admin.filters.index\":true,\"admin.filters.create\":true,\"admin.filters.edit\":true,\"admin.filters.destroy\":true,\"admin.reviews.index\":true,\"admin.reviews.create\":true,\"admin.reviews.edit\":true,\"admin.reviews.destroy\":true,\"admin.categories.index\":true,\"admin.categories.create\":true,\"admin.categories.edit\":true,\"admin.categories.destroy\":true,\"admin.tags.index\":true,\"admin.tags.create\":true,\"admin.tags.edit\":true,\"admin.tags.destroy\":true,\"admin.orders.index\":true,\"admin.orders.show\":true,\"admin.orders.edit\":true,\"admin.flash_sales.index\":true,\"admin.flash_sales.create\":true,\"admin.flash_sales.edit\":true,\"admin.flash_sales.destroy\":true,\"admin.transactions.index\":true,\"admin.coupons.index\":true,\"admin.coupons.create\":true,\"admin.coupons.edit\":true,\"admin.coupons.destroy\":true,\"admin.menus.index\":true,\"admin.menus.create\":true,\"admin.menus.edit\":true,\"admin.menus.destroy\":true,\"admin.menu_items.index\":true,\"admin.menu_items.create\":true,\"admin.menu_items.edit\":true,\"admin.menu_items.destroy\":true,\"admin.media.index\":true,\"admin.media.create\":true,\"admin.media.destroy\":true,\"admin.pages.index\":true,\"admin.pages.create\":true,\"admin.pages.edit\":true,\"admin.pages.destroy\":true,\"admin.currency_rates.index\":true,\"admin.currency_rates.edit\":true,\"admin.taxes.index\":true,\"admin.taxes.create\":true,\"admin.taxes.edit\":true,\"admin.taxes.destroy\":true,\"admin.translations.index\":true,\"admin.translations.edit\":true,\"admin.sliders.index\":true,\"admin.sliders.create\":true,\"admin.sliders.edit\":true,\"admin.sliders.destroy\":true,\"admin.importer.index\":true,\"admin.importer.create\":true,\"admin.reports.index\":true,\"admin.settings.edit\":true,\"admin.storefront.edit\":true}', '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(2, NULL, '2023-08-24 06:32:06', '2023-08-24 06:32:06');

-- --------------------------------------------------------

--
-- Table structure for table `role_translations`
--

CREATE TABLE `role_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_translations`
--

INSERT INTO `role_translations` (`id`, `role_id`, `locale`, `name`) VALUES
(1, 1, 'en', 'Admin'),
(2, 2, 'en', 'Customer');

-- --------------------------------------------------------

--
-- Table structure for table `search_terms`
--

CREATE TABLE `search_terms` (
  `id` int(10) UNSIGNED NOT NULL,
  `term` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `results` int(10) UNSIGNED NOT NULL,
  `hits` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_translatable` tinyint(1) NOT NULL DEFAULT 0,
  `plain_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `is_translatable`, `plain_value`, `created_at`, `updated_at`) VALUES
(1, 'store_name', 1, NULL, '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(2, 'store_email', 0, 's:18:\"admin@lapitapi.com\";', '2023-08-24 06:32:06', '2023-08-26 09:48:15'),
(3, 'store_phone', 0, 's:11:\"016235478**\";', '2023-08-24 06:32:06', '2023-08-24 10:46:21'),
(4, 'search_engine', 0, 's:5:\"mysql\";', '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(5, 'algolia_app_id', 0, 'N;', '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(6, 'algolia_secret', 0, 'N;', '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(7, 'active_theme', 0, 's:10:\"Storefront\";', '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(8, 'supported_countries', 0, 'a:1:{i:0;s:2:\"BD\";}', '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(9, 'default_country', 0, 's:2:\"BD\";', '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(10, 'supported_locales', 0, 'a:2:{i:0;s:5:\"bn_BD\";i:1;s:2:\"en\";}', '2023-08-24 06:32:06', '2023-08-24 10:46:57'),
(11, 'default_locale', 0, 's:2:\"en\";', '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(12, 'default_timezone', 0, 's:10:\"Asia/Dhaka\";', '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(13, 'customer_role', 0, 's:1:\"2\";', '2023-08-24 06:32:06', '2023-08-24 10:46:21'),
(14, 'reviews_enabled', 0, 's:1:\"1\";', '2023-08-24 06:32:06', '2023-08-24 10:46:21'),
(15, 'auto_approve_reviews', 0, 's:1:\"1\";', '2023-08-24 06:32:06', '2023-08-24 10:46:21'),
(16, 'cookie_bar_enabled', 0, 's:1:\"1\";', '2023-08-24 06:32:06', '2023-08-24 10:46:21'),
(17, 'supported_currencies', 0, 'a:1:{i:0;s:3:\"BDT\";}', '2023-08-24 06:32:06', '2023-08-24 10:46:57'),
(18, 'default_currency', 0, 's:3:\"BDT\";', '2023-08-24 06:32:06', '2023-08-24 10:46:57'),
(19, 'send_order_invoice_email', 0, 'b:0;', '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(20, 'newsletter_enabled', 0, 's:1:\"0\";', '2023-08-24 06:32:06', '2023-08-24 10:46:24'),
(21, 'local_pickup_cost', 0, 's:1:\"0\";', '2023-08-24 06:32:06', '2023-08-24 10:46:24'),
(22, 'flat_rate_cost', 0, 's:1:\"0\";', '2023-08-24 06:32:06', '2023-08-24 10:46:24'),
(23, 'free_shipping_label', 1, NULL, '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(24, 'local_pickup_label', 1, NULL, '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(25, 'flat_rate_label', 1, NULL, '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(26, 'paypal_label', 1, NULL, '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(27, 'paypal_description', 1, NULL, '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(28, 'stripe_label', 1, NULL, '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(29, 'stripe_description', 1, NULL, '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(30, 'paytm_label', 1, NULL, '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(31, 'paytm_description', 1, NULL, '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(32, 'razorpay_label', 1, NULL, '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(33, 'razorpay_description', 1, NULL, '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(34, 'instamojo_label', 1, NULL, '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(35, 'instamojo_description', 1, NULL, '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(36, 'authorizenet_label', 1, NULL, '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(37, 'authorizenet_description', 1, NULL, '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(38, 'paystack_label', 1, NULL, '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(39, 'paystack_description', 1, NULL, '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(40, 'flutterwave_label', 1, NULL, '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(41, 'flutterwave_description', 1, NULL, '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(42, 'mercadopago_label', 1, NULL, '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(43, 'mercadopago_description', 1, NULL, '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(44, 'cod_label', 1, NULL, '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(45, 'cod_description', 1, NULL, '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(46, 'bank_transfer_label', 1, NULL, '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(47, 'bank_transfer_description', 1, NULL, '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(48, 'check_payment_label', 1, NULL, '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(49, 'check_payment_description', 1, NULL, '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(50, 'storefront_copyright_text', 1, 's:92:\"Copyright © <a href=\"{{ store_url }}\">{{ store_name }}</a> {{ year }}. All rights reserved.\";', '2023-08-24 06:32:06', '2023-08-24 10:51:03'),
(51, 'maintenance_mode', 0, 's:1:\"0\";', '2023-08-24 10:46:21', '2023-08-24 10:46:21'),
(52, 'store_tagline', 1, NULL, '2023-08-24 10:46:21', '2023-08-24 10:46:21'),
(53, 'bank_transfer_instructions', 1, NULL, '2023-08-24 10:46:21', '2023-08-24 10:46:21'),
(54, 'check_payment_instructions', 1, NULL, '2023-08-24 10:46:21', '2023-08-24 10:46:21'),
(55, 'store_address_1', 0, 's:17:\"Dhaka, Bangladesh\";', '2023-08-24 10:46:21', '2023-08-24 10:46:21'),
(56, 'store_address_2', 0, 'N;', '2023-08-24 10:46:21', '2023-08-24 10:46:21'),
(57, 'store_city', 0, 's:5:\"Dhaka\";', '2023-08-24 10:46:21', '2023-08-24 10:46:21'),
(58, 'store_country', 0, 's:2:\"BD\";', '2023-08-24 10:46:21', '2023-08-24 10:46:21'),
(59, 'store_state', 0, 's:3:\"DHA\";', '2023-08-24 10:46:21', '2023-08-24 10:46:21'),
(60, 'store_zip', 0, 's:4:\"1216\";', '2023-08-24 10:46:21', '2023-08-24 10:46:21'),
(61, 'store_phone_hide', 0, 's:1:\"0\";', '2023-08-24 10:46:21', '2023-08-24 10:46:21'),
(62, 'store_email_hide', 0, 's:1:\"0\";', '2023-08-24 10:46:21', '2023-08-24 10:46:21'),
(63, 'currency_rate_exchange_service', 0, 'N;', '2023-08-24 10:46:22', '2023-08-24 10:46:22'),
(64, 'fixer_access_key', 0, 'N;', '2023-08-24 10:46:22', '2023-08-24 10:46:22'),
(65, 'forge_api_key', 0, 'N;', '2023-08-24 10:46:22', '2023-08-24 10:46:22'),
(66, 'currency_data_feed_api_key', 0, 'N;', '2023-08-24 10:46:22', '2023-08-24 10:46:22'),
(67, 'auto_refresh_currency_rates', 0, 's:1:\"0\";', '2023-08-24 10:46:22', '2023-08-24 10:46:22'),
(68, 'auto_refresh_currency_rate_frequency', 0, 's:5:\"daily\";', '2023-08-24 10:46:22', '2023-08-24 10:46:22'),
(69, 'sms_from', 0, 'N;', '2023-08-24 10:46:22', '2023-08-24 10:46:22'),
(70, 'sms_service', 0, 'N;', '2023-08-24 10:46:22', '2023-08-24 10:46:22'),
(71, 'vonage_key', 0, 'N;', '2023-08-24 10:46:23', '2023-08-24 10:46:23'),
(72, 'vonage_secret', 0, 'N;', '2023-08-24 10:46:23', '2023-08-24 10:46:23'),
(73, 'twilio_sid', 0, 'N;', '2023-08-24 10:46:23', '2023-08-24 10:46:23'),
(74, 'twilio_token', 0, 'N;', '2023-08-24 10:46:23', '2023-08-24 10:46:23'),
(75, 'welcome_sms', 0, 's:1:\"0\";', '2023-08-24 10:46:23', '2023-08-24 10:46:23'),
(76, 'new_order_admin_sms', 0, 's:1:\"0\";', '2023-08-24 10:46:23', '2023-08-24 10:46:23'),
(77, 'new_order_sms', 0, 's:1:\"0\";', '2023-08-24 10:46:23', '2023-08-24 10:46:23'),
(78, 'mail_from_address', 0, 'N;', '2023-08-24 10:46:23', '2023-08-24 10:46:23'),
(79, 'mail_from_name', 0, 'N;', '2023-08-24 10:46:23', '2023-08-24 10:46:23'),
(80, 'mail_host', 0, 'N;', '2023-08-24 10:46:23', '2023-08-24 10:46:23'),
(81, 'mail_port', 0, 'N;', '2023-08-24 10:46:23', '2023-08-24 10:46:23'),
(82, 'mail_username', 0, 'N;', '2023-08-24 10:46:23', '2023-08-24 10:46:23'),
(83, 'mail_password', 0, 'N;', '2023-08-24 10:46:23', '2023-08-24 10:46:23'),
(84, 'mail_encryption', 0, 'N;', '2023-08-24 10:46:23', '2023-08-24 10:46:23'),
(85, 'welcome_email', 0, 's:1:\"0\";', '2023-08-24 10:46:23', '2023-08-24 10:46:23'),
(86, 'admin_order_email', 0, 's:1:\"0\";', '2023-08-24 10:46:23', '2023-08-24 10:46:23'),
(87, 'invoice_email', 0, 's:1:\"0\";', '2023-08-24 10:46:23', '2023-08-24 10:46:23'),
(88, 'mailchimp_api_key', 0, 'N;', '2023-08-24 10:46:24', '2023-08-24 10:46:24'),
(89, 'mailchimp_list_id', 0, 'N;', '2023-08-24 10:46:24', '2023-08-24 10:46:24'),
(90, 'custom_header_assets', 0, 'N;', '2023-08-24 10:46:24', '2023-08-24 10:46:24'),
(91, 'custom_footer_assets', 0, 'N;', '2023-08-24 10:46:24', '2023-08-24 10:46:24'),
(92, 'facebook_login_enabled', 0, 's:1:\"0\";', '2023-08-24 10:46:24', '2023-08-24 10:46:24'),
(93, 'facebook_login_app_id', 0, 'N;', '2023-08-24 10:46:24', '2023-08-24 10:46:24'),
(94, 'facebook_login_app_secret', 0, 'N;', '2023-08-24 10:46:24', '2023-08-24 10:46:24'),
(95, 'google_login_enabled', 0, 's:1:\"0\";', '2023-08-24 10:46:24', '2023-08-24 10:46:24'),
(96, 'google_login_client_id', 0, 'N;', '2023-08-24 10:46:24', '2023-08-24 10:46:24'),
(97, 'google_login_client_secret', 0, 'N;', '2023-08-24 10:46:24', '2023-08-24 10:46:24'),
(98, 'free_shipping_enabled', 0, 's:1:\"0\";', '2023-08-24 10:46:24', '2023-08-24 10:46:24'),
(99, 'free_shipping_min_amount', 0, 'N;', '2023-08-24 10:46:24', '2023-08-24 10:46:24'),
(100, 'local_pickup_enabled', 0, 's:1:\"0\";', '2023-08-24 10:46:24', '2023-08-24 10:46:24'),
(101, 'flat_rate_enabled', 0, 's:1:\"0\";', '2023-08-24 10:46:24', '2023-08-24 10:46:24'),
(102, 'paypal_enabled', 0, 's:1:\"0\";', '2023-08-24 10:46:24', '2023-08-24 10:46:24'),
(103, 'paypal_test_mode', 0, 's:1:\"0\";', '2023-08-24 10:46:24', '2023-08-24 10:46:24'),
(104, 'paypal_client_id', 0, 'N;', '2023-08-24 10:46:24', '2023-08-24 10:46:24'),
(105, 'paypal_secret', 0, 'N;', '2023-08-24 10:46:24', '2023-08-24 10:46:24'),
(106, 'stripe_enabled', 0, 's:1:\"0\";', '2023-08-24 10:46:24', '2023-08-24 10:46:24'),
(107, 'stripe_publishable_key', 0, 'N;', '2023-08-24 10:46:24', '2023-08-24 10:46:24'),
(108, 'stripe_secret_key', 0, 'N;', '2023-08-24 10:46:24', '2023-08-24 10:46:24'),
(109, 'paytm_enabled', 0, 's:1:\"0\";', '2023-08-24 10:46:24', '2023-08-24 10:46:24'),
(110, 'paytm_test_mode', 0, 's:1:\"0\";', '2023-08-24 10:46:25', '2023-08-24 10:46:25'),
(111, 'paytm_merchant_id', 0, 'N;', '2023-08-24 10:46:25', '2023-08-24 10:46:25'),
(112, 'paytm_merchant_key', 0, 'N;', '2023-08-24 10:46:25', '2023-08-24 10:46:25'),
(113, 'razorpay_enabled', 0, 's:1:\"0\";', '2023-08-24 10:46:25', '2023-08-24 10:46:25'),
(114, 'razorpay_key_id', 0, 'N;', '2023-08-24 10:46:25', '2023-08-24 10:46:25'),
(115, 'razorpay_key_secret', 0, 'N;', '2023-08-24 10:46:25', '2023-08-24 10:46:25'),
(116, 'instamojo_enabled', 0, 's:1:\"0\";', '2023-08-24 10:46:25', '2023-08-24 10:46:25'),
(117, 'instamojo_test_mode', 0, 's:1:\"0\";', '2023-08-24 10:46:25', '2023-08-24 10:46:25'),
(118, 'instamojo_api_key', 0, 'N;', '2023-08-24 10:46:25', '2023-08-24 10:46:25'),
(119, 'instamojo_auth_token', 0, 'N;', '2023-08-24 10:46:25', '2023-08-24 10:46:25'),
(120, 'paystack_enabled', 0, 's:1:\"0\";', '2023-08-24 10:46:25', '2023-08-24 10:46:25'),
(121, 'paystack_test_mode', 0, 's:1:\"0\";', '2023-08-24 10:46:25', '2023-08-24 10:46:25'),
(122, 'paystack_public_key', 0, 'N;', '2023-08-24 10:46:25', '2023-08-24 10:46:25'),
(123, 'paystack_secret_key', 0, 'N;', '2023-08-24 10:46:25', '2023-08-24 10:46:25'),
(124, 'authorizenet_enabled', 0, 's:1:\"0\";', '2023-08-24 10:46:25', '2023-08-24 10:46:25'),
(125, 'authorizenet_test_mode', 0, 's:1:\"0\";', '2023-08-24 10:46:25', '2023-08-24 10:46:25'),
(126, 'authorizenet_merchant_login_id', 0, 'N;', '2023-08-24 10:46:25', '2023-08-24 10:46:25'),
(127, 'authorizenet_merchant_transaction_key', 0, 'N;', '2023-08-24 10:46:25', '2023-08-24 10:46:25'),
(128, 'mercadopago_enabled', 0, 's:1:\"0\";', '2023-08-24 10:46:25', '2023-08-24 10:46:25'),
(129, 'mercadopago_test_mode', 0, 's:1:\"0\";', '2023-08-24 10:46:25', '2023-08-24 10:46:25'),
(130, 'mercadopago_supported_currency', 0, 's:3:\"UYU\";', '2023-08-24 10:46:25', '2023-08-24 10:46:25'),
(131, 'mercadopago_public_key', 0, 'N;', '2023-08-24 10:46:25', '2023-08-24 10:46:25'),
(132, 'mercadopago_access_token', 0, 'N;', '2023-08-24 10:46:25', '2023-08-24 10:46:25'),
(133, 'flutterwave_enabled', 0, 's:1:\"0\";', '2023-08-24 10:46:25', '2023-08-24 10:46:25'),
(134, 'flutterwave_test_mode', 0, 's:1:\"0\";', '2023-08-24 10:46:25', '2023-08-24 10:46:25'),
(135, 'flutterwave_public_key', 0, 'N;', '2023-08-24 10:46:25', '2023-08-24 10:46:25'),
(136, 'flutterwave_secret_key', 0, 'N;', '2023-08-24 10:46:25', '2023-08-24 10:46:25'),
(137, 'flutterwave_encryption_key', 0, 'N;', '2023-08-24 10:46:25', '2023-08-24 10:46:25'),
(138, 'cod_enabled', 0, 's:1:\"0\";', '2023-08-24 10:46:25', '2023-08-24 10:46:25'),
(139, 'bank_transfer_enabled', 0, 's:1:\"0\";', '2023-08-24 10:46:25', '2023-08-24 10:46:25'),
(140, 'check_payment_enabled', 0, 's:1:\"0\";', '2023-08-24 10:46:25', '2023-08-24 10:46:25'),
(141, 'sms_order_statuses', 0, 'N;', '2023-08-24 10:46:25', '2023-08-24 10:46:25'),
(142, 'email_order_statuses', 0, 'N;', '2023-08-24 10:46:26', '2023-08-24 10:46:26'),
(143, 'storefront_welcome_text', 1, NULL, '2023-08-24 10:51:03', '2023-08-24 10:51:03'),
(144, 'storefront_address', 1, NULL, '2023-08-24 10:51:03', '2023-08-24 10:51:03'),
(145, 'storefront_navbar_text', 1, NULL, '2023-08-24 10:51:03', '2023-08-24 10:51:03'),
(146, 'storefront_footer_menu_one_title', 1, NULL, '2023-08-24 10:51:03', '2023-08-24 10:51:03'),
(147, 'storefront_footer_menu_two_title', 1, NULL, '2023-08-24 10:51:03', '2023-08-24 10:51:03'),
(148, 'storefront_feature_1_title', 1, NULL, '2023-08-24 10:51:03', '2023-08-24 10:51:03'),
(149, 'storefront_feature_1_subtitle', 1, NULL, '2023-08-24 10:51:03', '2023-08-24 10:51:03'),
(150, 'storefront_feature_2_title', 1, NULL, '2023-08-24 10:51:03', '2023-08-24 10:51:03'),
(151, 'storefront_feature_2_subtitle', 1, NULL, '2023-08-24 10:51:03', '2023-08-24 10:51:03'),
(152, 'storefront_feature_3_title', 1, NULL, '2023-08-24 10:51:03', '2023-08-24 10:51:03'),
(153, 'storefront_feature_3_subtitle', 1, NULL, '2023-08-24 10:51:03', '2023-08-24 10:51:03'),
(154, 'storefront_feature_4_title', 1, NULL, '2023-08-24 10:51:03', '2023-08-24 10:51:03'),
(155, 'storefront_feature_4_subtitle', 1, NULL, '2023-08-24 10:51:03', '2023-08-24 10:51:03'),
(156, 'storefront_feature_5_title', 1, NULL, '2023-08-24 10:51:03', '2023-08-24 10:51:03'),
(157, 'storefront_feature_5_subtitle', 1, NULL, '2023-08-24 10:51:03', '2023-08-24 10:51:03'),
(158, 'storefront_product_page_banner_file_id', 1, NULL, '2023-08-24 10:51:03', '2023-08-24 10:51:03'),
(159, 'storefront_slider_banner_1_file_id', 1, NULL, '2023-08-24 10:51:04', '2023-08-24 10:51:04'),
(160, 'storefront_slider_banner_2_file_id', 1, NULL, '2023-08-24 10:51:04', '2023-08-24 10:51:04'),
(161, 'storefront_three_column_full_width_banners_1_file_id', 1, NULL, '2023-08-24 10:51:04', '2023-08-24 10:51:04'),
(162, 'storefront_three_column_full_width_banners_2_file_id', 1, NULL, '2023-08-24 10:51:04', '2023-08-24 10:51:04'),
(163, 'storefront_three_column_full_width_banners_3_file_id', 1, NULL, '2023-08-24 10:51:04', '2023-08-24 10:51:04'),
(164, 'storefront_featured_categories_section_title', 1, NULL, '2023-08-24 10:51:04', '2023-08-24 10:51:04'),
(165, 'storefront_featured_categories_section_subtitle', 1, NULL, '2023-08-24 10:51:04', '2023-08-24 10:51:04'),
(166, 'storefront_product_tabs_1_section_tab_1_title', 1, NULL, '2023-08-24 10:51:04', '2023-08-24 10:51:04'),
(167, 'storefront_product_tabs_1_section_tab_2_title', 1, NULL, '2023-08-24 10:51:04', '2023-08-24 10:51:04'),
(168, 'storefront_product_tabs_1_section_tab_3_title', 1, NULL, '2023-08-24 10:51:05', '2023-08-24 10:51:05'),
(169, 'storefront_product_tabs_1_section_tab_4_title', 1, NULL, '2023-08-24 10:51:05', '2023-08-24 10:51:05'),
(170, 'storefront_two_column_banners_1_file_id', 1, NULL, '2023-08-24 10:51:05', '2023-08-24 10:51:05'),
(171, 'storefront_two_column_banners_2_file_id', 1, NULL, '2023-08-24 10:51:05', '2023-08-24 10:51:05'),
(172, 'storefront_product_grid_section_tab_1_title', 1, NULL, '2023-08-24 10:51:05', '2023-08-24 10:51:05'),
(173, 'storefront_product_grid_section_tab_2_title', 1, NULL, '2023-08-24 10:51:05', '2023-08-24 10:51:05'),
(174, 'storefront_product_grid_section_tab_3_title', 1, NULL, '2023-08-24 10:51:05', '2023-08-24 10:51:05'),
(175, 'storefront_product_grid_section_tab_4_title', 1, NULL, '2023-08-24 10:51:05', '2023-08-24 10:51:05'),
(176, 'storefront_three_column_banners_1_file_id', 1, NULL, '2023-08-24 10:51:05', '2023-08-24 10:51:05'),
(177, 'storefront_three_column_banners_2_file_id', 1, NULL, '2023-08-24 10:51:05', '2023-08-24 10:51:05'),
(178, 'storefront_three_column_banners_3_file_id', 1, NULL, '2023-08-24 10:51:05', '2023-08-24 10:51:05'),
(179, 'storefront_product_tabs_2_section_title', 1, NULL, '2023-08-24 10:51:05', '2023-08-24 10:51:05'),
(180, 'storefront_product_tabs_2_section_tab_1_title', 1, NULL, '2023-08-24 10:51:05', '2023-08-24 10:51:05'),
(181, 'storefront_product_tabs_2_section_tab_2_title', 1, NULL, '2023-08-24 10:51:05', '2023-08-24 10:51:05'),
(182, 'storefront_product_tabs_2_section_tab_3_title', 1, NULL, '2023-08-24 10:51:05', '2023-08-24 10:51:05'),
(183, 'storefront_product_tabs_2_section_tab_4_title', 1, NULL, '2023-08-24 10:51:06', '2023-08-24 10:51:06'),
(184, 'storefront_one_column_banner_file_id', 1, NULL, '2023-08-24 10:51:06', '2023-08-24 10:51:06'),
(185, 'storefront_theme_color', 0, 's:4:\"blue\";', '2023-08-24 10:51:06', '2023-08-24 10:51:06'),
(186, 'storefront_custom_theme_color', 0, 's:7:\"#000000\";', '2023-08-24 10:51:06', '2023-08-24 10:51:06'),
(187, 'storefront_mail_theme_color', 0, 's:4:\"blue\";', '2023-08-24 10:51:06', '2023-08-24 10:51:06'),
(188, 'storefront_custom_mail_theme_color', 0, 's:7:\"#000000\";', '2023-08-24 10:51:06', '2023-08-24 10:51:06'),
(189, 'storefront_slider', 0, 's:1:\"1\";', '2023-08-24 10:51:06', '2023-08-26 06:13:00'),
(190, 'storefront_terms_page', 0, 'N;', '2023-08-24 10:51:06', '2023-08-24 10:51:06'),
(191, 'storefront_privacy_page', 0, 'N;', '2023-08-24 10:51:06', '2023-08-24 10:51:06'),
(192, 'storefront_most_searched_keywords_enabled', 0, 's:1:\"1\";', '2023-08-24 10:51:06', '2023-08-24 10:51:06'),
(193, 'storefront_primary_menu', 0, 's:1:\"1\";', '2023-08-24 10:51:06', '2023-08-26 05:25:50'),
(194, 'storefront_category_menu', 0, 'N;', '2023-08-24 10:51:06', '2023-08-24 10:51:06'),
(195, 'storefront_footer_menu_one', 0, 's:1:\"2\";', '2023-08-24 10:51:06', '2023-08-26 10:01:38'),
(196, 'storefront_footer_menu_two', 0, 'N;', '2023-08-24 10:51:06', '2023-08-24 10:51:06'),
(197, 'storefront_features_section_enabled', 0, 's:1:\"1\";', '2023-08-24 10:51:06', '2023-08-24 10:54:02'),
(198, 'storefront_feature_1_icon', 0, 's:17:\"las la-headphones\";', '2023-08-24 10:51:06', '2023-08-24 10:54:02'),
(199, 'storefront_feature_2_icon', 0, 's:18:\"las la-credit-card\";', '2023-08-24 10:51:06', '2023-08-24 10:54:02'),
(200, 'storefront_feature_3_icon', 0, 's:17:\"las la-shield-alt\";', '2023-08-24 10:51:06', '2023-08-24 10:54:02'),
(201, 'storefront_feature_4_icon', 0, 's:12:\"las la-truck\";', '2023-08-24 10:51:06', '2023-08-24 10:54:02'),
(202, 'storefront_feature_5_icon', 0, 's:21:\"las la-calendar-minus\";', '2023-08-24 10:51:06', '2023-08-24 10:54:02'),
(203, 'storefront_product_page_banner_call_to_action_url', 0, 'N;', '2023-08-24 10:51:06', '2023-08-24 10:51:06'),
(204, 'storefront_product_page_banner_open_in_new_window', 0, 's:1:\"0\";', '2023-08-24 10:51:06', '2023-08-24 10:51:06'),
(205, 'storefront_facebook_link', 0, 's:1:\"#\";', '2023-08-24 10:51:06', '2023-08-24 10:54:23'),
(206, 'storefront_twitter_link', 0, 's:1:\"#\";', '2023-08-24 10:51:06', '2023-08-24 10:54:23'),
(207, 'storefront_instagram_link', 0, 's:1:\"#\";', '2023-08-24 10:51:06', '2023-08-24 10:54:23'),
(208, 'storefront_youtube_link', 0, 's:1:\"#\";', '2023-08-24 10:51:06', '2023-08-24 10:54:23'),
(209, 'storefront_slider_banner_1_call_to_action_url', 0, 'N;', '2023-08-24 10:51:06', '2023-08-24 10:51:06'),
(210, 'storefront_slider_banner_1_open_in_new_window', 0, 's:1:\"0\";', '2023-08-24 10:51:06', '2023-08-24 10:51:06'),
(211, 'storefront_slider_banner_2_call_to_action_url', 0, 'N;', '2023-08-24 10:51:06', '2023-08-24 10:51:06'),
(212, 'storefront_slider_banner_2_open_in_new_window', 0, 's:1:\"0\";', '2023-08-24 10:51:06', '2023-08-24 10:51:06'),
(213, 'storefront_three_column_full_width_banners_enabled', 0, 's:1:\"0\";', '2023-08-24 10:51:06', '2023-08-24 10:51:06'),
(214, 'storefront_three_column_full_width_banners_1_call_to_action_url', 0, 'N;', '2023-08-24 10:51:06', '2023-08-24 10:51:06'),
(215, 'storefront_three_column_full_width_banners_1_open_in_new_window', 0, 's:1:\"0\";', '2023-08-24 10:51:06', '2023-08-24 10:51:06'),
(216, 'storefront_three_column_full_width_banners_2_call_to_action_url', 0, 'N;', '2023-08-24 10:51:07', '2023-08-24 10:51:07'),
(217, 'storefront_three_column_full_width_banners_2_open_in_new_window', 0, 's:1:\"0\";', '2023-08-24 10:51:07', '2023-08-24 10:51:07'),
(218, 'storefront_three_column_full_width_banners_3_call_to_action_url', 0, 'N;', '2023-08-24 10:51:07', '2023-08-24 10:51:07'),
(219, 'storefront_three_column_full_width_banners_3_open_in_new_window', 0, 's:1:\"0\";', '2023-08-24 10:51:07', '2023-08-24 10:51:07'),
(220, 'storefront_featured_categories_section_enabled', 0, 's:1:\"1\";', '2023-08-24 10:51:07', '2023-08-26 09:24:20'),
(221, 'storefront_featured_categories_section_category_1_category_id', 0, 's:1:\"1\";', '2023-08-24 10:51:07', '2023-08-26 09:24:20'),
(222, 'storefront_featured_categories_section_category_1_product_type', 0, 's:17:\"category_products\";', '2023-08-24 10:51:07', '2023-08-26 09:24:20'),
(223, 'storefront_featured_categories_section_category_1_products_limit', 0, 'N;', '2023-08-24 10:51:07', '2023-08-24 10:51:07'),
(224, 'storefront_featured_categories_section_category_2_category_id', 0, 's:1:\"5\";', '2023-08-24 10:51:07', '2023-08-26 09:24:20'),
(225, 'storefront_featured_categories_section_category_2_product_type', 0, 's:17:\"category_products\";', '2023-08-24 10:51:07', '2023-08-26 09:24:20'),
(226, 'storefront_featured_categories_section_category_2_products_limit', 0, 'N;', '2023-08-24 10:51:07', '2023-08-24 10:51:07'),
(227, 'storefront_featured_categories_section_category_3_category_id', 0, 's:2:\"49\";', '2023-08-24 10:51:07', '2023-08-27 04:46:29'),
(228, 'storefront_featured_categories_section_category_3_product_type', 0, 's:17:\"category_products\";', '2023-08-24 10:51:07', '2023-08-26 09:24:20'),
(229, 'storefront_featured_categories_section_category_3_products_limit', 0, 'N;', '2023-08-24 10:51:07', '2023-08-24 10:51:07'),
(230, 'storefront_featured_categories_section_category_4_category_id', 0, 's:2:\"29\";', '2023-08-24 10:51:07', '2023-08-27 04:47:26'),
(231, 'storefront_featured_categories_section_category_4_product_type', 0, 's:17:\"category_products\";', '2023-08-24 10:51:07', '2023-08-26 09:24:20'),
(232, 'storefront_featured_categories_section_category_4_products_limit', 0, 'N;', '2023-08-24 10:51:07', '2023-08-24 10:51:07'),
(233, 'storefront_featured_categories_section_category_5_category_id', 0, 's:2:\"36\";', '2023-08-24 10:51:07', '2023-08-27 04:47:26'),
(234, 'storefront_featured_categories_section_category_5_product_type', 0, 's:17:\"category_products\";', '2023-08-24 10:51:07', '2023-08-26 09:24:21'),
(235, 'storefront_featured_categories_section_category_5_products_limit', 0, 'N;', '2023-08-24 10:51:07', '2023-08-24 10:51:07'),
(236, 'storefront_featured_categories_section_category_6_category_id', 0, 'N;', '2023-08-24 10:51:07', '2023-08-27 04:47:26'),
(237, 'storefront_featured_categories_section_category_6_product_type', 0, 'N;', '2023-08-24 10:51:07', '2023-08-27 04:47:26'),
(238, 'storefront_featured_categories_section_category_6_products_limit', 0, 'N;', '2023-08-24 10:51:07', '2023-08-24 10:51:07'),
(239, 'storefront_product_tabs_1_section_enabled', 0, 's:1:\"1\";', '2023-08-24 10:51:08', '2023-08-26 09:24:21'),
(240, 'storefront_product_tabs_1_section_tab_1_product_type', 0, 'N;', '2023-08-24 10:51:08', '2023-08-24 10:51:08'),
(241, 'storefront_product_tabs_1_section_tab_1_category_id', 0, 'N;', '2023-08-24 10:51:08', '2023-08-24 10:51:08'),
(242, 'storefront_product_tabs_1_section_tab_1_products_limit', 0, 'N;', '2023-08-24 10:51:08', '2023-08-24 10:51:08'),
(243, 'storefront_product_tabs_1_section_tab_2_product_type', 0, 'N;', '2023-08-24 10:51:08', '2023-08-24 10:51:08'),
(244, 'storefront_product_tabs_1_section_tab_2_category_id', 0, 'N;', '2023-08-24 10:51:08', '2023-08-24 10:51:08'),
(245, 'storefront_product_tabs_1_section_tab_2_products_limit', 0, 'N;', '2023-08-24 10:51:08', '2023-08-24 10:51:08'),
(246, 'storefront_product_tabs_1_section_tab_3_product_type', 0, 'N;', '2023-08-24 10:51:08', '2023-08-24 10:51:08'),
(247, 'storefront_product_tabs_1_section_tab_3_category_id', 0, 'N;', '2023-08-24 10:51:08', '2023-08-24 10:51:08'),
(248, 'storefront_product_tabs_1_section_tab_3_products_limit', 0, 'N;', '2023-08-24 10:51:08', '2023-08-24 10:51:08'),
(249, 'storefront_product_tabs_1_section_tab_4_product_type', 0, 'N;', '2023-08-24 10:51:08', '2023-08-24 10:51:08'),
(250, 'storefront_product_tabs_1_section_tab_4_category_id', 0, 'N;', '2023-08-24 10:51:08', '2023-08-24 10:51:08'),
(251, 'storefront_product_tabs_1_section_tab_4_products_limit', 0, 'N;', '2023-08-24 10:51:08', '2023-08-24 10:51:08'),
(252, 'storefront_top_brands_section_enabled', 0, 's:1:\"1\";', '2023-08-24 10:51:08', '2023-08-26 09:34:56'),
(253, 'storefront_flash_sale_and_vertical_products_section_enabled', 0, 's:1:\"0\";', '2023-08-24 10:51:08', '2023-08-24 10:51:08'),
(254, 'storefront_flash_sale_title', 0, 'N;', '2023-08-24 10:51:08', '2023-08-24 10:51:08'),
(255, 'storefront_active_flash_sale_campaign', 0, 'N;', '2023-08-24 10:51:08', '2023-08-24 10:51:08'),
(256, 'storefront_vertical_products_1_title', 0, 'N;', '2023-08-24 10:51:08', '2023-08-24 10:51:08'),
(257, 'storefront_vertical_products_1_product_type', 0, 'N;', '2023-08-24 10:51:08', '2023-08-24 10:51:08'),
(258, 'storefront_vertical_products_1_category_id', 0, 'N;', '2023-08-24 10:51:08', '2023-08-24 10:51:08'),
(259, 'storefront_vertical_products_1_products_limit', 0, 'N;', '2023-08-24 10:51:08', '2023-08-24 10:51:08'),
(260, 'storefront_vertical_products_2_title', 0, 'N;', '2023-08-24 10:51:08', '2023-08-24 10:51:08'),
(261, 'storefront_vertical_products_2_product_type', 0, 'N;', '2023-08-24 10:51:08', '2023-08-24 10:51:08'),
(262, 'storefront_vertical_products_2_category_id', 0, 'N;', '2023-08-24 10:51:08', '2023-08-24 10:51:08'),
(263, 'storefront_vertical_products_2_products_limit', 0, 'N;', '2023-08-24 10:51:08', '2023-08-24 10:51:08'),
(264, 'storefront_vertical_products_3_title', 0, 'N;', '2023-08-24 10:51:08', '2023-08-24 10:51:08'),
(265, 'storefront_vertical_products_3_product_type', 0, 'N;', '2023-08-24 10:51:08', '2023-08-24 10:51:08'),
(266, 'storefront_vertical_products_3_category_id', 0, 'N;', '2023-08-24 10:51:08', '2023-08-24 10:51:08'),
(267, 'storefront_vertical_products_3_products_limit', 0, 'N;', '2023-08-24 10:51:08', '2023-08-24 10:51:08'),
(268, 'storefront_two_column_banners_enabled', 0, 's:1:\"1\";', '2023-08-24 10:51:08', '2023-08-26 09:30:59'),
(269, 'storefront_two_column_banners_1_call_to_action_url', 0, 'N;', '2023-08-24 10:51:08', '2023-08-24 10:51:08'),
(270, 'storefront_two_column_banners_1_open_in_new_window', 0, 's:1:\"0\";', '2023-08-24 10:51:08', '2023-08-24 10:51:08'),
(271, 'storefront_two_column_banners_2_call_to_action_url', 0, 'N;', '2023-08-24 10:51:08', '2023-08-24 10:51:08'),
(272, 'storefront_two_column_banners_2_open_in_new_window', 0, 's:1:\"0\";', '2023-08-24 10:51:08', '2023-08-24 10:51:08'),
(273, 'storefront_product_grid_section_enabled', 0, 's:1:\"1\";', '2023-08-24 10:51:09', '2023-08-26 09:30:09'),
(274, 'storefront_product_grid_section_tab_1_product_type', 0, 's:17:\"category_products\";', '2023-08-24 10:51:09', '2023-08-26 09:30:09'),
(275, 'storefront_product_grid_section_tab_1_category_id', 0, 's:1:\"1\";', '2023-08-24 10:51:09', '2023-08-26 09:30:09'),
(276, 'storefront_product_grid_section_tab_1_products_limit', 0, 'N;', '2023-08-24 10:51:09', '2023-08-24 10:51:09'),
(277, 'storefront_product_grid_section_tab_2_product_type', 0, 's:17:\"category_products\";', '2023-08-24 10:51:09', '2023-08-26 09:30:09'),
(278, 'storefront_product_grid_section_tab_2_category_id', 0, 's:1:\"5\";', '2023-08-24 10:51:09', '2023-08-26 09:30:09'),
(279, 'storefront_product_grid_section_tab_2_products_limit', 0, 'N;', '2023-08-24 10:51:09', '2023-08-24 10:51:09'),
(280, 'storefront_product_grid_section_tab_3_product_type', 0, 's:17:\"category_products\";', '2023-08-24 10:51:09', '2023-08-26 09:30:09'),
(281, 'storefront_product_grid_section_tab_3_category_id', 0, 's:2:\"29\";', '2023-08-24 10:51:09', '2023-08-26 09:30:09'),
(282, 'storefront_product_grid_section_tab_3_products_limit', 0, 'N;', '2023-08-24 10:51:09', '2023-08-24 10:51:09'),
(283, 'storefront_product_grid_section_tab_4_product_type', 0, 's:17:\"category_products\";', '2023-08-24 10:51:09', '2023-08-26 09:30:09'),
(284, 'storefront_product_grid_section_tab_4_category_id', 0, 's:2:\"49\";', '2023-08-24 10:51:09', '2023-08-26 09:30:09'),
(285, 'storefront_product_grid_section_tab_4_products_limit', 0, 'N;', '2023-08-24 10:51:09', '2023-08-24 10:51:09'),
(286, 'storefront_three_column_banners_enabled', 0, 's:1:\"0\";', '2023-08-24 10:51:09', '2023-08-24 10:51:09'),
(287, 'storefront_three_column_banners_1_call_to_action_url', 0, 'N;', '2023-08-24 10:51:09', '2023-08-24 10:51:09'),
(288, 'storefront_three_column_banners_1_open_in_new_window', 0, 's:1:\"0\";', '2023-08-24 10:51:09', '2023-08-24 10:51:09'),
(289, 'storefront_three_column_banners_2_call_to_action_url', 0, 'N;', '2023-08-24 10:51:09', '2023-08-24 10:51:09'),
(290, 'storefront_three_column_banners_2_open_in_new_window', 0, 's:1:\"0\";', '2023-08-24 10:51:09', '2023-08-24 10:51:09'),
(291, 'storefront_three_column_banners_3_call_to_action_url', 0, 'N;', '2023-08-24 10:51:09', '2023-08-24 10:51:09'),
(292, 'storefront_three_column_banners_3_open_in_new_window', 0, 's:1:\"0\";', '2023-08-24 10:51:09', '2023-08-24 10:51:09'),
(293, 'storefront_product_tabs_2_section_enabled', 0, 's:1:\"0\";', '2023-08-24 10:51:09', '2023-08-24 10:51:09'),
(294, 'storefront_product_tabs_2_section_tab_1_product_type', 0, 'N;', '2023-08-24 10:51:09', '2023-08-24 10:51:09'),
(295, 'storefront_product_tabs_2_section_tab_1_category_id', 0, 'N;', '2023-08-24 10:51:09', '2023-08-24 10:51:09'),
(296, 'storefront_product_tabs_2_section_tab_1_products_limit', 0, 'N;', '2023-08-24 10:51:09', '2023-08-24 10:51:09'),
(297, 'storefront_product_tabs_2_section_tab_2_product_type', 0, 'N;', '2023-08-24 10:51:09', '2023-08-24 10:51:09'),
(298, 'storefront_product_tabs_2_section_tab_2_category_id', 0, 'N;', '2023-08-24 10:51:09', '2023-08-24 10:51:09'),
(299, 'storefront_product_tabs_2_section_tab_2_products_limit', 0, 'N;', '2023-08-24 10:51:09', '2023-08-24 10:51:09'),
(300, 'storefront_product_tabs_2_section_tab_3_product_type', 0, 'N;', '2023-08-24 10:51:09', '2023-08-24 10:51:09'),
(301, 'storefront_product_tabs_2_section_tab_3_category_id', 0, 'N;', '2023-08-24 10:51:09', '2023-08-24 10:51:09'),
(302, 'storefront_product_tabs_2_section_tab_3_products_limit', 0, 'N;', '2023-08-24 10:51:09', '2023-08-24 10:51:09'),
(303, 'storefront_product_tabs_2_section_tab_4_product_type', 0, 'N;', '2023-08-24 10:51:09', '2023-08-24 10:51:09'),
(304, 'storefront_product_tabs_2_section_tab_4_category_id', 0, 'N;', '2023-08-24 10:51:09', '2023-08-24 10:51:09'),
(305, 'storefront_product_tabs_2_section_tab_4_products_limit', 0, 'N;', '2023-08-24 10:51:09', '2023-08-24 10:51:09'),
(306, 'storefront_one_column_banner_enabled', 0, 's:1:\"1\";', '2023-08-24 10:51:09', '2023-08-26 09:35:43'),
(307, 'storefront_one_column_banner_call_to_action_url', 0, 'N;', '2023-08-24 10:51:09', '2023-08-24 10:51:09'),
(308, 'storefront_one_column_banner_open_in_new_window', 0, 's:1:\"0\";', '2023-08-24 10:51:09', '2023-08-24 10:51:09'),
(309, 'storefront_footer_tags', 0, 'a:5:{i:0;s:1:\"6\";i:1;s:1:\"5\";i:2;s:1:\"3\";i:3;s:1:\"7\";i:4;s:1:\"4\";}', '2023-08-24 10:51:09', '2023-08-26 10:25:01'),
(310, 'storefront_featured_categories_section_category_1_products', 0, 'N;', '2023-08-24 10:51:10', '2023-08-24 10:51:10'),
(311, 'storefront_featured_categories_section_category_2_products', 0, 'N;', '2023-08-24 10:51:10', '2023-08-24 10:51:10'),
(312, 'storefront_featured_categories_section_category_3_products', 0, 'N;', '2023-08-24 10:51:10', '2023-08-24 10:51:10'),
(313, 'storefront_featured_categories_section_category_4_products', 0, 'N;', '2023-08-24 10:51:10', '2023-08-24 10:51:10'),
(314, 'storefront_featured_categories_section_category_5_products', 0, 'N;', '2023-08-24 10:51:10', '2023-08-24 10:51:10'),
(315, 'storefront_featured_categories_section_category_6_products', 0, 'N;', '2023-08-24 10:51:10', '2023-08-24 10:51:10'),
(316, 'storefront_product_tabs_1_section_tab_1_products', 0, 'N;', '2023-08-24 10:51:10', '2023-08-24 10:51:10'),
(317, 'storefront_product_tabs_1_section_tab_2_products', 0, 'N;', '2023-08-24 10:51:10', '2023-08-24 10:51:10'),
(318, 'storefront_product_tabs_1_section_tab_3_products', 0, 'N;', '2023-08-24 10:51:10', '2023-08-24 10:51:10'),
(319, 'storefront_product_tabs_1_section_tab_4_products', 0, 'N;', '2023-08-24 10:51:10', '2023-08-24 10:51:10'),
(320, 'storefront_top_brands', 0, 'a:20:{i:0;s:2:\"20\";i:1;s:2:\"11\";i:2;s:2:\"12\";i:3;s:2:\"18\";i:4;s:2:\"13\";i:5;s:2:\"21\";i:6;s:2:\"14\";i:7;s:2:\"16\";i:8;s:1:\"7\";i:9;s:1:\"9\";i:10;s:1:\"1\";i:11;s:2:\"10\";i:12;s:1:\"2\";i:13;s:2:\"23\";i:14;s:2:\"15\";i:15;s:2:\"25\";i:16;s:1:\"3\";i:17;s:2:\"17\";i:18;s:2:\"24\";i:19;s:2:\"19\";}', '2023-08-24 10:51:10', '2023-08-26 10:25:01'),
(321, 'storefront_vertical_products_1_products', 0, 'N;', '2023-08-24 10:51:10', '2023-08-24 10:51:10'),
(322, 'storefront_vertical_products_2_products', 0, 'N;', '2023-08-24 10:51:10', '2023-08-24 10:51:10'),
(323, 'storefront_vertical_products_3_products', 0, 'N;', '2023-08-24 10:51:10', '2023-08-24 10:51:10'),
(324, 'storefront_product_grid_section_tab_1_products', 0, 'N;', '2023-08-24 10:51:10', '2023-08-24 10:51:10'),
(325, 'storefront_product_grid_section_tab_2_products', 0, 'N;', '2023-08-24 10:51:10', '2023-08-24 10:51:10'),
(326, 'storefront_product_grid_section_tab_3_products', 0, 'N;', '2023-08-24 10:51:10', '2023-08-24 10:51:10'),
(327, 'storefront_product_grid_section_tab_4_products', 0, 'N;', '2023-08-24 10:51:10', '2023-08-24 10:51:10'),
(328, 'storefront_product_tabs_2_section_tab_1_products', 0, 'N;', '2023-08-24 10:51:10', '2023-08-24 10:51:10'),
(329, 'storefront_product_tabs_2_section_tab_2_products', 0, 'N;', '2023-08-24 10:51:10', '2023-08-24 10:51:10'),
(330, 'storefront_product_tabs_2_section_tab_3_products', 0, 'N;', '2023-08-24 10:51:10', '2023-08-24 10:51:10'),
(331, 'storefront_product_tabs_2_section_tab_4_products', 0, 'N;', '2023-08-24 10:51:10', '2023-08-24 10:51:10'),
(332, 'storefront_accepted_payment_methods_image', 0, 's:3:\"171\";', '2023-08-24 10:52:56', '2023-08-24 10:52:56'),
(333, 'storefront_header_logo', 1, NULL, '2023-08-26 10:25:00', '2023-08-26 10:25:00'),
(334, 'storefront_mail_logo', 1, NULL, '2023-08-26 10:45:07', '2023-08-26 10:45:07'),
(335, 'storefront_favicon', 0, 's:3:\"275\";', '2023-08-26 10:45:07', '2023-08-26 10:45:07');

-- --------------------------------------------------------

--
-- Table structure for table `setting_translations`
--

CREATE TABLE `setting_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `setting_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `setting_translations`
--

INSERT INTO `setting_translations` (`id`, `setting_id`, `locale`, `value`) VALUES
(1, 1, 'en', 's:9:\"Lapi Tapi\";'),
(2, 23, 'en', 's:13:\"Free Shipping\";'),
(3, 24, 'en', 's:12:\"Local Pickup\";'),
(4, 25, 'en', 's:9:\"Flat Rate\";'),
(5, 26, 'en', 's:6:\"PayPal\";'),
(6, 27, 'en', 's:28:\"Pay via your PayPal account.\";'),
(7, 28, 'en', 's:6:\"Stripe\";'),
(8, 29, 'en', 's:29:\"Pay via credit or debit card.\";'),
(9, 30, 'en', 's:5:\"Paytm\";'),
(10, 31, 'en', 's:103:\"The best payment gateway provider in India for e-payment through credit card, debit card & net banking.\";'),
(11, 32, 'en', 's:8:\"Razorpay\";'),
(12, 33, 'en', 's:74:\"Pay securely by Credit or Debit card or Internet Banking through Razorpay.\";'),
(13, 34, 'en', 's:9:\"Instamojo\";'),
(14, 35, 'en', 's:16:\"CC/DB/NB/Wallets\";'),
(15, 36, 'en', 's:13:\"Authorize.net\";'),
(16, 37, 'en', 's:33:\"Accept payments anytime, anywhere\";'),
(17, 38, 'en', 's:8:\"Paystack\";'),
(18, 39, 'en', 's:45:\"Modern online and offline payments for Africa\";'),
(19, 40, 'en', 's:11:\"Flutterwave\";'),
(20, 41, 'en', 's:40:\"Endless possibilities for every business\";'),
(21, 42, 'en', 's:12:\"Mercado Pago\";'),
(22, 43, 'en', 's:36:\"From now on, do more with your money\";'),
(23, 44, 'en', 's:16:\"Cash On Delivery\";'),
(24, 45, 'en', 's:28:\"Pay with cash upon delivery.\";'),
(25, 46, 'en', 's:13:\"Bank Transfer\";'),
(26, 47, 'en', 's:100:\"Make your payment directly into our bank account. Please use your Order ID as the payment reference.\";'),
(27, 48, 'en', 's:19:\"Check / Money Order\";'),
(28, 49, 'en', 's:33:\"Please send a check to our store.\";'),
(29, 52, 'en', 'N;'),
(30, 53, 'en', 'N;'),
(31, 54, 'en', 'N;'),
(32, 143, 'en', 's:19:\"Welcome to Lapitapi\";'),
(33, 144, 'en', 's:17:\"Dhaka, Bangladesh\";'),
(34, 145, 'en', 'N;'),
(35, 146, 'en', 's:12:\"Our Services\";'),
(36, 147, 'en', 's:11:\"Information\";'),
(37, 50, 'en', 's:92:\"Copyright © <a href=\"{{ store_url }}\">{{ store_name }}</a> {{ year }}. All rights reserved.\";'),
(38, 148, 'en', 's:12:\"24/7 SUPPORT\";'),
(39, 149, 'en', 's:18:\"Support every time\";'),
(40, 150, 'en', 's:14:\"ACCEPT PAYMENT\";'),
(41, 151, 'en', 's:20:\"Visa, Paypal, Master\";'),
(42, 152, 'en', 's:15:\"SECURED PAYMENT\";'),
(43, 153, 'en', 's:12:\"100% secured\";'),
(44, 154, 'en', 's:13:\"FREE SHIPPING\";'),
(45, 155, 'en', 's:15:\"Order over $100\";'),
(46, 156, 'en', 's:14:\"30 DAYS RETURN\";'),
(47, 157, 'en', 's:17:\"30 days guarantee\";'),
(48, 158, 'en', 'N;'),
(49, 159, 'en', 's:3:\"174\";'),
(50, 160, 'en', 's:3:\"175\";'),
(51, 161, 'en', 'N;'),
(52, 162, 'en', 'N;'),
(53, 163, 'en', 'N;'),
(54, 164, 'en', 's:36:\"Top Categories in Sales and Trending\";'),
(55, 165, 'en', 's:107:\"Last Month upto 1500+ Products Sales From this catagory. You can choose a product from here and save money.\";'),
(56, 166, 'en', 'N;'),
(57, 167, 'en', 'N;'),
(58, 168, 'en', 'N;'),
(59, 169, 'en', 'N;'),
(60, 170, 'en', 's:3:\"250\";'),
(61, 171, 'en', 's:3:\"251\";'),
(62, 172, 'en', 's:7:\"Laptops\";'),
(63, 173, 'en', 's:7:\"Desktop\";'),
(64, 174, 'en', 's:7:\"Mobiles\";'),
(65, 175, 'en', 's:6:\"Camera\";'),
(66, 176, 'en', 'N;'),
(67, 177, 'en', 'N;'),
(68, 178, 'en', 'N;'),
(69, 179, 'en', 'N;'),
(70, 180, 'en', 'N;'),
(71, 181, 'en', 'N;'),
(72, 182, 'en', 'N;'),
(73, 183, 'en', 'N;'),
(74, 184, 'en', 's:3:\"252\";'),
(75, 333, 'en', 's:3:\"274\";'),
(76, 334, 'en', 's:3:\"275\";');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(10) UNSIGNED NOT NULL,
  `speed` int(11) DEFAULT NULL,
  `autoplay` tinyint(1) DEFAULT NULL,
  `autoplay_speed` int(11) DEFAULT NULL,
  `fade` tinyint(1) NOT NULL DEFAULT 0,
  `dots` tinyint(1) DEFAULT NULL,
  `arrows` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `speed`, `autoplay`, `autoplay_speed`, `fade`, `dots`, `arrows`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 3000, 1, 1, 1, '2023-08-26 06:10:36', '2023-08-26 06:10:36');

-- --------------------------------------------------------

--
-- Table structure for table `slider_slides`
--

CREATE TABLE `slider_slides` (
  `id` int(10) UNSIGNED NOT NULL,
  `slider_id` int(10) UNSIGNED NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `call_to_action_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `open_in_new_window` tinyint(1) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slider_slides`
--

INSERT INTO `slider_slides` (`id`, `slider_id`, `options`, `call_to_action_url`, `open_in_new_window`, `position`, `created_at`, `updated_at`) VALUES
(1, 1, '{\"caption_1\":{\"delay\":null,\"effect\":\"fadeInUp\"},\"caption_2\":{\"delay\":null,\"effect\":\"fadeInUp\"},\"call_to_action\":{\"delay\":null,\"effect\":\"fadeInUp\"}}', NULL, 0, 0, '2023-08-26 06:10:36', '2023-08-26 06:10:36');

-- --------------------------------------------------------

--
-- Table structure for table `slider_slide_translations`
--

CREATE TABLE `slider_slide_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `slider_slide_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_id` int(10) UNSIGNED DEFAULT NULL,
  `caption_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caption_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `call_to_action_text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direction` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slider_slide_translations`
--

INSERT INTO `slider_slide_translations` (`id`, `slider_slide_id`, `locale`, `file_id`, `caption_1`, `caption_2`, `call_to_action_text`, `direction`) VALUES
(1, 1, 'en', 173, '<b>3D</b> Virtual Reality', 'VR 3D glasses with remote control gamepad at best price', 'BUY NOW', 'right');

-- --------------------------------------------------------

--
-- Table structure for table `slider_translations`
--

CREATE TABLE `slider_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `slider_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slider_translations`
--

INSERT INTO `slider_translations` (`id`, `slider_id`, `locale`, `name`) VALUES
(1, 1, 'en', 'Main Silder');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `slug`, `created_at`, `updated_at`) VALUES
(3, 'hot-deals', '2023-08-24 07:29:55', '2023-08-24 07:29:55'),
(4, 'smartphone', '2023-08-26 10:04:02', '2023-08-26 10:04:02'),
(5, 'gadgets', '2023-08-26 10:04:14', '2023-08-26 10:04:14'),
(6, 'electronics', '2023-08-26 10:04:24', '2023-08-26 10:04:24'),
(7, 'new-arrivals', '2023-08-26 10:04:54', '2023-08-26 10:04:54');

-- --------------------------------------------------------

--
-- Table structure for table `tag_translations`
--

CREATE TABLE `tag_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tag_translations`
--

INSERT INTO `tag_translations` (`id`, `tag_id`, `locale`, `name`) VALUES
(3, 3, 'en', 'Hot deals'),
(4, 4, 'en', 'Smartphone'),
(5, 5, 'en', 'Gadgets'),
(6, 6, 'en', 'Electronics'),
(7, 7, 'en', 'New Arrivals');

-- --------------------------------------------------------

--
-- Table structure for table `tax_classes`
--

CREATE TABLE `tax_classes` (
  `id` int(10) UNSIGNED NOT NULL,
  `based_on` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tax_class_translations`
--

CREATE TABLE `tax_class_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `tax_class_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE `tax_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `tax_class_id` int(10) UNSIGNED NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(8,4) UNSIGNED NOT NULL,
  `position` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tax_rate_translations`
--

CREATE TABLE `tax_rate_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `tax_rate_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `throttle`
--

CREATE TABLE `throttle` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `throttle`
--

INSERT INTO `throttle` (`id`, `user_id`, `type`, `ip`, `created_at`, `updated_at`) VALUES
(1, NULL, 'global', NULL, '2023-08-24 06:59:21', '2023-08-24 06:59:21'),
(2, NULL, 'ip', '192.168.1.9', '2023-08-24 06:59:21', '2023-08-24 06:59:21'),
(3, 2, 'user', NULL, '2023-08-24 06:59:21', '2023-08-24 06:59:21');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translation_translations`
--

CREATE TABLE `translation_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `translation_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `updater_scripts`
--

CREATE TABLE `updater_scripts` (
  `id` int(10) UNSIGNED NOT NULL,
  `script` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `updater_scripts`
--

INSERT INTO `updater_scripts` (`id`, `script`) VALUES
(1, 'V2_0_0'),
(2, 'V2_0_0');

-- --------------------------------------------------------

--
-- Table structure for table `up_sell_products`
--

CREATE TABLE `up_sell_products` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `up_sell_product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password`, `permissions`, `last_login`, `created_at`, `updated_at`) VALUES
(1, 'MD. Jahid', 'Islam', 'Fxcjahid3@gmail.com', '01623547800', '$2y$10$ijZCteUbLE63FTQGM0bJ9.gQ2x9JBfA1pLUV/XNmAR7Bj.tc5nvLq', NULL, '2023-08-27 10:09:21', '2023-08-24 06:32:06', '2023-08-27 04:09:21'),
(2, 'MD', 'Hasan', 'mdhasanuzzaman112233@gmail.com', '1623547800', '$2y$10$SY3wEXOt2xpbNCryxf3/MuKGRyAj9WQd8LAbyyLBYqWbOqBMJX3zG', '[]', '2023-08-26 12:24:55', '2023-08-24 06:42:45', '2023-08-26 06:24:55'),
(3, 'Kazi', 'Rafiz', 'kazirafiz1994@gmail.com', '1623547800', '$2y$10$u/UiLmpEBgdgAAyGacCAvuCf17lezrLQXpG.lexlui02qJYhwAAOW', '[]', '2023-08-26 12:48:11', '2023-08-24 06:43:38', '2023-08-26 06:48:11');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-08-24 06:32:06', '2023-08-24 06:32:06'),
(2, 1, '2023-08-24 06:42:45', '2023-08-24 06:42:45'),
(3, 1, '2023-08-24 06:43:38', '2023-08-24 06:43:38');

-- --------------------------------------------------------

--
-- Table structure for table `wish_lists`
--

CREATE TABLE `wish_lists` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activations`
--
ALTER TABLE `activations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activations_user_id_index` (`user_id`);

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attributes_slug_unique` (`slug`),
  ADD KEY `attributes_attribute_set_id_index` (`attribute_set_id`);

--
-- Indexes for table `attribute_categories`
--
ALTER TABLE `attribute_categories`
  ADD PRIMARY KEY (`attribute_id`,`category_id`),
  ADD KEY `attribute_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `attribute_sets`
--
ALTER TABLE `attribute_sets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_set_translations`
--
ALTER TABLE `attribute_set_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attribute_set_translations_attribute_set_id_locale_unique` (`attribute_set_id`,`locale`);

--
-- Indexes for table `attribute_translations`
--
ALTER TABLE `attribute_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attribute_translations_attribute_id_locale_unique` (`attribute_id`,`locale`);

--
-- Indexes for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_values_attribute_id_index` (`attribute_id`);

--
-- Indexes for table `attribute_value_translations`
--
ALTER TABLE `attribute_value_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attribute_value_translations_attribute_value_id_locale_unique` (`attribute_value_id`,`locale`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Indexes for table `brand_translations`
--
ALTER TABLE `brand_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brand_translations_brand_id_locale_unique` (`brand_id`,`locale`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_translations_category_id_locale_unique` (`category_id`,`locale`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupons_code_index` (`code`);

--
-- Indexes for table `coupon_categories`
--
ALTER TABLE `coupon_categories`
  ADD PRIMARY KEY (`coupon_id`,`category_id`,`exclude`),
  ADD KEY `coupon_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `coupon_products`
--
ALTER TABLE `coupon_products`
  ADD PRIMARY KEY (`coupon_id`,`product_id`),
  ADD KEY `coupon_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `coupon_translations`
--
ALTER TABLE `coupon_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupon_translations_coupon_id_locale_unique` (`coupon_id`,`locale`);

--
-- Indexes for table `cross_sell_products`
--
ALTER TABLE `cross_sell_products`
  ADD PRIMARY KEY (`product_id`,`cross_sell_product_id`),
  ADD KEY `cross_sell_products_cross_sell_product_id_foreign` (`cross_sell_product_id`);

--
-- Indexes for table `currency_rates`
--
ALTER TABLE `currency_rates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `currency_rates_currency_unique` (`currency`);

--
-- Indexes for table `default_addresses`
--
ALTER TABLE `default_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `default_addresses_customer_id_foreign` (`customer_id`),
  ADD KEY `default_addresses_address_id_foreign` (`address_id`);

--
-- Indexes for table `entity_files`
--
ALTER TABLE `entity_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entity_files_entity_type_entity_id_index` (`entity_type`,`entity_id`),
  ADD KEY `entity_files_file_id_index` (`file_id`),
  ADD KEY `entity_files_zone_index` (`zone`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `files_user_id_index` (`user_id`),
  ADD KEY `files_filename_index` (`filename`);

--
-- Indexes for table `flash_sales`
--
ALTER TABLE `flash_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_sale_products`
--
ALTER TABLE `flash_sale_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flash_sale_products_flash_sale_id_foreign` (`flash_sale_id`),
  ADD KEY `flash_sale_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `flash_sale_product_orders`
--
ALTER TABLE `flash_sale_product_orders`
  ADD PRIMARY KEY (`flash_sale_product_id`,`order_id`),
  ADD KEY `flash_sale_product_orders_order_id_foreign` (`order_id`);

--
-- Indexes for table `flash_sale_translations`
--
ALTER TABLE `flash_sale_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `flash_sale_translations_flash_sale_id_locale_unique` (`flash_sale_id`,`locale`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_parent_id_foreign` (`parent_id`),
  ADD KEY `menu_items_category_id_foreign` (`category_id`),
  ADD KEY `menu_items_page_id_foreign` (`page_id`),
  ADD KEY `menu_items_menu_id_index` (`menu_id`);

--
-- Indexes for table `menu_item_translations`
--
ALTER TABLE `menu_item_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menu_item_translations_menu_item_id_locale_unique` (`menu_item_id`,`locale`);

--
-- Indexes for table `menu_translations`
--
ALTER TABLE `menu_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menu_translations_menu_id_locale_unique` (`menu_id`,`locale`);

--
-- Indexes for table `meta_data`
--
ALTER TABLE `meta_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meta_data_entity_type_entity_id_index` (`entity_type`,`entity_id`);

--
-- Indexes for table `meta_data_translations`
--
ALTER TABLE `meta_data_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `meta_data_translations_meta_data_id_locale_unique` (`meta_data_id`,`locale`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `option_translations`
--
ALTER TABLE `option_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `option_translations_option_id_locale_unique` (`option_id`,`locale`);

--
-- Indexes for table `option_values`
--
ALTER TABLE `option_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `option_values_option_id_index` (`option_id`);

--
-- Indexes for table `option_value_translations`
--
ALTER TABLE `option_value_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `option_value_translations_option_value_id_locale_unique` (`option_value_id`,`locale`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_customer_id_index` (`customer_id`),
  ADD KEY `orders_coupon_id_index` (`coupon_id`);

--
-- Indexes for table `order_downloads`
--
ALTER TABLE `order_downloads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_downloads_order_id_foreign` (`order_id`),
  ADD KEY `order_downloads_file_id_foreign` (`file_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_products_order_id_foreign` (`order_id`),
  ADD KEY `order_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `order_product_options`
--
ALTER TABLE `order_product_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_product_options_order_product_id_option_id_unique` (`order_product_id`,`option_id`),
  ADD KEY `order_product_options_option_id_foreign` (`option_id`);

--
-- Indexes for table `order_product_option_values`
--
ALTER TABLE `order_product_option_values`
  ADD PRIMARY KEY (`order_product_option_id`,`option_value_id`),
  ADD KEY `order_product_option_values_option_value_id_foreign` (`option_value_id`);

--
-- Indexes for table `order_taxes`
--
ALTER TABLE `order_taxes`
  ADD PRIMARY KEY (`order_id`,`tax_rate_id`),
  ADD KEY `order_taxes_tax_rate_id_foreign` (`tax_rate_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `page_translations`
--
ALTER TABLE `page_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `page_translations_page_id_locale_unique` (`page_id`,`locale`);

--
-- Indexes for table `persistences`
--
ALTER TABLE `persistences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `persistences_code_unique` (`code`),
  ADD KEY `persistences_user_id_foreign` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_attributes_product_id_index` (`product_id`),
  ADD KEY `product_attributes_attribute_id_index` (`attribute_id`);

--
-- Indexes for table `product_attribute_values`
--
ALTER TABLE `product_attribute_values`
  ADD PRIMARY KEY (`product_attribute_id`,`attribute_value_id`),
  ADD KEY `product_attribute_values_attribute_value_id_foreign` (`attribute_value_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `product_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_options`
--
ALTER TABLE `product_options`
  ADD PRIMARY KEY (`product_id`,`option_id`),
  ADD KEY `product_options_option_id_foreign` (`option_id`);

--
-- Indexes for table `product_tags`
--
ALTER TABLE `product_tags`
  ADD PRIMARY KEY (`product_id`,`tag_id`),
  ADD KEY `product_tags_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `product_translations`
--
ALTER TABLE `product_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_translations_product_id_locale_unique` (`product_id`,`locale`);
ALTER TABLE `product_translations` ADD FULLTEXT KEY `name` (`name`);

--
-- Indexes for table `related_products`
--
ALTER TABLE `related_products`
  ADD PRIMARY KEY (`product_id`,`related_product_id`),
  ADD KEY `related_products_related_product_id_foreign` (`related_product_id`);

--
-- Indexes for table `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reminders_user_id_foreign` (`user_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_reviewer_id_index` (`reviewer_id`),
  ADD KEY `reviews_product_id_index` (`product_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_translations`
--
ALTER TABLE `role_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_translations_role_id_locale_unique` (`role_id`,`locale`);

--
-- Indexes for table `search_terms`
--
ALTER TABLE `search_terms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `search_terms_term_unique` (`term`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `setting_translations`
--
ALTER TABLE `setting_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_translations_setting_id_locale_unique` (`setting_id`,`locale`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider_slides`
--
ALTER TABLE `slider_slides`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slider_slides_slider_id_foreign` (`slider_id`);

--
-- Indexes for table `slider_slide_translations`
--
ALTER TABLE `slider_slide_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slider_slide_translations_slider_slide_id_locale_unique` (`slider_slide_id`,`locale`);

--
-- Indexes for table `slider_translations`
--
ALTER TABLE `slider_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slider_translations_slider_id_locale_unique` (`slider_id`,`locale`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_slug_unique` (`slug`);

--
-- Indexes for table `tag_translations`
--
ALTER TABLE `tag_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tag_translations_tag_id_locale_unique` (`tag_id`,`locale`);

--
-- Indexes for table `tax_classes`
--
ALTER TABLE `tax_classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax_class_translations`
--
ALTER TABLE `tax_class_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tax_class_translations_tax_class_id_locale_unique` (`tax_class_id`,`locale`);

--
-- Indexes for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tax_rates_tax_class_id_index` (`tax_class_id`);

--
-- Indexes for table `tax_rate_translations`
--
ALTER TABLE `tax_rate_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tax_rate_translations_tax_rate_id_locale_unique` (`tax_rate_id`,`locale`);

--
-- Indexes for table `throttle`
--
ALTER TABLE `throttle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `throttle_user_id_foreign` (`user_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transactions_order_id_unique` (`order_id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_key_index` (`key`);

--
-- Indexes for table `translation_translations`
--
ALTER TABLE `translation_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translation_translations_translation_id_locale_unique` (`translation_id`,`locale`);

--
-- Indexes for table `updater_scripts`
--
ALTER TABLE `updater_scripts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `up_sell_products`
--
ALTER TABLE `up_sell_products`
  ADD PRIMARY KEY (`product_id`,`up_sell_product_id`),
  ADD KEY `up_sell_products_up_sell_product_id_foreign` (`up_sell_product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_role_id_foreign` (`role_id`);

--
-- Indexes for table `wish_lists`
--
ALTER TABLE `wish_lists`
  ADD PRIMARY KEY (`user_id`,`product_id`),
  ADD KEY `wish_lists_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activations`
--
ALTER TABLE `activations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `attribute_sets`
--
ALTER TABLE `attribute_sets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attribute_set_translations`
--
ALTER TABLE `attribute_set_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attribute_translations`
--
ALTER TABLE `attribute_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `attribute_value_translations`
--
ALTER TABLE `attribute_value_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `brand_translations`
--
ALTER TABLE `brand_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `category_translations`
--
ALTER TABLE `category_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupon_translations`
--
ALTER TABLE `coupon_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currency_rates`
--
ALTER TABLE `currency_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `default_addresses`
--
ALTER TABLE `default_addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `entity_files`
--
ALTER TABLE `entity_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=380;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=286;

--
-- AUTO_INCREMENT for table `flash_sales`
--
ALTER TABLE `flash_sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_sale_products`
--
ALTER TABLE `flash_sale_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_sale_translations`
--
ALTER TABLE `flash_sale_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `menu_item_translations`
--
ALTER TABLE `menu_item_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `menu_translations`
--
ALTER TABLE `menu_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `meta_data`
--
ALTER TABLE `meta_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `meta_data_translations`
--
ALTER TABLE `meta_data_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `option_translations`
--
ALTER TABLE `option_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `option_values`
--
ALTER TABLE `option_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `option_value_translations`
--
ALTER TABLE `option_value_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_downloads`
--
ALTER TABLE `order_downloads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_product_options`
--
ALTER TABLE `order_product_options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `page_translations`
--
ALTER TABLE `page_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `persistences`
--
ALTER TABLE `persistences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=771;

--
-- AUTO_INCREMENT for table `product_translations`
--
ALTER TABLE `product_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `reminders`
--
ALTER TABLE `reminders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `role_translations`
--
ALTER TABLE `role_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `search_terms`
--
ALTER TABLE `search_terms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=336;

--
-- AUTO_INCREMENT for table `setting_translations`
--
ALTER TABLE `setting_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `slider_slides`
--
ALTER TABLE `slider_slides`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `slider_slide_translations`
--
ALTER TABLE `slider_slide_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `slider_translations`
--
ALTER TABLE `slider_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tag_translations`
--
ALTER TABLE `tag_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tax_classes`
--
ALTER TABLE `tax_classes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_class_translations`
--
ALTER TABLE `tax_class_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_rates`
--
ALTER TABLE `tax_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_rate_translations`
--
ALTER TABLE `tax_rate_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `throttle`
--
ALTER TABLE `throttle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translation_translations`
--
ALTER TABLE `translation_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `updater_scripts`
--
ALTER TABLE `updater_scripts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activations`
--
ALTER TABLE `activations`
  ADD CONSTRAINT `activations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attributes`
--
ALTER TABLE `attributes`
  ADD CONSTRAINT `attributes_attribute_set_id_foreign` FOREIGN KEY (`attribute_set_id`) REFERENCES `attribute_sets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_categories`
--
ALTER TABLE `attribute_categories`
  ADD CONSTRAINT `attribute_categories_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attribute_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_set_translations`
--
ALTER TABLE `attribute_set_translations`
  ADD CONSTRAINT `attribute_set_translations_attribute_set_id_foreign` FOREIGN KEY (`attribute_set_id`) REFERENCES `attribute_sets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_translations`
--
ALTER TABLE `attribute_translations`
  ADD CONSTRAINT `attribute_translations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD CONSTRAINT `attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_value_translations`
--
ALTER TABLE `attribute_value_translations`
  ADD CONSTRAINT `attribute_value_translations_attribute_value_id_foreign` FOREIGN KEY (`attribute_value_id`) REFERENCES `attribute_values` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coupon_categories`
--
ALTER TABLE `coupon_categories`
  ADD CONSTRAINT `coupon_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `coupon_categories_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coupon_products`
--
ALTER TABLE `coupon_products`
  ADD CONSTRAINT `coupon_products_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `coupon_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coupon_translations`
--
ALTER TABLE `coupon_translations`
  ADD CONSTRAINT `coupon_translations_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cross_sell_products`
--
ALTER TABLE `cross_sell_products`
  ADD CONSTRAINT `cross_sell_products_cross_sell_product_id_foreign` FOREIGN KEY (`cross_sell_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cross_sell_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `default_addresses`
--
ALTER TABLE `default_addresses`
  ADD CONSTRAINT `default_addresses_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `default_addresses_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `entity_files`
--
ALTER TABLE `entity_files`
  ADD CONSTRAINT `entity_files_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flash_sale_products`
--
ALTER TABLE `flash_sale_products`
  ADD CONSTRAINT `flash_sale_products_flash_sale_id_foreign` FOREIGN KEY (`flash_sale_id`) REFERENCES `flash_sales` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flash_sale_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flash_sale_product_orders`
--
ALTER TABLE `flash_sale_product_orders`
  ADD CONSTRAINT `flash_sale_product_orders_flash_sale_product_id_foreign` FOREIGN KEY (`flash_sale_product_id`) REFERENCES `flash_sale_products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flash_sale_product_orders_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flash_sale_translations`
--
ALTER TABLE `flash_sale_translations`
  ADD CONSTRAINT `flash_sale_translations_flash_sale_id_foreign` FOREIGN KEY (`flash_sale_id`) REFERENCES `flash_sales` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `menu_items_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `menu_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menu_item_translations`
--
ALTER TABLE `menu_item_translations`
  ADD CONSTRAINT `menu_item_translations_menu_item_id_foreign` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menu_translations`
--
ALTER TABLE `menu_translations`
  ADD CONSTRAINT `menu_translations_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `meta_data_translations`
--
ALTER TABLE `meta_data_translations`
  ADD CONSTRAINT `meta_data_translations_meta_data_id_foreign` FOREIGN KEY (`meta_data_id`) REFERENCES `meta_data` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `option_translations`
--
ALTER TABLE `option_translations`
  ADD CONSTRAINT `option_translations_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `option_values`
--
ALTER TABLE `option_values`
  ADD CONSTRAINT `option_values_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `option_value_translations`
--
ALTER TABLE `option_value_translations`
  ADD CONSTRAINT `option_value_translations_option_value_id_foreign` FOREIGN KEY (`option_value_id`) REFERENCES `option_values` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_downloads`
--
ALTER TABLE `order_downloads`
  ADD CONSTRAINT `order_downloads_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_downloads_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_product_options`
--
ALTER TABLE `order_product_options`
  ADD CONSTRAINT `order_product_options_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_product_options_order_product_id_foreign` FOREIGN KEY (`order_product_id`) REFERENCES `order_products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_product_option_values`
--
ALTER TABLE `order_product_option_values`
  ADD CONSTRAINT `order_product_option_values_option_value_id_foreign` FOREIGN KEY (`option_value_id`) REFERENCES `option_values` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_product_option_values_order_product_option_id_foreign` FOREIGN KEY (`order_product_option_id`) REFERENCES `order_product_options` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_taxes`
--
ALTER TABLE `order_taxes`
  ADD CONSTRAINT `order_taxes_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_taxes_tax_rate_id_foreign` FOREIGN KEY (`tax_rate_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `page_translations`
--
ALTER TABLE `page_translations`
  ADD CONSTRAINT `page_translations_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `persistences`
--
ALTER TABLE `persistences`
  ADD CONSTRAINT `persistences_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD CONSTRAINT `product_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_attribute_values`
--
ALTER TABLE `product_attribute_values`
  ADD CONSTRAINT `product_attribute_values_attribute_value_id_foreign` FOREIGN KEY (`attribute_value_id`) REFERENCES `attribute_values` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_attribute_values_product_attribute_id_foreign` FOREIGN KEY (`product_attribute_id`) REFERENCES `product_attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_options`
--
ALTER TABLE `product_options`
  ADD CONSTRAINT `product_options_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_tags`
--
ALTER TABLE `product_tags`
  ADD CONSTRAINT `product_tags_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_translations`
--
ALTER TABLE `product_translations`
  ADD CONSTRAINT `product_translations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `related_products`
--
ALTER TABLE `related_products`
  ADD CONSTRAINT `related_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `related_products_related_product_id_foreign` FOREIGN KEY (`related_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reminders`
--
ALTER TABLE `reminders`
  ADD CONSTRAINT `reminders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_translations`
--
ALTER TABLE `role_translations`
  ADD CONSTRAINT `role_translations_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `setting_translations`
--
ALTER TABLE `setting_translations`
  ADD CONSTRAINT `setting_translations_setting_id_foreign` FOREIGN KEY (`setting_id`) REFERENCES `settings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `slider_slides`
--
ALTER TABLE `slider_slides`
  ADD CONSTRAINT `slider_slides_slider_id_foreign` FOREIGN KEY (`slider_id`) REFERENCES `sliders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `slider_slide_translations`
--
ALTER TABLE `slider_slide_translations`
  ADD CONSTRAINT `slider_slide_translations_slider_slide_id_foreign` FOREIGN KEY (`slider_slide_id`) REFERENCES `slider_slides` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `slider_translations`
--
ALTER TABLE `slider_translations`
  ADD CONSTRAINT `slider_translations_slider_id_foreign` FOREIGN KEY (`slider_id`) REFERENCES `sliders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tag_translations`
--
ALTER TABLE `tag_translations`
  ADD CONSTRAINT `tag_translations_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tax_class_translations`
--
ALTER TABLE `tax_class_translations`
  ADD CONSTRAINT `tax_class_translations_tax_class_id_foreign` FOREIGN KEY (`tax_class_id`) REFERENCES `tax_classes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD CONSTRAINT `tax_rates_tax_class_id_foreign` FOREIGN KEY (`tax_class_id`) REFERENCES `tax_classes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tax_rate_translations`
--
ALTER TABLE `tax_rate_translations`
  ADD CONSTRAINT `tax_rate_translations_tax_rate_id_foreign` FOREIGN KEY (`tax_rate_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `throttle`
--
ALTER TABLE `throttle`
  ADD CONSTRAINT `throttle_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `translation_translations`
--
ALTER TABLE `translation_translations`
  ADD CONSTRAINT `translation_translations_translation_id_foreign` FOREIGN KEY (`translation_id`) REFERENCES `translations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `up_sell_products`
--
ALTER TABLE `up_sell_products`
  ADD CONSTRAINT `up_sell_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `up_sell_products_up_sell_product_id_foreign` FOREIGN KEY (`up_sell_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wish_lists`
--
ALTER TABLE `wish_lists`
  ADD CONSTRAINT `wish_lists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wish_lists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
