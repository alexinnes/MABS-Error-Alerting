#requires -RunAsAdministrator
Import-Module "DataProtectionManager"

$getJobs = Get-DPMJob

$failedJobs = $getJobs | where {$_.status -eq "Failed"}

$failarray = @()

foreach ($failedjob in $failedJobs){
    $failObject = [ordered]@{
        Status = $failedJob.status
        ProtectionGroup = $failedjob.Protectiongroupname
        Error = $failedJob.tasks.errorcode
        Datasources = $failedjob.DataSources
        StartTime = $failedjob.starttime
        EndTime = $failedjob.endtime
        Duration = (New-TimeSpan -Start $failedjob.starttime -End $failedjob.endtime)
        
    }
    $failArray += $failObject
}
$failarray