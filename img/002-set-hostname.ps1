# Parameters
$ipAddress = "10.1.1.202"
$subnetMask = "255.255.255.0"
$gateway = "10.1.1.254"
$dnsserver = "10.1.1.201"
$comp-name = "SRV1"

# Rename Interface
Get-NetAdapter | Where-Object {$_.InterfaceDescription -like "*VirtIO*"} | Rename-NetAdapter -NewName "Ethernet"
$adapter = Get-NetAdapter | Where-Object {$_.InterfaceDescription -like "*VirtIO*"}
#$adapter = Get-NetAdapter | Where-Object {$_.InterfaceDescription -like "*Intel*"}

# Remove any existing IP addresses and set the new one
$adapter | Remove-NetIPAddress -Confirm:$false
New-NetIPAddress -InterfaceIndex $adapter.ifIndex -IPAddress $ipAddress -PrefixLength 24

# Remove any existing default gateways and set the new one
$adapter | Remove-NetRoute -Confirm:$false
New-NetRoute -InterfaceIndex $adapter.ifIndex -DestinationPrefix "0.0.0.0/0" -NextHop $gateway

#Set DNS Server 
Set-DnsClientServerAddress -InterfaceIndex $adapter.ifIndex -ServerAddresses $dnsserver

$adapter | Remove-NetRoute -Confirm:$false
New-NetRoute -InterfaceIndex $adapter.ifIndex -DestinationPrefix "0.0.0.0/0" -NextHop $gateway

# Set Hostname
Rename-Computer -NewName $comp-name -Restart
