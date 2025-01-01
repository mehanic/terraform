# IAM Role for SNS to assume
resource "aws_iam_role" "sns_sms_role" {
  name = "sns_sms_usage_reports_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "sns.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}




resource "aws_iam_role" "sns_feedback_role" {
  name = "sns_feedback_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = { Service = "sns.amazonaws.com" },
        Action    = "sts:AssumeRole"
      }
    ]
  })
}