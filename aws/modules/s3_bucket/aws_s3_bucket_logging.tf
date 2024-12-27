resource "aws_s3_bucket_logging" "example_logging" {
  bucket         = aws_s3_bucket.example.id
  target_bucket  = aws_s3_bucket.log_bucket.id
  target_prefix  = var.target_prefix
}

