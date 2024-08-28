
USE [master]
GO
Create database TMTV
GO
USE TMTV
GO
CREATE TABLE Movie
(
  MovieID INT PRIMARY KEY IDENTITY(1,1),
  Title NVARCHAR(255) COLLATE Vietnamese_CI_AS NOT NULL,
  ReleaseYear DATE,
  Content NVARCHAR(MAX) COLLATE Vietnamese_CI_AS NOT NULL,
  MovieLength INT,
  Country NVARCHAR(25) COLLATE Vietnamese_CI_AS ,
  Poster_link NVARCHAR(255) COLLATE Vietnamese_CI_AS NOT NULL,
  Viewers INT DEFAULT 0,
  Actor NVARCHAR(255) COLLATE Vietnamese_CI_AS,
  Director NVARCHAR(255) COLLATE Vietnamese_CI_AS,
  Rating FLOAT
);

CREATE TABLE Genre
(
  GenreID INT PRIMARY KEY IDENTITY(1,1),
  GenreName NVARCHAR(255) COLLATE Vietnamese_CI_AS NOT NULL
);

CREATE TABLE Language
(
  LanguageID INT PRIMARY KEY IDENTITY(1,1),
  Language NVARCHAR(255) COLLATE Vietnamese_CI_AS NOT NULL
);
CREATE TABLE Episodes
(
  ChapterID INT NOT NULL,
  Name NVARCHAR(255) COLLATE Vietnamese_CI_AS,
  Chapter_Length INT NOT NULL,
  Access_Type NVARCHAR(255),
  MovieID INT NOT NULL,
  link_ep NVARCHAR(255) COLLATE Vietnamese_CI_AS,
  Thumbnail NVARCHAR(255),
  PRIMARY KEY (MovieID, ChapterID),
  FOREIGN KEY (MovieID) REFERENCES Movie(MovieID)
);


CREATE TABLE Users
(
  UserID INT PRIMARY KEY IDENTITY(1,1),
  FirstName NVARCHAR(255) COLLATE Vietnamese_CI_AS NULL,
  LastName NVARCHAR(255) COLLATE Vietnamese_CI_AS NULL,
  Email NVARCHAR(255) COLLATE Vietnamese_CI_AS NOT NULL UNIQUE,
  PhoneNumber NVARCHAR(255) COLLATE Vietnamese_CI_AS ,
  Card_Number NVARCHAR(255) COLLATE Vietnamese_CI_AS ,
  Role NVARCHAR(255) COLLATE Vietnamese_CI_AS NOT NULL,
  Access_Right NVARCHAR(255) NOT NULL,
  Password NVARCHAR(255) ,
  Avatar NVARCHAR(255) ,
  Gender NVARCHAR(50)
);

CREATE TABLE Banner
(
  BannerID INT PRIMARY KEY IDENTITY(1,1),
  Link_img NVARCHAR(255) COLLATE Vietnamese_CI_AS NOT NULL,
  Role NVARCHAR(255) COLLATE Vietnamese_CI_AS NOT NULL,
  MovieID INT NOT NULL,
  FOREIGN KEY (MovieID) REFERENCES Movie(MovieID)
);

CREATE TABLE Movie_Genre
(
  MovieID INT NOT NULL,
  GenreID INT NOT NULL,
  PRIMARY KEY (MovieID, GenreID),
  FOREIGN KEY (MovieID) REFERENCES Movie(MovieID),
  FOREIGN KEY (GenreID) REFERENCES Genre(GenreID)
);

CREATE TABLE Movie_Language
(
  MovieID INT NOT NULL,
  LanguageID INT NOT NULL,
  PRIMARY KEY (MovieID, LanguageID),
  FOREIGN KEY (MovieID) REFERENCES Movie(MovieID),
  FOREIGN KEY (LanguageID) REFERENCES Language(LanguageID)
);

CREATE TABLE Ratings
(
  MovieID INT NOT NULL,
  UserID INT NOT NULL,
  Rating_Point INT NOT NULL,
  Time DATETIME DEFAULT GETDATE(),
  PRIMARY KEY (UserID, MovieID),
  FOREIGN KEY (UserID) REFERENCES Users(UserID),
  FOREIGN KEY (MovieID) REFERENCES Movie(MovieID)
);

CREATE TABLE History (
    HistoryID INT PRIMARY KEY IDENTITY(1,1),
    Time DATETIME NOT NULL,
    Watched_at DATETIME NOT NULL,
    UserID INT NOT NULL,
    MovieID INT NOT NULL,
    ChapterID INT NOT NULL,
    Comment NVARCHAR(MAX) COLLATE Vietnamese_CI_AS,
    CONSTRAINT FK_History_UserID FOREIGN KEY (UserID) REFERENCES Users(UserID),
    CONSTRAINT FK_History_Movie_Chapter FOREIGN KEY (MovieID, ChapterID) REFERENCES Episodes(MovieID, ChapterID)
);

