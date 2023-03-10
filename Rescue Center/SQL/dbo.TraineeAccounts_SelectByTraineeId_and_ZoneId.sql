USE [Immersed]
GO
/****** Object:  StoredProcedure [dbo].[TraineeAccounts_SelectByTraineeId_and_ZoneId]    Script Date: 1/10/2023 9:48:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: <Andrew Ramirez>
-- Create date: <12/31/2022>
-- Description: <Select traineeAccounts by traineeId and ZoneId>
-- Code Reviewer: Joseph Aquino

-- MODIFIED BY: 
-- MODIFIED DATE: 
-- Code Reviewer: 
-- Note:
-- =============================================
CREATE proc [dbo].[TraineeAccounts_SelectByTraineeId_and_ZoneId]
			@TraineeId int
			,@ZoneId int

as
/* ----TEST code----
	Declare @TraineeId int = 119
			,@ZoneId int = 7

	Execute [dbo].[TraineeAccounts_SelectByTraineeId_and_ZoneId]
			@TraineeId
			,@ZoneId

*/

BEGIN

	SELECT ta.Id
			,ta.Username		  
			,ta.AvatarUrl
			,z.Id as ZoneId
			,z.[Name] as ZoneName
			,z.[Description] as ZoneDescription
			,zt.Id as ZoneTypeId
			,zt.[Name] as ZoneTypeName
			,zs.Id as ZoneStatusId
			,zs.[Name] as ZoneStatusName
			,z.IsDeleted
			,t.Id as TraineeId
			,t.UserId as TraineeUserId
			,tu.Id as TrainingUnitId
			,ts.Id as TraineeStatusId
			,ts.[Name] as TraineeStatusName
			,t.IsDeleted
			,a.Id as AccountStatusId
			,a.[Name] as AccountStatusName

	FROM [dbo].[TraineeAccounts] as ta JOIN dbo.Zones as z
			ON ta.ZoneId = z.Id
			JOIN dbo.ZoneTypes as zt
			ON z.ZoneTypeId = zt.Id
			JOIN dbo.ZoneStatus as zs
			ON z.ZoneStatusId = zs.Id
			JOIN dbo.Trainees as t
			ON ta.TraineeId = t.Id
			JOIN dbo.TrainingUnits as tu
			ON t.TrainingUnitId = tu.Id
			JOIN dbo.TraineeStatus as ts
			ON t.TraineeStatusId = ts.Id
			JOIN dbo.AccountStatus as a
			ON ta.AccountStatusId = a.Id
	WHERE (ta.TraineeId = @TraineeId) 
		AND
		  (ta.ZoneId = @ZoneId)
	ORDER BY ta.TraineeId

END
GO
