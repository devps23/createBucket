//get ami related info from aws_ami datasource
data "aws_ami" "ami" {
  most_recent = true
  name_regex = "RHEL-9-DevOps-Practice"
  owners = ["973714476881"]
}
data "aws_iam_policy_document" "instance-assume-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}
