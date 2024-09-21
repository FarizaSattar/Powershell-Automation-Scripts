# Define threshold (in GB)
$threshold = 10
$logPath = "C:\Logs\DiskSpaceLog.txt"

# Get disk space information
$drives = Get-PSDrive -PSProvider FileSystem

foreach ($drive in $drives) {
    $freeSpaceGB = [math]::Round($drive.Free/1GB, 2)
    if ($freeSpaceGB -lt $threshold) {
        $message = "Drive $($drive.Name): Only $freeSpaceGB GB free space left."
        $date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        "[$date] - $message" | Out-File -Append $logPath

        # Send email alert (optional)
        Send-MailMessage -To "admin@domain.com" -Subject "Low Disk Space Alert" -Body $message -SmtpServer "smtp.domain.com"
    }
}