CREATE TABLE Follow
(
  Action NVARCHAR(255) NOT NULL,
  ChapterID INT NOT NULL,
  MovieID INT NOT NULL,
  UserID INT NOT NULL,
  PRIMARY KEY (UserID, ChapterID, MovieID),
  FOREIGN KEY (UserID) REFERENCES Users(UserID),
  FOREIGN KEY (MovieID, ChapterID) REFERENCES Episodes(MovieID, ChapterID)
);

-- Insert data into tables
INSERT INTO Genre (GenreName) VALUES (N'Cổ trang'), (N'Huyền huyễn'), (N'Tiên hiệp'), (N'Tình cảm'), (N'Chính kịch'), (N'Kinh dị'), (N'Tâm lí'), (N'Gia đấu'), (N'Cung đấu'), (N'Đô thị'), (N'Thương trường'), (N'Khoa học viễn tưởng'), (N'Hài hước'), (N'Sinh tồn');
INSERT INTO Genre (GenreName) VALUES (N'Ngôn tình'),(N'Ngược');
INSERT INTO Genre (GenreName) VALUES (N'Chữa lành');
INSERT INTO Genre (GenreName) VALUES (N'Trẻ em'),(N'Hoạt hình');
INSERT INTO Genre (GenreName) VALUES (N'Giả tưởng');
INSERT INTO Genre (GenreName) VALUES (N'Gia đình');
INSERT INTO Language (Language) VALUES (N'Việt Nam'), (N'Trung Quốc'), (N'English');
INSERT INTO Genre (GenreName) VALUES (N'Hành động'),(N'Phiêu lưu');

INSERT INTO Movie (Title, ReleaseYear, Content, MovieLength, Country, Poster_link, Viewers, Actor, Director,Rating) 
VALUES (N'Dữ Phượng Hành', '2024-06-18', N'Dữ Phượng Hành là bộ phim cổ trang huyền huyễn được chuyển thể từ tiểu thuyết ngôn tình ''Bổn Vương Ở Đây'' của tác giả Cửu Lộ Phi Hương. Phim xoay quanh mối tình đầy ngang trái giữa Thẩm Ly - nữ tướng quân ma giới uy quyền và Hành Chỉ - vị thần quân cao quý của tiên giới. Câu chuyện bắt đầu khi Thẩm Ly, Bích Thương Vương của ma giới, bị ép buộc thành thân với Hành Chỉ, Chiêu Diêu Quân của tiên giới. Để thoát khỏi cuộc hôn nhân không mong muốn, Thẩm Ly đã trốn xuống trần gian và gặp gỡ Phó Dung - phàm thân của Hành Chỉ. Dần dần, Thẩm Ly nảy sinh tình cảm với Phó Dung mà không hay biết thân phận thực sự của anh. Tuy nhiên, mối tình của họ gặp phải nhiều thử thách khi Hành Chỉ thức tỉnh thân phận và buộc phải thực hiện sứ mệnh của mình.', 60, N'Trung Quốc', N'https://lh3.googleusercontent.com/drive-viewer/AKGpihZnqmJPSW4uY50rj-z44b548PFrQYt0kx6wIyAb73NLOdtGtdQ1Xjgx2gwh8tzeCnIV3qSGudDBu1BRbsnqjCMeD4aI81O26PM=s1600-rw-v1', 100, N'Triệu Lệ Dĩnh, Lâm Canh Tân, Tân Vân Lai, Hà Dữ, Lạt Mục Dương Tử, Tăng Lê, Tuyên Lộ, Trương Thiên Dương, Lưu Quán Lân, Khưu Tâm Chí', N'Đặng Khoa',8.5);
INSERT INTO Movie_Genre (MovieID, GenreID) VALUES (1, 1), (1, 2), (1, 3), (1, 4);
INSERT INTO Movie_Language (MovieID, LanguageID) VALUES (1, 1);
INSERT INTO Episodes (ChapterID, Name, Chapter_Length, Access_Type, MovieID, link_ep,Thumbnail)
VALUES (0, N'Trailer', 93, N'Free', 1, N'https://drive.google.com/file/d/1smK3CMFTtQsC2_jrMRhPELkgD0Mhihvp/preview','assets/img/trailer_duphuonghanh.jpg');

