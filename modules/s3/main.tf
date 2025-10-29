resource "aws_s3_bucket" "example" {
  bucket = "my-tf-1510-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}