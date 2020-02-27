resource "aws_instance" "baiston" {
  ami              = data.aws_ami.ami.id
  key_name         = "temp"
  instance_type    = var.bastion_type
  security_groups  = [aws_security_group.baiston_SG.id]
  user_data_base64 = filebase64("nginx.sh")
  subnet_id = aws_subnet.public[0].id 
}



resource "aws_security_group" "baiston_SG" {
  vpc_id = aws_vpc.TF-VPC.id
  name_prefix="SG-Public-"
  tags = {
    name = "SG-1"
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 80
    protocol    = "tcp"
    description = "Inbound 22-80"
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    description = "Outbound All"
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 8
    to_port     = 0
    protocol    = "icmp"

  }
}