--1--
CREATE TABLE public.Authors (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(100)
);

CREATE TABLE public.Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    AuthorID INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

ALTER TABLE public.Authors OWNER to postgres;
ALTER TABLE public.Books OWNER to postgres;

INSERT INTO Authors (AuthorID, AuthorName) VALUES
(1, 'Author A'),
(2, 'Author B'),
(3, 'Author C'),
(4, 'Author D'),
(5, 'Author E'),
(6, 'Author F'),
(60, 'Author Z');

-- Insert books
INSERT INTO Books (BookID, Title, AuthorID) VALUES
(1, 'Book 1', 1),
(2, 'Book 2', 2),
(3, 'Book 3', 1),
(4, 'Book 4', 3),
-- Add more books as needed up to 50
(50, 'Book 50', 2);


--2--

CREATE TABLE public.WorkoutSessions (
    UserID INT,
    SessionDate DATE,
    IsCompleted BOOLEAN
);

ALTER TABLE public.WorkoutSessions  OWNER to postgres;

INSERT INTO WorkoutSessions (UserID, SessionDate, IsCompleted) VALUES
(1, '2024-01-01', CAST(1 AS BOOLEAN)),
(1, '2024-01-02', CAST(0 AS BOOLEAN)),
(1, '2024-01-03', CAST(0 AS BOOLEAN)),
(1, '2024-01-04', CAST(0 AS BOOLEAN)),
(1, '2024-01-05', CAST(0 AS BOOLEAN)),
(1, '2024-01-06', CAST(0 AS BOOLEAN)),
(2, '2024-01-01', CAST(1 AS BOOLEAN)),
(2, '2024-01-02', CAST(1 AS BOOLEAN)),
(2, '2024-01-03', CAST(0 AS BOOLEAN)),
(2, '2024-01-04', CAST(1 AS BOOLEAN)),
(2, '2024-01-05', CAST(1 AS BOOLEAN)),
(3, '2024-01-01', CAST(1 AS BOOLEAN)),
(3, '2024-01-02', CAST(0 AS BOOLEAN)),
(3, '2024-01-03', CAST(1 AS BOOLEAN)),
(3, '2024-01-04', CAST(1 AS BOOLEAN)),
(3, '2024-01-05', CAST(1 AS BOOLEAN)),
(4, '2024-01-01', CAST(0 AS BOOLEAN)),
(4, '2024-01-02', CAST(0 AS BOOLEAN)),
(4, '2024-01-03', CAST(0 AS BOOLEAN)),
(4, '2024-01-04', CAST(0 AS BOOLEAN)),
(4, '2024-01-05', CAST(0 AS BOOLEAN)),
(4, '2024-01-06', CAST(1 AS BOOLEAN)),
(5, '2024-01-01', CAST(1 AS BOOLEAN)),
(5, '2024-01-02', CAST(0 AS BOOLEAN)),
(5, '2024-01-03', CAST(1 AS BOOLEAN)),
(5, '2024-01-04', CAST(1 AS BOOLEAN)),
(5, '2024-01-05', CAST(0 AS BOOLEAN));

--3--

CREATE TABLE public.Sales (
    SalespersonID INT,
    CustomerID INT,
    SaleDate DATE
);

ALTER TABLE public.Sales  OWNER to postgres;

INSERT INTO Sales (SalespersonID, CustomerID, SaleDate) VALUES
(1, 101, '2023-01-15'),
(2, 102, '2023-02-20'),
(3, 103, '2023-03-10'),
(1, 101, '2023-01-15'),
(1, 101, '2023-01-15'),
(3, 103, '2023-03-10'),
(4, 104, '2023-04-25'),
(1, 105, '2023-05-30'),
(3, 107, '2023-07-05'),
(4, 104, '2023-04-25'),
(4, 104, '2023-04-25'),
(4, 108, '2023-08-22'),
(2, 110, '2023-08-18'),
(2, 110, '2023-08-18'),
(2, 110, '2023-08-18'),
(2, 110, '2023-08-18'),
(1, 109, '2023-09-12'),
(2, 110, '2023-10-18'),
(2, 110, '2023-10-18'),
(2, 110, '2023-10-18'),
(2, 110, '2023-10-18'),
(3, 111, '2023-11-23'),
(4, 112, '2023-12-28'),
(4, 112, '2023-12-28'),
(4, 112, '2023-12-28'),
(1, 113, '2024-01-07'),
(2, 114, '2024-02-14'),
(2, 114, '2024-02-14'),
(2, 114, '2024-02-14'),
(2, 114, '2024-02-14'),
(3, 115, '2024-03-19'),
(3, 115, '2024-03-19'),
(3, 115, '2024-03-19'),
(4, 116, '2024-04-11'),
(4, 116, '2024-04-11'),
(4, 116, '2024-04-11'),
(4, 116, '2024-04-11'),
(4, 116, '2024-04-11'),
(1, 117, '2024-05-21'),
(2, 118, '2024-06-30'),
(2, 118, '2024-06-30'),
(2, 118, '2024-06-30'),
(3, 119, '2024-07-15'),
(3, 119, '2024-07-15'),
(4, 120, '2024-08-18'),
(1, 121, '2024-09-25'),
(1, 121, '2024-09-25'),
(1, 121, '2024-09-25'),
(1, 121, '2024-09-25'),
(2, 122, '2024-10-12'),
(2, 122, '2024-10-12'),
(2, 122, '2024-10-12'),
(2, 122, '2024-10-12'),
(4, 124, '2024-12-22'),
(4, 124, '2024-12-22'),
(1, 125, '2025-01-02'),
(1, 125, '2025-01-02'),
(1, 125, '2025-01-02');


