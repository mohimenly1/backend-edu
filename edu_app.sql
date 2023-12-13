-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2023 at 06:32 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `edu_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrators`
--

CREATE TABLE `administrators` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `administrators`
--

INSERT INTO `administrators` (`id`, `name`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'mohimen admin', '2023-10-10 23:31:48', '2023-10-10 23:31:48', 16),
(2, 'test admin', '2023-10-11 14:06:25', '2023-10-11 14:06:25', 17),
(3, 'test admin', '2023-10-13 02:07:30', '2023-10-13 02:07:30', 19);

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `answer` varchar(255) NOT NULL,
  `is_correct` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `question_id`, `answer`, `is_correct`, `created_at`, `updated_at`) VALUES
(1, 4, 'Paris', 0, '2023-10-18 13:43:39', '2023-10-18 13:43:39'),
(2, 5, '26', 0, '2023-10-18 13:55:40', '2023-10-18 13:55:40');

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
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`id`, `unit_id`, `user_id`, `name`, `content`, `note`, `created_at`, `updated_at`) VALUES
(23, 15, 16, 'Our School', 'Our School Content', 'Our School Note', '2023-10-15 19:51:46', '2023-10-15 19:51:46'),
(24, 16, 16, 'Around The World', 'Around The World Conent', 'Around The World Note', '2023-10-15 19:52:16', '2023-10-15 19:52:16'),
(25, 17, 16, 'Open Day', 'Open Day Content', 'Open Day Note', '2023-10-15 19:53:38', '2023-10-18 02:14:05'),
(26, 15, 16, 'Our Playground', 'Listen, Point And Say', 'Note Our Playground', '2023-10-18 03:39:28', '2023-10-18 03:39:28'),
(27, 15, 16, 'Playground Rules', 'Playground Rules Content', 'Playground Rules Note', '2023-10-18 03:41:46', '2023-10-18 03:41:46');

-- --------------------------------------------------------

--
-- Table structure for table `lesson_student`
--

CREATE TABLE `lesson_student` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lesson_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lesson_student`
--

INSERT INTO `lesson_student` (`id`, `lesson_id`, `student_id`, `created_at`, `updated_at`) VALUES
(6, 23, 10, NULL, NULL),
(9, 26, 10, NULL, NULL),
(10, 27, 10, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media_files`
--

