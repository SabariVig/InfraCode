provider "aws" {
  region = "ap-southeast-2"
}

provider "random" {

}


terraform {
  backend "s3" {
    bucket  = "hawk-tf-state"
    key     = "rds/key"
    encrypt = true
    region  = "ap-southeast-2"
  }
}

