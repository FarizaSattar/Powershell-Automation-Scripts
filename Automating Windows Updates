# Install Windows updates
Install-WindowsUpdate -AcceptAll -IgnoreReboot

# Log update status
$date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
"[$date] - Installed available Windows updates" | Out-File -Append "C:\Logs\WindowsUpdateLog.txt"
