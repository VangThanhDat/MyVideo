USE [master];
GO
IF DB_ID(N'MyVideo') IS NOT NULL
BEGIN
    ALTER DATABASE [MyVideo] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [MyVideo];
END
DROP DATABASE IF EXISTS MyVideo;
GO

CREATE DATABASE MyVideo;
GO

USE MyVideo;
GO

CREATE TABLE dbo.[Users] (
	Id NVARCHAR(30) PRIMARY KEY NOT NULL,
	[Password] NVARCHAR(50) ,
	Fullname NVARCHAR(50) ,
	Email NVARCHAR(50) ,
	[Admin] BIT
)
GO

CREATE TABLE dbo.Videos (
	Id NVARCHAR(11) PRIMARY KEY NOT NULL,
	Title NVARCHAR(100),
	Poster NVARCHAR(255),
	Views int ,
	Description NVARCHAR(MAX),
	Active BIT 
)
GO

CREATE TABLE dbo.Favorites(
	Id BIGINT PRIMARY KEY NOT NULL IDENTITY (1,1),
	UserId NVARCHAR(30) ,
	VideoId NVARCHAR(11) ,
	LikeDate DATE
)
GO
CREATE TABLE dbo.Shares(
	Id BIGINT PRIMARY KEY NOT NULL IDENTITY (1,1),
	UserId NVARCHAR(30) ,
	VideoId NVARCHAR(11) ,
	Email NVARCHAR(50),
	ShareDate DATE
)
GO

ALTER TABLE dbo.Favorites 
ADD CONSTRAINT fk_users_favorites 
FOREIGN KEY (UserId) 
REFERENCES dbo.[Users](Id)
GO

ALTER TABLE dbo.Favorites 
ADD CONSTRAINT fk_videos_favorites 
FOREIGN KEY (VideoId) 
REFERENCES dbo.[Videos](Id)
GO

ALTER TABLE dbo.Shares 
ADD CONSTRAINT fk_users_shares 
FOREIGN KEY (UserId) 
REFERENCES dbo.[Users](Id)
GO

