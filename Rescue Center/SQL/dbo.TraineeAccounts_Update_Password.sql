USE [Immersed]
GO
/****** Object:  StoredProcedure [dbo].[TraineeAccounts_Update_Password]    Script Date: 12/17/2022 6:58:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Ramirez, Andrew>
-- Create date: <12/14/2022>
-- Description: <Updates Password for TraineeAccounts.>
-- Code Reviewer: 

-- MODIFIED BY: 
-- MODIFIED DATE: 
-- Code Reviewer: 
-- Note:
-- =============================================

CREATE proc [dbo].[TraineeAccounts_Update_Password]
		@Password nvarchar(100)
		,@UserId int
		,@Id int
		
as

/* 
		Select *
		From [dbo].[TraineeAccounts]
		
		Declare @Password nvarchar(100) = 'NewPassword1!'
				,@UserId int = 91
				,@Id int = 39
			  		
		Execute dbo.[TraineeAccounts_Update_Password]
				@Password
				,@UserId
				,@Id
				
		Select *
		From [dbo].[TraineeAccounts]
		Where Id = @Id

*/

BEGIN

	UPDATE [dbo].[TraineeAccounts]
	   SET [Password] = @Password	
			,[ModifiedBy] = @UserId

	 WHERE Id = @Id

END
GO
