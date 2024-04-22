resource "aws_instance" "instance" {
  ami           = data.aws_ami.ami.image_id
  instance_type = "t3.small"

  tags = {
    Name = var.component
  }
}
resource "aws_route53_record" "route" {
  name = "${var.component}-${var.env}"
  type = "A"
  zone_id = var.zone_id
  records = [aws_instance.instance.private_ip]
  ttl =40
}

resource "aws_iam_role" "Prometheus_role" {
  name = var.role
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    name = var.role
  }
}