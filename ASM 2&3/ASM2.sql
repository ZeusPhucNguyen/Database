 CREATE DATABASE ASM2
 GO
USE ASM2
GO

CREATE TABLE Product(
ProID INT IDENTITY,
Name VARCHAR(40),
Description VARCHAR(50),
Unit NVARCHAR(10),
Price MONEY,
Qty INT,
CatID VARCHAR(40),
)
GO

INSERT INTO Product(Name,Description,Unit,Price,Qty,CatID)VALUES('T450','May nhap cu','chiec',1000,10,'MT1');
INSERT INTO Product(Name,Description,Unit,Price,Qty,CatID)VALUES('Nokia5670','Dien thoai dang hot','chiec',200,200,'DT2');
INSERT INTO Product(Name,Description,Unit,Price,Qty,CatID)VALUES('SamSung450','May In dang loai binh','chiec',100,10,'MI3');
GO

SELECT*FROM Product

USE ASM2
GO
CREATE TABLE Category(
CatID VARCHAR(40),
Name VARCHAR(40),
TenHang VARCHAR(40),
)
GO

INSERT INTO Category(CatID,Name,TenHang)VALUES('MT1','T450','Asus');
INSERT INTO Category(CatID,Name,TenHang)VALUES('DT2','Nokia5670','Asus');
INSERT INTO Category(CatID,Name,TenHang)VALUES('MI3','SamSung450','Asus');
GO

SELECT*FROM Category

CREATE TABLE NhanHang(
MaSoHang INT,
TenHang VARCHAR(40),
DiaChi VARCHAR(40),
DienThoai INT,
)
GO

INSERT INTO NhanHang(MaSoHang,TenHang,DiaChi,DienThoai)VALUES(123,'Asus','USA',983232);
INSERT INTO NhanHang(MaSoHang,TenHang,DiaChi,DienThoai)VALUES(124,'SamSung','Korean',982532);
INSERT INTO NhanHang(MaSoHang,TenHang,DiaChi,DienThoai)VALUES(125,'Apple','USA',967232);
GO

SELECT*FROM NhanHang
GO

--4
SELECT (TenHang) FROM NhanHang
GO

SELECT (Name) FROM Category
GO

--5
SELECT TenHang FROM NhanHang
ORDER BY TenHang DESC;
GO

SELECT Name,Price FROM Product
ORDER BY Price DESC;
GO

SELECT * FROM NhanHang
WHERE TenHang = 'Asus';
GO

SELECT Name,Qty FROM Product
WHERE Qty < 11;
GO
SELECT Name FROM Product
GO
--6
SELECT COUNT (TenHang)FROM NhanHang
GO

SELECT COUNT (Name) FROM Product
GO

SELECT COUNT (NAME)
FROM Category
WHERE TenHang ='Asus';
GO
SELECT COUNT (NAME)
FROM Category
WHERE TenHang ='SamSung';
GO

SELECT SUM(Qty)
FROM Product
GO
--7
ALTER TABLE Product ADD CONSTRAINT Price Check(Price>0)
GO