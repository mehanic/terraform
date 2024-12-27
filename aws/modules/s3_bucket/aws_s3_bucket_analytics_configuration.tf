# Analytics Configuration for Entire Bucket
resource "aws_s3_bucket_analytics_configuration" "example_entire_bucket" {
  bucket = aws_s3_bucket.example.id
  name   = "EntireBucket"

  storage_class_analysis {
    data_export {
      destination {
        s3_bucket_destination {
          bucket_arn = aws_s3_bucket.analytics.arn
        }
      }
    }
  }
}

# Analytics Configuration for Filtered Data
resource "aws_s3_bucket_analytics_configuration" "example_filtered" {
  bucket = aws_s3_bucket.example.id
  name   = "ImportantBlueDocuments"

  filter {
    prefix = "documents/"

    tags = {
      priority = "high"
      class    = "blue"
    }
  }
}
