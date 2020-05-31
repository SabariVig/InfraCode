resource "aws_vpc" "TF-VPC" {
  cidr_block = var.cidr_block
  tags = {
    name = "MYVPC"
  }
  enable_dns_hostnames = true 
}


resource "aws_internet_gateway" "IG" {
  vpc_id = aws_vpc.TF-VPC.id
  tags = {
    name = "TF IG"
  }
}
