CREATE DATABASE CodeLearn

CREATE TABLE Classes(
ClassName CHAR(6),
Teacher VARCHAR(30),
TimeSlot VARCHAR(30),
Class INT,
Lab INT,
)
--1
CREATE UNIQUE CLUSTERED INDEX MyClusteredIndex
ON Classes(ClassName)
--2
CREATE NONCLUSTERED INDEX TeacherIndex
ON Classes(Teacher)
--3
DROP INDEX TeacherIndex ON Classes
--4
ALTER INDEX MyClusteredIndex ON Classes REBUILD WITH (FILLFACTOR=60)
--5
CREATE INDEX ClassLabIndex ON Classes(Class,Lab)
--6
EXECUTE MyClusteredIndex 'Classes'
EXECUTE TeacherIndex 'Classes'
EXECUTE ClassLabIndex 'Classes'