# DataSource 

[Data Source](https://www.terraform.io/docs/language/data-sources/index.html) is a way to fetch information which is not present within terraform
which can later be used as a variable in the terraform configuration

```terraform
data "aws_vpc" "default_vpc" {
  default = true
}


resource "aws_security_group" "demo_SG" {
  vpc_id = data.aws_vpc.default_vpc.id
}

resource "aws_instance" "demo_datasource" {
  ami           = var.ami
  instance_type = var.instance_type

}

```

