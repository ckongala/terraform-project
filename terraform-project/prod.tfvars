environment   = "prod"
instance_type = "t2.micro"  # Example of a larger instance for prod
ami_id        = "ami-0ea3c35c5c3284d82"  # Example AMI ID for prod
tags = {
  Name = "TerraformEC2-Prod"
}
