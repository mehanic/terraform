resource "aws_s3_bucket_inventory" "test_prefix" {
  bucket = aws_s3_bucket.example.id
  name   = "DocumentsWeekly"

  included_object_versions = var.included_object_versions

  schedule {
    frequency = var.prefix_frequency
  }

  filter {
    prefix = var.filter_prefix
  }

  destination {
    bucket {
      format     = var.inventory_format
      bucket_arn = aws_s3_bucket.inventory.arn
      prefix     = var.destination_prefix
    }
  }
}


resource "aws_s3_bucket_inventory" "test_entire_bucket" {
  bucket = aws_s3_bucket.example.id
  name   = "EntireBucketDaily"

  included_object_versions = var.included_object_versions

  schedule {
    frequency = var.entire_bucket_frequency
  }

  destination {
    bucket {
      format     = var.inventory_format
      bucket_arn = aws_s3_bucket.inventory.arn
    }
  }
}

