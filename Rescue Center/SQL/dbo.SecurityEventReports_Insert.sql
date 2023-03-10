USE [Immersed]
GO
/****** Object:  StoredProcedure [dbo].[SecurityEventReports_Insert]    Script Date: 11/21/2022 2:43:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 --=============================================
 --Author: <Ramirez, Andrew>
 --Create date: <2022-11-18>
 --Description: <Insert for SecurityEventReports>
 --Code Reviewer: Joesph Aquino
 

 --MODIFIED BY: 
 --MODIFIED DATE:
 --Code Reviewer: 
 --Note: 
 --=============================================
CREATE proc [dbo].[SecurityEventReports_Insert]
				@Subject nvarchar(100)
				,@Description nvarchar(3000)
				,@EventReportingTypeId int
				,@TraineeId int
				,@TraineeAccountId int = null
				,@ZoneId int = null
				,@CreatedBy int
				,@Id int OUTPUT

/* ------TEST CODE -----

	DECLARE @Subject nvarchar(100) = 'Stolen Account Test'
			,@Description nvarchar(3000) = 'Was testing and someone stole my account'
			,@EventReportingTypeId int = 1
			,@TraineeId int = 25
			,@TraineeAccountId int = 1
			,@ZoneId int = 1
			,@CreatedBy int = 23
			,@Id int = 0

	EXECUTE [dbo].[SecurityEventReports_Insert]
			@Subject
			,@Description
			,@EventReportingTypeId
			,@TraineeId
			,@TraineeAccountId
			,@ZoneId
			,@CreatedBy
			,@Id OUTPUT

*/

AS

BEGIN

	INSERT INTO [dbo].[SecurityEventReports]
			   ([Subject]
			   ,[Description]
			   ,[EventReportingTypeId]
			   ,[TraineeId]
			   ,[TraineeAccountId]
			   ,[ZoneId]
			   ,[CreatedBy])
     VALUES
			   (@Subject
				,@Description
				,@EventReportingTypeId 
				,@TraineeId
				,@TraineeAccountId
				,@ZoneId
				,@CreatedBy)

	SET @Id = SCOPE_IDENTITY()

END
GO
