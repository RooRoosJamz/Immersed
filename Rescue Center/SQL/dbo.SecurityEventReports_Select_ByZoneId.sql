USE [Immersed]
GO
/****** Object:  StoredProcedure [dbo].[SecurityEventReports_Select_ByZoneId]    Script Date: 11/21/2022 2:43:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: <Andrew Ramirez>
-- Create date: <11/21/2022>
-- Description: <Selects SecurityEvent Reports by TraineeId>
-- Code Reviewer: Joesph Aquino

-- MODIFIED BY: author
-- MODIFIED DATE: mm/dd/yyyy
-- Code Reviewer:
-- Note:
-- =============================================
CREATE proc [dbo].[SecurityEventReports_Select_ByZoneId]
				@ZoneId int
				,@PageIndex int
				,@PageSize int

/* ------TEST CODE-------

	DECLARE @ZoneId int = 1
			,@PageIndex int = 0
			,@PageSize int = 5

	EXECUTE [dbo].[SecurityEventReports_Select_ByZoneId]
			@ZoneId
			,@PageIndex
			,@PageSize

*/

AS

BEGIN

	DECLARE @Offset int = @PageIndex * @PageSize

	SELECT sr.[Id]
		  ,sr.[Subject]
		  ,sr.[Description]
		  ,et.[Id] as EventTypeId
		  ,et.[Name] as EventType
		  ,t.[Id] as TraineeId
		  ,t.[UserId] as TraineeUserId
		  ,t.[TrainingUnitId]
		  ,t.[IsDeleted]
		  ,t.[CreatedBy]
		  ,t.[ModifiedBy]
		  ,ta.[Id] as TraineeAccountId
		  ,ta.[Username] as TraineeAccountUsername
		  ,ta.[AvatarUrl] as TraineeAccountAvatarUrl
		  ,z.[Id] as ZoneId
		  ,z.[Name] as ZoneName
		  ,z.[Description] as ZoneDescription
		  ,z.[ZoneTypeId]
		  ,z.[ZoneStatusId]
		  ,z.[IsDeleted]
		  ,z.[CreatedBy]
		  ,z.[ModifiedBy]
		  ,z.[DateCreated]
		  ,z.[DateModified]
		  ,u.[Id] as UserId
		  ,u.[Email] as UserEmail
		  ,u.[FirstName]
		  ,u.[Mi]
		  ,u.[LastName]
		  ,u.[AvatarUrl]
		  ,sr.[DateCreated]
		  ,TotalCount = COUNT(1) OVER ()
	  FROM [dbo].[SecurityEventReports] AS sr
			INNER JOIN [dbo].[Trainees] AS t
			ON sr.TraineeId = t.Id
			INNER JOIN [dbo].[EventReportingTypes] AS et
			ON sr.EventReportingTypeId = et.Id
			LEFT JOIN [dbo].[TraineeAccounts] AS ta
			ON sr.TraineeAccountId = ta.Id
			LEFT JOIN [dbo].[Zones] AS z
			ON sr.ZoneId = z.Id
			INNER JOIN [dbo].[Users] AS u
			ON sr.CreatedBy = u.Id
	  WHERE z.[Id] = @ZoneId
	  ORDER BY sr.[Id]
	  OFFSET @Offset ROWS
	  FETCH NEXT @PageSize ROWS ONLY

END
GO
