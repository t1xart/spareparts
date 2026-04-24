-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Apr 2026 pada 03.35
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spareparts`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `log_name` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `subject_type` varchar(255) DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `causer_type` varchar(255) DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `batch_uuid` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(1, 'default', 'created', 'App\\Models\\Branch', 'created', 1, NULL, NULL, '{\"attributes\":{\"name\":\"Jambi Handil\",\"address\":null,\"city\":\"Jambi\",\"province\":\"Jambi\",\"phone\":\"0741-1234567\",\"is_active\":true}}', NULL, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(2, 'default', 'created', 'App\\Models\\Product', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"sku\":\"AKI-202604-0001\",\"name\":\"Aki Motor\",\"slug\":\"aki-motor\",\"category_id\":8,\"description\":\"Aki motor\",\"buy_price\":\"100000.00\",\"sell_price\":\"150000.00\",\"unit\":\"pcs\",\"min_stock\":5,\"shelf_code\":\"A-89-90\",\"warranty_days\":7,\"weight\":\"150.00\",\"image\":null,\"is_active\":true}}', NULL, '2026-04-20 02:30:35', '2026-04-20 02:30:35'),
(3, 'default', 'deleted', 'App\\Models\\Product', 'deleted', 1, 'App\\Models\\User', 1, '{\"old\":{\"sku\":\"AKI-202604-0001\",\"name\":\"Aki Motor\",\"slug\":\"aki-motor\",\"category_id\":8,\"description\":\"Aki motor\",\"buy_price\":\"100000.00\",\"sell_price\":\"150000.00\",\"unit\":\"pcs\",\"min_stock\":5,\"shelf_code\":\"A-89-90\",\"warranty_days\":7,\"weight\":\"150.00\",\"image\":null,\"is_active\":true}}', NULL, '2026-04-20 04:59:51', '2026-04-20 04:59:51'),
(4, 'default', 'created', 'App\\Models\\Product', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"sku\":\"BUS-202604-0001\",\"name\":\"Busi\",\"slug\":\"busi\",\"category_id\":10,\"description\":\"Busi\",\"buy_price\":\"15000.00\",\"sell_price\":\"15000.00\",\"unit\":\"pcs\",\"min_stock\":5,\"shelf_code\":\"A-89-90000\",\"warranty_days\":0,\"weight\":null,\"image\":null,\"is_active\":true}}', NULL, '2026-04-20 05:23:18', '2026-04-20 05:23:18'),
(5, 'default', 'created', 'App\\Models\\Sale', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"invoice_number\":\"INV-20260420-0001\",\"branch_id\":1,\"customer_name\":\"udin\",\"customer_phone\":\"083112095128\",\"payment_method\":\"qris\",\"subtotal\":\"15000.00\",\"discount\":\"1.00\",\"tax\":\"0.00\",\"total\":\"14999.00\",\"paid_amount\":\"14999.00\",\"change_amount\":\"0.00\",\"status\":\"paid\",\"notes\":null,\"user_id\":1}}', NULL, '2026-04-20 05:32:47', '2026-04-20 05:32:47'),
(6, 'default', 'updated', 'App\\Models\\Sale', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"invoice_number\":\"INV-20260420-0001\",\"branch_id\":1,\"customer_name\":\"udin\",\"customer_phone\":\"083112095128\",\"payment_method\":\"qris\",\"subtotal\":\"15000.00\",\"discount\":\"1.00\",\"tax\":\"0.00\",\"total\":\"14999.00\",\"paid_amount\":\"14999.00\",\"change_amount\":\"0.00\",\"status\":\"returned\",\"notes\":null,\"user_id\":1},\"old\":{\"invoice_number\":\"INV-20260420-0001\",\"branch_id\":1,\"customer_name\":\"udin\",\"customer_phone\":\"083112095128\",\"payment_method\":\"qris\",\"subtotal\":\"15000.00\",\"discount\":\"1.00\",\"tax\":\"0.00\",\"total\":\"14999.00\",\"paid_amount\":\"14999.00\",\"change_amount\":\"0.00\",\"status\":\"paid\",\"notes\":null,\"user_id\":1}}', NULL, '2026-04-20 05:32:58', '2026-04-20 05:32:58'),
(7, 'default', 'created', 'App\\Models\\Sale', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"invoice_number\":\"INV-20260420-0002\",\"branch_id\":1,\"customer_name\":null,\"customer_phone\":null,\"payment_method\":\"qris\",\"subtotal\":\"45000.00\",\"discount\":\"0.00\",\"tax\":\"0.00\",\"total\":\"45000.00\",\"paid_amount\":\"45000.00\",\"change_amount\":\"0.00\",\"status\":\"paid\",\"notes\":null,\"user_id\":1}}', NULL, '2026-04-20 05:39:10', '2026-04-20 05:39:10'),
(8, 'default', 'created', 'App\\Models\\WorkOrder', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"wo_number\":\"WO-202604-0001\",\"branch_id\":1,\"customer_name\":\"Udin\",\"customer_phone\":\"083112095128\",\"vehicle_plate\":\"BH1266 YD\",\"vehicle_type_id\":10,\"vehicle_year\":2025,\"complaint\":\"busi\",\"diagnosis\":null,\"service_fee\":\"100000.00\",\"parts_total\":\"30000.00\",\"total\":\"130000.00\",\"status\":\"pending\",\"user_id\":1,\"started_at\":null,\"finished_at\":null}}', NULL, '2026-04-20 05:40:45', '2026-04-20 05:40:45'),
(9, 'default', 'updated', 'App\\Models\\WorkOrder', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"wo_number\":\"WO-202604-0001\",\"branch_id\":1,\"customer_name\":\"Udin\",\"customer_phone\":\"083112095128\",\"vehicle_plate\":\"BH1266 YD\",\"vehicle_type_id\":10,\"vehicle_year\":2025,\"complaint\":\"busi\",\"diagnosis\":null,\"service_fee\":\"100000.00\",\"parts_total\":\"30000.00\",\"total\":\"130000.00\",\"status\":\"done\",\"user_id\":1,\"started_at\":null,\"finished_at\":\"2026-04-20T12:41:02.000000Z\"},\"old\":{\"wo_number\":\"WO-202604-0001\",\"branch_id\":1,\"customer_name\":\"Udin\",\"customer_phone\":\"083112095128\",\"vehicle_plate\":\"BH1266 YD\",\"vehicle_type_id\":10,\"vehicle_year\":2025,\"complaint\":\"busi\",\"diagnosis\":null,\"service_fee\":\"100000.00\",\"parts_total\":\"30000.00\",\"total\":\"130000.00\",\"status\":\"pending\",\"user_id\":1,\"started_at\":null,\"finished_at\":null}}', NULL, '2026-04-20 05:41:02', '2026-04-20 05:41:02'),
(10, 'default', 'created', 'App\\Models\\Supplier', 'created', 1, NULL, NULL, '{\"attributes\":{\"name\":\"PT Astra Honda Motor\",\"code\":\"SUP-AHM-0001\",\"contact_person\":\"Budi Santoso\",\"phone\":\"021-12345678\",\"email\":\"sales@ahm.co.id\",\"address\":null,\"city\":\"Jakarta\",\"province\":\"DKI Jakarta\",\"bank_name\":null,\"bank_account\":null,\"rating\":0,\"is_active\":true}}', NULL, '2026-04-20 05:44:09', '2026-04-20 05:44:09'),
(11, 'default', 'created', 'App\\Models\\Supplier', 'created', 2, NULL, NULL, '{\"attributes\":{\"name\":\"PT Yamaha Indonesia\",\"code\":\"SUP-YMH-0002\",\"contact_person\":\"Siti Rahayu\",\"phone\":\"021-87654321\",\"email\":\"sales@yamaha.co.id\",\"address\":null,\"city\":\"Jakarta\",\"province\":\"DKI Jakarta\",\"bank_name\":null,\"bank_account\":null,\"rating\":0,\"is_active\":true}}', NULL, '2026-04-20 05:44:09', '2026-04-20 05:44:09'),
(12, 'default', 'created', 'App\\Models\\Supplier', 'created', 3, NULL, NULL, '{\"attributes\":{\"name\":\"CV Sparepart Nusantara\",\"code\":\"SUP-SPN-0003\",\"contact_person\":\"Ahmad Fauzi\",\"phone\":\"0741-556677\",\"email\":\"info@sparepartnusantara.com\",\"address\":null,\"city\":\"Jambi\",\"province\":\"Jambi\",\"bank_name\":null,\"bank_account\":null,\"rating\":0,\"is_active\":true}}', NULL, '2026-04-20 05:44:09', '2026-04-20 05:44:09'),
(13, 'default', 'created', 'App\\Models\\Supplier', 'created', 4, NULL, NULL, '{\"attributes\":{\"name\":\"UD Maju Jaya Motor\",\"code\":\"SUP-MJM-0004\",\"contact_person\":\"Dewi Lestari\",\"phone\":\"0741-998877\",\"email\":null,\"address\":null,\"city\":\"Jambi\",\"province\":\"Jambi\",\"bank_name\":null,\"bank_account\":null,\"rating\":0,\"is_active\":true}}', NULL, '2026-04-20 05:44:09', '2026-04-20 05:44:09'),
(14, 'default', 'created', 'App\\Models\\PurchaseOrder', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"po_number\":\"PO-202604-0001\",\"supplier_id\":4,\"branch_id\":1,\"status\":\"draft\",\"total_amount\":\"15000.00\",\"notes\":null,\"ordered_at\":\"2026-04-20T00:00:00.000000Z\",\"received_at\":null,\"user_id\":1}}', NULL, '2026-04-20 05:46:04', '2026-04-20 05:46:04'),
(15, 'default', 'deleted', 'App\\Models\\Product', 'deleted', 2, 'App\\Models\\User', 1, '{\"old\":{\"sku\":\"BUS-202604-0001\",\"name\":\"Busi\",\"slug\":\"busi\",\"category_id\":10,\"description\":\"Busi\",\"buy_price\":\"15000.00\",\"sell_price\":\"15000.00\",\"unit\":\"pcs\",\"min_stock\":5,\"shelf_code\":\"A-89-90000\",\"warranty_days\":0,\"weight\":null,\"image\":null,\"is_active\":true}}', NULL, '2026-04-20 05:48:46', '2026-04-20 05:48:46'),
(16, 'default', 'created', 'App\\Models\\Product', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"sku\":\"BUS-202604-0001\",\"name\":\"Busi\",\"slug\":\"busi\",\"category_id\":10,\"description\":null,\"buy_price\":\"10000.00\",\"sell_price\":\"20000.00\",\"unit\":\"pcs\",\"min_stock\":5,\"shelf_code\":\"A-89-901\",\"warranty_days\":0,\"weight\":null,\"image\":null,\"is_active\":true}}', NULL, '2026-04-20 05:50:09', '2026-04-20 05:50:09'),
(17, 'default', 'deleted', 'App\\Models\\Product', 'deleted', 3, 'App\\Models\\User', 1, '{\"old\":{\"sku\":\"BUS-202604-0001\",\"name\":\"Busi\",\"slug\":\"busi\",\"category_id\":10,\"description\":null,\"buy_price\":\"10000.00\",\"sell_price\":\"20000.00\",\"unit\":\"pcs\",\"min_stock\":5,\"shelf_code\":\"A-89-901\",\"warranty_days\":0,\"weight\":null,\"image\":null,\"is_active\":true}}', NULL, '2026-04-20 06:05:54', '2026-04-20 06:05:54'),
(18, 'default', 'created', 'App\\Models\\Product', 'created', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"sku\":\"BUS-202604-0001\",\"name\":\"Busi\",\"slug\":\"busi\",\"category_id\":10,\"description\":\"busi\",\"buy_price\":\"15000.00\",\"sell_price\":\"2000.00\",\"unit\":\"pcs\",\"min_stock\":5,\"shelf_code\":\"A-89-90000\",\"warranty_days\":1,\"weight\":null,\"image\":null,\"is_active\":true}}', NULL, '2026-04-20 06:06:34', '2026-04-20 06:06:34'),
(19, 'default', 'deleted', 'App\\Models\\Product', 'deleted', 4, 'App\\Models\\User', 1, '{\"old\":{\"sku\":\"BUS-202604-0001\",\"name\":\"Busi\",\"slug\":\"busi\",\"category_id\":10,\"description\":\"busi\",\"buy_price\":\"15000.00\",\"sell_price\":\"2000.00\",\"unit\":\"pcs\",\"min_stock\":5,\"shelf_code\":\"A-89-90000\",\"warranty_days\":1,\"weight\":null,\"image\":null,\"is_active\":true}}', NULL, '2026-04-20 06:06:53', '2026-04-20 06:06:53'),
(20, 'default', 'created', 'App\\Models\\Product', 'created', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"sku\":\"BUS-202604-0001\",\"name\":\"Busi\",\"slug\":\"busi\",\"category_id\":10,\"description\":\"Busi\",\"buy_price\":\"15000.00\",\"sell_price\":\"20000.00\",\"unit\":\"pcs\",\"min_stock\":5,\"shelf_code\":\"A-89-90000\",\"warranty_days\":11,\"weight\":null,\"image\":null,\"is_active\":true}}', NULL, '2026-04-20 06:08:24', '2026-04-20 06:08:24'),
(21, 'default', 'updated', 'App\\Models\\Product', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"sku\":\"BUS-202604-0001\",\"name\":\"Busi Updated\",\"slug\":\"busi-updated\",\"category_id\":10,\"description\":\"Busi\",\"buy_price\":\"10000.00\",\"sell_price\":\"20000.00\",\"unit\":\"pcs\",\"min_stock\":5,\"shelf_code\":\"A-89-90000\",\"warranty_days\":11,\"weight\":null,\"image\":null,\"is_active\":true},\"old\":{\"sku\":\"BUS-202604-0001\",\"name\":\"Busi\",\"slug\":\"busi\",\"category_id\":10,\"description\":\"Busi\",\"buy_price\":\"15000.00\",\"sell_price\":\"20000.00\",\"unit\":\"pcs\",\"min_stock\":5,\"shelf_code\":\"A-89-90000\",\"warranty_days\":11,\"weight\":null,\"image\":null,\"is_active\":true}}', NULL, '2026-04-20 06:14:40', '2026-04-20 06:14:40'),
(22, 'default', 'deleted', 'App\\Models\\Product', 'deleted', 5, 'App\\Models\\User', 1, '{\"old\":{\"sku\":\"BUS-202604-0001\",\"name\":\"Busi Updated\",\"slug\":\"busi-updated\",\"category_id\":10,\"description\":\"Busi\",\"buy_price\":\"10000.00\",\"sell_price\":\"20000.00\",\"unit\":\"pcs\",\"min_stock\":5,\"shelf_code\":\"A-89-90000\",\"warranty_days\":11,\"weight\":null,\"image\":null,\"is_active\":true}}', NULL, '2026-04-20 06:16:15', '2026-04-20 06:16:15'),
(23, 'default', 'created', 'App\\Models\\Product', 'created', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"sku\":\"BUS-202604-0001\",\"name\":\"Busi\",\"slug\":\"busi\",\"category_id\":10,\"description\":\"rtert\",\"buy_price\":\"15000.00\",\"sell_price\":\"20000.00\",\"unit\":\"pcs\",\"min_stock\":5,\"shelf_code\":\"A-89-90000\",\"warranty_days\":0,\"weight\":null,\"image\":null,\"is_active\":true}}', NULL, '2026-04-20 06:16:54', '2026-04-20 06:16:54'),
(24, 'default', 'deleted', 'App\\Models\\Product', 'deleted', 6, 'App\\Models\\User', 1, '{\"old\":{\"sku\":\"BUS-202604-0001\",\"name\":\"Busi\",\"slug\":\"busi\",\"category_id\":10,\"description\":\"rtert\",\"buy_price\":\"15000.00\",\"sell_price\":\"20000.00\",\"unit\":\"pcs\",\"min_stock\":5,\"shelf_code\":\"A-89-90000\",\"warranty_days\":0,\"weight\":null,\"image\":null,\"is_active\":true}}', NULL, '2026-04-20 06:17:01', '2026-04-20 06:17:01'),
(25, 'default', 'created', 'App\\Models\\Product', 'created', 7, NULL, NULL, '{\"attributes\":{\"sku\":\"BUS-202604-0001\",\"name\":\"Busi NGK CR7HSA\",\"slug\":\"busi-ngk-cr7hsa\",\"category_id\":4,\"description\":null,\"buy_price\":\"15000.00\",\"sell_price\":\"25000.00\",\"unit\":\"pcs\",\"min_stock\":5,\"shelf_code\":null,\"warranty_days\":0,\"weight\":null,\"image\":null,\"is_active\":true}}', NULL, '2026-04-20 06:19:46', '2026-04-20 06:19:46'),
(26, 'default', 'created', 'App\\Models\\Product', 'created', 8, NULL, NULL, '{\"attributes\":{\"sku\":\"OLI-202604-0002\",\"name\":\"Oli Mesin AHM 10W-30\",\"slug\":\"oli-mesin-ahm-10w30\",\"category_id\":2,\"description\":null,\"buy_price\":\"35000.00\",\"sell_price\":\"55000.00\",\"unit\":\"liter\",\"min_stock\":10,\"shelf_code\":null,\"warranty_days\":0,\"weight\":null,\"image\":null,\"is_active\":true}}', NULL, '2026-04-20 06:19:46', '2026-04-20 06:19:46'),
(27, 'default', 'created', 'App\\Models\\Product', 'created', 9, NULL, NULL, '{\"attributes\":{\"sku\":\"REM-202604-0003\",\"name\":\"Kampas Rem Depan Honda Beat\",\"slug\":\"kampas-rem-depan-honda-beat\",\"category_id\":3,\"description\":null,\"buy_price\":\"25000.00\",\"sell_price\":\"45000.00\",\"unit\":\"set\",\"min_stock\":5,\"shelf_code\":null,\"warranty_days\":0,\"weight\":null,\"image\":null,\"is_active\":true}}', NULL, '2026-04-20 06:19:46', '2026-04-20 06:19:46'),
(28, 'default', 'created', 'App\\Models\\Product', 'created', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"sku\":\"OLI-202604-0003\",\"name\":\"Oli Mesin Honda 1L\",\"slug\":\"oli-mesin-honda-1l\",\"category_id\":33,\"description\":\"OLI\",\"buy_price\":\"1110000.00\",\"sell_price\":\"20000000.00\",\"unit\":\"liter\",\"min_stock\":5,\"shelf_code\":\"L-010-11\",\"warranty_days\":1,\"weight\":null,\"image\":null,\"is_active\":true}}', NULL, '2026-04-20 06:21:45', '2026-04-20 06:21:45'),
(29, 'default', 'deleted', 'App\\Models\\Product', 'deleted', 10, 'App\\Models\\User', 1, '{\"old\":{\"sku\":\"OLI-202604-0003\",\"name\":\"Oli Mesin Honda 1L\",\"slug\":\"oli-mesin-honda-1l\",\"category_id\":33,\"description\":\"OLI\",\"buy_price\":\"1110000.00\",\"sell_price\":\"20000000.00\",\"unit\":\"liter\",\"min_stock\":5,\"shelf_code\":\"L-010-11\",\"warranty_days\":1,\"weight\":null,\"image\":null,\"is_active\":true}}', NULL, '2026-04-20 06:22:05', '2026-04-20 06:22:05'),
(30, 'default', 'updated', 'App\\Models\\Product', 'updated', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"sku\":\"BUS-202604-0001\",\"name\":\"Busi NGK\",\"slug\":\"busi-ngk\",\"category_id\":4,\"description\":null,\"buy_price\":\"15000.00\",\"sell_price\":\"25000.00\",\"unit\":\"pcs\",\"min_stock\":5,\"shelf_code\":null,\"warranty_days\":0,\"weight\":null,\"image\":null,\"is_active\":true},\"old\":{\"sku\":\"BUS-202604-0001\",\"name\":\"Busi NGK CR7HSA\",\"slug\":\"busi-ngk-cr7hsa\",\"category_id\":4,\"description\":null,\"buy_price\":\"15000.00\",\"sell_price\":\"25000.00\",\"unit\":\"pcs\",\"min_stock\":5,\"shelf_code\":null,\"warranty_days\":0,\"weight\":null,\"image\":null,\"is_active\":true}}', NULL, '2026-04-20 06:22:58', '2026-04-20 06:22:58'),
(31, 'default', 'updated', 'App\\Models\\Product', 'updated', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"sku\":\"OLI-202604-0002\",\"name\":\"Oli\",\"slug\":\"oli\",\"category_id\":2,\"description\":null,\"buy_price\":\"35.00\",\"sell_price\":\"55.00\",\"unit\":\"liter\",\"min_stock\":10,\"shelf_code\":null,\"warranty_days\":1,\"weight\":null,\"image\":null,\"is_active\":true},\"old\":{\"sku\":\"OLI-202604-0002\",\"name\":\"Oli Mesin AHM 10W-30\",\"slug\":\"oli-mesin-ahm-10w30\",\"category_id\":2,\"description\":null,\"buy_price\":\"35000.00\",\"sell_price\":\"55000.00\",\"unit\":\"liter\",\"min_stock\":10,\"shelf_code\":null,\"warranty_days\":0,\"weight\":null,\"image\":null,\"is_active\":true}}', NULL, '2026-04-20 06:23:45', '2026-04-20 06:23:45'),
(32, 'default', 'created', 'App\\Models\\Product', 'created', 11, 'App\\Models\\User', 1, '{\"attributes\":{\"sku\":\"FOO-202604-0001\",\"name\":\"Aki Motor\",\"slug\":\"aki-motor\",\"category_id\":16,\"description\":\"GJSTRJRXTJ\",\"buy_price\":\"1.00\",\"sell_price\":\"3.00\",\"unit\":\"pcs\",\"min_stock\":5,\"shelf_code\":\"A-89-90000\",\"warranty_days\":1,\"weight\":null,\"image\":null,\"is_active\":true}}', NULL, '2026-04-20 06:25:34', '2026-04-20 06:25:34'),
(33, 'default', 'updated', 'App\\Models\\Product', 'updated', 11, 'App\\Models\\User', 1, '{\"attributes\":{\"sku\":\"FOO-202604-0001\",\"name\":\"Aki MotorJHVJCJ\",\"slug\":\"aki-motorjhvjcj\",\"category_id\":16,\"description\":\"GJSTRJRXTJ\",\"buy_price\":\"1.00\",\"sell_price\":\"3.00\",\"unit\":\"pcs\",\"min_stock\":5,\"shelf_code\":\"A-89-90000\",\"warranty_days\":1,\"weight\":null,\"image\":null,\"is_active\":true},\"old\":{\"sku\":\"FOO-202604-0001\",\"name\":\"Aki Motor\",\"slug\":\"aki-motor\",\"category_id\":16,\"description\":\"GJSTRJRXTJ\",\"buy_price\":\"1.00\",\"sell_price\":\"3.00\",\"unit\":\"pcs\",\"min_stock\":5,\"shelf_code\":\"A-89-90000\",\"warranty_days\":1,\"weight\":null,\"image\":null,\"is_active\":true}}', NULL, '2026-04-20 06:25:48', '2026-04-20 06:25:48'),
(34, 'default', 'created', 'App\\Models\\Sale', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"invoice_number\":\"INV-20260420-0003\",\"branch_id\":1,\"customer_name\":null,\"customer_phone\":null,\"payment_method\":\"qris\",\"subtotal\":\"25006.00\",\"discount\":\"0.00\",\"tax\":\"0.00\",\"total\":\"25006.00\",\"paid_amount\":\"25006.00\",\"change_amount\":\"0.00\",\"status\":\"paid\",\"notes\":null,\"user_id\":1}}', NULL, '2026-04-20 06:26:53', '2026-04-20 06:26:53'),
(35, 'default', 'deleted', 'App\\Models\\Product', 'deleted', 11, 'App\\Models\\User', 1, '{\"old\":{\"sku\":\"FOO-202604-0001\",\"name\":\"Aki MotorJHVJCJ\",\"slug\":\"aki-motorjhvjcj\",\"category_id\":16,\"description\":\"GJSTRJRXTJ\",\"buy_price\":\"1.00\",\"sell_price\":\"3.00\",\"unit\":\"pcs\",\"min_stock\":5,\"shelf_code\":\"A-89-90000\",\"warranty_days\":1,\"weight\":null,\"image\":null,\"is_active\":true}}', NULL, '2026-04-20 06:27:44', '2026-04-20 06:27:44'),
(36, 'default', 'created', 'App\\Models\\WorkOrder', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"wo_number\":\"WO-202604-0002\",\"branch_id\":1,\"customer_name\":\"PARIS\",\"customer_phone\":\"0865674564\",\"vehicle_plate\":\"B 666\",\"vehicle_type_id\":15,\"vehicle_year\":2025,\"complaint\":\"BUGDRGTDG\",\"diagnosis\":null,\"service_fee\":\"10000.00\",\"parts_total\":\"165000.00\",\"total\":\"175000.00\",\"status\":\"pending\",\"user_id\":1,\"started_at\":null,\"finished_at\":null}}', NULL, '2026-04-20 06:29:41', '2026-04-20 06:29:41'),
(37, 'default', 'updated', 'App\\Models\\WorkOrder', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"wo_number\":\"WO-202604-0002\",\"branch_id\":1,\"customer_name\":\"PARIS\",\"customer_phone\":\"0865674564\",\"vehicle_plate\":\"B 666\",\"vehicle_type_id\":15,\"vehicle_year\":2025,\"complaint\":\"BUGDRGTDG\",\"diagnosis\":null,\"service_fee\":\"10000.00\",\"parts_total\":\"165000.00\",\"total\":\"175000.00\",\"status\":\"in_progress\",\"user_id\":1,\"started_at\":\"2026-04-20T13:29:55.000000Z\",\"finished_at\":null},\"old\":{\"wo_number\":\"WO-202604-0002\",\"branch_id\":1,\"customer_name\":\"PARIS\",\"customer_phone\":\"0865674564\",\"vehicle_plate\":\"B 666\",\"vehicle_type_id\":15,\"vehicle_year\":2025,\"complaint\":\"BUGDRGTDG\",\"diagnosis\":null,\"service_fee\":\"10000.00\",\"parts_total\":\"165000.00\",\"total\":\"175000.00\",\"status\":\"pending\",\"user_id\":1,\"started_at\":null,\"finished_at\":null}}', NULL, '2026-04-20 06:29:55', '2026-04-20 06:29:55'),
(38, 'default', 'updated', 'App\\Models\\WorkOrder', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"wo_number\":\"WO-202604-0002\",\"branch_id\":1,\"customer_name\":\"PARIS\",\"customer_phone\":\"0865674564\",\"vehicle_plate\":\"B 666\",\"vehicle_type_id\":15,\"vehicle_year\":2025,\"complaint\":\"BUGDRGTDG\",\"diagnosis\":null,\"service_fee\":\"10000.00\",\"parts_total\":\"165000.00\",\"total\":\"175000.00\",\"status\":\"done\",\"user_id\":1,\"started_at\":\"2026-04-20T13:29:55.000000Z\",\"finished_at\":\"2026-04-20T13:30:01.000000Z\"},\"old\":{\"wo_number\":\"WO-202604-0002\",\"branch_id\":1,\"customer_name\":\"PARIS\",\"customer_phone\":\"0865674564\",\"vehicle_plate\":\"B 666\",\"vehicle_type_id\":15,\"vehicle_year\":2025,\"complaint\":\"BUGDRGTDG\",\"diagnosis\":null,\"service_fee\":\"10000.00\",\"parts_total\":\"165000.00\",\"total\":\"175000.00\",\"status\":\"in_progress\",\"user_id\":1,\"started_at\":\"2026-04-20T13:29:55.000000Z\",\"finished_at\":null}}', NULL, '2026-04-20 06:30:01', '2026-04-20 06:30:01'),
(39, 'default', 'created', 'App\\Models\\Product', 'created', 12, 'App\\Models\\User', 1, '{\"attributes\":{\"sku\":\"SPI-202604-0001\",\"name\":\"spion honda\",\"slug\":\"spion-honda\",\"category_id\":13,\"description\":null,\"buy_price\":\"25000.00\",\"sell_price\":\"45000.00\",\"unit\":\"pcs\",\"min_stock\":7,\"shelf_code\":\"A3\",\"warranty_days\":0,\"weight\":null,\"image\":null,\"is_active\":true}}', NULL, '2026-04-23 07:05:00', '2026-04-23 07:05:00'),
(40, 'default', 'created', 'App\\Models\\Sale', 'created', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"invoice_number\":\"INV-20260423-0001\",\"branch_id\":1,\"customer_name\":null,\"customer_phone\":null,\"payment_method\":\"cash\",\"subtotal\":\"160000.00\",\"discount\":\"0.00\",\"tax\":\"0.00\",\"total\":\"160000.00\",\"paid_amount\":\"160000.00\",\"change_amount\":\"0.00\",\"status\":\"paid\",\"notes\":null,\"user_id\":1}}', NULL, '2026-04-23 07:06:55', '2026-04-23 07:06:55'),
(41, 'default', 'created', 'App\\Models\\WorkOrder', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"wo_number\":\"WO-202604-0003\",\"branch_id\":1,\"customer_name\":\"kevin\",\"customer_phone\":\"083172399250\",\"vehicle_plate\":\"BH 7121 CD\",\"vehicle_type_id\":1,\"vehicle_year\":2024,\"complaint\":\"mengganti oli dan dispad\",\"diagnosis\":null,\"service_fee\":\"150000.00\",\"parts_total\":\"45275.00\",\"total\":\"195275.00\",\"status\":\"pending\",\"user_id\":1,\"started_at\":null,\"finished_at\":null}}', NULL, '2026-04-23 07:10:43', '2026-04-23 07:10:43'),
(42, 'default', 'updated', 'App\\Models\\WorkOrder', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"wo_number\":\"WO-202604-0003\",\"branch_id\":1,\"customer_name\":\"kevin\",\"customer_phone\":\"083172399250\",\"vehicle_plate\":\"BH 7121 CD\",\"vehicle_type_id\":1,\"vehicle_year\":2024,\"complaint\":\"mengganti oli dan dispad\",\"diagnosis\":null,\"service_fee\":\"150000.00\",\"parts_total\":\"45275.00\",\"total\":\"195275.00\",\"status\":\"in_progress\",\"user_id\":1,\"started_at\":\"2026-04-23T14:10:58.000000Z\",\"finished_at\":null},\"old\":{\"wo_number\":\"WO-202604-0003\",\"branch_id\":1,\"customer_name\":\"kevin\",\"customer_phone\":\"083172399250\",\"vehicle_plate\":\"BH 7121 CD\",\"vehicle_type_id\":1,\"vehicle_year\":2024,\"complaint\":\"mengganti oli dan dispad\",\"diagnosis\":null,\"service_fee\":\"150000.00\",\"parts_total\":\"45275.00\",\"total\":\"195275.00\",\"status\":\"pending\",\"user_id\":1,\"started_at\":null,\"finished_at\":null}}', NULL, '2026-04-23 07:10:58', '2026-04-23 07:10:58'),
(43, 'default', 'updated', 'App\\Models\\WorkOrder', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"wo_number\":\"WO-202604-0003\",\"branch_id\":1,\"customer_name\":\"kevin\",\"customer_phone\":\"083172399250\",\"vehicle_plate\":\"BH 7121 CD\",\"vehicle_type_id\":1,\"vehicle_year\":2024,\"complaint\":\"mengganti oli dan dispad\",\"diagnosis\":null,\"service_fee\":\"150000.00\",\"parts_total\":\"45275.00\",\"total\":\"195275.00\",\"status\":\"done\",\"user_id\":1,\"started_at\":\"2026-04-23T14:10:58.000000Z\",\"finished_at\":\"2026-04-23T14:11:09.000000Z\"},\"old\":{\"wo_number\":\"WO-202604-0003\",\"branch_id\":1,\"customer_name\":\"kevin\",\"customer_phone\":\"083172399250\",\"vehicle_plate\":\"BH 7121 CD\",\"vehicle_type_id\":1,\"vehicle_year\":2024,\"complaint\":\"mengganti oli dan dispad\",\"diagnosis\":null,\"service_fee\":\"150000.00\",\"parts_total\":\"45275.00\",\"total\":\"195275.00\",\"status\":\"in_progress\",\"user_id\":1,\"started_at\":\"2026-04-23T14:10:58.000000Z\",\"finished_at\":null}}', NULL, '2026-04-23 07:11:09', '2026-04-23 07:11:09'),
(44, 'default', 'updated', 'App\\Models\\WorkOrder', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"wo_number\":\"WO-202604-0003\",\"branch_id\":1,\"customer_name\":\"kevin\",\"customer_phone\":\"083172399250\",\"vehicle_plate\":\"BH 7121 CD\",\"vehicle_type_id\":1,\"vehicle_year\":2024,\"complaint\":\"mengganti oli dan dispad\",\"diagnosis\":null,\"service_fee\":\"150000.00\",\"parts_total\":\"45275.00\",\"total\":\"195275.00\",\"status\":\"delivered\",\"user_id\":1,\"started_at\":\"2026-04-23T14:10:58.000000Z\",\"finished_at\":\"2026-04-23T14:11:09.000000Z\"},\"old\":{\"wo_number\":\"WO-202604-0003\",\"branch_id\":1,\"customer_name\":\"kevin\",\"customer_phone\":\"083172399250\",\"vehicle_plate\":\"BH 7121 CD\",\"vehicle_type_id\":1,\"vehicle_year\":2024,\"complaint\":\"mengganti oli dan dispad\",\"diagnosis\":null,\"service_fee\":\"150000.00\",\"parts_total\":\"45275.00\",\"total\":\"195275.00\",\"status\":\"done\",\"user_id\":1,\"started_at\":\"2026-04-23T14:10:58.000000Z\",\"finished_at\":\"2026-04-23T14:11:09.000000Z\"}}', NULL, '2026-04-23 07:11:19', '2026-04-23 07:11:19'),
(45, 'default', 'created', 'App\\Models\\Supplier', 'created', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"sederhana\",\"code\":\"SUP-SED-0005\",\"contact_person\":\"7576567\",\"phone\":\"083112095128\",\"email\":\"admin@spareparts.id\",\"address\":\"jl. handil\",\"city\":\"jambi\",\"province\":\"jambi\",\"bank_name\":\"BCA\",\"bank_account\":\"8192907073\",\"rating\":0,\"is_active\":true}}', NULL, '2026-04-23 07:13:20', '2026-04-23 07:13:20'),
(46, 'default', 'created', 'App\\Models\\PurchaseOrder', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"po_number\":\"PO-202604-0002\",\"supplier_id\":5,\"branch_id\":1,\"status\":\"draft\",\"total_amount\":\"50105.00\",\"notes\":\"oli 5\\r\\nkampas 5\",\"ordered_at\":\"2026-04-23T00:00:00.000000Z\",\"received_at\":null,\"user_id\":1}}', NULL, '2026-04-23 07:14:18', '2026-04-23 07:14:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `branches`
--

INSERT INTO `branches` (`id`, `name`, `address`, `city`, `province`, `phone`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Jambi Handil', NULL, 'Jambi', 'Jambi', '0741-1234567', 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('fajarmotor-cache-spatie.permission.cache', 'a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:29:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:13:\"products.view\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:15:\"products.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:13:\"products.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:15:\"products.delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:10:\"stock.view\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:8:\"stock.in\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:3;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:9:\"stock.out\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:3;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:12:\"stock.adjust\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:3;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:14:\"stock.transfer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:3;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:10:\"sales.view\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:12:\"sales.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:12:\"sales.return\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:12;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:7:\"po.view\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:3;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:9:\"po.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:10:\"po.receive\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:3;}}i:15;a:4:{s:1:\"a\";i:16;s:1:\"b\";s:7:\"wo.view\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:16;a:4:{s:1:\"a\";i:17;s:1:\"b\";s:9:\"wo.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:17;a:4:{s:1:\"a\";i:18;s:1:\"b\";s:9:\"wo.update\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:18;a:4:{s:1:\"a\";i:19;s:1:\"b\";s:14:\"suppliers.view\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:19;a:4:{s:1:\"a\";i:20;s:1:\"b\";s:16:\"suppliers.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:20;a:4:{s:1:\"a\";i:21;s:1:\"b\";s:14:\"suppliers.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:21;a:4:{s:1:\"a\";i:22;s:1:\"b\";s:12:\"reports.view\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:22;a:4:{s:1:\"a\";i:23;s:1:\"b\";s:14:\"reports.export\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:23;a:4:{s:1:\"a\";i:24;s:1:\"b\";s:10:\"users.view\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:24;a:4:{s:1:\"a\";i:25;s:1:\"b\";s:12:\"users.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:25;a:4:{s:1:\"a\";i:26;s:1:\"b\";s:10:\"users.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:26;a:4:{s:1:\"a\";i:27;s:1:\"b\";s:12:\"users.delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:27;a:4:{s:1:\"a\";i:28;s:1:\"b\";s:13:\"branches.view\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:28;a:4:{s:1:\"a\";i:29;s:1:\"b\";s:15:\"branches.manage\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}}s:5:\"roles\";a:3:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:5:\"admin\";s:1:\"c\";s:3:\"web\";}i:1;a:3:{s:1:\"a\";i:2;s:1:\"b\";s:7:\"cashier\";s:1:\"c\";s:3:\"web\";}i:2;a:3:{s:1:\"a\";i:3;s:1:\"b\";s:9:\"warehouse\";s:1:\"c\";s:3:\"web\";}}}', 1777049454);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `icon`, `parent_id`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Mesin', 'mesin', 'fa-cog', NULL, NULL, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(2, 'Piston & Ring', 'piston-ring-mesin', NULL, 1, NULL, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(3, 'Klep & Noken As', 'klep-noken-as-mesin', NULL, 1, NULL, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(4, 'Karburator', 'karburator-mesin', NULL, 1, NULL, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(5, 'Filter Oli', 'filter-oli-mesin', NULL, 1, NULL, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(6, 'Gasket & Seal', 'gasket-seal-mesin', NULL, 1, NULL, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(7, 'Kelistrikan', 'kelistrikan', 'fa-bolt', NULL, NULL, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(8, 'Aki / Baterai', 'aki-baterai-kelistrikan', NULL, 7, NULL, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(9, 'CDI & Koil', 'cdi-koil-kelistrikan', NULL, 7, NULL, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(10, 'Busi', 'busi-kelistrikan', NULL, 7, NULL, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(11, 'Kabel & Lampu', 'kabel-lampu-kelistrikan', NULL, 7, NULL, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(12, 'Body & Rangka', 'body-rangka', 'fa-motorcycle', NULL, NULL, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(13, 'Spion', 'spion-body-rangka', NULL, 12, NULL, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(14, 'Fairing & Cover', 'fairing-cover-body-rangka', NULL, 12, NULL, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(15, 'Setang & Grip', 'setang-grip-body-rangka', NULL, 12, NULL, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(16, 'Footstep', 'footstep-body-rangka', NULL, 12, NULL, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(17, 'Rem & Suspensi', 'rem-suspensi', 'fa-circle', NULL, NULL, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(18, 'Kampas Rem', 'kampas-rem-rem-suspensi', NULL, 17, NULL, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(19, 'Cakram', 'cakram-rem-suspensi', NULL, 17, NULL, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(20, 'Shock Absorber', 'shock-absorber-rem-suspensi', NULL, 17, NULL, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(21, 'Per Suspensi', 'per-suspensi-rem-suspensi', NULL, 17, NULL, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(22, 'Transmisi & Rantai', 'transmisi-rantai', 'fa-link', NULL, NULL, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(23, 'Rantai', 'rantai-transmisi-rantai', NULL, 22, NULL, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(24, 'Sproket', 'sproket-transmisi-rantai', NULL, 22, NULL, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(25, 'Gigi Transmisi', 'gigi-transmisi-transmisi-rantai', NULL, 22, NULL, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(26, 'Kopling', 'kopling-transmisi-rantai', NULL, 22, NULL, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(27, 'Bahan Bakar', 'bahan-bakar', 'fa-gas-pump', NULL, NULL, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(28, 'Karburator', 'karburator-bahan-bakar', NULL, 27, NULL, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(29, 'Injektor', 'injektor-bahan-bakar', NULL, 27, NULL, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(30, 'Tangki & Selang', 'tangki-selang-bahan-bakar', NULL, 27, NULL, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(31, 'Filter BBM', 'filter-bbm-bahan-bakar', NULL, 27, NULL, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(32, 'Oli & Cairan', 'oli-cairan', 'fa-tint', NULL, NULL, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(33, 'Oli Mesin', 'oli-mesin-oli-cairan', NULL, 32, NULL, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(34, 'Oli Gardan', 'oli-gardan-oli-cairan', NULL, 32, NULL, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(35, 'Minyak Rem', 'minyak-rem-oli-cairan', NULL, 32, NULL, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(36, 'Coolant', 'coolant-oli-cairan', NULL, 32, NULL, '2026-04-20 02:28:07', '2026-04-20 02:28:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `email_change_otps`
--

CREATE TABLE `email_change_otps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `new_email` varchar(255) NOT NULL,
  `otp` varchar(6) NOT NULL,
  `expires_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `email_change_otps`
--

INSERT INTO `email_change_otps` (`id`, `user_id`, `new_email`, `otp`, `expires_at`, `created_at`, `updated_at`) VALUES
(2, 1, 'aryachovapratama2@gmail.com', '465484', '2026-04-23 13:04:47', '2026-04-23 12:54:47', '2026-04-23 12:54:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
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
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_04_20_041151_create_permission_tables', 1),
(5, '2026_04_20_041153_create_activity_log_table', 1),
(6, '2026_04_20_041154_add_event_column_to_activity_log_table', 1),
(7, '2026_04_20_041155_add_batch_uuid_column_to_activity_log_table', 1),
(8, '2026_04_20_060655_create_personal_access_tokens_table', 1),
(9, '2026_04_20_100001_create_branches_table', 1),
(10, '2026_04_20_100002_create_vehicle_brands_table', 1),
(11, '2026_04_20_100003_create_vehicle_types_table', 1),
(12, '2026_04_20_100004_create_categories_table', 1),
(13, '2026_04_20_100005_create_suppliers_table', 1),
(14, '2026_04_20_100006_create_products_table', 1),
(15, '2026_04_20_100007_create_warehouses_stock_tables', 1),
(16, '2026_04_20_100008_create_purchase_orders_table', 1),
(17, '2026_04_20_100009_create_sales_table', 1),
(18, '2026_04_20_100010_create_work_orders_table', 1),
(19, '2026_04_23_191353_create_email_change_otps_table', 2),
(20, '2026_04_23_194827_add_soft_deletes_to_tables', 3),
(21, '2026_04_24_000000_add_foreign_key_to_users_table', 3),
(22, '2026_04_24_000100_add_unique_primary_image_constraint', 3),
(23, '2026_04_24_000200_add_soft_deletes_to_models', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 4),
(3, 'App\\Models\\User', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('admin@spareparts.id', '$2y$12$oCXH6f2XcIhIoeKBkeoddebbhaYWUrl2kmFTiAR7v.KZI3GEFMtti', '2026-04-23 11:59:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'products.view', 'web', '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(2, 'products.create', 'web', '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(3, 'products.edit', 'web', '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(4, 'products.delete', 'web', '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(5, 'stock.view', 'web', '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(6, 'stock.in', 'web', '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(7, 'stock.out', 'web', '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(8, 'stock.adjust', 'web', '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(9, 'stock.transfer', 'web', '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(10, 'sales.view', 'web', '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(11, 'sales.create', 'web', '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(12, 'sales.return', 'web', '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(13, 'po.view', 'web', '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(14, 'po.create', 'web', '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(15, 'po.receive', 'web', '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(16, 'wo.view', 'web', '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(17, 'wo.create', 'web', '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(18, 'wo.update', 'web', '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(19, 'suppliers.view', 'web', '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(20, 'suppliers.create', 'web', '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(21, 'suppliers.edit', 'web', '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(22, 'reports.view', 'web', '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(23, 'reports.export', 'web', '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(24, 'users.view', 'web', '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(25, 'users.create', 'web', '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(26, 'users.edit', 'web', '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(27, 'users.delete', 'web', '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(28, 'branches.view', 'web', '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(29, 'branches.manage', 'web', '2026-04-20 02:28:07', '2026-04-20 02:28:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'profile-api-token', 'ebf5e8ce0762d39df4901b62ee4d4eba74d4c9f8d776b5c99ea90b3f7bcc6429', '[\"*\"]', NULL, NULL, '2026-04-23 10:48:58', '2026-04-23 10:48:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sku` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text DEFAULT NULL,
  `buy_price` decimal(15,2) NOT NULL DEFAULT 0.00,
  `sell_price` decimal(15,2) NOT NULL DEFAULT 0.00,
  `unit` varchar(255) NOT NULL DEFAULT 'pcs',
  `min_stock` int(10) UNSIGNED NOT NULL DEFAULT 5,
  `shelf_code` varchar(255) DEFAULT NULL,
  `warranty_days` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `weight` decimal(8,2) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `sku`, `name`, `slug`, `category_id`, `description`, `buy_price`, `sell_price`, `unit`, `min_stock`, `shelf_code`, `warranty_days`, `weight`, `image`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(7, 'BUS-202604-0001', 'Busi NGK', 'busi-ngk', 4, NULL, 15000.00, 25000.00, 'pcs', 5, NULL, 0, NULL, NULL, 1, '2026-04-20 06:19:46', '2026-04-20 06:22:58', NULL),
