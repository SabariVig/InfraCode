resource "aws_instance" "for_each_demo" {
  ami   = var.ami
  for_each = {
    prod = "m5.large"
    dev  = "t2.micro"
  }
  instance_type = each.value
  tags = {
    Name = "Test ${each.key}"
  }
}


output "for_each_index" {
  value = aws_instance.for_each_demo["prod"].public_ip
}


