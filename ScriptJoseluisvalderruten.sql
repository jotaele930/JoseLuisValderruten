USE [JoseLuisValderruten]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 30/11/2023 8:46:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Arranque]    Script Date: 30/11/2023 8:46:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Arranque](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdDeportista] [int] NOT NULL,
	[PesoArranque] [int] NOT NULL,
 CONSTRAINT [PK_Arranque] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deportistas]    Script Date: 30/11/2023 8:46:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deportistas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Pais] [nvarchar](max) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Deportistas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Envion]    Script Date: 30/11/2023 8:46:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Envion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdDeportista] [int] NOT NULL,
	[PesoEnvion] [int] NOT NULL,
 CONSTRAINT [PK_Envion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231130231800_MigracionJoseLuis', N'8.0.0')
GO
SET IDENTITY_INSERT [dbo].[Arranque] ON 

INSERT [dbo].[Arranque] ([Id], [IdDeportista], [PesoArranque]) VALUES (1, 1, 60)
INSERT [dbo].[Arranque] ([Id], [IdDeportista], [PesoArranque]) VALUES (2, 1, 90)
INSERT [dbo].[Arranque] ([Id], [IdDeportista], [PesoArranque]) VALUES (3, 1, 30)
INSERT [dbo].[Arranque] ([Id], [IdDeportista], [PesoArranque]) VALUES (4, 2, 10)
INSERT [dbo].[Arranque] ([Id], [IdDeportista], [PesoArranque]) VALUES (5, 2, 20)
INSERT [dbo].[Arranque] ([Id], [IdDeportista], [PesoArranque]) VALUES (6, 2, 30)
INSERT [dbo].[Arranque] ([Id], [IdDeportista], [PesoArranque]) VALUES (7, 3, 55)
INSERT [dbo].[Arranque] ([Id], [IdDeportista], [PesoArranque]) VALUES (8, 3, 45)
INSERT [dbo].[Arranque] ([Id], [IdDeportista], [PesoArranque]) VALUES (9, 3, 25)
INSERT [dbo].[Arranque] ([Id], [IdDeportista], [PesoArranque]) VALUES (10, 1, 15)
INSERT [dbo].[Arranque] ([Id], [IdDeportista], [PesoArranque]) VALUES (11, 1, 98)
INSERT [dbo].[Arranque] ([Id], [IdDeportista], [PesoArranque]) VALUES (12, 3, 14)
SET IDENTITY_INSERT [dbo].[Arranque] OFF
GO
SET IDENTITY_INSERT [dbo].[Deportistas] ON 

INSERT [dbo].[Deportistas] ([Id], [Pais], [Nombre]) VALUES (1, N'COL', N'jose luis')
INSERT [dbo].[Deportistas] ([Id], [Pais], [Nombre]) VALUES (2, N'BRA', N'carolina')
INSERT [dbo].[Deportistas] ([Id], [Pais], [Nombre]) VALUES (3, N'FRA', N'sofia')
SET IDENTITY_INSERT [dbo].[Deportistas] OFF
GO
SET IDENTITY_INSERT [dbo].[Envion] ON 

INSERT [dbo].[Envion] ([Id], [IdDeportista], [PesoEnvion]) VALUES (1, 1, 36)
INSERT [dbo].[Envion] ([Id], [IdDeportista], [PesoEnvion]) VALUES (2, 1, 45)
INSERT [dbo].[Envion] ([Id], [IdDeportista], [PesoEnvion]) VALUES (3, 1, 84)
INSERT [dbo].[Envion] ([Id], [IdDeportista], [PesoEnvion]) VALUES (4, 2, 26)
INSERT [dbo].[Envion] ([Id], [IdDeportista], [PesoEnvion]) VALUES (5, 2, 48)
INSERT [dbo].[Envion] ([Id], [IdDeportista], [PesoEnvion]) VALUES (6, 2, 74)
INSERT [dbo].[Envion] ([Id], [IdDeportista], [PesoEnvion]) VALUES (7, 3, 15)
INSERT [dbo].[Envion] ([Id], [IdDeportista], [PesoEnvion]) VALUES (8, 3, 22)
INSERT [dbo].[Envion] ([Id], [IdDeportista], [PesoEnvion]) VALUES (9, 3, 36)
INSERT [dbo].[Envion] ([Id], [IdDeportista], [PesoEnvion]) VALUES (10, 2, 17)
INSERT [dbo].[Envion] ([Id], [IdDeportista], [PesoEnvion]) VALUES (11, 2, 3)
INSERT [dbo].[Envion] ([Id], [IdDeportista], [PesoEnvion]) VALUES (12, 3, 46)
SET IDENTITY_INSERT [dbo].[Envion] OFF
GO
