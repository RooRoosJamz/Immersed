USE [Immersed]
GO
/****** Object:  StoredProcedure [dbo].[TraineeAccounts_Select_AuthData]    Script Date: 12/17/2022 6:58:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Ramirez>
-- Create date: <12/14/2022>
-- Description: <Selects Data needed to compare on a password change>
-- Code Reviewer: Jay Arenas

-- MODIFIED BY: 
-- MODIFIED DATE: 
-- Code Reviewer:
-- Note:
-- =============================================

CREATE PROC [dbo].[TraineeAccounts_Select_AuthData]
		@Id int
AS

/*

	DECLARE @Id int = 24

	EXECUTE [dbo].[TraineeAccounts_Select_AuthData]
			@Id

*/

BEGIN

	SELECT	ta.[Id]
			,ta.[Username]
			,ta.[Password]
	FROM	[dbo].[TraineeAccounts] as ta
	WHERE	ta.[Id] = @Id

END
GO
