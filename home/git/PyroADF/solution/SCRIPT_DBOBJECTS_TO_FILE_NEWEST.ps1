Import-Module -Name SqlServer

$server 			= "PYROMANIAC\PYROSQL"
$database 			= "DataManager_2020723"
$user 				= "sa"
$passwd				= "105022"
$schemas_include	= $null
$schemas_exclude	= $null
$output_path 		= "C:\out\schema\$database"
$output_path 	   += "\$schema"

$table_path 		= "\Table\"
$storedProcs_path 	= "\StoredProcedure\"
$triggers_path 		= "\Triggers\"
$views_path 		= "\View\"
$udfs_path 			= "\UserDefinedFunction\"
$textCatalog_path 	= "\FullTextCatalog\"
$udtts_path 		= "$output_path\UserDefinedTableTypes\"

[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SMO") | out-null


#$srv 		= New-Object "Microsoft.SqlServer.Management.SMO.Server" $server
$srv  		= New-Object ('Microsoft.SqlServer.Management.Smo.Server') -argumentlist $server
$srv.ConnectionContext.LoginSecure = $false
$srv.ConnectionContext.set_Login($user)
$srv.ConnectionContext.set_Password($passwd)



$db 		= New-Object ("Microsoft.SqlServer.Management.SMO.Database")
$sch 		= New-Object ("Microsoft.SqlServer.Management.SMO.Schema")
$tbl 		= New-Object ("Microsoft.SqlServer.Management.SMO.Table")
$scripter 	= New-Object ("Microsoft.SqlServer.Management.SMO.Scripter") ($server)

# Get the database and table objects
$db = $srv.Databases[$database]

$schemas		    = $db.schemas | Where-object { $_.schema -notin $_.IsSystemObject }
$tables  	 	    = $db.tables | Where-object { $_.schema -notin  $_.IsSystemObject }
$storedprocedures	= $db.StoredProcedures | Where-object { $_.schema -notin  $_.IsSystemObject }
$triggers		    = $db.Triggers + ($tbl | % { $_.Triggers })  | Where-object { $_.schema -notin $_.IsSystemObject }
$views 		 	    = $db.Views | Where-object { $_.schema -notin $_.IsSystemObject }
$udfs		 	    = $db.UserDefinedFunctions | Where-object { $_.schema -notin $_.IsSystemObject }
$catlog		 	    = $db.FullTextCatalogs  | Where-object { $_.schema -notin $_.IsSystemObject }
$udtts		 	    = $db.UserDefinedTableTypes | Where-object { $_.schema -notin $_.IsSystemObject }

# On Erroro
$scripter.Options.ContinueScriptingOnError    = $false

# Overwrite or Append
$scripter.Options.AppendToFile              = $false

# Batch Terms
$scripter.Options.ScriptBatchTerminator		= $false

# Set scripter options to ensure only data is scripted
$scripter.Options.ScriptSchema 				= $true
$scripter.Options.ScriptData 				= $false
$scripter.Options.AllowSystemObjects		= $false

#Exclude GOs after every line
$scripter.Options.NoCommandTerminator 		= $false
$scripter.Options.ToFileOnly 				= $true
$scripter.Options.AllowSystemObjects 		= $false
$scripter.Options.Permissions 				= $true

$scripter.Options.SchemaQualify 			= $true
$scripter.Options.AnsiFile 					= $true
$scripter.Options.IncludeIfNotExists        = $true
$scripter.Options.ScriptDrops               = $false

# Indexes
$scripter.Options.ClusteredIndexes			= $true
$scripter.Options.NonClusteredIndexes		= $true
$scripter.Options.DriAllConstraints 		= $true
$scripter.Options.Indexes 					= $true
$scripter.Options.DriIndexes 				= $true
$scripter.Options.DriAllKeys 				= $true
$scripter.Options.DriPrimaryKey 			= $true
$scripter.Options.DriForeignKeys 			= $true
$scripter.Options.DriUniqueKeys 			= $true
$scripter.Options.DriDefaults 				= $true
$scripter.Options.Triggers 					= $true
$scripter.Options.Default 					= $true
$scripter.Options.SchemaQualifyForeignKeysReferences 	= $true


$scripter.Options.DriClustered 				    = $true
$scripter.Options.DriNonClustered 			    = $true
$scripter.Options.FullTextIndexes 			    = $true

$scripter.Options.EnforceScriptingOptions 		= $true

function CopyObjectsToFiles($objects, $outDir) {

	if (-not (Test-Path $outDir)) {
		[System.IO.Directory]::CreateDirectory($outDir)
	}

	foreach ($o in $objects) {

		if ($o -ne $null) {

			$schemaPrefix = ""

			if ($o.Schema -ne $null -and $o.Schema -ne "") {
				$schemaPrefix = $o.Schema + "."
			}

			$scripter.Options.FileName = $outDir + $schemaPrefix + $o.Name + ".sql"
			Write-Host "Writing " $scripter.Options.FileName
			$scripter.EnumScript($o)
		}
	}
}

# Output the scripts
CopyObjectsToFiles $schemas  $table_path
CopyObjectsToFiles $tables  $table_path
CopyObjectsToFiles $storedProcs $storedProcs_path
CopyObjectsToFiles $triggers $triggers_path
CopyObjectsToFiles $views $views_path
CopyObjectsToFiles $catlog $textCatalog_path
CopyObjectsToFiles $udtts $udtts_path
CopyObjectsToFiles $udfs $udfs_path

Write-Host "Finished at" (Get-Date)