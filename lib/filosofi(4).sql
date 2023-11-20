-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2023 at 12:20 PM
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
-- Database: `filosofi`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_pembelian`
--

CREATE TABLE `detail_pembelian` (
  `detail_pembelian` int(11) NOT NULL,
  `kode_pembelian` char(12) NOT NULL,
  `kode_produk` char(5) NOT NULL,
  `harga` int(8) NOT NULL,
  `jumlah` int(8) NOT NULL,
  `subtotal` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_penjualan`
--

CREATE TABLE `detail_penjualan` (
  `kode_detail` int(11) NOT NULL,
  `kode_penjualan` char(12) NOT NULL,
  `kode_menu` char(5) NOT NULL,
  `harga` int(8) NOT NULL,
  `jumlah` int(3) NOT NULL,
  `subtotal` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `id_karyawan` char(5) NOT NULL,
  `nama_karyawan` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `level` enum('admin','kasir') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`id_karyawan`, `nama_karyawan`, `username`, `password`, `level`) VALUES
('KR001', 'dija', 'admin', 'admin', 'admin'),
('KR002', 'Naela', 'kasir', 'kasir', 'kasir');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `kode_menu` char(5) NOT NULL,
  `jenis_menu` enum('minuman','makanan') NOT NULL,
  `nama_menu` varchar(20) NOT NULL,
  `harga` int(8) NOT NULL,
  `foto` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `kode_pembelian` char(12) NOT NULL,
  `tgl_pembelian` date NOT NULL,
  `kode_suplier` char(5) NOT NULL,
  `kode_karyawan` char(5) NOT NULL,
  `jumlah_bayar` int(8) NOT NULL,
  `bayar` int(8) NOT NULL,
  `kembali` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `kode_penjualan` char(12) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `kode_karyawan` char(12) NOT NULL,
  `jumlah_bayar` int(11) NOT NULL,
  `bayar` int(11) NOT NULL,
  `kembali` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `kode_produk` char(5) NOT NULL,
  `nama_produk` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`kode_produk`, `nama_produk`) VALUES
('P0001', 'Kopi'),
('P0002', 'Gula'),
('P0003', 'Aayam'),
('P0004', 'Ikan'),
('P0005', 'Susu'),
('P0006', 'Ikan');

-- --------------------------------------------------------

--
-- Table structure for table `sementara`
--

CREATE TABLE `sementara` (
  `id_produk` char(5) NOT NULL,
  `harga` int(10) NOT NULL,
  `jumlah` int(10) NOT NULL,
  `subtotal` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sementara`
--

INSERT INTO `sementara` (`id_produk`, `harga`, `jumlah`, `subtotal`) VALUES
('Kopi', 12000, 2, 0),
('P0002', 250000, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `suplier`
--

CREATE TABLE `suplier` (
  `kode_suplier` char(5) NOT NULL,
  `nama_suplier` varchar(20) NOT NULL,
  `alamat_suplier` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suplier`
--

INSERT INTO `suplier` (`kode_suplier`, `nama_suplier`, `alamat_suplier`) VALUES
('S0001', 'Barokah', 'Mastrip 5'),
('S0002', 'Dija', 'Y'),
('S0003', 'Naela', 't'),
('S0004', 'Muhsin', 'Jember');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_pembelian`
--
ALTER TABLE `detail_pembelian`
  ADD PRIMARY KEY (`detail_pembelian`),
  ADD KEY `kode_produk` (`kode_produk`),
  ADD KEY `kode_pembelian` (`kode_pembelian`);

--
-- Indexes for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD PRIMARY KEY (`kode_detail`),
  ADD KEY `kode_penjualan` (`kode_penjualan`),
  ADD KEY `kode_menu` (`kode_menu`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id_karyawan`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`kode_menu`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`kode_pembelian`),
  ADD KEY `kode_suplier` (`kode_suplier`),
  ADD KEY `pembelian_ibfk_1` (`kode_karyawan`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`kode_penjualan`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`kode_produk`);

--
-- Indexes for table `suplier`
--
ALTER TABLE `suplier`
  ADD PRIMARY KEY (`kode_suplier`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_pembelian`
--
ALTER TABLE `detail_pembelian`
  MODIFY `detail_pembelian` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  MODIFY `kode_detail` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_pembelian`
--
ALTER TABLE `detail_pembelian`
  ADD CONSTRAINT `detail_pembelian_ibfk_1` FOREIGN KEY (`kode_produk`) REFERENCES `produk` (`kode_produk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_pembelian_ibfk_2` FOREIGN KEY (`kode_pembelian`) REFERENCES `pembelian` (`kode_pembelian`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD CONSTRAINT `detail_penjualan_ibfk_1` FOREIGN KEY (`kode_penjualan`) REFERENCES `penjualan` (`kode_penjualan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_penjualan_ibfk_2` FOREIGN KEY (`kode_menu`) REFERENCES `menu` (`kode_menu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`kode_karyawan`) REFERENCES `karyawan` (`id_karyawan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pembelian_ibfk_2` FOREIGN KEY (`kode_suplier`) REFERENCES `suplier` (`kode_suplier`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
