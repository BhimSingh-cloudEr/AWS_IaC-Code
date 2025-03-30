terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
}

resource "aws_instance" "web" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.ssh_key_name
  count                  = var.instance_count
  subnet_id              = data.aws_subnet.example.id
  vpc_security_group_ids = [aws_security_group.instance_sg.id]
  user_data              = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Hello from ${var.instance_name}</h1>" > /var/www/html/index.html
              EOF
  tags = {
    Name = "${var.instance_name}"
  }
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet" "example" {
  vpc_id = data.aws_vpc.default.id
  tags = {
    Name = "Subnet-A"
  }
}

resource "aws_security_group" "instance_sg" {
  description = "Allow SSH and HTTP"
  vpc_id      = data.aws_vpc.default.id
  name        = "instance-sg"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "Allow SSH traffic"
  }

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "Allow HTTP traffic"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "Allow all outbound traffic"
  }
}