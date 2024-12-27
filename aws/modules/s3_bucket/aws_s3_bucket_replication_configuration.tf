# Define the S3 bucket replication configuration
resource "aws_s3_bucket_replication_configuration" "replication" {
  //provider = aws.central
  //depends_on = [aws_s3_bucket_versioning.source]

  role   = aws_iam_role.replication.arn
  bucket = aws_s3_bucket.example.id

  rule {
    id     = "foobar"
    status = "Enabled"

    filter {
      prefix = "foo"
    }

    destination {
      bucket        = aws_s3_bucket.destination.arn
      storage_class = "STANDARD"
    }
    delete_marker_replication {
      status = "Disabled"  # Can be 'Disabled' or 'Enabled' based on your requirement
    }
  }
}
