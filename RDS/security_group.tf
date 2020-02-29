resource "aws_security_group" "db_sg" {
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id
  description = "SG For DB"
  name        = "Security Group For Database"
  ingress {
    cidr_blocks = concat(data.terraform_remote_state.vpc.outputs.public_subnet_cidr, data.terraform_remote_state.vpc.outputs.private_subnet_cidr)
    from_port   = 3360
    to_port     = 3360
    protocol    = "tcp"
  }
  egress {
    cidr_blocks = concat(data.terraform_remote_state.vpc.outputs.public_subnet_cidr, data.terraform_remote_state.vpc.outputs.private_subnet_cidr)
    from_port   = 3360
    to_port     = 3360
    protocol    = "tcp"
  }

}
