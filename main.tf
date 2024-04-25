module "demo" {
  for_each = var.tools
  source = "./module/app"
  instance_type=each.value["instance_type"]
  component= each.value["component"]
  env=var.env
  zone_id = var.zone_id
  role  = var.role

}