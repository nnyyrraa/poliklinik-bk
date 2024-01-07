-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2024 at 07:27 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `poliklinik`
--

-- --------------------------------------------------------

--
-- Table structure for table `daftar_poli`
--

CREATE TABLE `daftar_poli` (
  `id` int(11) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `id_jadwal` int(11) NOT NULL,
  `keluhan` text NOT NULL,
  `no_antrian` int(10) UNSIGNED NOT NULL,
  `status_periksa` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `daftar_poli`
--

INSERT INTO `daftar_poli` (`id`, `id_pasien`, `id_jadwal`, `keluhan`, `no_antrian`, `status_periksa`) VALUES
(1, 1, 3, 'sakit kepala', 1, '1'),
(2, 2, 1, 'diare', 2, '0'),
(4, 14, 1, 'tidak nafsu makan', 3, '0'),
(5, 14, 3, 'Cek mata minus', 2, '0'),
(6, 14, 1, 'Batuk dan pilek', 4, '0'),
(7, 14, 3, 'Infeksi mata kanan', 3, '0'),
(8, 14, 3, 'Katarak', 4, '0'),
(9, 14, 1, 'Diare', 5, '0'),
(10, 15, 3, 'Kelilipan', 5, '0'),
(11, 18, 2, 'Tidak bisa melek', 1, '0'),
(12, 18, 3, 'Rabun Jauh', 6, '0'),
(13, 14, 1, 'Pusing', 6, '0'),
(14, 23, 13, 'Cabut Gigi', 1, '1'),
(15, 24, 10, 'Cek Behel', 1, '1'),
(16, 25, 13, 'Berlubang', 2, '0');

-- --------------------------------------------------------

--
-- Table structure for table `detail_periksa`
--

CREATE TABLE `detail_periksa` (
  `id` int(11) NOT NULL,
  `id_periksa` int(11) NOT NULL,
  `id_obat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_periksa`
--

INSERT INTO `detail_periksa` (`id`, `id_periksa`, `id_obat`) VALUES
(5, 2, 4),
(6, 3, 5),
(7, 3, 6),
(8, 4, 4),
(9, 4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `no_hp` varchar(50) NOT NULL,
  `id_poli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id`, `nama`, `password`, `alamat`, `no_hp`, `id_poli`) VALUES
(21, 'Rina', '', 'Lampung', '08777777', 1),
(22, 'sarwahita', '', 'jakarta', '0812345', 3),
(24, 'Fizi', '', 'Jakarta', '0872365642', 1),
(25, 'Koko', '$2y$10$8yxKSloZZ/CKZBOWPvUvd.sL185CB2UU6KjT8r0UtUx2767BDlFwu', 'Koko', 'Koko', 2);

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_periksa`
--

CREATE TABLE `jadwal_periksa` (
  `id` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `hari` enum('Senin','Selasa','Rabu','Kamis','Jumat','Sabtu') NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `aktif` char(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jadwal_periksa`
--

INSERT INTO `jadwal_periksa` (`id`, `id_dokter`, `hari`, `jam_mulai`, `jam_selesai`, `aktif`) VALUES
(1, 21, 'Selasa', '07:00:00', '12:00:00', 'Y'),
(2, 24, 'Jumat', '08:00:00', '15:30:00', 'N'),
(3, 22, 'Rabu', '13:00:00', '20:00:00', 'Y'),
(10, 25, 'Kamis', '12:30:00', '16:00:00', 'Y'),
(13, 25, 'Sabtu', '09:00:00', '17:00:00', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id` int(11) NOT NULL,
  `nama_obat` varchar(50) NOT NULL,
  `kemasan` varchar(35) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id`, `nama_obat`, `kemasan`, `harga`) VALUES
(3, 'Vitamin C', '50ml', 15000),
(4, 'Panadol', '500ml', 25000),
(5, 'Cataflam', '50 mg', 20000),
(6, 'Panadol Extra', '10 kaplet', 35000);

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `no_ktp` varchar(255) NOT NULL,
  `no_hp` varchar(50) NOT NULL,
  `no_rm` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id`, `nama`, `password`, `alamat`, `no_ktp`, `no_hp`, `no_rm`) VALUES
(1, 'Adi', 'adi123', 'Jakarta', '332629837', '08537826', '202312-001'),
(2, 'Nana', 'nana22', 'Solo', '33286785', '08265286', '202312-002'),
(3, 'Joko', '$2y$10$UoBDHg0yaLBzYiPRApkTu.dbxynYGnw/Sk7ocvY1StXbTHuON3tEW', 'Bondowoso', '332948593', '08527321', '202312-003'),
(5, 'Rani', '$2y$10$0VfyKU8QCmFJxuoOmkIULuq.VpbC6n5jUc84uQoCRHE5gjob9ws7a', 'Mejasem', '33289448998', '08222222', '202312-005'),
(6, 'Koki', '$2y$10$d7Yiel5sW5E9t9piNHPzAOrFBMNrVJfPdGoRzTB3dM1yJJ4IvR35K', 'Malang', '3329893598', '0858238798', '202312-006'),
(7, 'Dadang', '$2y$10$LvxhokCuDFbNLDzGDvGU6.acIw16pRWcUtrvU5UoK8SqHWWt2FH8G', 'Wonokerto', '332947934', '085882374', '202312-007'),
(8, 'Dini', '$2y$10$lk7spc5e0rR3DeTPPF2W5uxd726AoOOJnily0q03wKx5LCIvG/wV6', 'Jakarta', '332903', '08573282', '202312-008'),
(9, 'Caca', '$2y$10$fHW8BEA0VV9DUi33qO5OE.i0nwlYIEhZioB/b/yM.dR7LlcZpWqO2', 'Semarang', '3328495', '0834623487', '202312-009'),
(10, 'Jaka', '$2y$10$oImZPRY9DdiQH4SJETMcU.lAcLV.fDOdl7C1nMXLfZKzUB.x7OOWO', 'Bekasi', '332487593', '0857382623', '202401-010'),
(12, 'Jojo', '$2y$10$yli76q0IZ.tn4tsQuCDoLO3kc5l95ML9ToivbsVtE0mLnwFbGl8/S', 'Brebes', '3332874', '08237', '202401-012'),
(13, 'Nini', '$2y$10$Ue3H05D8SyzbFCSbYqfpae1EVTRolymc350t3bzOtjEnk9RtqhdBq', 'Tegal', '332984', '083247239', '202401-013'),
(14, 'Rara', '$2y$10$J5xeC72.6kF8GMy87wx6X.o8E62NcZwP4vhOTarn8oVAT92Ee.V6G', 'Surakarta', '33298492', '023849283', '202401-014'),
(15, 'Lili', '$2y$10$UxkKD81XYZT48uBFCajoVOsQWtkUua0Na7DLnLomiOGFljfoOnhne', 'Pemalang', '234873298', '083292', '202401-015'),
(16, 'Niko', '$2y$10$Xx1c3A9zuS215Eg0tCDwR.SJkFbLuCmEhvVnC4EaTWAupoVysjNm.', 'Malang', '33423984', '0893893', '202401-016'),
(17, 'Reza', '$2y$10$RJFyfuNn0Vo4vxfTlkZjyu3Z4Z6WSF4R.KRMLTva08VU6zGg/pfNK', 'Wonosobo', '332846392', '083276478', '202401-017'),
(18, 'Riri', '$2y$10$D7GWjK5gwyaVyXRZ1vPEw.mREObsikWg4UkIM0ZgmTH5qJK5OD55W', 'Pujasera', '3324739', '088329832', '202401-018'),
(19, 'Nani', '$2y$10$E6XvONaeelqOmaG4KwXWPOvvV6dq4ROrWjiDeX5ZyjspwllkOl3gG', 'Jepang', '3328237498', '087236472', '202401-019'),
(20, 'Ira', '$2y$10$QyHIr1c64qwNrag8I/LIu.R9tMKgTveYhbwMnwCO1DNfxPKeVeKZW', 'Sragi', '33882', '08683484', '202401-020'),
(21, 'Rara', '$2y$10$0zOTLYtt8YP50OmfIeR/lO.19I/SvalRjOAOXgzsJv6mJAw2nJ/oW', 'Batang', '332893', '08573982', '202401-021'),
(22, 'Nana', '$2y$10$WYUlH6ubcLTen2b5VCDR0u3BgwmD7N5UBa1HENxz7H3M9Y3.ej7dq', 'Solo', '001', '08777777', '202401-022'),
(23, 'Rina', '$2y$10$UEDULiF6qxtxAwvwY5/uh.hStk3iU.VCRDjK15U4ziotuHmhm4JT2', 'Batang', '005', '08678578', '202401-023'),
(24, 'Dani', '$2y$10$VZTHBUL3SNgaX7bzgfa7Oewkgr1KkcUOUraOOeR2MWgt4EH4EWSve', 'Bojong', '332898', '08289839', '202401-024'),
(25, 'Kiki', '$2y$10$7IIfblvVZG5/WUTAQbKvv.CMW9NotlybpWk5tXoq6xnca0F34ah1G', 'Serang', '338953', '08438292', '202401-025'),
(26, 'Mei mei', '$2y$10$77elwRnyYXsVkLKGOTtOnO6CIPRFRm.5fyYLTp1xj3p4koQ/oiw72', 'Kebumen', '002', '0328493', '202401-026'),
(27, 'Lala', '$2y$10$R/whzjIpQ3OSKplL.4yW7eLIUOWvzgeY0Y6gYkkdgj7lDuKZSdrQ2', 'Banyumanik', '6584', '0239032', '202401-027'),
(28, 'Karin', '$2y$10$Nj725Bh4/VWc0wBFtK7y0uGiqOb1qor/uz8wNknDnBKcJZmLesLEW', 'Korea', '001', '089328439', '202401-028');

-- --------------------------------------------------------

--
-- Table structure for table `periksa`
--

CREATE TABLE `periksa` (
  `id` int(11) NOT NULL,
  `id_daftar_poli` int(11) NOT NULL,
  `tgl_periksa` datetime NOT NULL,
  `catatan` text NOT NULL,
  `biaya_periksa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `periksa`
--

INSERT INTO `periksa` (`id`, `id_daftar_poli`, `tgl_periksa`, `catatan`, `biaya_periksa`) VALUES
(1, 2, '2023-12-13 09:00:00', 'jangan makan pedas terlalu banyak dan jajanan diluar rumah', 200000),
(2, 1, '2023-09-05 14:00:00', 'jangan terlalu stres', 150000),
(3, 15, '2024-01-01 09:30:00', 'Ganti kawat gigi dan minum obat 2x1 hari', 150000),
(4, 14, '2024-01-07 11:34:00', 'Berlubang', 150000);

-- --------------------------------------------------------

--
-- Table structure for table `poli`
--

CREATE TABLE `poli` (
  `id` int(11) NOT NULL,
  `nama_poli` varchar(25) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `poli`
--

INSERT INTO `poli` (`id`, `nama_poli`, `keterangan`) VALUES
(1, 'Anak', 'Panas'),
(2, 'Gigi', 'Berlubang'),
(3, 'Mata', 'Minus');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daftar_poli`
--
ALTER TABLE `daftar_poli`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_daftarpoli_pasien` (`id_pasien`),
  ADD KEY `fk_daftarpoli_jadwalperiksa` (`id_jadwal`);

--
-- Indexes for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_detailperiksa_periksa` (`id_periksa`),
  ADD KEY `fk_detailperiksa_obat` (`id_obat`);

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_dokter_poli` (`id_poli`);

--
-- Indexes for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_jadwalperiksa_dokter` (`id_dokter`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `periksa`
--
ALTER TABLE `periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_periksa_daftarpoli` (`id_daftar_poli`);

--
-- Indexes for table `poli`
--
ALTER TABLE `poli`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daftar_poli`
--
ALTER TABLE `daftar_poli`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `obat`
--
ALTER TABLE `obat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `periksa`
--
ALTER TABLE `periksa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `poli`
--
ALTER TABLE `poli`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `daftar_poli`
--
ALTER TABLE `daftar_poli`
  ADD CONSTRAINT `fk_daftarpoli_jadwalperiksa` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal_periksa` (`id`),
  ADD CONSTRAINT `fk_daftarpoli_pasien` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id`);

--
-- Constraints for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  ADD CONSTRAINT `fk_detailperiksa_obat` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id`),
  ADD CONSTRAINT `fk_detailperiksa_periksa` FOREIGN KEY (`id_periksa`) REFERENCES `periksa` (`id`);

--
-- Constraints for table `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `fk_dokter_poli` FOREIGN KEY (`id_poli`) REFERENCES `poli` (`id`);

--
-- Constraints for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  ADD CONSTRAINT `fk_jadwalperiksa_dokter` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id`);

--
-- Constraints for table `periksa`
--
ALTER TABLE `periksa`
  ADD CONSTRAINT `fk_periksa_daftarpoli` FOREIGN KEY (`id_daftar_poli`) REFERENCES `daftar_poli` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
