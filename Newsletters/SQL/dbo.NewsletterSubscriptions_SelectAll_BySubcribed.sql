USE [Immersed]
GO
/****** Object:  StoredProcedure [dbo].[NewsletterSubscriptions_SelectAll_BySubcribed]    Script Date: 12/20/2022 11:15:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 --=============================================
 --Author: <Ramirez, Andrew>
 --Create date: <2022-12-19>
 --Description: <Select All for NewsletterSubscriptions by is subscribed>
 --Code Reviewer: Joseph Aquino
 

 --MODIFIED BY: 
 --MODIFIED DATE: 
 --Code Reviewer: 
 --Note: 
 --=============================================
CREATE PROC [dbo].[NewsletterSubscriptions_SelectAll_BySubcribed]
			@IsSubscribed bit

AS
/*-----TEST CODE----

	DECLARE @IsSubcribed bit = 0

	EXECUTE [dbo].[NewsletterSubscriptions_SelectAll_BySubcribed]
			@IsSubcribed 

*/

BEGIN

	SELECT [Email]
		  ,[IsSubscribed]
		  ,[DateCreated]
		  ,[DateModified]
	  FROM [dbo].[NewsletterSubscriptions]
	  WHERE IsSubscribed = @IsSubscribed

END
GO
