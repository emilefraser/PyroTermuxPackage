/****** Object:  Table [ETL].[LoadConfig]    Script Date: 2020-09-13 02:17:09 ******/
DROP TABLE [ETL].[LoadConfig]
GO

/****** Object:  Table [ETL].[LoadConfig]    Script Date: 2020-09-13 02:17:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [ETL].[LoadConfig](
	[LoadConfigID] [int] IDENTITY(1,1) NOT NULL,
	[LoadType] [nvarchar](128) CONSTRAINT DF__LoadConfig_LoadType DEFAULT ('FULL') NOT NULL,

	[SourceSystemName] [sysname] CONSTRAINT DF__LoadConfig_SourceSystemName DEFAULT ('ARBITRARY') NOT NULL,
	[SourceEntityType] [sysname] CONSTRAINT DF__LoadConfig_SourceEntityType DEFAULT ('TABLE') NOT NULL,

	[SourceServerName] [sysname] CONSTRAINT DF__LoadConfig_SourceServerName  DEFAULT (CONVERT([sysname],isnull(serverproperty('ServerName'),@@servername)))  NOT NULL,
	[SourceDatabaseInstanceName] [sysname] CONSTRAINT DF__LoadConfig_SourceDatabaseInstanceName DEFAULT ('DEFAULT') NOT NULL,
	[SourceDatabaseName] [sysname] CONSTRAINT DF__LoadConfig_SourceDatabaseName DEFAULT (db_name()) NOT NULL,
	[SourceSchemaName] [sysname] CONSTRAINT DF__LoadConfig_SourceSchemaName DEFAULT 'dbo' NOT NULL,
	[SourceEntityName] [sysname] NOT NULL,
	[SourceEntityDefinition] NVARCHAR(MAX) NULL,
	
	[TargetSystemName] [sysname] CONSTRAINT DF__LoadConfig_TargetystemName DEFAULT ('ARBITRARY') NOT NULL,
	[TargetEntityType] [sysname] CONSTRAINT DF__LoadConfig_TargetEntityType DEFAULT ('TABLE') NOT NULL,

	[TargetServerName] [sysname] CONSTRAINT DF__LoadConfig_TargetServerName  DEFAULT (CONVERT([sysname],isnull(serverproperty('ServerName'),@@servername)))  NOT NULL,
	[TargetDatabaseInstanceName] [sysname] CONSTRAINT DF__LoadConfig_TargetDatabaseInstanceName  DEFAULT (CONVERT([sysname],isnull(serverproperty('ServerName'),@@servername)))  NOT NULL,
	[TargetSchemaName] [sysname] CONSTRAINT DF__LoadConfig_TargetDatabaseName DEFAULT (db_name()) NOT NULL,
	[TargetEntityName] [sysname] NOT NULL,
	[TargetEntityDefinition] NVARCHAR(MAX) NULL,
	
	[SourceStaticFieldList] [nvarchar](max) NULL,
	
	[CdcCreatedDtColumn] SYSNAME NULL,
	[CdcCreatedDtValue] NVARCHAR(50) NULL,

	[CdcUpdatedDtColumn] SYSNAME NULL,
	[CdcUpdatedDtValue] NVARCHAR(50) NULL,

	[IsUseExternalCdc] [bit] CONSTRAINT DF__LoadConfig_IsUseExternalCDC DEFAULT 0 NOT NULL,
	[ExternalCdcFullyQualifiedReference] [nvarchar](523) NULL,
	[ExternalCdcDefinition] NVARCHAR(MAX) NULL,
	[ExternalCdcJoinColumn] NVARCHAR(MAX),
	[SourceCdcJoinColumn] NVARCHAR(MAX),

	[IsDropAndRecreateTarget] [bit] CONSTRAINT DF__LoadConfig_IsDropAndRecreateTarget DEFAULT 0 NOT NULL,
	[PrimaryKeyColumn] [nvarchar](max) NULL,
	[CreatedDT] [datetime2](7) CONSTRAINT DF__LoadConfig_CreatedDT DEFAULT GETDATE() NOT NULL,
	[UpdatedDT] [datetime2](7) NULL,
	[IsActive] [bit] CONSTRAINT DF__LoadConfig_IsActive DEFAULT 1 NOT NULL,
 CONSTRAINT [PK_ETL_LoadConfig] PRIMARY KEY CLUSTERED 
(
	[LoadConfigID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO






CREATE TYPE [ETL].[LoadConfig] AS TABLE (
	[LoadConfigID] [int] IDENTITY(1,1) NOT NULL,
	[LoadType] [nvarchar](128)  NULL,

	[SourceSystemName] [sysname] NULL,
	[SourceEntityType] [sysname] NULL,

	[SourceServerName] [sysname] NULL,
	[SourceDatabaseInstanceName] [sysname]  NULL,
	[SourceDatabaseName] [sysname]   NULL,
	[SourceSchemaName] [sysname] NULL,
	[SourceEntityName] [sysname]  NULL,
	[SourceEntityDefinition]  [sysname]  NULL,
	
	[TargetSystemName] [sysname] NULL,
	[TargetDataEntityType] [sysname] NULL,

	[TargetServerName] [sysname]  NULL,
	[TargetDatabaseInstanceName] sysname   NULL,
	[TargetSchemaName] [sysname]  NULL,
	[TargetEntityName] [sysname] NULL,
	[TargetEntityDefinition] NVARCHAR(MAX) NULL,
	
	[IsDetermineFieldListAtRunTime] [bit] NULL,
	[IsUpdateStaticFieldListAtRuntime] [bit]  NULL,
	[SourceStaticFieldList] [nvarchar](max) NULL,
	[TargetStaticFieldList] [nvarchar](max) NULL,
	
	[CdcCreatedDtColumn] SYSNAME NULL,
	[CdxCreatedDtValue] NVARCHAR(50) NULL,

	[CdcUpdatedDtColumn] SYSNAME NULL,
	[CdcUpdatedDtValue] NVARCHAR(50) NULL,

	[IsUseExternalCdc] bit NULL,
	[ExternalCdcFullyQualifiedReference] [nvarchar](523) NULL,
	[ExternalCdcDefinition] NVARCHAR(MAX) NULL,
	[ExternalCdcJoinColumn] NVARCHAR(MAX) NULL,
	[SourceCdcJoinColumn] NVARCHAR(MAX) NULL,

	[IsDropAndRecreateTarget] [bit]  NULL,
	[PrimaryKeyField] [nvarchar](max) NULL
)