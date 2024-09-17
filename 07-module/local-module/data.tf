data "aws_ami_id" "ami" {
  most_recent = true
  name_regex = "Centos-8-DevOps-Practice"
  owners = ["973714476881"]
}


output "ami" {
  value = data.aws_ami_id.ami
}

resource "aws_instance" "instance" {
  ami = data.aws_ami_id.ami
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-0c9e1ed0e2e200466"]
}