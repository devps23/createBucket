variable "env" {}
variable "zone_id"{}
variable "role" {}
variable "tools" {
  default = {
    prometheus = {
      instance_type = "t3.micro"
      iam_policy_resource_list = ["ec2:DescribeInstances"]
    }
//    grafana = {
//      instance_type = "t3.micro"
//      iam_policy_resource_list = ["ec2:DescribeInstances"]
//    }
  }
}


