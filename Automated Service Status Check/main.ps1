# Define services to monitor
$services = @("Spooler", "wuauserv")

foreach ($service in $services) {
    $svc = Get-Service -Name $service
    if ($svc.Status -eq 'Stopped') {
        Start-Service -Name $service
        "Service $service was stopped and has been restarted." | Out-File -Append "C:\Logs\ServiceStatusLog.txt"
    }
}
