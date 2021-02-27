/****** Object:  StoredProcedure [dbo].[sp_set_Ensamble_JoinType]    Script Date: 2020/06/08 10:18:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	Written by	: Emile Fraser	
	Date		: 2020-05-20
	Function	: Crud for Inserting/Updating/Deleting New LoadConfigs

	Sample Execution:


	EXEC [ETL].[SetLoadConnection]
		@LoadConnectionID 				= NULL,
		@SystemName 			= 'SQL Server - Local',
		@ServerName 				= 'PYROMANIAC\PYROSQL',
		@Port 							= 1433,
		@Path 			= NULL,
		@AuthenticationType 	= 'SQL',
		@UserName 			= 'pyromaniac',
		@Password  			= '105022',
		@IsActive 						= 1

	


*/
CREATE OR ALTER     PROCEDURE [ETL].[SetLoadConnection] (
		@LoadConnectionID [int]				= NULL,
		@SystemName [sysname]				= NULL,
		@ServerName [sysname]				= NULL,
		@Port INT							= NULL,
		@Path nvarchar(MAX)					= NULL,
		@AuthenticationType NVARCHAR(100)	= NULL,
		@UserName NVARCHAR(100)				= NULL,
		@Password  NVARCHAR(100)			= NULL,
		@IsActive BIT						= NULL
)
AS 
BEGIN

	DECLARE @MergeLog TABLE (
		MergeID INT,
		MergeAction SYSNAME
	)
		
	MERGE [ETL].[LoadConnection] AS T
	USING (
		SELECT 
			[LoadConnectionID]							= @LoadConnectionID
		  ,	[SystemName]								= @SystemName
		  ,	[ServerName]								= @ServerName
		  ,	[Port]										= @Port
		  ,	[Path]										= @Path
		  ,	[AuthenticationType]						= @AuthenticationType
		  ,	[UserName]									= @UserName
		  ,	[Password]									= @Password
		  ,	[IsActive]									= @IsActive
	) S
	ON (S.[LoadConnectionID] = T.[LoadConnectionID])
	WHEN MATCHED
	THEN UPDATE
		 SET    
		  	[SystemName]								= COALESCE(@SystemName, T.[SystemName])
		  ,	[ServerName]								= COALESCE(@ServerName, T.[ServerName])
		  ,	[Port]										= COALESCE(@Port, T.[Port])
		  ,	[Path]										= COALESCE(@Path, T.[Path])
		  ,	[AuthenticationType]						= COALESCE(@AuthenticationType, T.[AuthenticationType])
		  ,	[UserName]									= COALESCE(@UserName, T.[UserName])
		  ,	[Password]									= COALESCE(@Password, T.[Password])
		  ,	[IsActive]									= COALESCE(@IsActive, T.[IsActive])
		  ,	[UpdatedDT]									= GETDATE()
	WHEN NOT MATCHED BY TARGET
	THEN INSERT (
		  	[SystemName]
		  ,	[ServerName]
		  ,	[Port]
		  ,	[Path]
		  ,	[AuthenticationType]
		  ,	[UserName]
		  ,	[Password]
		  ,	[IsActive]
		  ,	[CreatedDT]
	)
	VALUES (
		@SystemName
	,	@ServerName
	,	@Port
	,	@Path
	,	@AuthenticationType
	,	@UserName
	,	@Password
	,	@IsActive
	,	GETDATE()
	)
	OUTPUT S.LoadConnectionID, $action into @MergeLog;

	SELECT MergeAction, count(*) AS cnt
	FROM   @MergeLog
	GROUP BY MergeAction


END








--	-- SET THE DATE TIME FOR THE UPDATE/INSERT
--	DECLARE @CurrentDT DATETIME2(7) = GETDATE()

--	-- If Table totally blank
--	IF NOT EXISTS (	
--		SELECT * FROM [dbo].[Ensamble_JoinType]
--	)
--	BEGIN
--		-- If nothing in table, automatically do an insert
--		GOTO INSERTSTATEMENT

--	END
--	ELSE
--	BEGIN
--		-- Check if Parameters are sent in
--		IF(@JoinTypeID IS NULL)
--		BEGIN
--			-- Check if JoinTypeID can be derived from Join Type Code 
--			SET @JoinTypeID = (SELECT [JoinTypeID] FROM [dbo].[Ensamble_JoinType] WHERE [JoinTypeCode] = @JoinTypeCode)
			
--			-- IF NULL After the check to the UNIQUE Contraint, we are dealing with an Insert
--			IF(@JoinTypeID IS NULL)
--			BEGIN
--				GOTO INSERTSTATEMENT
--			END
			
--			-- ELSE we will do an update
--			ELSE 
--			BEGIN
--				GOTO UPDATESTATEMENT
--			END

--		END
--		ELSE
--		-- We have an JoinTypeID so lets try an Update
--		BEGIN
--			GOTO UPDATESTATEMENT

--		END
--	END



--INSERTSTATEMENT:
--	INSERT INTO 
--					[dbo].[Ensamble_JoinType] (
--						[JoinTypeCode]
--					,	[JoinTypeDescription]
--					,	[SourceElementTypeID]
--					,	[TargetElementTypeID]
--				)
--				SELECT 
--					@JoinTypeCode
--				,	@JoinTypeDescription
--				,	@SourceElementTypeID
--				,	@TargetElementTypeID

--	RETURN 0
	
--UPDATESTATEMENT:
--			UPDATE 
--				[dbo].[Ensamble_JoinType]
--			SET 				
--				[JoinTypeCode]			= COALESCE(@JoinTypeCode, [JoinTypeCode])
--			,	[JoinTypeDescription]	= COALESCE(@JoinTypeDescription, [JoinTypeDescription])
--			,	[SourceElementTypeID]	= COALESCE(@SourceElementTypeID, [SourceElementTypeID])
--			,	[TargetElementTypeID]	= COALESCE(@TargetElementTypeID, [TargetElementTypeID])
--			,	[UpdatedDT]				= @CurrentDT
--			,	[IsActive]				= COALESCE(@IsActive, [IsActive])
--			WHERE
--				[JoinTypeID] = @JoinTypeID

--	RETURN 0
--	*/
--END