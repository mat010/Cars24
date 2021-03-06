USE [CarDB]
GO
/****** Object:  Table [dbo].[Body]    Script Date: 1/7/2018 10:25:16 PM ******/
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
/****** Object:  Table [dbo].[Brand]    Script Date: 1/7/2018 10:27:46 PM ******/
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
/****** Object:  Table [dbo].[Car]    Script Date: 1/7/2018 10:28:26 PM ******/
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
/****** Object:  Table [dbo].[CarDetails]    Script Date: 1/7/2018 10:28:26 PM ******/
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
/****** Object:  Table [dbo].[CarModel]    Script Date: 1/7/2018 10:28:26 PM ******/
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
/****** Object:  Table [dbo].[PetrolType]    Script Date: 1/7/2018 10:28:26 PM ******/
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
/****** Object:  Table [dbo].[Picture]    Script Date: 1/7/2018 10:28:26 PM ******/
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
/****** Object:  Table [dbo].[TechnicalCondition]    Script Date: 1/7/2018 10:28:26 PM ******/
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
/****** Object:  Table [dbo].[Transmission]    Script Date: 1/7/2018 10:28:26 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 1/7/2018 10:28:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XrefUserCar]    Script Date: 1/7/2018 10:28:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XrefUserCar](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[CarId] [int] NOT NULL,
 CONSTRAINT [PK_XrefUserCar] PRIMARY KEY CLUSTERED 
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
INSERT [dbo].[Brand] ([Id], [BrandName]) VALUES (5, N'Fiat')
GO
INSERT [dbo].[Brand] ([Id], [BrandName]) VALUES (6, N'Toyota')
GO
INSERT [dbo].[Brand] ([Id], [BrandName]) VALUES (7, N'Seat')
GO
INSERT [dbo].[Brand] ([Id], [BrandName]) VALUES (8, N'Volkswagen')
GO
INSERT [dbo].[Brand] ([Id], [BrandName]) VALUES (9, N'Mitschubishi')
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
INSERT [dbo].[Car] ([Id], [BrandId], [CarModelId], [Price], [City], [Year], [Distance], [Capacity], [PetrolTypeId]) VALUES (6, 3, 10, CAST(10000 AS Decimal(18, 0)), N'Poznan', 2000, 300000, 2000, 2)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [CarModelId], [Price], [City], [Year], [Distance], [Capacity], [PetrolTypeId]) VALUES (7, 3, 10, CAST(10000 AS Decimal(18, 0)), N'Poznan', 2000, 300000, 2000, 2)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [CarModelId], [Price], [City], [Year], [Distance], [Capacity], [PetrolTypeId]) VALUES (8, 1, 3, CAST(12000 AS Decimal(18, 0)), N'Trzcianka', 2004, 255000, 2500, 4)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [CarModelId], [Price], [City], [Year], [Distance], [Capacity], [PetrolTypeId]) VALUES (9, 1, 3, CAST(12000 AS Decimal(18, 0)), N'Trzcianka', 2004, 255000, 2500, 4)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [CarModelId], [Price], [City], [Year], [Distance], [Capacity], [PetrolTypeId]) VALUES (10, 4, 16, CAST(4500 AS Decimal(18, 0)), N'Kostrzyn', 1994, 270000, 2000, 2)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [CarModelId], [Price], [City], [Year], [Distance], [Capacity], [PetrolTypeId]) VALUES (11, 2, 8, CAST(20000 AS Decimal(18, 0)), N'Zakrzewo', 1998, 350000, 2500, 4)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [CarModelId], [Price], [City], [Year], [Distance], [Capacity], [PetrolTypeId]) VALUES (12, 4, 14, CAST(8000 AS Decimal(18, 0)), N'Wronki', 1996, 270000, 2000, 4)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [CarModelId], [Price], [City], [Year], [Distance], [Capacity], [PetrolTypeId]) VALUES (13, 7, 23, CAST(5000 AS Decimal(18, 0)), N'Gniezno', 1998, 300000, 1600, 2)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [CarModelId], [Price], [City], [Year], [Distance], [Capacity], [PetrolTypeId]) VALUES (14, 7, 25, CAST(1500 AS Decimal(18, 0)), N'Nowa wieś', 1991, 220000, 1500, 1)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [CarModelId], [Price], [City], [Year], [Distance], [Capacity], [PetrolTypeId]) VALUES (15, 1, 4, CAST(12000 AS Decimal(18, 0)), N'Lubiewo', 2006, 220000, 2000, 4)
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
INSERT [dbo].[CarDetails] ([Id], [CarId], [BodyId], [TransmissionId], [ConditionId], [Description]) VALUES (5, 6, 1, 1, 1, N'Bardzo fajny mercedesik nie bity nie zgnity.')
GO
INSERT [dbo].[CarDetails] ([Id], [CarId], [BodyId], [TransmissionId], [ConditionId], [Description]) VALUES (6, 7, 1, 1, 1, N'Bardzo fajny mercedesik nie bity nie zgnity.')
GO
INSERT [dbo].[CarDetails] ([Id], [CarId], [BodyId], [TransmissionId], [ConditionId], [Description]) VALUES (7, 8, 2, 1, 1, N'jakis uszkodzony samochod')
GO
INSERT [dbo].[CarDetails] ([Id], [CarId], [BodyId], [TransmissionId], [ConditionId], [Description]) VALUES (8, 9, 2, 1, 1, N'jakis uszkodzony samochod')
GO
INSERT [dbo].[CarDetails] ([Id], [CarId], [BodyId], [TransmissionId], [ConditionId], [Description]) VALUES (9, 10, 4, 1, 2, N'Stara dobra honda')
GO
INSERT [dbo].[CarDetails] ([Id], [CarId], [BodyId], [TransmissionId], [ConditionId], [Description]) VALUES (10, 11, 1, 2, 2, N'Stara bmka, czyli dojechany TDS bez siły')
GO
INSERT [dbo].[CarDetails] ([Id], [CarId], [BodyId], [TransmissionId], [ConditionId], [Description]) VALUES (11, 12, 3, 2, 2, N'Bardzo fajna hondzina')
GO
INSERT [dbo].[CarDetails] ([Id], [CarId], [BodyId], [TransmissionId], [ConditionId], [Description]) VALUES (12, 13, 1, 1, 1, N'Lekko uszkodzony ale dalej jeździ.')
GO
INSERT [dbo].[CarDetails] ([Id], [CarId], [BodyId], [TransmissionId], [ConditionId], [Description]) VALUES (13, 14, 1, 1, 2, N'Seat Malaga z systemem porshe na glowicy.')
GO
INSERT [dbo].[CarDetails] ([Id], [CarId], [BodyId], [TransmissionId], [ConditionId], [Description]) VALUES (14, 15, 1, 2, 2, N'Bardzo fajne audi')
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
INSERT [dbo].[CarModel] ([Id], [CarModelName], [BrandId]) VALUES (17, N'Panda', 5)
GO
INSERT [dbo].[CarModel] ([Id], [CarModelName], [BrandId]) VALUES (18, N'500', 5)
GO
INSERT [dbo].[CarModel] ([Id], [CarModelName], [BrandId]) VALUES (19, N'126p', 5)
GO
INSERT [dbo].[CarModel] ([Id], [CarModelName], [BrandId]) VALUES (20, N'Yaris', 6)
GO
INSERT [dbo].[CarModel] ([Id], [CarModelName], [BrandId]) VALUES (21, N'Rav4', 6)
GO
INSERT [dbo].[CarModel] ([Id], [CarModelName], [BrandId]) VALUES (22, N'Avensis', 6)
GO
INSERT [dbo].[CarModel] ([Id], [CarModelName], [BrandId]) VALUES (23, N'Toledo', 7)
GO
INSERT [dbo].[CarModel] ([Id], [CarModelName], [BrandId]) VALUES (24, N'Ibiza', 7)
GO
INSERT [dbo].[CarModel] ([Id], [CarModelName], [BrandId]) VALUES (25, N'Malaga', 7)
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
INSERT [dbo].[User] ([Id], [Name], [Email], [Phone]) VALUES (1, N'Bolek', N'bolek@wp.pl', N'123456789')
GO
INSERT [dbo].[User] ([Id], [Name], [Email], [Phone]) VALUES (2, N'Lolek', N'lolek@onet.pl', N'098765432')
GO
INSERT [dbo].[User] ([Id], [Name], [Email], [Phone]) VALUES (4, N'Franek', N'franek@gmail.com', N'121212122')
GO
INSERT [dbo].[User] ([Id], [Name], [Email], [Phone]) VALUES (5, N'Test', N'test@wp.pl', N'123456789')
GO
INSERT [dbo].[User] ([Id], [Name], [Email], [Phone]) VALUES (6, N'abcd', N'abc@onet.eu', N'666222111')
GO
INSERT [dbo].[User] ([Id], [Name], [Email], [Phone]) VALUES (7, N'bmwManiak', N'maniak@bmw.pl', N'999666888')
GO
INSERT [dbo].[User] ([Id], [Name], [Email], [Phone]) VALUES (8, N'komarek', N'komarek@wp.pl', N'123123213')
GO
INSERT [dbo].[User] ([Id], [Name], [Email], [Phone]) VALUES (9, N'Boczek', N'bb@maniak.pl', N'999888111')
GO
INSERT [dbo].[User] ([Id], [Name], [Email], [Phone]) VALUES (10, N'maciek', N'maciek@wp.pl', N'123123123')
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[XrefUserCar] ON 
GO
INSERT [dbo].[XrefUserCar] ([Id], [UserId], [CarId]) VALUES (1, 1, 3)
GO
INSERT [dbo].[XrefUserCar] ([Id], [UserId], [CarId]) VALUES (2, 2, 4)
GO
INSERT [dbo].[XrefUserCar] ([Id], [UserId], [CarId]) VALUES (4, 4, 5)
GO
INSERT [dbo].[XrefUserCar] ([Id], [UserId], [CarId]) VALUES (5, 5, 6)
GO
INSERT [dbo].[XrefUserCar] ([Id], [UserId], [CarId]) VALUES (6, 5, 7)
GO
INSERT [dbo].[XrefUserCar] ([Id], [UserId], [CarId]) VALUES (8, 5, 9)
GO
INSERT [dbo].[XrefUserCar] ([Id], [UserId], [CarId]) VALUES (9, 6, 10)
GO
INSERT [dbo].[XrefUserCar] ([Id], [UserId], [CarId]) VALUES (10, 7, 11)
GO
INSERT [dbo].[XrefUserCar] ([Id], [UserId], [CarId]) VALUES (11, 8, 12)
GO
INSERT [dbo].[XrefUserCar] ([Id], [UserId], [CarId]) VALUES (12, 8, 13)
GO
INSERT [dbo].[XrefUserCar] ([Id], [UserId], [CarId]) VALUES (13, 9, 14)
GO
INSERT [dbo].[XrefUserCar] ([Id], [UserId], [CarId]) VALUES (14, 10, 15)
GO
SET IDENTITY_INSERT [dbo].[XrefUserCar] OFF
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
ALTER TABLE [dbo].[XrefUserCar]  WITH CHECK ADD FOREIGN KEY([CarId])
REFERENCES [dbo].[Car] ([Id])
GO
ALTER TABLE [dbo].[XrefUserCar]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
