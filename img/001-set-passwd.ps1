$Password = ConvertTo-SecureString "!QAZ2wsx" -AsPlainText -Force
$UserAccount = Get-LocalUser -Name "rudra"
$userAccount | Set-LocalUser -Password $Password