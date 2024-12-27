resource "aws_s3_bucket_notification" "bucket_notification_sns" {
  bucket = aws_s3_bucket.example.id

  topic {
    topic_arn     = aws_sns_topic.topic.arn
    events        = var.s3_event_types
    filter_suffix = var.s3_filter_suffix
  }
}

# S3 Bucket Notification
resource "aws_s3_bucket_notification" "bucket_notification_sqs" {
  bucket = aws_s3_bucket.example.id

  queue {
    queue_arn     = aws_sqs_queue.queue.arn
    events        = var.s3_event_types
    filter_suffix = var.s3_filter_suffix
  }
}
