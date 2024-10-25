variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-0ea3c35c5c3284d82"  # Example AMI ID for Amazon Linux 2 (update as needed)
}

variable "tags" {
  description = "Tags for the EC2 instance"
  type        = map(string)
  default     = {
    Name = "TerraformEC2"
  }
}

variable "environment" {
  description = "Environment name (dev or prod)"
  type        = string
  default     = "dev"
}
