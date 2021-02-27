$MyTargetInstance='MyTargetServer\MyInstance #The SQL Server target instance'
$TargetDatabase='AdventureWorks2'#The name of the target database

$AllArgs = @("/scripts1:$MyDatabasePath", "/server2:$MyTargetInstance",
      '/quiet', "/database2:$targetDatabase","/scriptfile:$MyDatabasePath\$MyDatabase.sql")
if (Test-Path "$MyDatabasePath\$MyDatabase.sql" ) {Remove-item "$MyDatabasePath\$MyDatabase.sql" }
&$SQLCompare $AllArgs
if ($?) {' Script generated successfully'}
   else {"we had an error! (code $LASTEXITCODE)"}