
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROC [crud].[AddressUse_SelectByAddressIdAndTypeId]
  @AddressID INT,
  @TypeID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [AddressID],
           [TypeID]
    FROM   [common].[AddressUse_XREF]
    WHERE  [AddressID] = @AddressID AND [TypeID] = @TypeID
GO
