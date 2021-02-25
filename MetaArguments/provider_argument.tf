provider "aws" {
  alias = "east"

  region = "us-east-1"
}

variable "ami-east" {
  default = "ami-0915bcb5fa77e4892"
}

resource "aws_instance" "provider_args_demo" {
  ami   = var.ami
  provider = aws.east
  instance_type = var.ami-east
}

