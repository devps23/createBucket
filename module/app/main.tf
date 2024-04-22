resource "aws_instance" "web" {
  ami           = data.aws_ami.ami.image_id
  instance_type = "t3.small"

  tags = {
    Name = var.component
  }
}
resource "aws_route53_record" "route" {
  name = "${var.component}-dev"
  type = "A"
  zone_id = "Z09583601MY3QCL7AJKBT"
  records = [aws_route53_record.route.name]
}