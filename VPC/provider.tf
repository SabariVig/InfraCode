provider "aws" {
  region = "ap-southeast-2"
}

# terraform {
#   backend "s3" {
#     bucket  = "hawk-tf-state"
#     key     = "vpc/key.tfstate"
#     region  = "ap-southeast-2"
#     encrypt = true
#   }
# }
