resource "aws_s3_bucket_metric" "example-filtered" {
  bucket = aws_s3_bucket.example.id
  name   = var.metric_name

  filter {
    access_point = aws_s3_access_point.example-access-point.arn

    tags = {
      priority = "high"
      class    = "blue"
    }
  }
}
