resource "aws_instance" "web" {
  ami           = data.aws_ami.ami.image_id
  instance_type = "t3.small"

  tags = {
    Name = "frontend"
  }
}