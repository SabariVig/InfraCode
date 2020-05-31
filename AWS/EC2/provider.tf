provider "aws" {
  region = var.region
}


# terraform{
#   backend "s3"{
#     bucket ="Hawk-Terraform-State"
#     key="/lol/key"
#     region="ap-southeast-2"
#   }
# }