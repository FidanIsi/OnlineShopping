CREATE DATABASE SALES
go

USE SALES 
go

CREATE TABLE Users(
ID INT IDENTITY PRIMARY KEY,
FirstName VARCHAR(255),
LastName VARCHAR(255),
Email VARCHAR (255) UNIQUE,
Password VARCHAR (50),
IsActive BIT
)

CREATE TABLE UserDetails(
ID INT IDENTITY PRIMARY KEY,
UserID INT UNIQUE FOREIGN KEY REFERENCES Users(ID),
PhoneNumber NVARCHAR(50),
Address VARCHAR (50)
)

CREATE TABLE Products(
ID INT IDENTITY PRIMARY KEY,
Name VARCHAR(255),
Price MONEY
)

CREATE TABLE Orders(
ID INT IDENTITY PRIMARY KEY,
UserID INT FOREIGN KEY REFERENCES Users(ID),
ExecutedDate DATE
)

CREATE TABLE OrderItems(
ID INT IDENTITY PRIMARY KEY,
OrderID INT FOREIGN KEY REFERENCES Orders(ID),
ProductID INT FOREIGN KEY REFERENCES Products(ID),
)
go

INSERT INTO Users VALUES 
('Tag', 'Jones', 'tag.jones@email.com', 'younger', 0),
('Chandler', 'Bing', 'chandler.bing@outlook.com', 'MurielBing', 1),
('Joey', 'Tribbiani', 'joey@email.com', 'howudoing', 1),
('Monica', 'Geller', 'monica.geller@email.com', 'password123', 0),
('Rachel', 'Green', 'rachel@email.com', 'password123', 1),
('Phoebe', 'Buffay', 'phoebe.buffay@email.com', 'smellycat', 0);

INSERT INTO UserDetails VALUES 
(1, '1234567890', '123 Main St'),
(2, '9876543210', '456 Oak Ave'),
(3, '5551112222', '789 Elm St'),
(4, '4443332222', '101 Pine Rd'),
(5, '9998887777', '202 Maple Ave');

INSERT INTO Products VALUES 
('T-shirt', 19.99),
('Skort', 29.99),
('Sweatshirt', 14.99),
('Short', 39.99),
('Aviator jacket', 24.99);

INSERT INTO Orders VALUES 
(1, '2023-01-01'),
(2, '2023-02-15'),
(3, '2023-03-10'),
(4, '2023-11-20'),
(5, '2023-11-05');

INSERT INTO OrderItems VALUES 
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5);
go

SELECT * FROM Users WHERE FirstName like 'T%';
SELECT * FROM Products WHERE Price > 30
SELECT * FROM Orders WHERE YEAR(ExecutedDate) = '2023' AND MONTH(ExecutedDate) = '11'
