# Define home directory path
$homeDirPath = "C:\Users\"

# Remove files older than 60 days
Get-ChildItem $homeDirPath -Recurse | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-60) } | Remove-Item -Force

# Log cleanup
$date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
"[$date] - Cleaned up user home directories" | Out-File -Append "C:\Logs\HomeDirCleanupLog.txt"
