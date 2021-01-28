CREATE DATABASE ASM3Phan2
GO
USE ASM3Phan2
GO

CREATE TABLE Student(
StudentNo INT,
StudentName NVARCHAR(50),
StudentAddress NVARCHAR(100),
PhoneNo INT,
CONSTRAINT PK_Student PRIMARY KEY (StudentNo),
)
CREATE TABLE Department(
DeptNo INT,
DeptName NVARCHAR(50),
ManagerName NVARCHAR(30),
CONSTRAINT PK_Department PRIMARY KEY (DeptNo),
)
CREATE TABLE Assignment(
AssignmentNo INT,
Description NVARCHAR(100),
CONSTRAINT PK_Assignment PRIMARY KEY (AssignmentNo),
)
CREATE TABLE Works_Assign(
JobID INT,
StudentNo INT,
AssignmentNo INT,
TotalHours INT,
JobDetails NVARCHAR(450),
CONSTRAINT PK_Works PRIMARY KEY (JobID),
CONSTRAINT FK_Student FOREIGN KEY(StudentNo) REFERENCES Student(StudentNo),
CONSTRAINT FK_Assignment FOREIGN KEY(Assignment) REFERENCES Assignment(AssignmentNo),
)

INSERT INTO Student(StudentNo,StudentName,StudentAddress,PhoneNo)VALUES(1,'Nguyễn Ngọc Bảo Phúc','Nam Từ Liêm,Hà Nội',976560592);
INSERT INTO Student(StudentNo,StudentName,StudentAddress,PhoneNo)VALUES(2,'Nguyễn Thanh Nam','Bắc Từ Liêm,Hà Nội',976544292);
INSERT INTO Student(StudentNo,StudentName,StudentAddress,PhoneNo)VALUES(3,'Nguyễn Hoàng Quân','Thanh Xuân,Hà Nội',953160592);
INSERT INTO Student(StudentNo,StudentName,StudentAddress,PhoneNo)VALUES(4,'Nguyễn Bảo Ngọc','Hòa Lạc,Hà Nội',93474964);
INSERT INTO Student(StudentNo,StudentName,StudentAddress,PhoneNo)VALUES(1,'Mai Lan Anh','Nam Từ Liêm,Hà Nội',987654321);
INSERT INTO Student(StudentNo,StudentName,StudentAddress,PhoneNo)VALUES(1,'Nguyễn Gia Bảo ','Cầu Giấy,Hà Nội',1829593582);


INSERT INTO Department(DeptNo,DeptName,ManagerName)VALUES(1,'OLympia','Nguyễn Ngọc Bảo Phúc');
INSERT INTO Department(DeptNo,DeptName,ManagerName)VALUES(2,'Skrtt Skrtt','Nguyễn Hoàng Anh');
INSERT INTO Department(DeptNo,DeptName,ManagerName)VALUES(3,'RapATap','Ngô Chí Thành Đạt');

INSERT INTO Assignment(AssignmentNo,Description)VALUES(1,'Bài kiểm tra về môn C');
INSERT INTO Assignment(AssignmentNo,Description)VALUES(2,'Bài kiểm tra về môn HTML,CSS,JS');
INSERT INTO Assignment(AssignmentNo,Description)VALUES(3,'Bài kiểm tra về môn SQL');

INSERT INTO Works_Assign(JobID,StudentNo,AssignmentNo,TotalHours,JobDetails)VALUES(1,1,1,10,'Hoàn thành bài kiểm tra về môn C');
INSERT INTO Works_Assign(JobID,StudentNo,AssignmentNo,TotalHours,JobDetails)VALUES(2,2,2,8,'Hoàn thành bài kiểm tra về môn HTML');
INSERT INTO Works_Assign(JobID,StudentNo,AssignmentNo,TotalHours,JobDetails)VALUES(3,3,3,12,'Hoàn thành bài kiểm tra về môn SQL');
--2
CREATE CLUSTERED INDEX IX_Student
ON Student(StudentNo)
--3
ALTER INDEX IX_Student ON Student REBUILD
--4
CREATE NONCLUSTERED INDEX IX_Dept
ON Department(DeptName,ManagerName)
