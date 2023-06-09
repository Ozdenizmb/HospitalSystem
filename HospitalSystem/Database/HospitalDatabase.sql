USE [master]
GO
/****** Object:  Database [HastaneSistemi]    Script Date: 26.04.2023 14:33:24 ******/
CREATE DATABASE [HastaneSistemi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HastaneSistemi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\HastaneSistemi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HastaneSistemi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\HastaneSistemi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [HastaneSistemi] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HastaneSistemi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HastaneSistemi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HastaneSistemi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HastaneSistemi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HastaneSistemi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HastaneSistemi] SET ARITHABORT OFF 
GO
ALTER DATABASE [HastaneSistemi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HastaneSistemi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HastaneSistemi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HastaneSistemi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HastaneSistemi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HastaneSistemi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HastaneSistemi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HastaneSistemi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HastaneSistemi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HastaneSistemi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HastaneSistemi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HastaneSistemi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HastaneSistemi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HastaneSistemi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HastaneSistemi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HastaneSistemi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HastaneSistemi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HastaneSistemi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HastaneSistemi] SET  MULTI_USER 
GO
ALTER DATABASE [HastaneSistemi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HastaneSistemi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HastaneSistemi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HastaneSistemi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HastaneSistemi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HastaneSistemi] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [HastaneSistemi] SET QUERY_STORE = ON
GO
ALTER DATABASE [HastaneSistemi] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [HastaneSistemi]
GO
/****** Object:  Table [dbo].[Tbl_Brans]    Script Date: 26.04.2023 14:33:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Brans](
	[Bransid] [int] IDENTITY(1,1) NOT NULL,
	[BransAd] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Doktor]    Script Date: 26.04.2023 14:33:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Doktor](
	[Doktorid] [int] IDENTITY(1,1) NOT NULL,
	[DoktorAd] [varchar](50) NULL,
	[DoktorSoyad] [varchar](50) NULL,
	[DoktorBrans] [varchar](50) NULL,
	[DoktorTC] [char](11) NULL,
	[DoktorSifre] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Duyuru]    Script Date: 26.04.2023 14:33:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Duyuru](
	[Duyuruid] [int] IDENTITY(1,1) NOT NULL,
	[Duyuru] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Hasta]    Script Date: 26.04.2023 14:33:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Hasta](
	[Hastaid] [int] IDENTITY(1,1) NOT NULL,
	[HastaAd] [varchar](50) NULL,
	[HastaSoyad] [varchar](50) NULL,
	[HastaTC] [char](11) NULL,
	[HastaTelefon] [varchar](12) NULL,
	[HastaSifre] [varchar](50) NULL,
	[HastaCinsiyet] [varchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Randevu]    Script Date: 26.04.2023 14:33:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Randevu](
	[Randevuid] [int] IDENTITY(1,1) NOT NULL,
	[RandevuTarih] [varchar](50) NULL,
	[RandevuSaat] [varchar](50) NULL,
	[RandevuBrans] [varchar](50) NULL,
	[RandevuDoktor] [varchar](50) NULL,
	[RandevuDurum] [bit] NULL,
	[HastaTC] [char](11) NULL,
	[HastaSikayet] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Sekreter]    Script Date: 26.04.2023 14:33:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Sekreter](
	[Sekreterid] [int] IDENTITY(1,1) NOT NULL,
	[SekreterAdSoyad] [varchar](50) NULL,
	[SekreterTC] [char](11) NULL,
	[SekreterSifre] [varchar](50) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tbl_Brans] ON 

INSERT [dbo].[Tbl_Brans] ([Bransid], [BransAd]) VALUES (1, N'Dahiliye')
INSERT [dbo].[Tbl_Brans] ([Bransid], [BransAd]) VALUES (2, N'Göz')
INSERT [dbo].[Tbl_Brans] ([Bransid], [BransAd]) VALUES (3, N'Kulak Burun Boğaz')
INSERT [dbo].[Tbl_Brans] ([Bransid], [BransAd]) VALUES (4, N'Fizik Tedavi')
INSERT [dbo].[Tbl_Brans] ([Bransid], [BransAd]) VALUES (5, N'Acil')
SET IDENTITY_INSERT [dbo].[Tbl_Brans] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Doktor] ON 

INSERT [dbo].[Tbl_Doktor] ([Doktorid], [DoktorAd], [DoktorSoyad], [DoktorBrans], [DoktorTC], [DoktorSifre]) VALUES (1, N'Baran', N'Özdeniz', N'Dahiliye', N'12345678910', N'1234')
INSERT [dbo].[Tbl_Doktor] ([Doktorid], [DoktorAd], [DoktorSoyad], [DoktorBrans], [DoktorTC], [DoktorSifre]) VALUES (2, N'Akın', N'Yıldız', N'Göz', N'14725836912', N'9876')
INSERT [dbo].[Tbl_Doktor] ([Doktorid], [DoktorAd], [DoktorSoyad], [DoktorBrans], [DoktorTC], [DoktorSifre]) VALUES (3, N'Esma', N'Özdeniz', N'Göz', N'15975385246', N'1235')
SET IDENTITY_INSERT [dbo].[Tbl_Doktor] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Duyuru] ON 

INSERT [dbo].[Tbl_Duyuru] ([Duyuruid], [Duyuru]) VALUES (1, N'Yarın Saat 14:00 da toplantımız bulunmaktadır.')
SET IDENTITY_INSERT [dbo].[Tbl_Duyuru] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Hasta] ON 

INSERT [dbo].[Tbl_Hasta] ([Hastaid], [HastaAd], [HastaSoyad], [HastaTC], [HastaTelefon], [HastaSifre], [HastaCinsiyet]) VALUES (1, N'Nevin', N'Sarı', N'11111111111', N'5553697485', N'9999', N'Kız')
INSERT [dbo].[Tbl_Hasta] ([Hastaid], [HastaAd], [HastaSoyad], [HastaTC], [HastaTelefon], [HastaSifre], [HastaCinsiyet]) VALUES (4, N'Anıl', N'Demiralp', N'44444444444', N'5375959569', N'4444', N'Erkek')
INSERT [dbo].[Tbl_Hasta] ([Hastaid], [HastaAd], [HastaSoyad], [HastaTC], [HastaTelefon], [HastaSifre], [HastaCinsiyet]) VALUES (5, N'qweasd', N'fdvgs', N'21212121212', N'5375959569', N'2121', N'Erkek')
SET IDENTITY_INSERT [dbo].[Tbl_Hasta] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Randevu] ON 

INSERT [dbo].[Tbl_Randevu] ([Randevuid], [RandevuTarih], [RandevuSaat], [RandevuBrans], [RandevuDoktor], [RandevuDurum], [HastaTC], [HastaSikayet]) VALUES (1, N'20.09.2023', N'14:00', N'Dahiliye', N'Baran Özdeniz', 1, N'21212121212', N'Ağrılarım Var.')
INSERT [dbo].[Tbl_Randevu] ([Randevuid], [RandevuTarih], [RandevuSaat], [RandevuBrans], [RandevuDoktor], [RandevuDurum], [HastaTC], [HastaSikayet]) VALUES (2, N'10.11.2023', N'12:00', N'Göz', N'Akın Yıldız', 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Tbl_Randevu] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Sekreter] ON 

INSERT [dbo].[Tbl_Sekreter] ([Sekreterid], [SekreterAdSoyad], [SekreterTC], [SekreterSifre]) VALUES (1, N'Emel Öztürk', N'55555555555', N'5555')
INSERT [dbo].[Tbl_Sekreter] ([Sekreterid], [SekreterAdSoyad], [SekreterTC], [SekreterSifre]) VALUES (2, N'Ali Güneş', N'77777777777', N'7777')
SET IDENTITY_INSERT [dbo].[Tbl_Sekreter] OFF
GO
USE [master]
GO
ALTER DATABASE [HastaneSistemi] SET  READ_WRITE 
GO
