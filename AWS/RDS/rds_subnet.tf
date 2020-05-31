resource "aws_db_subnet_group" "db_subnet" {
  description = "Public Subnet Assoation For DB"
  subnet_ids  = data.terraform_remote_state.vpc.outputs.public_subnet
  tags = {
    name = "Subnet for DB"
  }
}