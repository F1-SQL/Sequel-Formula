/*
	Created by RIS-001\Rich using dbatools Export-DbaScript for objects on RIS-001$SQLEXPRESS22 at 08/28/2023 19:28:45
	See https://dbatools.io/Export-DbaScript for more information
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[circuits](
	[circuitId] [int] NOT NULL,
	[circuitRef] [varchar](255) COLLATE Latin1_General_CI_AS NOT NULL,
	[name] [varchar](255) COLLATE Latin1_General_CI_AS NOT NULL,
	[lat] [float] NULL,
	[lng] [float] NULL,
	[alt] [int] NULL,
	[url] [varchar](255) COLLATE Latin1_General_CI_AS NOT NULL,
	[locationID] [int] NULL,
	[countryID] [int] NULL,
	[circuitDirectionID] [int] NULL,
	[circuitTypeID] [int] NULL,
 CONSTRAINT [PK_circuits_circuitId] PRIMARY KEY CLUSTERED 
(
	[circuitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
