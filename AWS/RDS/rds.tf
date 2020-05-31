resource "aws_db_instance" "mysql" {
  allocated_storage           = 20
  allow_major_version_upgrade = true
  storage_type                = "gp2"
  engine                      = "mysql"
  engine_version              = "8.0.17"
  instance_class              = "db.t2.micro"
  name                        = var.db_name
  username                    = var.db_username
  password                    = random_string.password.result
  vpc_security_group_ids      = [aws_security_group.db_sg.id]
  db_subnet_group_name        = aws_db_subnet_group.db_subnet.id
  publicly_accessible         = true
  skip_final_snapshot         = true

  tags = {
    name = "MYSql DB"
  }


}
