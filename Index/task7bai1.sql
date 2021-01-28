CREATE DATABASE LAB10
USE AdventureWorks2019
SELECT*INTO Lab10.dbo.WorkOrder FROM Production.WorkOrder

use LAB10
SELECT*INTO WorkOrderIx FROM WorkOrder

SELECT*FROM WorkOrder
SELECT*FROM WorkOrderIx

CREATE INDEX IX_WorkOrderID ON WorkOrderIX(WorkOrderID)

SELECT*FROM WorkOrder WHERE WorkOrderID=72000
SELECT*FROM WorkOrderIx WHERE WorkOrderID=72000