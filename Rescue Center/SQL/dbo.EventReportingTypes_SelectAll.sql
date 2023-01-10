USE [Immersed]
GO
/****** Object:  StoredProcedure [dbo].[EventReportingTypes_SelectAll]    Script Date: 11/21/2022 2:43:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 --=============================================
 --Author: <Ramirez, Andrew>
 --Create date: <2022-11-28>
 --Description: <SelectAll for EventReportingTypes>
 --Code Reviewer: Joesph Aquino
 

 --MODIFIED BY: 
 --MODIFIED DATE:
 --Code Reviewer: 
 --Note: 
 --=============================================
 
CREATE proc [dbo].[EventReportingTypes_SelectAll]

/* -----TEST Code-----
	
	Execute [dbo].[EventReportingTypes_SelectAll]

*/

AS

BEGIN

	SELECT [Id]
		  ,[Name]
	FROM [dbo].[EventReportingTypes]

END
GO
