#extract a DacPac
$MyInstance = 'MyInstance' #the instance where the database is that you want copy from
$MyDatabase = 'MyDatabase'
$MyTargetInstance = 'MyTargetInstance' #the instance where the database is that you want copy from
$MyTargetDatabase = 'MyTargetDatabase'
$WhereTheDacPacGoes = 'MyPath'
$WhereTheScriptGoes = 'MyPath'
$DacpacFile = "$WhereTheDacPacGoes\$MyDatabase.DacPac"
$scriptFile = "$WhereTheScriptGoes\$($MyDatabase)MigrationScript.sql"
#Check that the directories exist, if not create them
($WhereTheDacPacGoes, $WhereTheScriptGoes) | %{
    if (!(Test-Path -path $_))
    {
        Try { New-Item $_ -type directory | out-null }
        Catch [system.exception]{
             Write-Error "error while creating the '$_' directory"
            return
        }
    }
}


& "$env:programfiles (x86)\Microsoft SQL Server\110\DAC\bin\sqlpackage.exe" @(
'/Action:Extract', #extract it
"/SourceServerName:$MyInstance", #The SQL Server instance
"/SourceDatabaseName:$MyDatabase", #The database to scrip
"/TargetFile:$DacpacFile",
'/p:ExtractAllTableData=false') # and the file to put it in


& "$env:programfiles (x86)\Microsoft SQL Server\110\DAC\bin\sqlpackage.exe" @(
'/Action:Script', #extract it
"/Sourcefile:$DacpacFile", #The SQL Server instance
"/TargetServerName:$MyTargetInstance", #The SQL Server instance
"/TargetDatabaseName:$MyTargetDatabase", #The database to script
"/OutPutPath:$scriptFile") # The migration script