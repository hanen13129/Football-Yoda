# Terraform Settings Block
terraform {
  required_version = ">= 0.12.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.21"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

# Provider Block
provider "aws" {
  profile = "default" # aws credenticals aws configure
  region  = "eu-central-1"
}

# Resource Block
resource "aws_instance" "ec2demo" {
  ami           = "ami-00f07845aed8c0ee7"
  instance_type = "t2.micro"
}

resource "aws_vpc" "main_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main_vpc"
  }
}


resource "random_pet" "petname" { #creatte a random name 
  length    = 5
  separator = "_"
}
resource "aws_s3_bucket" "example" {
  bucket = random_pet.petname.id

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}