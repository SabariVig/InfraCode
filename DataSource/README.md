# DataSource 

[Data Source](https://www.terraform.io/docs/language/data-sources/index.html) is a way to fetch information which is not present within terraform
which can later be used as a variable in the terraform configuration

```terraform
data "aws_vpc" "default_vpc" {
  default = true
}
```

```terraform
data "aws_ami" "example" {
  most_recent = true

  owners = ["self"]
  tags = {
    Name   = "Tag Name"
  }
}

```

```
data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}
```
Allow SSH only from this machine
```terraform
resource "aws_security_group" "solr-SG1" {

  name = "apache_solr"
  ingress {
    description = "SSH Port"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks  = ["${chomp(data.http.myip.body)}/32"]
  }

resource "aws_instance" "demo_datasource" {
  ami           = data.aws_ami.example
  instance_type = var.instance_type
  security_groups = [aws_security_group.example-SG.name]
}
```

