
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROC [crud].[Product_SelectAll]

AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [ProductID],
           [ProductCategoryID],
           [Caption],
           [Code],
           [SKU],
           [Rate],
           [Cost]
    FROM   [inventory].[Product]
GO
