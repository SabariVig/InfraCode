resource "aws_instance" "demo" {
  ami = "ami-02f9ea74050d6f812"
  instance_type = var.instance_type

}
