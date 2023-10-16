-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 16, 2023 at 01:07 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `workers`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Ahmed Abdellah Nour Eldin', 'ahmed.abdellah664@gmail.com', '$2y$10$s98fD2OeQ/CRPkb33L1.Yurgwwt8AAWO9LOLT3oG11qCVP28dzNKa', '2023-10-12 13:05:24', '2023-10-12 13:05:24');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `name`, `email`, `password`, `photo`, `created_at`, `updated_at`) VALUES
(1, 'first client', 'firstClient@gmail.com', '$2y$10$vEXDESr8cc2KEGRTQA.lAui3Bsv0lBmbmE1/rCLRDhSHBccGXFzE.', 'client/RjxmVLzDpVt9RW2ZBYrz7MmTYmHklZNSco0ltscP.jpg', '2023-10-12 13:07:10', '2023-10-12 13:07:10');

-- --------------------------------------------------------

--
-- Table structure for table `client_orders`
--

CREATE TABLE `client_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('pending','accepted','rejected') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_orders`
--

INSERT INTO `client_orders` (`id`, `post_id`, `client_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'accepted', '2023-10-12 13:15:58', '2023-10-12 13:25:38');

-- --------------------------------------------------------

--
-- Table structure for table `db_alerts`
--

CREATE TABLE `db_alerts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `alert` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2023_04_15_205626_create_db_alerts_table', 1),
(5, '2023_09_30_195112_create_admins_table', 1),
(6, '2023_10_02_190131_create_workers_table', 1),
(7, '2023_10_02_190200_create_clients_table', 1),
(8, '2023_10_03_112042_add_status_to_workers_table', 1),
(9, '2023_10_03_195816_add_verification_token_to_workers_table', 1),
(10, '2023_10_08_074652_create_posts_table', 1),
(11, '2023_10_08_081556_create_post_photos_table', 1),
(12, '2023_10_09_064030_create_notifications_table', 1),
(13, '2023_10_10_183939_create_client_orders_table', 1),
(14, '2023_10_12_165714_create_worker_reviews_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('19b24e9a-3e8d-417c-bec2-92a5077c17ea', 'App\\Notifications\\AdminPost', 'App\\Models\\Worker', 1, '{\"worker\":{\"id\":1,\"name\":\"Ahmed Abdellah\",\"email\":\"ahmed.abdellah664@gmail.com\",\"phone\":\"1141371812\",\"photo\":\"worker\\/5OAtGuUCnQT6Q6v4NzGPW6z0uSlfZXSn4oMIXSAx.jpg\",\"location\":\"sohag\",\"created_at\":\"2023-10-12T16:04:00.000000Z\",\"updated_at\":\"2023-10-12T16:05:58.000000Z\",\"status\":1,\"verification_token\":null,\"verified_at\":\"2023-10-12 16:05:58\"},\"post\":{\"id\":2,\"worker_id\":1,\"content\":\"learn Javascript in three hours\",\"price\":\"475.00\",\"status\":\"rejected\",\"rejected_reason\":\"this post not fact\",\"created_at\":\"2023-10-12T16:09:03.000000Z\",\"updated_at\":\"2023-10-12T16:12:12.000000Z\",\"worker\":{\"id\":1,\"name\":\"Ahmed Abdellah\",\"email\":\"ahmed.abdellah664@gmail.com\",\"phone\":\"1141371812\",\"photo\":\"worker\\/5OAtGuUCnQT6Q6v4NzGPW6z0uSlfZXSn4oMIXSAx.jpg\",\"location\":\"sohag\",\"created_at\":\"2023-10-12T16:04:00.000000Z\",\"updated_at\":\"2023-10-12T16:05:58.000000Z\",\"status\":1,\"verification_token\":null,\"verified_at\":\"2023-10-12 16:05:58\"}}}', NULL, '2023-10-12 13:12:12', '2023-10-12 13:12:12'),
('24def190-5e44-4ca6-b0f5-f3940c22395c', 'App\\Notifications\\AdminPost', 'App\\Models\\Worker', 2, '{\"worker\":{\"id\":2,\"name\":\"Hager Abdellah\",\"email\":\"Hager.abdellah664@gmail.com\",\"phone\":\"1141371812\",\"photo\":\"worker\\/r5yeoEQezxbrj3C5PcPH5JAnW3oDoe5Z5tgiL6LH.jpg\",\"location\":\"Alexandrea\",\"created_at\":\"2023-10-15T08:59:59.000000Z\",\"updated_at\":\"2023-10-15T09:00:48.000000Z\",\"status\":1,\"verification_token\":null,\"verified_at\":\"2023-10-15 09:00:48\"},\"post\":{\"id\":6,\"worker_id\":2,\"content\":\"learn French\'s js in three hours\",\"price\":\"807.50\",\"status\":\"approved\",\"rejected_reason\":null,\"created_at\":\"2023-10-15T09:03:47.000000Z\",\"updated_at\":\"2023-10-15T09:04:13.000000Z\",\"worker\":{\"id\":2,\"name\":\"Hager Abdellah\",\"email\":\"Hager.abdellah664@gmail.com\",\"phone\":\"1141371812\",\"photo\":\"worker\\/r5yeoEQezxbrj3C5PcPH5JAnW3oDoe5Z5tgiL6LH.jpg\",\"location\":\"Alexandrea\",\"created_at\":\"2023-10-15T08:59:59.000000Z\",\"updated_at\":\"2023-10-15T09:00:48.000000Z\",\"status\":1,\"verification_token\":null,\"verified_at\":\"2023-10-15 09:00:48\"}}}', NULL, '2023-10-15 06:04:13', '2023-10-15 06:04:13'),
('2a8bb193-6a76-4901-af47-2f0eaf68b5f7', 'App\\Notifications\\AdminPost', 'App\\Models\\Worker', 1, '{\"worker\":{\"id\":1,\"name\":\"Ahmed Abdellah\",\"email\":\"ahmed.abdellah664@gmail.com\",\"phone\":\"1141371812\",\"photo\":\"worker\\/5OAtGuUCnQT6Q6v4NzGPW6z0uSlfZXSn4oMIXSAx.jpg\",\"location\":\"sohag\",\"created_at\":\"2023-10-12T16:04:00.000000Z\",\"updated_at\":\"2023-10-12T16:05:58.000000Z\",\"status\":1,\"verification_token\":null,\"verified_at\":\"2023-10-12 16:05:58\"},\"post\":{\"id\":4,\"worker_id\":1,\"content\":\"learn react js in three hours\",\"price\":\"712.50\",\"status\":\"approved\",\"rejected_reason\":null,\"created_at\":\"2023-10-15T08:53:56.000000Z\",\"updated_at\":\"2023-10-15T08:58:03.000000Z\",\"worker\":{\"id\":1,\"name\":\"Ahmed Abdellah\",\"email\":\"ahmed.abdellah664@gmail.com\",\"phone\":\"1141371812\",\"photo\":\"worker\\/5OAtGuUCnQT6Q6v4NzGPW6z0uSlfZXSn4oMIXSAx.jpg\",\"location\":\"sohag\",\"created_at\":\"2023-10-12T16:04:00.000000Z\",\"updated_at\":\"2023-10-12T16:05:58.000000Z\",\"status\":1,\"verification_token\":null,\"verified_at\":\"2023-10-12 16:05:58\"}}}', NULL, '2023-10-15 05:58:03', '2023-10-15 05:58:03'),
('2bf4c6e8-64fd-4306-ba00-ed41dfcea8f4', 'App\\Notifications\\AdminPost', 'App\\Models\\Worker', 2, '{\"worker\":{\"id\":2,\"name\":\"Hager Abdellah\",\"email\":\"Hager.abdellah664@gmail.com\",\"phone\":\"1141371812\",\"photo\":\"worker\\/r5yeoEQezxbrj3C5PcPH5JAnW3oDoe5Z5tgiL6LH.jpg\",\"location\":\"Alexandrea\",\"created_at\":\"2023-10-15T08:59:59.000000Z\",\"updated_at\":\"2023-10-15T09:00:48.000000Z\",\"status\":1,\"verification_token\":null,\"verified_at\":\"2023-10-15 09:00:48\"},\"post\":{\"id\":5,\"worker_id\":2,\"content\":\"learn English js in three hours\",\"price\":\"812.25\",\"status\":\"approved\",\"rejected_reason\":null,\"created_at\":\"2023-10-15T09:03:21.000000Z\",\"updated_at\":\"2023-10-15T09:04:07.000000Z\",\"worker\":{\"id\":2,\"name\":\"Hager Abdellah\",\"email\":\"Hager.abdellah664@gmail.com\",\"phone\":\"1141371812\",\"photo\":\"worker\\/r5yeoEQezxbrj3C5PcPH5JAnW3oDoe5Z5tgiL6LH.jpg\",\"location\":\"Alexandrea\",\"created_at\":\"2023-10-15T08:59:59.000000Z\",\"updated_at\":\"2023-10-15T09:00:48.000000Z\",\"status\":1,\"verification_token\":null,\"verified_at\":\"2023-10-15 09:00:48\"}}}', NULL, '2023-10-15 06:04:07', '2023-10-15 06:04:07'),
('2e4644a9-4827-4b57-9460-7f91691429f0', 'App\\Notifications\\AdminPost', 'App\\Models\\Worker', 1, '{\"worker\":{\"id\":1,\"name\":\"Ahmed Abdellah\",\"email\":\"ahmed.abdellah664@gmail.com\",\"phone\":\"1141371812\",\"photo\":\"worker\\/5OAtGuUCnQT6Q6v4NzGPW6z0uSlfZXSn4oMIXSAx.jpg\",\"location\":\"sohag\",\"created_at\":\"2023-10-12T16:04:00.000000Z\",\"updated_at\":\"2023-10-12T16:05:58.000000Z\",\"status\":1,\"verification_token\":null,\"verified_at\":\"2023-10-12 16:05:58\"},\"post\":{\"id\":4,\"worker_id\":1,\"content\":\"learn react js in three hours\",\"price\":\"712.50\",\"status\":\"approved\",\"rejected_reason\":null,\"created_at\":\"2023-10-15T08:53:56.000000Z\",\"updated_at\":\"2023-10-15T08:58:03.000000Z\",\"worker\":{\"id\":1,\"name\":\"Ahmed Abdellah\",\"email\":\"ahmed.abdellah664@gmail.com\",\"phone\":\"1141371812\",\"photo\":\"worker\\/5OAtGuUCnQT6Q6v4NzGPW6z0uSlfZXSn4oMIXSAx.jpg\",\"location\":\"sohag\",\"created_at\":\"2023-10-12T16:04:00.000000Z\",\"updated_at\":\"2023-10-12T16:05:58.000000Z\",\"status\":1,\"verification_token\":null,\"verified_at\":\"2023-10-12 16:05:58\"}}}', NULL, '2023-10-15 06:03:55', '2023-10-15 06:03:55'),
('5bef7dce-bc10-4f67-a64b-b04ae2e96a67', 'App\\Notifications\\AdminPost', 'App\\Models\\Admin', 1, '{\"worker\":{\"id\":2,\"name\":\"Hager Abdellah\",\"email\":\"Hager.abdellah664@gmail.com\",\"phone\":\"1141371812\",\"photo\":\"worker\\/r5yeoEQezxbrj3C5PcPH5JAnW3oDoe5Z5tgiL6LH.jpg\",\"location\":\"Alexandrea\",\"created_at\":\"2023-10-15T08:59:59.000000Z\",\"updated_at\":\"2023-10-15T09:00:48.000000Z\",\"status\":1,\"verification_token\":null,\"verified_at\":\"2023-10-15 09:00:48\"},\"post\":{\"content\":\"learn English js in three hours\",\"price\":812.25,\"worker_id\":2,\"status\":\"pending\",\"updated_at\":\"2023-10-15T09:03:21.000000Z\",\"created_at\":\"2023-10-15T09:03:21.000000Z\",\"id\":5}}', NULL, '2023-10-15 06:03:21', '2023-10-15 06:03:21'),
('94b9b190-24b5-4576-b159-ba543fa61d65', 'App\\Notifications\\AdminPost', 'App\\Models\\Admin', 1, '{\"worker\":{\"id\":1,\"name\":\"Ahmed Abdellah\",\"email\":\"ahmed.abdellah664@gmail.com\",\"phone\":\"1141371812\",\"photo\":\"worker\\/5OAtGuUCnQT6Q6v4NzGPW6z0uSlfZXSn4oMIXSAx.jpg\",\"location\":\"sohag\",\"created_at\":\"2023-10-12T16:04:00.000000Z\",\"updated_at\":\"2023-10-12T16:05:58.000000Z\",\"status\":1,\"verification_token\":null,\"verified_at\":\"2023-10-12 16:05:58\"},\"post\":{\"content\":\"learn php and  laravel in three hours\",\"price\":712.5,\"worker_id\":1,\"status\":\"pending\",\"updated_at\":\"2023-10-12T16:11:48.000000Z\",\"created_at\":\"2023-10-12T16:11:48.000000Z\",\"id\":3}}', NULL, '2023-10-12 13:11:48', '2023-10-12 13:11:48'),
('a3a509c6-40b6-407a-b876-f352bc14d718', 'App\\Notifications\\AdminPost', 'App\\Models\\Admin', 1, '{\"worker\":{\"id\":1,\"name\":\"Ahmed Abdellah\",\"email\":\"ahmed.abdellah664@gmail.com\",\"phone\":\"1141371812\",\"photo\":\"worker\\/5OAtGuUCnQT6Q6v4NzGPW6z0uSlfZXSn4oMIXSAx.jpg\",\"location\":\"sohag\",\"created_at\":\"2023-10-12T16:04:00.000000Z\",\"updated_at\":\"2023-10-12T16:05:58.000000Z\",\"status\":1,\"verification_token\":null,\"verified_at\":\"2023-10-12 16:05:58\"},\"post\":{\"content\":\"learn html in three hours\",\"price\":190,\"worker_id\":1,\"status\":\"pending\",\"updated_at\":\"2023-10-12T16:08:33.000000Z\",\"created_at\":\"2023-10-12T16:08:33.000000Z\",\"id\":1}}', NULL, '2023-10-12 13:08:34', '2023-10-12 13:08:34'),
('b8c38580-a5b2-4e86-b5a0-bc9064724523', 'App\\Notifications\\AdminPost', 'App\\Models\\Admin', 1, '{\"worker\":{\"id\":1,\"name\":\"Ahmed Abdellah\",\"email\":\"ahmed.abdellah664@gmail.com\",\"phone\":\"1141371812\",\"photo\":\"worker\\/5OAtGuUCnQT6Q6v4NzGPW6z0uSlfZXSn4oMIXSAx.jpg\",\"location\":\"sohag\",\"created_at\":\"2023-10-12T16:04:00.000000Z\",\"updated_at\":\"2023-10-12T16:05:58.000000Z\",\"status\":1,\"verification_token\":null,\"verified_at\":\"2023-10-12 16:05:58\"},\"post\":{\"content\":\"learn react js in three hours\",\"price\":712.5,\"worker_id\":1,\"status\":\"pending\",\"updated_at\":\"2023-10-15T08:53:56.000000Z\",\"created_at\":\"2023-10-15T08:53:56.000000Z\",\"id\":4}}', NULL, '2023-10-15 05:53:56', '2023-10-15 05:53:56'),
('bc3fdb81-23ae-47c5-946b-2e08683dd5ea', 'App\\Notifications\\AdminPost', 'App\\Models\\Worker', 1, '{\"worker\":{\"id\":1,\"name\":\"Ahmed Abdellah\",\"email\":\"ahmed.abdellah664@gmail.com\",\"phone\":\"1141371812\",\"photo\":\"worker\\/5OAtGuUCnQT6Q6v4NzGPW6z0uSlfZXSn4oMIXSAx.jpg\",\"location\":\"sohag\",\"created_at\":\"2023-10-12T16:04:00.000000Z\",\"updated_at\":\"2023-10-12T16:05:58.000000Z\",\"status\":1,\"verification_token\":null,\"verified_at\":\"2023-10-12 16:05:58\"},\"post\":{\"id\":2,\"worker_id\":1,\"content\":\"learn Javascript in three hours\",\"price\":\"475.00\",\"status\":\"approved\",\"rejected_reason\":null,\"created_at\":\"2023-10-12T16:09:03.000000Z\",\"updated_at\":\"2023-10-12T16:11:59.000000Z\",\"worker\":{\"id\":1,\"name\":\"Ahmed Abdellah\",\"email\":\"ahmed.abdellah664@gmail.com\",\"phone\":\"1141371812\",\"photo\":\"worker\\/5OAtGuUCnQT6Q6v4NzGPW6z0uSlfZXSn4oMIXSAx.jpg\",\"location\":\"sohag\",\"created_at\":\"2023-10-12T16:04:00.000000Z\",\"updated_at\":\"2023-10-12T16:05:58.000000Z\",\"status\":1,\"verification_token\":null,\"verified_at\":\"2023-10-12 16:05:58\"}}}', NULL, '2023-10-12 13:11:59', '2023-10-12 13:11:59'),
('dc40d44f-64de-476b-b3c6-27a5b03f1d08', 'App\\Notifications\\AdminPost', 'App\\Models\\Admin', 1, '{\"worker\":{\"id\":1,\"name\":\"Ahmed Abdellah\",\"email\":\"ahmed.abdellah664@gmail.com\",\"phone\":\"1141371812\",\"photo\":\"worker\\/5OAtGuUCnQT6Q6v4NzGPW6z0uSlfZXSn4oMIXSAx.jpg\",\"location\":\"sohag\",\"created_at\":\"2023-10-12T16:04:00.000000Z\",\"updated_at\":\"2023-10-12T16:05:58.000000Z\",\"status\":1,\"verification_token\":null,\"verified_at\":\"2023-10-12 16:05:58\"},\"post\":{\"content\":\"learn Javascript in three hours\",\"price\":475,\"worker_id\":1,\"status\":\"pending\",\"updated_at\":\"2023-10-12T16:09:03.000000Z\",\"created_at\":\"2023-10-12T16:09:03.000000Z\",\"id\":2}}', NULL, '2023-10-12 13:09:03', '2023-10-12 13:09:03'),
('f16e38e1-dd33-4530-87cf-5b875c6c3d77', 'App\\Notifications\\AdminPost', 'App\\Models\\Admin', 1, '{\"worker\":{\"id\":2,\"name\":\"Hager Abdellah\",\"email\":\"Hager.abdellah664@gmail.com\",\"phone\":\"1141371812\",\"photo\":\"worker\\/r5yeoEQezxbrj3C5PcPH5JAnW3oDoe5Z5tgiL6LH.jpg\",\"location\":\"Alexandrea\",\"created_at\":\"2023-10-15T08:59:59.000000Z\",\"updated_at\":\"2023-10-15T09:00:48.000000Z\",\"status\":1,\"verification_token\":null,\"verified_at\":\"2023-10-15 09:00:48\"},\"post\":{\"content\":\"learn French\'s js in three hours\",\"price\":807.5,\"worker_id\":2,\"status\":\"pending\",\"updated_at\":\"2023-10-15T09:03:47.000000Z\",\"created_at\":\"2023-10-15T09:03:47.000000Z\",\"id\":6}}', NULL, '2023-10-15 06:03:47', '2023-10-15 06:03:47'),
('fb62c8d6-04b9-49e2-814e-d5188273864d', 'App\\Notifications\\AdminPost', 'App\\Models\\Worker', 1, '{\"worker\":{\"id\":1,\"name\":\"Ahmed Abdellah\",\"email\":\"ahmed.abdellah664@gmail.com\",\"phone\":\"1141371812\",\"photo\":\"worker\\/5OAtGuUCnQT6Q6v4NzGPW6z0uSlfZXSn4oMIXSAx.jpg\",\"location\":\"sohag\",\"created_at\":\"2023-10-12T16:04:00.000000Z\",\"updated_at\":\"2023-10-12T16:05:58.000000Z\",\"status\":1,\"verification_token\":null,\"verified_at\":\"2023-10-12 16:05:58\"},\"post\":{\"id\":1,\"worker_id\":1,\"content\":\"learn html in three hours\",\"price\":\"190.00\",\"status\":\"approved\",\"rejected_reason\":null,\"created_at\":\"2023-10-12T16:08:33.000000Z\",\"updated_at\":\"2023-10-12T16:10:52.000000Z\",\"worker\":{\"id\":1,\"name\":\"Ahmed Abdellah\",\"email\":\"ahmed.abdellah664@gmail.com\",\"phone\":\"1141371812\",\"photo\":\"worker\\/5OAtGuUCnQT6Q6v4NzGPW6z0uSlfZXSn4oMIXSAx.jpg\",\"location\":\"sohag\",\"created_at\":\"2023-10-12T16:04:00.000000Z\",\"updated_at\":\"2023-10-12T16:05:58.000000Z\",\"status\":1,\"verification_token\":null,\"verified_at\":\"2023-10-12 16:05:58\"}}}', NULL, '2023-10-12 13:10:52', '2023-10-12 13:10:52');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `worker_id` bigint(20) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `rejected_reason` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `worker_id`, `content`, `price`, `status`, `rejected_reason`, `created_at`, `updated_at`) VALUES
(1, 1, 'learn html in three hours', '190.00', 'approved', NULL, '2023-10-12 13:08:33', '2023-10-12 13:10:52'),
(2, 1, 'learn Javascript in three hours', '475.00', 'approved', 'this post not fact', '2023-10-12 13:09:03', '2023-10-12 13:12:12'),
(3, 1, 'learn php and  laravel in three hours', '712.50', 'approved', NULL, '2023-10-12 13:11:48', '2023-10-12 13:11:48'),
(4, 1, 'learn react js in three hours', '712.50', 'approved', NULL, '2023-10-15 05:53:56', '2023-10-15 05:58:03'),
(7, 1, 'learn html in three hours', '190.00', 'pending', NULL, '2023-10-16 05:49:59', '2023-10-16 05:49:59'),
(8, 1, 'learn Javascript in three hours', '475.00', 'pending', NULL, '2023-10-16 05:49:59', '2023-10-16 05:49:59'),
(9, 1, 'learn php and  laravel in three hours', '712.50', 'pending', NULL, '2023-10-16 05:49:59', '2023-10-16 05:49:59'),
(10, 1, 'learn react js in three hours', '712.50', 'pending', NULL, '2023-10-16 05:49:59', '2023-10-16 05:49:59');

-- --------------------------------------------------------

--
-- Table structure for table `post_photos`
--

CREATE TABLE `post_photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `photo` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_photos`
--

INSERT INTO `post_photos` (`id`, `post_id`, `photo`, `created_at`, `updated_at`) VALUES
(1, 1, 'posts/BnzSmgrdsid4iz0SW8h57nzHiLhNJH9WP5DnLswt.jpg', '2023-10-12 13:08:33', '2023-10-12 13:08:33'),
(2, 2, 'posts/bCD1Et5r2SmzBU8VXpUQgxIeDvw8K9XgNMI6s06F.jpg', '2023-10-12 13:09:03', '2023-10-12 13:09:03'),
(3, 3, 'posts/tXN6ojqO0jT21hymaF1kavK14qMqqwYWBuE1v9Hy.jpg', '2023-10-12 13:11:48', '2023-10-12 13:11:48'),
(4, 4, 'posts/wIuIdgney79M5MNxNVAaoovmF87LMUWVZvWAWiFT.jpg', '2023-10-15 05:53:56', '2023-10-15 05:53:56');

-- --------------------------------------------------------

--
-- Table structure for table `workers`
--

CREATE TABLE `workers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `verification_token` varchar(255) DEFAULT NULL,
  `verified_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `workers`
--

INSERT INTO `workers` (`id`, `name`, `email`, `password`, `phone`, `photo`, `location`, `created_at`, `updated_at`, `status`, `verification_token`, `verified_at`) VALUES
(1, 'Ahmed Abdellah1', 'ahmed.abdellah664@gmail.com', '$2y$10$wWcUYk3VMFrU8k6rPAfFw.dBzqwb.klZPrDa3xyhKnQLs3vIo9Z6W', '41371812', 'workers/uo3t0wmoEoUgEw30m2NrMxmYeBjlNfgUcIMYQojI.jpg', 'sohag', '2023-10-12 13:04:00', '2023-10-15 16:22:13', 1, NULL, '2023-10-12 16:05:58'),
(2, 'Hager Abdellah', 'Hager.abdellah664@gmail.com', '$2y$10$G8Pv4cZ5J3oQ3b5beiz6/eqSqxVO/pQt6O6m6WE6qB3Fp.vxmUaNi', '1141371812', 'worker/r5yeoEQezxbrj3C5PcPH5JAnW3oDoe5Z5tgiL6LH.jpg', 'Alexandrea', '2023-10-15 05:59:59', '2023-10-15 06:00:48', 1, NULL, '2023-10-15 09:00:48');

-- --------------------------------------------------------

--
-- Table structure for table `worker_reviews`
--

CREATE TABLE `worker_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `rate` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `worker_reviews`
--

INSERT INTO `worker_reviews` (`id`, `post_id`, `client_id`, `comment`, `rate`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'good', 3, '2023-10-12 15:09:52', '2023-10-12 15:09:52'),
(2, 2, 1, 'very good', 4, '2023-10-15 09:45:55', '2023-10-15 09:45:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clients_email_unique` (`email`);

--
-- Indexes for table `client_orders`
--
ALTER TABLE `client_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_orders_post_id_foreign` (`post_id`),
  ADD KEY `client_orders_client_id_foreign` (`client_id`);

--
-- Indexes for table `db_alerts`
--
ALTER TABLE `db_alerts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_worker_id_foreign` (`worker_id`);

--
-- Indexes for table `post_photos`
--
ALTER TABLE `post_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_photos_post_id_foreign` (`post_id`);

--
-- Indexes for table `workers`
--
ALTER TABLE `workers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `workers_email_unique` (`email`);

--
-- Indexes for table `worker_reviews`
--
ALTER TABLE `worker_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `worker_reviews_post_id_foreign` (`post_id`),
  ADD KEY `worker_reviews_client_id_foreign` (`client_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `client_orders`
--
ALTER TABLE `client_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `db_alerts`
--
ALTER TABLE `db_alerts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `post_photos`
--
ALTER TABLE `post_photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `workers`
--
ALTER TABLE `workers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `worker_reviews`
--
ALTER TABLE `worker_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `client_orders`
--
ALTER TABLE `client_orders`
  ADD CONSTRAINT `client_orders_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `client_orders_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_worker_id_foreign` FOREIGN KEY (`worker_id`) REFERENCES `workers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_photos`
--
ALTER TABLE `post_photos`
  ADD CONSTRAINT `post_photos_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `worker_reviews`
--
ALTER TABLE `worker_reviews`
  ADD CONSTRAINT `worker_reviews_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `worker_reviews_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
