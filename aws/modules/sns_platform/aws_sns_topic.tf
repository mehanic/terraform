# SNS Topic Resource
resource "aws_sns_topic" "user_updates" {
  name            = var.topic_name
  display_name    = var.display_name
  delivery_policy = <<EOF
{
  "http": {
    "defaultHealthyRetryPolicy": {
      "minDelayTarget": 20,
      "maxDelayTarget": 20,
      "numRetries": 3,
      "numMaxDelayRetries": 0,
      "numNoDelayRetries": 0,
      "numMinDelayRetries": 0,
      "backoffFunction": "linear"
    },
    "disableSubscriptionOverrides": false,
    "defaultThrottlePolicy": {
      "maxReceivesPerSecond": 1
    }
  }
}
EOF
  tags            = var.tags
}









# resource "aws_iam_role_policy" "sns_sms_usage_policy" {
#   name = "sns_sms_usage_policy"
#   role = aws_iam_role.sns_sms_role.id

#   policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       # Permissions for SNS to set SMS attributes and publish messages
#       {
#         Effect = "Allow",
#         Action = [
#           "sns:SetSMSAttributes",
#           "sns:Publish"
#         ],
#         Resource = "*"
#       },
#       # Permissions for SNS to access S3 (Put and Get objects, and list bucket)
#       {
#         Effect = "Allow",
#         Action = [
#           "s3:PutObject",
#           "s3:GetObject",
#           "s3:GetBucketLocation",
#           "s3:ListBucket"
#         ],
#         Resource = [
#           "arn:aws:s3:::${aws_s3_bucket.sms_usage_reports.bucket}",
#           "arn:aws:s3:::${aws_s3_bucket.sms_usage_reports.bucket}/*"
#         ]
#       }
#     ]
#   })
# }