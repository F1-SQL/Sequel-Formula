/*
	Created by RIS-001\Rich using dbatools Export-DbaScript for objects on RIS-001$SQLEXPRESS16 at 08/08/2023 19:47:55
	See https://dbatools.io/Export-DbaScript for more information
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[constructorResults](
	[constructorResultsId] [int] NOT NULL,
	[raceId] [int] NOT NULL,
	[constructorId] [int] NOT NULL,
	[points] [float] NULL,
	[status] [varchar](255) COLLATE Latin1_General_CI_AS NULL,
 CONSTRAINT [PK_constructorResults_constructorResultsId] PRIMARY KEY CLUSTERED 
(
	[constructorResultsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO