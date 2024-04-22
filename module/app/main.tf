resource "aws_instance" "web" {
  ami           = data.aws_ami.ami.image_id
  instance_type = var.instance_type

  tags = {
    Name = var.component
  }
}