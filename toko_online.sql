-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 29 Feb 2024 pada 11.10
-- Versi server: 8.0.36-0ubuntu0.22.04.1
-- Versi PHP: 8.2.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_online`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` int NOT NULL,
  `nama_kategori` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id`, `nama_kategori`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Hijab', '2021-12-13 01:50:13', '2021-12-13 02:13:46', NULL),
(3, 'Pashmina', '2021-12-13 02:13:01', '2021-12-13 02:13:38', '2021-12-13 02:13:38'),
(4, 'Hijab Instan', '2021-12-13 02:13:16', '2021-12-13 02:13:41', '2021-12-13 02:13:41'),
(5, 'Pakaian Pria', '2021-12-13 02:13:25', NULL, NULL),
(6, 'Pakaian Wanita', '2021-12-13 02:13:30', NULL, NULL),
(7, 'Aksesoris', '2021-12-13 02:14:00', NULL, NULL),
(10, 'asdsadaaa', '2024-02-28 05:34:23', '2024-02-28 05:34:31', '2024-02-28 05:34:31'),
(11, 'asdsad', '2024-02-28 05:34:38', '2024-02-28 05:34:44', '2024-02-28 05:34:44'),
(12, 'Jasa Servera', '2024-02-29 02:49:21', '2024-02-29 02:49:34', '2024-02-29 02:49:34'),
(13, 'sasdasd', '2024-02-29 02:49:48', '2024-02-29 02:49:54', '2024-02-29 02:49:54'),
(14, 'alat sholat', '2024-02-29 03:06:21', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `id_user` int NOT NULL,
  `id_produk` int NOT NULL,
  `qty` int NOT NULL,
  `keterangan` text NOT NULL,
  `bukti_order` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'diproses',
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `id_user`, `id_produk`, `qty`, `keterangan`, `bukti_order`, `status`, `updated_at`) VALUES
(1, 3, 8, 2, 'sadasd', 'bukti_1709110744.png', 'dikirim', '2024-02-28 22:33:43'),
(2, 3, 8, 2, 'sadasd', 'bukti_1709110744.png', 'dikirim', '0000-00-00 00:00:00'),
(3, 3, 8, 2, 'sadsad', 'bukti_1709110898.png', 'dikirim', '2024-02-28 22:33:48'),
(4, 3, 8, 2, 'sdasdasd', 'bukti_1709110955.png', 'dikirim', '2024-02-28 22:34:11'),
(5, 3, 9, 6, 'aewqe', 'bukti_1709112334.png', 'dikirim', '2024-02-28 22:34:13'),
(6, 6, 7, 3, 'sasdsd', 'bukti_1709117818.png', 'dikirim', '2024-02-28 22:34:14'),
(7, 6, 9, 4, 'asdasdasd', 'bukti_1709185272.png', 'dikirim', '2024-02-28 22:43:37'),
(8, 6, 8, 50, 'wsdadasd', 'bukti_1709185296.png', 'dikirim', '2024-02-28 22:43:35'),
(9, 7, 9, 3, 'kirimkan ke alamat wonosobo yak', 'bukti_1709186700.png', 'dikirim', '2024-02-28 23:05:28'),
(10, 3, 9, 4, 'dasdasdad', 'bukti_1709199695.png', 'dikirim', '2024-02-29 02:43:31'),
(11, 8, 9, 2, 'bisa dikirimkan ke alamat : temanggung', 'bukti_1709200887.png', 'dikirim', '2024-02-29 03:03:23'),
(12, 3, 10, 4, 'dikirimkanke asdasd', 'bukti_1709203045.png', 'dikirim', '2024-02-29 03:38:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id` int NOT NULL,
  `id_kategori` int NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `nama_produk` varchar(255) DEFAULT NULL,
  `deskripsi` text,
  `harga_jual` int NOT NULL,
  `stok` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id`, `id_kategori`, `gambar`, `nama_produk`, `deskripsi`, `harga_jual`, `stok`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'produk_1643112196.jpg', 'HIJAB VOAL SEGI EMPAT', 'Sempurnakan tampilan harianmu dengan hijab segiempat', 98000, 10, '2021-12-13 02:45:21', '2024-02-27 03:31:34', '2024-02-27 03:31:34'),
(2, 5, 'produk_1643112182.jpg', 'Koko Kurta Agno Big Size', 'Koko Kurta Agno Koko simpel, elegan dan special berbahan katun Toyobo', 200000, 11, '2021-12-13 04:37:41', '2024-02-27 03:31:31', '2024-02-27 03:31:31'),
(3, 5, 'produk_1643112164.jpg', 'Jersey/Sportwear Oslo Long', 'Jersey/Sportwear Oslo Long', 275000, 12, '2021-12-13 04:41:58', '2024-02-27 03:31:29', '2024-02-27 03:31:29'),
(4, 6, 'produk_1709186324.webp', 'Dauky Gamis Wanita L Dress Marble', 'Koleksi terbaru', 346500, 4, '2021-12-13 04:43:04', '2024-02-28 22:58:44', NULL),
(5, 7, 'produk_1709186205.jpg', 'OWIEN WHITE', 'Material : Premium Synthetic Leather K+ Accesories', 314000, 6, '2021-12-13 04:45:03', '2024-02-28 22:56:45', NULL),
(6, 7, 'produk_1709186159.jpg', 'Kalung Etnik Tenun Batu', 'Ukuran Lingkaran kalung 75 cm', 198000, 9, '2021-12-13 04:46:26', '2024-02-28 22:55:59', NULL),
(7, 1, 'produk_1709186051.webp', 'HIJAB VOAL SEGI EMPAT', 'Sempurnakan tampilan harianmu dengan hijab segiempat printed berbahan voal yang adem anti gerah, tegak didahi.', 116100, 96, '2021-12-13 04:47:30', '2024-02-28 22:54:11', NULL),
(8, 5, 'produk_1709185991.jpg', 'Koko Long Sleeves', 'Koko Long Sleeves', 399000, 36, '2021-12-13 04:48:39', '2024-02-28 22:53:11', NULL),
(9, 1, 'produk_1709185938.png', 'Hijab Syiria', 'Hijab Syiria', 100000, 58, '2024-02-27 05:17:10', '2024-02-29 03:01:27', NULL),
(10, 1, 'produk_1709185862.jpg', 'Hijab Segi Empat', 'Hijab Segi Empat', 200000, 52, '2024-02-27 05:17:31', '2024-02-29 03:37:25', NULL),
(11, 5, 'produk_1709186121.jpeg', 'Koko Lengan Pendek', 'koko lengan pendek', 120000, 3, '2024-02-27 05:17:55', '2024-02-28 22:55:21', NULL),
(12, 7, 'produk_1709121769.png', 'asdasd', 'asdasdq', 32424, 78, '2024-02-27 05:18:22', '2024-02-28 05:33:35', '2024-02-28 05:33:35'),
(13, 5, 'produk_1709200079.webp', 'Koko', 'asdsadasd', 12000, 4, '2024-02-29 02:47:59', '2024-02-29 02:49:13', '2024-02-29 02:49:13'),
(14, 14, 'produk_1709201226.webp', 'koko muslim', 'koko muslim', 120000, 100, '2024-02-29 03:07:06', '2024-02-29 03:08:01', '2024-02-29 03:08:01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','pembeli') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pembeli',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `address`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Izza Wildan', 'wildan@gmail.com', '6281298669897', 'Temanggung', NULL, '$2y$10$IfX3s7ZeQziLVXGAoFoZU.urTEcQvdF7VhGP/qgMLoRpU7OKFP8fS', 'admin', 'wDHDN9LAal3oL0MERXkGQmNkiCJuzRhkoEaym1EJkKHzwWinLTWNr6JFxI7R', '2021-12-13 00:13:32', '2024-02-27 00:41:45'),
(3, 'Anggit ', 'anggit@gmail.com', '6281298669897', 'Temanggung', NULL, '$2y$10$IfX3s7ZeQziLVXGAoFoZU.urTEcQvdF7VhGP/qgMLoRpU7OKFP8fS', 'pembeli', 'kUkF9JVULTxdnLRUPEDILvpfAOu9WT4vEsAhrjdpZnHJ7V8fwdGHdN7GWFBQ', '2021-12-13 00:13:32', '2024-02-27 00:41:45'),
(4, 'ujang', 'ujang@gmail.com', '08564123213', 'asdasd', NULL, '$2y$10$DVrwcjHPZ62bVJnh4j6sEO9USbEJuu5fkpws8KIlynR/82qDlxtr6', 'pembeli', NULL, '2024-02-28 03:12:34', '2024-02-28 03:12:34'),
(5, 'maratus', 'maratus@gmail.com', '08231232', 'kemloko', NULL, '$2y$10$CU97dGA9rEDLSG4/LA49PeXw74Y/jB15YW6mQzUiBmQOLW.9gNPYO', 'pembeli', NULL, '2024-02-28 03:15:36', '2024-02-28 03:15:36'),
(6, 'arina', 'arina@gmail.com', '0213123', 'asdas', NULL, '$2y$10$tlEsNyWKwfiQVE3maFGa6.8Bq4zUlbzVD3Kjbr3L/dtehNMaJO3Su', 'pembeli', NULL, '2024-02-28 03:17:15', '2024-02-28 03:17:15'),
(7, 'Azza', 'azza@gmail.com', '086131312123', 'wonosobo', NULL, '$2y$10$q9JpAFi9BH4zl3R4kGxIjuAaXvO.1m5IxI6mP7spgjNR7dHAbReDu', 'pembeli', NULL, '2024-02-28 23:03:58', '2024-02-28 23:03:58'),
(8, 'kharisah', 'kharisah@gmail.com', '08123213123', 'temanggung', NULL, '$2y$10$KCgBQkpJ152/f3DEr0S9YOSTghdULgFGiP42ODXqvHkH6sKBX5YRC', 'pembeli', NULL, '2024-02-29 02:59:55', '2024-02-29 02:59:55');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
