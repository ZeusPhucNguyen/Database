IF EXISTS (SELECT * FROM sys.databases WHERE Name LIKE 'BookLibrary')
DROP DATABASE BookLibrary

CREATE DATABASE BookLibrary
GO

USE BookLibrary
GO
CREATE TABLE Book(
BookCode INT  IDENTITY,
BookTitle VARCHAR(100),
Author VARCHAR(50),
Edition INT,
BookPrice MONEY CHECK (BookPrice >0 AND BookPrice <200),
Copies INT,
)
GO
ALTER TABLE Book
ADD CONSTRAINT PK_BOOK
PRIMARY KEY (BookCode)
GO

INSERT INTO Book(BookTitle,Author,Edition,BookPrice,Copies) VALUES('Nghin le mot dem','Andecxen',2,50,1);
INSERT INTO Book(BookTitle,Author,Edition,BookPrice,Copies) VALUES('Truyen Kieu','Nguyen Du',6,20,5);
INSERT INTO Book(BookTitle,Author,Edition,BookPrice,Copies) VALUES('Nhat ki trong tu','Ho Chi Minh',3,100,3);
INSERT INTO Book(BookTitle,Author,Edition,BookPrice,Copies) VALUES('Binh Ngo Dai Cao','Nguyen Trai',12,35,2);
INSERT INTO Book(BookTitle,Author,Edition,BookPrice,Copies) VALUES('De Men Phieu Luu Ki','To Hoai',5,40,3);
INSERT INTO Book(BookTitle,Author,Edition,BookPrice,Copies) VALUES('300 bai code thieu nhi','Kim Thi',1,35,10);
INSERT INTO Book(BookTitle,Author,Edition,BookPrice,Copies) VALUES('Mat Biec','Victor Vu',4,5,8);
INSERT INTO Book(BookTitle,Author,Edition,BookPrice,Copies) VALUES('Khong gia dinh','Hector Malox',3,60,2);
GO
SELECT* FROM Book
GO

USE BookLibrary
GO

CREATE TABLE Member(
MemberCode INT IDENTITY,
Name VARCHAR(50),
Address VARCHAR(100),
PhoneNumber INT,
)
GO

ALTER TABLE Member
ADD CONSTRAINT PK_MEMBER
PRIMARY KEY (MemberCode)
GO


INSERT INTO Member(Name,Address,PhoneNumber)VALUES('DANG KIM THI','94 HAI BA TRUNG - HA NOI',0912345124);
INSERT INTO Member(Name,Address,PhoneNumber)VALUES('PHUC NGUYEN',' NAM TU LIEM - HA NOI',0976560592);
INSERT INTO Member(Name,Address,PhoneNumber)VALUES('MAI LAN ANH','111 NGUYEN CHI THANH - HA NOI',0281493821);
INSERT INTO Member(Name,Address,PhoneNumber)VALUES('VU NGOC LINH CHI','DUONG NOI - HA NOI',01297652214);
INSERT INTO Member(Name,Address,PhoneNumber)VALUES('NGUYEN THUY DUONG','T78 VIET LAO - HA NOI',0593105382);
GO
SELECT*FROM Member
GO

USE BookLibrary
GO

CREATE TABLE IssueDetails(
BookCode INT NOT NULL,
MemberCode INT NOT NULL,
IssueDate DATETIME,
ReturnDate DATETIME,
CONSTRAINT mk FOREIGN KEY (BookCode) REFERENCES Book(BookCode),
CONSTRAINT sk FOREIGN KEY (MemberCode) REFERENCES Member(MemberCode),
)
GO
INSERT INTO IssueDetails(BookCode,MemberCode,IssueDate,ReturnDate) VALUES(4,1,'01-01-2021','03-01-2021');
INSERT INTO IssueDetails(BookCode,MemberCode,IssueDate,ReturnDate) VALUES(8,2,'05-02-2021','09-02-2021');
INSERT INTO IssueDetails(BookCode,MemberCode,IssueDate,ReturnDate) VALUES(5,4,'03-04-2021','03-05-2021');
INSERT INTO IssueDetails(BookCode,MemberCode,IssueDate,ReturnDate) VALUES(1,3,'05-04-2021','06-04-2021');
INSERT INTO IssueDetails(BookCode,MemberCode,IssueDate,ReturnDate) VALUES(6,5,'02-01-2021','09-01-2021');
GO
SELECT*FROM IssueDetails
GO

ALTER TABLE IssueDetails DROP CONSTRAINT mk ;
GO
ALTER TABLE IssueDetails DROP CONSTRAINT sk;
GO

ALTER TABLE Book DROP CONSTRAINT PK_BOOK;
GO

ALTER TABLE Member DROP CONSTRAINT PK_MEMBER;
GO
ALTER TABLE IssueDetails ADD CONSTRAINT mk 
FOREIGN KEY (BookCode) 
REFERENCES Book(BookCode)
GO

ALTER TABLE IssueDetails ADD CONSTRAINT sk 
FOREIGN KEY (MemberCode) 
REFERENCES Member(MemberCode)
GO


