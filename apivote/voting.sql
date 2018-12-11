-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2018 at 03:09 PM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `voting`
--

-- --------------------------------------------------------

--
-- Table structure for table `kandidat`
--

CREATE TABLE `kandidat` (
  `idkandidat` int(11) NOT NULL,
  `tahun` varchar(45) DEFAULT NULL,
  `nomor_kandidat` int(2) NOT NULL,
  `visi` text,
  `misi` text,
  `fotoprofilketua` varchar(45) DEFAULT NULL,
  `fotoprofilwakil` varchar(45) DEFAULT NULL,
  `nim_calonketua` varchar(9) DEFAULT NULL,
  `nim_calonwakil` varchar(9) DEFAULT NULL,
  `jumlah` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kandidat`
--

INSERT INTO `kandidat` (`idkandidat`, `tahun`, `nomor_kandidat`, `visi`, `misi`, `fotoprofilketua`, `fotoprofilwakil`, `nim_calonketua`, `nim_calonwakil`, `jumlah`) VALUES
(9, '2018', 1, 'Mewujudkan masyarakat yang adil dan makmur serta keadilan yang sejahtera.', 'Dengan kebersamaan dan keanekaragaman membangun suasana yang harmonis.tes saja', '7a121fd69ccd437b864809ca518c93a5.PNG', '16bf85bc3db4cd7bcf5c5c535886d97b.jpg', '201265003', '201265004', 1),
(10, '2018', 2, 'Visi misi adalah hal yang tak pernah terpikirkan.', 'Kenapa kamu selalu seperti ini ?', 'b7f7169b39f2b134fc8f0fa0fd1b835d.JPG', 'aa3715bf764360790a4b7f53dac63ca3.jpg', '201265006', '201265007', 2);

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` varchar(12) NOT NULL,
  `namamahasiswa` varchar(45) DEFAULT NULL,
  `gender` enum('pria','wanita') DEFAULT NULL,
  `agama` varchar(30) DEFAULT NULL,
  `alamat` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `namamahasiswa`, `gender`, `agama`, `alamat`) VALUES
('201265003', 'Sity Rumana', 'wanita', 'Islam', 'Jalan Baru saja'),
('201265004', 'Andini', 'wanita', 'Islam', 'Franskaisepo'),
('201265006', 'Rita', 'wanita', 'Islam', 'Amban'),
('201265007', 'Wasalati', 'wanita', 'Islam', 'Sowi'),
('201265010', 'Vita', 'wanita', 'Protestan', 'Sanggeng'),
('201467200', 'Faris', 'pria', 'Islam', 'Jl. Ampere Kamp. Baru');

-- --------------------------------------------------------

--
-- Table structure for table `status_vote`
--

CREATE TABLE `status_vote` (
  `idstatus_vote` int(3) NOT NULL,
  `status` enum('open','close') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `status_vote`
--

INSERT INTO `status_vote` (`idstatus_vote`, `status`) VALUES
(1, 'open');

-- --------------------------------------------------------

--
-- Table structure for table `userlogin`
--

CREATE TABLE `userlogin` (
  `iduserlogin` int(3) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `level` enum('admin','mahasiswa') DEFAULT NULL,
  `mahasiswa_nim` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userlogin`
--

INSERT INTO `userlogin` (`iduserlogin`, `username`, `password`, `level`, `mahasiswa_nim`) VALUES
(3, 'admin', 'admin', 'admin', NULL),
(4, '201265006', '189503624', 'mahasiswa', '201265006'),
(5, '201265007', '36457956', 'mahasiswa', '201265007'),
(6, '201265010', '167673476', 'mahasiswa', '201265010');

-- --------------------------------------------------------

--
-- Table structure for table `vote`
--

CREATE TABLE `vote` (
  `idvote` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `mahasiswa_nim` varchar(12) NOT NULL,
  `kandidat_idkandidat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vote`
--

INSERT INTO `vote` (`idvote`, `tanggal`, `mahasiswa_nim`, `kandidat_idkandidat`) VALUES
(2, '2018-09-09', '201265006', 9),
(3, '2018-09-10', '201265007', 10),
(4, '2018-09-11', '201265010', 10);

--
-- Triggers `vote`
--
DELIMITER $$
CREATE TRIGGER `vote_AFTER_INSERT` AFTER INSERT ON `vote` FOR EACH ROW BEGIN
 update kandidat set kandidat.jumlah = kandidat.jumlah+1 
	WHERE kandidat.idkandidat = new.kandidat_idkandidat;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kandidat`
--
ALTER TABLE `kandidat`
  ADD PRIMARY KEY (`idkandidat`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `status_vote`
--
ALTER TABLE `status_vote`
  ADD PRIMARY KEY (`idstatus_vote`);

--
-- Indexes for table `userlogin`
--
ALTER TABLE `userlogin`
  ADD PRIMARY KEY (`iduserlogin`),
  ADD KEY `fk_userlogin_mahasiswa1_idx` (`mahasiswa_nim`);

--
-- Indexes for table `vote`
--
ALTER TABLE `vote`
  ADD PRIMARY KEY (`idvote`),
  ADD KEY `fk_vote_mahasiswa_idx` (`mahasiswa_nim`),
  ADD KEY `fk_vote_kader1_idx` (`kandidat_idkandidat`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kandidat`
--
ALTER TABLE `kandidat`
  MODIFY `idkandidat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `status_vote`
--
ALTER TABLE `status_vote`
  MODIFY `idstatus_vote` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `userlogin`
--
ALTER TABLE `userlogin`
  MODIFY `iduserlogin` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `vote`
--
ALTER TABLE `vote`
  MODIFY `idvote` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `userlogin`
--
ALTER TABLE `userlogin`
  ADD CONSTRAINT `fk_userlogin_mahasiswa1` FOREIGN KEY (`mahasiswa_nim`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vote`
--
ALTER TABLE `vote`
  ADD CONSTRAINT `fk_vote_kader1` FOREIGN KEY (`kandidat_idkandidat`) REFERENCES `kandidat` (`idkandidat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_vote_mahasiswa` FOREIGN KEY (`mahasiswa_nim`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
