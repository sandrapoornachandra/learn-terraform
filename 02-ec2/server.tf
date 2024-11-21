resource "aws_instance" "frontend" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.small"
  vpc_security_group_ids = [ "sg-0577c0c4fa7613b87" ]

  tags = {
    Name = "frontend"
  }
}
resource "aws_route53_record" "frontend" {
  zone_id = "Z095093821BU1FHHF63BW"
  name    = "frontend-dev.poornadevops.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}

  terraform {
    backend "s3" {
      bucket = "terrafrom-roboshop"
      key    = "ami/terraform.tfstate"
      region = "us-east-1"
    }
  }

  data "aws_ami" "ami" {
    most_recent = true
    name_regex  = "Centos-8-DevOps-Practice"
    owners      = ["973714476881"]
  }

  data "aws_security_group" "sg" {
    name = "allow-all"
  }

  resource "aws_instance" "ami" {
    instance_type = "t3.small"
    ami = data.aws_ami.ami.image_id
    vpc_security_group_ids = [data.aws_security_group.sg.id]
    tags= {
      Name = "ami"
    }
  }

