
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROC [crud].[WorkOrderItem_SelectAll]

AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [WorkOrderItemID],
           [WorkOrderID],
           [ProductID],
           [Quantity],
           [Rate],
           [DateInserted]
    FROM   [request].[WorkOrderItem]
GO
