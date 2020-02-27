# resource "aws_nat_gateway" "nat-gw" {
#   count         = length(var.availability_zone)
#   subnet_id     = element(aws_subnet.public.*.id, count.index)
#   allocation_id = element(aws_eip.Nat-Eip.*.id, count.index)
#   tags = {
#     name = "NAT ${element(var.availability_zone, count.index)}"
#   }
# }

resource "aws_eip" "Nat-Eip" {
  vpc   = true
  count = length(var.availability_zone)
}

