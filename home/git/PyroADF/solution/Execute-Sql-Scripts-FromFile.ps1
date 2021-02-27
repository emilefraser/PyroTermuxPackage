# At top of all my scripts
$ScriptHome = $ENV:PSScriptHome

# Folder Structure $ScriptHome\MainType\Subtype\Script.ps1
Import-Module "$ScriptHome\File System\File\Get-FilesInFolder.ps1"

function Test-IsSqlPs-Installed {
    [CmdletBinding()]
    [OutputType([psobject])]

    $Success = $False

    Try {
        If (!(Get-Module -Name sqlps)){
            Write-Host 'Loading SQLPS Module' -ForegroundColor DarkYellow
            Push-Location
            Import-Module sqlps -DisableNameChecking
            Pop-Location
            $Success = $True
        }
    } Catch {
        $Err = $_.Exception.Message
        Write-Host $Err
    }

    $Success
}

$SqlFilePath = "C:\Users\efras\OneDrive - AccTech Systems (Pty) Ltd\SQL Server\rls\Oil&Gas RLS Demo - Jamey Johnston - All Features\MSSQL 2016"
$SqlFiles = Get-FilesInFolder -PathName $SqlFilePath  -Extension_Included "sql"

foreach ($SqlFile in $SqlFiles){
        Write-Host "Running Script : " $SqlFile.Name -BackgroundColor Green -ForegroundColor White
        $Script = $SqlFile.FullName
        Write-Host $Script -ForegroundColor Yellow
        #Get-Content "$Script"

        Try {
            Invoke-Sqlcmd -ServerInstance "DESKTOP-POKCB4F" -InputFile $Script -ConnectionTimeout 0 -QueryTimeout 0
        #Invoke-Sqlcmd2 -ServerInstance "DESKTOP-POKCB4F" -InputFile $script
        }
        Catch {
            $Err = $Error[0]
            Write-Error($Err)
        }
}