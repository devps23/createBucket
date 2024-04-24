module "demo" {
  source = "./module/app"
  env=var.env
  component = var.component
  zone_id = var.zone_id
  role  = var.role
  ssh_user = var.ssh_user
  ssh_pass = var.ssh_pass
}