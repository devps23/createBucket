module "demo" {
  source = "./module/app"
  env=var.env
  component = var.component

}