resource "aws_security_group" "SG1" {

  tags = {
    name = "Security Group 1"
  }
  
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 80
    protocol    = "tcp"
    description = "22-80"
  }
  egress{
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "-1"
    from_port = 0
    to_port = 0
    
  }


}

resource "aws_instance" "MYEC2" {

  ami           = "ami-0d0eaed20348a3389"
  instance_type = "t2.micro"
  key_name      = "temp"
  tags = {
    name = "From Terrafrom"
    ID   = "2"
  }
  security_groups = [aws_security_group.SG1.name]
}

