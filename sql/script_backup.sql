USE [QLDienThoai]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 12/20/2021 8:14:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaCTHD] [int] IDENTITY(1,1) NOT NULL,
	[MaHoaDon] [int] NULL,
	[MaDienThoai] [nvarchar](255) NULL,
	[SoLuong] [int] NULL,
	[DaMua] [bit] NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[MaCTHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DangNhap]    Script Date: 12/20/2021 8:14:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DangNhap](
	[TenDangNhap] [nvarchar](50) NOT NULL,
	[Ten] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[Quyen] [int] NULL,
 CONSTRAINT [PK_DangNhap] PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DienThoai]    Script Date: 12/20/2021 8:14:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DienThoai](
	[MaDienThoai] [nvarchar](255) NOT NULL,
	[TenDienThoai] [nvarchar](max) NULL,
	[Gia] [int] NULL,
	[MaNSX] [nvarchar](50) NULL,
	[Anh] [nvarchar](max) NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_DienThoai] PRIMARY KEY CLUSTERED 
(
	[MaDienThoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 12/20/2021 8:14:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[MaKhachHang] [int] NULL,
	[NgayMua] [datetime] NULL,
	[DaMua] [bit] NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/20/2021 8:14:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKhachHang] [int] IDENTITY(1,1) NOT NULL,
	[TenKhachHang] [nvarchar](255) NULL,
	[SoDienThoai] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[TenDangNhap] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaSanXuat]    Script Date: 12/20/2021 8:14:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaSanXuat](
	[MaNSX] [nvarchar](50) NOT NULL,
	[TenNSX] [nvarchar](max) NULL,
 CONSTRAINT [PK_NhaSanXuat] PRIMARY KEY CLUSTERED 
(
	[MaNSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongSoKyThuat]    Script Date: 12/20/2021 8:14:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongSoKyThuat](
	[MaDienThoai] [nvarchar](255) NOT NULL,
	[KichThuocManHinh] [nvarchar](50) NULL,
	[CongNgheManHinh] [nvarchar](50) NULL,
	[CameraSau] [nvarchar](max) NULL,
	[CameraTruoc] [nvarchar](max) NULL,
	[Chipset] [nvarchar](50) NULL,
	[DungLuongRAM] [nvarchar](50) NULL,
	[BoNhoTrong] [nvarchar](50) NULL,
	[Pin] [nvarchar](max) NULL,
	[TheSim] [nvarchar](50) NULL,
	[HeDieuHanh] [nvarchar](max) NULL,
	[DoPhanGiaiManHinh] [nvarchar](max) NULL,
	[LoaiCPU] [nvarchar](max) NULL,
	[KichThuoc] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] ON 

INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHoaDon], [MaDienThoai], [SoLuong], [DaMua]) VALUES (14, 9, N'iphone12', 1, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHoaDon], [MaDienThoai], [SoLuong], [DaMua]) VALUES (15, 9, N'iphone12pro', 1, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHoaDon], [MaDienThoai], [SoLuong], [DaMua]) VALUES (24, 5, N'iphone12', 2, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHoaDon], [MaDienThoai], [SoLuong], [DaMua]) VALUES (26, 12, N'iphone11pro', 1, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHoaDon], [MaDienThoai], [SoLuong], [DaMua]) VALUES (30, 11, N'iphone11promax', 1, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHoaDon], [MaDienThoai], [SoLuong], [DaMua]) VALUES (31, 6, N'iphone12', 1, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHoaDon], [MaDienThoai], [SoLuong], [DaMua]) VALUES (32, 6, N'iphone11promax', 1, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHoaDon], [MaDienThoai], [SoLuong], [DaMua]) VALUES (34, 13, N'iphone12', 1, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHoaDon], [MaDienThoai], [SoLuong], [DaMua]) VALUES (35, 13, N'iphone11pro', 1, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHoaDon], [MaDienThoai], [SoLuong], [DaMua]) VALUES (38, 14, N'iphone12', 1, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHoaDon], [MaDienThoai], [SoLuong], [DaMua]) VALUES (40, 15, N'opporeno4pro', 2, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHoaDon], [MaDienThoai], [SoLuong], [DaMua]) VALUES (41, 15, N'iphone11pro', 1, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHoaDon], [MaDienThoai], [SoLuong], [DaMua]) VALUES (42, 16, N'iphone11pro', 1, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHoaDon], [MaDienThoai], [SoLuong], [DaMua]) VALUES (43, 16, N'nokiac20', 1, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHoaDon], [MaDienThoai], [SoLuong], [DaMua]) VALUES (46, 18, N'iphone12', 1, 1)
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] OFF
GO
INSERT [dbo].[DangNhap] ([TenDangNhap], [Ten], [MatKhau], [Quyen]) VALUES (N'aaa', N'aaa', N'aaa', 1)
INSERT [dbo].[DangNhap] ([TenDangNhap], [Ten], [MatKhau], [Quyen]) VALUES (N'admin', N'Chủ quán', N'admin', 1)
GO
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'iphone11', N'iPhone 11', 15900000, N'Apple', N'image_dienthoai/iphone-11.jpg', 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'iphone11pro', N'iPhone11 Pro', 23000000, N'Apple', N'image_dienthoai/iphone-11-pro.jpg', 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'iphone11promax', N'iPhone 11 Pro Max', 26000000, N'Apple', N'image_dienthoai/iphone-11-pro-max.jpg', 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'iphone12', N'iPhone 12', 19400000, N'Apple', N'image_dienthoai/iphone-12.jpg', 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'iphone12pro', N'iPhone 12 Pro', 26900000, N'Apple', N'image_dienthoai/iphone-12-pro.jpg', 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'iphone12promax', N'iPhone 12 Pro Max', 30000000, N'Apple', N'image_dienthoai/iphone-12-pro-max.jpg', 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'iphone13', N'iPhone 13', 23900000, N'Apple', N'image_dienthoai/iphone-13.jpg', 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'iphone13pro', N'iPhone 13 Pro', 30000000, N'Apple', N'image_dienthoai/iphone-13-pro.jpg', 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'iphone13promax', N'iPhone 13 Pro Max', 33000000, N'Apple', N'image_dienthoai/iphone-13-pro-max.jpg', 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'iphonexr', N'iPhone XR', 12500000, N'Apple', N'image_dienthoai/iphone-xr.jpg', 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'nokiac20', N'Nokia C20', 2190000, N'Nokia', N'image_dienthoai/nokia-c20.jpg', 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'nokiac30', N'Nokia C30', 3190000, N'Nokia', N'image_dienthoai/nokia-c30.jpg', 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'nokiag10', N'Nokia G10', 3490000, N'Nokia', N'image_dienthoai/nokia-g10.jpg', 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'nokiag50', N'Nokia G50 (5G)', 5990000, N'Nokia', N'image_dienthoai/nokia-g50.jpg', 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'oneplus8t', N'OnePlus 8T 5G', 14390000, N'OnePlus', N'image_dienthoai/oneplus-8t.jpg', 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'oneplusnordce', N'OnePlus Nord CE 5G', 7990000, N'OnePlus', N'image_dienthoai/oneplus-nord-ce-5g.jpg', 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'oneplusnordn10', N'Oneplus Nord N10 5G', 5890000, N'OnePlus', N'image_dienthoai/oneplus-nord-n10-5g.jpg', 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'oppofindx3pro', N'OPPO Find X3 Pro 5G', 19890000, N'OPPO', N'image_dienthoai/oppo-find-x3-pro.jpg', 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'opporeno4pro', N'Oppo Reno4 Pro', 8390000, N'OPPO', N'image_dienthoai/oppo-reno-4-pro.jpg', 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'opporeno5', N'Oppo Reno5 5G', 9990000, N'OPPO', N'image_dienthoai/oppo-reno-5-5g.jpg', 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'opporeno6', N'OPPO Reno6 5G', 12990000, N'OPPO', N'image_dienthoai/oppo-reno-6.jpg', 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'realme6', N'Realme 6', 5190000, N'Realme', N'image_dienthoai/realme-6.jpg', 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'realme7', N'Realme 7', 5590000, N'Realme', N'image_dienthoai/realme-7.jpg', 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'realme7pro', N'Realme 7 Pro', 6590000, N'Realme', N'image_dienthoai/realme-7-pro.jpg', 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'realme8', N'Realme 8', 6890000, N'Realme', N'image_dienthoai/realme-8.jpg', 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'realme8pro', N'Realme 8 Pro', 7890000, N'Realme', N'image_dienthoai/realme-8-pro.jpg', 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'ssga32', N'Samsung Galaxy A32', 5650000, N'Samsung', N'image_dienthoai/samsung-galaxy-a32.jpg', 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'ssga52s', N'Samsung Galaxy A52s 5G', 9550000, N'Samsung', N'image_dienthoai/samsung-galaxy-a52s.jpg', 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'ssgnote20ultra5g', N'Samsung Galaxy Note 20 Ultra 5G', 21500000, N'Samsung', N'image_dienthoai/samsung-galaxy-note-20-ultra-5g.jpg', 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'ssgs21plus5g', N'Samsung Galaxy S21 Plus 5G', 17800000, N'Samsung', N'image_dienthoai/samsung-galaxy-s21-plus.jpg', 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'ssgs21ultra5g', N'Samsung Galaxy S21 Ultra 5G', 22200000, N'Samsung', N'image_dienthoai/samsung-galaxy-s21-ultra.jpg', 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'ssgzflip35g', N'Samsung Galaxy Z Flip3 5G', 23990000, N'Samsung', N'image_dienthoai/samsung-galaxy-z-flip-3.jpg', 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'ssgzfold35g', N'Samsung Galaxy Z Fold3 5G', 40490000, N'Samsung', N'image_dienthoai/samsung-galaxy-z-fold-3.jpg', 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'vivov21', N'Vivo V21 5G', 8500000, N'Vivo', N'image_dienthoai/vivo-v21.jpg', 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'vivov23e', N'Vivo V23e', 7690000, N'Vivo', N'image_dienthoai/vivo-v23e.jpg', 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'vivox60pro', N'Vivo X60 Pro 5G', 13290000, N'Vivo', N'image_dienthoai/vivo-x60-pro.jpg', 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'vivox70pro', N'Vivo X70 Pro 5G', 16990000, N'Vivo', N'image_dienthoai/vivo-x70-pro.jpg', 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'xiaomimi11', N'Xiaomi Mi 11 5G', 15200000, N'Xiaomi', N'image_dienthoai/xiaomi-mi-11.jpg', 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'xiaomimi11t', N'Xiaomi Mi 11T', 9800000, N'Xiaomi', N'image_dienthoai/xiaomi-mi-11t.jpg', 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [Gia], [MaNSX], [Anh], [SoLuong]) VALUES (N'xiaomimi11tpro', N'Xiaomi Mi 11T Pro', 14000000, N'Xiaomi', N'image_dienthoai/xiaomi-mi-11t-pro.jpg', 100)
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [DaMua]) VALUES (5, 1, CAST(N'2021-12-16T23:13:36.490' AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [DaMua]) VALUES (6, 1, CAST(N'2021-12-16T23:41:04.360' AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [DaMua]) VALUES (9, 1, CAST(N'2021-12-19T23:53:24.087' AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [DaMua]) VALUES (11, 1, CAST(N'2021-12-20T00:42:21.933' AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [DaMua]) VALUES (12, 1, CAST(N'2021-12-20T01:34:58.007' AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [DaMua]) VALUES (13, 1, CAST(N'2021-12-20T01:58:10.350' AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [DaMua]) VALUES (14, 1, CAST(N'2021-12-20T02:00:47.437' AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [DaMua]) VALUES (15, 4, CAST(N'2021-12-20T06:59:14.137' AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [DaMua]) VALUES (16, 4, CAST(N'2021-12-20T07:06:29.923' AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [DaMua]) VALUES (18, 2, CAST(N'2021-12-20T07:20:04.853' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [SoDienThoai], [DiaChi], [Email], [TenDangNhap], [MatKhau]) VALUES (1, N'Nguyễn Văn A', N'0123652489', N'Hà Nội', N'nva@gmail.com', N'nva', N'123')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [SoDienThoai], [DiaChi], [Email], [TenDangNhap], [MatKhau]) VALUES (2, N'Nguyễn Văn B', N'0125326478', N'Hà Nội', N'nvb@gmail.com', N'nvb', N'456')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [SoDienThoai], [DiaChi], [Email], [TenDangNhap], [MatKhau]) VALUES (3, N'Nguyễn Văn C', N'0123652478', N'Huế', N'nvc@gmail.com', N'nvc', N'111')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [SoDienThoai], [DiaChi], [Email], [TenDangNhap], [MatKhau]) VALUES (4, N'Nguyễn Văn D', N'Đà Nẵng', N'0123652487', N'nvd@gmail.com', N'nvd', N'147')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX]) VALUES (N'Apple', N'Apple')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX]) VALUES (N'Nokia', N'Nokia')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX]) VALUES (N'OnePlus', N'OnePlus')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX]) VALUES (N'OPPO', N'OPPO')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX]) VALUES (N'Realme', N'Realme')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX]) VALUES (N'Samsung', N'Samsung')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX]) VALUES (N'Vivo', N'Vivo')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX]) VALUES (N'Xiaomi', N'Xiaomi')
GO
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'iphonexr', N'6.1 inches', N'	IPS LCD', N'12MP', N'7MP', N'Apple A12 Bionic', N'3 GB', N'64 GB', N'2942mAh', N'Nano-SIM', N'iOS 14', N'1792 x 828 pixel', N'Hexa-core', N'150,9 x 75,7 x 8,3 mm')
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'iphone11promax', N'6.1 inches', N'IPS LCD', N'Camera kép 12MP - Camera góc rộng: ƒ/1.8 aperture- Camera siêu rộng: ƒ/2.4 aperture', N'12 MP, ƒ/2.2 aperture', N'A13 Bionic', N'4 GB', N'64 GB', N'3110 mAh', N'Nano-SIM + eSIM', N'iOS 13 hoặc cao hơn (Tùy vào phiên bản phát hành)', N'1792 x 828 pixel', N'Hexa-core', N'150.9mm - 75.7mm - 8.3mm')
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'iphone11pro', N'5.8 inches', N'OLED', N'3 Camera 12MP - Camera tele: ƒ/2.0 aperture - Camera góc rộng: ƒ/1.8 aperture - Camera siêu rộng: ƒ/2.4 aperture', N'3 Camera 12MP - Camera tele: ƒ/2.0 aperture - Camera góc rộng: ƒ/1.8 aperture - Camera siêu rộng: ƒ/2.4 aperture', N'A13 Bionic', N'4 GB', N'64 GB', N'3046 mAh', N'Nano-SIM + eSIM', N'iOS 13 hoặc cao hơn (Tùy vào phiên bản phát hành)', N'2436 x 1125 pixels', N'6 nhân: 2 nhân Lightning 2.6Ghz & 4 nhân Thuner 1.8Ghz', N'144.0mm - 71.4mm - 8.1mm')
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'iphone11', N'6.1 inches', N'IPS LCD', N'Camera kép 12MP - Camera góc rộng: ƒ/1.8 aperture - Camera siêu rộng: ƒ/2.4 aperture', N'12 MP, ƒ/2.2 aperture', N'A13 Bionic', N'4 GB', N'64 GB', N'3110 mAh', N'Nano-SIM + eSIM', N'iOS 13 hoặc cao hơn (Tùy vào phiên bản phát hành)', N'1792 x 828 pixel', N'Hexa-core', N'150.9mm - 75.7mm - 8.3mm')
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'iphone12', N'6.1 inches', N'OLED', N'12 MP, f/1.6, 26mm (wide), 1.4µm, dual pixel PDAF, OIS  12 MP, f/2.4, 120, 13mm (ultrawide), 1/3.6', N'12 MP, f/2.2, 23mm (wide), 1/3.6"  SL 3D, (depth/biometrics sensor)', N'Apple A14 Bionic (5 nm)', N'4 GB', N'64 GB', N'Li-Ion, sạc nhanh 20W, sạc không dây 15W, USB Power Delivery 2.0', N'2 SIM (nano‑SIM và eSIM)', N'iOS 14.1 hoặc cao hơn (Tùy vào phiên bản phát hành)', N'1170 x 2532 pixels', N'Hexa-core', N'146.7 x 71.5 x 7.4 mm')
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'iphone12pro', N'6.1 inches', N'OLED', N'12 MP, f/1.6, 26mm (wide), 1.4µm, dual pixel PDAF, OIS. 12 MP, f/2.0, 52mm (telephoto), 1/3.4", 1.0µm, PDAF, OIS, 2x optical zoom. 12 MP, f/2.4, 120˚, 13mm (ultrawide), 1/3.6". TOF 3D LiDAR scanner (depth)', N'12 MP, f/2.2, 23mm (wide), 1/3.6". SL 3D, (depth/biometrics sensor)', N'Apple A14 Bionic (5 nm)', N'6 GB', N'128 GB', N'Li-Ion, sạc nhanh 20W, sạc không dây 15W, USB Power Delivery 2.0', N'2 SIM (nano‑SIM và eSIM)', N'iOS 14.1 hoặc cao hơn (Tùy vào phiên bản phát hành)', N'1170 x 2532 pixels', N'Hexa-core', N'146.7 x 71.5 x 7.4 mm')
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'iphone12promax', N'6.7 inches', N'OLED', N'Camera chính: 12 MP, f/1.6, 26mm, 1.4µm, dual pixel PDAF, OIS. Camera tele: 12 MP, f/2.0, 52mm, 1/3.4", 1.0µm, PDAF, OIS, 2x optical zoom. Camera góc siêu rộng: 12 MP, f/2.4, 120˚, 13mm, 1/3.6". Cảm biến: TOF 3D LiDAR scanner', N'12 MP, f/2.2, 23mm (wide), 1/3.6". SL 3D, (depth/biometrics sensor)', N'Apple A14 Bionic (5 nm)', N'6 GB', N'128 GB', N'Li-Ion, sạc nhanh 20W, sạc không dây 15W, USB Power Delivery 2.0', N'2 SIM (nano‑SIM và eSIM)', N'iOS 14.1 hoặc cao hơn (Tùy vào phiên bản phát hành)', N'1284 x 2778 pixels', N'Hexa-core', N'160.8 x 78.1 x 7.4 mm')
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'iphone13', N'6.1 inches', N'OLED', N'Camera góc rộng: 12MP, f/1.6. Camera góc siêu rộng: 12MP, ƒ/2.4', N'12MP, f/2.2', N'Apple A15', N'4 GB', N'128 GB', N'Khoảng 3.200mAh', N'1 Nano SIM & 1 eSIM', N'iOS 15', N'2532 x 1170 pixels', N'6 nhân (2x3.22 GHz Avalanche + 4xX.X GHz Blizzard)', N'146,7 x 71,5 x 7,65mm')
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'iphone13pro', N'6.1 inches', N'OLED', N'Camera góc rộng: 12MP, ƒ/1.5. Camera góc siêu rộng: 12MP, ƒ/1.8. Camera tele : 12MP, /2.8', N'12MP, ƒ/2.2', N'Apple A15', N'6 GB', N'128 GB', N'3,095mAh', N'2 SIM (nano‑SIM và eSIM)', N'iOS15', N'1170 x 2532 pixels', N'6 nhân (2x3.22 GHz Avalanche + 4xX.X GHz Blizzard)', N'146,7 x 71.5 x 7,65mm')
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'iphone13promax', N'6.7 inches', N'OLED', N'Camera góc rộng: 12MP, ƒ/1.5. Camera góc siêu rộng: 12MP, ƒ/1.8. Camera tele : 12MP, /2.8', N'12MP, ƒ/2.2', N'Apple A15', N'6 GB', N'128 GB', N'4,325mAh', N'2 SIM (nano‑SIM và eSIM)', N'iOS15', N'2778 x 1284 pixel', N'6 nhân (2x3.22 GHz Avalanche + 4xX.X GHz Blizzard)', N'146,7 x 71.5 x 7,65mm')
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'nokiac30', N'6.82 inches', N'IPS LCD', N'13MP AF + 2MP FF Cảm biến độ sâu', N'5 MP', N'SC9863A 8 nhân 1.6GHz', N'3 GB', N'32 GB', N'6000 mAh', N'2 SIM (Nano-SIM)', N'Android 11 (phiên bản Go)', N'720 x 1600 pixel', NULL, N'177.7 x 79.1 x 9.9mm')
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'ssgnote20ultra5g', N'6.9 inches', N'Dynamic AMOLED', N'108 MP, f/1.8, 26mm (wide), 1/1.33", 0.8µm, PDAF, Laser AF, OIS. 12 MP, f/3.0, 103mm (periscope telephoto), 1.0µm, PDAF, OIS, 5x optical zoom, 50x hybrid zoom. 12 MP, f/2.2, 13mm (ultrawide), 1/2.55", 1.4µm', N'10 MP, f/2.2, 26mm (wide), 1/3.2", 1.22µm, Dual Pixel PDAF', N'Exynos 990 (7 nm+)', N'12 GB', N'256 GB', N'Non-removable Li-Ion 4500 mAh battery<br /> Fast charging 25W<br /> USB Power Delivery 3.0<br /> Fast Qi/PMA wireless charging<br /> Reverse wireless charging 9W', N'2 SIM (Nano-SIM)', N'Android 10, One UI 2.1', N'1440 x 3088 pixels (QHD+)', N'Octa-core (2x2.73 GHz Mongoose M5 & 2x2.50 GHz Cortex-A76 & 4x2.0 GHz Cortex-A55)', N'164.8 x 77.2 x 8.1 mm')
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'ssgzflip35g', N'6.7 inches', N'Super AMOLED', N'Camera góc siêu rộng: 12MP, f/2.2, Dual Pixel AF, OIS. Camera góc rộng: 12MP, f/1.8', N'Góc rộng 10MP, f/2.4', N'Snapdragon 888 8 (5nm)', N'8 GB', N'128 GB', N'3300 mAh', N'2 SIM (nano‑SIM và eSIM)', N'Android 11', N'Màn hình chính: 6.7" 2640 x 1080 425ppi , FHD+ Dynamic AMOLED 2X Display (22:9), 120Hz <br> Màn hình phụ: 1.9" Super AMOLED, 260 x 512 302ppi', N'1 nhân 2.84 GHz, 3 nhân 2.42 GHz & 4 nhân 1.8 GHz', N'Khi gập: 72.2 x 86.4 x 17.1mm <br> Khi mở: 72.2 x 166.0 x 6.9mm')
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'ssgs21ultra5g', N'6.8 inches', N'Dynamic AMOLED', N'Ống kính chính góc rộng: 108MP, f/1.8. Ống kính zoom tiềm vọng: 10MP, zoom quang 10x. Cảm biến tele: 10MP, zoom quang 3x. Cảm biến siêu rộng: 12MP, f/2.2. Cảm biến Laser AF', N'40 MP, f/2.2', N'Exynos 2100 8 nhân', N'12 GB', N'128 GB', N'Dung lượng pin 5,000mAh', N'2 SIM (Nano-SIM)', N'Android 11, One UI 3.0', N'1440 x 3200 pixels (QHD+)', N'8 nhân: 1 nhân Cortex-X1 tốc độ 2.9GHz, 3 nhân Cortex-A78 tốc độ 2.8GHz, 4 nhân Cortex-A55 tốc độ 2.2GHz', N'166.9 x 76 x 8.8 mm (6.57 x 2.99 x 0.35 in)')
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'ssgzfold35g', N'7.6 inches', N'Dynamic AMOLED', N'Camera góc rộng: 12 MP, f/1.8, 26mm, Dual Pixel PDAF, OIS. Camera tele: 12 MP, f/2.4, 52mm, PDAF, OIS, 2x Zoom quang học. Camera góc siêu rộng: 12 MP, f/2.2. Camera màn hình phụ: 10MP, f/2.2', N'Camera ẩn dưới màn hình: 4MP, f/1.8', N'Snapdragon 888 5G (5 nm)', N'12 GB', N'256 GB', N'Li-Po 4400 mAh', N'2 SIM (nano‑SIM và eSIM)', N'Android 11', N'Màn hình chính: 7.9" 2208x1768, 374ppi, HDR10+, 120Hz <br> Màn hình phụ: 6.23" 2268x832, HD+ Dynamic AMOLED 2X (24.5:9) Infinity-O Display, 38ppi, 120Hz', N'1 nhân 2.84 GHz, 3 nhân 2.42 GHz & 4 nhân 1.8 GHz', N'Khi gập:158.2 x 67.1 x 16mm <br> Khi mở:158.2 x 128.1 x 6.4mm')
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'ssgs21plus5g', N'6.7 inches', N'Dynamic AMOLED', N'- Cảm biến chính (góc rộng) 12 MP, f/1.8, chống rung quang học OIS. - Cảm biến tele 64 MP, f/2.0, zoom quang 1.1x, zoom lai 3x. - Cảm biến góc cực rộng 12 MP, f/2.2', N'10 MP, f/2.2, hỗ trợ lấy nét theo pha kép Dual Pixel PDAF', N'Exynos 2100 8 nhân', N'8 GB', N'125 GB', N'- Li-Po 4,800 mAh <br> - Sạc nhanh có dây 25W, tương thích chuẩn PD 3.0 <br> - Sạc nhanh không dây 15W <br> - Sạc ngược không dây 4.5W', N'2 SIM (Nano-SIM)', N'Android 11, One UI 3.0', N'1080 x 2400 pixels (FullHD+)', N'8 nhân: 1 nhân Cortex-X1 tốc độ 2.9GHz, 3 nhân Cortex-A78 tốc độ 2.8GHz, 4 nhân Cortex-A55 tốc độ 2.2GHz161.5 x 75.6 x 7.8 mm', N'161.5 x 75.6 x 7.8 mm')
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'ssga52s', N'6.5 inches', N'Super AMOLED', N'Camera chính: 64 MP (f/1.8) OIS. Camera góc siêu rộng: 12MP (f2.2). Camera Macro chụp cận cảnh: 5MP (f/2.2). Camera xóa phông: 5MP (f/2.4)', N'32 MP (f2.2)', N'Snapdragon 778G 5G 8 nhân', N'8 GB', N'128 GB', N'4500 mAh', N'2 SIM (Nano-SIM)', N'Android 11, One UI 3.1', N'1080 x 2400 pixels (FullHD+)', N'1 nhân 2.4 GHz, 3 nhân 2.2 GHz & 4 nhân 1.9 GHz', N'159.9 x 75.1 x 8.4 mm')
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'ssga32', N'6.4 inches', N'Super AMOLED', N'Camera góc rộng: 64 MP, f/1.8, 26mm, PDAF. Camera góc siêu rộng: 8 MP, f/2.2, 123˚, 1/4.0", 1.12µm. Camera macro: 5 MP, f/2.4. Cảm biến chiều sâu:5 MP, f/2.4', N'20 MP, f/2.2', N'Mediatek Helio G80 (12 nm)', N'6 GB', N'128 GB', N'Li-Ion 5000 mAh', N'2 SIM (Nano-SIM)', N'Android 11, One UI 3.0', N'1080 x 2400 pixels (FullHD+)', N'8 nhân ( 2x2.0 GHz Cortex-A75 & 6x1.8 GHz Cortex-A55 )', N'158.9 x 73.6 x 8.4 mm')
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'xiaomimi11', N'6.81 inches', N'AMOLED', N'Camera góc rộng: 108 MP, f/1.9, 26mm 1/1.33", 0.8µm, PDAF, OIS. Camera góc siêu rộng: 13 MP, f/2.4, 123˚ 1/3.06", 1.12µm. Camera cận cảnh: 5 MP, f/2.4, 1/5.0", 1.12µm', N'20 MP, 27mm (wide), 1/3.4", 0.8µm', N'Qualcomm SM8350 Snapdragon 888 (5 nm)', N'8 GB', N'256 GB', N'Li-Po 4600 mAh', N'2 SIM (Nano-SIM)', N'Android 11, MIUI 12.5', N'1440 x 3200 pixels (QHD+)', N'Octa-core (1x2.84 GHz Kryo 680 & 3x2.42 GHz Kryo 680 & 4x1.80 GHz Kryo 680', N'164.3 x 74.6 x 8.1 mm')
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'xiaomimi11tpro', N'6.67 inches', N'AMOLED', N'Camera góc rộng: 108 MP, f/1.75. Camera góc siêu rộng: 8 MP, 2.2. Camera cận cảnh: 5 MP, f/2.4 AF (3cm-7cm)', N'16 MP, f/2.45', N'Qualcomm Snapdragon 888 5nm', N'12 GB', N'256 GB', N'5000mAh', N'2 SIM (Nano-SIM)', N'Android 11, MIUI 12.5', N'1080 x 2400 pixels (FullHD+)', N'Kryo 680 CPU, up to 2.84GHz', N'164.3 x 74.6 x 8.8 mm')
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'xiaomimi11t', N'6.67 inches', N'AMOLED', N'Camera góc rộng: 108MP, f/1.75. Camera góc siêu rộng: 8MP ultra-wide, 120° FOV f/2.2. Camera cận cảnh: 5 MP, f/2.4 AF (3cm-7cm)', N'16MP, f/2.45', N'MediaTek Dimensity 1200-Ultra', N'8 GB', N'128 GB', N'5000 mAh', N'2 SIM (Nano-SIM)', N'Android 11, MIUI 12.5', N'1080 x 2400 pixels (FullHD+)', N'8 nhân (1x2.84 GHz Kryo 585 & 3x2.42 GHz Kryo 585 & 4x1.80 GHz Kryo 585)', N'164.1 x 76.9 x 8.8 mm')
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'oppofindx3pro', N'6.7 inches', N'AMOLED', N'Camera chính: 50 MP, f/1.8, 1/1.56", 1.0µm, PDAF, OIS. Camera tele: 13 MP, f/2.4, 52mm PDAF, zoom quang 5x. Camera góc rộng: 50 MP, f/2.2, 110˚, 1/1.56", 1.0µm, omnidirectional PDAF. Camera macro: 3 MP, f/3.0', N'32 MP, f/2.4, 26mm (wide), 1/2.8", 0.8µm', N'Snapdragon 888 (5 nm)', N'12 GB', N'256 GB', N'4500mAh', N'2 SIM (Nano-SIM)', N'ColorOS 11.2, nền tảng Android 11', N'1440 x 3216 pixels (QHD+)', N'8 nhân (1x2.84 GHz Kryo 680 & 3x2.42 GHz Kryo 680 & 4x1.80 GHz Kryo 680)', N'163.6 x 74 x 8.3 mm')
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'opporeno6', N'6.43 inches', N'AMOLED', N'Camera góc rộng: 64 MP, f/1.7, PDAF. Camera góc siêu rộng: 8 MP, f/2.2. Camera macro: 2 MP, f/2.4', N'32 MP, f/2.4', N'MT6877 Dimensity 900 5G (6 nm)', N'8 GB', N'128 GB', N'Li-P0 4300 mAh', N'2 SIM (Nano-SIM)', N'Android 11, ColorOS 11.3', N'1080 x 2400 pixels (FullHD+)', N'2x2.4 GHz Cortex-A78 & 6x2.0 GHz Cortex-A55', N'156.8 x 72.1 x 7.59 mm')
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'opporeno5', N'6.43 inches', N'AMOLED', N'64 MP + 8 MP + 2 MP + 2 MP', N'32 MP, F/2.4', N'Qualcomm SM7250 Snapdragon 765G (7 nm)', N'8 GB', N'128 GB', N'4300mAh (Typ), Sạc siêu nhanh', N'2 SIM (Nano-SIM)', N'ColorOS 11.1, Nền tảng Android 11', N'1080 x 2400 pixels (FullHD+)', N'8 nhân: 1x2.4 GHz Kryo 475 Prime & 1x2.2 GHz Kryo 475 Gold & 6x1.8 GHz Kryo 475 Silver', N'159.1 x 73.3 x 7.7 mm')
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'opporeno4pro', N'6.5 inches', N'Super AMOLED', N'48 MP (IMX586) + 8 MP + 2 MP + 2 MP, 4 camera', N'32 MP (IMX616),F/2.4', N'Qualcomm SM7125 Snapdragon 720G (8 nm)', N'8 GB', N'256 GB', N'Li-Po 4000 mAh battery, Fast charging 30W, 60% in 15 min, 100% in 36 min (advertised), SuperVOOC 2.0', N'2 SIM (Nano-SIM)', N'ColorOS 7.2, nền tảng Android 10', N'1080 x 2400 pixels (FullHD+)', N'Octa-core (2x2.3 GHz Kryo 465 Gold & 6x1.8 GHz Kryo 465 Silver)', N'160.2 x 73.2 x 7.7 mm')
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'nokiag50', N'6.82 inches', N'IPS LCD', N'Camera góc rộng: 48 MP, PDAF. Camera góc siêu rộng: 5 MP. Camera cận cảnh: 2 MP. Camera cảm biến độ sâu: 2 MP', N'16 MP', N'Snapdragon 480 8 nhân 5G', N'6 GB', N'128 GB', N'5000 mAh', N'2 SIM (Nano-SIM)', N'Android 11 (64bit)| 2 năm cập nhật bảo mật hàng tháng', N'720 x 1560 pixes', N'2 nhân 2.0 GHz & 6 nhân 1.8 GHz', N'173.83 x 77.68 x 8.85mm')
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'nokiac20', N'6.52 inches', N'IPS LCD', N'5 MP', N'5 MP', N'Unisoc SC9863A', N'2 GB', N'32 GB', N'Li-Ion 2950mAh', N'2 SIM (Nano-SIM)', N'Android 11 (64bit)| 2 năm cập nhật bảo mật hàng tháng', N'720 x 1600 pixel', N'8 nhân (4x1.6 GHz Cortex-A55 & 4x1.2 GHz Cortex-A55)', N'169.9 x 77.9 x 8.8 mm')
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'nokiag10', N'6.5 inches', N'IPS LCD', N'Camera chính: 13 MP. Camera cảm biến độ sâu: 2 MP. Camera macro: 2 MP', N'8 MP', N'Mediatek G25 8x A53 2.0GHz', N'4 GB', N'64 GB', N'5050 mAh', N'Nano-SIM', N'2 năm nâng cấp hệ điều hành', N'164.9 x 76.0 x 9.2mm', NULL, N'164.9 x 76.0 x 9.2mm')
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'oneplus8t', N'6.55 inches', N'AMOLED', N'Chính 48 MP & Phụ 16 MP, 5 MP, 2 MP', N'16 MP', N'Snapdragon 865', N'12 GB', N'256 GB', N'4500 mAh', N'2 SIM (Nano-SIM)', N'Android 11', N'1080 x 2400 pixels (FullHD+)', N'1 nhân 2.84 GHz, 3 nhân 2.42 GHz & 4 nhân 1.8 GHz', N'160.7 x 74.1 x 8.4 mm')
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'oneplusnordce', N'6.43 inches', N'AMOLED', N'Camera chính: 64 MP, f/1.79. Camera góc rộng: 8 MP, f/2.25. Camera đơn sắc: 2 MP, f/2.4', N'16 MP f/2.45', N'Qualcomm Snapdragon 750G, tối đa 2.2GHz', N'8 GB', N'128 GB', N'Li-Po 4500 mAh', N'2 SIM (Nano-SIM)', N'Android 11, OxygenOS 11', N'1080 x 2400 pixels (FullHD+)', N'2x2.2 GHz Kryo 570 & 6x1.8 GHz Kryo 570', N'159.2 x 73.5 x 7.9 mm')
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'oneplusnordn10', N'6.49 inches', N'IPS LCD', N'Camera chính: 64 MP, f/1.80 Camera góc siêu rộng: 8 MP, f/2.3. Cảm biến độ sâu: 2 MP, f/2.4. Camera cận cảnh: 2 MP, f/2.4', N'16 MP, f/2.1', N'Snapdragon 690 5G (8 nm)', N'6 GB', N'128 GB', N'Li-Po 4300 mAh', N'2 SIM (Nano-SIM)', N'Android 10, OxygenOS 10.5', N'1080 x 2400 pixels (FullHD+)', N'2 nhân 2.0 GHz & 6 nhân 1.7 GHz', N'163 x 74.7 x 9 mm')
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'realme6', N'6.5 inches', NULL, N'Chính 64 MP & Phụ 8 MP, 2 MP, 2 MP', N'16 MP', N'Mediatek Helio G90T', N'4 GB', N'128 GB', N'4300 mAh, Sạc nhanh VOOC 4.0(30W)', N'2 SIM (Nano-SIM)', N'Android v10 (Q)', N'1080 x 2400 pixels (FullHD+)', N'2.05 GHz', N'162.1 x 74.8 x 8.9 mm')
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'realme7', N'6.5 inches', N'IPS LCD', N'Camera chính: 64MP + f/1.8 Sony IMX682. Camera góc rộng: 8MP + f/2.3. Camera siêu cận: 2MP + f/2.4. Camera chân dung: 2MP + f/2.4', N'16MP 16MP + f/2.0 Sony IMX 471', N'MediaTek Helio G95 Cortex-A76', N'8 GB', N'128 GB', N'5000 mAh, sạc nhanh 30W', N'2 SIM (Nano-SIM)', N'realme UI 1.0 - Android 10', N'1080 x 2400 pixels (FullHD+)', N'8 nhân, xung nhịp lên đến 2.05GHz', N'162.2 x 75.1 x 9.1 mm')
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'realme7pro', N'6.44 inches', N'Super AMOLED', N'Camera chính: 64MP + f/1.8 Sony IMX682. Camera góc rộng: 8MP + f/2.3. Camera siêu cận: 2MP + f/2.4. Camera chân dung: 2MP + f/2.4', N'Sony 32MP + f/2.5', N'Qualcomm® Snapdragon™ 720G', N'8 GB', N'128 GB', N'4500 mAh, SuperDart Hỗ trợ sạc 65W', N'2 SIM (Nano-SIM)', N'realme UI 1.0 - Android 10', N'1080 x 2400 pixels (FullHD+)', N'A76 2.3GHz ×2 A55 1.8GHz ×6', N'160.9 x 74.3 x 8.7mm')
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'realme8', N'6.4 inches', N'Super AMOLED', N'Camera chính: 64 MP, f/1.8, 26mm, 1/1.73", 0.8µm, PDAF. Camera góc siêu rộng: 8 MP, f/2.3, 119˚, 16mm, 1/4.0", 1.12µm. Camera xóa phông: 2 MP, f/2.4. Camera xóa phông: 2 MP, f/2.4', N'16 MP, f/2.5, 1/3.0", 1.0µm', N'Mediatek Helio G95 (12 nm)', N'8 GB', N'128 GB', N'Li-Po 5000 mAh', N'2 SIM (Nano-SIM)', N'Android 11, Realme UI 2.0', N'1080 x 2400 pixels (FullHD+)', N'8 nhân (2x2.05 GHz Cortex-A76 & 6x2.0 GHz Cortex-A55)', N'160.6 x 73.9 x 8 mm')
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'realme8pro', N'6.4 inches', N'Super AMOLED', N'Camera chính: 108 MP, f/1.9, 26mm, 1/1.52", 0.7µm, PDAF. Camera góc siêu rộng: 8 MP, f/2.3, 119˚, 16mm , 1/4.0", 1.12µm. Camera cận cảnh: 2 MP, f/2.4. Camera xóa phông: 2 MP, f/2.4', N'16 MP, f/2.5, 1/3.0", 1.0µm', N'Snapdragon 720G (8 nm)', N'8 GB', N'128 GB', N'Li-Po 4500 mAh', N'2 SIM (Nano-SIM)', N'Android 11, Realme UI 2.0', N'1080 x 2400 pixels (FullHD+)', N'8 nhân (2x2.3 GHz Kryo 465 Gold & 6x1.8 GHz Kryo 465 Silver)', N'160.6 x 73.9 x 8.1 mm')
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'vivox70pro', N'6.56 inches', N'AMOLED', N'50 MP + 12 MP + 12 MP + 8 MP', N'32MP', N'Dimensity 1200', N'12 GB', N'256 GB', N'4450 mAh', N'2 SIM (Nano-SIM)', N'Android 11, Funtouch OS 12 (phiên bản quốc tế)', N'1080 x 2376 pixels (FullHD+)', N'1x2.8 GHz Cortex-A78 & 3x2.6 GHz Cortex-A78 & 4x2.0 GHz Cortex-A55', N'158.3 × 73.2 x 8 mm')
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'vivox60pro', N'6.56 inches', N'AMOLED', N'48MP (Gimbal 2.0) + 13MP + 13MP', N'32 MP, f/2.5, 26mm (wide), 1/2.8", 0.8µm', N'Snapdragon 870 5G (7 nm)', N'12 GB + 3 GB (RAM bổ sung)', N'256 GB', N'4200 mAh', N'2 SIM (Nano-SIM)', N'Android 11', N'1080 x 2400 pixels (FullHD+)', N'8 nhân (1x3.2 GHz Kryo 585 & 3x2.42 GHz Kryo 585 & 4x1.80 GHz Kryo 585)', N'158.6 x 73.2 x 7.6 mm')
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'vivov21', N'6.44 inches', N'AMOLED', N'Camera chính: 64 MP, f/1.8. Camera góc siêu rộng: 8 MP, f/2.2. Camera cận cạnh: 2 MP, f/2.4', N'44 MP, f/2.0', N'Dimensity 800U 5G (7 nm)', N'8 GB', N'128 GB', N'Li-Po 4000 mAh', N'2 SIM (Nano-SIM)', N'Android 11, Funtouch 11.1', N'1080 x 2400 pixels (FullHD+)', N'Octa-core (2x2.4 GHz Cortex-A76 & 6x2.0 GHz Cortex-A55)', N'159.7 x 73.9 x 7.3 mm')
INSERT [dbo].[ThongSoKyThuat] ([MaDienThoai], [KichThuocManHinh], [CongNgheManHinh], [CameraSau], [CameraTruoc], [Chipset], [DungLuongRAM], [BoNhoTrong], [Pin], [TheSim], [HeDieuHanh], [DoPhanGiaiManHinh], [LoaiCPU], [KichThuoc]) VALUES (N'vivov23e', N'6.44 inches', N'AMOLED', N'Camera chính: 64MP AF. Camera góc siêu rộng: 8MP, f/2.2. Camera siêu cận: 2MP, f/2.4', N'50MP AF, f/2.0', N'MediaTek Helio G96', N'8 GB', N'128 GB', N'4050mAh', N'2 SIM (Nano-SIM)', N'Android 11', N'1080 x 2400 pixels (FullHD+)', NULL, N'160.87*74.28*7.36 - 7.41mm')
GO
ALTER TABLE [dbo].[ChiTietHoaDon] ADD  CONSTRAINT [DF_ChiTietHoaDon_DaMua]  DEFAULT ((0)) FOR [DaMua]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_HoaDon_NgayBan]  DEFAULT (getdate()) FOR [NgayMua]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_HoaDon_DaMua]  DEFAULT ((0)) FOR [DaMua]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_DienThoai] FOREIGN KEY([MaDienThoai])
REFERENCES [dbo].[DienThoai] ([MaDienThoai])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_DienThoai]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HoaDon1] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_HoaDon1]
GO
ALTER TABLE [dbo].[DienThoai]  WITH CHECK ADD  CONSTRAINT [FK_DienThoai_NhaSanXuat] FOREIGN KEY([MaNSX])
REFERENCES [dbo].[NhaSanXuat] ([MaNSX])
GO
ALTER TABLE [dbo].[DienThoai] CHECK CONSTRAINT [FK_DienThoai_NhaSanXuat]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang1] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang1]
GO
ALTER TABLE [dbo].[ThongSoKyThuat]  WITH CHECK ADD  CONSTRAINT [FK_ThongSoKyThuat_DienThoai] FOREIGN KEY([MaDienThoai])
REFERENCES [dbo].[DienThoai] ([MaDienThoai])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ThongSoKyThuat] CHECK CONSTRAINT [FK_ThongSoKyThuat_DienThoai]
GO
