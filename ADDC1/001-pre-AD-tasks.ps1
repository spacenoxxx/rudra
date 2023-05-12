# Parameters
$ipAddress = "10.1.1.201"
$subnetMask = "255.255.255.0"
$gateway = "10.1.1.254"
$dnsserver = "10.1.1.201"
$comp-name = "ADDC1"

$Password = ConvertTo-SecureString "!QAZ2wsx" -AsPlainText -Force
$UserAccount = Get-LocalUser -Name "Administrator"
$userAccount | Set-LocalUser -Password $Password

# Rename Interface
Get-NetAdapter | Where-Object {$_.InterfaceDescription -like "*Intel*"} | Rename-NetAdapter -NewName "Ethernet"
$adapter = Get-NetAdapter | Where-Object {$_.InterfaceDescription -like "*Intel*"}

# Remove any existing IP addresses and set the new one
$adapter | Remove-NetIPAddress -Confirm:$false
New-NetIPAddress -InterfaceIndex $adapter.ifIndex -IPAddress $ipAddress -PrefixLength 24

# Remove any existing default gateways and set the new one
$adapter | Remove-NetRoute -Confirm:$false
New-NetRoute -InterfaceIndex $adapter.ifIndex -DestinationPrefix "0.0.0.0/0" -NextHop $gateway

#Set DNS Server 
#Set-DnsClientServerAddress -InterfaceIndex $adapter.ifIndex -ServerAddresses $dnsserver

#Setup Default Gateway
$adapter | Remove-NetRoute -Confirm:$false
New-NetRoute -InterfaceIndex $adapter.ifIndex -DestinationPrefix "0.0.0.0/0" -NextHop $gateway

#Enable RDP
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Value 0
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" -Name "UserAuthentication" -Value 0
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"


#Remove IPv6 binding
Disable-NetAdapterBinding -Name 'Ethernet' -ComponentID 'ms_tcpip6'

# Set Hostname
Rename-Computer -NewName $comp-name -Restart
