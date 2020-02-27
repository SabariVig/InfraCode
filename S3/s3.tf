resource "aws_s3_bucket" "S3" {
  bucket = var.S3Bucket
  acl    = "private"
  versioning {
    enabled = true

  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  lifecycle_rule {
    enabled = true
    expiration {
      days = 30
    }
  }
  tags = {
    name = "S3 To Store Terraform States"
  }
}