--4--
CREATE TABLE public.WebsiteTraffic (
    PageID INT,
    VisitDate DATE,
    Visits INT
);

ALTER TABLE public.WebsiteTraffic  OWNER to postgres;

INSERT INTO WebsiteTraffic (PageID, VisitDate, Visits) VALUES
(1, '2024-01-01', 150),
(2, '2024-01-02', 120),
(3, '2024-01-03', 130),
(4, '2024-01-04', 110),
(5, '2024-01-05', 140),
(6, '2024-01-06', 100),
(7, '2024-01-07', 90),
(8, '2024-01-08', 80),
(1, '2024-01-09', 70),
(2, '2024-01-10', 160),
(3, '2024-01-11', 150),
(4, '2024-01-12', 140),
(5, '2024-01-13', 130),
(6, '2024-01-14', 120),
(7, '2024-01-15', 110),
(8, '2024-01-16', 100),
(1, '2024-02-01', 160),
(2, '2024-02-02', 150),
(3, '2024-02-03', 140),
(4, '2024-02-04', 130),
(5, '2024-02-05', 120),
(6, '2024-02-06', 110),
(7, '2024-02-07', 100),
(8, '2024-02-08', 90),
(1, '2024-03-01', 180),
(2, '2024-03-02', 170),
(3, '2024-03-03', 160),
(4, '2024-03-04', 150),
(5, '2024-03-05', 140),
(6, '2024-03-06', 130),
(7, '2024-03-07', 120),
(8, '2024-03-08', 110),
(1, '2024-04-01', 200),
(2, '2024-04-02', 190),
(3, '2024-04-03', 180),
(4, '2024-04-04', 170);


--5--
CREATE TABLE public.Rentals (
    RentalID INT PRIMARY KEY,
    CustomerID INT,
    RentalDate DATE,
    DueDate DATE,
    ReturnDate DATE
);

ALTER TABLE public.Rentals OWNER to postgres;

INSERT INTO Rentals (RentalID, CustomerID, RentalDate, DueDate, ReturnDate) VALUES
(1, 101, '2024-01-01', '2024-01-10', '2024-01-09'),
(2, 102, '2024-02-01', '2024-02-10', '2024-02-09'),
(3, 103, '2024-03-01', '2024-03-10', '2024-03-09'),
(4, 104, '2024-04-01', '2024-04-10', '2024-04-09'),
(5, 105, '2024-05-01', '2024-05-10', NULL), -- Overdue
(6, 106, '2024-01-15', '2024-01-25', '2024-01-24'),
(7, 107, '2024-02-15', '2024-02-25', '2024-02-24'),
(8, 108, '2024-03-15', '2024-03-25', '2024-03-24'),
(9, 109, '2024-04-15', '2024-04-25', NULL), -- Overdue
(10, 110, '2024-05-15', '2024-05-25', NULL), -- Overdue
(11, 111, '2024-01-20', '2024-01-30', '2024-01-29'),
(12, 112, '2024-02-20', '2024-02-29', '2024-02-28'),
(13, 113, '2024-03-20', '2024-03-30', '2024-03-29'),
(14, 114, '2024-04-20', '2024-04-30', NULL), -- Overdue
(15, 115, '2024-05-20', '2024-05-30', NULL), -- Overdue
(16, 116, '2024-01-25', '2024-02-04', '2024-02-03'),
(17, 117, '2024-02-25', '2024-03-06', '2024-03-05'),
(18, 118, '2024-03-25', '2024-04-04', '2024-04-03'),
(19, 119, '2024-04-25', '2024-05-05', NULL), -- Overdue
(20, 120, '2024-07-01', '2024-07-10', NULL), -- Not due yet
(21, 121, '2024-08-01', '2024-08-10', NULL), -- Not due yet
(22, 122, '2024-09-01', '2024-09-10', NULL), -- Not due yet
(23, 123, '2024-10-01', '2024-10-10', NULL), -- Not due yet
(24, 124, '2024-11-01', '2024-11-10', NULL), -- Not due yet
(25, 125, '2024-12-01', '2024-12-10', NULL); -- Not due yet