CREATE TABLE `media_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lesson_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('mp3','video','image') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `file_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_files`
--

INSERT INTO `media_files` (`id`, `lesson_id`, `type`, `created_at`, `updated_at`, `file_name`) VALUES
(25, 23, 'image', '2023-10-15 19:51:46', '2023-10-15 19:51:46', 'media/CO04t1tPhLG3Xl2sob12dPdgrMy8Yed1FUUWU2yl.png'),
(26, 24, 'image', '2023-10-15 19:52:16', '2023-10-15 19:52:16', 'media/8jTQRNAPoAGkwBCaT6xCUOXAMwB6xIAh9gBZ1eY4.png'),
(27, 25, 'image', '2023-10-15 19:53:38', '2023-10-15 19:53:38', 'media/Or7VDiTXIoupjYCr0x7NjgRGITXoEWC8GExU8UmF.png'),
(31, 26, 'image', '2023-10-18 03:39:28', '2023-10-18 03:39:28', 'media/XRaQMA3hKQoUwZAJtjvyQSROPLmENDvMqx6dSQDs.png'),
(32, 27, 'image', '2023-10-18 03:41:46', '2023-10-18 03:41:46', 'media/cZWa9qz2aSnhpALSkZqd0jjXCsfWNPe8jiGzTpW9.png'),
(33, 23, 'image', '2023-10-18 08:55:26', '2023-10-18 08:55:26', 'media/xAeMNEztITYIWOQZQUhVJYWFAw7hHA0CvIQ3T4ye.png');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_10_08_034038_create_schools_table', 1),
(6, '2023_10_08_034448_create_students_table', 2),
(7, '2023_10_08_042348_create_teachers_table', 3),
(8, '2023_10_08_042447_create_administrators_table', 3),
(9, '2023_10_08_042535_create_units_table', 4),
(10, '2023_10_08_042921_create_lessons_table', 5),
(11, '2023_10_08_043155_create_student_lesson_table', 6),
(12, '2023_10_10_021202_add_role_to_table', 7),
(13, '2023_10_10_021359_add_user_id_to_table', 8),
(14, '2023_10_10_021513_add_user_id_to_table', 8),
(15, '2023_10_10_021520_add_user_id_to_table', 8),
(16, '2023_10_10_225534_add_description_to_table', 9),
(17, '2023_10_10_225659_add_description_to_table', 10),
(18, '2023_10_10_225757_add_audio_to_table', 11),
(19, '2023_10_11_163846_add_user_id_column_to_units_table', 12),
(20, '2023_10_11_170813_create_units_table', 13),
(21, '2023_10_11_230022_drop_table_lessons', 14),
(22, '2023_10_11_230232_create_lessons_table', 15),
(23, '2023_10_11_231506_create_media_files', 16),
(24, '2023_10_11_234254_add_file_name_column_to_media_files_table', 17),
(25, '2023_10_14_035522_add_phone_number_to_students_table', 18),
(26, '2023_10_14_164737_create_student_unit_lesson_media_file_table', 19),
(27, '2023_10_15_002031_drop_fk_mdeia_file_in_student_unit_lesson_media_file_table', 20),
(28, '2023_10_15_002156_drop_fk_mdeia_file_in_student_unit_lesson_media_file_table', 21),
(29, '2023_10_15_003830_create_student_unit_table', 22),
(30, '2023_10_15_004208_create_lesson_student_table', 23),
(31, '2023_10_15_004507_drop_lesson_student_table', 24),
(32, '2023_10_15_004613_drop_student_unit_table', 25),
(33, '2023_10_15_004716_create_student_unit_table', 26),
(34, '2023_10_15_004757_create_lesson_student_table', 27),
(35, '2023_10_18_125158_create_questions_table', 28),
(36, '2023_10_18_125340_create_answers_table', 29);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
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

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 12, 'Student', 'e58ed6b0bced85145ad09cdabe1ddd2db27ee3ab0e7258bc825fa041a5b68c89', '[\"*\"]', NULL, NULL, '2023-10-10 01:30:04', '2023-10-10 01:30:04'),
(2, 'App\\Models\\User', 14, 'Student', '396206b52badcb71bbf5343fd48ff636d8bc2cb7e3d4d97c263dc461f56e3e50', '[\"*\"]', NULL, NULL, '2023-10-10 13:28:50', '2023-10-10 13:28:50'),
(3, 'App\\Models\\User', 15, 'Student', '70039dfa59ae07fe0209c22b945bf1f1806c7ab9feca331688ce6d480197b46b', '[\"*\"]', NULL, NULL, '2023-10-10 13:35:51', '2023-10-10 13:35:51'),
(4, 'App\\Models\\User', 15, 'Student', '8e59763f380913d36df7d8652ab02bcd4dbc4987e1e9b3d2b5f633e9186a9f16', '[\"*\"]', NULL, NULL, '2023-10-10 13:36:23', '2023-10-10 13:36:23'),
(5, 'App\\Models\\User', 15, 'Student', '6d500a6485a4f28acda6d569217dae5eaeb574cb9ef3c08bd3031d1c3d715ac9', '[\"*\"]', NULL, NULL, '2023-10-10 13:36:38', '2023-10-10 13:36:38'),
(6, 'App\\Models\\User', 15, 'Student', 'a935c2447d028d9df0bef6a230f303640339f7ad3964eaa7fb1c538a1558d91e', '[\"*\"]', NULL, NULL, '2023-10-10 15:28:28', '2023-10-10 15:28:28'),
(7, 'App\\Models\\User', 15, 'Student', '54d0c904babc6c224d9cbf5ee118eea860571ecc42bdbd44fae7197dbe94e258', '[\"*\"]', NULL, NULL, '2023-10-10 15:31:22', '2023-10-10 15:31:22'),
(8, 'App\\Models\\User', 15, 'Student', '2a418d21dd0b2e9627f5f1d8af83e1a3b7600b49cf4ffa0f66da608753dbad8f', '[\"*\"]', NULL, NULL, '2023-10-10 15:32:34', '2023-10-10 15:32:34'),
(9, 'App\\Models\\User', 15, 'Student', '82e615cc0aefe62ef7537cf35080acd35259b460ef99ce9e048d5aa4d1a92e7d', '[\"*\"]', NULL, NULL, '2023-10-10 15:33:31', '2023-10-10 15:33:31'),
(10, 'App\\Models\\User', 15, 'Student', '6fde21be71972df25a56dad93d74ed1bf34f0a3d5ffb3ab270d3e5d215cffeb8', '[\"*\"]', NULL, NULL, '2023-10-10 15:40:45', '2023-10-10 15:40:45'),
(11, 'App\\Models\\User', 15, 'Student', '5f6957c4f04629a30d223a4926696062f544c7642253421ae7afc3fb533f3f36', '[\"*\"]', NULL, NULL, '2023-10-10 15:42:18', '2023-10-10 15:42:18'),
(12, 'App\\Models\\User', 15, 'Student', 'b26e0cd8d25e1a58c8c22a19210a23180d55155854d70053f90497906eec414b', '[\"*\"]', NULL, NULL, '2023-10-10 15:52:09', '2023-10-10 15:52:09'),
(13, 'App\\Models\\User', 15, 'Student', '63e6f4a312a99ddf1c4eedc1d2cead053263f9111f5f27680dc3e87d7d95dd14', '[\"*\"]', NULL, NULL, '2023-10-10 15:55:50', '2023-10-10 15:55:50'),
(14, 'App\\Models\\User', 15, 'Student', '782c05e79af4bf165f1d99356184a2dedc7fb3b3ff7dae33c4d635bee117aa68', '[\"*\"]', NULL, NULL, '2023-10-10 15:56:23', '2023-10-10 15:56:23'),
(15, 'App\\Models\\User', 15, 'Student', '5790d3df2b4d99cda685d7c1ad52135cec65d0fa8cfb06e2d72478b50f56f762', '[\"*\"]', NULL, NULL, '2023-10-10 15:56:57', '2023-10-10 15:56:57'),
(16, 'App\\Models\\User', 15, 'Student', '427146c5c2236ac3eaea2a9aaf6e25725a146cc4de8651a4e52986906fc83567', '[\"*\"]', NULL, NULL, '2023-10-10 15:57:13', '2023-10-10 15:57:13'),
(17, 'App\\Models\\User', 15, 'Student', 'bf73abc209304a90723f683ccda35e25efd772dc617ece8b7b46bc0c3bc02aae', '[\"*\"]', NULL, NULL, '2023-10-10 15:57:42', '2023-10-10 15:57:42'),
(18, 'App\\Models\\User', 15, 'Student', 'b46ced2ddaf2821f572fc52da9e9b92daca576bfafcdab68008aba3c069aafdc', '[\"*\"]', NULL, NULL, '2023-10-10 15:58:28', '2023-10-10 15:58:28'),
(19, 'App\\Models\\User', 15, 'Student', 'f9fa77b72dd2bfe538381e9f7bfdd136555ebf73c23debf2e10c26648148064b', '[\"*\"]', NULL, NULL, '2023-10-10 15:59:38', '2023-10-10 15:59:38'),
(20, 'App\\Models\\User', 15, 'Student', 'eb23fa35a911e0f586cbcae2ba5af698a3be63e2dd569508ecc4707cf1afcb0d', '[\"*\"]', NULL, NULL, '2023-10-10 16:00:05', '2023-10-10 16:00:05'),
(21, 'App\\Models\\User', 15, 'Student', '568ab3e8736293801bbd9b9e932b6c1c92974eb98749a06cfe202493a3e8c1a8', '[\"*\"]', NULL, NULL, '2023-10-10 16:00:17', '2023-10-10 16:00:17'),
(22, 'App\\Models\\User', 15, 'Student', '4607b70c1b7dbd7e072b8c333c5ac7f496fe457875c9bf1dc6253727fc1345cc', '[\"*\"]', NULL, NULL, '2023-10-10 17:18:08', '2023-10-10 17:18:08'),
(23, 'App\\Models\\User', 15, 'Student', '6f8d76ff6e600bbe14683b3eb4d42133174f104a72649d4284ba46717c52d39f', '[\"*\"]', NULL, NULL, '2023-10-10 18:45:47', '2023-10-10 18:45:47'),
(24, 'App\\Models\\User', 15, 'Student', 'eda5db00b33428628f4586ca7a7968a86a8b779a012ee2eda3f53c0c6adbd3f1', '[\"*\"]', NULL, NULL, '2023-10-10 19:05:57', '2023-10-10 19:05:57'),
(25, 'App\\Models\\User', 15, 'Student', '257d68399cc070a54f27d887b7020fbc8f42eed9582b1f44242f36c2680ca87d', '[\"*\"]', NULL, NULL, '2023-10-10 19:17:33', '2023-10-10 19:17:33'),
(26, 'App\\Models\\User', 15, 'Student', '5a572daa698b7f987890969a3e01d9ac9cd08492bacba99bb888e7694953f6c9', '[\"*\"]', NULL, NULL, '2023-10-10 20:36:14', '2023-10-10 20:36:14'),
(27, 'App\\Models\\User', 15, 'Student', '7f8586b47eca4eee0acf9de1ced4ab16b29a56ab80aff1be440f906cbc55b79e', '[\"*\"]', NULL, NULL, '2023-10-10 20:36:32', '2023-10-10 20:36:32'),
(28, 'App\\Models\\User', 15, 'Student', '186c8bbcf2c28c66de9e33b15d48f2a120bbc7ac0b464b71afb3fc15af9267a1', '[\"*\"]', NULL, NULL, '2023-10-10 23:33:33', '2023-10-10 23:33:33'),
(29, 'App\\Models\\User', 16, 'Administrator', '25f2e4f15fca89a8c81e8905fcea730f65969aec77d2667d8f36d6d94ab03caf', '[\"*\"]', NULL, NULL, '2023-10-10 23:49:20', '2023-10-10 23:49:20'),
(30, 'App\\Models\\User', 16, 'Administrator', 'd1805e48d31e6f03022f8292a9552c57bb548fb8877124958aafc187e199cb89', '[\"*\"]', NULL, NULL, '2023-10-10 23:49:34', '2023-10-10 23:49:34'),
(31, 'App\\Models\\User', 16, 'Administrator', '1de2136d5a1c5fdd874139b6b30e7c5e994988222c8fca2dae4b34c66fec0e30', '[\"*\"]', NULL, NULL, '2023-10-10 23:53:50', '2023-10-10 23:53:50'),
(32, 'App\\Models\\User', 15, 'Student', '5a3fc617e8e637b4d411568228f8e0bec1e4d74f591f5e9f107cc0c6222b268a', '[\"*\"]', NULL, NULL, '2023-10-10 23:53:58', '2023-10-10 23:53:58'),
(33, 'App\\Models\\User', 16, 'Administrator', '57afd0f04ab9a35fa7bb83030b1ce0a8670f2bb5b5d62c695dd5e683751fec83', '[\"*\"]', NULL, NULL, '2023-10-10 23:54:11', '2023-10-10 23:54:11'),
(34, 'App\\Models\\User', 16, 'Administrator', '942d98ef7abe9e3fdced8799a25e85f3e205574d332f5cc5b7b5e2ee1f16be0a', '[\"*\"]', NULL, NULL, '2023-10-11 12:43:44', '2023-10-11 12:43:44'),
(35, 'App\\Models\\User', 16, 'Administrator', 'f7177ba297c0f2b6d6e62f34d322f0452d7e6f4298cd6adbf0bad284391409bb', '[\"*\"]', NULL, NULL, '2023-10-11 13:34:48', '2023-10-11 13:34:48'),
(36, 'App\\Models\\User', 17, 'Administrator', '7e4fee4e72ae9b19cb8c0f841d3e71c8cc905a06b21330f6c168d1e4e62415c2', '[\"*\"]', NULL, NULL, '2023-10-11 14:06:53', '2023-10-11 14:06:53'),
(37, 'App\\Models\\User', 15, 'Student', '39e4c61976747144d9561dd843ea00b8f6c98628aed734f09c79737ac04954e5', '[\"*\"]', NULL, NULL, '2023-10-11 16:39:34', '2023-10-11 16:39:34'),
(38, 'App\\Models\\User', 16, 'Administrator', '0be4331565cc1a3c3b83c299f02f733242b4f8c02ab0a104b6093d81cfb38abf', '[\"*\"]', NULL, NULL, '2023-10-11 16:39:54', '2023-10-11 16:39:54'),
(39, 'App\\Models\\User', 16, 'Administrator', '5f576047504729c88b4dabb8fad6ad05bc1166b4e6397ca98ac371404024673f', '[\"*\"]', NULL, NULL, '2023-10-11 22:05:54', '2023-10-11 22:05:54'),
(40, 'App\\Models\\User', 15, 'Student', 'ef9a23fcc9ad69224892a588c4ec0c54d59de0bf1ec9ca98a436b12fded2dc72', '[\"*\"]', NULL, NULL, '2023-10-11 23:42:27', '2023-10-11 23:42:27'),
(41, 'App\\Models\\User', 23, 'Student', '51909da86f45b46d8992cb2c0c2089eeeac91f03982327b513c571c1cd4b067d', '[\"*\"]', NULL, NULL, '2023-10-13 02:09:01', '2023-10-13 02:09:01'),
(42, 'App\\Models\\User', 25, 'Student', '504b13e7049bb87f29bdbd0b002d89e566c0a3fbe4f6a11beb994b3ab4b7b12f', '[\"*\"]', NULL, NULL, '2023-10-13 02:31:34', '2023-10-13 02:31:34'),
(43, 'App\\Models\\User', 26, 'Student', '19e40e49d5d499231125467855145fd7d54225c0e02ada8e2687a41733fe37f5', '[\"*\"]', NULL, NULL, '2023-10-13 02:46:30', '2023-10-13 02:46:30'),
(44, 'App\\Models\\User', 27, 'Student', 'a43bae6f1ace5d000ea632e1022c9d276784141d32626ae1fda1dfc28ed8278a', '[\"*\"]', NULL, NULL, '2023-10-13 02:50:04', '2023-10-13 02:50:04'),
(45, 'App\\Models\\User', 28, 'Student', 'cf59df4c657df3a64e85cd64ab46ae2118e3a5814c25e2f09a155d33e1dceaf0', '[\"*\"]', NULL, NULL, '2023-10-13 02:55:23', '2023-10-13 02:55:23'),
(46, 'App\\Models\\User', 28, 'Student', '3ea6105adbdcd63226f9101b6cceba63bed6ac3a20ace5e65bce586fb452ab73', '[\"*\"]', NULL, NULL, '2023-10-13 03:04:17', '2023-10-13 03:04:17'),
(47, 'App\\Models\\User', 28, 'Student', '2ab248f54fdd427c10f1ed4433e978a4ed66aad237aa616b522ce1b3f68bd98e', '[\"*\"]', NULL, NULL, '2023-10-13 03:15:59', '2023-10-13 03:15:59'),
(48, 'App\\Models\\User', 28, 'Student', '3abf73955a7ee9156b01eea4b6b43bea191915f67166a06882dec7279b1daccf', '[\"*\"]', NULL, NULL, '2023-10-13 03:16:45', '2023-10-13 03:16:45'),
(49, 'App\\Models\\User', 28, 'Student', '128cd9e0de03f2c1e7d84a4c427eba3249e365f081eb934880dfee7bca719213', '[\"*\"]', NULL, NULL, '2023-10-13 03:16:54', '2023-10-13 03:16:54'),
(50, 'App\\Models\\User', 16, 'Administrator', '54226270c6421dfd101e507f5a8338bb6a5fd419c88eff48f369b77dc3753c0b', '[\"*\"]', NULL, NULL, '2023-10-13 03:17:44', '2023-10-13 03:17:44'),
(51, 'App\\Models\\User', 16, 'Administrator', '2ee693e527ead6acde0b996d4479eba50df225fcaddd102cc190a78121e0fa77', '[\"*\"]', NULL, NULL, '2023-10-13 03:21:03', '2023-10-13 03:21:03'),
(52, 'App\\Models\\User', 16, 'Administrator', '94709c3f3e42b56c40486c857241b99eea01b60ce3f6b3c8ea0625b55e971911', '[\"*\"]', NULL, NULL, '2023-10-13 03:23:06', '2023-10-13 03:23:06'),
(53, 'App\\Models\\User', 16, 'Administrator', '805145f74543e02814995578405f1696f9365636cd3168cc3bdb899d6f892367', '[\"*\"]', NULL, NULL, '2023-10-13 03:23:22', '2023-10-13 03:23:22'),
(54, 'App\\Models\\User', 16, 'Administrator', 'd7b968e29ff94fc2e0be41c2e9d2bfbc54409660aad2d0918397754dca31389c', '[\"*\"]', NULL, NULL, '2023-10-13 03:26:54', '2023-10-13 03:26:54'),
(55, 'App\\Models\\User', 15, 'Student', 'c3a564a9de4f6a103d5db75a9c12ff9cc972d80352a5765b2a79db8da48e4809', '[\"*\"]', NULL, NULL, '2023-10-13 03:28:37', '2023-10-13 03:28:37'),
(56, 'App\\Models\\User', 15, 'Student', '4c102ab0100193a1ff8480b85399e363fca901df124a5c5f2e0773d1f2f7d434', '[\"*\"]', NULL, NULL, '2023-10-13 03:28:50', '2023-10-13 03:28:50'),
(57, 'App\\Models\\User', 16, 'Administrator', 'a750eb607e8a07d46b47ffa42cf107828af168a7f98b39fcd696691753396b02', '[\"*\"]', NULL, NULL, '2023-10-13 03:29:04', '2023-10-13 03:29:04'),
(58, 'App\\Models\\User', 15, 'Student', '60472a0a7e7ea64a96bae5d01d90c4b01ecf98dfc4c6f8472571151e35c6f34b', '[\"*\"]', NULL, NULL, '2023-10-13 03:30:07', '2023-10-13 03:30:07'),
(59, 'App\\Models\\User', 16, 'Administrator', '46146d7046660bd56a7e1b3d9da7a5f4ac7610caff26be2de2b1c02a5af27866', '[\"*\"]', NULL, NULL, '2023-10-13 03:31:09', '2023-10-13 03:31:09'),
(60, 'App\\Models\\User', 15, 'Student', '24fb774ea402eae7757020f3bf6d1df02807f231879970868d63cbeadc0d5e75', '[\"*\"]', NULL, NULL, '2023-10-13 03:31:28', '2023-10-13 03:31:28'),
(61, 'App\\Models\\User', 15, 'Student', '3a91e1ca598d6ad6a9c40f4f9d5d4cfcd1217a242e634f1d40fcf7b4179bedc3', '[\"*\"]', NULL, NULL, '2023-10-13 03:34:06', '2023-10-13 03:34:06'),
(62, 'App\\Models\\User', 15, 'Student', '68d45079c2d2db07c179397a8d5202ba267c88caef67210d9a7cc8e6f1df00e4', '[\"*\"]', NULL, NULL, '2023-10-13 03:34:14', '2023-10-13 03:34:14'),
(63, 'App\\Models\\User', 15, 'Student', '2bdc0d65c766def84055b07a497f3f2482510e3841c1e7959d2ae4b8d7dcce2f', '[\"*\"]', NULL, NULL, '2023-10-13 03:42:01', '2023-10-13 03:42:01'),
(64, 'App\\Models\\User', 15, 'Student', '45df6e8d5beec42e783b2b98cc6e8a936dddddf542f0616848eaac0050ce08fd', '[\"*\"]', NULL, NULL, '2023-10-13 03:42:27', '2023-10-13 03:42:27'),
(65, 'App\\Models\\User', 15, 'Student', '7628f909058f4083d1b70ad9bedc77838d750b9e8eff1ed878f4cd94ea03b8de', '[\"*\"]', NULL, NULL, '2023-10-13 03:42:52', '2023-10-13 03:42:52'),
(66, 'App\\Models\\User', 15, 'Student', '24b1c5bb3456e0d6a35bcd6ab9ec31efcb1fc21fcbc307ae6de20600ac00f541', '[\"*\"]', NULL, NULL, '2023-10-13 03:42:56', '2023-10-13 03:42:56'),
(67, 'App\\Models\\User', 15, 'Student', 'd83207b84e9443ce1f5561f481dcc79d07b4828b1ca35cd4e84f48f30f51d7fb', '[\"*\"]', NULL, NULL, '2023-10-13 03:43:02', '2023-10-13 03:43:02'),
(68, 'App\\Models\\User', 15, 'Student', '205c364ca2dd5c4a735272f9801c417c504b7d602e1a97d506920b635c8b6993', '[\"*\"]', NULL, NULL, '2023-10-13 03:43:07', '2023-10-13 03:43:07'),
(69, 'App\\Models\\User', 16, 'Administrator', '863581cc6a7737260b5dee8050be93e1d42a7e43e5fd0c75db19906e0c371083', '[\"*\"]', NULL, NULL, '2023-10-13 03:43:21', '2023-10-13 03:43:21'),
(70, 'App\\Models\\User', 15, 'Student', '6310dd67524470c9a8b48b80bd5a0986ff2e3cdf5df95d6b1fe5a6f562284684', '[\"*\"]', NULL, NULL, '2023-10-13 03:43:37', '2023-10-13 03:43:37'),
(71, 'App\\Models\\User', 15, 'Student', 'fd1b72b85a43c9ec5bfba76703d5b1a018616cd7ea4c7c8976e7631278263f85', '[\"*\"]', NULL, NULL, '2023-10-13 03:43:41', '2023-10-13 03:43:41'),
(72, 'App\\Models\\User', 15, 'Student', '105c4b4a468a35d6e0d588968a057de7585bdb7fc271bd357f41a1da349a42df', '[\"*\"]', NULL, NULL, '2023-10-13 03:43:43', '2023-10-13 03:43:43'),
(73, 'App\\Models\\User', 15, 'Student', 'd4138802dc5f7e0c03dbb2f1b85b998a05586e033ef08030daa227cb8ab7830f', '[\"*\"]', NULL, NULL, '2023-10-13 03:43:46', '2023-10-13 03:43:46'),
(74, 'App\\Models\\User', 15, 'Student', 'a2c3aab5b372f21169b5e3227036f50617c6fb5253b52c60ad1da8669c826437', '[\"*\"]', NULL, NULL, '2023-10-13 03:43:49', '2023-10-13 03:43:49'),
(75, 'App\\Models\\User', 15, 'Student', '166751bea4aa51e79faa88810bbf4a54a82fe9bcefe680e298d8c318fb11c170', '[\"*\"]', NULL, NULL, '2023-10-13 03:43:50', '2023-10-13 03:43:50'),
(76, 'App\\Models\\User', 15, 'Student', '92d44696a28f1f2115533d05a23ec4149b03085af09a7dfdda0a54618a4bd1cf', '[\"*\"]', NULL, NULL, '2023-10-13 03:43:50', '2023-10-13 03:43:50'),
(77, 'App\\Models\\User', 15, 'Student', '5b96d86c50a7aa726b0d22d5080accc37dca87bdab5094a2bca1f0af06b53605', '[\"*\"]', NULL, NULL, '2023-10-13 03:49:54', '2023-10-13 03:49:54'),
(78, 'App\\Models\\User', 15, 'Student', 'f340867896d291f8d53ebbbc8cb94179317061fa976b1af40c7339b5994870c8', '[\"*\"]', NULL, NULL, '2023-10-13 03:50:48', '2023-10-13 03:50:48'),
(79, 'App\\Models\\User', 15, 'Student', '0f4f5cebb3c05f2670cfbee9ebb5e228bc90c92d797c08bdd95501c20273373b', '[\"*\"]', NULL, NULL, '2023-10-13 03:50:53', '2023-10-13 03:50:53'),
(80, 'App\\Models\\User', 15, 'Student', 'f1f884cf5d7b0dc845a8f4f987f57ee16428d2639e2c533d1a3afe257a659b87', '[\"*\"]', NULL, NULL, '2023-10-13 03:50:57', '2023-10-13 03:50:57'),
(81, 'App\\Models\\User', 15, 'Student', 'dafa6fd8fcda16972782c75e416a072fd5159a3b9cbf19c8895ed72db621b202', '[\"*\"]', NULL, NULL, '2023-10-13 03:51:02', '2023-10-13 03:51:02'),
(82, 'App\\Models\\User', 16, 'Administrator', '88eb0ed7257eef044138d34d8e6da61227055e7165c0b1d6aae82cdf367d7d6c', '[\"*\"]', NULL, NULL, '2023-10-13 03:51:09', '2023-10-13 03:51:09'),
(83, 'App\\Models\\User', 15, 'Student', 'ac756cb7020a7eeffcb2a04bdaa6323d0f2ae46a5affd96d6741417c304523f9', '[\"*\"]', NULL, NULL, '2023-10-13 03:51:59', '2023-10-13 03:51:59'),
(84, 'App\\Models\\User', 15, 'Student', '072b02c66cc05744096edf5c7e9c926d1706af3bc9f946d1a99caded02852198', '[\"*\"]', NULL, NULL, '2023-10-13 03:52:04', '2023-10-13 03:52:04'),
(85, 'App\\Models\\User', 15, 'Student', 'df9604241bf1041370c008ca701da70af7386a7e620c23aa86f32f84d6bfd385', '[\"*\"]', NULL, NULL, '2023-10-13 03:57:42', '2023-10-13 03:57:42'),
(86, 'App\\Models\\User', 15, 'Student', 'b158a2c5f683c5b46a7a228eeab05c201973ee04bc6d3e550bb60c2411e1a220', '[\"*\"]', NULL, NULL, '2023-10-13 03:57:46', '2023-10-13 03:57:46'),
(87, 'App\\Models\\User', 15, 'Student', '7439befec72435646d63d77b5860d62dd29dff941529876e45c9eec5518184db', '[\"*\"]', NULL, NULL, '2023-10-13 03:57:48', '2023-10-13 03:57:48'),
(88, 'App\\Models\\User', 15, 'Student', '31115c087881f53c3bdbfbff772f1ff216b3083120cc00f9c07ec9a6f769b785', '[\"*\"]', NULL, NULL, '2023-10-13 03:57:58', '2023-10-13 03:57:58'),
(89, 'App\\Models\\User', 15, 'Student', '169a0cac625370690a4d6663c88c0f77ecd7128d364d2c0602df3db405e1fa0c', '[\"*\"]', NULL, NULL, '2023-10-13 03:58:00', '2023-10-13 03:58:00'),
(90, 'App\\Models\\User', 15, 'Student', 'ed5c2906dd51a80483fcfe8942e1d681e23fb4596402264dd5d5ae10d4a2a9cf', '[\"*\"]', NULL, NULL, '2023-10-13 03:58:03', '2023-10-13 03:58:03'),
(91, 'App\\Models\\User', 15, 'Student', '13f7d075c281a4444ff4b4a6d41f116212fdb0aebdb8a11853c6b8ee89b07968', '[\"*\"]', NULL, NULL, '2023-10-13 03:58:06', '2023-10-13 03:58:06'),
(92, 'App\\Models\\User', 15, 'Student', 'ff79eacf4fc403abb69ae09dfcc95520116c9d589343a6791e1105a96e6cea0e', '[\"*\"]', NULL, NULL, '2023-10-13 03:58:09', '2023-10-13 03:58:09'),
(93, 'App\\Models\\User', 15, 'Student', 'b00c225250b061d95321d2c40963cb9468abbac6004d504ed0803be999d74275', '[\"*\"]', NULL, NULL, '2023-10-13 04:03:41', '2023-10-13 04:03:41'),
(94, 'App\\Models\\User', 15, 'Student', '37924527a97e78becfe576b15cacbfa20f04605f2eefedf63e9080b05c3e10dd', '[\"*\"]', NULL, NULL, '2023-10-13 04:03:47', '2023-10-13 04:03:47'),
(95, 'App\\Models\\User', 15, 'Student', 'fedef2d30f5e0df5c1ba81b484ef334efb65e954ad1ee92712369f43f05a0cbe', '[\"*\"]', NULL, NULL, '2023-10-13 04:04:36', '2023-10-13 04:04:36'),
(96, 'App\\Models\\User', 15, 'Student', '2ad4854af5a5943d3fda00bb3064cc8aa894439cc191beb9c92310a87fc7041c', '[\"*\"]', NULL, NULL, '2023-10-13 04:06:30', '2023-10-13 04:06:30'),
(97, 'App\\Models\\User', 15, 'Student', '223fd16c8633c3c9bd1026cb072a21925daaa604ea314f0f097a303bf59578ab', '[\"*\"]', NULL, NULL, '2023-10-13 04:06:34', '2023-10-13 04:06:34'),
(98, 'App\\Models\\User', 15, 'Student', 'f6fdf7abb648e3ba2422fea2db084c1e38ccaa28d0da6c4b036c503e066ae00c', '[\"*\"]', NULL, NULL, '2023-10-13 04:06:42', '2023-10-13 04:06:42'),
(99, 'App\\Models\\User', 15, 'Student', '2e97ac8550e2429951006e1414529fbe1cc9eb4d0c664689b427f8e4a2751eb4', '[\"*\"]', NULL, NULL, '2023-10-13 04:08:14', '2023-10-13 04:08:14'),
(100, 'App\\Models\\User', 15, 'Student', 'b8055e799f6d21996db81aff80a2e48a75a46840f1aad7d951225f7ab288a702', '[\"*\"]', NULL, NULL, '2023-10-13 04:08:17', '2023-10-13 04:08:17'),
(101, 'App\\Models\\User', 15, 'Student', '20d611c858cee524b56a22a8f33420aaa6651ee557c3b3aee2920cb761d77efb', '[\"*\"]', NULL, NULL, '2023-10-13 04:08:19', '2023-10-13 04:08:19'),
(102, 'App\\Models\\User', 15, 'Student', 'b56698dca6f56004a08a8d72867fb2c81acce133d33d54e411f045a2dd9aca98', '[\"*\"]', NULL, NULL, '2023-10-13 04:08:22', '2023-10-13 04:08:22'),
(103, 'App\\Models\\User', 15, 'Student', 'f74648c28f6d016135983baca85c718cb4dc952c77fe20e1c328cd924aca1d29', '[\"*\"]', NULL, NULL, '2023-10-13 04:08:37', '2023-10-13 04:08:37'),
(104, 'App\\Models\\User', 15, 'Student', '37fdabc3d9d5989aada73819d5bb425308664e5690e1fcd709e6169248e57352', '[\"*\"]', NULL, NULL, '2023-10-13 04:09:45', '2023-10-13 04:09:45'),
(105, 'App\\Models\\User', 15, 'Student', 'f062654363e34a584827fbfa34aae4c70e212c7d72303b79620de379b96a2755', '[\"*\"]', NULL, NULL, '2023-10-13 04:09:48', '2023-10-13 04:09:48'),
(106, 'App\\Models\\User', 16, 'Administrator', 'a6587aa6102092190512f0677f246b2e24c3ce87637cba196161f56a728b075c', '[\"*\"]', NULL, NULL, '2023-10-13 04:09:57', '2023-10-13 04:09:57'),
(107, 'App\\Models\\User', 15, 'Student', '6bf4040e723396ce38b2a64e800813251f3d64bd6931723ecc46b779fcd9f7a7', '[\"*\"]', NULL, NULL, '2023-10-13 13:48:21', '2023-10-13 13:48:21'),
(108, 'App\\Models\\User', 15, 'Student', '0c01d1381ec54dc822f722128534d5b89776b98ce4847ad2a0a80dc63ed04b46', '[\"*\"]', NULL, NULL, '2023-10-13 13:48:22', '2023-10-13 13:48:22'),
(109, 'App\\Models\\User', 15, 'Student', 'bab37b32d4fe8781f1f7651d0ccb90262ef38783acbbdd19c2b164e34d49146a', '[\"*\"]', NULL, NULL, '2023-10-13 13:48:28', '2023-10-13 13:48:28'),
(110, 'App\\Models\\User', 27, 'Student', 'e2da6d04a39bc8bab432cf60a2f2c93b2feb6312feb060990a6c39de4664e618', '[\"*\"]', NULL, NULL, '2023-10-13 14:20:12', '2023-10-13 14:20:12'),
(111, 'App\\Models\\User', 16, 'Administrator', '4e7c4ad3ec74ed58adfc3726214c0a59cc0b23272c53fb0b6ffa1578d9dabfc9', '[\"*\"]', NULL, NULL, '2023-10-13 14:57:31', '2023-10-13 14:57:31'),
(112, 'App\\Models\\User', 15, 'Student', 'daac5deaff7868034e95e03025e1896646a7683b437cd3db34cdf0eb87ceeab8', '[\"*\"]', NULL, NULL, '2023-10-13 14:57:37', '2023-10-13 14:57:37'),
(113, 'App\\Models\\User', 16, 'Administrator', '1a5afb160f4653035bdcafedc854767d1167e21c44a7ccf2c302c389fdf9f412', '[\"*\"]', NULL, NULL, '2023-10-13 14:57:46', '2023-10-13 14:57:46'),
(114, 'App\\Models\\User', 15, 'Student', 'a646fd21d687ca68d7945e4f593538195cb46ed7c615b0b0b56d2f2763903c3d', '[\"*\"]', NULL, NULL, '2023-10-13 17:23:41', '2023-10-13 17:23:41'),
(115, 'App\\Models\\User', 16, 'Administrator', 'b56bf3c6c359a328519d2c304dc5817b70cd59df0494176b43ff6a432fb6f1bc', '[\"*\"]', NULL, NULL, '2023-10-13 17:44:53', '2023-10-13 17:44:53'),
(116, 'App\\Models\\User', 15, 'Student', '4cd235037a39308955a75465a2e510eded115eb2e45f88c7777fe2509a15c713', '[\"*\"]', NULL, NULL, '2023-10-13 17:46:32', '2023-10-13 17:46:32'),
(117, 'App\\Models\\User', 16, 'Administrator', '3bb0afa9500acca71bb854646aa4248a209318bc69e7c7893d07e04dec492cf6', '[\"*\"]', NULL, NULL, '2023-10-13 17:46:48', '2023-10-13 17:46:48'),
(118, 'App\\Models\\User', 15, 'Student', '94181649fb485170c93c17d96094163d231e8d40f3cdbef4d024893233bbb58c', '[\"*\"]', NULL, NULL, '2023-10-13 17:47:02', '2023-10-13 17:47:02'),
(119, 'App\\Models\\User', 16, 'Administrator', '6c5cfdc962e5d13d8106e1f6f4652ba0d5278c542eec58481b5f356a42375c64', '[\"*\"]', NULL, NULL, '2023-10-13 17:50:07', '2023-10-13 17:50:07'),
(120, 'App\\Models\\User', 15, 'Student', '85131d6a6b5fd8e24d770ce7b09fe59731ce88ac9736d817abe6e740ca7f2696', '[\"*\"]', NULL, NULL, '2023-10-13 23:46:10', '2023-10-13 23:46:10'),
(121, 'App\\Models\\User', 15, 'Student', '75d179dabc01d5a5851786fdb9b5dc3e09b6fb5dd212b55c29d15faf8e46c06a', '[\"*\"]', NULL, NULL, '2023-10-13 23:46:24', '2023-10-13 23:46:24'),
(122, 'App\\Models\\User', 15, 'Student', '577dffb376806181fe1f4aafeda26a293c023a35f19e1f3e10c6442fa6e6bee4', '[\"*\"]', NULL, NULL, '2023-10-13 23:51:17', '2023-10-13 23:51:17'),
(123, 'App\\Models\\User', 15, 'Student', '6fe08c77f98d70acbc6687e950b0a51285aed3001dbe261049cfb1073cebbcd2', '[\"*\"]', NULL, NULL, '2023-10-14 00:30:00', '2023-10-14 00:30:00'),
(124, 'App\\Models\\User', 15, 'Student', '837c587cb328a7581e9307fabfea094c0b6ec46539e81a81427f6355f38d13cd', '[\"*\"]', NULL, NULL, '2023-10-14 00:48:06', '2023-10-14 00:48:06'),
(125, 'App\\Models\\User', 15, 'Student', 'fd55d138738049cff87f0dc9e7949156a51a6170619de9c20df697387504143c', '[\"*\"]', NULL, NULL, '2023-10-14 00:51:07', '2023-10-14 00:51:07'),
(126, 'App\\Models\\User', 15, 'Student', '768212ce28672e673b31e125d0c71be04b86bee8346ca2c9b359cc0922290e96', '[\"*\"]', NULL, NULL, '2023-10-14 00:51:15', '2023-10-14 00:51:15'),
(127, 'App\\Models\\User', 15, 'Student', 'd17dc8ab8b86ece7d831b162c73736b08bba5c07a4ff99b8ec9ceb44ea8b0f87', '[\"*\"]', NULL, NULL, '2023-10-14 00:57:10', '2023-10-14 00:57:10'),
(128, 'App\\Models\\User', 15, 'Student', '58001838d59017bfb8c95efc482898553fc2eb2530f95a6c54600b7054a28ba1', '[\"*\"]', NULL, NULL, '2023-10-14 01:06:34', '2023-10-14 01:06:34'),
(129, 'App\\Models\\User', 15, 'Student', 'e9f308dfc70dd83b15bec803ae5dfa5231b06a963ad1e9d8f482096e599dc929', '[\"*\"]', NULL, NULL, '2023-10-14 01:08:15', '2023-10-14 01:08:15'),
(130, 'App\\Models\\User', 15, 'Student', '6f67e01aab6ccd11d0ef9f21c0067c8b921cab9a913150ce699aa3101c5027f6', '[\"*\"]', NULL, NULL, '2023-10-14 01:11:30', '2023-10-14 01:11:30'),
(131, 'App\\Models\\User', 15, 'Student', '10fbd2f16eee7219b81047bc588d9e6d835d8cd26d4f753e42c22b3290821b20', '[\"*\"]', NULL, NULL, '2023-10-14 01:11:44', '2023-10-14 01:11:44'),
(132, 'App\\Models\\User', 15, 'Student', '37a376aa0e50b66168b3957236e4e1c122bec5410ced3ca2b85cf245876b7468', '[\"*\"]', NULL, NULL, '2023-10-14 01:15:56', '2023-10-14 01:15:56'),
(133, 'App\\Models\\User', 15, 'Student', 'e326ac77d44c575cc020a71edb65dfe61d1b2743726d0bbbbfb3bdac4bbfe0c4', '[\"*\"]', NULL, NULL, '2023-10-14 01:16:48', '2023-10-14 01:16:48'),
(134, 'App\\Models\\User', 15, 'Student', 'a2d3fb8b8f348439a2aed8651672d37b680bfbc320606d72e34861f49b6783c8', '[\"*\"]', NULL, NULL, '2023-10-14 01:19:19', '2023-10-14 01:19:19'),
(135, 'App\\Models\\User', 15, 'Student', '5840ed84078219b890e610fe4756d026e92882e25a5290ec796616cfe484d642', '[\"*\"]', NULL, NULL, '2023-10-14 01:20:31', '2023-10-14 01:20:31'),
(136, 'App\\Models\\User', 15, 'Student', '8a0e77782cd30172850bf93d94c5919b48594dc7de317f336ffc4b7c1857bfdd', '[\"*\"]', NULL, NULL, '2023-10-14 01:20:39', '2023-10-14 01:20:39'),
(137, 'App\\Models\\User', 15, 'Student', 'e5860db0d578aeebd4e3a5ae8471f61bf2aeec00468b9e0d4cffe50fe6918e29', '[\"*\"]', NULL, NULL, '2023-10-14 01:21:56', '2023-10-14 01:21:56'),
(138, 'App\\Models\\User', 15, 'Student', 'ef0c59721d74c5efa5461b49a7b19fed3dbbd3f8975d004bac4e14cf071c3736', '[\"*\"]', NULL, NULL, '2023-10-14 01:22:21', '2023-10-14 01:22:21'),
(139, 'App\\Models\\User', 15, 'Student', '6039a83e6ed1d036cf27a7114e245564681c863406fdb67bf8e711f66775cf89', '[\"*\"]', NULL, NULL, '2023-10-14 01:28:48', '2023-10-14 01:28:48'),
(140, 'App\\Models\\User', 15, 'Student', '96ec6f6e499275eb1f0ca9b8d6053e0a8f76e001b3429fd2fdd7bb1414b5b8bb', '[\"*\"]', NULL, NULL, '2023-10-14 01:28:56', '2023-10-14 01:28:56'),
(141, 'App\\Models\\User', 15, 'Student', '8cb54849eb18d25c5fe5bbf4deec3bbad18333b220ce45d42dc97672c8bcbd3e', '[\"*\"]', NULL, NULL, '2023-10-14 01:29:05', '2023-10-14 01:29:05'),
(142, 'App\\Models\\User', 15, 'Student', '8d9410584e382f31cf464d06207813d3af6b74e0a6d35f14e44f3e87defd70be', '[\"*\"]', NULL, NULL, '2023-10-14 01:29:07', '2023-10-14 01:29:07'),
(143, 'App\\Models\\User', 15, 'Student', '3c5452063aa4360e8a8c557805efa91b6ffac42db8b992da55dd7d26d1869b3f', '[\"*\"]', NULL, NULL, '2023-10-14 01:29:45', '2023-10-14 01:29:45'),
(144, 'App\\Models\\User', 15, 'Student', 'ecff8b4b364b49086c8354960f308cf5cfcff886d61e3d6e2ac34092d169aafa', '[\"*\"]', NULL, NULL, '2023-10-14 01:29:58', '2023-10-14 01:29:58'),
(145, 'App\\Models\\User', 15, 'Student', '4f32826a100937283f5be232ddbfbc6be3b6b1a7a3c567e9825e6daf85897369', '[\"*\"]', NULL, NULL, '2023-10-14 01:30:05', '2023-10-14 01:30:05'),
(146, 'App\\Models\\User', 15, 'Student', '0ef82eda378e8d398aa3296c5a1dc36b609257f349fe9e445d4cc8a287ac7775', '[\"*\"]', NULL, NULL, '2023-10-14 01:30:12', '2023-10-14 01:30:12'),
(147, 'App\\Models\\User', 15, 'Student', '98b2bda578681301cb1c2a8983b4ae21bf2dc98bacb46199548c4b95a51cc019', '[\"*\"]', NULL, NULL, '2023-10-14 01:30:15', '2023-10-14 01:30:15'),
(148, 'App\\Models\\User', 15, 'Student', '4d8da7f58950a5788f78bd9408152281471abb79899cffa67e0570f7dfceaa47', '[\"*\"]', NULL, NULL, '2023-10-14 01:30:19', '2023-10-14 01:30:19'),
(149, 'App\\Models\\User', 15, 'Student', '4d39d4002b13351659e820e4dca1867b7522e4fe6d3f0d6eaf9df544d0cbd975', '[\"*\"]', NULL, NULL, '2023-10-14 01:30:24', '2023-10-14 01:30:24'),
(150, 'App\\Models\\User', 15, 'Student', '05dd7f410e0d833815329cd34cb5a0e0f99144df11215d1839617579c1893659', '[\"*\"]', NULL, NULL, '2023-10-14 01:30:40', '2023-10-14 01:30:40'),
(151, 'App\\Models\\User', 15, 'Student', '1541b0a17f4b7564eb079c7af6ace5268a8ab1a432e349f6658c900fcccab3e7', '[\"*\"]', NULL, NULL, '2023-10-14 01:32:02', '2023-10-14 01:32:02'),
(152, 'App\\Models\\User', 15, 'Student', 'bffeb778b80f7c84bfa5fdc33e85fc0ae1b55624c18723df2590df96b5b04a20', '[\"*\"]', NULL, NULL, '2023-10-14 01:32:06', '2023-10-14 01:32:06'),
(153, 'App\\Models\\User', 15, 'Student', '2e10227ccb98e459627abe45d9e1a91770c46facda878670cc0390d8520a0733', '[\"*\"]', NULL, NULL, '2023-10-14 01:32:16', '2023-10-14 01:32:16'),
(154, 'App\\Models\\User', 15, 'Student', '715ab204f500f69d0ac9818c122121a25483d01df74317e2cc8977e5a8076481', '[\"*\"]', NULL, NULL, '2023-10-14 01:32:38', '2023-10-14 01:32:38'),
(155, 'App\\Models\\User', 15, 'Student', '24b4c3641723cb12c26c5a4eb47daa03832bf80b3488cdf77dfb2d49f46996bb', '[\"*\"]', NULL, NULL, '2023-10-14 01:32:52', '2023-10-14 01:32:52'),
(156, 'App\\Models\\User', 15, 'Student', 'd2dcfcb30bcbbc4f7869bd3e7aa2820dd31ec4f5e9c72cd8a15ca8392b612b8b', '[\"*\"]', NULL, NULL, '2023-10-14 01:34:11', '2023-10-14 01:34:11'),
(157, 'App\\Models\\User', 15, 'Student', '719c8c07bfebb4fca74cec8c54f086b931e9f86259c3bee316ebe799e4bbebdb', '[\"*\"]', NULL, NULL, '2023-10-14 01:34:44', '2023-10-14 01:34:44'),
(158, 'App\\Models\\User', 15, 'Student', '0ae5316cc31455bab8a24764ff8d298ad48938d0866e5e499ab18083b0d26e3d', '[\"*\"]', NULL, NULL, '2023-10-14 01:34:55', '2023-10-14 01:34:55'),
(159, 'App\\Models\\User', 15, 'Student', 'bf7580799715de96aeda5f6ad8fcec04bf865f134a451941cd8ac7fb73e85f8d', '[\"*\"]', NULL, NULL, '2023-10-14 01:35:11', '2023-10-14 01:35:11'),
(160, 'App\\Models\\User', 15, 'Student', '14325018343fa6fdae660291b89215516d2e43b82eb415e56a341331edcf01d0', '[\"*\"]', NULL, NULL, '2023-10-14 01:35:12', '2023-10-14 01:35:12'),
(161, 'App\\Models\\User', 15, 'Student', '41777350922779876518793b60b4216fe48864f20e7c6f62c4a57a6afecaa648', '[\"*\"]', NULL, NULL, '2023-10-14 01:35:23', '2023-10-14 01:35:23'),
(162, 'App\\Models\\User', 15, 'Student', 'dda47a2dcfeef5839d7a61a0436e11e69af7b2f7eb07a0c20e58ba2d59021e7c', '[\"*\"]', NULL, NULL, '2023-10-14 01:35:38', '2023-10-14 01:35:38'),
(163, 'App\\Models\\User', 15, 'Student', 'dad64ae3dff830a48cca7890ee9b593a73f6bdfa0acfe454b3fcabf9bf615795', '[\"*\"]', NULL, NULL, '2023-10-14 01:35:47', '2023-10-14 01:35:47'),
(164, 'App\\Models\\User', 15, 'Student', '1cd4ad98a5a12b70f5eab84aebdbf1183f9ccd3ff30f1af43faf6de90dcb8a63', '[\"*\"]', NULL, NULL, '2023-10-14 01:37:12', '2023-10-14 01:37:12'),
(165, 'App\\Models\\User', 15, 'Student', '8a71901dcd0d1a438a9f9e7ca32493957dbcba4c02a257836184abeb8d390bf8', '[\"*\"]', NULL, NULL, '2023-10-14 01:37:19', '2023-10-14 01:37:19'),
(166, 'App\\Models\\User', 15, 'Student', 'df7bbe82383ea6cc3a14b9ad42a6f5a249ef4589686f8fd01d021a91a47d9af0', '[\"*\"]', NULL, NULL, '2023-10-14 01:37:25', '2023-10-14 01:37:25'),
(167, 'App\\Models\\User', 15, 'Student', 'bf7953c579a5dadfbca7f77168e02863fa04c3d32ed00c362228ed63e5ee05cc', '[\"*\"]', NULL, NULL, '2023-10-14 01:37:26', '2023-10-14 01:37:26'),
(168, 'App\\Models\\User', 15, 'Student', '29b42f64c58867ee7d11bb37d5862e333609da6f37558633dbb168b03ec24758', '[\"*\"]', NULL, NULL, '2023-10-14 01:37:27', '2023-10-14 01:37:27'),
(169, 'App\\Models\\User', 15, 'Student', '2c0aec138699d136659b559856b7c2a0fd51c64681a088daabee48b17773c207', '[\"*\"]', NULL, NULL, '2023-10-14 01:38:17', '2023-10-14 01:38:17'),
(170, 'App\\Models\\User', 15, 'Student', '25cea080c779635b2e228aca899fb0ef51e5d8f94d418485a919e3f532fbf5d5', '[\"*\"]', NULL, NULL, '2023-10-14 01:39:17', '2023-10-14 01:39:17'),
(171, 'App\\Models\\User', 15, 'Student', '773f5b4e0c3c621c7f492c8b70ec6e70214f0a26108021fb8000212ca5d77241', '[\"*\"]', NULL, NULL, '2023-10-14 01:39:23', '2023-10-14 01:39:23'),
(172, 'App\\Models\\User', 15, 'Student', 'c1195e483664644692a432dbda14c3ddb4c1129910ca3d2707429ab06d67c011', '[\"*\"]', NULL, NULL, '2023-10-14 01:39:28', '2023-10-14 01:39:28'),
(173, 'App\\Models\\User', 15, 'Student', 'e593f93a725608724a48ba5885bee529389eaa42cef23979dac04ade3f42b07a', '[\"*\"]', NULL, NULL, '2023-10-14 01:39:54', '2023-10-14 01:39:54'),
(174, 'App\\Models\\User', 15, 'Student', '50f741f151c91d3c3e4eef6dd5c3149688b730ad14ba2665166743e8c8393727', '[\"*\"]', NULL, NULL, '2023-10-14 01:40:02', '2023-10-14 01:40:02'),
(175, 'App\\Models\\User', 15, 'Student', 'dff47a8e601abbb026c3c6cf2e027f16974a7a9f4536261fdb7c9cbe0200953d', '[\"*\"]', NULL, NULL, '2023-10-14 01:40:10', '2023-10-14 01:40:10'),
(176, 'App\\Models\\User', 16, 'Administrator', '5735f4014a0d62b5081a48917b5b1c9782032f5467c94c1ecc1177f61e3711b0', '[\"*\"]', NULL, NULL, '2023-10-14 01:57:29', '2023-10-14 01:57:29'),
(177, 'App\\Models\\User', 29, 'Student', 'f660a074c0cfdbfdb66d522c025d90520ce89db140b65aabb9f9fd3c4b5aa9b7', '[\"*\"]', NULL, NULL, '2023-10-14 02:02:19', '2023-10-14 02:02:19'),
(178, 'App\\Models\\User', 15, 'Student', '1ecfd7898c656cc37a07e452001c1af76051f4344a890ce69b5d7fb9ee6afb3b', '[\"*\"]', NULL, NULL, '2023-10-14 02:09:03', '2023-10-14 02:09:03'),
(179, 'App\\Models\\User', 15, 'Student', '8152c9e90c9091ada1f9607d0f22bc691c4cad8c4d6d0dc9125483ffbc369381', '[\"*\"]', NULL, NULL, '2023-10-14 02:10:42', '2023-10-14 02:10:42'),
(180, 'App\\Models\\User', 15, 'Student', '413643cdab3d6859c3999d79f4f0590c57ed7eaf8e6f1a813c5e9ff9581a4359', '[\"*\"]', NULL, NULL, '2023-10-14 02:17:49', '2023-10-14 02:17:49'),
(181, 'App\\Models\\User', 15, 'Student', 'c7f8698e02bd741ab68fd67c643bf0e62d10ba9f02a048181f343ac79f150656', '[\"*\"]', NULL, NULL, '2023-10-14 02:18:59', '2023-10-14 02:18:59'),
(182, 'App\\Models\\User', 15, 'Student', '41a48741883fc0dd1ce38329ebfba68c5a2ce0e06829c39a42f970588513c388', '[\"*\"]', NULL, NULL, '2023-10-14 02:19:04', '2023-10-14 02:19:04'),
(183, 'App\\Models\\User', 15, 'Student', '3348b91715a3edfe112bccb12edb45b7b03a0de23b179aa78c52a9a2f478f525', '[\"*\"]', NULL, NULL, '2023-10-14 02:19:32', '2023-10-14 02:19:32'),
(184, 'App\\Models\\User', 15, 'Student', 'c3ab3afa665b55a7a8aec281706bc6facee1d9bd801321e98669bdaec59e9fc2', '[\"*\"]', NULL, NULL, '2023-10-14 02:40:04', '2023-10-14 02:40:04'),
(185, 'App\\Models\\User', 15, 'Student', '19ca346bba34acc055814d9bb7d8589c74102a80dd58d498f352401609026f2d', '[\"*\"]', NULL, NULL, '2023-10-14 02:40:09', '2023-10-14 02:40:09'),
(186, 'App\\Models\\User', 15, 'Student', '75caa0e2805ac7a8fa1855817daf8c139378edb440229a42c8f69b79cad9925c', '[\"*\"]', NULL, NULL, '2023-10-14 02:47:31', '2023-10-14 02:47:31'),
(187, 'App\\Models\\User', 15, 'Student', '227bbf5d29bdcaa353c41a4afbd9e67498a5d3a0e8cc7a1ee55f6d49110b544b', '[\"*\"]', NULL, NULL, '2023-10-14 02:47:48', '2023-10-14 02:47:48'),
(188, 'App\\Models\\User', 16, 'Administrator', 'fd29243237abea941c86792bdf2a9ef26dbec3d1a00b55d9d0da6a3a8b0d6d7a', '[\"*\"]', NULL, NULL, '2023-10-14 02:48:46', '2023-10-14 02:48:46'),
(189, 'App\\Models\\User', 29, 'Student', 'c70d6aedd57c1cb26550f95e7320578631da671bd996b01cfbbf265d57f0ef18', '[\"*\"]', NULL, NULL, '2023-10-14 02:50:45', '2023-10-14 02:50:45'),
(190, 'App\\Models\\User', 29, 'Student', '1c3aa6791a27d1b4fe3d467b2cccc8efeb576c9c9e4717f9b138b91a88dd9d5d', '[\"*\"]', NULL, NULL, '2023-10-14 02:51:11', '2023-10-14 02:51:11'),
(191, 'App\\Models\\User', 29, 'Student', 'a298ecd591ea435293381c7b8b1ced9d47307fcd36a472b55f7caf30e2582412', '[\"*\"]', NULL, NULL, '2023-10-14 02:51:18', '2023-10-14 02:51:18'),
(192, 'App\\Models\\User', 15, 'Student', '3e60d4313c5eefb614607702c580abda90431d20bc539805ce8146f427542869', '[\"*\"]', NULL, NULL, '2023-10-14 02:51:41', '2023-10-14 02:51:41'),
(193, 'App\\Models\\User', 29, 'Student', '4f2372940d3540ef219bc94082aff2d488f1adbeec5d7b2bcfca5043bdcae1a8', '[\"*\"]', NULL, NULL, '2023-10-14 02:55:22', '2023-10-14 02:55:22'),
(194, 'App\\Models\\User', 15, 'Student', '8207133888338ebcdf0d8d075e5137b6ca370013a39d0e90cb16bfc46c2f6dba', '[\"*\"]', NULL, NULL, '2023-10-14 02:55:49', '2023-10-14 02:55:49'),
(195, 'App\\Models\\User', 15, 'Student', '6fd8350581b846dbb2efb2fd1bae5906a24672aac6ec65b29b5ff69c77833125', '[\"*\"]', NULL, NULL, '2023-10-14 02:55:54', '2023-10-14 02:55:54'),
(196, 'App\\Models\\User', 15, 'Student', '1bf224192d9c3c0d867efdc462385701e6537d61c04cdc000e67a94e3ccf0d31', '[\"*\"]', NULL, NULL, '2023-10-14 02:55:59', '2023-10-14 02:55:59'),
(197, 'App\\Models\\User', 29, 'Student', '61a16f8491da9d982b206e299129aef10da6a9b24f42169618d4df66db815af4', '[\"*\"]', NULL, NULL, '2023-10-14 02:56:44', '2023-10-14 02:56:44'),
(198, 'App\\Models\\User', 29, 'Student', 'e103a0659fb3a0ebc8e2a58a3efe583148dc7f02dbd523294917263e47a74733', '[\"*\"]', NULL, NULL, '2023-10-14 14:23:04', '2023-10-14 14:23:04'),
(199, 'App\\Models\\User', 29, 'Student', 'd4d6f144aa2fb60c17d91030f6f02a1b8b504611a5b3a2b230b4c957e7a8386f', '[\"*\"]', NULL, NULL, '2023-10-14 14:28:59', '2023-10-14 14:28:59'),
(200, 'App\\Models\\User', 29, 'Student', 'bd1ba9ba9c9336db302b2e631133dc966df42f849fc81f01ea89ae91da26bb61', '[\"*\"]', NULL, NULL, '2023-10-14 22:08:11', '2023-10-14 22:08:11'),
(201, 'App\\Models\\User', 29, 'Student', 'bf46e9c6f1a46e87ec62a4781b3ee8e79cfa6877e2380ab54714065cd43f0553', '[\"*\"]', NULL, NULL, '2023-10-14 22:11:03', '2023-10-14 22:11:03'),
(202, 'App\\Models\\User', 16, 'Administrator', 'e1c69e4c968557a7e2d9a0122b5633407b2e85bfdc552ff22fbf7f884eeeb029', '[\"*\"]', NULL, NULL, '2023-10-14 22:50:09', '2023-10-14 22:50:09'),
(203, 'App\\Models\\User', 29, 'Student', 'aa08dd01fc1fba7c6f8fae21a6018f2ba7463c01cf152e193941ae8e74a183a9', '[\"*\"]', NULL, NULL, '2023-10-15 00:36:16', '2023-10-15 00:36:16'),
(204, 'App\\Models\\User', 16, 'Administrator', 'd5ad3e15fcbc8943b1a89539cd538f5e17656db1509cf3ec98a0f9daa272d33b', '[\"*\"]', NULL, NULL, '2023-10-15 01:05:54', '2023-10-15 01:05:54'),
(205, 'App\\Models\\User', 29, 'Student', 'b74a072d082b1a9d37940dcfbf4edd66d175f60f1d620c586d1c70949715e149', '[\"*\"]', NULL, NULL, '2023-10-15 01:06:26', '2023-10-15 01:06:26'),
(206, 'App\\Models\\User', 29, 'Student', '4d1db73a074773e365356cfefded920228f10b7c32b912dd8edbf7ecf7840633', '[\"*\"]', NULL, NULL, '2023-10-15 01:13:02', '2023-10-15 01:13:02'),
(207, 'App\\Models\\User', 16, 'Administrator', '7a11809617daad60e976823912bca7cdddc88393988ecc78ec409571a0952dde', '[\"*\"]', NULL, NULL, '2023-10-15 01:13:13', '2023-10-15 01:13:13'),
(208, 'App\\Models\\User', 29, 'Student', '6aefa0bcfecf3e3b60914c61dcf00aaaa9a6f8e4e6c32749c6a52c1f4f192f61', '[\"*\"]', NULL, NULL, '2023-10-15 01:13:53', '2023-10-15 01:13:53'),
(209, 'App\\Models\\User', 29, 'Student', '2cf90e73661ea34e96e042c2374339907ff4f9615f9c9efcf5c15045dfce8911', '[\"*\"]', NULL, NULL, '2023-10-15 16:31:13', '2023-10-15 16:31:13'),
(210, 'App\\Models\\User', 16, 'Administrator', '66ab0f41b73ad1e8f6c9e336318e6685930031c021e794774352d0cadce11c92', '[\"*\"]', NULL, NULL, '2023-10-15 16:31:25', '2023-10-15 16:31:25'),
(211, 'App\\Models\\User', 29, 'Student', 'b05b84da3db69c9a99b1259eed2da405f2e820f72cd635ac20e09ac099cd2f44', '[\"*\"]', NULL, NULL, '2023-10-15 16:34:34', '2023-10-15 16:34:34'),
(212, 'App\\Models\\User', 16, 'Administrator', '9a29650cc4b4682455c7568e8c38ec4b007879bbc6dc67cceb73be49af4ac564', '[\"*\"]', NULL, NULL, '2023-10-15 16:43:33', '2023-10-15 16:43:33'),
(213, 'App\\Models\\User', 16, 'Administrator', 'ce893839c34cf4d6c40531782e5142612fc0ae26c38ee0544e4bb2ee9d12d0b1', '[\"*\"]', NULL, NULL, '2023-10-15 16:43:34', '2023-10-15 16:43:34'),
(214, 'App\\Models\\User', 29, 'Student', '0bd987425c52f792e1137bc46eeb0cc0d422163b4f188e3856a56bbfb9049dd3', '[\"*\"]', NULL, NULL, '2023-10-15 16:49:17', '2023-10-15 16:49:17'),
(215, 'App\\Models\\User', 16, 'Administrator', 'e1821d438f35c75a86809e3cd32f80b13de74c77603625efe4bab3ae82a3f2e9', '[\"*\"]', NULL, NULL, '2023-10-15 17:10:10', '2023-10-15 17:10:10'),
(216, 'App\\Models\\User', 29, 'Student', 'ea0a48c0a6adc8ec7bb9c0b530118e9dd099676d79eb2005972c6ed8f90309a3', '[\"*\"]', NULL, NULL, '2023-10-15 17:10:47', '2023-10-15 17:10:47'),
(217, 'App\\Models\\User', 29, 'Student', '528075537ef7aecf57913f3ce5b2dc55dbbe2f1c2bed7c8b5200ad178e139a52', '[\"*\"]', NULL, NULL, '2023-10-15 17:12:24', '2023-10-15 17:12:24'),
(218, 'App\\Models\\User', 16, 'Administrator', 'a8f3261bd021837576e4162cbe3845a5304ea65355e0f26ae1ab259108d2de64', '[\"*\"]', NULL, NULL, '2023-10-15 17:12:31', '2023-10-15 17:12:31'),
(219, 'App\\Models\\User', 29, 'Student', 'ce72bae7ec96cd35a478001248c797028cb03ffae825c7fbb598f2023925a613', '[\"*\"]', NULL, NULL, '2023-10-15 17:20:23', '2023-10-15 17:20:23'),
(220, 'App\\Models\\User', 16, 'Administrator', '8fbcc00e0d75e0e8003bb2b2fc75885475dd6de35fa765e4f6f4c4d4a0bef2e0', '[\"*\"]', NULL, NULL, '2023-10-15 19:19:49', '2023-10-15 19:19:49'),
(221, 'App\\Models\\User', 29, 'Student', '0ce35a4ce5d42ab098557bbf8e84d7fc8b111878d0eab4febb1c5110485de68c', '[\"*\"]', NULL, NULL, '2023-10-15 19:22:53', '2023-10-15 19:22:53'),
(222, 'App\\Models\\User', 16, 'Administrator', '3fd9196829b2a083ff0416d4b25f5afd695f8ed2fb490317a538ed66eb7806c7', '[\"*\"]', NULL, NULL, '2023-10-15 19:32:07', '2023-10-15 19:32:07'),
(223, 'App\\Models\\User', 29, 'Student', '8e8f39dcbf8c23028ec0604c81c794b5bb98fbd2eeabba010a07b7888a787741', '[\"*\"]', NULL, NULL, '2023-10-15 19:38:14', '2023-10-15 19:38:14'),
(224, 'App\\Models\\User', 16, 'Administrator', 'cc93215e0a62c723e5416c4e2331ba3c75fe8132e82c4b7387850a69b863d758', '[\"*\"]', NULL, NULL, '2023-10-15 19:45:31', '2023-10-15 19:45:31'),
(225, 'App\\Models\\User', 29, 'Student', '150f37d7aa4aca5916210fa626ef96bc194961d93871c82f7bed0e6b48c351d4', '[\"*\"]', NULL, NULL, '2023-10-15 19:54:18', '2023-10-15 19:54:18'),
(226, 'App\\Models\\User', 29, 'Student', 'b76f5f28a3fd70be811fd8564e383ed836227a13200c27a030eb829d59c56a5d', '[\"*\"]', NULL, NULL, '2023-10-15 20:15:22', '2023-10-15 20:15:22'),
(227, 'App\\Models\\User', 29, 'Student', '9c0daa2e8773ed2275c95727868250d39627459486fbdf735c4aa223bd2fa51d', '[\"*\"]', NULL, NULL, '2023-10-15 20:15:43', '2023-10-15 20:15:43'),
(228, 'App\\Models\\User', 16, 'Administrator', '12d3bafd18f7c250cfb5909e6852a61fee33eb9de999de819d3abef25d55beca', '[\"*\"]', NULL, NULL, '2023-10-15 20:15:49', '2023-10-15 20:15:49'),
(229, 'App\\Models\\User', 29, 'Student', 'd2edd21d8cb300ad3d1aabccd880302808acd282a985a401cda7687481a5c5c4', '[\"*\"]', NULL, NULL, '2023-10-15 20:30:47', '2023-10-15 20:30:47'),
(230, 'App\\Models\\User', 29, 'Student', '363ac0e2125168c35bf059f1c34628a2458e23df41a2f30c72daf45ac5dfd21d', '[\"*\"]', NULL, NULL, '2023-10-15 22:31:10', '2023-10-15 22:31:10'),
(231, 'App\\Models\\User', 29, 'Student', '86c9715aeb07d14ee0dbdd15c38ebc211bc8ca36c80da4e470a22e8697fc98b6', '[\"*\"]', NULL, NULL, '2023-10-16 23:14:09', '2023-10-16 23:14:09'),
(232, 'App\\Models\\User', 29, 'Student', 'f0404e908e5e4c590794a11673b5e0a46325617b7cde405e8f13c5bbbe872a04', '[\"*\"]', NULL, NULL, '2023-10-17 03:01:13', '2023-10-17 03:01:13'),
(233, 'App\\Models\\User', 16, 'Administrator', 'f1b6e3d8d4ad09b0266343ff18fb5e6e52d7458de1192a43918392752aa95776', '[\"*\"]', NULL, NULL, '2023-10-17 03:01:19', '2023-10-17 03:01:19'),
(234, 'App\\Models\\User', 29, 'Student', 'd848bc57ce246ba2dc24d300587b45dfea1c77423a41f58f0797a2525eee14db', '[\"*\"]', NULL, NULL, '2023-10-17 03:08:29', '2023-10-17 03:08:29'),
(235, 'App\\Models\\User', 29, 'Student', '60af7723d40f41a47a5bae5dfcf9cca9a0bd787f06a3325639b6df40520dc656', '[\"*\"]', NULL, NULL, '2023-10-17 03:12:52', '2023-10-17 03:12:52'),
(236, 'App\\Models\\User', 29, 'Student', '3d93a4a0040c6758f99a16803fb4cdb0f21b6fbcdc9a504c4216fa958c719593', '[\"*\"]', NULL, NULL, '2023-10-17 13:52:05', '2023-10-17 13:52:05'),
(237, 'App\\Models\\User', 16, 'Administrator', '079698b13f9b5a804a29107d3cf15528097b79be6e30df2702c02f14a242c6d6', '[\"*\"]', NULL, NULL, '2023-10-17 13:53:19', '2023-10-17 13:53:19'),
(238, 'App\\Models\\User', 29, 'Student', '37ea182651fa1e16757b0af4b71c060eb695bd14371f09468863f7f0d82d4026', '[\"*\"]', NULL, NULL, '2023-10-17 13:54:50', '2023-10-17 13:54:50'),
(239, 'App\\Models\\User', 29, 'Student', 'ac1978550324c00bebbf4dcee69ea4ba6fe666a4a8976f1b725b5bcf7493f59a', '[\"*\"]', NULL, NULL, '2023-10-17 13:57:49', '2023-10-17 13:57:49'),
(240, 'App\\Models\\User', 16, 'Administrator', '4dfd35045ffede284508f1d240bfc3feced18ac0f015405b141dd02832f48f66', '[\"*\"]', NULL, NULL, '2023-10-17 13:59:12', '2023-10-17 13:59:12'),
(241, 'App\\Models\\User', 29, 'Student', 'e18b40bd56ef2e700f4667db86d6e441444958801f13b87d95c2ee996986f9a5', '[\"*\"]', NULL, NULL, '2023-10-17 14:49:11', '2023-10-17 14:49:11'),
(242, 'App\\Models\\User', 16, 'Administrator', '7b5deb3dfac2584781d726747930d2e8e68c56a132b19763a1f639277d027ed2', '[\"*\"]', NULL, NULL, '2023-10-17 14:49:21', '2023-10-17 14:49:21'),
(243, 'App\\Models\\User', 16, 'Administrator', 'd543ad2d235878938a128b6c82a67f3ccd9c2c777359a18e24f47f3940259406', '[\"*\"]', NULL, NULL, '2023-10-18 01:33:07', '2023-10-18 01:33:07'),
(244, 'App\\Models\\User', 29, 'Student', '82441e50becbf938c2dee7f82bceed479b61d7ee08b2359de213ec84fb2aab0f', '[\"*\"]', NULL, NULL, '2023-10-18 03:34:29', '2023-10-18 03:34:29'),
(245, 'App\\Models\\User', 16, 'Administrator', '850c20ac7de2dede8044a3b9a497e93fdd3c3a17d74cd3b782fe8aff47a24e22', '[\"*\"]', NULL, NULL, '2023-10-18 03:38:13', '2023-10-18 03:38:13'),
(246, 'App\\Models\\User', 15, 'Student', '5a967f741da43c0847122d8e5e415fa3051f1b9bb826d9d07c2ca7168be30c88', '[\"*\"]', NULL, NULL, '2023-10-18 03:40:09', '2023-10-18 03:40:09'),
(247, 'App\\Models\\User', 15, 'Student', '63941522f2ce1afe651170ba0111be3beabd43855b947f1e457feb7beb47ed6f', '[\"*\"]', NULL, NULL, '2023-10-18 03:40:13', '2023-10-18 03:40:13'),
(248, 'App\\Models\\User', 16, 'Administrator', '14ef0eaa7135bf2af12e3c0426aa5242f73574bf3ce5cb0f16066a683f41ae38', '[\"*\"]', NULL, NULL, '2023-10-18 03:40:17', '2023-10-18 03:40:17'),
(249, 'App\\Models\\User', 29, 'Student', '1eaab9fd981e46261bc2d64db1fe721764fd0a4baf07f3e649b395584f244f1c', '[\"*\"]', NULL, NULL, '2023-10-18 03:42:08', '2023-10-18 03:42:08'),
(250, 'App\\Models\\User', 16, 'Administrator', '8da2a42d4f0cb19addd7a13557f2f1082b386396da75ad2b62386eef90f0d7a6', '[\"*\"]', NULL, NULL, '2023-10-18 08:54:43', '2023-10-18 08:54:43'),
(251, 'App\\Models\\User', 29, 'Student', '7ef021cedaf3c631e6fdbe52d9c0c3dc67fe21ab6432d98f5018798327306781', '[\"*\"]', NULL, NULL, '2023-10-18 08:56:03', '2023-10-18 08:56:03'),
(252, 'App\\Models\\User', 16, 'Administrator', 'bec75dee887dfa4237dcdfb7d6c385afb86ca1ea92788662a2a06f94602fe4fe', '[\"*\"]', NULL, NULL, '2023-10-18 10:56:00', '2023-10-18 10:56:00'),
(253, 'App\\Models\\User', 29, 'Student', '10d3e7334fafa1be1d267931671c615e6f60f707d9046e23adb97bbe36b843b8', '[\"*\"]', NULL, NULL, '2023-10-18 13:56:08', '2023-10-18 13:56:08');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lesson_id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `lesson_id`, `question`, `created_at`, `updated_at`) VALUES
(4, 23, 'What is the capital of France?', '2023-10-18 13:43:39', '2023-10-18 13:43:39'),
(5, 23, 'How old are you ?', '2023-10-18 13:55:40', '2023-10-18 13:55:40');

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

CREATE TABLE `schools` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`id`, `name`, `created_at`, `updated_at`) VALUES
(5, 'مدرسة جنزور', '2023-10-13 01:34:28', '2023-10-13 01:34:28');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `school_id`, `name`, `address`, `class`, `image`, `note`, `created_at`, `updated_at`, `user_id`, `phone`) VALUES
(8, 5, 'eefef', 'fef', 'efef', 'student_images/YnopRoPvpTWW6SSYPLanMSL31P2lVKj6DsggQYSb.jpg', 'efef', '2023-10-13 02:50:04', '2023-10-13 02:50:04', 27, ''),
(10, 5, 'hemo', 'fewfwe', 'fewfwe', 'student_images/sk5JYiOoQxAKaZBw519F2pkhMG7YpA0g1Mn8MhtA.jpg', 'fewwef', '2023-10-14 02:02:19', '2023-10-14 02:02:19', 29, '0923290545');

-- --------------------------------------------------------

--
-- Table structure for table `student_unit`
--

CREATE TABLE `student_unit` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_unit`
--

