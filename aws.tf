terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"  # Ensure you're using a valid version
    }
  }
}

provider "aws" {
  access_key = "AKIMJTM5FH7KGR"
  secret_key = "A1kkzkGJm+V+eBmqSN5fnSzLdGJl9ix0"
  region = "ap-south-1"
}

resource "aws_vpc" "vpc_first" {
  cidr_block = "192.168.0.0/16"
  tags = {
    "Name" = "From_tf"
  }
}

resource "aws_subnet" "first_subnet_1" {
    cidr_block = "192.168.0.0/24"
    vpc_id = aws_vpc.vpc_first.id
    tags = {
      "Name" = "subnet_1_from_tf"
    }

}