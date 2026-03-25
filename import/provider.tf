terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.33.0" # Terraform AWS provider version
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# 1st contain provider file
# 2nd in CMD: terraform init
# 3rd in CMD: terraform import aws_instance.import <Instance_ID>
# terraform plan