INSERT INTO `student_unit` (`id`, `student_id`, `unit_id`, `created_at`, `updated_at`) VALUES
(6, 10, 15, NULL, NULL),
(7, 10, 16, NULL, NULL),
(8, 10, 17, NULL, NULL),
(9, 10, 15, NULL, NULL),
(10, 10, 15, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_unit_lesson_media_file`
--

CREATE TABLE `student_unit_lesson_media_file` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `lesson_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `file` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `user_id`, `name`, `image`, `description`, `created_at`, `updated_at`, `file`) VALUES
(15, 16, 'Unit 1', 'unit_images/rsarkvoOOynVgwa9Iv8MS4Ss9vhMgVVotQqgeyyk.png', 'Our School', '2023-10-15 19:50:01', '2023-10-15 19:50:01', NULL),
(16, 16, 'Unit 2', 'unit_images/0DLJE2bjZ5cJP54muKQRHmPvUWROJrbKQOswvu4v.png', 'Around The World', '2023-10-15 19:50:46', '2023-10-15 19:50:46', NULL),
(17, 16, 'Unit 3', 'unit_images/aGr9hIkWQXuZotChMD4q5INhl5W4xilMZKd7KUn8.png', 'Open Day', '2023-10-15 19:50:59', '2023-10-15 19:50:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` enum('admin','student','teacher') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`) VALUES
(1, 'Eldridge Bahringer', 'fatima.prosacco@example.com', '2023-10-10 01:22:00', '$2y$10$pTFGia.y5mXuFLrNyZo5XeEWMwQa6fWcAqeJ31JmDudYDd4Pnrutu', '1YDHAgYRIL', '2023-10-10 01:22:00', '2023-10-10 01:22:00', 'admin'),
(2, 'Orlando Rippin PhD', 'izboncak@example.com', '2023-10-10 01:22:00', '$2y$10$5XTSf.Z3lJu2D4z19ROZY.lsvEk3ufZFhWHEou3rmBBhYQlgPmPA2', 'KjuHOQXsQE', '2023-10-10 01:22:00', '2023-10-10 01:22:00', 'admin'),
(3, 'Dr. Ernie Koepp', 'boyer.braulio@example.org', '2023-10-10 01:22:00', '$2y$10$1QmgCAzR9ckTYGEvl6aXIOGP99Gn9TsDhsxv1FGWV2hROzXnZAzAG', '6NcfXOSsaZ', '2023-10-10 01:22:00', '2023-10-10 01:22:00', 'admin'),
(4, 'Marshall Stroman', 'renee.doyle@example.org', '2023-10-10 01:22:00', '$2y$10$cKs75xs9yqKFyjnI1VNMb.bO05IPw4ZAWHQ0ElEGlZhPuLotzKKQu', 'eDRxGTv5MJ', '2023-10-10 01:22:00', '2023-10-10 01:22:00', 'admin'),
(5, 'Gerry Goyette', 'gokuneva@example.net', '2023-10-10 01:22:00', '$2y$10$HNb/9e.ux5yGjlOTrwLm/eEMg0FARY3D/p364XdDlIbsL4wXVjrO6', 'meS6B7oRzt', '2023-10-10 01:22:00', '2023-10-10 01:22:00', 'admin'),
(6, 'Mr. Albert Orn DVM', 'qblanda@example.org', '2023-10-10 01:22:00', '$2y$10$IjPF4erZ8LHwx/zwpm59suU8BwVox2tZmiLezlicy5fJjMCJLX8s6', '3MgWe6dmLx', '2023-10-10 01:22:00', '2023-10-10 01:22:00', 'admin'),
(7, 'Paris Lindgren', 'ddare@example.com', '2023-10-10 01:22:00', '$2y$10$kH9ISNL5T12tRYTWDeXKY.mf6Q0TsCMK4suTpdLPsvYExSzCvieMi', 'ddpObBAGjV', '2023-10-10 01:22:00', '2023-10-10 01:22:00', 'admin'),
(8, 'Annamae Gerhold', 'streich.dorcas@example.org', '2023-10-10 01:22:00', '$2y$10$AL2bDMvWVV476aaHVUA1Nu8RDtqrctDwSRVbCXhWvzc4LQbH8HIjG', 'CwWUmYCMcs', '2023-10-10 01:22:00', '2023-10-10 01:22:00', 'admin'),
(9, 'Prof. Kevin Fadel', 'jacinto13@example.com', '2023-10-10 01:22:00', '$2y$10$RzJOSUi8vRnk7LiRYDry9.hGhJX7GtdT.j7WNZ08TFCgJHgb4HtHC', 'VT3s9hVce4', '2023-10-10 01:22:00', '2023-10-10 01:22:00', 'admin'),
(10, 'Torrey Fay', 'savanna74@example.net', '2023-10-10 01:22:00', '$2y$10$U/KWGu6d5eOekIcHQupQh.kPdrSpoXIqAnwuaBUuf5HpMjm7YuktW', 'zKGpOLl9vu', '2023-10-10 01:22:00', '2023-10-10 01:22:00', 'admin'),
(11, 'Tmohimen', 'test@email.com', '2023-10-10 01:22:00', '$2y$10$stx8r6zMUlMSk8yGP4EeUOlH2Psn3Mw/P76SZ0Sd/igiV/JDYzA5S', 'MDpOdruq4N', '2023-10-10 01:22:00', '2023-10-10 01:22:00', 'admin'),
(12, 'dsadsad', 'sad@ss', NULL, '$2y$10$FpGShd5NE6B.muYCKPZ0hOxhdI/CogVdlshdRZoCkM4g6dpJhq8WG', NULL, '2023-10-10 01:30:04', '2023-10-10 01:30:04', 'student'),
(14, 'dsadsad', 'sad@sss', NULL, '$2y$10$sF2XOAZm03H2RFmI7jcdaObN72N6/aSgLKh89M72qSW0a3nomW.EK', NULL, '2023-10-10 13:28:49', '2023-10-10 13:28:49', 'student'),
(15, 'mohimen', 'mohimen@gmail.com', NULL, '$2y$10$l2PKQ2hZJEBMBfTUdet3WuTBRqo/r303Y46ANtWtZSybuzWXBp3WO', NULL, '2023-10-10 13:35:51', '2023-10-10 13:35:51', 'student'),
(16, 'mohimen admin', 'admin_tnt@gmail.com', NULL, '$2y$10$UBoExQr20u3b.vIMP6w8/eW6dm5uNGsXHgNst6dL6t1id5qBh9zfO', NULL, '2023-10-10 23:31:48', '2023-10-10 23:31:48', 'admin'),
(17, 'test admin', 'admin_test@gmail.com', NULL, '$2y$10$rx7BvMHTn6SDs6OVj5FrKOQc59lBobPOszuTD3T0Thby.ZT.IhLya', NULL, '2023-10-11 14:06:25', '2023-10-11 14:06:25', 'admin'),
(19, 'test admin', 'admin_testt@gmail.com', NULL, '$2y$10$PAPetTz5FOIpvz53H9HFbuwqxAwHqPQQo.MUnvkH.UAXV/.TIVfkO', NULL, '2023-10-13 02:07:30', '2023-10-13 02:07:30', 'admin'),
(20, 'mohimen', 'mohimenn@gmail.com', NULL, '$2y$10$/uSLs5F8.O09BUJK5hvG8OR0sjUYcQ9N0fTWLsG5oMyImP1TgKz7S', NULL, '2023-10-13 02:08:00', '2023-10-13 02:08:00', 'student'),
(21, 'mohimen', 'mohimenwn@gmail.com', NULL, '$2y$10$p71zIu7vLNplYotyC18pOernvDxriU5.QBRMXINv6j6kfaUJf9Shi', NULL, '2023-10-13 02:08:31', '2023-10-13 02:08:31', 'student'),
(23, 'mohimen', 'mohimenwrn@gmail.com', NULL, '$2y$10$0g2KhjsnlkKnKMRbcfY9bOpX1V3SEIOnmfdbtWnHbIjsy2NXwN0cW', NULL, '2023-10-13 02:09:01', '2023-10-13 02:09:01', 'student'),
(24, 'dasdsad', 'wdqw@gmail.com', NULL, '$2y$10$qLqdGo2kEW6MitZqQ5l0ZeBHHL8RMSVWJGiT2fyIsAEkG.QYXyvEu', NULL, '2023-10-13 02:27:01', '2023-10-13 02:27:01', 'student'),
(25, 'fdsfdsfsd', 'fdsfdsfds@gmail.com', NULL, '$2y$10$Sy2/R24ZdNHhw1QtfgaN3.q7KSdEdLmcNlzx4bGtcI/4OGDd6TWdG', NULL, '2023-10-13 02:31:34', '2023-10-13 02:31:34', 'student'),
(26, 'dddadas', 'dddd@gmail.com', NULL, '$2y$10$49a/hBaTBxm.YMg08RikOObRldrk819NrR69Y/mMy7UnI3Ann6O.O', NULL, '2023-10-13 02:46:30', '2023-10-13 02:46:30', 'student'),
(27, 'eefef', 'eeeeen@gmail.com', NULL, '$2y$10$vQrSCTbbCFp15jDV6oNwwu4w6xTsvDeguY3RVFgPQfd.A8SJNwjKS', NULL, '2023-10-13 02:50:04', '2023-10-13 02:50:04', 'student'),
(28, 'fewfwewwef', 'eeeeeerf@gmail.com', NULL, '$2y$10$6ytwbZiu3UYj8sQTEYfFb.bWBUOGcAXvA5EwYznFdSUYkEofC9ngO', NULL, '2023-10-13 02:55:23', '2023-10-13 02:55:23', 'student'),
(29, 'hemo', 'hemo_st@gm.com', NULL, '$2y$10$kM/sN1Yb03UmQyqlf.Krv.6MVJlgHe.NKvtfNqe1wbm0rNCqZMDCq', NULL, '2023-10-14 02:02:19', '2023-10-14 02:02:19', 'student');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrators`
--
ALTER TABLE `administrators`
  ADD PRIMARY KEY (`id`),
  ADD KEY `administrators_user_id_foreign` (`user_id`);

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `answers_question_id_foreign` (`question_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lessons_unit_id_foreign` (`unit_id`),
  ADD KEY `lessons_user_id_foreign` (`user_id`);

--
-- Indexes for table `lesson_student`
--
ALTER TABLE `lesson_student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lesson_student_student_id_foreign` (`student_id`),
  ADD KEY `lesson_student_lesson_id_foreign` (`lesson_id`);

--
-- Indexes for table `media_files`
--
ALTER TABLE `media_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_files_lesson_id_foreign` (`lesson_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `questions_lesson_id_foreign` (`lesson_id`);

--
-- Indexes for table `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `students_school_id_foreign` (`school_id`),
  ADD KEY `students_user_id_foreign` (`user_id`);

--
-- Indexes for table `student_unit`
--
ALTER TABLE `student_unit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_unit_student_id_foreign` (`student_id`),
  ADD KEY `student_unit_unit_id_foreign` (`unit_id`);

--
-- Indexes for table `student_unit_lesson_media_file`
--
ALTER TABLE `student_unit_lesson_media_file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_unit_lesson_media_file_student_id_foreign` (`student_id`),
  ADD KEY `student_unit_lesson_media_file_unit_id_foreign` (`unit_id`),
  ADD KEY `student_unit_lesson_media_file_lesson_id_foreign` (`lesson_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teachers_school_id_foreign` (`school_id`),
  ADD KEY `teachers_user_id_foreign` (`user_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `units_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrators`
--
ALTER TABLE `administrators`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `lesson_student`
--
ALTER TABLE `lesson_student`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `media_files`
--
ALTER TABLE `media_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=254;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `schools`
--
ALTER TABLE `schools`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `student_unit`
--
ALTER TABLE `student_unit`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `student_unit_lesson_media_file`
--
ALTER TABLE `student_unit_lesson_media_file`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `administrators`
--
ALTER TABLE `administrators`
  ADD CONSTRAINT `administrators_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`);

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`),
  ADD CONSTRAINT `lessons_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `lesson_student`
--
ALTER TABLE `lesson_student`
  ADD CONSTRAINT `lesson_student_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`),
  ADD CONSTRAINT `lesson_student_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `media_files`
--
ALTER TABLE `media_files`
  ADD CONSTRAINT `media_files_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`),
  ADD CONSTRAINT `students_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `student_unit`
--
ALTER TABLE `student_unit`
  ADD CONSTRAINT `student_unit_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `student_unit_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `student_unit_lesson_media_file`
--
ALTER TABLE `student_unit_lesson_media_file`
  ADD CONSTRAINT `student_unit_lesson_media_file_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`),
  ADD CONSTRAINT `student_unit_lesson_media_file_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `student_unit_lesson_media_file_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`),
  ADD CONSTRAINT `teachers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `units`
--
ALTER TABLE `units`
  ADD CONSTRAINT `units_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
