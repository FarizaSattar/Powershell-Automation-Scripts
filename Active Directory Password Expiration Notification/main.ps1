# Define the number of days to notify users before password expiration
$warningDays = 10

# Get users whose passwords are expiring soon
$users = Get-ADUser -Filter {PasswordNeverExpires -eq $false -and Enabled -eq $true} -Property "msDS-UserPasswordExpiryTimeComputed" | 
         Where-Object {($_."msDS-UserPasswordExpiryTimeComputed" -lt (Get-Date).AddDays($warningDays).ToFileTime())} 

# Send email notification
foreach ($user in $users) {
    $emailAddress = "$($user.SamAccountName)@domain.com"
    $emailBody = "Hello $($user.Name), your password will expire in the next $warningDays days. Please update your password."

    Send-MailMessage -To $emailAddress -Subject "Password Expiration Notice" -Body $emailBody -SmtpServer "smtp.domain.com"
}
