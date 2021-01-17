CREATE DATABASE (SalesDB) ON PRIMARY

(NAME = 'SalesDB' , FILENAME = 'C:\ProgramFiles\Microsoft SQL Server\MSQL11.MSSQLSERVER\MSSQL\DATA\SalesDB.mdf',SIZE = 3072KB, MAXSIZE = UNLIMITED,FILEGROWTH=1024KB),

FILEGROUP [MyFileGroup]

(NAME = 'SalesDB_FG',FILENAME = 'C:\ProgramFiles\MicrosoftSQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\SalesDB-FG.ndf',SIZE = 3072KB, MAXSIZE = UNLIMITED,FILEGROWTH = 1024KB)

LOG ON
(NAME = 'SalesDB_log',FILENAME = 'C:\ProgramFiles\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\SalesDB_log.ldf',SIZE = 2048KB, MAXSIZE = 2048GB , FILEGROWTH=10%)

COLLATE SQL_Latin1_General_CP1_CI_AS