-- 6 --
CREATE TABLE public.OnlineExams (
    ExamID INT,
    StudentID INT,
    EnrollmentDate DATE,
    CompletionDate DATE,
    PRIMARY KEY (ExamID, StudentID)
);

ALTER TABLE public.OnlineExams OWNER to postgres;


INSERT INTO OnlineExams (ExamID, StudentID, EnrollmentDate, CompletionDate) VALUES
(1, 101, '2024-01-01', '2024-01-10'),
(2, 102, '2024-01-02', '2024-01-11'),
(3, 103, '2024-01-03', '2024-01-12'),
(4, 104, '2024-01-04', NULL), -- Not completed
(5, 105, '2024-01-05', '2024-01-15'),
(1, 106, '2024-01-06', '2024-01-16'),
(2, 107, '2024-01-07', NULL), -- Not completed
(3, 108, '2024-01-08', '2024-01-18'),
(4, 109, '2024-01-09', NULL), -- Not completed
(5, 110, '2024-01-10', '2024-01-20'),
(1, 111, '2024-02-01', '2024-02-10'),
(2, 112, '2024-02-02', '2024-02-11'),
(3, 113, '2024-02-03', '2024-02-12'),
(4, 114, '2024-02-04', '2024-02-13'),
(5, 115, '2024-02-05', NULL), -- Not completed
(1, 116, '2024-02-06', '2024-02-16'),
(2, 117, '2024-02-07', '2024-02-17'),
(3, 118, '2024-02-08', '2024-02-18'),
(4, 119, '2024-02-09', '2024-02-19'),
(5, 120, '2024-02-10', NULL), -- Not completed
(1, 121, '2024-03-01', '2024-03-10'),
(2, 122, '2024-03-02', '2024-03-11'),
(3, 123, '2024-03-03', '2024-03-12'),
(4, 124, '2024-03-04', '2024-03-13'),
(5, 125, '2024-03-05', NULL), -- Not completed
(1, 126, '2024-03-06', '2024-03-16'),
(2, 127, '2024-03-07', '2024-03-17'),
(3, 128, '2024-03-08', '2024-03-18'),
(4, 129, '2024-03-09', '2024-03-19'),
(5, 130, '2024-03-10', NULL); -- Not completed


--7--
CREATE TABLE public.CustomerReviews (
    CustomerID INT,
    ReviewDate DATE,
    Rating INT CHECK (Rating BETWEEN 1 AND 5)
);

ALTER TABLE public.CustomerReviews OWNER to postgres;


INSERT INTO CustomerReviews (CustomerID, ReviewDate, Rating) VALUES
(1, '2024-01-01', 5),
(2, '2024-01-02', 4),
(3, '2024-01-03', 3),
(4, '2024-01-04', 2),
(5, '2024-01-05', 1),
(1, '2024-02-01', 4),
(2, '2024-02-02', 5),
(3, '2024-02-03', 2),
(4, '2024-02-04', 3),
(5, '2024-02-05', 4),
(1, '2024-03-01', 3),
(2, '2024-03-02', 2),
(3, '2024-03-03', 4),
(4, '2024-03-04', 5),
(5, '2024-03-05', 3),
(1, '2024-04-01', 2),
(2, '2024-04-02', 3),
(3, '2024-04-03', 5),
(4, '2024-04-04', 1),
(5, '2024-04-05', 2),
(1, '2024-05-01', 1),
(2, '2024-05-02', 2),
(3, '2024-05-03', 3),
(4, '2024-05-04', 4),
(5, '2024-05-05', 5),
(1, '2024-06-01', 5),
(2, '2024-06-02', 4),
(3, '2024-06-03', 3),
(4, '2024-06-04', 2),
(5, '2024-06-05', 1);

