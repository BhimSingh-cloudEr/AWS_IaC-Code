terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws"{
    region = "us-east-1"
    access_key = "${var.AWS_ACCESS_KEY}"
    secret_key = "${var.AWS_SECRET_KEY}" 
}


resource "aws_instance" "web" {
    ami = "${var.AMI}"
    instance_type = "${var.instance_type}"
    key_name = "${var.key_name}"
    tags = {
        Name = "web-server"
    }
  
}


