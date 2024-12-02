21-11-2024 a4l vpc creation completed. Tested with a instance which require internet.

# Terraform VPC Setup

This repository contains Terraform configuration files for setting up a Virtual Private Cloud (VPC) in AWS, with multiple subnets, route tables, and an Internet Gateway for public access.

## Overview

This setup creates a basic AWS VPC with the following resources:

- **VPC**: A Virtual Private Cloud with CIDR block `10.16.0.0/16`.
- **Subnets**: Several subnets across three availability zones (`us-east-1a`, `us-east-1b`, and `us-east-1c`).
  - Reserved subnets (`sn-reserved-A`, `sn-reserved-B`, `sn-reserved-C`).
  - Database subnets (`sn-db-A`, `sn-db-B`, `sn-db-C`).
  - Application subnets (`sn-app-A`, `sn-app-B`, `sn-app-C`).
  - Web subnets (`sn-web-A`, `sn-web-B`, `sn-web-C`).
- **Internet Gateway**: Provides internet access for public subnets.
- **Route Tables**: Configured to route traffic from public subnets to the internet.

## Prerequisites

- **Terraform**: Install Terraform on your machine. You can find installation instructions on the [Terraform website](https://www.terraform.io/downloads.html).
- **AWS Account**: Ensure you have an AWS account with sufficient permissions to create resources like VPC, subnets, route tables, and Internet Gateway.

## Setup

### 1. Clone the repository

```bash
git clone https://gitlab.com/your-username/terraform-vpc-setup.git
cd terraform-vpc-setup

2. Configure AWS Credentials
Ensure your AWS credentials are configured by running:

```bash
aws configure


Or set environment variables:

```bash
export AWS_ACCESS_KEY_ID="your-access-key"
export AWS_SECRET_ACCESS_KEY="your-secret-key"
export AWS_DEFAULT_REGION="us-east-1"

3. Initialize Terraform
Run the following command to initialize Terraform and download the required providers:

```bash
terraform init

4. Apply the Configuration
Run the following command to apply the configuration and create the VPC in AWS:

```bash
terraform apply --auto-approve



5. Output
After applying the configuration, Terraform will display the created resources, including the VPC ID and Subnet IDs.

Cleanup
To destroy the resources created by this configuration, use the following command:

```bash
terraform destroy

This will remove all the resources provisioned by Terraform.