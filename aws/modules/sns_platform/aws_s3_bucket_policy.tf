# S3 Bucket Policy for SNS Access
resource "aws_s3_bucket_policy" "sns_usage_report_policy" {
  provider = aws.ap_southeast_2

  bucket = aws_s3_bucket.sms_usage_reports.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:GetBucketLocation",
          "s3:ListBucket"
        ],
        Resource = [
          "arn:aws:s3:::${aws_s3_bucket.sms_usage_reports.bucket}",
          "arn:aws:s3:::${aws_s3_bucket.sms_usage_reports.bucket}/*"
        ],
        Principal = {
          "AWS" : "arn:aws:iam::476167141852:root"
        }
      }
    ]
  })
}
