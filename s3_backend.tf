terraform {
  backend "s3" {
    bucket = "bucket1"
    key    = "test"
    region = "us-east-1"}
}
resource "aws_instance" "instance" {}