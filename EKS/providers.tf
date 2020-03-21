provider "aws" {
  region = "ca-central-1"
}


terraform {
  backend "s3" {
    region  = "ap-southeast-2"
    bucket  = "hawk-tf-state"
    key     = "eks/key"
    encrypt = true
  }
}