ALTER TABLE dbo.Shares 
ADD CONSTRAINT fk_videos_shares 
FOREIGN KEY (VideoId) 
REFERENCES dbo.[Videos](Id)
GO
INSERT INTO dbo.[Users]
VALUES('teone', 'teo123', N'Nguyễn Văn Tèo', 'teonv@gmail.com', 0),
('dang1', 'd123456', N'Trần Hữu Đang', 'danth@gmail.com', 0),
('datvt', 'dat123', N'Vạng Thành Đạt', 'dat30404@gmail.com', 1),
('hieu', 'hd1111', N'Danh Hiếu', 'hieud@gmail.com',0),
('nghiaqh', 'nghia123', N'Quách Hữu Nghĩa', 'nghiaqh@gmail.com', 0);;
GO
INSERT INTO dbo.[Videos]
VALUES('4qNALNWoGmI', N'ưng quá chừng', 104, N'ưng quá chừng (loop version) - AMEE x TDK x KAI ĐINH | special M/V', 1),
('NB9XynUhq8U', N'Mixi Funny Moment #12', 120, N'Mixi Funny Moment #12: Tổng hợp những tình huống vui vui trên stream của Độ Mixi.', 1),
('6fzH7a3XQW0', N'Thôi Em Đừng Đi', 168, N'07. Thôi Em Đừng Đi - RPT MCK ( ft. Trung Trần ) | " 99% " the album', 1),
('Yw9Ra2UiVLw', N'Chìm Sâu',  110, N'Chìm Sâu - RPT MCK (feat. Trung Trần) | Official Lyrics Video', 1),
('cKBRHaPdjbc', N'Tay To', 230, N'Rapitalove EP| Tay To - RPT MCK x RPT PhongKhin (Prod. by RPT PhongKhin) [Official Lyric Video]', 1),
('PNhYz6RmIr4', N'Xích Thêm Chút', 500, N'Xích Thêm Chút - XTC Remix | RPT Groovie ft TLinh x RPT MCK (Prod. by fat_benn & RPT LT)| RAPITALOVE', 0),
('NEuLByTmJ-g', N'Bật Tình Yêu Lên', 230, N'Bật Tình Yêu Lên - Hòa Minzy ft. Tăng Duy Tân「Cukak Remix」/ Audio Lyrics Video', 1),
('knW7-x7Y7RE', N'HÃY TRAO CHO ANH', 240, N'SƠN TÙNG M-TP | HÃY TRAO CHO ANH ft. Snoop Dogg | Official MV', 1),
('CHw1b_1LVBA', N'Waiting For You', 239, N'MONO - Waiting For You (Album 22 - Track No.10)', 1),
('Jk38OqdAQxc', N'ĐỘ TỘC 2', 111, N'ĐỘ TỘC 2 | FROM MIXI WITH LOVE - MASEW x PHÚC DU x PHÁO x ĐỘ MIXI [OFFICIAL MV LYRIC]', 1),
('6fIj4UwdSYo', N'CHƯA QUÊN NGƯỜI YÊU CŨ', 222, N'CHƯA QUÊN NGƯỜI YÊU CŨ | HÀ NHI x HỨA KIM TUYỀN | Official Live Performance', 1),
('dbiqR8dkITI', N'BÊN TRÊN TẦNG LẦU', 334, N'BÊN TRÊN TẦNG LẦU - TĂNG DUY TÂN ( VISCONC REMIX ) Em Ơi Đừng Khóc Bóng Tối Trước Mắt Sẽ Bắt Em Đi', 1),
('IiVC7omXhUQ', N'Yêu Đừng Sợ Đau',  474, N'Yêu Đừng Sợ Đau - Ngô Lan Hương「Cukak Remix」/ Audio Lyrics Video', 1),
('u7ScW1kCgS0', N'CÔ ĐƠN TRÊN SOFA', 992, N'CÔ ĐƠN TRÊN SOFA | Hồ Ngọc Hà x Tăng Duy Tân | Trung Quân live cover at Soul of The Forest', 1),
('UA-_--OS6i0', N'Đố em biết anh đang nghĩ gì',123, N'Đen x JustaTee - Đố em biết anh đang nghĩ gì ft. Biên (M/V) | Madihu Remix', 1),
('Kma3NpC3JKQ', N'từ chối nhẹ nhàng thôi', 223, N'PHÚC DU feat. @BICHPHUONGOFFICIAL - từ chối nhẹ nhàng thôi (Official M/V)', 1),
('WAxxfzdcNdA', N'em bỏ hút thuốc chưa', 183, N'em bỏ hút thuốc chưa - người yêu cũ nhắn tin hỏi nhưng bích phương không muốn trả lời', 1),
('EWz4fITO5qg', N'VÌ YÊU CỨ ĐÂM ĐẦU ',  167, N'MIN x ĐEN VÂU x JUSTATEE - VÌ YÊU CỨ ĐÂM ĐẦU (VYCĐĐ) | OFFICIAL MUSIC VIDEO (민)', 1);
GO
INSERT INTO dbo.[Favorites]
VALUES('teone', '4qNALNWoGmI', CAST('2023-01-01' AS DATE)),
('teone', 'NB9XynUhq8U', CAST('2023-01-02' AS DATE)),
('teone', 'NB9XynUhq8U', CAST('2023-02-02' AS DATE)),
('teone', '6fzH7a3XQW0', CAST('2023-01-03' AS DATE)),
('dang1', '6fzH7a3XQW0', CAST('2023-04-04' AS DATE)),
('dang1', '4qNALNWoGmI', CAST('2023-01-05' AS DATE)),
('dang1', '4qNALNWoGmI', CAST('2023-01-06' AS DATE)),
('dang1', '4qNALNWoGmI', CAST('2023-01-07' AS DATE)),
('hieu', '6fzH7a3XQW0', CAST('2023-01-08' AS DATE)),
('hieu', 'Yw9Ra2UiVLw', CAST('2023-01-09' AS DATE)),
('hieu', 'UA-_--OS6i0', CAST('2023-07-10' AS DATE)),
('hieu', 'Jk38OqdAQxc', CAST('2023-08-01' AS DATE)),
('hieu', 'WAxxfzdcNdA', CAST('2023-02-10' AS DATE)),
('datvt', 'WAxxfzdcNdA', CAST('2023-04-11' AS DATE)),
('nghiaqh', 'EWz4fITO5qg', CAST('2023-05-01' AS DATE)),
('nghiaqh', 'NEuLByTmJ-g', CAST('2023-03-17' AS DATE)),
('nghiaqh', 'u7ScW1kCgS0', CAST('2023-11-01' AS DATE)),
('nghiaqh', 'knW7-x7Y7RE', CAST('2023-12-04' AS DATE)),
('datvt', 'u7ScW1kCgS0', CAST('2023-11-07' AS DATE)),
('datvt', 'NEuLByTmJ-g', CAST('2023-05-17' AS DATE)),
('datvt', 'cKBRHaPdjbc', CAST('2022-12-31' AS DATE));

GO
