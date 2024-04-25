module "demo" {
  for_each = var.tools
  source = "./module/app"
  instance_type=each.value["instance_type"]
  policy_resource_list = each.value["iam_policy_resource_list"]
  tool_name=each.key
  env=var.env
  zone_id = var.zone_id
  role  = var.role

}