variable "instance_type" {
  description = "EC2 instance type"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
}

variable "tags" {
  description = "Tags for the EC2 instance"
  type        = map(string)
}
