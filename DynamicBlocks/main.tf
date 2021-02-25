locals {
  ingress_rules = [
    {
      port        = 443
      description = "HTTPS Rule"
      cidr_block  = ["0.0.0.0/0"]
    },
    {
      port        = 22
      description = "HTTPS Rule"
      cidr_block  = ["${chomp(data.http.myip.body)}/32"]
    }
  ]
}

resource "aws_security_group" "test" {
  name = "test-SG"

  dynamic "ingress" {
    for_each = local.ingress_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ingress.value.cidr_block
    }
  }

}
