#!/bin/bash

#############################
# Author: Sairam Bathini
# Date: 10-10-2023

# This is simple 3 Tier application created using AWS CLI
# Usage: Before running the script install and configure AWS CLI within the EC2 Instance


# Create a VPC

vpc_id= $(aws ec2 create-vpc --cidr-block 10.0.0.0/16 --query 'Vpc.VpcId' --output text)

# Enable DNS support and hostnames

aws ec2 modify-vpc-attribute --vpc-id $vpc_id --enable-dns-support
aws ec2 modify-vpc-attribute --vpc-id $vpc_id --enable-dns-hostnames

# Create subnets

subnet1_id=$(aws ec2 create-subnet --vpc-id $vpc_id --cidr-block 10.0.1.0/24 --availability-zone us-east-1a --query 'Subnet.SubnetId' --output text)


subnet2_id=$(aws ec2 create-subnet --vpc-id $vpc_id --cidr-block 10.0.2.0/24 --availability-zone us-east-1b --query 'Subnet.SubnetId' --output text)

# Create security groups

web_sg_id=$(aws ec2 create-security-group --group-name WebSG --vpc-id $vpc_id --description "Security Group for Web Servers" --query 'GroupId' --output text)

app_sg_id=$(aws ec2 create-security-group --group-name AppSG --vpc-id $vpc_id --description "Security Group for Application Servers" --query 'GroupId' --output text)

db_sg_id=$(aws ec2 create-security-group --group-name DBSG --vpc-id $vpc_id --description "Security Group for Database Servers" --query 'GroupId' --output text)

# Configure security group rules as needed
aws ec2 authorize-security-group-ingress --group-id $web_sg_id --protocol tcp --port 80 --cidr 0.0.0.0/0

# Configure security groups for app and db tiers similarly

# Launch EC2 instances
aws ec2 run-instances --image-id YOUR_WEB_AMI_ID --count 2 --instance-type t2.micro --key-name YOUR_KEY_PAIR_NAME --subnet-id $subnet1_id --security-group-ids $web_sg_id

aws ec2 run-instances --image-id YOUR_APP_AMI_ID --count 2 --instance-type t2.micro --key-name YOUR_KEY_PAIR_NAME --subnet-id $subnet2_id --security-group-ids $app_sg_id


# Launch RDS instance
aws rds create-db-instance --db-instance-identifier YOUR_DB_INSTANCE_NAME --db-instance-class db.t2.micro --engine mysql --allocated-storage 20 --master-username YOUR_DB_USERNAME --master-user-password YOUR_DB_PASSWORD --vpc-security-group-ids $db_sg_id --db-subnet-group-name default-vpc-YOUR_DB_SUBNET_GROUP_NAME --no-multi-az

