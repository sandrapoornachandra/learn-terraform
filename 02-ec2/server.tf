terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


resource "aws_instance" "frontend" {
  ami           = "ami-0b4f379183e5706b9"
  region        = "us-east-1"
  instance_type = "t3.small"
  vpc_security_group_ids = [ "sg-02f295a7bd0d62dde" ]

  tags = {
    Name = "frontend"
  }
}

