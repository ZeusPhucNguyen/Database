CREATE DATABASE ASM3
GO

USE ASM3
GO

CREATE TABLE Customer(
CusID INT PRIMARY KEY,
TenKhachHang VARCHAR(40),
CCCD INT,
DiaChi VARCHAR(40),
)
GO

CREATE TABLE DonDichVu(
CusID INT ,
SoThueBao INT,
LoaiThueBao VARCHAR(40),
NgayDangKi DATETIME,
CONSTRAINT tk FOREIGN KEY (CusID) REFERENCES Customer(CusID)
)

INSERT INTO Customer(CusID,TenKhachHang,CCCD,DiaChi)VALUES(1,'Nguyen Nguyet Nga',123456789,'Ha Noi');
INSERT INTO Customer(CusID,TenKhachHang,CCCD,DiaChi)VALUES(2,'Nguyen Thuy Duong',123456733,'Lang Son');
INSERT INTO Customer(CusID,TenKhachHang,CCCD,DiaChi)VALUES(3,'Mai Lan Anh',123441789,'Thanh Hoa');
GO

INSERT INTO DonDichVu(CusID,SoThueBao,LoaiThueBao,NgayDangKi)VALUES(1,123456789,'TRA TRUOC','12/12/02');
INSERT INTO DonDichVu(CusID,SoThueBao,LoaiThueBao,NgayDangKi)VALUES(1,123456722,'TRA SAU','11/12/02');
INSERT INTO DonDichVu(CusID,SoThueBao,LoaiThueBao,NgayDangKi)VALUES(2,121156789,'TRA TRUOC','12/08/02');
GO

--4
SELECT* FROM Customer
GO
SELECT*FROM DonDichVu
GO
--5
SELECT * FROM Customer
WHERE CCCD = 123456789;
GO
 SELECT* FROM DonDichVu
 WHERE NgayDangKi = '12/12/09';
 GO
 SELECT*FROM Customer
 WHERE DiaChi = 'Ha Noi'
 GO

--6
SELECT COUNT (TenKhachHang) FROM Customer
GO

SELECT COUNT ( SoThueBao) FROM DonDichVu
GO

SELECT COUNT ( SoThueBao) FROM DonDichVu
WHERE NgayDangKi = '12/12/09';
GO
