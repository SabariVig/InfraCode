# Main Vpc
# Subnet
# Internet Gateway
# Route Table


resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  # id="main vpc canada"
  tags = {
    name = "VPC Canada"

  }
  enable_dns_hostnames=true
}

resource "aws_subnet" "public_subnet" {
  count             = length(data.aws_availability_zones.azs.names)
  availability_zone = data.aws_availability_zones.azs.names[count.index]
  cidr_block        = "10.0.${count.index}.0/24"
  vpc_id            = aws_vpc.main.id
  map_public_ip_on_launch = true
  tags = {
    name = "Public Subnet- ${count.index} - ${data.aws_availability_zones.azs.names[count.index]}",
     "kubernetes.io/cluster/demo-terraform"= "shared",
  }

}


resource "aws_internet_gateway" "IGW" {
  # id="canada vpc IGW"
  vpc_id = aws_vpc.main.id
  tags = {
    name = "Demo IGW"
  }
}

resource "aws_route_table" "route" {
    # id ="Public Route"
    vpc_id = aws_vpc.main.id
    route {
        gateway_id = aws_internet_gateway.IGW.id
        cidr_block="0.0.0.0/0"

    }
    tags={
        name ="Terraform"
    }
}

resource "aws_route_table_association" "asso" {
    count = length(data.aws_availability_zones.azs.names)
    route_table_id = aws_route_table.route.id
    subnet_id = element(aws_subnet.public_subnet.*.id,count.index)
    
}