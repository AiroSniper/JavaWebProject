-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2022 at 06:11 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `salles_manager`
--

-- --------------------------------------------------------

--
-- Table structure for table `machine`
--

CREATE TABLE `machine` (
  `id` int(11) NOT NULL,
  `salle_id` int(11) DEFAULT NULL,
  `reference` varchar(50) DEFAULT NULL,
  `marque` varchar(50) DEFAULT NULL,
  `dateAchat` date DEFAULT NULL,
  `prix` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `machine`
--

INSERT INTO `machine` (`id`, `salle_id`, `reference`, `marque`, `dateAchat`, `prix`) VALUES
(1, 1, 'REF0000001', 'DELL', '2021-01-01', 3500),
(2, 1, 'REF0000002', 'HP', '2021-01-02', 4000),
(3, 1, 'REF0000003', 'DELL', '2021-03-03', 5300),
(4, 1, 'REF0000004', 'DELL', '2021-01-04', 3500),
(5, 1, 'REF0000005', 'HP', '2021-01-05', 3562),
(6, 1, 'REF0000006', 'HP', '2021-01-06', 3562),
(7, 1, 'REF0000007', 'DELL', '2020-08-07', 3562),
(8, 1, 'REF0000008', 'DELL', '2020-01-08', 3500),
(9, 1, 'REF0000009', 'DELL', '2020-01-09', 3562),
(10, 1, 'REF00000010', 'DELL', '2021-03-03', 3562),
(11, 1, 'REF00000011', 'DELL', '2021-09-03', 3562),
(12, 1, 'REF00000012', 'HP', '2021-01-12', 3500),
(13, 1, 'REF00000013', 'ASUS', '2021-01-13', 3562),
(14, 1, 'REF00000014', 'HP', '2021-02-04', 3562),
(15, 1, 'REF00000015', 'DELL', '2020-02-05', 3562),
(16, 1, 'REF00000016', 'DELL', '2020-02-07', 3500),
(17, 1, 'REF00000017', 'DELL', '2020-10-08', 3562),
(18, 1, 'REF00000018', 'SAMSUNG', '2022-11-23', 3562),
(19, 1, 'REF00000019', 'SAMSUNG', '2022-01-23', 3562),
(20, 1, 'REF00000020', 'SAMSUNG', '2022-01-22', 3500),
(22, 2, 'REF00000022', 'HP', '2021-01-23', 3562),
(23, 2, 'REF00000023', 'LENOVO', '2022-08-02', 3562),
(24, 2, 'REF00000024', 'LENOVO', '2022-01-02', 3562),
(25, 2, 'REF00000025', 'LENOVO', '2022-05-02', 3500),
(26, 2, 'REF00000026', 'LENOVO', '2022-06-02', 3562),
(27, 2, 'REF00000027', 'HP', '2021-11-23', 3562),
(28, 2, 'REF00000028', 'HP', '2021-01-24', 3562),
(29, 2, 'REF00000029', 'HP', '2021-05-22', 3500),
(30, 2, 'REF00000030', 'LENOVO', '2021-01-23', 3562),
(31, 2, 'REF00000031', 'LENOVO', '2021-02-15', 3562),
(32, 2, 'REF00000032', 'LENOVO', '2021-01-26', 3562),
(33, 2, 'REF00000033', 'MSI', '2021-03-22', 3500),
(34, 2, 'REF00000034', 'ASUS', '2021-03-23', 3562),
(35, 2, 'REF00000035', 'ASUS', '2021-11-23', 3562),
(36, 2, 'REF00000036', 'MICROMAX', '2021-01-23', 3562),
(37, 2, 'REF00000037', 'MICROMAX', '2021-01-22', 3500),
(38, 3, 'REF00000038', 'DELL', '2021-01-22', 3500),
(39, 3, 'REF00000039', 'HP', '2021-01-23', 3562),
(40, 3, 'REF00000040', 'MICROMAX', '2020-08-25', 3562),
(41, 3, 'REF00000041', 'MICROMAX', '2020-01-23', 3562),
(42, 3, 'REF00000042', 'MICROMAX', '2020-09-22', 3500),
(43, 3, 'REF00000043', 'SONY', '2021-06-23', 3562),
(44, 3, 'REF00000044', 'HP', '2021-01-23', 3562),
(45, 3, 'REF00000045', 'HP', '2021-01-24', 3562),
(46, 3, 'REF00000046', 'HP', '2021-05-22', 3500),
(47, 3, 'REF00000047', 'MSI', '2021-12-23', 3562),
(48, 3, 'REF00000048', 'MSI', '2020-02-04', 3562),
(49, 3, 'REF00000049', 'MSI', '2020-01-04', 3562),
(50, 3, 'REF00000050', 'MSI', '2020-03-22', 3500),
(51, 3, 'REF00000051', 'ASUS', '2020-03-01', 3562),
(52, 3, 'REF00000052', 'ASUS', '2020-11-01', 3562),
(53, 3, 'REF00000053', 'ASUS', '2020-12-05', 3562),
(54, 3, 'REF00000054', 'SONY', '2020-01-01', 3500),
(55, 4, 'REF00000055', 'DELL', '2020-01-22', 3500),
(56, 4, 'REF00000056', 'HP', '2021-01-23', 3562),
(57, 4, 'REF00000057', 'SONY', '2021-08-01', 3562),
(58, 4, 'REF00000058', 'SONY', '2021-01-23', 3562),
(59, 4, 'REF00000059', 'SONY', '2021-12-01', 3500),
(60, 4, 'REF00000060', 'SONY', '2021-06-01', 3562),
(61, 4, 'REF00000061', 'HP', '2021-01-23', 3562),
(62, 4, 'REF00000062', 'HP', '2021-01-24', 3562),
(63, 4, 'REF00000063', 'HP', '2021-05-22', 3500),
(64, 4, 'REF00000064', 'MSI', '2022-01-23', 3562),
(65, 4, 'REF00000065', 'MSI', '2022-02-15', 3562),
(66, 4, 'REF00000066', 'MSI', '2022-01-26', 3562),
(67, 4, 'REF00000067', 'MSI', '2022-03-22', 3500),
(68, 4, 'REF00000068', 'ACER', '2020-03-23', 3562),
(69, 4, 'REF00000069', 'ACER', '2020-11-03', 3562),
(70, 4, 'REF00000070', 'ACER', '2020-01-03', 3562),
(71, 4, 'REF00000071', 'SONY', '2020-01-22', 3500),
(72, 5, 'REF00000072', 'DELL', '2020-02-01', 3500),
(73, 5, 'REF00000073', 'HP', '2021-01-23', 3562),
(74, 5, 'REF00000074', 'SONY', '2021-08-25', 3562),
(75, 5, 'REF00000075', 'SONY', '2021-01-23', 3562),
(76, 5, 'REF00000076', 'SONY', '2021-01-22', 3500),
(77, 5, 'REF00000077', 'SONY', '2021-06-23', 3562),
(78, 5, 'REF00000078', 'HP', '2021-01-23', 3562),
(79, 5, 'REF00000079', 'HP', '2021-01-24', 3562),
(80, 5, 'REF00000080', 'HP', '2021-05-22', 3500),
(81, 5, 'REF00000081', 'MSI', '2021-01-23', 3562),
(82, 5, 'REF00000082', 'MSI', '2021-03-03', 3562),
(83, 5, 'REF00000083', 'MSI', '2021-01-03', 3562),
(84, 5, 'REF00000084', 'MSI', '2021-03-22', 3500),
(85, 5, 'REF00000085', 'ASUS', '2021-03-23', 3562),
(86, 5, 'REF00000086', 'LENOVO', '2021-11-23', 3562),
(87, 5, 'REF00000087', 'LENOVO', '2021-01-23', 3562),
(88, 5, 'REF00000088', 'LENOVO', '2021-01-22', 3500),
(89, 6, 'REF00000089', 'DELL', '2021-01-22', 3500),
(90, 6, 'REF00000090', 'HP', '2021-01-23', 3562),
(91, 6, 'REF00000091', 'SONY', '2021-08-25', 3562),
(92, 6, 'REF00000092', 'SONY', '2021-01-03', 3562),
(93, 6, 'REF00000093', 'SONY', '2021-01-03', 3500),
(94, 6, 'REF00000094', 'SONY', '2021-06-23', 3562),
(95, 6, 'REF00000095', 'HP', '2020-01-23', 3562),
(96, 6, 'REF00000096', 'HP', '2020-01-24', 3562),
(97, 6, 'REF00000097', 'HP', '2020-05-22', 3500),
(98, 6, 'REF00000098', 'MSI', '2021-01-23', 3562),
(99, 6, 'REF00000099', 'MSI', '2021-02-15', 3562),
(100, 6, 'REF00000101', 'LENOVO', '2021-01-22', 3500),
(101, 7, 'REF00000102', 'DELL', '2021-01-22', 3500),
(102, 7, 'REF00000103', 'HP', '2021-01-23', 3562),
(103, 7, 'REF00000104', 'SONY', '2022-08-25', 3562),
(104, 7, 'REF00000105', 'SONY', '2021-01-23', 3562),
(105, 7, 'REF00000106', 'MICROMAX', '2021-01-22', 3500),
(106, 7, 'REF00000107', 'MICROMAX', '2021-06-23', 3562),
(107, 7, 'REF00000108', 'HP', '2021-01-23', 3562),
(108, 7, 'REF00000109', 'HP', '2021-01-24', 3562),
(109, 7, 'REF00000110', 'HP', '2021-05-22', 3500),
(110, 7, 'REF00000111', 'MSI', '2021-01-23', 3562),
(111, 7, 'REF00000112', 'MSI', '2021-02-15', 3562),
(112, 7, 'REF00000113', 'MSI', '2021-03-22', 3500),
(113, 7, 'REF00000114', 'ASUS', '2022-03-23', 3562),
(114, 7, 'REF00000115', 'ASUS', '2022-11-09', 3562),
(115, 7, 'REF00000116', 'ASUS', '2022-01-09', 3562),
(116, 7, 'REF00000117', 'SONY', '2022-01-07', 3500),
(117, 7, 'REF00000118', 'SONY', '2022-01-07', 3500),
(118, 8, 'REF00000119', 'DELL', '2022-01-22', 3500),
(119, 8, 'REF00000120', 'HP', '2021-01-23', 3562),
(120, 8, 'REF00000121', 'ACER', '2020-08-25', 3562),
(121, 8, 'REF00000122', 'ACER', '2020-01-23', 3562),
(122, 8, 'REF00000123', 'ACER', '2020-01-22', 3500),
(123, 8, 'REF00000124', 'SONY', '2020-06-23', 3562),
(124, 8, 'REF00000125', 'HP', '2021-01-23', 3562),
(125, 8, 'REF00000126', 'HP', '2021-01-24', 3562),
(126, 8, 'REF00000127', 'HP', '2021-05-22', 3500),
(127, 8, 'REF00000128', 'MSI', '2021-01-23', 3562),
(128, 8, 'REF00000129', 'MSI', '2021-02-15', 3562),
(129, 8, 'REF00000130', 'MSI', '2021-03-22', 3500),
(130, 8, 'REF00000131', 'ASUS', '2021-03-23', 3562),
(131, 8, 'REF00000132', 'ASUS', '2021-10-23', 3562),
(132, 8, 'REF00000133', 'ASUS', '2021-03-23', 3562),
(133, 8, 'REF00000134', 'SONY', '2021-03-22', 3500),
(134, 8, 'REF00000135', 'SONY', '2021-03-22', 3500),
(135, 9, 'REF00000136', 'DELL', '2021-03-22', 3500),
(136, 9, 'REF00000137', 'HP', '2021-01-23', 3562),
(137, 9, 'REF00000138', 'ACER', '2022-08-25', 3562),
(138, 9, 'REF00000139', 'ACER', '2022-01-09', 3562),
(139, 9, 'REF00000140', 'ACER', '2022-01-09', 3500),
(140, 9, 'REF00000141', 'SONY', '2022-06-23', 3562),
(141, 9, 'REF00000142', 'HP', '2021-01-23', 3562),
(142, 9, 'REF00000143', 'HP', '2021-01-24', 3562),
(143, 9, 'REF00000144', 'HP', '2021-05-22', 3500),
(145, 9, 'REF00000146', 'MSI', '2021-02-15', 3562),
(146, 9, 'REF00000147', 'MSI', '2021-03-22', 3500),
(147, 9, 'REF00000148', 'ASUS', '2022-03-23', 3562),
(148, 9, 'REF00000149', 'ASUS', '2022-11-23', 3562),
(150, 9, 'REF00000151', 'SONY', '2022-01-22', 3500),
(151, 9, 'REF00000152', 'SONY', '2022-01-22', 3500),
(152, 10, 'REF0000153', 'HP', '2022-01-21', 2500),
(153, 7, 'REFXXXXXXXXX1253', 'DELL', '2022-01-21', 4503);

-- --------------------------------------------------------

--
-- Table structure for table `salle`
--

CREATE TABLE `salle` (
  `id` int(11) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `salle`
--

INSERT INTO `salle` (`id`, `code`, `label`, `type`) VALUES
(1, 'S1', 'SALLE 1', 'LR'),
(2, 'S2', 'SALLE 2', 'TD'),
(3, 'S3', 'SALLE 3', 'CC'),
(4, 'S4', 'SALLE 4', 'TD'),
(5, 'S5', 'SALLE 5', 'TP'),
(6, 'S6', 'SALLE 6', 'TD'),
(7, 'S7', 'SALLE 7', 'TP'),
(8, 'S8', 'SALLE 8', 'LR'),
(9, 'S9', 'SALLE 9', 'CC'),
(10, 'S10', 'SALLE 10', 'CC');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `LOGIN` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(120) DEFAULT NULL,
  `NOM` varchar(50) DEFAULT NULL,
  `PRENOM` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(120) NOT NULL,
  `STATUS` int(11) NOT NULL,
  `IMAGE` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `LOGIN`, `EMAIL`, `NOM`, `PRENOM`, `PASSWORD`, `STATUS`, `IMAGE`) VALUES
(23, 'TQZTCNUQMS', NULL, NULL, NULL, '2T9X8t7D5J3G6VLCVsNCrg==', 0, '../app-assets/images/portrait/small/avatar-s-8.jpg'),
(24, 'BPIERSVSPS', NULL, NULL, NULL, 'jFmaxMTPTKBYqyWfmTDmZQ==', 0, '../app-assets/images/portrait/small/avatar-s-8.jpg'),
(25, 'BVBIIKIKGS', NULL, NULL, NULL, 'sNWjqxhz63U2Oo/23HRnMQ==', 1, '../app-assets/images/portrait/small/avatar-s-8.jpg'),
(26, 'ESAUDOBEFC', NULL, NULL, NULL, 'u7yxznADBkRWLp0GU8kKlA==', 0, '../app-assets/images/portrait/small/avatar-s-8.jpg'),
(27, 'SGNMKJCNYA', NULL, NULL, NULL, 'LB1Z6+z7S1voip8XPfGNMQ==', 0, '../app-assets/images/portrait/small/avatar-s-8.jpg'),
(29, 'SIMO', 'simo@email.ma', 'AIT ALLA', 'MOHAMED', 'Yoz5vjZobt2twhKT465Kug==', 2, '../app-assets/images/portrait/small/avatar-s-8.jpg'),
(33, 'IVLCECCTPX', NULL, NULL, NULL, 'WO4lWd1NniS/EwAVIY039Q==', 0, '../app-assets/images/portrait/small/avatar-s-8.jpg'),
(34, 'TWDQLGLGBC', NULL, NULL, NULL, 'HEgkvSADdCtwsHTZ6cCBtg==', 0, '../app-assets/images/portrait/small/avatar-s-8.jpg'),
(35, 'FPFRVSVBQN', NULL, NULL, NULL, 'pLxUPMy0+cFRv/WtRQgtEA==', 0, '../app-assets/images/portrait/small/avatar-s-8.jpg'),
(36, 'RIZJKQBYLR', NULL, NULL, NULL, 'n7OgD0oCj5Fv70QY+WFFOQ==', 0, '../app-assets/images/portrait/small/avatar-s-8.jpg'),
(37, 'BLQLIEYDNQ', NULL, NULL, NULL, 'gp83ElhAdof7F/dO3VcsDw==', 0, '../app-assets/images/portrait/small/avatar-s-8.jpg'),
(38, 'PFLKAGRPHT', NULL, NULL, NULL, 'cEdw1mRwHSZaYy8JreElFQ==', 0, '../app-assets/images/portrait/small/avatar-s-8.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `machine`
--
ALTER TABLE `machine`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salle`
--
ALTER TABLE `salle`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `EMAIL` (`EMAIL`),
  ADD UNIQUE KEY `LOGIN` (`LOGIN`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `machine`
--
ALTER TABLE `machine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT for table `salle`
--
ALTER TABLE `salle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
