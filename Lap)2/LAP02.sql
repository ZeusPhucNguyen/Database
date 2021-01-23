CREATE DATABASE LAB02
GO

USE LAB02
GO

CREATE TABLE  Product(
STT INT IDENTITY,
TenHang VARCHAR(40),
MoTaHang VARCHAR(60),
DonVi VARCHAR(20),
GiaTien MONEY
)
GO
INSERT INTO Product(TenHang,MoTaHang,DonVi,GiaTien) VALUES('May Tinh T450','May Nhap Moi','Chiec',1000);
INSERT INTO Product(TenHang,MoTaHang,DonVi,GiaTien) VALUES('Dien Thoai Nokia 5670','Dien Thoai dang Hot','Chiec',200);
INSERT INTO Product(TenHang,MoTaHang,DonVi,GiaTien) VALUES('May In SamSung 450','May In dang e','Chiec',100);
GO
SELECT*FROM Product
GO

USE LAB02
GO

CREATE TABLE Category(
STT INT IDENTITY,
TenSP VARCHAR(40),
)
GO
INSERT INTO Category(TenSP) VALUES('MAY TINH');
INSERT INTO Category(TenSP) VALUES('DIEN THOAI');
INSERT INTO Category(TenSP) VALUES('MAY IN');
INSERT INTO Category(TenSP) VALUES('DIEU HOA');
INSERT INTO Category(TenSP) VALUES('MAY ANH');
GO
SELECT*FROM Category
GO

USE LAB02
GO

CREATE TABLE Orders(
MaDonHang INT,
MaKhachHang INT,
NgayDatHang DATETIME
)
GO
INSERT INTO Orders(MaDonHang,MaKhachHang,NgayDatHang) VALUES('123',1,'11/18/09');
INSERT INTO Orders(MaDonHang,MaKhachHang,NgayDatHang) VALUES('113',2,'12/15/10');
INSERT INTO Orders(MaDonHang,MaKhachHang,NgayDatHang) VALUES('151',3,'09/18/10');
INSERT INTO Orders(MaDonHang,MaKhachHang,NgayDatHang) VALUES('156',2,'05/04/09');
INSERT INTO Orders(MaDonHang,MaKhachHang,NgayDatHang) VALUES('196',3,'04/05/09');
GO

SELECT*FROM Orders
GO

USE LAB02
GO

CREATE TABLE OrderDetails(
TenHang VARCHAR(40),
SoLuong INT,
ThanhTien MONEY
)
GO
INSERT INTO OrderDetails(TenHang,SoLuong,ThanhTien) VALUES('May Tinh T450',1,1000);
INSERT INTO OrderDetails(TenHang,SoLuong,ThanhTien) VALUES('Dien Thoai Nokia5670',2,400);
INSERT INTO OrderDetails(TenHang,SoLuong,ThanhTien) VALUES('May In SamSung 450',1,100);
GO

SELECT*FROM OrderDetails
GO

USE LAB02
GO

CREATE TABLE Customer(
MaKhachHang INT,
NguoiDatHang VARCHAR(40),
DiaChi VARCHAR(50),
DienThoai INT
)
GO
INSERT INTO Customer(MaKhachHang,NguoiDatHang,DiaChi,DienThoai)VALUES(1,'Nguyen Van An','111 NguyenTrai , Thanh Xuan , Ha Noi',987654321);
INSERT INTO Customer(MaKhachHang,NguoiDatHang,DiaChi,DienThoai)VALUES(2,'Nguyen Thuy Duong','T78 Thanh Oai,Ha Noi',123456789);
INSERT INTO Customer(MaKhachHang,NguoiDatHang,DiaChi,DienThoai)VALUES(3,'Vu Ngoc Linh Chi','09 Nham Chinh , Dong Da , Ha Noi',1297652214);

GO
SELECT*FROM Customer
GO

--4
SELECT NguoiDatHang FROM Customer
GO
SELECT TenSP FROM Category
GO
SELECT MaDonHang FROM Orders
GO
