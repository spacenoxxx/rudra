# Get the network adapter with InterfaceDescription containing "VirtIO"
#Get-NetAdapter | Where-Object {$_.InterfaceDescription -like "*VirtIO*"} | Rename-NetAdapter -NewName "Ethernet"
#$adapter = Get-NetAdapter | Where-Object {$_.InterfaceDescription -like "*VirtIO*"}
$adapter = Get-NetAdapter | Where-Object {$_.InterfaceDescription -like "*Intel*"}

# Set a static IP address and gateway
$ipAddress = "192.168.101.6"
$subnetMask = "255.255.255.0"
$gateway = "192.168.101.1"

# Remove any existing IP addresses and set the new one
$adapter | Remove-NetIPAddress -Confirm:$false
New-NetIPAddress -InterfaceIndex $adapter.ifIndex -IPAddress $ipAddress -PrefixLength 24

# Remove any existing default gateways and set the new one
$adapter | Remove-NetRoute -Confirm:$false
New-NetRoute -InterfaceIndex $adapter.ifIndex -DestinationPrefix "0.0.0.0/0" -NextHop $gateway

# Set Hostname
Rename-Computer -NewName "PC1" -Restart


