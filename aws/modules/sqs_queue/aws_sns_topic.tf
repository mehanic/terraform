
# SNS Topic (Assuming SNS topic is already managed here)
resource "aws_sns_topic" "example" {
  name = var.sns_topic_name
}
