USE [JoseLuisValderruten]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 30/11/2023 3:30:29 p. m. ******/
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
/****** Object:  Table [dbo].[Deps]    Script Date: 30/11/2023 3:30:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deps](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Pais] [nvarchar](max) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Deps] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mods]    Script Date: 30/11/2023 3:30:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mods](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdDeportista] [int] NOT NULL,
	[Arranque] [int] NOT NULL,
	[Envion] [int] NOT NULL,
	[Peso] [int] NOT NULL,
 CONSTRAINT [PK_Mods] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231130163313_MigracionJose', N'8.0.0')
GO
SET IDENTITY_INSERT [dbo].[Deps] ON 

INSERT [dbo].[Deps] ([Id], [Pais], [Nombre]) VALUES (1, N'COL', N'jose')
INSERT [dbo].[Deps] ([Id], [Pais], [Nombre]) VALUES (2, N'BRA', N'carolina')
INSERT [dbo].[Deps] ([Id], [Pais], [Nombre]) VALUES (3, N'FRA', N'sofia')
SET IDENTITY_INSERT [dbo].[Deps] OFF
GO
SET IDENTITY_INSERT [dbo].[Mods] ON 

INSERT [dbo].[Mods] ([Id], [IdDeportista], [Arranque], [Envion], [Peso]) VALUES (1, 1, 150, 150, 300)
INSERT [dbo].[Mods] ([Id], [IdDeportista], [Arranque], [Envion], [Peso]) VALUES (2, 1, 200, 150, 350)
INSERT [dbo].[Mods] ([Id], [IdDeportista], [Arranque], [Envion], [Peso]) VALUES (3, 1, 350, 150, 500)
INSERT [dbo].[Mods] ([Id], [IdDeportista], [Arranque], [Envion], [Peso]) VALUES (4, 2, 75, 50, 125)
INSERT [dbo].[Mods] ([Id], [IdDeportista], [Arranque], [Envion], [Peso]) VALUES (5, 2, 50, 150, 200)
INSERT [dbo].[Mods] ([Id], [IdDeportista], [Arranque], [Envion], [Peso]) VALUES (6, 2, 100, 90, 190)
INSERT [dbo].[Mods] ([Id], [IdDeportista], [Arranque], [Envion], [Peso]) VALUES (7, 3, 45, 45, 90)
INSERT [dbo].[Mods] ([Id], [IdDeportista], [Arranque], [Envion], [Peso]) VALUES (8, 3, 10, 15, 25)
INSERT [dbo].[Mods] ([Id], [IdDeportista], [Arranque], [Envion], [Peso]) VALUES (9, 3, 75, 10, 85)
INSERT [dbo].[Mods] ([Id], [IdDeportista], [Arranque], [Envion], [Peso]) VALUES (10, 1, 20, 20, 40)
INSERT [dbo].[Mods] ([Id], [IdDeportista], [Arranque], [Envion], [Peso]) VALUES (11, 3, 10, 10, 20)
INSERT [dbo].[Mods] ([Id], [IdDeportista], [Arranque], [Envion], [Peso]) VALUES (12, 1, 300, 120, 420)
SET IDENTITY_INSERT [dbo].[Mods] OFF
GO
