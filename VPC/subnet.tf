resource "aws_subnet" "public" {
  
  count             = length(var.availability_zone)
  cidr_block        = cidrsubnet(var.cidr_block, 8, count.index)
  availability_zone = element(var.availability_zone, count.index)
  vpc_id            = aws_vpc.TF-VPC.id
  tags = {
    name = "Public Subnet - ${element(var.availability_zone, count.index)}"
  }
  map_public_ip_on_launch = true


}

resource "aws_subnet" "private" {
  count             = length(var.availability_zone)
  cidr_block        = cidrsubnet(var.cidr_block, 8, (count.index + length(var.availability_zone)))
  availability_zone = element(var.availability_zone, count.index)
  vpc_id            = aws_vpc.TF-VPC.id
  tags = {
    name = "Private Subnet - ${element(var.availability_zone, (count.index + length(var.availability_zone)))}"
  }

}

