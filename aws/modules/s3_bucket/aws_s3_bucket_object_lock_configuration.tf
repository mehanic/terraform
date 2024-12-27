resource "aws_s3_bucket_object_lock_configuration" "example" {
  bucket = aws_s3_bucket.example.id

  rule {
    default_retention {
      mode = var.object_lock_mode
      days = var.retention_days
    }
  }
  depends_on = [aws_s3_bucket_versioning.example]
}