INSERT INTO Movie (Title, ReleaseYear, Content, MovieLength, Country, Poster_link, Viewers, Actor, Director,Rating) 
VALUES (N'Minh Lan Truyện', '2018-12-25', N'Minh Lan Truyện xoay quanh chuyện tình cảm của Thịnh Minh Lan, thiếu nữ con nhà quan thời Bắc Tống cùng với hai chàng trai Cố Đình Diệp (Phùng Thiệu Phong) và Tề Hành (Chu Nhất Long). Là con thứ sáu trong phủ họ Thịnh, Minh Lan xinh đẹp và thông tuệ hơn người nhưng sớm mồ côi mẹ. Cô luôn sống trong cảnh mẹ cả không thương, tỷ muội ganh đua. Cô phải nhẫn nhục trưởng thành trong nghịch cảnh để báo thù cho mẹ ruột. Ngoài ra, phim Minh Lan Truyện cũng cho thấy mối quan hệ vợ chồng từ oan gia đối đầu, thử thách đến chân thành sống chết có nhau của Minh Lan và Cố Đình Diệp', 60, N'Trung Quốc', N'https://lh3.googleusercontent.com/drive-viewer/AKGpihab8Z1NwDmZVRD_1Ge_GqkQZItj7TlJNRRhNC8f8orUpPyuhwWkYXyfEKOpgpN13WRyZj-9h0lxSJQDmGsaUP172UL_h2G_0JE=s2560', 120, N'Triệu Lệ Dĩnh, Phùng Thiệu Phong, Chu Nhất Long, Trương Giai Ninh, Tào Thúy Phấn, Thi Thi, Vương Hạc Nhuận, Lưu Quân, Vương Nhất Nam, Lý Y Hiểu, Lưu Lâm, Trương Hàm Vận', N'Trương Khai Trụ',9);
INSERT INTO Movie_Genre (MovieID, GenreID) VALUES (2, 1), (2, 8), (2, 4);
INSERT INTO Movie_Language (MovieID, LanguageID) VALUES (2, 1);
INSERT INTO Episodes (ChapterID, Name, Chapter_Length, Access_Type, MovieID, link_ep,Thumbnail)
VALUES (0, N'Trailer', 93, N'Free', 2, N'https://player.vimeo.com/video/969162904?badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479','assets/img/trailer_minhlantruyen.jpg'),
(1, N'Tập 1', 93, N'Free', 2, N'https://www.youtube.com/embed/jpmrkI-1NgI?list=PLxonu6Vlonvm5uAsYjN3tCIjQtRoozATq','assets/img/1_minhlantruyen.jpg'),
(2, N'Tạp 2', 93, N'Free', 2, N'https://www.youtube.com/embed/qUVC3vDsvvQ?list=PLxonu6Vlonvm5uAsYjN3tCIjQtRoozATq','assets/img/2_minhlantruyen.jpg');

INSERT INTO Users (FirstName, LastName, Email, PhoneNumber, Card_Number, Role, Access_Right, Password,Avatar,Gender)
VALUES (N'Trần', N'Trung', 'trungtm@example.com', '0123456789', '1234567890123456', 'Admin', 'Full', '250220','./assets/img/avatar.png','male'),
       (N'Nguyễn', N'Thị Thanh', 'thib@example.com', '0987654321', '6543210987654321', 'User', 'Normal', '123456','./assets/img/avatar.png','female'),
       (N'Nguyễn', N'Quốc Tùng', 'qtung@example.com', '09875324581', '155448541112454', 'User', 'Vip', '101010','./assets/img/avatar.png','male');

-- Bổ sung chỉ mục unique cho PhoneNumber (không null)
CREATE UNIQUE INDEX IX_Users_PhoneNumber ON Users(PhoneNumber) WHERE PhoneNumber IS NOT NULL;


--tao banner
INSERT INTO Banner (Link_img, Role, MovieID)
VALUES 
('https://lh3.googleusercontent.com/drive-viewer/AKGpihbk88eRX_1tYHrSEdHFY-uB4wfwEvv-n_BVM_686z1reJGUbrEE4bQ-Gs8scSHuClFR5Dmo00DZqqAhTfuAceWOnYILj0_fTcA=s1600-rw-v1', '0', 1),
('https://lh3.googleusercontent.com/drive-viewer/AKGpihbXvcdVq0zEHhZIucm2Zuj5ydwlGMzxPXNHrIv6IFoHams43cdpL1xp_8WA7nqW6h7_69suPkyngCbDqoJa2IxPV_2GBhKZCg=s1600-rw-v1', '0', 2);
INSERT INTO Banner (Link_img, Role, MovieID)
VALUES 
('https://lh3.googleusercontent.com/drive-viewer/AKGpihYT3hSYFI4-wCMQuURj3M2t1MOoQn_96Y-6On6LbiIxgcfpScrcW28N3t9_9QNep8FOWBNp44nRa597xc1gvO4VcV7Uco0zOQ=s1600-rw-v1', '1', 1);