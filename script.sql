USE [DB_A45B83_servicecare]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 4/4/2019 6:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[full name] [nvarchar](80) NOT NULL,
	[username] [nvarchar](25) NOT NULL,
	[password] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](90) NOT NULL,
	[c national id] [nvarchar](14) NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
	[adress] [nvarchar](150) NULL,
	[longtitude] [numeric](11, 0) NULL,
	[latitude] [numeric](11, 0) NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[c national id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[employee]    Script Date: 4/4/2019 6:26:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[full name] [nvarchar](150) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[price] [money] NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
	[national id] [nvarchar](14) NOT NULL,
	[longtitude] [numeric](11, 0) NOT NULL,
	[latitude] [numeric](11, 0) NOT NULL,
	[nationality] [nvarchar](50) NOT NULL,
	[photo url] [nvarchar](1250) NOT NULL,
	[cv url] [nvarchar](1250) NOT NULL,
	[currency] [money] NULL,
	[c national id] [nvarchar](14) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[payment]    Script Date: 4/4/2019 6:26:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment](
	[pay no] [numeric](18, 0) NOT NULL,
	[cash] [money] NOT NULL,
	[visa] [numeric](18, 0) NOT NULL,
	[expiredate] [date] NOT NULL,
	[sss] [nvarchar](14) NOT NULL,
 CONSTRAINT [PK_payment] PRIMARY KEY CLUSTERED 
(
	[pay no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rate]    Script Date: 4/4/2019 6:26:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rate](
	[rate no] [nvarchar](10) NOT NULL,
	[comment] [nvarchar](50) NULL,
	[date] [datetime] NOT NULL,
	[value] [nvarchar](50) NULL,
	[national id] [nvarchar](14) NOT NULL,
	[c national id] [nvarchar](14) NOT NULL,
 CONSTRAINT [PK_rate] PRIMARY KEY CLUSTERED 
(
	[rate no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[request]    Script Date: 4/4/2019 6:26:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[request](
	[req no] [int] IDENTITY(1,1) NOT NULL,
	[date] [nvarchar](50) NULL,
	[notes] [nvarchar](50) NULL,
	[latitude] [nvarchar](50) NULL,
	[longitude] [nvarchar](150) NOT NULL,
	[worker name] [nvarchar](50) NULL,
	[username] [nvarchar](50) NULL,
 CONSTRAINT [PK_request] PRIMARY KEY CLUSTERED 
(
	[req no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[servicesection]    Script Date: 4/4/2019 6:26:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[servicesection](
	[sectionno] [int] IDENTITY(1,1) NOT NULL,
	[serivcename] [nvarchar](50) NULL,
	[logo] [nvarchar](4000) NULL,
 CONSTRAINT [PK_servicesection] PRIMARY KEY CLUSTERED 
(
	[sectionno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[work]    Script Date: 4/4/2019 6:26:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[work](
	[national id] [nvarchar](14) NOT NULL,
	[skills] [nvarchar](250) NOT NULL,
	[price] [money] NOT NULL,
 CONSTRAINT [PK_work] PRIMARY KEY CLUSTERED 
(
	[national id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[worker]    Script Date: 4/4/2019 6:26:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[worker](
	[workerno] [int] IDENTITY(1,1) NOT NULL,
	[workername] [nvarchar](100) NOT NULL,
	[rate] [float] NOT NULL,
	[price] [money] NOT NULL,
	[img] [nvarchar](3050) NULL,
	[sectionno] [int] NOT NULL,
	[cv] [nvarchar](3050) NOT NULL,
 CONSTRAINT [wpk] PRIMARY KEY CLUSTERED 
(
	[workerno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[customer] ([full name], [username], [password], [Email], [c national id], [phone], [adress], [longtitude], [latitude]) VALUES (N'toma', N'tuma', N'tuma123', N'fkhaled281@gmail.com', N'29708090101465', N'01011932504', N'dokki', CAST(31 AS Numeric(11, 0)), CAST(30 AS Numeric(11, 0)))
INSERT [dbo].[customer] ([full name], [username], [password], [Email], [c national id], [phone], [adress], [longtitude], [latitude]) VALUES (N'fatma khaled ', N'fatma', N'1997', N'fatmakhaled@gmail.com', N'29708090101546', N'01011932504', N'fardos city', NULL, NULL)
SET IDENTITY_INSERT [dbo].[request] ON 

INSERT [dbo].[request] ([req no], [date], [notes], [latitude], [longitude], [worker name], [username]) VALUES (1, N'Thu Apr 04 17:57:21 GMT+02:00 2019', N'usgg', N'0.0', N'0.0', N'mona ahmed', N'fatma')
INSERT [dbo].[request] ([req no], [date], [notes], [latitude], [longitude], [worker name], [username]) VALUES (2, N'Thu Apr 04 17:57:21 GMT+02:00 2019', N'usgg', N'0.0', N'0.0', N'mona ahmed', N'fatma')
INSERT [dbo].[request] ([req no], [date], [notes], [latitude], [longitude], [worker name], [username]) VALUES (3, N'Thu Apr 04 17:57:21 GMT+02:00 2019', N'usgg', N'0.0', N'0.0', N'mona ahmed', N'fatma')
INSERT [dbo].[request] ([req no], [date], [notes], [latitude], [longitude], [worker name], [username]) VALUES (4, N'Thu Apr 04 18:04:43 GMT+02:00 2019', N'', N'0.0', N'0.0', N'mona ahmed', N'fatma')
INSERT [dbo].[request] ([req no], [date], [notes], [latitude], [longitude], [worker name], [username]) VALUES (5, N'Thu Apr 04 18:04:43 GMT+02:00 2019', N'', N'0.0', N'0.0', N'mona ahmed', N'fatma')
INSERT [dbo].[request] ([req no], [date], [notes], [latitude], [longitude], [worker name], [username]) VALUES (6, N'Thu Apr 04 18:04:43 GMT+02:00 2019', N'', N'0.0', N'0.0', N'mona ahmed', N'fatma')
SET IDENTITY_INSERT [dbo].[request] OFF
SET IDENTITY_INSERT [dbo].[servicesection] ON 

INSERT [dbo].[servicesection] ([sectionno], [serivcename], [logo]) VALUES (1, N'Child Care', N'https://openclipart.org/image/2400px/svg_to_png/282746/Cartoon-Child.png')
INSERT [dbo].[servicesection] ([sectionno], [serivcename], [logo]) VALUES (2, N'overage Care', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkXugE0B1Av4ewQ29gEQ6VbAsI6EZpVavhwZFYy47FNpO1noDT')
INSERT [dbo].[servicesection] ([sectionno], [serivcename], [logo]) VALUES (3, N'Baby Care', N'https://baby-goo-roo-production.s3.amazonaws.com/slide_images/3ebb18dc-16d4-429f-9dc1-0cc48ce30205.png')
INSERT [dbo].[servicesection] ([sectionno], [serivcename], [logo]) VALUES (4, N'patient Service', N'https://3.bp.blogspot.com/-cpkzjjzsYgQ/V7LxzCVQpbI/AAAAAAAABdA/dZdfzWnENQMKZmCmRjbvGBmXJhFyWPCvgCLcB/s1600/doctor-patient-clipart-nurse_reading_to_patient.gif')
INSERT [dbo].[servicesection] ([sectionno], [serivcename], [logo]) VALUES (5, N'Home Service', N'https://img.olx.com.br/images/10/107914007452405.jpg')
INSERT [dbo].[servicesection] ([sectionno], [serivcename], [logo]) VALUES (6, N'Special Care', N'http://pha24.com/images/special-care.jpg')
SET IDENTITY_INSERT [dbo].[servicesection] OFF
SET IDENTITY_INSERT [dbo].[worker] ON 

INSERT [dbo].[worker] ([workerno], [workername], [rate], [price], [img], [sectionno], [cv]) VALUES (2, N'mona ahmed', 2, 120.0000, N'https://pbs.twimg.com/profile_images/552355973252136960/qjTrXKLa.jpeg', 1, N'https://drive.google.com/open?id=1iTemAZ3fLJJkVxStuscanv4yqLzQdskL')
INSERT [dbo].[worker] ([workerno], [workername], [rate], [price], [img], [sectionno], [cv]) VALUES (3, N'lamia osama', 5, 150.0000, N'http://golangsing.com/wp-content/uploads/2019/01/20190106_204540-01-279x300@2x.jpeg', 2, N'https://drive.google.com/open?id=1iTemAZ3fLJJkVxStuscanv4yqLzQdskL')
INSERT [dbo].[worker] ([workerno], [workername], [rate], [price], [img], [sectionno], [cv]) VALUES (4, N'hussien', 4.5, 200.0000, N'https://www.bgf.co.uk/wp-content/uploads/2017/08/Mark-e1522914676351.jpg', 1, N'https://drive.google.com/open?id=1iTemAZ3fLJJkVxStuscanv4yqLzQdskL')
INSERT [dbo].[worker] ([workerno], [workername], [rate], [price], [img], [sectionno], [cv]) VALUES (5, N'aser muhamed', 5, 250.0000, N'https://www.bgf.co.uk/wp-content/uploads/2017/08/Mark-Nunny-242.jpg', 2, N'https://drive.google.com/open?id=1iTemAZ3fLJJkVxStuscanv4yqLzQdskL')
INSERT [dbo].[worker] ([workerno], [workername], [rate], [price], [img], [sectionno], [cv]) VALUES (6, N'lina', 6, 300.0000, N'https://5.imimg.com/data5/HK/MN/MY-13142420/maid-uniform-500x500.jpg', 5, N'https://drive.google.com/open?id=1iTemAZ3fLJJkVxStuscanv4yqLzQdskL')
SET IDENTITY_INSERT [dbo].[worker] OFF
