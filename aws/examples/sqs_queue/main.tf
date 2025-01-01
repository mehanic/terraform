module "s3_backet" {
  source = "../../modules/sqs_queue"
  # AWS Region
  aws_region = "us-east-1"

  # Queue Name
  queue_name = "terraform-example-queue"

  # Environment
  environment = "production"

  # Delay in seconds before a message is visible
  delay_seconds = 90

  # Maximum message size in bytes
  max_message_size = 2048

  # Message retention time in seconds
  message_retention_seconds = 86400

  # Receive wait time for long polling in seconds
  receive_wait_time_seconds = 10

  # Max number of receives before a message is moved to the Dead Letter Queue
  max_receive_count = 4


}
