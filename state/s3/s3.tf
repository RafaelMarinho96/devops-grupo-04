resource "aws_s3_bucket" "b" {
  bucket = "lab-fiap-78aoj-grupo-04-state-book" // [Troubleshoot] Update bucket name
  acl    = "private"

  tags = {
    Name        = "lab-fiap-78aoj-grupo-04"
    Environment = "admin"
  }
}