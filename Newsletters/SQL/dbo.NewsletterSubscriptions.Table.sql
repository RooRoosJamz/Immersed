USE [Immersed]
GO
/****** Object:  Table [dbo].[NewsletterSubscriptions]    Script Date: 12/20/2022 11:15:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsletterSubscriptions](
	[Email] [nvarchar](100) NOT NULL,
	[IsSubscribed] [bit] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_NewsletterSubscriptions] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[NewsletterSubscriptions] ADD  CONSTRAINT [DF_NewsletterSubscriptions_IsSubscribed]  DEFAULT ((1)) FOR [IsSubscribed]
GO
ALTER TABLE [dbo].[NewsletterSubscriptions] ADD  CONSTRAINT [DF_Table_1_DateCreate]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[NewsletterSubscriptions] ADD  CONSTRAINT [DF_NewsletterSubscriptions_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
