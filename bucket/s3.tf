resource "aws_s3_bucket" "bucket" {
  bucket = "lab-fiap-78aoj-grupo-04-book-fiap"
  acl    = "public-read-write"

  tags = {
    Name        = "lab-fiap-78aoj-grupo-04-book-fiap"
    Environment = "admin"
  }
}