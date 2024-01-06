variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "Amazon Machine Image (AMI) ID for EC2 instance"
  type        = string
}

variable "key_name" {
  description = "Name of the EC2 key pair"
  type        = string
}
