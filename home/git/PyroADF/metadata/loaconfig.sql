/****** Object:  Table [ETL].[LoadConfig]    Script Date: 2020-09-13 03:13:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TYPE [ETL].[LoadConfig](
	[LoadConfigID] [int] IDENTITY(1,1) NOT NULL,
	[LoadType] [nvarchar](128) NOT NULL,
	[SourceSystemName] [sysname] NOT NULL,
	[SourceEntityType] [sysname] NOT NULL,
	[SourceServerName] [sysname] NOT NULL,
	[SourceDatabaseInstanceName] [sysname] NOT NULL,
	[SourceDatabaseName] [sysname] NOT NULL,
	[SourceSchemaName] [sysname] NOT NULL,
	[SourceEntityName] [sysname] NOT NULL,
	[SourceEntityDefinition] [nvarchar](max) NULL,
	[TargetSystemName] [sysname] NOT NULL,
	[TargetDataEntityType] [sysname] NOT NULL,
	[TargetServerName] [sysname] NOT NULL,
	[TargetDatabaseInstanceName] [sysname] NOT NULL,
	[TargetSchemaName] [sysname] NOT NULL,
	[TargetEntityName] [sysname] NOT NULL,
	[TargetEntityDefinition] [nvarchar](max) NULL,
	[IsDetermineFieldListAtRunTime] [bit] NOT NULL,
	[IsUpdateStaticFieldListAtRuntime] [bit] NOT NULL,
	[SourceStaticFieldList] [nvarchar](max) NULL,
	[TargetStaticFieldList] [nvarchar](max) NULL,
	[CdcCreatedDtColumn] [sysname] NULL,
	[CdxCreatedDtValue] [nvarchar](50) NULL,
	[CdcUpdatedDtColumn] [sysname] NULL,
	[CdcUpdatedDtValue] [nvarchar](50) NULL,
	[IsUseExternalCdc] [bit] NOT NULL,
	[ExternalCdcFullyQualifiedReference] [nvarchar](523) NULL,
	[ExternalCdcDefinition] [nvarchar](max) NULL,
	[ExternalCdcJoinColumn] [nvarchar](max) NULL,
	[SourceCdcJoinColumn] [nvarchar](max) NULL,
	[IsDropAndRecreateTarget] [bit] NOT NULL,
	[PrimaryKeyField] [nvarchar](max) NULL,
	[CreatedDT] [datetime2](7) NOT NULL,
	[UpdatedDT] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ETL_LoadConfig] PRIMARY KEY CLUSTERED 
(
	[LoadConfigID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [ETL].[LoadConfig] ADD  CONSTRAINT [DF__LoadConfig_LoadType]  DEFAULT ('FULL') FOR [LoadType]
GO

ALTER TABLE [ETL].[LoadConfig] ADD  CONSTRAINT [DF__LoadConfig_SourceSystemName]  DEFAULT ('ARBITRARY') FOR [SourceSystemName]
GO

ALTER TABLE [ETL].[LoadConfig] ADD  CONSTRAINT [DF__LoadConfig_SourceEntityType]  DEFAULT ('TABLE') FOR [SourceEntityType]
GO

ALTER TABLE [ETL].[LoadConfig] ADD  CONSTRAINT [DF__LoadConfig_SourceServerName]  DEFAULT (CONVERT([sysname],isnull(serverproperty('ServerName'),@@servername))) FOR [SourceServerName]
GO

ALTER TABLE [ETL].[LoadConfig] ADD  CONSTRAINT [DF__LoadConfig_SourceDatabaseInstanceName]  DEFAULT ('DEFAULT') FOR [SourceDatabaseInstanceName]
GO

ALTER TABLE [ETL].[LoadConfig] ADD  CONSTRAINT [DF__LoadConfig_SourceDatabaseName]  DEFAULT (db_name()) FOR [SourceDatabaseName]
GO

ALTER TABLE [ETL].[LoadConfig] ADD  CONSTRAINT [DF__LoadConfig_SourceSchemaName]  DEFAULT ('dbo') FOR [SourceSchemaName]
GO

ALTER TABLE [ETL].[LoadConfig] ADD  CONSTRAINT [DF__LoadConfig_TargetystemName]  DEFAULT ('ARBITRARY') FOR [TargetSystemName]
GO

ALTER TABLE [ETL].[LoadConfig] ADD  CONSTRAINT [DF__LoadConfig_TargetEntityType]  DEFAULT ('TABLE') FOR [TargetDataEntityType]
GO

ALTER TABLE [ETL].[LoadConfig] ADD  CONSTRAINT [DF__LoadConfig_TargetServerName]  DEFAULT (CONVERT([sysname],isnull(serverproperty('ServerName'),@@servername))) FOR [TargetServerName]
GO

ALTER TABLE [ETL].[LoadConfig] ADD  CONSTRAINT [DF__LoadConfig_TargetDatabaseInstanceName]  DEFAULT (CONVERT([sysname],isnull(serverproperty('ServerName'),@@servername))) FOR [TargetDatabaseInstanceName]
GO

ALTER TABLE [ETL].[LoadConfig] ADD  CONSTRAINT [DF__LoadConfig_TargetDatabaseName]  DEFAULT (db_name()) FOR [TargetSchemaName]
GO

ALTER TABLE [ETL].[LoadConfig] ADD  CONSTRAINT [DF__LoadConfig_IsDetermineFieldListAtRunTime]  DEFAULT ((0)) FOR [IsDetermineFieldListAtRunTime]
GO

ALTER TABLE [ETL].[LoadConfig] ADD  CONSTRAINT [DF__LoadConfig_IsUpdateStaticFieldListAtRuntime]  DEFAULT ((0)) FOR [IsUpdateStaticFieldListAtRuntime]
GO

ALTER TABLE [ETL].[LoadConfig] ADD  CONSTRAINT [DF__LoadConfig_IsUseExternalCDC]  DEFAULT ((0)) FOR [IsUseExternalCdc]
GO

ALTER TABLE [ETL].[LoadConfig] ADD  CONSTRAINT [DF__LoadConfig_IsDropAndRecreateTarget]  DEFAULT ((0)) FOR [IsDropAndRecreateTarget]
GO

ALTER TABLE [ETL].[LoadConfig] ADD  CONSTRAINT [DF__LoadConfig_CreatedDT]  DEFAULT (getdate()) FOR [CreatedDT]
GO

ALTER TABLE [ETL].[LoadConfig] ADD  CONSTRAINT [DF__LoadConfig_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO


