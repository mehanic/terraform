module "sns_platform" {
  source = "../../modules/sns_platform"

  # The name of the SNS topic
  topic_name = "user-updates-topic"

  # The display name for the SNS topic
  display_name = "User Updates Topic"

  # Tags for the SNS topic
  tags = {
    Environment = "Development"
    Project     = "UserUpdates"
  }

  # AWS region for the SNS topic
  aws_region = "us-east-1"

  # Name of the SQS queue
  sqs_queue_name = "user-updates-queue"

  # Name of the SQS queue for S3 notifications (this is another queue that you may be using elsewhere)
  queue_name = "s3-event-notification-queue"

  # The name of the SNS topic (used for policies, etc.)
  sns_topic_name = "my-topic-with-policy"

  # The AWS account ID for the policy condition
  account_id = "476167141852" # Replace with your AWS Account ID if necessary

  #   name                        = "MyAPNSApplication"
  # platform_credential         = "-----BEGIN PRIVATE KEY-----\n..."
  # platform_principal          = "-----BEGIN CERTIFICATE-----\n..."
  # apple_platform_team_id      = "TEAMID1234"
  # apple_platform_bundle_id    = "com.example.myapp"
  # event_delivery_failure_topic_arn = "arn:aws:sns:us-east-1:476167141852:DeliveryFailures"
  //success_feedback_role_arn   = "arn:aws:iam::476167141852:main/SuccessFeedbackRole"
  //failure_feedback_role_arn   = "arn:aws:iam::476167141852:main/FailureFeedbackRole"


  providers = {
    aws                = aws
    aws.ap_southeast_2 = aws.ap_southeast_2
  }
}
