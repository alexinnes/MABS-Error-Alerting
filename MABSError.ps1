#requires -RunAsAdministrator

#needs to be run on a box with DPM/MABS
Import-Module "DataProtectionManager"

$getJobs = Get-DPMJob

#gets the failed jobs - might update for all jobs so can filter via function
$failedJobs = $getJobs | where {$_.status -eq "Failed"}

$failarray = @()

#loop jobs and pull relevant info
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