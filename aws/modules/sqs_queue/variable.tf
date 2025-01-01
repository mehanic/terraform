# AWS Region
variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

# Queue Name
variable "queue_name" {
  description = "The name of the main SQS queue"
  type        = string
  default     = "terraform-example-queue"
}

# Environment
variable "environment" {
  description = "The environment for the SQS queue"
  type        = string
  default     = "production"
}

# Delay in seconds before a message is visible
variable "delay_seconds" {
  description = "The delay in seconds for messages to be visible"
  type        = number
  default     = 90
}

# Maximum message size in bytes
variable "max_message_size" {
  description = "The maximum size of a message in bytes"
  type        = number
  default     = 2048
}

# Message retention time in seconds
variable "message_retention_seconds" {
  description = "The number of seconds to retain a message in the queue"
  type        = number
  default     = 86400
}

# Receive wait time for long polling in seconds
variable "receive_wait_time_seconds" {
  description = "The time for which the ReceiveMessage call waits for a message"
  type        = number
  default     = 10
}

# Max number of receives before a message is moved to the Dead Letter Queue
variable "max_receive_count" {
  description = "Max number of receives before the message is moved to the dead letter queue"
  type        = number
  default     = 4
}
//



# SNS Topic Name
variable "sns_topic_name" {
  description = "The name of the SNS topic"
  type        = string
  default     = "exampletopic"
}