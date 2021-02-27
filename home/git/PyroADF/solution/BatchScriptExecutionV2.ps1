<#
 .SYNOPSIS Execute SQL Script in order
 .Parameter Server Provide SQL Server Name
 .Parameter DatabaseName Provide database name
 .Parameter UserName Provide a windows user name or SQL Server user name
 .Parameter Password Provide password as a secure string
 .Parameter ScriptPath Provide the path where all the SQL scripts are located
 .Parameter ContineOnException Enable this switch to continue even if one of the script failed to execute
 .EXAMPLE
 $SecurePass = ConvertTo-SecureString "MyPassword"
 Invoke-BatchSqlExecution -Server "MyServer" -DatabaseName "MyDatabasae" -UserName "MyUserId" -Password $SecurePass -ScriptPath "C:\Temp\SQL" -ContinueOnException
#>
function Invoke-BatchSqlExecution {
    param(
        [parameter(Mandatory = $True, Position = 0)]
        [string]$Server,
        [parameter(Mandatory = $True, Position = 1)]
        [string]$DatabaseName,
        [parameter(Mandatory = $True, Position = 2)]
        [string]$UserName,
        [parameter(Mandatory = $True, Position = 3)]
        [SecureString]$Password,
        [parameter(Mandatory = $True, Position = 3)]
        [string]$ScriptPath,
        [parameter(Mandatory = $False, Position = 3)]
        [switch]$ContinueOnException
    )

    $error.clear()

    $Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $Username, $Password

    $windowsusername = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name.ToString()
    $Datetime = Get-Date
    $processstarttime = $Datetime.ToString("yyyyMMddHHmmssfff")
    $logfile = "$ScriptPath\executionlog_$processstarttime.log"

    Start-Transcript -Path $logfile
    Write-Host  "Batch Execution Date   : $Datetime"
    Write-Host  "Server Name            : $server"
    Write-Host  "Database Name          : $DatabaseName"
    Write-Host  "User Name              : $UserName"
    Write-Host  "Executed By            : $windowsusername"
    Write-Host  "Script Path            : $ScriptPath"
    Write-Host  "Log File               : $logfile"
    Write-Host  $("*" * 100) -ForegroundColor Cyan

    $checkmodule = Get-Module -ListAvailable | Where-Object { $_.Name -eq "dbatools" }
    if (!$checkmodule) {
        Write-Host "Installing dbatools module" -ForegroundColor Cyan
        Start-Process powershell.exe -ArgumentList "-Command Install-Module dbatools" -Verb RunAs -Wait
    }
    elseif ($checkmodule) {
        Import-Module dbatools -Force
        Write-Host "dbatools module already exists" -ForegroundColor Green
    }

    if (!(Test-Path $ScriptPath)) {
        Write-Host "$ScriptPath does not exists or the user does not have access" -ForegroundColor Red
        Break
    }

    # Run all security based scripts first to create all the schemas and other neccessary artefacts
    foreach ($file in Get-ChildItem $ScriptPath -Filter "*.sql" -Recurse -Include "*Security*" | Sort-Object -Property FullName) {
        try {
            Write-Host "****** PROCESSING $file SECURITY FILE ******" -ForegroundColor Yellow
            Invoke-DbaQuery -SqlInstance $Server `
                -SqlCredential $Credential `
                -Database $DatabaseName `
                -File $file.FullName `
                -EnableException `
                -MessagesToOutput

            Write-Host "******SUCCESSFULLY PROCESSED $file SECURITY FILE ******" -ForegroundColor Green
            Write-Host $("*" * 100)

        }
        catch {
            Write-Host "******FAILED PROCESSING $file SECURITY FILE ******" -ForegroundColor Red
            Write-Host $($Error[0].Exception.Message) -ForegroundColor Red
            Write-Host $("*" * 100)
            IF ($ContinueonException.IsPresent) {
                continue
            }
            else { throw }
        }
    }
    Write-Host "****** All Security Files Processed Successfully ******" -ForegroundColor Green

    foreach ($file in Get-ChildItem $ScriptPath -Filter "*.sql" -Recurse -Exclude "*Security*" | Sort-Object -Property FullName) {
        try {
            Write-Host "****** PROCESSING $file FILE ******" -ForegroundColor Yellow
            Invoke-DbaQuery -SqlInstance $Server `
                -SqlCredential $Credential `
                -Database $DatabaseName `
                -File $file.FullName `
                -EnableException `
                -MessagesToOutput

            Write-Host "******SUCCESSFULLY PROCESSED $file FILE ******" -ForegroundColor Green
            Write-Host $("*" * 100)

        }
        catch {
            Write-Host "******FAILED PROCESSING $file FILE ******" -ForegroundColor Red
            Write-Host $($Error[0].Exception.Message) -ForegroundColor Red
            Write-Host $("*" * 100)
            IF ($ContinueonException.IsPresent) {
                continue
            }
            else { throw }
        }
    }
    Write-Host "****** All Files Processed Successfully ******" -ForegroundColor Green
    Stop-Transcript
}


$SecurePass = "105022_Alpha" | ConvertTo-SecureString -AsPlainText -Force
Invoke-BatchSqlExecution -Server "acazmssql01.database.windows.net" -DatabaseName "AcAzMetadataDB" -UserName "emilefraser" -Password $SecurePass -ScriptPath "C:\Repos\PyroADF\solution\ADF.procfwk\MetadataDB" -ContinueOnException