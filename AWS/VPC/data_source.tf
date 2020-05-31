data "aws_ami" "ami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name = "name"
    values = ["amzn2-ami-*-x86_64-gp2"]
    # values = ["RHEL-8.0.0_HVM-*Hourly2-GP2"]
  }
#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
#   filter {
#     name   = "owner-alias"
#     values = ["amazon"]
#   }
}
