# Define the provider (AWS in this case)
provider "aws" {
  region = "us-east-1"  
}

# Create a VPC
resource "aws_vpc" "sre_vpc" {
  cidr_block = "10.0.0.0/16" 
  tags = {
    Name = "sre-course"
  }
}

# Create a subnet within the VPC
resource "aws_subnet" "sre_subnet" {
  vpc_id                  = aws_vpc.sre_vpc.id
  cidr_block              = "10.0.0.0/24"  
  availability_zone       = "us-east-1a"  
  map_public_ip_on_launch = true  
    tags = {
    Name = "sre-course"
  }
}

# Create a security group
resource "aws_security_group" "sre_security_group" {
  name        = "sre-security-group"
  description = "My SRE Security Group"

  vpc_id = aws_vpc.sre_vpc.id

  # Inbound rule example (allow SSH access)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  
  }
    tags = {
    Name = "sre-course"
  }


}

# Create an EC2 instance
resource "aws_instance" "sre_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type 
  key_name      = var.key_name 

  vpc_security_group_ids = [aws_security_group.sre_security_group.id]
  subnet_id              = aws_subnet.sre_subnet.id
    tags = {
    Name = "sre-course"
  }
}
