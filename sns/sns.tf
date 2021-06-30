resource "aws_sns_topic" "book_sns" {
  name = "book_sns_topic"
}

resource "aws_sns_topic_subscription" "email_target" {
  topic_arn = aws_sns_topic.book_sns.arn
  protocol  = "email"
  endpoint  = "rafael.marinho07@gmail.com"
}
