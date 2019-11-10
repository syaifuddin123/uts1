-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2019 at 07:09 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phpmvc`
--

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nrp` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `jurusan` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `nomor_hp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `nama`, `nrp`, `email`, `jurusan`, `jenis_kelamin`, `alamat`, `nomor_hp`) VALUES
(1, 'Akhmad Toha', 1612400004, 'tohaakhmad@gmail.com', 'teknik, informatika', '', '', ''),
(2, 'Jamaludin', 1612400005, 'jamal@gamail.com', 'Teknik Sipil', '', '', ''),
(3, 'aris darussalam', 2147483647, 'arisdar@gmail.com', 'Teknik Industri', '', '', ''),
(4, 'Khorudin', 2147483647, 'k@gmail.com', 'Teknik Industri', '', '', ''),
(9, 'sampurna', 2147483647, 'aa@gmail.com', 'Teknik Sipil', '', '', ''),
(15, 'sakura', 2147483647, 'sasuke@gmail.com', 'Teknik Sipil', 'Teknik Informatika', 'konoha', '923829928903028');

--
-- Triggers `mahasiswa`
--
DELIMITER $$
CREATE TRIGGER `log_perubahan` BEFORE UPDATE ON `mahasiswa` FOR EACH ROW insert into tgl_perubahan
set nrp=old.nrp,
nomor_hp_lama =old.nomor_hp,
nomor_hp_baru=new.nomor_hp,
tgl_perubahan=now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tgl_perubahan`
--

CREATE TABLE `tgl_perubahan` (
  `id` int(11) NOT NULL,
  `nrp` varchar(255) NOT NULL,
  `nomor_hp_lama` varchar(255) NOT NULL,
  `nomor_hp_baru` varchar(255) NOT NULL,
  `tgl_perubahan` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tgl_perubahan`
--

INSERT INTO `tgl_perubahan` (`id`, `nrp`, `nomor_hp_lama`, `nomor_hp_baru`, `tgl_perubahan`) VALUES
(1, '2147483647', '08888888', '923829928903028', '2019-11-10 06:05:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tgl_perubahan`
--
ALTER TABLE `tgl_perubahan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tgl_perubahan`
--
ALTER TABLE `tgl_perubahan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