(8, 'OLI-202604-0002', 'Oli', 'oli', 2, NULL, 35.00, 55.00, 'liter', 10, NULL, 1, NULL, NULL, 1, '2026-04-20 06:19:46', '2026-04-20 06:23:45', NULL),
(9, 'REM-202604-0003', 'Kampas Rem Depan Honda Beat', 'kampas-rem-depan-honda-beat', 3, NULL, 25000.00, 45000.00, 'set', 5, NULL, 0, NULL, NULL, 1, '2026-04-20 06:19:46', '2026-04-20 06:19:46', NULL),
(12, 'SPI-202604-0001', 'spion honda', 'spion-honda', 13, NULL, 25000.00, 45000.00, 'pcs', 7, 'A3', 0, NULL, NULL, 1, '2026-04-23 07:04:59', '2026-04-23 07:04:59', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_compatibility`
--

CREATE TABLE `product_compatibility` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `vehicle_type_id` bigint(20) UNSIGNED NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `product_compatibility`
--

INSERT INTO `product_compatibility` (`id`, `product_id`, `vehicle_type_id`, `notes`, `created_at`, `updated_at`) VALUES
(24, 7, 2, NULL, '2026-04-20 06:22:58', '2026-04-20 06:22:58'),
(25, 7, 3, NULL, '2026-04-20 06:22:58', '2026-04-20 06:22:58'),
(26, 8, 2, NULL, '2026-04-20 06:23:45', '2026-04-20 06:23:45'),
(27, 8, 6, NULL, '2026-04-20 06:23:45', '2026-04-20 06:23:45'),
(28, 8, 19, NULL, '2026-04-20 06:23:45', '2026-04-20 06:23:45'),
(29, 8, 20, NULL, '2026-04-20 06:23:45', '2026-04-20 06:23:45'),
(34, 12, 1, NULL, '2026-04-23 07:05:00', '2026-04-23 07:05:00'),
(35, 12, 5, NULL, '2026-04-23 07:05:00', '2026-04-23 07:05:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image_path`, `is_primary`, `sort_order`, `created_at`, `updated_at`) VALUES
(8, 8, 'products/0PQOVSBm2CNKi4xMmffXZyzz9x1V2dr7f7y9Vu2e.jpg', 0, 0, '2026-04-20 06:23:45', '2026-04-20 06:23:45'),
(9, 12, 'products/R3k1sqXhqciQer11dCjznoV0F9YEoIsT0ViIPDRF.png', 1, 0, '2026-04-23 07:05:00', '2026-04-23 07:05:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `purchase_orders`
--

CREATE TABLE `purchase_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `po_number` varchar(255) NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('draft','sent','partial','received','cancelled') NOT NULL DEFAULT 'draft',
  `total_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `notes` text DEFAULT NULL,
  `ordered_at` timestamp NULL DEFAULT NULL,
  `received_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `purchase_orders`
--

INSERT INTO `purchase_orders` (`id`, `po_number`, `supplier_id`, `branch_id`, `status`, `total_amount`, `notes`, `ordered_at`, `received_at`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'PO-202604-0001', 4, 1, 'draft', 15000.00, NULL, '2026-04-19 17:00:00', NULL, 1, '2026-04-20 05:46:04', '2026-04-20 05:46:04', NULL),
(2, 'PO-202604-0002', 5, 1, 'draft', 50105.00, 'oli 5\r\nkampas 5', '2026-04-22 17:00:00', NULL, 1, '2026-04-23 07:14:18', '2026-04-23 07:14:18', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `purchase_order_items`
--

CREATE TABLE `purchase_order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `buy_price` decimal(15,2) NOT NULL,
  `received_quantity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `purchase_order_items`
--

INSERT INTO `purchase_order_items` (`id`, `purchase_order_id`, `product_id`, `quantity`, `buy_price`, `received_quantity`, `created_at`, `updated_at`) VALUES
(2, 2, 9, 2, 25000.00, 0, '2026-04-23 07:14:18', '2026-04-23 07:14:18'),
(3, 2, 8, 3, 35.00, 0, '2026-04-23 07:14:18', '2026-04-23 07:14:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(2, 'cashier', 'web', '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(3, 'warehouse', 'web', '2026-04-20 02:28:07', '2026-04-20 02:28:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(5, 2),
(5, 3),
(6, 1),
(6, 3),
(7, 1),
(7, 3),
(8, 1),
(8, 3),
(9, 1),
(9, 3),
(10, 1),
(10, 2),
(11, 1),
(11, 2),
(12, 1),
(13, 1),
(13, 3),
(14, 1),
(15, 1),
(15, 3),
(16, 1),
(16, 2),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_number` varchar(255) NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `customer_phone` varchar(255) DEFAULT NULL,
  `payment_method` enum('cash','transfer','qris') NOT NULL DEFAULT 'cash',
  `subtotal` decimal(15,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(15,2) NOT NULL DEFAULT 0.00,
  `total` decimal(15,2) NOT NULL DEFAULT 0.00,
  `paid_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `change_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `status` enum('pending','paid','returned','cancelled') NOT NULL DEFAULT 'paid',
  `notes` text DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sales`
--

INSERT INTO `sales` (`id`, `invoice_number`, `branch_id`, `customer_name`, `customer_phone`, `payment_method`, `subtotal`, `discount`, `tax`, `total`, `paid_amount`, `change_amount`, `status`, `notes`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'INV-20260420-0001', 1, 'udin', '083112095128', 'qris', 15000.00, 1.00, 0.00, 14999.00, 14999.00, 0.00, 'returned', NULL, 1, '2026-04-20 05:32:47', '2026-04-20 05:32:58', NULL),
(2, 'INV-20260420-0002', 1, NULL, NULL, 'qris', 45000.00, 0.00, 0.00, 45000.00, 45000.00, 0.00, 'paid', NULL, 1, '2026-04-20 05:39:10', '2026-04-20 05:39:10', NULL),
(3, 'INV-20260420-0003', 1, NULL, NULL, 'qris', 25006.00, 0.00, 0.00, 25006.00, 25006.00, 0.00, 'paid', NULL, 1, '2026-04-20 06:26:53', '2026-04-20 06:26:53', NULL),
(4, 'INV-20260423-0001', 1, NULL, NULL, 'cash', 160000.00, 0.00, 0.00, 160000.00, 160000.00, 0.00, 'paid', NULL, 1, '2026-04-23 07:06:55', '2026-04-23 07:06:55', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sale_items`
--

CREATE TABLE `sale_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `sell_price` decimal(15,2) NOT NULL,
  `discount_per_item` decimal(15,2) NOT NULL DEFAULT 0.00,
  `subtotal` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sale_items`
--

INSERT INTO `sale_items` (`id`, `sale_id`, `product_id`, `quantity`, `sell_price`, `discount_per_item`, `subtotal`, `created_at`, `updated_at`) VALUES
(3, 3, 7, 1, 25000.00, 0.00, 25000.00, '2026-04-20 06:26:53', '2026-04-20 06:26:53'),
(5, 4, 7, 1, 25000.00, 0.00, 25000.00, '2026-04-23 07:06:55', '2026-04-23 07:06:55'),
(6, 4, 9, 1, 45000.00, 0.00, 45000.00, '2026-04-23 07:06:55', '2026-04-23 07:06:55'),
(7, 4, 12, 2, 45000.00, 0.00, 90000.00, '2026-04-23 07:06:55', '2026-04-23 07:06:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('Df10rFlNyLtsrd6Ek5WvhTB7hFqGm8YRLIo8hsaU', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 OPR/130.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZml4ZkJPZGpoMEhkVTdvZXJNd3E4NXhwRDFHdE9FM0paYmpSNGx3SCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9wcm9maWxlIjtzOjU6InJvdXRlIjtzOjEyOiJwcm9maWxlLmVkaXQiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1776975889),
('EOTT2618yN9ZaGbM4GQ0xxHIUvgsq7ctGXLECgPt', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 OPR/130.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSkNIQ1YyWkhDSDJzU0RLR21tbGRmU2NURVJ5UllYZ1hmejFYcVBYQSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7czo1OiJyb3V0ZSI7czo3OiJsYW5kaW5nIjt9fQ==', 1776988075);

-- --------------------------------------------------------

--
-- Struktur dari tabel `stock_mutations`
--

CREATE TABLE `stock_mutations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('in','out','adjustment','transfer') NOT NULL,
  `quantity` int(11) NOT NULL,
  `quantity_before` int(11) NOT NULL,
  `quantity_after` int(11) NOT NULL,
  `reference_type` varchar(255) DEFAULT NULL,
  `reference_id` bigint(20) UNSIGNED DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `stock_mutations`
--

INSERT INTO `stock_mutations` (`id`, `product_id`, `warehouse_id`, `type`, `quantity`, `quantity_before`, `quantity_after`, `reference_type`, `reference_id`, `notes`, `user_id`, `created_at`, `updated_at`) VALUES
(5, 7, 1, 'in', 11, 0, 11, NULL, NULL, 'HJVGHJ', 1, '2026-04-20 06:24:38', '2026-04-20 06:24:38'),
(7, 7, 1, 'out', 1, 11, 10, 'App\\Models\\Sale', 3, NULL, 1, '2026-04-20 06:26:53', '2026-04-20 06:26:53'),
(9, 9, 1, 'in', 10, 0, 10, NULL, NULL, NULL, 1, '2026-04-23 06:59:38', '2026-04-23 06:59:38'),
(10, 12, 1, 'in', 7, 0, 7, NULL, NULL, NULL, 1, '2026-04-23 07:05:30', '2026-04-23 07:05:30'),
(11, 7, 1, 'out', 1, 10, 9, 'App\\Models\\Sale', 4, NULL, 1, '2026-04-23 07:06:55', '2026-04-23 07:06:55'),
(12, 9, 1, 'out', 1, 10, 9, 'App\\Models\\Sale', 4, NULL, 1, '2026-04-23 07:06:55', '2026-04-23 07:06:55'),
(13, 12, 1, 'out', 2, 7, 5, 'App\\Models\\Sale', 4, NULL, 1, '2026-04-23 07:06:55', '2026-04-23 07:06:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `stock_records`
--

CREATE TABLE `stock_records` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `last_updated` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `stock_records`
--

INSERT INTO `stock_records` (`id`, `product_id`, `warehouse_id`, `quantity`, `last_updated`, `created_at`, `updated_at`) VALUES
(2, 7, 1, 9, '2026-04-23 07:06:55', '2026-04-20 06:24:38', '2026-04-23 07:06:55'),
(4, 9, 1, 9, '2026-04-23 07:06:55', '2026-04-23 06:59:38', '2026-04-23 07:06:55'),
(5, 12, 1, 5, '2026-04-23 07:06:55', '2026-04-23 07:05:30', '2026-04-23 07:06:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `bank_account` varchar(255) DEFAULT NULL,
  `rating` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `code`, `contact_person`, `phone`, `email`, `address`, `city`, `province`, `bank_name`, `bank_account`, `rating`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'PT Astra Honda Motor', 'SUP-AHM-0001', 'Budi Santoso', '021-12345678', 'sales@ahm.co.id', NULL, 'Jakarta', 'DKI Jakarta', NULL, NULL, 0, 1, '2026-04-20 05:44:09', '2026-04-20 05:44:09'),
(2, 'PT Yamaha Indonesia', 'SUP-YMH-0002', 'Siti Rahayu', '021-87654321', 'sales@yamaha.co.id', NULL, 'Jakarta', 'DKI Jakarta', NULL, NULL, 0, 1, '2026-04-20 05:44:09', '2026-04-20 05:44:09'),
(3, 'CV Sparepart Nusantara', 'SUP-SPN-0003', 'Ahmad Fauzi', '0741-556677', 'info@sparepartnusantara.com', NULL, 'Jambi', 'Jambi', NULL, NULL, 0, 1, '2026-04-20 05:44:09', '2026-04-20 05:44:09'),
(4, 'UD Maju Jaya Motor', 'SUP-MJM-0004', 'Dewi Lestari', '0741-998877', NULL, NULL, 'Jambi', 'Jambi', NULL, NULL, 0, 1, '2026-04-20 05:44:09', '2026-04-20 05:44:09'),
(5, 'sederhana', 'SUP-SED-0005', '7576567', '083112095128', 'admin@spareparts.id', 'jl. handil', 'jambi', 'jambi', 'BCA', '8192907073', 0, 1, '2026-04-23 07:13:20', '2026-04-23 07:13:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `branch_id`, `avatar`, `is_active`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@spareparts.id', '2026-04-23 17:15:27', '$2y$12$068m4KWfp1CICf.BdVRXD.45QkygGb8tr4RxS8JlNHVoglwg/56FO', 1, NULL, 1, NULL, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(2, 'Kasir 1', 'kasir@spareparts.id', '2026-04-23 17:15:27', '$2y$12$XhuAsr8XwpWYa229Co64ZebNOS2qsOguJJfwQPNpwPuEEMuo151pe', 1, NULL, 1, NULL, '2026-04-20 02:28:08', '2026-04-20 02:28:08'),
(3, 'Gudang 1', 'gudang@spareparts.id', '2026-04-23 17:15:27', '$2y$12$2th0/hgmwOcbqmd6lFtyT.8pf/7pQLUQWkeLD/h4Ixvr1.jLtvBQy', 1, NULL, 1, NULL, '2026-04-20 02:28:08', '2026-04-20 02:28:08'),
(4, 'Arya Chova Pratama', 'aryachovapratama@gmail.com', NULL, '$2y$12$Umz6IVVjZh2i7rucylaTQO0HBUW71bTedX263.uGgeoP9MIfKVxqe', 1, NULL, 1, NULL, '2026-04-23 12:02:18', '2026-04-23 12:04:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `vehicle_brands`
--

CREATE TABLE `vehicle_brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `country` varchar(255) NOT NULL DEFAULT 'Indonesia',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `vehicle_brands`
--

INSERT INTO `vehicle_brands` (`id`, `name`, `logo`, `country`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Honda', NULL, 'Japan', 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(2, 'Yamaha', NULL, 'Japan', 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(3, 'Suzuki', NULL, 'Japan', 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(4, 'Kawasaki', NULL, 'Japan', 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(5, 'TVS', NULL, 'India', 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(6, 'Bajaj', NULL, 'India', 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(7, 'Royal Enfield', NULL, 'India', 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `vehicle_types`
--

CREATE TABLE `vehicle_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` enum('matic','bebek','sport','trail','adventure') NOT NULL,
  `cc` smallint(5) UNSIGNED DEFAULT NULL,
  `year_start` smallint(5) UNSIGNED DEFAULT NULL,
  `year_end` smallint(5) UNSIGNED DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `vehicle_types`
--

INSERT INTO `vehicle_types` (`id`, `brand_id`, `name`, `type`, `cc`, `year_start`, `year_end`, `image`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Beat', 'matic', 110, 2008, NULL, NULL, 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(2, 1, 'Vario 125', 'matic', 125, 2012, NULL, NULL, 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(3, 1, 'Vario 150', 'matic', 150, 2015, NULL, NULL, 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(4, 1, 'PCX 150', 'matic', 150, 2012, NULL, NULL, 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(5, 1, 'Scoopy', 'matic', 110, 2010, NULL, NULL, 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(6, 1, 'Revo', 'bebek', 110, 2006, NULL, NULL, 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(7, 1, 'Supra X 125', 'bebek', 125, 2005, NULL, NULL, 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(8, 1, 'CB150R', 'sport', 150, 2013, NULL, NULL, 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(9, 1, 'CRF150L', 'trail', 150, 2017, NULL, NULL, 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(10, 2, 'NMAX', 'matic', 155, 2015, NULL, NULL, 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(11, 2, 'Aerox 155', 'matic', 155, 2016, NULL, NULL, 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(12, 2, 'Mio M3', 'matic', 125, 2013, NULL, NULL, 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(13, 2, 'Mio Soul GT', 'matic', 125, 2012, NULL, NULL, 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(14, 2, 'Jupiter MX', 'bebek', 150, 2005, NULL, NULL, 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(15, 2, 'R15', 'sport', 155, 2014, NULL, NULL, 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(16, 2, 'MT-15', 'sport', 155, 2018, NULL, NULL, 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(17, 2, 'WR155R', 'trail', 155, 2020, NULL, NULL, 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(18, 3, 'Address', 'matic', 113, 2015, NULL, NULL, 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(19, 3, 'Nex II', 'matic', 113, 2017, NULL, NULL, 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(20, 3, 'Satria F150', 'sport', 150, 2007, NULL, NULL, 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(21, 3, 'GSX-R150', 'sport', 150, 2017, NULL, NULL, 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(22, 4, 'Ninja 250', 'sport', 250, 2008, NULL, NULL, 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(23, 4, 'Ninja ZX-25R', 'sport', 250, 2020, NULL, NULL, 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(24, 4, 'Z250', 'sport', 250, 2013, NULL, NULL, 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(25, 4, 'KLX 150', 'trail', 150, 2009, NULL, NULL, 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(26, 4, 'Versys-X 250', 'adventure', 250, 2017, NULL, NULL, 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(27, 5, 'Apache RTR 200', 'sport', 200, 2016, NULL, NULL, 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(28, 5, 'Dazz', 'matic', 110, 2012, NULL, NULL, 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(29, 6, 'Pulsar NS200', 'sport', 200, 2012, NULL, NULL, 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(30, 6, 'Pulsar 220F', 'sport', 220, 2007, NULL, NULL, 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(31, 7, 'Meteor 350', 'sport', 350, 2020, NULL, NULL, 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07'),
(32, 7, 'Himalayan', 'adventure', 411, 2016, NULL, NULL, 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `warehouses`
--

CREATE TABLE `warehouses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `warehouses`
--

INSERT INTO `warehouses` (`id`, `branch_id`, `name`, `code`, `address`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Gudang Utama Jambi Handil', 'WH-JAM-01', NULL, 1, '2026-04-20 02:28:07', '2026-04-20 02:28:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `work_orders`
--

CREATE TABLE `work_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `wo_number` varchar(255) NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_phone` varchar(255) DEFAULT NULL,
  `vehicle_plate` varchar(255) DEFAULT NULL,
  `vehicle_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `vehicle_year` smallint(5) UNSIGNED DEFAULT NULL,
  `complaint` text DEFAULT NULL,
  `diagnosis` text DEFAULT NULL,
  `service_fee` decimal(15,2) NOT NULL DEFAULT 0.00,
  `parts_total` decimal(15,2) NOT NULL DEFAULT 0.00,
  `total` decimal(15,2) NOT NULL DEFAULT 0.00,
  `status` enum('pending','in_progress','done','delivered','cancelled') NOT NULL DEFAULT 'pending',
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `started_at` timestamp NULL DEFAULT NULL,
  `finished_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `work_orders`
--

INSERT INTO `work_orders` (`id`, `wo_number`, `branch_id`, `customer_name`, `customer_phone`, `vehicle_plate`, `vehicle_type_id`, `vehicle_year`, `complaint`, `diagnosis`, `service_fee`, `parts_total`, `total`, `status`, `user_id`, `started_at`, `finished_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'WO-202604-0001', 1, 'Udin', '083112095128', 'BH1266 YD', 10, 2025, 'busi', NULL, 100000.00, 30000.00, 130000.00, 'done', 1, NULL, '2026-04-20 05:41:02', '2026-04-20 05:40:45', '2026-04-20 05:41:02', NULL),
(2, 'WO-202604-0002', 1, 'PARIS', '0865674564', 'B 666', 15, 2025, 'BUGDRGTDG', NULL, 10000.00, 165000.00, 175000.00, 'done', 1, '2026-04-20 06:29:55', '2026-04-20 06:30:01', '2026-04-20 06:29:41', '2026-04-20 06:30:01', NULL),
(3, 'WO-202604-0003', 1, 'kevin', '083172399250', 'BH 7121 CD', 1, 2024, 'mengganti oli dan dispad', NULL, 150000.00, 45275.00, 195275.00, 'delivered', 1, '2026-04-23 07:10:58', '2026-04-23 07:11:09', '2026-04-23 07:10:43', '2026-04-23 07:11:19', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `work_order_items`
--

CREATE TABLE `work_order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `work_order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `price` decimal(15,2) NOT NULL DEFAULT 0.00,
  `subtotal` decimal(15,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `work_order_items`
--

INSERT INTO `work_order_items` (`id`, `work_order_id`, `product_id`, `description`, `quantity`, `price`, `subtotal`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'oli', 2, 15000.00, 30000.00, '2026-04-20 05:40:45', '2026-04-20 05:40:45'),
(2, 2, NULL, 'Oli', 11, 15000.00, 165000.00, '2026-04-20 06:29:41', '2026-04-20 06:29:41'),
(3, 3, 8, 'Oli', 5, 55.00, 275.00, '2026-04-23 07:10:43', '2026-04-23 07:10:43'),
(4, 3, 9, 'kampas', 1, 45000.00, 45000.00, '2026-04-23 07:10:43', '2026-04-23 07:10:43');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `causer` (`causer_type`,`causer_id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indeks untuk tabel `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indeks untuk tabel `email_change_otps`
--
ALTER TABLE `email_change_otps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_change_otps_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_sku_unique` (`sku`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indeks untuk tabel `product_compatibility`
--
ALTER TABLE `product_compatibility`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_compatibility_product_id_vehicle_type_id_unique` (`product_id`,`vehicle_type_id`),
  ADD KEY `product_compatibility_vehicle_type_id_foreign` (`vehicle_type_id`);

--
-- Indeks untuk tabel `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_product_images_primary` (`product_id`,`is_primary`);

--
-- Indeks untuk tabel `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `purchase_orders_po_number_unique` (`po_number`),
  ADD KEY `purchase_orders_supplier_id_foreign` (`supplier_id`),
  ADD KEY `purchase_orders_branch_id_foreign` (`branch_id`),
  ADD KEY `purchase_orders_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_order_items_purchase_order_id_foreign` (`purchase_order_id`),
  ADD KEY `purchase_order_items_product_id_foreign` (`product_id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indeks untuk tabel `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sales_invoice_number_unique` (`invoice_number`),
  ADD KEY `sales_branch_id_foreign` (`branch_id`),
  ADD KEY `sales_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `sale_items`
--
ALTER TABLE `sale_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_items_sale_id_foreign` (`sale_id`),
  ADD KEY `sale_items_product_id_foreign` (`product_id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `stock_mutations`
--
ALTER TABLE `stock_mutations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_mutations_product_id_foreign` (`product_id`),
  ADD KEY `stock_mutations_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `stock_mutations_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  ADD KEY `stock_mutations_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `stock_records`
--
ALTER TABLE `stock_records`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stock_records_product_id_warehouse_id_unique` (`product_id`,`warehouse_id`),
  ADD KEY `stock_records_warehouse_id_foreign` (`warehouse_id`);

--
-- Indeks untuk tabel `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `suppliers_code_unique` (`code`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_branch_id_foreign` (`branch_id`);

--
-- Indeks untuk tabel `vehicle_brands`
--
ALTER TABLE `vehicle_brands`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `vehicle_types`
--
ALTER TABLE `vehicle_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicle_types_brand_id_foreign` (`brand_id`);

--
-- Indeks untuk tabel `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `warehouses_code_unique` (`code`),
  ADD KEY `warehouses_branch_id_foreign` (`branch_id`);

--
-- Indeks untuk tabel `work_orders`
--
ALTER TABLE `work_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `work_orders_wo_number_unique` (`wo_number`),
  ADD KEY `work_orders_branch_id_foreign` (`branch_id`),
  ADD KEY `work_orders_vehicle_type_id_foreign` (`vehicle_type_id`),
  ADD KEY `work_orders_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `work_order_items`
--
ALTER TABLE `work_order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `work_order_items_work_order_id_foreign` (`work_order_id`),
  ADD KEY `work_order_items_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT untuk tabel `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT untuk tabel `email_change_otps`
--
ALTER TABLE `email_change_otps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `product_compatibility`
--
ALTER TABLE `product_compatibility`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT untuk tabel `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `purchase_orders`
--
ALTER TABLE `purchase_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `sale_items`
--
ALTER TABLE `sale_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `stock_mutations`
--
ALTER TABLE `stock_mutations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `stock_records`
--
ALTER TABLE `stock_records`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `vehicle_brands`
--
ALTER TABLE `vehicle_brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `vehicle_types`
--
ALTER TABLE `vehicle_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `work_orders`
--
ALTER TABLE `work_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `work_order_items`
--
ALTER TABLE `work_order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `email_change_otps`
--
ALTER TABLE `email_change_otps`
  ADD CONSTRAINT `email_change_otps_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `product_compatibility`
--
ALTER TABLE `product_compatibility`
  ADD CONSTRAINT `product_compatibility_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_compatibility_vehicle_type_id_foreign` FOREIGN KEY (`vehicle_type_id`) REFERENCES `vehicle_types` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD CONSTRAINT `purchase_orders_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_orders_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  ADD CONSTRAINT `purchase_order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_order_items_purchase_order_id_foreign` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sales_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `sale_items`
--
ALTER TABLE `sale_items`
  ADD CONSTRAINT `sale_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sale_items_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `stock_mutations`
--
ALTER TABLE `stock_mutations`
  ADD CONSTRAINT `stock_mutations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_mutations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `stock_mutations_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `stock_records`
--
ALTER TABLE `stock_records`
  ADD CONSTRAINT `stock_records_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_records_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `vehicle_types`
--
ALTER TABLE `vehicle_types`
  ADD CONSTRAINT `vehicle_types_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `vehicle_brands` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `warehouses`
--
ALTER TABLE `warehouses`
  ADD CONSTRAINT `warehouses_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `work_orders`
--
ALTER TABLE `work_orders`
  ADD CONSTRAINT `work_orders_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `work_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `work_orders_vehicle_type_id_foreign` FOREIGN KEY (`vehicle_type_id`) REFERENCES `vehicle_types` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `work_order_items`
--
ALTER TABLE `work_order_items`
  ADD CONSTRAINT `work_order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `work_order_items_work_order_id_foreign` FOREIGN KEY (`work_order_id`) REFERENCES `work_orders` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
