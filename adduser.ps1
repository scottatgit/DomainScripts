
$path = "C:\scripts\userlist.csv"
Import-Csv $path | Foreach-Object {
    $name=$_.Name
    $GivenName=$_.GivenName
    $Surname=$_.Surname 
    $SamAccountName=$_.SamAccountName 
    $UserPrincipalName=$_.UserPrincipalName
    $Path=$_.Path
    $AccountPassword=ConvertTo-SecureString $_.AccountPassword –asplaintext –force
    $Enable=[boolean]$_.Enable

    $passwordNeverExpires=[boolean]$_.passwordNeverExpires

    $Identity=$_.Identity
    $Members=$_.Members 
        
     New-ADUser -Name $name -GivenName $GivenName -Surname $Surname -SamAccountName $SamAccountName -UserPrincipalName $UserPrincipalName -Path $Path -AccountPassword $AccountPassword -Enabled $Enabled -passwordNeverExpires $passwordNeverExpires
    Add-ADGroupMember -Identity $Identity -Members $Members

    #New-ADUser -Name "Pete McKee" -GivenName "Pete" -Surname "McKee" -SamAccountName "pmckee.0000" -UserPrincipalName "pete.mckee@warrenaverett.com" -Path "CN=Users,DC=Fieldstone,DC=local" -AccountPassword(Read-Host -AsSecureString "Input Password") -Enabled $true -passwordNeverExpires $true
    #Add-ADGroupMember -Identity "Domain Admins" -Members "pmckee.0000"
} 