--8--
CREATE TABLE public.Articles (
    ArticleID INT PRIMARY KEY,
    Title VARCHAR(255),
    PublishDate DATE,
    AuthorID INT
);

CREATE TABLE public.Likes (
    LikeID INT PRIMARY KEY,
    ArticleID INT,
    LikeDate DATE,
    FOREIGN KEY (ArticleID) REFERENCES Articles(ArticleID)
);

ALTER TABLE public.Articles OWNER to postgres;
ALTER TABLE public.Likes OWNER to postgres;

-- Insert articles
INSERT INTO Articles (ArticleID, Title, PublishDate, AuthorID) VALUES
(1, 'Understanding SQL Joins', '2024-07-01', 101),
(2, 'Introduction to Python Data Analysis', '2024-07-05', 102),
(3, 'Advanced Machine Learning Techniques', '2024-07-10', 103),
(4, 'Web Development Best Practices', '2024-07-15', 104),
(5, 'Data Visualization with Matplotlib', '2024-07-20', 105);

-- Insert likes (some within 2 weeks, some after)
INSERT INTO Likes (LikeID, ArticleID, LikeDate) VALUES
(1, 1, '2024-07-10'), -- Liked within 2 weeks
(2, 1, '2024-07-25'), -- Liked after 2 weeks
(3, 2, '2024-07-20'), -- Liked after 2 weeks
(4, 3, '2024-07-12'), -- Liked within 2 weeks
(5, 4, '2024-07-30'); -- Liked after 2 weeks

SELECT * FROM likes;


--9--

CREATE TABLE public.Membership (
    MemberID INT PRIMARY KEY,
    JoinDate DATE,
    ExpirationDate DATE
);

ALTER TABLE public.Membership OWNER to postgres;

-- Insert membership data
INSERT INTO Membership (MemberID, JoinDate, ExpirationDate) VALUES
-- January
(1, '2024-01-01', '2024-01-31'),
(2, '2024-01-05', '2024-01-15'),
(4, '2024-01-15', '2024-01-25'),
(5, '2024-01-20', '2024-01-30'),

-- February
(6, '2024-02-01', '2024-02-28'),
(7, '2024-02-05', '2024-02-15'),
(8, '2024-02-10', '2024-02-20'),
(10, '2024-02-20', '2024-02-28'),

-- March
(11, '2024-03-01', '2024-03-31'),
(12, '2024-03-05', '2024-03-15'),
(15, '2024-03-20', '2024-03-30'),

-- April
(16, '2024-04-01', '2024-04-30'),
(17, '2024-04-05', '2024-04-15'),


-- May
(18, '2024-04-10', '2024-05-20'),
(19, '2024-04-15', '2024-05-25'),
(20, '2024-04-20', '2024-05-28'),
(21, '2024-05-01', '2024-05-31'),
(22, '2024-05-05', '2024-05-15'),
(23, '2024-05-10', '2024-05-20'),
(24, '2024-05-15', '2024-05-25'),
(25, '2024-05-20', '2024-05-30'),

-- June
(28, '2024-06-10', '2024-06-20'),
(29, '2024-06-15', '2024-06-25'),
(30, '2024-06-20', '2024-06-28');

--10--
CREATE TABLE public.MuseumVisits (
    ExhibitID INT,
    ExhibitName VARCHAR(255),
    VisitorID INT,
    VisitDate DATE
);

ALTER TABLE public.MuseumVisits OWNER to postgres;

-- Insert museum visit data
INSERT INTO MuseumVisits (ExhibitID, ExhibitName, VisitorID, VisitDate) VALUES
-- October
(1, 'Ancient Artifacts', 101, '2024-10-01'),
(2, 'Dinosaurs Exhibit', 102, '2024-10-05'),
(1, 'Ancient Artifacts', 103, '2024-10-10'),
(3, 'Space Exploration', 104, '2024-10-15'),
(2, 'Dinosaurs Exhibit', 105, '2024-10-20'),

-- November
(4, 'Renaissance Paintings', 106, '2024-11-01'),
(1, 'Ancient Artifacts', 107, '2024-11-05'),
(5, 'Modern Sculptures', 108, '2024-11-10'),
(3, 'Space Exploration', 109, '2024-11-15'),
(2, 'Dinosaurs Exhibit', 110, '2024-11-20'),

