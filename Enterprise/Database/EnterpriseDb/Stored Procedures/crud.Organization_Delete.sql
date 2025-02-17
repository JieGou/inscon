
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROC [crud].[Organization_Delete]
  @OrganizationID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    DELETE FROM [organization].[Organization]
    WHERE  [OrganizationID] = @OrganizationID

GO
