resource "aws_s3_bucket" "bucket" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

//aws_s3_bucket  ===through automation we can create s3 bucket