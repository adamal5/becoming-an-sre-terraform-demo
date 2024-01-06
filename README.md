# Terraform AWS Infrastructure

This repository contains Terraform configuration files to create AWS infrastructure components, including a Virtual Private Cloud (VPC), a subnet, a security group, and an EC2 instance.

## Prerequisites

Before you begin, ensure you have the following:

- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- AWS access and secret access keys configured properly.

## Configuration

### Provider Configuration

In `main.tf`, the AWS provider is configured with the region set to `us-east-1`. You can modify the region to match your desired AWS region.

### VPC, Subnet, and Security Group

The Terraform configuration in `main.tf` defines the following resources:

- **VPC**: A Virtual Private Cloud with a CIDR block of `10.0.0.0/16`.

- **Subnet**: A subnet within the VPC with a CIDR block of `10.0.0.0/24` in the `us-east-1a` availability zone. It also enables the automatic assignment of public IP addresses to instances launched in this subnet.

- **Security Group**: A security group named "sre-security-group" is created, allowing inbound traffic on port 22 (SSH) from anywhere (`0.0.0.0/0`).

### EC2 Instance

An EC2 instance is defined in `main.tf` using the resource type `aws_instance`. You can customize the instance details by modifying the variables in `terraform.tfvars`.

## Usage

1. Clone this repository to your local machine:
   ```git clone <repository_url>```
   
2. Navigate to the repository directory:
```cd <repository_directory>```

3. Initialize Terraform:

`terraform init`

4. Review the execution plan:
`terraform plan`

5. Apply the Terraform configuration to create the AWS infrastructure:
`terraform apply` 

6. Confirm the action by typing yes when prompted.

## Variables
You can customize the EC2 instance type, AMI ID, and key name by modifying the values in the terraform.tfvars file.

## Outputs
The Terraform configuration includes an output that displays information about the created EC2 instance. You can view this information after running terraform apply.

## Cleanup
To destroy the AWS infrastructure created by Terraform, use the following command:
`terraform destroy`

Confirm the action by typing yes when prompted.

Author
Our Tech Journey