USE [master]
GO
/****** Object:  Database [BANHANG]    Script Date: 11/25/2018 8:49:21 PM ******/
CREATE DATABASE [BANHANG] 
GO
USE [BANHANG]
GO
/****** Object:  Table [dbo].[CT_GIOHANG]    Script Date: 11/25/2018 8:49:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_GIOHANG](
	[ID_CTGH] [bigint] NOT NULL,
	[IDGH] [bigint] NOT NULL,
	[IDSP] [bigint] NOT NULL,
	[SOLUONGBAN] [int] NOT NULL,
 CONSTRAINT [PK_CT_GIOHANG] PRIMARY KEY CLUSTERED 
(
	[ID_CTGH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GIAODICH]    Script Date: 11/25/2018 8:49:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GIAODICH](
	[IDGIAODICH] [bigint] NOT NULL,
	[IDGIOHANG] [bigint] NOT NULL,
	[NGAYTHANHTOAN] [datetime] NOT NULL,
	[SOTIEN] [bigint] NULL,
	[TRANGTHAITT] [bit] NOT NULL,
	[SOTHE] [ntext] NOT NULL,
 CONSTRAINT [PK_GIAODICH] PRIMARY KEY CLUSTERED 
(
	[IDGIAODICH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GIOHANG]    Script Date: 11/25/2018 8:49:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GIOHANG](
	[IDGIOHANG] [bigint] NOT NULL,
	[MAKH] [bigint] NOT NULL,
	[NGAYMUA] [datetime] NOT NULL,
	[TTTHANHTOAN] [bit] NOT NULL,
	[HINHTHUCTT] [nvarchar](150) NULL,
	[TONGTIENGH] [bigint] NOT NULL,
	[TONGTHANHTOAN] [bigint] NULL,
 CONSTRAINT [PK_GIOHANG] PRIMARY KEY CLUSTERED 
(
	[IDGIOHANG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 11/25/2018 8:49:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[IDKH] [bigint] NOT NULL,
	[TENKH] [nvarchar](250) NOT NULL,
	[MATKHAU] [nvarchar](250) NOT NULL,
	[DIACHIKH] [ntext] NOT NULL,
	[SDT] [nchar](12) NOT NULL,
	[EMAIL] [ntext] NOT NULL,
 CONSTRAINT [PK_KHACHHANG] PRIMARY KEY CLUSTERED 
(
	[IDKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 11/25/2018 8:49:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SANPHAM](
	[IDSP] [bigint] NOT NULL,
	[TenSP] [ntext] NOT NULL,
	[MoTaSP] [ntext] NULL,
	[DVT] [nvarchar](150) NOT NULL,
	[SoLuongSP] [int] NOT NULL,
	[GiaBan] [money] NOT NULL,
 CONSTRAINT [PK_SANPHAM] PRIMARY KEY CLUSTERED 
(
	[IDSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[CT_GIOHANG] ([ID_CTGH], [IDGH], [IDSP], [SOLUONGBAN]) VALUES (1, 1, 3, 2)
INSERT [dbo].[CT_GIOHANG] ([ID_CTGH], [IDGH], [IDSP], [SOLUONGBAN]) VALUES (2, 1, 5, 1)
INSERT [dbo].[CT_GIOHANG] ([ID_CTGH], [IDGH], [IDSP], [SOLUONGBAN]) VALUES (3, 2, 33, 1)
INSERT [dbo].[CT_GIOHANG] ([ID_CTGH], [IDGH], [IDSP], [SOLUONGBAN]) VALUES (4, 4, 6, 1)
INSERT [dbo].[CT_GIOHANG] ([ID_CTGH], [IDGH], [IDSP], [SOLUONGBAN]) VALUES (5, 3, 42, 1)
INSERT [dbo].[CT_GIOHANG] ([ID_CTGH], [IDGH], [IDSP], [SOLUONGBAN]) VALUES (6, 5, 11, 1)
INSERT [dbo].[CT_GIOHANG] ([ID_CTGH], [IDGH], [IDSP], [SOLUONGBAN]) VALUES (7, 6, 15, 1)
INSERT [dbo].[CT_GIOHANG] ([ID_CTGH], [IDGH], [IDSP], [SOLUONGBAN]) VALUES (8, 7, 8, 1)
INSERT [dbo].[CT_GIOHANG] ([ID_CTGH], [IDGH], [IDSP], [SOLUONGBAN]) VALUES (9, 5, 22, 1)
INSERT [dbo].[GIAODICH] ([IDGIAODICH], [IDGIOHANG], [NGAYTHANHTOAN], [SOTIEN], [TRANGTHAITT], [SOTHE]) VALUES (1, 1, CAST(N'2017-03-16 23:56:30.450' AS DateTime), 900, 1, N'30254015154658')
INSERT [dbo].[GIOHANG] ([IDGIOHANG], [MAKH], [NGAYMUA], [TTTHANHTOAN], [HINHTHUCTT], [TONGTIENGH], [TONGTHANHTOAN]) VALUES (1, 3, CAST(N'2017-03-16 23:56:30.450' AS DateTime), 1, N'Online', 900, 900)
INSERT [dbo].[GIOHANG] ([IDGIOHANG], [MAKH], [NGAYMUA], [TTTHANHTOAN], [HINHTHUCTT], [TONGTIENGH], [TONGTHANHTOAN]) VALUES (2, 2, CAST(N'2017-03-16 23:56:30.450' AS DateTime), 0, N'Offline', 200, 220)
INSERT [dbo].[GIOHANG] ([IDGIOHANG], [MAKH], [NGAYMUA], [TTTHANHTOAN], [HINHTHUCTT], [TONGTIENGH], [TONGTHANHTOAN]) VALUES (3, 5, CAST(N'2017-03-16 23:56:30.450' AS DateTime), 0, N'Online', 400, 420)
INSERT [dbo].[GIOHANG] ([IDGIOHANG], [MAKH], [NGAYMUA], [TTTHANHTOAN], [HINHTHUCTT], [TONGTIENGH], [TONGTHANHTOAN]) VALUES (4, 12, CAST(N'2017-03-16 23:56:30.450' AS DateTime), 0, N'Online', 380, 400)
INSERT [dbo].[GIOHANG] ([IDGIOHANG], [MAKH], [NGAYMUA], [TTTHANHTOAN], [HINHTHUCTT], [TONGTIENGH], [TONGTHANHTOAN]) VALUES (5, 1, CAST(N'2017-03-16 23:56:30.450' AS DateTime), 0, N'Online', 230, 230)
INSERT [dbo].[GIOHANG] ([IDGIOHANG], [MAKH], [NGAYMUA], [TTTHANHTOAN], [HINHTHUCTT], [TONGTIENGH], [TONGTHANHTOAN]) VALUES (6, 8, CAST(N'2017-03-16 23:56:30.450' AS DateTime), 0, N'Online', 160, 175)
INSERT [dbo].[GIOHANG] ([IDGIOHANG], [MAKH], [NGAYMUA], [TTTHANHTOAN], [HINHTHUCTT], [TONGTIENGH], [TONGTHANHTOAN]) VALUES (7, 9, CAST(N'2017-03-16 23:56:30.450' AS DateTime), 0, N'Online', 550, 580)
INSERT [dbo].[GIOHANG] ([IDGIOHANG], [MAKH], [NGAYMUA], [TTTHANHTOAN], [HINHTHUCTT], [TONGTIENGH], [TONGTHANHTOAN]) VALUES (8, 15, CAST(N'2017-03-16 23:56:30.450' AS DateTime), 0, N'Online', 480, 500)
INSERT [dbo].[GIOHANG] ([IDGIOHANG], [MAKH], [NGAYMUA], [TTTHANHTOAN], [HINHTHUCTT], [TONGTIENGH], [TONGTHANHTOAN]) VALUES (9, 18, CAST(N'2017-03-16 23:56:30.450' AS DateTime), 0, N'Online', 690, 690)
INSERT [dbo].[KHACHHANG] ([IDKH], [TENKH], [MATKHAU], [DIACHIKH], [SDT], [EMAIL]) VALUES (1, N'Griffy Tunnah', N'Xsmn5j1TxoKt', N'16 Holmberg Park', N'421-720-6286', N'gtunnah0@elegantthemes.com')
INSERT [dbo].[KHACHHANG] ([IDKH], [TENKH], [MATKHAU], [DIACHIKH], [SDT], [EMAIL]) VALUES (2, N'Silvain Chadney', N'Vhu8ajvKB2Y', N'2 1st Court', N'874-612-9328', N'schadney1@senate.gov')
INSERT [dbo].[KHACHHANG] ([IDKH], [TENKH], [MATKHAU], [DIACHIKH], [SDT], [EMAIL]) VALUES (3, N'Nappie Cosely', N'zPNi93MAfJ4', N'60 Dayton Street', N'265-275-3413', N'ncosely2@fda.gov')
INSERT [dbo].[KHACHHANG] ([IDKH], [TENKH], [MATKHAU], [DIACHIKH], [SDT], [EMAIL]) VALUES (4, N'Smith Knappett', N'ERa0YH', N'3 Carpenter Park', N'487-112-9107', N'sknappett3@fotki.com')
INSERT [dbo].[KHACHHANG] ([IDKH], [TENKH], [MATKHAU], [DIACHIKH], [SDT], [EMAIL]) VALUES (5, N'Rhys Lauderdale', N'a6ZtRZi55yB', N'6701 Artisan Terrace', N'250-900-9249', N'rlauderdale4@amazon.de')
INSERT [dbo].[KHACHHANG] ([IDKH], [TENKH], [MATKHAU], [DIACHIKH], [SDT], [EMAIL]) VALUES (6, N'Dasi Nugent', N'GhC5NhnfjDH', N'11 Eliot Drive', N'719-725-7279', N'dnugent5@ocn.ne.jp')
INSERT [dbo].[KHACHHANG] ([IDKH], [TENKH], [MATKHAU], [DIACHIKH], [SDT], [EMAIL]) VALUES (7, N'Charles Fanshawe', N'97fFJnAu2W', N'233 Schlimgen Hill', N'642-425-9992', N'cfanshawe6@woothemes.com')
INSERT [dbo].[KHACHHANG] ([IDKH], [TENKH], [MATKHAU], [DIACHIKH], [SDT], [EMAIL]) VALUES (8, N'Aurelie Domb', N'Ihb78RReo0Y', N'1 Birchwood Plaza', N'174-384-0394', N'adomb7@java.com')
INSERT [dbo].[KHACHHANG] ([IDKH], [TENKH], [MATKHAU], [DIACHIKH], [SDT], [EMAIL]) VALUES (9, N'Danny Fayerman', N'rjyIvQWfg', N'1472 North Drive', N'487-928-7360', N'dfayerman8@blogtalkradio.com')
INSERT [dbo].[KHACHHANG] ([IDKH], [TENKH], [MATKHAU], [DIACHIKH], [SDT], [EMAIL]) VALUES (10, N'Jermaine Jindra', N'tHW4WQ', N'87573 Ruskin Place', N'180-491-5709', N'jjindra9@dmoz.org')
INSERT [dbo].[KHACHHANG] ([IDKH], [TENKH], [MATKHAU], [DIACHIKH], [SDT], [EMAIL]) VALUES (11, N'Arda Linnane', N'GBzeRXur2D', N'2701 Hoffman Circle', N'122-806-1320', N'alinnanea@wired.com')
INSERT [dbo].[KHACHHANG] ([IDKH], [TENKH], [MATKHAU], [DIACHIKH], [SDT], [EMAIL]) VALUES (12, N'Ange McInnerny', N'D8iVYs', N'2 Main Court', N'795-984-1257', N'amcinnernyb@nih.gov')
INSERT [dbo].[KHACHHANG] ([IDKH], [TENKH], [MATKHAU], [DIACHIKH], [SDT], [EMAIL]) VALUES (13, N'Onofredo Andersen', N'8nhMLz', N'9186 Glacier Hill Court', N'104-771-3952', N'oandersenc@ca.gov')
INSERT [dbo].[KHACHHANG] ([IDKH], [TENKH], [MATKHAU], [DIACHIKH], [SDT], [EMAIL]) VALUES (14, N'Amelia Rubinshtein', N'FDQ40C', N'012 Southridge Junction', N'989-447-5276', N'arubinshteind@nyu.edu')
INSERT [dbo].[KHACHHANG] ([IDKH], [TENKH], [MATKHAU], [DIACHIKH], [SDT], [EMAIL]) VALUES (15, N'Sammy Dran', N'l3GGeHf', N'194 Longview Center', N'253-775-5365', N'sdrane@ycombinator.com')
INSERT [dbo].[KHACHHANG] ([IDKH], [TENKH], [MATKHAU], [DIACHIKH], [SDT], [EMAIL]) VALUES (16, N'Debi Silcocks', N'TBmI4lP', N'007 Express Pass', N'970-513-4917', N'dsilcocksf@stanford.edu')
INSERT [dbo].[KHACHHANG] ([IDKH], [TENKH], [MATKHAU], [DIACHIKH], [SDT], [EMAIL]) VALUES (17, N'Morgan Dearell', N'2NeOCc03h', N'8 Ruskin Road', N'742-349-7047', N'mdearellg@jigsy.com')
INSERT [dbo].[KHACHHANG] ([IDKH], [TENKH], [MATKHAU], [DIACHIKH], [SDT], [EMAIL]) VALUES (18, N'Eugenia Colerick', N'u08YhKFD', N'2 Badeau Pass', N'104-959-6176', N'ecolerickh@latimes.com')
INSERT [dbo].[KHACHHANG] ([IDKH], [TENKH], [MATKHAU], [DIACHIKH], [SDT], [EMAIL]) VALUES (19, N'Roy Maciocia', N's8NnsOI', N'152 Petterle Lane', N'960-704-9127', N'rmaciociai@kickstarter.com')
INSERT [dbo].[KHACHHANG] ([IDKH], [TENKH], [MATKHAU], [DIACHIKH], [SDT], [EMAIL]) VALUES (20, N'Rori Metham', N'beNAhVtfpOw', N'541 Pond Center', N'350-583-1621', N'rmethamj@linkedin.com')
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (1, N'Nokia 6.1 Plus', N'Pink', N'cái', 66, 48.9000)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (2, N'OPPO A7', N'Khaki', N'cái', 78, 97.9300)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (3, N'Nokia X7', N'Red', N'chiếc', 66, 38.4500)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (4, N'OPPO A7', N'Goldenrod', N'chiếc', 44, 29.8900)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (5, N'Samsung Galaxy', N'Mauv', N'chiếc', 6, 24.8200)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (6, N'iphone X', N'Yellow', N'chiếc', 84, 48.1800)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (7, N'Sony Xperia XZs', N'Turquoise', N'chiếc', 30, 98.7400)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (8, N'LG G6', N'Blue', N'cái', 58, 83.8300)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (9, N'BlackBerry KEY2 LE', N'Yellow', N'cái', 21, 97.6900)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (10, N'Wiko Bloom', N'Maroon', N'cái', 39, 34.4200)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (11, N'iphone X', N'Green', N'cái', 30, 66.5800)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (12, N'OPPO A7', N'Violet', N'chiếc', 60, 97.6900)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (13, N'Nokia 6.1 Plus', N'Puce', N'chiếc', 5, 34.1100)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (14, N'LG Q7', N'Crimson', N'chiếc', 39, 50.5100)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (15, N'OPPO A7', N'Orange', N'chiếc', 86, 55.3800)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (16, N'BlackBerry KEY2 LE', N'Fuscia', N'cái', 12, 81.8700)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (17, N'iphone 6S', N'Violet', N'chiếc', 34, 34.1600)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (18, N'Wiko Bloom', N'Teal', N'chiếc', 18, 98.5600)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (19, N'BlackBerry KEY2 LE', N'Mauv', N'cái', 65, 45.2800)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (20, N'OPPO A7', N'Fuscia', N'cái', 40, 79.0800)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (21, N'iphone X', N'Goldenrod', N'cái', 30, 38.5500)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (22, N'Wiko Bloom', N'Crimson', N'chiếc', 78, 51.8700)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (23, N'BlackBerry KEY2 LE', N'Turquoise', N'chi?c', 24, 95.0300)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (24, N'LG V35', N'Pink', N'chiếc', 82, 66.3100)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (25, N'LG G6', N'Purple', N'chiếc', 45, 20.9800)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (26, N'OPPO A7', N'Teal', N'chiếc', 99, 28.0300)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (27, N'Huawei Nova 3i', N'Mauv', N'cái', 31, 94.0700)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (28, N'iphone X', N'Pink', N'cái', 51, 43.9100)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (29, N'BlackBerry KEY2 LE', N'Green', N'cái', 66, 93.3300)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (30, N'OPPO A7', N'Orange', N'chiếc', 62, 89.4200)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (31, N'Nokia 6.1 Plus', N'Pink', N'cái', 27, 36.4600)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (32, N'LG G6', N'Teal', N'chiếc', 96, 32.3800)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (33, N'Sony Xperia XZs', N'Orange', N'cái', 51, 72.1200)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (34, N'Huawei Nova 3i', N'Puce', N'chiếc', 70, 59.1600)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (35, N'Samsung Galaxy', N'Aquamarine', N'chiếc', 6, 94.8300)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (36, N'iphone 6S', N'Green', N'chiếc', 89, 98.2000)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (37, N'iphone X', N'Maroon', N'chiếc', 39, 62.7100)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (38, N'Nokia X7', N'Fuscia', N'cái', 22, 90.9100)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (39, N'LG Q7', N'Fuscia', N'chiếc', 57, 86.4400)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (40, N'LG V35', N'Mauv', N'cái', 61, 47.2600)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (41, N'Sony Xperia XZs', N'Pink', N'chiếc', 43, 45.9500)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (42, N'Nokia 6.1 Plus', N'Turquoise', N'chiếc', 39, 46.7400)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (43, N'BlackBerry KEY2 LE', N'Khaki', N'chiếc', 89, 58.0700)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (44, N'Samsung Galaxy', N'Orange', N'chiếc', 60, 62.4200)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (45, N'Nokia 6.1 Plus', N'Goldenrod', N'cái', 37, 38.6900)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (46, N'LG Q7', N'Turquoise', N'chiếc', 88, 72.4400)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (47, N'LG G6', N'Violet', N'cái', 99, 46.6100)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (48, N'Nokia 6.1 Plus', N'Khaki', N'cái', 59, 61.5800)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (49, N'Huawei Nova 3i', N'Khaki', N'chiếc', 5, 87.1000)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (50, N'Samsung Galaxy', N'Crimson', N'cái', 71, 46.0100)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (81020181203, N'NOKIA3', N' XANH ĐEN', N'CÁI', 12, 4500000.0000)
INSERT [dbo].[SANPHAM] ([IDSP], [TenSP], [MoTaSP], [DVT], [SoLuongSP], [GiaBan]) VALUES (81020181520, N'SAMSUNG J3', N'ĐỒNG', N'CÁI', 10, 2100000.0000)
ALTER TABLE [dbo].[CT_GIOHANG]  WITH CHECK ADD  CONSTRAINT [FK_CT_GIOHANG_GIOHANG] FOREIGN KEY([IDGH])
REFERENCES [dbo].[GIOHANG] ([IDGIOHANG])
GO
ALTER TABLE [dbo].[CT_GIOHANG] CHECK CONSTRAINT [FK_CT_GIOHANG_GIOHANG]
GO
ALTER TABLE [dbo].[CT_GIOHANG]  WITH CHECK ADD  CONSTRAINT [FK_CT_GIOHANG_SANPHAM] FOREIGN KEY([IDSP])
REFERENCES [dbo].[SANPHAM] ([IDSP])
GO
ALTER TABLE [dbo].[CT_GIOHANG] CHECK CONSTRAINT [FK_CT_GIOHANG_SANPHAM]
GO
ALTER TABLE [dbo].[GIAODICH]  WITH CHECK ADD  CONSTRAINT [FK_GIAODICH_GIOHANG] FOREIGN KEY([IDGIOHANG])
REFERENCES [dbo].[GIOHANG] ([IDGIOHANG])
GO
ALTER TABLE [dbo].[GIAODICH] CHECK CONSTRAINT [FK_GIAODICH_GIOHANG]
GO
ALTER TABLE [dbo].[GIOHANG]  WITH CHECK ADD  CONSTRAINT [FK_GIOHANG_KHACHHANG] FOREIGN KEY([MAKH])
REFERENCES [dbo].[KHACHHANG] ([IDKH])
GO
ALTER TABLE [dbo].[GIOHANG] CHECK CONSTRAINT [FK_GIOHANG_KHACHHANG]
GO
USE [master]
GO
ALTER DATABASE [BANHANG] SET  READ_WRITE 
GO
