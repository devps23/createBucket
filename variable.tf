variable "env" {}
variable "zone_id"{}
variable "role" {}
variable "tools"{
  prometheus = {
    instance_type="t3.micro"
    component = "prometheus"
  }
  grafana = {
    instance_type="t3.micro"
    component = "prometheus"
  }
}


