terraform {
  backend "s3" {
    bucket = "lab-fiap-78aoj-grupo-04"
    key    = "grupo04-sqs"
    region = "us-east-1"
  }
}