-- December
(4, 'Renaissance Paintings', 111, '2024-12-01'),
(5, 'Modern Sculptures', 112, '2024-12-05'),
(1, 'Ancient Artifacts', 113, '2024-12-10'),
(3, 'Space Exploration', 114, '2024-12-15'),
(4, 'Renaissance Paintings', 115, '2024-12-20'),
(5, 'Modern Sculptures', 116, '2024-12-25');


--11--
CREATE TABLE public.Manufacturers (
    ManufacturerID SERIAL PRIMARY KEY,
    ManufacturerName VARCHAR(255) NOT NULL
);

CREATE TABLE public.Products (
    ProductID SERIAL PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    ManufacturerID INT NOT NULL,
    UnitsSold INT,
    FOREIGN KEY (ManufacturerID) REFERENCES Manufacturers(ManufacturerID)
);

ALTER TABLE public.Manufacturers OWNER to postgres;
ALTER TABLE public.Products OWNER to postgres;

-- Insert Manufacturers
INSERT INTO Manufacturers (ManufacturerName) VALUES
('Manufacturer A'),
('Manufacturer B'),
('Manufacturer C'),
('Manufacturer D'),
('Manufacturer E'),
('Manufacturer F'),
('Manufacturer G'),
('Manufacturer H'),
('Manufacturer I'),
('Manufacturer J');

-- Insert Products
INSERT INTO Products (ProductName, ManufacturerID, UnitsSold) VALUES
('Product 1', 1, 15000),
('Product 2', 1, 30000),
('Product 3', 2, 25000),
('Product 4', 3, 50000),
('Product 5', 3, 100000),
('Product 6', 4, 60000),
('Product 7', 5, 20000),
('Product 8', 6, 30000),
('Product 9', 7, 70000),
('Product 10', 8, 80000),
('Product 11', 9, 40000),
('Product 12', 10, 5000);


--12--
CREATE TABLE public.HotelBookings (
    BookingID SERIAL PRIMARY KEY,
    CheckInDate DATE NOT NULL,
    GuestID INT NOT NULL,
    HotelLocation VARCHAR(255) NOT NULL
);

ALTER TABLE public.HotelBookings OWNER to postgres;

-- Insert HotelBookings
INSERT INTO HotelBookings (CheckInDate, GuestID, HotelLocation) VALUES
-- Hotel Location A (Higher booking rate)
('2023-08-01', 1, 'Hotel Location A'),
('2023-08-05', 2, 'Hotel Location A'),
('2023-08-10', 3, 'Hotel Location A'),
('2023-08-15', 4, 'Hotel Location A'),
('2023-08-20', 5, 'Hotel Location A'),
('2023-08-25', 6, 'Hotel Location A'),
('2023-09-01', 7, 'Hotel Location A'),
('2023-09-05', 8, 'Hotel Location A'),
('2023-09-10', 9, 'Hotel Location A'),
('2023-09-15', 10, 'Hotel Location A'),
('2023-09-20', 11, 'Hotel Location A'),
('2023-09-25', 12, 'Hotel Location A'),
('2023-10-01', 13, 'Hotel Location A'),
('2023-10-05', 14, 'Hotel Location A'),
('2023-10-10', 15, 'Hotel Location A'),

-- Hotel Location B
('2023-07-01', 16, 'Hotel Location B'),
('2023-07-05', 17, 'Hotel Location B'),
('2023-07-10', 18, 'Hotel Location B'),
('2023-07-15', 19, 'Hotel Location B'),
('2023-07-20', 20, 'Hotel Location B'),
('2023-07-25', 21, 'Hotel Location B'),
('2023-08-01', 22, 'Hotel Location B'),
('2023-08-05', 23, 'Hotel Location B'),
('2023-08-10', 24, 'Hotel Location B'),

-- Hotel Location C
('2023-06-01', 25, 'Hotel Location C'),
('2023-06-05', 26, 'Hotel Location C'),
('2023-06-10', 27, 'Hotel Location C'),
('2023-06-15', 28, 'Hotel Location C'),
('2023-06-20', 29, 'Hotel Location C'),
('2023-06-25', 30, 'Hotel Location C'),
('2023-07-01', 31, 'Hotel Location C'),
('2023-07-05', 32, 'Hotel Location C'),
('2023-07-10', 33, 'Hotel Location C'),

-- Hotel Location D
('2023-05-01', 34, 'Hotel Location D'),
('2023-05-05', 35, 'Hotel Location D'),
('2023-05-10', 36, 'Hotel Location D'),
('2023-05-15', 37, 'Hotel Location D'),
('2023-05-20', 38, 'Hotel Location D'),
('2023-05-25', 39, 'Hotel Location D'),
('2023-06-01', 40, 'Hotel Location D'),
('2023-06-05', 41, 'Hotel Location D'),
('2023-06-10', 42, 'Hotel Location D'),
('2023-06-15', 43, 'Hotel Location D'),
('2023-06-20', 44, 'Hotel Location D'),
('2023-06-25', 45, 'Hotel Location D'),

