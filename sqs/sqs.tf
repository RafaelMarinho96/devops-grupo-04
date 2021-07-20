data "aws_caller_identity" "current" {}

resource "aws_sqs_queue" "sqs_book_queue_dead_letter" {
  name  = "sqs_book_queue_dead_letter"
}

resource "aws_sqs_queue" "sqs_book_queue" {
  name                      = "sqs_book_queue"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.sqs_book_queue_dead_letter.arn
    maxReceiveCount     = 4
  })
}

resource "aws_sns_topic_subscription" "book_sns_topic_update" {
  topic_arn = "arn:aws:sns:us-east-1:${data.aws_caller_identity.current.account_id}:book_sns_topic"
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.sqs_book_queue.arn
}

resource "aws_sqs_queue_policy" "book_sqs_policy" {
  queue_url = aws_sqs_queue.sqs_book_queue.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement": [
    {
      "Sid": "AllowSQSMessageFromSNS",
      "Effect": "Allow",
      "Principal": "*",
      "Action": ["sqs:SendMessage"],
      "Resource": "${aws_sqs_queue.sqs_book_queue.arn}"
    }
  ]
}
POLICY
}
