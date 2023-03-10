USE [Immersed]
GO
/****** Object:  Table [dbo].[SecurityEventReports]    Script Date: 11/21/2022 2:43:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecurityEventReports](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](3000) NOT NULL,
	[EventReportingTypeId] [int] NOT NULL,
	[TraineeId] [int] NOT NULL,
	[TraineeAccountId] [int] NULL,
	[ZoneId] [int] NULL,
	[CreatedBy] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_SecurityEventReports] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SecurityEventReports] ADD  CONSTRAINT [DF_SecurityEventReports_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[SecurityEventReports]  WITH CHECK ADD  CONSTRAINT [FK_SecurityEventReports_EventReportingTypes] FOREIGN KEY([EventReportingTypeId])
REFERENCES [dbo].[EventReportingTypes] ([Id])
GO
ALTER TABLE [dbo].[SecurityEventReports] CHECK CONSTRAINT [FK_SecurityEventReports_EventReportingTypes]
GO
ALTER TABLE [dbo].[SecurityEventReports]  WITH CHECK ADD  CONSTRAINT [FK_SecurityEventReports_TraineeAccounts] FOREIGN KEY([TraineeAccountId])
REFERENCES [dbo].[TraineeAccounts] ([Id])
GO
ALTER TABLE [dbo].[SecurityEventReports] CHECK CONSTRAINT [FK_SecurityEventReports_TraineeAccounts]
GO
ALTER TABLE [dbo].[SecurityEventReports]  WITH CHECK ADD  CONSTRAINT [FK_SecurityEventReports_Trainees] FOREIGN KEY([TraineeId])
REFERENCES [dbo].[Trainees] ([Id])
GO
ALTER TABLE [dbo].[SecurityEventReports] CHECK CONSTRAINT [FK_SecurityEventReports_Trainees]
GO
ALTER TABLE [dbo].[SecurityEventReports]  WITH CHECK ADD  CONSTRAINT [FK_SecurityEventReports_Users] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[SecurityEventReports] CHECK CONSTRAINT [FK_SecurityEventReports_Users]
GO
ALTER TABLE [dbo].[SecurityEventReports]  WITH CHECK ADD  CONSTRAINT [FK_SecurityEventReports_Zones] FOREIGN KEY([ZoneId])
REFERENCES [dbo].[Zones] ([Id])
GO
ALTER TABLE [dbo].[SecurityEventReports] CHECK CONSTRAINT [FK_SecurityEventReports_Zones]
GO
