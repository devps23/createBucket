//attach aws instance profile to aws instance to access
resource "aws_instance" "instance" {
  ami           = data.aws_ami.ami.image_id
  instance_type = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.instance_profile.name
  instance_market_options {
    market_type="spot"
    spot_options {
      spot_instance_type = "persistent"
      instance_interruption_behavior = "spot"
    }
  }
  tags = {
    Name = var.component
    visual = "yes"
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
  name               = "Prometheus_role"
 assume_role_policy = data.aws_iam_policy_document.instance-assume-role-policy.json

}
resource "aws_iam_instance_profile" "instance_profile" {
  name = var.role
  role = aws_iam_role.Prometheus_role.name

}
//attach policy to the prometheus roles
resource "aws_iam_role_policy_attachment" "policy_attach" {
  role       = aws_iam_role.Prometheus_role.name
  policy_arn = aws_iam_policy.policy.arn
}
//give the permissions with the help of policy
resource "aws_iam_policy" "policy" {
  name        = "Prometheus-role"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          var.policy_resource_list,
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}







