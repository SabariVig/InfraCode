resource "aws_security_group" "demo_SG" {
  vpc_id = data.aws_vpc.custom_vpc.id
}

resource "aws_instance" "demo_datasource" {
  ami           = var.ami
  instance_type = var.instance_type

}


