#requires -RunAsAdministrator
Import-Module "DataProtectionManager"

$dpm_alert = Get-DPMAlert

$header = @"
<style>
TABLE {border-width: 1px; border-style: solid; border-color: black; border-collapse: collapse;}
TD {border-width: 1px; padding: 3px; border-style: solid; border-color: black;}
</style>
"@


$dpm_alert | where{$_.isresolved -eq $false} | select targetobjectname, errorinfo, severity, server | ConvertTo-Html -Head $header | Out-File C:\Temp\testHTML.html