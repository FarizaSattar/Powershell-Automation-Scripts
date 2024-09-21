# Import user data from CSV file
$users = Import-Csv "C:\Scripts\NewUsers.csv"

foreach ($user in $users) {
    New-ADUser -Name $user.Name `
        -GivenName $user.FirstName `
        -Surname $user.LastName `
        -SamAccountName $user.Username `
        -UserPrincipalName "$($user.Username)@domain.com" `
        -Path "OU=Users,DC=domain,DC=com" `
        -AccountPassword (ConvertTo-SecureString "Password123!" -AsPlainText -Force) `
        -Enabled $true
}
