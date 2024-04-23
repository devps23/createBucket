//attach aws instance profile to aws instance to access
resource "aws_instance" "instance" {
  ami           = data.aws_ami.ami.image_id
  instance_type = "t3.micro"
  iam_instance_profile = aws_iam_instance_profile.instance_profile.name
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

resource "aws_route53_record" "route" {
  name = "${var.component}-internal"
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
resource "aws_iam_instance_profile" "instance_profile" {
  name = var.role
  role = aws_iam_role.Prometheus_role.name
}
//give the permissions with the help of policy