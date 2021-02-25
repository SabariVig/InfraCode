resource "aws_instance" "count_demo" {
  ami = var.ami
  instance_type = var.instance_type
  count = 2

}

output  "instance_ips" {
  value = aws_instance.count_demo[*].public_ip
}

output  "instance_ip" {
  value = aws_instance.count_demo[0].public_ip
}

# Using For Loops 
output  "instance_for" {
  value = [for instance in aws_instance.count_demo: instance.public_ip]
}

