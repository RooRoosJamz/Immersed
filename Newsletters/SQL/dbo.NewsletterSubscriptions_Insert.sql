USE [Immersed]
GO
/****** Object:  StoredProcedure [dbo].[NewsletterSubscriptions_Insert]    Script Date: 12/20/2022 2:57:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 --=============================================
 --Author: <Ramirez, Andrew>
 --Create date: <2022-12-16>
 --Description: <Insert for NewsletterSubscriptions>
 --Code Reviewer: Joseph Aquino
 

 --MODIFIED BY: 
 --MODIFIED DATE: 
 --Code Reviewer: 
 --Note: 
 --=============================================
CREATE proc [dbo].[NewsletterSubscriptions_Insert]
		@Email nvarchar(100)

AS

/* ---TEST CODE----

	DECLARE @Email nvarchar(100) = 'joe456@email.com'

	EXECUTE [dbo].[NewsletterSubscriptions_Insert]
			@Email 

	SELECT *
	FROM [dbo].[NewsletterSubscriptions]

*/

BEGIN

	INSERT INTO [dbo].[NewsletterSubscriptions]
           ([Email])
     VALUES
           (@Email)

END
GO
