#Set AD DNS Reverse Lookup Zone
Add-DnsServerPrimaryZone -NetworkID "192.168.101.0/24" -ReplicationScope "Domain"

#Set ADDC's own IP as the defaultr DNS Server
Set-DNSClientServerAddress "Ethernet" -ServerAddresses "10.1.1.201"

#Set ADDC's PTR Record in the Reverse Zone
Add-DnsServerResourceRecordPtr -Name "201" -ZoneName "1.1.10.in-addr.arpa" -AllowUpdateAny -TimeToLive 01:00:00 -AgeRecord -PtrDomainName "addc1.rudra.local"

#Create Other PTR records preemptively
Add-DnsServerResourceRecordPtr -Name "202" -ZoneName "1.1.10.in-addr.arpa" -AllowUpdateAny -TimeToLive 01:00:00 -AgeRecord -PtrDomainName "srv1.rudra.local"
Add-DnsServerResourceRecordPtr -Name "203" -ZoneName "1.1.10.in-addr.arpa" -AllowUpdateAny -TimeToLive 01:00:00 -AgeRecord -PtrDomainName "srv2.rudra.local"
Add-DnsServerResourceRecordPtr -Name "204" -ZoneName "1.1.10.in-addr.arpa" -AllowUpdateAny -TimeToLive 01:00:00 -AgeRecord -PtrDomainName "srv3.rudra.local"
Add-DnsServerResourceRecordPtr -Name "205" -ZoneName "1.1.10.in-addr.arpa" -AllowUpdateAny -TimeToLive 01:00:00 -AgeRecord -PtrDomainName "srv4.rudra.local"

Add-DnsServerResourceRecordPtr -Name "206" -ZoneName "1.1.10.in-addr.arpa" -AllowUpdateAny -TimeToLive 01:00:00 -AgeRecord -PtrDomainName "pc1.rudra.local"
Add-DnsServerResourceRecordPtr -Name "207" -ZoneName "1.1.10.in-addr.arpa" -AllowUpdateAny -TimeToLive 01:00:00 -AgeRecord -PtrDomainName "pc2.rudra.local"
Add-DnsServerResourceRecordPtr -Name "208" -ZoneName "1.1.10.in-addr.arpa" -AllowUpdateAny -TimeToLive 01:00:00 -AgeRecord -PtrDomainName "pc3.rudra.local"
Add-DnsServerResourceRecordPtr -Name "209" -ZoneName "1.1.10.in-addr.arpa" -AllowUpdateAny -TimeToLive 01:00:00 -AgeRecord -PtrDomainName "pc4.rudra.local"

