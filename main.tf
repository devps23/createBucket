module "demo" {
  source = "./module/app"
  instance_type=var.instanceType
  env=var.env
}