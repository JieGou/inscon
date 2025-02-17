
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROC [crud].[Lookup_SelectByGroupId]
  @LookupGroupID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [LookupID],
           [LookupGroupID],
           [Value]
    FROM   [common].[Lookup]
    WHERE  [LookupGroupID] = @LookupGroupID
GO
