-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 28, 2018 lúc 05:00 AM
-- Phiên bản máy phục vụ: 10.1.36-MariaDB
-- Phiên bản PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shopbanhang`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `bill_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `date` date NOT NULL,
  `total_price` double NOT NULL,
  `payment` double NOT NULL,
  `address` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `bill`
--

INSERT INTO `bill` (`bill_id`, `user_id`, `date`, `total_price`, `payment`, `address`) VALUES
(696163407, 695050742, '2016-11-03', 200100, 0, 'Ha Noi'),
(702382232, 695050742, '2016-11-03', 200000, 0, 'HCM');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `billdetail`
--

CREATE TABLE `billdetail` (
  `billdetail_id` int(10) NOT NULL,
  `bill_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `price` float NOT NULL,
  `quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `billdetail`
--

INSERT INTO `billdetail` (`billdetail_id`, `bill_id`, `product_id`, `price`, `quantity`) VALUES
(1, 696163407, 102, 100000, 2),
(2, 696163407, 105, 100, 1),
(3, 702382232, 102, 100000, 2),
(4, -1239820846, 102, 100000, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `category_id` int(10) NOT NULL,
  `category_father` int(10) NOT NULL,
  `category_name` varchar(250) COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`category_id`, `category_father`, `category_name`) VALUES
(1, 2, 'Điện Thoại'),
(2, 2, 'Máy Tính Bảng'),
(3, 2, 'Pin sạc dự phòng'),
(4, 2, 'Ốp lưng & Bao da điện thoại'),
(5, 2, 'Phụ Kiện'),
(6, 2, 'Tivi'),
(7, 2, 'Tai Nghe'),
(8, 2, 'Máy Nghe Nhạc'),
(9, 2, 'Loa'),
(10, 2, 'Laptop'),
(11, 2, 'Linh kiện máy tính'),
(12, 1, 'Quần Áo'),
(13, 1, 'Túi Xách'),
(14, 1, 'Kính Thời Trang'),
(15, 1, 'Giày Dép'),
(16, 1, 'Đồng Hồ'),
(17, 1, 'Trang Sức'),
(18, 3, 'Đồ Gia Dụng'),
(19, 3, 'Dụng Cụ Làm Bếp'),
(20, 3, 'Đồ nội Thất'),
(21, 3, 'Đồ Trang Trí'),
(22, 4, 'Đồ trang điểm'),
(23, 4, 'Nước Hoa'),
(24, 4, 'Chăm sóc da mặt'),
(25, 4, 'Dụng cụ y tế'),
(26, 5, 'Đồ Thể thao nam'),
(27, 5, 'Đồ Thể thao nữ'),
(28, 5, 'Phụ kiện thể thao'),
(29, 5, 'Phụ kiện du lịch'),
(30, 6, 'Quần áo trẻ sơ sinh'),
(31, 6, 'Đồ chơi giáo dục trẻ em'),
(32, 6, 'Đồ dùng bú sữa & Ăn dặm'),
(33, 6, 'Máy bay và đồ chơi điều khiển từ xa'),
(882676011, 6, 'Mo Hinh Lap Ghep'),
(884375917, 2, 'Ohayo');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `product_id` int(10) NOT NULL,
  `category_id` int(10) NOT NULL,
  `product_name` varchar(250) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `product_image` varchar(250) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `product_info` varchar(250) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `product_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`product_id`, `category_id`, `product_name`, `product_image`, `product_info`, `product_price`) VALUES
(100, 1, 'product after update', 'images/8.png', 'info product', 1000),
(101, 2, 'product 2', 'images/35.jpg', 'none', 3000),
(102, 1, 'prodcut3', 'images/144.jpg', 'none3', 100000),
(103, 3, 'product4', 'images/pi4.jpg', 'none4', 5000),
(104, 1, 'product5', 'images/80.jpg', 'none 5', 1500),
(105, 2, 'product6', 'images/2.png', 'none6', 100),
(106, 12, 'Áo khoác nữ liền mũ, thiết kế dễ thương, phong cách Nhật Bản', 'images/49.jpg', 'Chất liệu: Cotton\r\nThành phần chất liệu chính: cotton\r\nPhong cách: Nhật Bản\r\nĐộ dày mỏng: Trung bình\r\nKiểu tay áo: cơ bản\r\nThiết kế nổi bật: In hoa\r\nMàu sắc: Màu xanh lam, màu hồng\r\nKiểu cổ: Liền mũ\r\nĐộ dài áo: kiểu cơ bản(50cm < độ dài áo < 65cm)\r\nK', 171000),
(107, 12, 'Áo phông A1058 | Pull - Áo phông', 'images/23.jpg', 'Kích thước: Dài 64cm, rộng ngực 104cm, tay 34cm, vai 43cm\r\n\r\nKhối lượng: 150g\r\n\r\nVải:Đũi', 190000),
(108, 12, 'Áo khoác họa tiết ngôi sao NN182', 'images/9.jpg', 'Tên sản phẩm: Áo khoác họa tiết ngôi sao NN182\r\nPhong cách: Nhật bản\r\nMàu sắc: Tím than, xám\r\nSize: 1size\r\nChất liệu: Bông\r\nKích thước: 39/97/60/25/110/71', 577000),
(109, 12, 'Áo Vest Công Sở', 'images/15.jpg', 'Chất liệu tuyết mưa nhẹ nhàng, mềm mại, thấm hút tốt thích hợp cho bạn gái thoải mái diện đén bất kỳ hoàn cảnh nào. Thiết kế kiểu áo vest truyền thống tay dài, một nút đính phía trước mang lại sự sang trọng cho bạn nữ', 215000),
(110, 12, 'Váy phong cách Nhật Bản Mori', 'images/17.jpg', 'Làm đẹp là nhu cầu thiết yếu của bạn gái, đó là cách để thể hiện bản thân và guu thẩm mỹ của mình. Hiểu rõ nhu cầu đó, shop quần áo phong cách Nhật Bản ra đời với mong muốn cung cấp cho khách hàng những mẫu thời trang độc, lạ và mới nhất như : áo kiể', 285000),
(111, 12, 'Áo khoác denim nữ liền mũ, kiểu dáng mới trẻ trung, mẫu Nhật Bản', 'images/44.jpg', 'Chất kiệu: vải bò\r\nĐộ dài tay áo: dài tay	\r\nKiểu tay áo: cơ bản	\r\nKiểu cổ: liền mũ\r\nKiểu khóa: Cúc hàng đơn\r\nHọa tiết: một màu\r\nMàu sắc: như trong hình', 259200),
(112, 12, 'QUẦN JEANS NAM LEVI’S 511 MÀU XANH 100% COTTON', 'images/104.jpg', 'Quần Jeans nam Levi’s form cơ bản màu xanh (đơn giản form ôm đẹp chuẩn).Hàng Jeans xuất khẩu chất lượng tốt nhất, quần Jeans Levi’s 511 100%  cotton màu xanh sáng, rất là chất lượng, có đầy đủ các size, các bạn tha hồ mà lựa chọn size cho mình.\r\nSize', 355000),
(113, 12, 'QUẦN JEAN NAM TRẮNG', 'images/30.jpg', 'Kích cỡ:\r\nSize 28: Dưới 48kg\r\nSize 29: Dưới 54kg\r\nSize 30: Dưới 58kg\r\nSize 31: Dưới 64kg\r\nSize 32: Dưới 70kg\r\n\r\nChất vải: Jean co giản\r\nKiểu quần: Quần jean trắng co giản ống côn.\r\nXuất xứ: vải jean nhập Hàn Quốc, gia công Việt Nam.', 198500),
(114, 12, 'Quần bò jeans nam ống côn ', 'images/91.jpg', '- Size: 28-34.\r\n\r\n\r\n\r\n- Xuất xứ: Hồng Kông.', 349000),
(115, 12, 'Áo pull hồng thêu họa tiết hoạt hình', 'images/95.jpg', 'Phong cách: Ngọt ngào \r\nin động vật: Pattern\r\nVải: Cotton\r\n\r\nXuất xứ: Trung quốc', 436000),
(116, 12, 'Áo chống nắng họa tiết hoa xuân thời trang ', 'images/5.jpg', 'Áo chống nắng họa tiết hoa xuân thời trang: Chất liệu kaki mềm mại, thoáng mát, không hầm bí khi mặc, có độ dày lý tưởng. Thiết kế có mũ, tay dài có khóa kéo tiện dụng giúp bạn gái tránh các tác nhân từ bên ngoài', 210000),
(121, 13, 'Túi Xách Nữ Đeo Chéo Nắp Chữ A', 'images/137.jpg', '-Hàng nhập khẩu từ Quảng Châu\r\n \r\n-Kích thước : cao 18 x ngang 15 x đáy 5\r\n \r\n-Màu sắc : đen, đỏ đô ,tím , hồng , cam\r\n\r\n-Chất liệu: da PU', 135000),
(895092387, 1, 'Nokia 1280 Legendary - Black', 'images/79.jpg', '\r\nH? ?i?u hành - CPU\r\nHãng s?n xu?t	Nokia\r\nS? core	Single Core\r\nB? x? lý ?? ho?	24.4kg\r\nMàn hình\r\nKích th??c màn hình	1.3inch\r\n?? phân gi?i màn hình	96 x 68pixels\r\nKi?u màn hình	Màn hình ??n s?c\r\nCamera\r\nCamera sau	Không có\r\nB? nh?\r\nLo?i th? nh? tích', 10000000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `user_id` int(10) NOT NULL,
  `user_name` varchar(250) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `user_email` varchar(250) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `user_phone` varchar(12) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `user_address` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `user_pass` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `user_role` varchar(2) COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_email`, `user_phone`, `user_address`, `user_pass`, `user_role`) VALUES
