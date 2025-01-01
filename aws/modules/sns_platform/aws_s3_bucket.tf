# S3 Bucket Resource for SMS Usage Reports
resource "aws_s3_bucket" "sms_usage_reports" {
  provider = aws.ap_southeast_2 # Use the provider for ap-southeast-2

  bucket = "${var.usage_report_s3_bucket}-${replace(lower(replace(timestamp(), ":", "-")), "z", "")}" # Ensure lowercase and remove 'z'

  tags = {
    Environment = "Development"
    Project     = "UserUpdates"
  }
}