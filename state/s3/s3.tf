resource "aws_s3_bucket" "b" {
  bucket = "lab-fiap-78aoj-grupo-04"
  acl    = "private"

  tags = {
    Name        = "lab-fiap-78aoj-grupo-04"
    Environment = "admin"
  }
}