data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "hawk-tf-state"
    key    = "vpc/key"
    region = var.region

  }
}