resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.TF-VPC.id
  route {
    gateway_id = aws_internet_gateway.IG.id
    cidr_block = "0.0.0.0/0"
  }

}

resource "aws_route_table_association" "public" {
  count          = length(var.availability_zone)
  route_table_id = aws_route_table.public_route_table.id
  subnet_id      = element(aws_subnet.public.*.id, count.index)
}


# resource "aws_route_table" "private_route_table" {
#   vpc_id = aws_vpc.TF-VPC.id
#   count = length(var.availability_zone)
#   route {
#     # gateway_id = aws_internet_gateway.IG.id
#     nat_gateway_id = aws_nat_gateway.nat-gw[count.index].id
#     cidr_block     = "0.0.0.0/0"
#   }

# }

# resource "aws_route_table_association" "private" {
#   count          = length(var.availability_zone)
#   route_table_id = aws_route_table.private_route_table[count.index].id
#   subnet_id      = element(aws_subnet.private.*.id, count.index)
# }

