# Define software installation paths
$software = @(
    "C:\Installers\7zip.msi",
    "C:\Installers\chrome_installer.exe"
)

foreach ($installer in $software) {
    if ($installer -like "*.msi") {
        Start-Process msiexec.exe -ArgumentList "/i $installer /quiet /norestart" -Wait
    } elseif ($installer -like "*.exe") {
        Start-Process -FilePath $installer -ArgumentList "/silent" -Wait
    }
    "Installed software from $installer" | Out-File -Append "C:\Logs\SoftwareInstallLog.txt"
}
