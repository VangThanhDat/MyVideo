USE [MyVideo]
GO
/****** Object:  Table [dbo].[Favorites]    Script Date: 8/7/2023 10:21:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorites](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](30) NULL,
	[VideoId] [nvarchar](11) NULL,
	[LikeDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shares]    Script Date: 8/7/2023 10:21:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shares](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](30) NULL,
	[VideoId] [nvarchar](11) NULL,
	[Email] [nvarchar](50) NULL,
	[ShareDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/7/2023 10:21:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [nvarchar](30) NOT NULL,
	[Password] [nvarchar](50) NULL,
	[Fullname] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Admin] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Videos]    Script Date: 8/7/2023 10:21:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Videos](
	[Id] [nvarchar](11) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Poster] [nvarchar](255) NULL,
	[Views] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[Active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Favorites] ON 

INSERT [dbo].[Favorites] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (2, N'teone', N'NB9XynUhq8U', CAST(N'2023-01-02' AS Date))
INSERT [dbo].[Favorites] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (3, N'teone', N'NB9XynUhq8U', CAST(N'2023-02-02' AS Date))
INSERT [dbo].[Favorites] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (4, N'teone', N'6fzH7a3XQW0', CAST(N'2023-01-03' AS Date))
INSERT [dbo].[Favorites] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (5, N'dang1', N'6fzH7a3XQW0', CAST(N'2023-04-04' AS Date))
INSERT [dbo].[Favorites] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (9, N'hieu', N'6fzH7a3XQW0', CAST(N'2023-01-08' AS Date))
INSERT [dbo].[Favorites] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (10, N'hieu', N'Yw9Ra2UiVLw', CAST(N'2023-01-09' AS Date))
INSERT [dbo].[Favorites] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (11, N'hieu', N'UA-_--OS6i0', CAST(N'2023-07-10' AS Date))
INSERT [dbo].[Favorites] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (12, N'hieu', N'Jk38OqdAQxc', CAST(N'2023-08-01' AS Date))
INSERT [dbo].[Favorites] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (13, N'hieu', N'WAxxfzdcNdA', CAST(N'2023-02-10' AS Date))
INSERT [dbo].[Favorites] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (14, N'datvt', N'WAxxfzdcNdA', CAST(N'2023-04-11' AS Date))
INSERT [dbo].[Favorites] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (15, N'nghiaqh', N'EWz4fITO5qg', CAST(N'2023-05-01' AS Date))
INSERT [dbo].[Favorites] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (16, N'nghiaqh', N'NEuLByTmJ-g', CAST(N'2023-03-17' AS Date))
INSERT [dbo].[Favorites] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (17, N'nghiaqh', N'u7ScW1kCgS0', CAST(N'2023-11-01' AS Date))
INSERT [dbo].[Favorites] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (18, N'nghiaqh', N'knW7-x7Y7RE', CAST(N'2023-12-04' AS Date))
INSERT [dbo].[Favorites] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (19, N'datvt', N'u7ScW1kCgS0', CAST(N'2023-11-07' AS Date))
INSERT [dbo].[Favorites] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (20, N'datvt', N'NEuLByTmJ-g', CAST(N'2023-05-17' AS Date))
INSERT [dbo].[Favorites] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (21, N'datvt', N'cKBRHaPdjbc', CAST(N'2022-12-31' AS Date))
SET IDENTITY_INSERT [dbo].[Favorites] OFF
GO
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Email], [Admin]) VALUES (N'asdasd', N'sdasdasd', N'asdasd', N'td27022003@gmail.com', 0)
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Email], [Admin]) VALUES (N'dang1', N'd123456', N'Trần Hữu Đang', N'danth@gmail.com', 0)
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Email], [Admin]) VALUES (N'dat5', N'147258', N'datVipPro', N'td27022003@gmail.com', 0)
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Email], [Admin]) VALUES (N'datvt', N'dat123', N'Vạngdddddddd', N'dat30404@gmail.com', 1)
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Email], [Admin]) VALUES (N'hieu', N'hd1111', N'Danh Hiếu', N'hieud@gmail.com', 0)
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Email], [Admin]) VALUES (N'nghiaqh', N'nghia123', N'Quách Hữu Nghĩa', N'nghiaqh@gmail.com', 0)
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Email], [Admin]) VALUES (N'teone', N'teo123', N'Nguyễn Văn Tèo', N'teonv@gmail.com', 0)
GO
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'6fIj4UwdSYo', N'CHƯA QUÊN NGƯỜI YÊU CŨ', N'https://img.youtube.com/vi/6fIj4UwdSYo/maxresdefault.jpg', 99999999, N'CHƯA QUÊN NGƯỜI YÊU CŨ | HÀ NHI x HỨA KIM TUYỀN | Official Live Performance', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'6fzH7a3XQW0', N'Thôi Em Đừng Đi', N'https://img.youtube.com/vi/6fzH7a3XQW0/maxresdefault.jpg', 170, N'07. Thôi Em Đừng Đi - RPT MCK ( ft. Trung Trần ) | " 99% " the album', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'CHw1b_1LVBA', N'Waiting For You', N'https://img.youtube.com/vi/CHw1b_1LVBA/maxresdefault.jpg', 239, N'MONO - Waiting For You (Album 22 - Track No.10)', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'cKBRHaPdjbc', N'Tay To', N'https://img.youtube.com/vi/cKBRHaPdjbc/maxresdefault.jpg', 230, N'Rapitalove EP| Tay To - RPT MCK x RPT PhongKhin (Prod. by RPT PhongKhin) [Official Lyric Video]', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'dbiqR8dkITI', N'BÊN TRÊN TẦNG LẦU', N'https://img.youtube.com/vi/dbiqR8dkITI/maxresdefault.jpg', 334, N'BÊN TRÊN TẦNG LẦU - TĂNG DUY TÂN ( VISCONC REMIX ) Em Ơi Đừng Khóc Bóng Tối Trước Mắt Sẽ Bắt Em Đi', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'EWz4fITO5qg', N'VÌ YÊU CỨ ĐÂM ĐẦU ', N'https://img.youtube.com/vi/EWz4fITO5qg/maxresdefault.jpg', 168, N'MIN x ĐEN VÂU x JUSTATEE - VÌ YÊU CỨ ĐÂM ĐẦU (VYCĐĐ) | OFFICIAL MUSIC VIDEO (민)', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'IiVC7omXhUQ', N'Yêu Đừng Sợ Đau', N'https://img.youtube.com/vi/IiVC7omXhUQ/maxresdefault.jpg', 474, N'Yêu Đừng Sợ Đau - Ngô Lan Hương「Cukak Remix」/ Audio Lyrics Video', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'Jk38OqdAQxc', N'ĐỘ TỘC 2', N'https://img.youtube.com/vi/Jk38OqdAQxc/maxresdefault.jpg', 111, N'ĐỘ TỘC 2 | FROM MIXI WITH LOVE - MASEW x PHÚC DU x PHÁO x ĐỘ MIXI [OFFICIAL MV LYRIC]', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'Kma3NpC3JKQ', N'từ chối nhẹ nhàng thôi', N'https://img.youtube.com/vi/Kma3NpC3JKQ/maxresdefault.jpg', 223, N'PHÚC DU feat. @BICHPHUONGOFFICIAL - từ chối nhẹ nhàng thôi (Official M/V)', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'knW7-x7Y7RE', N'HÃY TRAO CHO ANH', N'https://img.youtube.com/vi/knW7-x7Y7RE/maxresdefault.jpg', 241, N'SƠN TÙNG M-TP | HÃY TRAO CHO ANH ft. Snoop Dogg | Official MV', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'NB9XynUhq8U', N'Mixi Funny Moment #12', N'https://img.youtube.com/vi/NB9XynUhq8U/maxresdefault.jpg', 120, N'Mixi Funny Moment #12: Tổng hợp những tình huống vui vui trên stream của Độ Mixi.', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'NEuLByTmJ-g', N'Bật Tình Yêu Lên', N'https://img.youtube.com/vi/NEuLByTmJ-g/maxresdefault.jpg', 230, N'Bật Tình Yêu Lên - Hòa Minzy ft. Tăng Duy Tân「Cukak Remix」/ Audio Lyrics Video', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'PNhYz6RmIr4', N'Xích Thêm Chút', N'https://img.youtube.com/vi/PNhYz6RmIr4/maxresdefault.jpg', 501, N'Xích Thêm Chút - XTC Remix | RPT Groovie ft TLinh x RPT MCK (Prod. by fat_benn & RPT LT)| RAPITALOVE', 0)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'u7ScW1kCgS0', N'CÔ ĐƠN TRÊN SOFA', N'https://img.youtube.com/vi/u7ScW1kCgS0/maxresdefault.jpg', 992, N'CÔ ĐƠN TRÊN SOFA | Hồ Ngọc Hà x Tăng Duy Tân | Trung Quân live cover at Soul of The Forest', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'UA-_--OS6i0', N'Đố em biết anh đang nghĩ gì', N'https://img.youtube.com/vi/UA-_--OS6i0/maxresdefault.jpg', 124, N'Đen x JustaTee - Đố em biết anh đang nghĩ gì ft. Biên (M/V) | Madihu Remix', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'uDSQxbQjwC0', N'Màn đào thoát ngoạn mục của 26 đứa trẻ bị bắt cóc', N'https://img.youtube.com/vi/uDSQxbQjwC0/maxresdefault.jpg', 1, N'ádâdzxxczc', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'VzaUawsSymA', N'Toàn cảnh đảo chính ở Niger', N'https://img.youtube.com/vi/3SKPkPnaKQY/maxresdefault.jpg', 123, N'adsadâd', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'WAxxfzdcNdA', N'em bỏ hút thuốc chưa', N'https://img.youtube.com/vi/WAxxfzdcNdA/maxresdefault.jpg', 183, N'em bỏ hút thuốc chưa - người yêu cũ nhắn tin hỏi nhưng bích phương không muốn trả lời', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'Yw9Ra2UiVLw', N'Chìm Sâu', N'https://img.youtube.com/vi/Yw9Ra2UiVLw/maxresdefault.jpg', 111, N'Chìm Sâu - RPT MCK (feat. Trung Trần) | Official Lyrics Video', 1)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK68pyrlctu17cjef3dp184q23]    Script Date: 8/7/2023 10:21:30 PM ******/
ALTER TABLE [dbo].[Shares] ADD  CONSTRAINT [UK68pyrlctu17cjef3dp184q23] UNIQUE NONCLUSTERED 
(
	[UserId] ASC,
	[VideoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [fk_users_favorites] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [fk_users_favorites]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [fk_videos_favorites] FOREIGN KEY([VideoId])
REFERENCES [dbo].[Videos] ([Id])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [fk_videos_favorites]
GO
ALTER TABLE [dbo].[Shares]  WITH CHECK ADD  CONSTRAINT [fk_users_shares] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Shares] CHECK CONSTRAINT [fk_users_shares]
GO
ALTER TABLE [dbo].[Shares]  WITH CHECK ADD  CONSTRAINT [fk_videos_shares] FOREIGN KEY([VideoId])
REFERENCES [dbo].[Videos] ([Id])
GO
ALTER TABLE [dbo].[Shares] CHECK CONSTRAINT [fk_videos_shares]
GO
