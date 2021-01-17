CREATE DATABASE customer_snapshot 01 ON

(NAME = Customer_DB, FILENAME = 'C:\ProgramFiles\Microsoft SQL Server\MSQL11.MSSQLSERVER\MSSQL\DATA\Customerdat_0100.ss')

AS SNAPSHOT OF CUST_DB;