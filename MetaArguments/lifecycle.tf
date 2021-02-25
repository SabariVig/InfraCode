resource "aws_instance" "lifecycle_demo" {
  ami = var.ami
  instance_type = var.instance_type
  lifecycle {
    # create_before_destroy = true
    ignore_changes = [tags]
    prevent_destroy = true
  }
}
