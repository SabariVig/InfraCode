resource "random_string" "password" {
  length  = 20
  lower   = true
  upper   = true
  number  = true
  special = true
}

resource "aws_ssm_parameter" "db_pass" {
  name  = "/db/password"
  type  = "SecureString"
  value = random_string.password.result
}
