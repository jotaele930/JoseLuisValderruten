USE [master]
GO
/****** Object:  Database [JoseLuisValderruten]    Script Date: 29/11/2023 9:43:47 p. m. ******/
CREATE DATABASE [JoseLuisValderruten]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JoseLuisValderruten', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\JoseLuisValderruten.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'JoseLuisValderruten_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\JoseLuisValderruten_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [JoseLuisValderruten] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JoseLuisValderruten].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JoseLuisValderruten] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JoseLuisValderruten] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JoseLuisValderruten] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JoseLuisValderruten] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JoseLuisValderruten] SET ARITHABORT OFF 
GO
ALTER DATABASE [JoseLuisValderruten] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JoseLuisValderruten] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JoseLuisValderruten] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JoseLuisValderruten] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JoseLuisValderruten] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JoseLuisValderruten] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JoseLuisValderruten] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JoseLuisValderruten] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JoseLuisValderruten] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JoseLuisValderruten] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JoseLuisValderruten] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JoseLuisValderruten] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JoseLuisValderruten] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JoseLuisValderruten] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JoseLuisValderruten] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JoseLuisValderruten] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JoseLuisValderruten] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JoseLuisValderruten] SET RECOVERY FULL 
GO
ALTER DATABASE [JoseLuisValderruten] SET  MULTI_USER 
GO
ALTER DATABASE [JoseLuisValderruten] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JoseLuisValderruten] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JoseLuisValderruten] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JoseLuisValderruten] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [JoseLuisValderruten] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [JoseLuisValderruten] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'JoseLuisValderruten', N'ON'
GO
ALTER DATABASE [JoseLuisValderruten] SET QUERY_STORE = ON
GO
ALTER DATABASE [JoseLuisValderruten] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [JoseLuisValderruten]
GO
/****** Object:  Table [dbo].[Deportistas]    Script Date: 29/11/2023 9:43:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deportistas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Pais] [char](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modalidades]    Script Date: 29/11/2023 9:43:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modalidades](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdDeportista] [int] NOT NULL,
	[Arranque] [int] NOT NULL,
	[Envion] [int] NOT NULL,
	[TotalPeso] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[pro_listar]    Script Date: 29/11/2023 9:43:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[pro_listar]
as
begin

select d.Pais, d.Nombre,m.Arranque, m.Envion,m.TotalPeso
from Deportistas d
left join Modalidades as m ON d.Id =  m.IdDeportista
where m.TotalPeso=(select max(z.TotalPeso)
                      from Modalidades z
                      where z.IdDeportista=d.Id)
					  order by 3 desc
end









GO
/****** Object:  StoredProcedure [dbo].[pro_listarIntentos]    Script Date: 29/11/2023 9:43:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[pro_listarIntentos]
as
begin

select d.Nombre, count(m.Arranque) intentos
from Deportistas d
left join Modalidades as m ON d.Id =  m.IdDeportista
group by d.Nombre
end
GO
USE [master]
GO
ALTER DATABASE [JoseLuisValderruten] SET  READ_WRITE 
GO