-- Additional Bookings for Variety
('2023-10-01', 46, 'Hotel Location A'),
('2023-11-01', 47, 'Hotel Location B'),
('2023-12-01', 48, 'Hotel Location C'),
('2023-01-01', 49, 'Hotel Location D'),
('2023-02-01', 50, 'Hotel Location A');


--13--
CREATE TABLE public.device_types (
    device_type_id SERIAL PRIMARY KEY,
    device_name VARCHAR(255) NOT NULL,
    manufacturer VARCHAR(255) NOT NULL
);

CREATE TABLE public.response_times (
    request_id SERIAL PRIMARY KEY,
    response_time_ms DECIMAL(10, 3) NOT NULL,
    device_type_id INT NOT NULL,
    FOREIGN KEY (device_type_id) REFERENCES device_types(device_type_id)
);

ALTER TABLE public.device_types OWNER to postgres;
ALTER TABLE public.response_times OWNER to postgres;

-- Insert Device Types
INSERT INTO device_types (device_name, manufacturer) VALUES
('Device A', 'Manufacturer A'),
('Device B', 'Manufacturer B'),
('Device C', 'Manufacturer C');

-- Insert Response Times
INSERT INTO response_times (response_time_ms, device_type_id) VALUES
(120.123, 1),
(150.456, 1),
(130.789, 1),
(110.101, 1),
(140.202, 1),
(160.303, 1),
(170.404, 1),
(180.505, 1),
(190.606, 1),
(200.707, 1),

(210.808, 2),
(220.909, 2),
(230.010, 2),
(240.111, 2),
(250.212, 2),
(260.313, 2),
(270.414, 2),
(280.515, 2),
(290.616, 2),
(300.717, 2),

(310.818, 3),
(320.919, 3),
(330.020, 3),
(340.121, 3),
(350.222, 3),
(360.323, 3),
(370.424, 3),
(380.525, 3),
(390.626, 3),
(400.727, 3);

--13--
CREATE TABLE public.daily_visits (
    visit_date DATE PRIMARY KEY,
    visit_count INT NOT NULL
);

ALTER TABLE public.daily_visits OWNER to postgres;

-- Insert Daily Visits
INSERT INTO daily_visits (visit_date, visit_count) VALUES
('2023-07-01', 120),
('2023-07-02', 150),
('2023-07-03', 130),
('2023-07-04', 110),
('2023-07-05', 140),
('2023-07-06', 160),
('2023-07-07', 170),
('2023-07-08', 180),
('2023-07-09', 190),
('2023-07-10', 200),
('2023-07-11', 210),
('2023-07-12', 220),
('2023-07-13', 230),
('2023-07-14', 240),
('2023-07-15', 250),
('2023-07-16', 260),
('2023-07-17', 270),
('2023-07-18', 280),
('2023-07-19', 290),
('2023-07-20', 300);


--15--

CREATE TABLE public.stock_prices (
    date DATE NOT NULL,
    stock_symbol VARCHAR(10) NOT NULL,
    closing_price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (date, stock_symbol)
);

ALTER TABLE public.stock_prices OWNER to postgres;

-- Insert Stock Prices
INSERT INTO stock_prices (date, stock_symbol, closing_price) VALUES
('2024-01-01', 'AAPL', 150.50),
('2024-01-01', 'GOOG', 2800.75),
('2024-01-01', 'META', 340.20),
('2024-01-01', 'MSFT', 310.65),

('2024-01-02', 'AAPL', 151.00),
('2024-01-02', 'GOOG', 2810.55),
('2024-01-02', 'META', 341.10),
('2024-01-02', 'MSFT', 312.40),

-- Add additional entries as needed...

('2024-06-30', 'AAPL', 165.45),
('2024-06-30', 'GOOG', 2900.80),
('2024-06-30', 'META', 355.35),
('2024-06-30', 'MSFT', 330.25);


--16--
-- Create Tables
CREATE TABLE public.categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

CREATE TABLE public.cat_products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    category_id INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

ALTER TABLE public.categories OWNER to postgres;
ALTER TABLE public.cat_products OWNER to postgres;

