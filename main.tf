module "demo" {
  source = "./module/app"
  component = var.component
  env=var.env
}