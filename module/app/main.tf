resource "aws_instance" "web" {
  ami           = data.aws_ami.ami.image_id
  instance_type = "t3.small"

  tags = {
    Name = var.component
  }
}
resource "aws_route53_record" "route" {
  name = "frontend-dev"
  type = "A"
  zone_id = ""
}