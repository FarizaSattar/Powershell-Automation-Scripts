# Define the folder path
$folderPath = "C:\Temp"

# Remove files older than 30 days
Get-ChildItem -Path $folderPath -Recurse | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-30) } | Remove-Item -Force

# Log deletion
$date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
"[$date] - Deleted files older than 30 days in $folderPath" | Out-File -Append "C:\Logs\FileCleanupLog.txt"
