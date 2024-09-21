# Define log file path
$logPath = "C:\Backups\EventLogs"

# Backup system event logs
$events = Get-WinEvent -LogName System -MaxEvents 1000
$events | Export-Clixml -Path "$logPath\SystemEventLogs_$((Get-Date).ToString('yyyyMMdd')).xml"
