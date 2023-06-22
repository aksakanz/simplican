-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2023 at 12:23 PM
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
-- Database: `android`
--

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `event_id` int(100) NOT NULL,
  `event_title` varchar(100) NOT NULL,
  `event_desc` text NOT NULL,
  `event_pos` varchar(200) NOT NULL,
  `event_time` varchar(100) NOT NULL,
  `event_post_date` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`event_id`, `event_title`, `event_desc`, `event_pos`, `event_time`, `event_post_date`) VALUES
(1, 'Seminar Kepemimpinan', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nWhy do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\n', 'Harapan Indah, Bekasi', '10.00 S/D Selesai', '13 Juni 2023'),
(2, 'Bazar Barang', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed dictum tristique libero, a aliquam enim condimentum a. Fusce ut libero commodo, faucibus ex sed, mattis sem. Vivamus ac lacus ac massa faucibus ultrices id ac arcu. Phasellus auctor feugiat turpis a fringilla. Suspendisse at convallis justo. Nullam vulputate, purus ac bibendum pulvinar, elit nulla lacinia nibh, id malesuada ipsum arcu non erat. Aliquam venenatis rutrum pharetra. Sed viverra, dui nec suscipit feugiat, nibh tellus gravida dolor, eu consequat est nunc eu risus.\n\nPellentesque in ex ac nunc commodo aliquet sed non magna. Integer interdum consequat odio, vitae lacinia nisl eleifend sit amet. Proin sed mauris vitae sem dignissim dignissim vitae eget enim. Curabitur dictum iaculis neque ac consequat. Fusce feugiat sollicitudin eleifend. Aliquam sagittis semper mauris, non tristique velit elementum nec. Nunc eu purus at lectus blandit tempus. Donec lacinia vestibulum consequat. Integer lacinia eros in faucibus varius. Ut id ante massa. Vestibulum feugiat odio vel arcu eleifend fringilla. Nullam efficitur varius ex, sed auctor sem. Sed sed mauris elit.\n\nQuisque ullamcorper, sapien ut ultrices varius, turpis dolor lobortis mi, id commodo velit ex ut ante. Mauris nec augue ipsum. Nullam nec enim leo. Phasellus elementum feugiat malesuada. Sed ullamcorper ipsum vitae pharetra euismod. Fusce efficitur dui nec tellus efficitur interdum. Vestibulum fermentum ante et metus volutpat, sit amet sollicitudin neque tristique. Ut viverra pharetra augue, at finibus mi fringilla at. Suspendisse potenti. Fusce at quam consequat, laoreet purus a, mollis nisi.\n\nVestibulum facilisis augue vel ligula convallis cursus. Nullam ac enim et erat lobortis gravida ac a metus. Mauris scelerisque risus ut risus convallis, ac faucibus metus varius. Nullam porttitor nibh vitae urna lacinia, ac elementum felis tempor. Sed fringilla dapibus quam, eget tempus nibh dapibus a. Vestibulum sodales feugiat sagittis. Donec laoreet sem sit amet metus ultricies, nec efficitur diam feugiat. Phasellus iaculis lorem quis quam placerat, vitae laoreet enim auctor. Proin a nulla scelerisque, finibus odio id, luctus tellus. Integer fermentum lectus eget mi auctor vulputate.\n\nSed consectetur dolor ut erat ultricies, id iaculis leo tincidunt. Sed condimentum condimentum sem a ullamcorper. Sed dapibus enim eget elit interdum facilisis. Sed pharetra purus ac urna condimentum, vitae ullamcorper elit ultrices. Morbi gravida lacus ut mauris sollicitudin, at commodo nunc dignissim. Integer vel risus dui. Maecenas pharetra ligula id tortor rutrum, ac luctus ex finibus. Etiam tristique facilisis nisl, at consectetur metus malesuada et. Integer non arcu quis nisl consectetur consequat. Donec eleifend ultricies justo, in fringilla eros pretium nec. Curabitur vulputate semper tincidunt. Vestibulum iaculis semper mauris, nec bibendum felis ullamcorper vitae.\n', 'Esa Unggul, Jakarta', '20 Desember 2023', '10 Juni 2023');

-- --------------------------------------------------------

--
-- Table structure for table `event_register`
--

CREATE TABLE `event_register` (
  `id` int(11) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `event_title` varchar(200) NOT NULL,
  `event_pos` varchar(100) NOT NULL,
  `event_time` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event_register`
--

INSERT INTO `event_register` (`id`, `nim`, `nama`, `event_title`, `event_pos`, `event_time`) VALUES
(1, '20180801041', 'Aksa Kanz Daffa', 'Seminar Kepemimpinan', 'Jakarta', '10 Desember 2023');

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `jobv_id` int(10) NOT NULL,
  `jobv_title` varchar(100) NOT NULL,
  `jobv_desc` text NOT NULL,
  `jobv_date` varchar(100) NOT NULL,
  `jobv_post_date` varchar(100) NOT NULL,
  `job_post_by` varchar(100) NOT NULL,
  `jobv_pos` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`jobv_id`, `jobv_title`, `jobv_desc`, `jobv_date`, `jobv_post_date`, `job_post_by`, `jobv_pos`) VALUES
(1, 'Junior Web Development', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nWhy do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', '10 Juni 2023', '1 Juni 2023', 'Admin', 'Jakarta');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(5) NOT NULL,
  `nim` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `role` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `ipk` varchar(100) NOT NULL,
  `thn_lulus` varchar(100) NOT NULL,
  `prodi` varchar(100) NOT NULL,
  `fakultas` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `pekerjaan` varchar(100) NOT NULL,
  `angkatan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nim`, `password`, `nama`, `role`, `status`, `ipk`, `thn_lulus`, `prodi`, `fakultas`, `alamat`, `pekerjaan`, `angkatan`) VALUES
(1, '20180801041', '123', 'Aksa Kanz Daffa', 'mahasiswa', 'Aktif Perkuliahan', '4,00', 'Belum Lulus', 'Teknik Informatika', 'Ilmu Komputer', 'Bekasi', 'Mahasiswa', '2018'),
(2, '000', '000', 'Administrator', 'admin', '', '', '', '', '', 'Bekasi', '', ''),
(5, '002', '123', 'Administrator 2', 'admin', '', '', '', '', '', 'Bogor', '', ''),
(6, '003', '123', 'Administrator 3', 'admin', '', '', '', '', '', 'Bandung', '', ''),
(8, '20210801084', '123', 'Ardy Andhika Haydar', 'mahasiswa', 'Aktif Perkuliahan', '3.85', 'Belum Lulus', 'teknik informatika ', 'ilmu komputer', 'jl swalayan no 100', 'Mahasiswa', '2021'),
(9, '004', '004', 'Administrator 4', 'admin', '', '', '', '', '', 'Indonesia', '', ''),
(10, '005', '123', 'Administrator 5', 'admin', '', '', '', '', '', 'Indonesia', '', ''),
(12, '2030', '123', 'MHS TEST', 'mahasiswa', '', '', '', '', '', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `event_register`
--
ALTER TABLE `event_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`jobv_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `event_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `event_register`
--
ALTER TABLE `event_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `jobv_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
