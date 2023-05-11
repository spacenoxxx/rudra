$domain = "rudra.local"
$admin_username = "Administrator"
$admin_password = ConvertTo-SecureString "!QAZ2wsx" -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential($admin_username, $admin_password)

Add-Computer -DomainName $domain -Credential $credential -Restart
