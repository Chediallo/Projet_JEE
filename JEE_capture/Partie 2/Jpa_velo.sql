USE [master]
GO
/****** Object:  Database [Jpa_velo]    Script Date: 15/08/2021 16:07:59 ******/
CREATE DATABASE [Jpa_velo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Jpa_velo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Jpa_velo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Jpa_velo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Jpa_velo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Jpa_velo] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Jpa_velo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Jpa_velo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Jpa_velo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Jpa_velo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Jpa_velo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Jpa_velo] SET ARITHABORT OFF 
GO
ALTER DATABASE [Jpa_velo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Jpa_velo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Jpa_velo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Jpa_velo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Jpa_velo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Jpa_velo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Jpa_velo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Jpa_velo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Jpa_velo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Jpa_velo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Jpa_velo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Jpa_velo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Jpa_velo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Jpa_velo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Jpa_velo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Jpa_velo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Jpa_velo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Jpa_velo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Jpa_velo] SET  MULTI_USER 
GO
ALTER DATABASE [Jpa_velo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Jpa_velo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Jpa_velo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Jpa_velo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Jpa_velo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Jpa_velo] SET QUERY_STORE = OFF
GO
USE [Jpa_velo]
GO
/****** Object:  User [moha]    Script Date: 15/08/2021 16:07:59 ******/
CREATE USER [moha] FOR LOGIN [moha] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [moha]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [moha]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [moha]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [moha]
GO
ALTER ROLE [db_datareader] ADD MEMBER [moha]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [moha]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [moha]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [moha]
GO
/****** Object:  Table [dbo].[Articlecommande]    Script Date: 15/08/2021 16:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articlecommande](
	[Idarticle] [int] IDENTITY(1,1) NOT NULL,
	[Designation] [varchar](255) NULL,
	[Idvelo] [int] NULL,
	[quantite] [varchar](255) NULL,
	[prix] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Idarticle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 15/08/2021 16:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Idclient] [int] IDENTITY(1,1) NOT NULL,
	[Nomclient] [varchar](255) NOT NULL,
	[Prenomclient] [varchar](255) NOT NULL,
	[Emailclient] [varchar](255) NOT NULL,
	[Telclient] [varchar](255) NOT NULL,
	[Adresseclient] [varchar](255) NOT NULL,
	[Villeclient] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Idclient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Commande]    Script Date: 15/08/2021 16:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commande](
	[Idcommande] [int] IDENTITY(1,1) NOT NULL,
	[Idclient] [int] NULL,
	[Datecommande] [date] NOT NULL,
	[Datelivraison] [date] NOT NULL,
	[Idmagasin] [int] NULL,
	[Idemploye] [int] NULL,
	[Idarticle] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Idcommande] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employe]    Script Date: 15/08/2021 16:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employe](
	[Idemploye] [int] IDENTITY(1,1) NOT NULL,
	[Nomemploye] [varchar](255) NOT NULL,
	[Prenomemploye] [varchar](255) NOT NULL,
	[Emailemploye] [varchar](255) NOT NULL,
	[Telemploye] [varchar](255) NOT NULL,
	[Idmagasin] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Idemploye] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Magasin]    Script Date: 15/08/2021 16:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Magasin](
	[Idmagasin] [int] IDENTITY(1,1) NOT NULL,
	[Nommagasin] [varchar](255) NOT NULL,
	[Prenommagasin] [varchar](255) NOT NULL,
	[Emailmagasin] [varchar](255) NOT NULL,
	[Telmagasin] [varchar](255) NOT NULL,
	[Adressemagasin] [varchar](255) NOT NULL,
	[Villemagasin] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Idmagasin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 15/08/2021 16:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[Idmagasin] [int] NULL,
	[Idvelo] [int] NULL,
	[Quantite] [varchar](255) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Velo]    Script Date: 15/08/2021 16:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Velo](
	[Idvelo] [int] IDENTITY(1,1) NOT NULL,
	[Nomvelo] [varchar](255) NOT NULL,
	[Marque] [varchar](255) NOT NULL,
	[Prixvelo] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Idvelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Articlecommande]  WITH CHECK ADD FOREIGN KEY([Idvelo])
REFERENCES [dbo].[Velo] ([Idvelo])
GO
ALTER TABLE [dbo].[Commande]  WITH CHECK ADD FOREIGN KEY([Idarticle])
REFERENCES [dbo].[Articlecommande] ([Idarticle])
GO
ALTER TABLE [dbo].[Commande]  WITH CHECK ADD FOREIGN KEY([Idclient])
REFERENCES [dbo].[Client] ([Idclient])
GO
ALTER TABLE [dbo].[Commande]  WITH CHECK ADD FOREIGN KEY([Idemploye])
REFERENCES [dbo].[Employe] ([Idemploye])
GO
ALTER TABLE [dbo].[Commande]  WITH CHECK ADD FOREIGN KEY([Idmagasin])
REFERENCES [dbo].[Magasin] ([Idmagasin])
GO
ALTER TABLE [dbo].[Employe]  WITH CHECK ADD FOREIGN KEY([Idmagasin])
REFERENCES [dbo].[Magasin] ([Idmagasin])
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD FOREIGN KEY([Idmagasin])
REFERENCES [dbo].[Magasin] ([Idmagasin])
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD FOREIGN KEY([Idvelo])
REFERENCES [dbo].[Velo] ([Idvelo])
GO
USE [master]
GO
ALTER DATABASE [Jpa_velo] SET  READ_WRITE 
GO
