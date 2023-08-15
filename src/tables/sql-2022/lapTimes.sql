/*
	Created by RIS-001\Rich using dbatools Export-DbaScript for objects on RIS-001$SQLEXPRESS22 at 08/15/2023 09:42:10
	See https://dbatools.io/Export-DbaScript for more information
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lapTimes](
	[raceId] [int] NOT NULL,
	[driverId] [int] NOT NULL,
	[lap] [int] NOT NULL,
	[position] [int] NULL,
	[time] [varchar](255) COLLATE Latin1_General_CI_AS NULL,
	[milliseconds] [int] NULL,
 CONSTRAINT [PK_lapTimes_raceId_driverId_lap] PRIMARY KEY CLUSTERED 
(
	[raceId] ASC,
	[driverId] ASC,
	[lap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO