terraform {
  backend "s3" {
    bucket = "lab-fiap-78aoj-grupo-04"
    key    = "grupo04-bucket"
    region = "us-east-1"
  }
}