-- Insert Categories
INSERT INTO categories (category_name) VALUES
('Electronics'),
('Furniture'),
('Clothing'),
('Books');

-- Insert Products
INSERT INTO cat_products (product_name, category_id, price) VALUES
('Laptop', 1, 999.99),
('Smartphone', 1, 799.99),
('Tablet', 1, 499.99),
('Sofa', 2, 299.99),
('Dining Table', 2, 399.99),
('Chair', 2, 49.99),
('T-shirt', 3, 19.99),
('Jeans', 3, 49.99),
('Jacket', 3, 79.99),
('Novel', 4, 9.99),
('Textbook', 4, 59.99),
('Magazine', 4, 4.99);

--17--

-- Create Table
CREATE TABLE customer_spending (
    customer_id INT PRIMARY KEY,
    total_spend DECIMAL(10, 2) NOT NULL
);

ALTER TABLE public.customer_spending OWNER to postgres;

-- Insert Customer Spending
INSERT INTO customer_spending (customer_id, total_spend) VALUES
(1, 150.75),
(2, 200.50),
(3, 320.00),
(4, 275.30),
(5, 400.00),
(6, 180.60),
(7, 240.90),
(8, 310.40),
(9, 215.85),
(10, 135.70),
(11, 250.25),
(12, 195.55),
(13, 280.90),
(14, 360.10),
(15, 275.75),
(16, 430.20),
(17, 220.00),
(18, 310.55),
(19, 150.00),
(20, 275.50),
(21, 345.90),
(22, 190.25),
(23, 265.75),
(24, 430.60),
(25, 305.45),
(26, 275.00),
(27, 350.80),
(28, 190.50),
(29, 310.90),
(30, 225.00);

--18--

-- Create Table
CREATE TABLE public.daily_active_users (
    activity_date DATE PRIMARY KEY,
    user_count INT NOT NULL
);

ALTER TABLE public.daily_active_users OWNER to postgres;

-- Insert Daily Active Users
INSERT INTO daily_active_users (activity_date, user_count) VALUES
('2024-01-01', 150),
('2024-01-02', 175),
('2024-01-03', 160),
('2024-01-04', 180),
('2024-01-05', 200),
('2024-01-06', 210),
('2024-01-07', 190),
('2024-01-08', 220),
('2024-01-09', 230),
('2024-01-10', 240),
('2024-01-11', 250),
('2024-01-12', 270),
('2024-01-13', 280),
('2024-01-14', 290),
('2024-01-15', 300);


--19--

-- Create Table
CREATE TABLE public.sales_mtd (
    sale_id SERIAL PRIMARY KEY,
    sale_date DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL
);

ALTER TABLE public.sales_mtd OWNER to postgres;

-- Insert Sales Data
INSERT INTO sales_mtd (sale_date, amount) VALUES
--Jan
('2024-01-01', 250.75),
('2024-01-01', 230.75),
('2024-01-02', 210.40),
('2024-01-02', 310.40),
('2024-01-03', 180.20),
('2024-01-03', 120.20),
('2024-01-04', 275.55),
('2024-01-05', 320.60),

--Feb
('2024-02-07', 410.30),
('2024-02-08', 200.00),
('2024-02-09', 315.85),
('2024-02-10', 200.75),
('2024-02-10', 280.75),
('2024-02-11', 295.10),
('2024-02-12', 330.00),
('2024-02-13', 150.50),
('2024-02-14', 275.20),
('2024-02-15', 310.90),

--June
('2024-06-01', 250.75),
('2024-06-01', 230.75),
('2024-06-02', 210.40),
('2024-06-02', 310.40),
('2024-06-03', 180.20),
('2024-06-03', 120.20),
('2024-06-04', 275.55),
('2024-06-05', 320.60),
('2024-06-06', 290.45),
('2024-06-07', 410.30),
('2024-06-08', 200.00),
('2024-06-09', 315.85),
('2024-06-10', 200.75),
('2024-06-10', 280.75),
('2024-06-11', 295.10),
('2024-06-12', 330.00),
('2024-06-13', 150.50),
('2024-06-14', 275.20),
('2024-06-15', 310.90);


--20--

-- Create Tables
CREATE TABLE public.employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(255) NOT NULL
);

