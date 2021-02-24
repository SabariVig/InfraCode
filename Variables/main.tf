resource "aws_instance" "vm" {
  ami = var.ami
}
