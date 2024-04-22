module "demo" {
  source = "./module/app"
  instance_type=var.instanceType
  component=var.component
}