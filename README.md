# RUDRA Shelcal PoC

## This PoC uses AWS CloudFormation template to:
1. Create a Linux EC2 instance in a precreated VPC with a Public Subnet
2. Deploy it in the Public Subnet
3. Create a Security Group that allows SSH access to 0.0.0.0/0 and attaches it to the Instance
4. Create a DNS record called "rudra" in an hosted zone called "veludandi.online"

## Running Instances on AWS before Instance deployment

![Running-Instances-Before.png](./img/Running-Instances-Before.png)

## HostedZone on AWS before DNS Record creation

![HostedZone-Before-DNSRecord.png](./img/HostedZone-Before-DNSRecord.png)

## Running Instances on AWS after Instance deployment

![Running-Instances-After.png](./img/Running-Instances-After.png)

## HostedZone on AWS after DNS Record creation

![HostedZone-After-DNSRecord.png](./img/HostedZone-After-DNSRecord.png)

## To test the PoC, do the following. You must already have the following (AWS Account with aws-cli configured)

Run the following command with aws-cli `aws cloudformation deploy --template-file ec2-noip.yaml --stack-name ec2-noip2 --region ap-south-1`