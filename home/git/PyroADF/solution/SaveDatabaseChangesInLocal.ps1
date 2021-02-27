$SQLCompare="${env:ProgramFiles(x86)}\Red Gate\SQL Compare 10\sqlcompare.exe"# full path
 $MyServerInstance='MyServer\MyInstance' #The SQL Server instance
 $MyDatabase='AdventureWorks' #The name of the database
 $MyDatabasePath = "$($env:HOMEDRIVE)$($env:HOMEPATH)\Documents\GitHub\$MyDatabase"

 $AllArgs = @("/server1:$MyServerInstance", "/database1:$MyDatabase ",
    "/scripts2:$MyDatabasePath", '/q', '/synch',
    "/report:$($MyDatabasePath).html", "/reportType:Simple", "/rad", "/force")

 if (-not (Test-Path -PathType Container $MyDatabasePath))
 { New-Item -ItemType Directory -Force -Path $MyDatabasePath }
 &$SQLCompare $AllArgs
 if ($?) { 'updated successfully' }
 else
 {
    if ($LASTEXITCODE -eq 63) { 'Database and scripts were identical' }
    else { "we had an error! (code $LASTEXITCODE)" }
 }