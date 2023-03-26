# RUDRA Shelcal PoC

## This PoC does the following:
1. Creates a Linux EC2 instance in a precreated VPC with a Public Subnet
2. Deploys it in the Public Subnet
3. Creates a Security Group that allows SSH access to 0.0.0.0/0 and attaches it to the Instance
4. Creates a DNS record called "rudra" in an hosted zone called "veludandi.online"

## Running Instances on AWS before deployment

![Running-Instances-Before.png](./img/Running-Instances-Before.png)

## HostedZone on AWS before DNS Record creation

![HostedZone-Before-DNSRecord.png](./img/HostedZone-Before-DNSRecord.png)

## Running Instances on AWS after deployment

![Running-Instances-After.png](./img/Running-Instances-After.png)

## HostedZone on AWS after DNS Record creation

![HostedZone-After-DNSRecord.png](./img/HostedZone-After-DNSRecord.png)