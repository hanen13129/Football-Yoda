# Terraform Settings Block
terraform {
  required_version = ">= 0.12.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.21"
    }
  }
}

# Provider Block
provider "aws" {
  profile = "default"
  region  = "eu-central-1"
}

# Resource Block
resource "aws_instance" "ec2demo" {
  ami           = "ami-00f07845aed8c0ee7"
  instance_type = "t2.micro"
}