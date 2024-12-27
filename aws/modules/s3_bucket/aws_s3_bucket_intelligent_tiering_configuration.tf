
resource "aws_s3_bucket_intelligent_tiering_configuration" "example_entire_bucket" {
  bucket = aws_s3_bucket.example.id
  name   = "EntireBucket"

  tiering {
    access_tier = "DEEP_ARCHIVE_ACCESS"
    days        = var.deep_archive_days
  }

  tiering {
    access_tier = "ARCHIVE_ACCESS"
    days        = var.archive_days
  }
}

resource "aws_s3_bucket_intelligent_tiering_configuration" "example_filtered" {
  bucket = aws_s3_bucket.example.id
  name   = "ImportantBlueDocuments"

  status = var.filtered_status

  filter {
    prefix = var.filtered_prefix

    tags = var.filtered_tags
  }

  tiering {
    access_tier = "ARCHIVE_ACCESS"
    days        = var.archive_days
  }
}