(621446244, 'Lee Huyn', 'ginnyproduction@gmail.com', '01233623622', 'Ha Noi', '202cb962ac59075b964b07152d234b70', '0'),
(625421097, 'Seyoon', 'seoyoon2596@gmail.com', '0246542485', 'Tp.HCM', 'a75786f01e5abdae9531988700c966aa', '0'),
(695050742, 'Haiyaku', 'chinkcd@yahoo.com', '01233623622', 'Viet Tri', 'a75786f01e5abdae9531988700c966aa', '0'),
(777744499, 'Regain Psy', 'huuchi2596@gmail.com', '01233623622', 'Ha Noi', 'a75786f01e5abdae9531988700c966aa', '0'),
(779342796, 'RenKoha', 'namnkcd@gmail.com', '096454206', 'Ha Noi', 'e10adc3949ba59abbe56e057f20f883e', '0');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bill_id`);

--
-- Chỉ mục cho bảng `billdetail`
--
ALTER TABLE `billdetail`
  ADD PRIMARY KEY (`billdetail_id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bill`
--
ALTER TABLE `bill`
  MODIFY `bill_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=702382233;

--
-- AUTO_INCREMENT cho bảng `billdetail`
--
ALTER TABLE `billdetail`
  MODIFY `billdetail_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=884375918;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=895092388;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=779342797;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
