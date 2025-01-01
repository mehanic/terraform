resource "aws_iam_role_policy" "sns_sms_usage_policy" {
  name = "sns_sms_usage_policy"
  role = aws_iam_role.sns_sms_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      # Comprehensive S3 permissions for SMS usage reports
      {
        Effect = "Allow",
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject",
          "s3:ListBucket",
          "s3:GetBucketLocation"
        ],
        Resource = [
          "arn:aws:s3:::${aws_s3_bucket.sms_usage_reports.bucket}",
          "arn:aws:s3:::${aws_s3_bucket.sms_usage_reports.bucket}/*"
        ]
      },
      # Comprehensive SNS permissions for SMS attributes and message publishing
      {
        Effect = "Allow",
        Action = [
          "sns:SetSMSAttributes",
          "sns:Publish",
          "sns:CreateTopic",
          "sns:Subscribe",
          "sns:DeleteTopic",
          "sns:GetTopicAttributes",
          "sns:ListSubscriptionsByTopic",
          "sns:SetTopicAttributes"
        ],
        Resource = "*"
      },
      # Permission to assume the IAM role (if required)
      {
        Effect   = "Allow",
        Action   = "sts:AssumeRole",
        Resource = "arn:aws:iam::*:role/${aws_iam_role.sns_sms_role.name}"
      },
      # Allow logs to CloudWatch (optional for debugging)
      {
        Effect = "Allow",
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource = "*"
      }
    ]
  })
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

resource "aws_iam_role_policy" "sns_feedback_policy" {
  name = "sns_feedback_policy"
  role = aws_iam_role.sns_feedback_role.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = ["logs:CreateLogGroup", "logs:CreateLogStream", "logs:PutLogEvents"],
        Resource = "arn:aws:logs:*:*:*"
      }
    ]
  })
}
