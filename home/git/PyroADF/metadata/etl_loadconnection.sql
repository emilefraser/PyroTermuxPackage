/****** Object:  Table [ETL].[LoadConfig]    Script Date: 2020-09-13 02:17:09 ******/
DROP TABLE [ETL].[LoadConnection]
GO

/****** Object:  Table [ETL].[LoadConfig]    Script Date: 2020-09-13 02:17:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [ETL].[LoadConnection](
	[LoadConnectionID] [int] IDENTITY(1,1) NOT NULL,
	[SystemName] [sysname] NOT NULL,
	[ServerName] [sysname] NULL,
	[Port] INT NULL,
	[Path] nvarchar(MAX) NULL,
	[AuthenticationType] NVARCHAR(100) DEFAULT 'NONE',
	[UserName] NVARCHAR(100) NULL,
	[Password]  NVARCHAR(100) NULL,
	[CreatedDT] [datetime2](7) CONSTRAINT DF_LoadConnection_CreatedDT DEFAULT GETDATE() NOT NULL,
	[UpdatedDT] [datetime2](7) NULL,
	[IsActive] [bit] CONSTRAINT DF_LoadConnection_IsActive DEFAULT 1 NOT NULL,
 CONSTRAINT [PK__ETL_LoadConnection] PRIMARY KEY CLUSTERED 
(
	[LoadConnectionID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO