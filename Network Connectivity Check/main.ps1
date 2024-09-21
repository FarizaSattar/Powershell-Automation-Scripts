# Define server list
$servers = @("server1", "server2", "server3")

# Log file path
$logPath = "C:\Logs\PingTestLog.txt"

# Test network connectivity
foreach ($server in $servers) {
    $pingResult = Test-Connection -ComputerName $server -Count 2 -Quiet
    $date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    if ($pingResult) {
        "[$date] - $server is reachable" | Out-File -Append $logPath
    } else {
        "[$date] - $server is NOT reachable" | Out-File -Append $logPath
    }
}
