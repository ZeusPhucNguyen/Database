CREATE DATABASE Lab11
GO
USE Lab11

CREATE VIEW ProductList
AS
SELECT ProductID, Name FROM AdventureWorks2019.Production.Product

SELECT * FROM ProductList

CREATE VIEW SalesOrderDetail
AS
SELECT pr.ProductID, pr.Name, od.UnitPrice, od.OrderQty,
od.UnitPrice*od.OrderQty as [Total Price]
FROM AdventureWorks2019.Sales.SalesOrderDetail od
JOIN AdventureWorks2019.Production.Product pr
ON od.ProductID=pr.ProductID

SELECT * FROM SalesOrderDetail

--Tao khung nhin lay ra thong tin co ban torng bang Person.Contact
USE AdventureWorks2019
CREATE VIEW V_Contact_Info AS
SELECT FirstName,MiddleName,LastName
FROM Person.Person
GO
--Tao khung nhin lay ra thong tin ve nhan vien 
CREATE VIEW V_Employee_Contact AS
SELECT p.FirstName, p.LastName,e.BusinessEntityID,e.HireDate
FROM HumanResources.Employee e
JOIN Person.Person AS p ON e.BusinessEntityID = p.BusinessEntityID;
GO
--xem mot khung nhin
SELECT*FROM V_Employee_Contact
GO
--Thay doi khung nhin V-Employee_Contact bang viet them cot Birthdate
ALTER VIEW V_Employee_Contact AS
SELECT p.FirstName,p.LastName,e.BusinessEntityID,e.HireDate,e.Birthdate
FROM HumanResources.Employee e
JOIN Person.Person AS p ON e.BusinessEntityID = p.BusinessEntityID
WHERE p.FirstName LIKE '%B%';
GO
--Xoa mot khung nhin
DROP VIEW V_Contact_Info
GO
--xem dinh nghia khung nhin V_Employee_Contact
EXECUTE sp_helptext 'V_Employee_Contact'
--xem cac thanh phan ma khung nhin phu thuoc
EXECUTE sp_depends 'V_Employee_Contact'
GO

-- tao khung nhin an ma dinh nghia bi an di ( khong xem duoc dinh nghia khung nhin)
CREATE VIEW OrderRejects
WITH ENCRYPTION
AS
SELECT PurchaseOrderID,ReceivedQty,RejectedQty,
RejectedQty/ReceivedQty AS RejectRatio,DueDate
FROM Purchasing.PurchaseOrderDetail
WHERE RejectedQty/ ReceivedQty >0
AND DueDate > CONVERT (DATETIME,'20010630',101);
--Khong xem duoc dinh nghia khung nhin V_Contact_Info
sp_helptext 'OrderRejects'
GO
--Thay doi khung nhin them tuy chon CHECK OPTION 
ALTER VIEW V_Employee_Contact AS 
SELECT p.FirstName , p.LastName,e.BusinessEntityID,e.HireDate
FROM HumanResources.Employee e
JOIN Person.Person AS p ON e.BusinessEntityID = p.BusinessEntityID
WHERE p.FirstName like '%A%'
WITH CHECK OPTION
GO
SELECT*FROM V_Employee_Contact
--cap nhat duoc khung nhin khi FirstName bat dau bang ki tu 'A'
UPDATE V_Employee_Contact SET FirstName = 'Atest' WHERE LastName='Amy'
--Khong cap nhat duoc khung nhin khi FirstName bat dau bang ki tu khac 'A'
UPDATE V_Employee_Contact SET FirstName='BCD' WHERE LastName='Atest'
GO
--Phai xoa khung nhin truoc
DROP VIEW V_Contact_Info
GO
-- tao khung nhin co gian do
CREATE VIEW V_Contact_Info WITH SCHEMABINDING AS
SELECT FirstName,MiddleName,LastName,EmailAddress
FROM Person.Contact
GO
--Khong the truy van duoc khung nhin co ten la V_Contact_Info
SELECT*FROM V_Contact_Info
Go
--tao chi muc duy nhat tren cot EmailAddress tren khung nhin V_Contact_Info
CREATE UNIQUE CLUSTERED INDEX IX_Contact_Email
ON V_Contact_Info(EmailAddress)
GO
-thuc hien doi ten khung nhin
exec sp_rename V_Contact_Info,V_Contact_Infomation
--truy van khung nhin
select*from V_Contact_Infomation
--khong the them ban ghi vao khung nhin
--vi co cot khong cho phep NULL trong bang Contact
INSERT INTO V_Contact_Infomation values('ABC','DEF','GHI','abc@yahoo.com')
--khong the xoa ban ghi cua khugn nhin V_contact_infomation
--vi bang Person.Contact con co cac khoa ngoai
DELETE FROM V_Contact_Infomation WHERE LastName = 'Gilbert' and FirstName='Guy'


