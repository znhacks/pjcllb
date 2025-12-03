-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Des 2025 pada 11.43
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bank`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `datadiri`
--

CREATE TABLE `datadiri` (
  `id` int(10) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `kk` varchar(255) DEFAULT NULL,
  `ktp` varchar(255) DEFAULT NULL,
  `notelp` varchar(20) DEFAULT NULL,
  `rekening` int(111) DEFAULT NULL,
  `pinjaman` int(20) DEFAULT NULL,
  `status` enum('pending','diterima','ditolak','lunas') DEFAULT 'pending',
  `bunga` int(11) DEFAULT 10,
  `tenor` int(11) NOT NULL DEFAULT 1,
  `total_bayar` bigint(20) DEFAULT 0,
  `sisa_bayar` bigint(20) DEFAULT 0,
  `updated_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `datadiri`
--

INSERT INTO `datadiri` (`id`, `user_id`, `nama`, `alamat`, `kk`, `ktp`, `notelp`, `rekening`, `pinjaman`, `status`, `bunga`, `tenor`, `total_bayar`, `sisa_bayar`, `updated_at`, `created_at`) VALUES
(37, 5, 'Nasabah1', 'Kota Malang, Kec. Wagir, Jalan Bima, Sidorahayu', '6542312', 'ktp/VYRkbP2FVPNOv9AujZ4qe10eFPydyaLuRqJ4SSTJ.png', '08123456789', 12345, 100000, 'lunas', 10, 6, 0, 108900, '2025-12-03 03:27:46.000000', '2025-12-03 03:25:30.000000');

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
-- Struktur dari tabel `loan_history`
--

CREATE TABLE `loan_history` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jumlah_pokok` bigint(20) NOT NULL,
  `bunga` int(11) NOT NULL,
  `tenor` int(11) NOT NULL,
  `total_bayar` bigint(20) NOT NULL,
  `tanggal_selesai` datetime NOT NULL,
  `status` enum('lunas','ditolak') NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
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
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(10) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `notelp` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `role` enum('admin','user') DEFAULT 'user',
  `updated_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `notelp`, `password`, `nama`, `role`, `updated_at`, `created_at`) VALUES
(1, 'Jordy', 'jordi@gmail.com', NULL, '$2y$12$kuLTu/xLc.RjJsqIwdVl8.XFrmMcw/KNrwtXyy4tQA7P46EqksQta', 'Ordi', 'admin', '2025-11-26 18:06:22.000000', '2025-11-26 18:06:22.000000'),
(3, 'Fawas', NULL, NULL, '$2y$12$NAIlhFMxE3CVgXi2ZaCbQOx3AsLfkr5wjXXvhYxjzwdGqLk.fGC3S', 'Awas', 'user', '2025-11-26 19:33:00.000000', '2025-11-26 19:33:00.000000'),
(4, 'Jordy2', NULL, NULL, '$2y$12$/ZBB048MFIdAJBInj/RPDevOaj7ApCn4fad5oSSeV869RErb1xDrO', 'Jordy2', 'user', '2025-12-01 20:37:52.000000', '2025-12-01 20:37:52.000000'),
(5, 'nasabah1@gmail.com', 'nasabah1@gmail.com', '081234567890', '$2y$12$BZqyUqftBNRVfnOwBL0bC.9XdWbyTArgvkFOqDWXY/sSSrQc2pJDa', 'Nasabah1', 'user', '2025-12-02 04:20:32.000000', '2025-12-02 04:20:32.000000'),
(6, 'nasabah2@gmail.com', 'nasabah2@gmail.com', '08123456789', '$2y$12$OOWModbvQVvNAG1QR5/6vOYAJW888WIPdUKRPDmvAQbpJSrVxgHOC', 'Nasabah2', 'user', '2025-12-02 04:28:22.000000', '2025-12-02 04:28:22.000000');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `datadiri`
--
ALTER TABLE `datadiri`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `loan_history`
--
ALTER TABLE `loan_history`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `datadiri`
--
ALTER TABLE `datadiri`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `loan_history`
--
ALTER TABLE `loan_history`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
