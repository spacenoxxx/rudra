# Set variables
$domainName = "RUDRA.LOCAL"
$domainNetBIOSName = "RUDRA"
$forestName = "RUDRA.LOCAL"
$username = "Administrator"  # Enter local administrator username here
$password = ConvertTo-SecureString "!QAZ2wsx" -AsPlainText -Force  # Enter local administrator password here
$adminCreds = New-Object System.Management.Automation.PSCredential ($username, $password)

# Install AD DS feature
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

#Install AD Forest
Install-ADDSForest -CreateDnsDelegation:$false -DatabasePath C:\Windows\NTDS -DomainMode WinThreshold -DomainName $domainName -DomainNetbiosName $domainNetBIOSName -ForestMode WinThreshold -InstallDns:$true -LogPath C:\Windows\NTDS -NoRebootOnCompletion:$true -SafeModeAdministratorPassword $Password -SysvolPath C:\Windows\SYSVOL -Force:$true

# Restart the server
Restart-Computer
