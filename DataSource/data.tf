data "aws_vpc" "default_vpc" {
  default = true
}

data "aws_vpc" "custom_vpc" {
  filter {
    name = "tag:Name"
    values = ["my-german-vpc"] 
  }
}

