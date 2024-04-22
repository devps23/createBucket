terraform {
  backend "s3" {}
}
resource "aws_instance" "instance" {}