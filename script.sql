USE [C:\USERS\BOGUS\ONEDRIVE\REPOSITORY\CAR24\DATAACCESS\CARDATABASE.MDF]
GO
/****** Object:  Table [dbo].[Body]    Script Date: 1/5/2018 12:21:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Body](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BodyName] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 1/5/2018 12:21:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Car]    Script Date: 1/5/2018 12:21:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BrandId] [int] NOT NULL,
	[CarModelId] [int] NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[City] [nvarchar](20) NOT NULL,
	[Year] [int] NULL,
	[Distance] [int] NULL,
	[Capacity] [int] NULL,
	[PetrolTypeId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarDetails]    Script Date: 1/5/2018 12:21:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CarId] [int] NOT NULL,
	[BodyId] [int] NOT NULL,
	[TransmissionId] [int] NOT NULL,
	[ConditionId] [int] NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarModel]    Script Date: 1/5/2018 12:21:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarModel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CarModelName] [nvarchar](20) NOT NULL,
	[BrandId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PetrolType]    Script Date: 1/5/2018 12:21:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PetrolType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PetrolName] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Picture]    Script Date: 1/5/2018 12:21:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Picture](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PicturePath] [nvarchar](200) NULL,
	[CarId] [int] NULL,
	[CarDetailsId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TechnicalCondition]    Script Date: 1/5/2018 12:21:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TechnicalCondition](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ConditionName] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transmission]    Script Date: 1/5/2018 12:21:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transmission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TransmissionName] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 1/5/2018 12:21:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CarId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Body] ON 
GO
INSERT [dbo].[Body] ([Id], [BodyName]) VALUES (1, N'Sedan')
GO
INSERT [dbo].[Body] ([Id], [BodyName]) VALUES (2, N'Combi')
GO
INSERT [dbo].[Body] ([Id], [BodyName]) VALUES (3, N'Cabrio')
GO
INSERT [dbo].[Body] ([Id], [BodyName]) VALUES (4, N'Chatchback')
GO
SET IDENTITY_INSERT [dbo].[Body] OFF
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 
GO
INSERT [dbo].[Brand] ([Id], [BrandName]) VALUES (1, N'Audi')
GO
INSERT [dbo].[Brand] ([Id], [BrandName]) VALUES (2, N'Bmw')
GO
INSERT [dbo].[Brand] ([Id], [BrandName]) VALUES (3, N'Mercedes')
GO
INSERT [dbo].[Brand] ([Id], [BrandName]) VALUES (4, N'Honda')
GO
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Car] ON 
GO
INSERT [dbo].[Car] ([Id], [BrandId], [CarModelId], [Price], [City], [Year], [Distance], [Capacity], [PetrolTypeId]) VALUES (3, 1, 2, CAST(3000 AS Decimal(18, 0)), N'Poznan', 2004, 240000, 2500, 1)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [CarModelId], [Price], [City], [Year], [Distance], [Capacity], [PetrolTypeId]) VALUES (4, 3, 9, CAST(500 AS Decimal(18, 0)), N'Warszawa', 1999, 500000, 3000, 3)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [CarModelId], [Price], [City], [Year], [Distance], [Capacity], [PetrolTypeId]) VALUES (5, 2, 7, CAST(2000 AS Decimal(18, 0)), N'Pila', 2010, 190000, 1800, 2)
GO
SET IDENTITY_INSERT [dbo].[Car] OFF
GO
SET IDENTITY_INSERT [dbo].[CarDetails] ON 
GO
INSERT [dbo].[CarDetails] ([Id], [CarId], [BodyId], [TransmissionId], [ConditionId], [Description]) VALUES (2, 3, 1, 1, 1, N'jakis opis')
GO
INSERT [dbo].[CarDetails] ([Id], [CarId], [BodyId], [TransmissionId], [ConditionId], [Description]) VALUES (3, 4, 2, 2, 2, N'zlom')
GO
INSERT [dbo].[CarDetails] ([Id], [CarId], [BodyId], [TransmissionId], [ConditionId], [Description]) VALUES (4, 5, 3, 1, 1, N'dobry zlom')
GO
SET IDENTITY_INSERT [dbo].[CarDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[CarModel] ON 
GO
INSERT [dbo].[CarModel] ([Id], [CarModelName], [BrandId]) VALUES (2, N'A3', 1)
GO
INSERT [dbo].[CarModel] ([Id], [CarModelName], [BrandId]) VALUES (3, N'A4', 1)
GO
INSERT [dbo].[CarModel] ([Id], [CarModelName], [BrandId]) VALUES (4, N'A6', 1)
GO
INSERT [dbo].[CarModel] ([Id], [CarModelName], [BrandId]) VALUES (5, N'A7', 1)
GO
INSERT [dbo].[CarModel] ([Id], [CarModelName], [BrandId]) VALUES (6, N'3', 2)
GO
INSERT [dbo].[CarModel] ([Id], [CarModelName], [BrandId]) VALUES (7, N'5', 2)
GO
INSERT [dbo].[CarModel] ([Id], [CarModelName], [BrandId]) VALUES (8, N'7', 2)
GO
INSERT [dbo].[CarModel] ([Id], [CarModelName], [BrandId]) VALUES (9, N'A-klasa', 3)
GO
INSERT [dbo].[CarModel] ([Id], [CarModelName], [BrandId]) VALUES (10, N'C-klasa', 3)
GO
INSERT [dbo].[CarModel] ([Id], [CarModelName], [BrandId]) VALUES (11, N'E-klasa', 3)
GO
INSERT [dbo].[CarModel] ([Id], [CarModelName], [BrandId]) VALUES (12, N'Civic', 4)
GO
INSERT [dbo].[CarModel] ([Id], [CarModelName], [BrandId]) VALUES (13, N'Jazz', 4)
GO
INSERT [dbo].[CarModel] ([Id], [CarModelName], [BrandId]) VALUES (14, N'Legend', 4)
GO
INSERT [dbo].[CarModel] ([Id], [CarModelName], [BrandId]) VALUES (16, N'Accord', 4)
GO
SET IDENTITY_INSERT [dbo].[CarModel] OFF
GO
SET IDENTITY_INSERT [dbo].[PetrolType] ON 
GO
INSERT [dbo].[PetrolType] ([Id], [PetrolName]) VALUES (1, N'Petrol')
GO
INSERT [dbo].[PetrolType] ([Id], [PetrolName]) VALUES (2, N'Gas')
GO
INSERT [dbo].[PetrolType] ([Id], [PetrolName]) VALUES (3, N'Lpg')
GO
INSERT [dbo].[PetrolType] ([Id], [PetrolName]) VALUES (4, N'Diesel')
GO
SET IDENTITY_INSERT [dbo].[PetrolType] OFF
GO
SET IDENTITY_INSERT [dbo].[TechnicalCondition] ON 
GO
INSERT [dbo].[TechnicalCondition] ([Id], [ConditionName]) VALUES (1, N'Uszkodzony')
GO
INSERT [dbo].[TechnicalCondition] ([Id], [ConditionName]) VALUES (2, N'Nieuszkodzony')
GO
SET IDENTITY_INSERT [dbo].[TechnicalCondition] OFF
GO
SET IDENTITY_INSERT [dbo].[Transmission] ON 
GO
INSERT [dbo].[Transmission] ([Id], [TransmissionName]) VALUES (1, N'Manual')
GO
INSERT [dbo].[Transmission] ([Id], [TransmissionName]) VALUES (2, N'Automat')
GO
SET IDENTITY_INSERT [dbo].[Transmission] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 
GO
INSERT [dbo].[User] ([Id], [CarId], [Name], [Email], [Phone]) VALUES (1, 3, N'Bolek', N'bolek@wp.pl', N'123456789')
GO
INSERT [dbo].[User] ([Id], [CarId], [Name], [Email], [Phone]) VALUES (2, 4, N'Lolek', N'lolek@onet.pl', N'098765432')
GO
INSERT [dbo].[User] ([Id], [CarId], [Name], [Email], [Phone]) VALUES (4, 5, N'Franek', N'franek@gmail.com', N'121212122')
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brand] ([Id])
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD FOREIGN KEY([CarModelId])
REFERENCES [dbo].[CarModel] ([Id])
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD FOREIGN KEY([PetrolTypeId])
REFERENCES [dbo].[PetrolType] ([Id])
GO
ALTER TABLE [dbo].[CarDetails]  WITH CHECK ADD FOREIGN KEY([BodyId])
REFERENCES [dbo].[Body] ([Id])
GO
ALTER TABLE [dbo].[CarDetails]  WITH CHECK ADD FOREIGN KEY([CarId])
REFERENCES [dbo].[Car] ([Id])
GO
ALTER TABLE [dbo].[CarDetails]  WITH CHECK ADD FOREIGN KEY([ConditionId])
REFERENCES [dbo].[TechnicalCondition] ([Id])
GO
ALTER TABLE [dbo].[CarDetails]  WITH CHECK ADD FOREIGN KEY([TransmissionId])
REFERENCES [dbo].[Transmission] ([Id])
GO
ALTER TABLE [dbo].[CarModel]  WITH CHECK ADD FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brand] ([Id])
GO
ALTER TABLE [dbo].[Picture]  WITH CHECK ADD FOREIGN KEY([CarDetailsId])
REFERENCES [dbo].[CarDetails] ([Id])
GO
ALTER TABLE [dbo].[Picture]  WITH CHECK ADD FOREIGN KEY([CarId])
REFERENCES [dbo].[Car] ([Id])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([CarId])
REFERENCES [dbo].[Car] ([Id])
GO