CREATE TABLE public.employee_sales (
    employee_id INT NOT NULL,
    department_id INT NOT NULL,
    sales_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

ALTER TABLE public.employees OWNER to postgres;
ALTER TABLE public.employee_sales OWNER to postgres;


-- Insert Employees
INSERT INTO employees (employee_name) VALUES
-- Department 1
('Alice Smith'), ('Bob Johnson'), ('Charlie Brown'), ('Diana Green'), ('Emily White'), ('Frank Black'),
-- Department 2
('Grace Harris'), ('Henry Clark'), ('Ivy Lewis'), ('Jack Martinez'), ('Karen Young'), ('Liam Walker'),
-- Department 3
('Mia Hall'), ('Nathan Allen'), ('Olivia King'), ('Paul Wright'), ('Quincy Scott'), ('Rachel Adams');

-- Insert Employee Sales
INSERT INTO employee_sales (employee_id, department_id, sales_amount) VALUES
-- Sales for Department 1
(1, 1, 5000.00), (2, 1, 4500.00), (3, 1, 5200.00), (4, 1, 4800.00), (5, 1, 5100.00), (6, 1, 4900.00),
-- Sales for Department 2
(7, 2, 6000.00), (8, 2, 6200.00), (9, 2, 5900.00), (10, 2, 6100.00), (11, 2, 6050.00), (12, 2, 5800.00),
-- Sales for Department 3
(13, 3, 5500.00), (14, 3, 5600.00), (15, 3, 5400.00), (16, 3, 5700.00), (17, 3, 5800.00), (18, 3, 5500.00);


--21--
-- Create Table
CREATE TABLE public.employee_positions (
    employee_id INT NOT NULL,
    position VARCHAR(255) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    PRIMARY KEY (employee_id, position, start_date),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

ALTER TABLE public.employee_positions OWNER to postgres;

-- Insert Employee Positions
INSERT INTO employee_positions (employee_id, position, start_date, end_date) VALUES
-- Employee 1
(1, 'Sales Representative', '2023-01-01', '2023-06-30'),
(1, 'Senior Sales Representative', '2023-07-01', '2024-01-31'),
(1, 'Sales Manager', '2024-02-01', NULL),
-- Employee 2
(2, 'Marketing Coordinator', '2023-01-01', '2023-12-31'),
(2, 'Marketing Manager', '2024-01-01', '2024-06-30'),
(2, 'Marketing Director', '2024-07-01', NULL),
-- Employee 3
(3, 'Software Engineer', '2023-01-01', '2023-09-30'),

-- Employee 4
(4, 'HR Assistant', '2023-01-01', '2023-05-31'),
(4, 'HR Specialist', '2023-06-01', '2023-12-31'),
(4, 'HR Manager', '2024-01-01', NULL);



--22--
-- Create Tables
CREATE TABLE public.customer_info (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    signup_date DATE NOT NULL
);

CREATE TABLE public.customer_transactions (
    transaction_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    transaction_date DATE NOT NULL,
    transaction_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer_info(customer_id)
);

ALTER TABLE public.customer_info OWNER to postgres;
ALTER TABLE public.customer_transactions OWNER to postgres;

-- Insert Customer Info
INSERT INTO customer_info (customer_name, signup_date) VALUES
('Alice Johnson', '2022-01-15'),
('Bob Smith', '2024-03-22'),
('Charlie Brown', '2024-04-10'),
('Diana Green', '2023-06-05'),
('Emily White', '2023-07-19');

-- Insert Customer Transactions
INSERT INTO customer_transactions (customer_id, transaction_date, transaction_amount) VALUES
-- Transactions for Customer 1 (Alice Johnson)
(1, '2024-01-01', 120.50),
(1, '2024-01-15', 75.00),
(1, '2024-02-01', 200.00),
(1, '2024-03-20', 155.00),
(1, '2024-03-25', 175.00),



-- Transactions for Customer 2 (Bob Smith)
(2, '2024-01-10', 300.00),
(2, '2024-01-20', 150.00),

-- Transactions for Customer 3 (Charlie Brown)
(3, '2024-01-05', 500.00),
(3, '2024-01-25', 80.00),
(3, '2024-02-15', 50.00),


-- Transactions for Customer 4 (Diana Green)
(4, '2024-01-12', 90.00),
(4, '2024-02-02', 60.00),
(4, '2024-02-20', 120.00),
(4, '2024-01-05', 200.00),
(4, '2024-01-25', 70.00),
(4, '2024-02-15', 150.00),
(4, '2024-03-10', 170.00),

-- Transactions for Customer 5 (Emily White)
(5, '2024-01-18', 210.00),
(5, '2024-02-10', 300.00),
(5, '2024-02-28', 150.00),
(5, '2024-03-28', 140.00),
(5, '2024-04-01', 500.00),
(5, '2024-05-01', 600.00);


