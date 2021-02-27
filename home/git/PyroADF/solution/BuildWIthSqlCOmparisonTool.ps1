$AllArgs = @("/scripts1:$MyDatabasePath", "/server2:$MyServerInstance",
      '/quiet', "/database2:model","/scriptfile:$MyDatabasePath\$MyDatabase.sql")
if (Test-Path "$MyDatabasePath\$MyDatabase.sql" ) {Remove-item "$MyDatabasePath\$MyDatabase.sql" }
&$SQLCompare $AllArgs
if ($?) {'Script generated successfully'}
   else {"we had an error! (code $LASTEXITCODE)"}