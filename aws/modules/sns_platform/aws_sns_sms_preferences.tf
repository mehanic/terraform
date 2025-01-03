# SNS SMS Preferences Configuration
resource "aws_sns_sms_preferences" "update_sms_prefs" {
  monthly_spend_limit                   = var.monthly_spend_limit
  delivery_status_iam_role_arn          = var.delivery_status_iam_role_arn
  delivery_status_success_sampling_rate = var.delivery_status_success_sampling_rate
  default_sender_id                     = var.default_sender_id
  default_sms_type                      = var.default_sms_type
  // usage_report_s3_bucket            = aws_s3_bucket.sms_usage_reports.bucket
}

