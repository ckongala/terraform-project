provider "aws" {
  region = "us-east-2"  # Change this to your preferred region
}

resource "aws_s3_bucket" "state_bucket" {
  bucket = "chinni-terraform-state-s3-bucket-${var.environment}" 
}

resource "aws_dynamodb_table" "state_lock" {
  name         = "chinni-terraform-state-lock-${var.environment}"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "LockID"
    type = "S"
  }
hash_key = "LockID"
  tags = {
    Name = "TerraformStateLock"
  }
}
# EC2 Instance Module
module "ec2_instance" {
  source       = "./modules/ec2-instance"
  instance_type = var.instance_type
  ami_id      = var.ami_id
  tags        = var.tags
}

output "instance_id" {
  value = module.ec2_instance.instance_id
}

output "instance_public_ip" {
  value = module.ec2_instance.instance_public_ip
}
terraform {
  backend "s3" {
    bucket         = "chinni-terraform-state-s3-bucket"
    key            = "terraform/state/default"
    region         = "us-east-2"
    dynamodb_table = "chinni-terraform-state-lock"
  }
}
