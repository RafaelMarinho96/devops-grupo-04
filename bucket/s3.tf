resource "aws_s3_bucket" "bucket" {
  bucket = "lab-fiap-78aoj-grupo-04-bucket-book" // [Troubleshoot] Update bucket name
  acl    = "public-read-write"

  tags = {
    Name        = "lab-fiap-78aoj-grupo-04-book-fiap"
    Environment = "admin"
  }
}