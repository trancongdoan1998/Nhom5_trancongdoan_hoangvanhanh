-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 24, 2020 lúc 06:19 AM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quanlyphongkham`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(10) NOT NULL,
  `tendichvu` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `active` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `tendichvu`, `ngaytao`, `active`) VALUES
(1, 'Khám bệnh', '2020-05-24 04:04:55', 0),
(2, 'Thủ thuật', NULL, 0),
(3, 'Thuốc', NULL, 0),
(4, 'Kính', NULL, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietdichvu`
--

CREATE TABLE `chitietdichvu` (
  `id` int(10) NOT NULL,
  `tendv` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(10) NOT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `active` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietdichvu`
--

INSERT INTO `chitietdichvu` (`id`, `tendv`, `category_id`, `ngaytao`, `active`) VALUES
(1, 'Tại phòng khám', 1, NULL, 0),
(2, 'Tại nhà', 1, NULL, 0),
(3, 'Phẫu thuật', 2, NULL, 0),
(4, 'Thẩm mỹ', 2, NULL, 0),
(5, 'Khúc xạ', 4, NULL, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donkham`
--

CREATE TABLE `donkham` (
  `id` int(10) NOT NULL,
  `tenchuandoan` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `thuoc_id` int(10) NOT NULL,
  `soluong` int(4) NOT NULL,
  `ngaytao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `active` int(1) NOT NULL DEFAULT 0,
  `ghichu` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `loaidichvu_id` int(10) NOT NULL,
  `pmtongdon` int(3) DEFAULT NULL,
  `pmtheodichvu` int(3) DEFAULT NULL,
  `users_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lichtaikham`
--

CREATE TABLE `lichtaikham` (
  `id` int(10) NOT NULL,
  `users_id` int(10) NOT NULL,
  `donkham_id` int(10) NOT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `active` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thuoc`
--

CREATE TABLE `thuoc` (
  `id` int(10) NOT NULL,
  `ten` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `active` int(1) NOT NULL DEFAULT 0,
  `gianhap` int(10) NOT NULL,
  `giaban` int(10) NOT NULL,
  `cachdung` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `donvitinh` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `thuoc`
--

INSERT INTO `thuoc` (`id`, `ten`, `ngaytao`, `active`, `gianhap`, `giaban`, `cachdung`, `donvitinh`) VALUES
(1, 'Nước muối', '2020-05-24 04:14:25', 0, 10000, 15000, 'sát trùng', 'chai'),
(2, 'minto', '2020-05-24 04:14:25', 0, 1000, 2000, 'Bột dùng để uống ,muc đích giúp tăng cân', 'gói');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thuthuat`
--

CREATE TABLE `thuthuat` (
  `id` int(10) NOT NULL,
  `ten` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `thuthuat`
--

INSERT INTO `thuthuat` (`id`, `ten`, `ngaytao`, `active`) VALUES
(1, 'Phẫu thuật', '2020-05-24 04:17:26', 0),
(2, 'Thẩm mỹ', '2020-05-22 04:17:26', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `ten` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `diachi` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `sdt` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `pass` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gioitinh` int(1) NOT NULL,
  `namsinh` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `active` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `chitietdichvu`
--
ALTER TABLE `chitietdichvu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `donkham`
--
ALTER TABLE `donkham`
  ADD PRIMARY KEY (`id`),
  ADD KEY `thuoc_id` (`thuoc_id`),
  ADD KEY `loaidichvu_id` (`loaidichvu_id`),
  ADD KEY `users_id` (`users_id`);

--
-- Chỉ mục cho bảng `lichtaikham`
--
ALTER TABLE `lichtaikham`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `donkham_id` (`donkham_id`);

--
-- Chỉ mục cho bảng `thuoc`
--
ALTER TABLE `thuoc`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `thuthuat`
--
ALTER TABLE `thuthuat`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `chitietdichvu`
--
ALTER TABLE `chitietdichvu`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `donkham`
--
ALTER TABLE `donkham`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `lichtaikham`
--
ALTER TABLE `lichtaikham`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `thuoc`
--
ALTER TABLE `thuoc`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `thuthuat`
--
ALTER TABLE `thuthuat`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
