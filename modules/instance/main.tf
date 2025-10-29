

resource "aws_instance" "example" {
  ami           ="ami-0360c520857e3138f"
  instance_type = "t3.micro"

  tags = {
    Name = "linda"
  Environment = "dev"
  }
}