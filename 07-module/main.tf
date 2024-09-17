module "test" {
  source = "./local-module"
  instance_type = var.instance_type
}

output "test" {
  value = module.test.ami
}

variable "instance_type" {
  default = "t3.micro"
}