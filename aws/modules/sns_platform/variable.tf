variable "topic_name" {
  description = "The name of the SNS topic"
  type        = string
  default     = "user-updates-topic"
}

variable "display_name" {
  description = "The display name for the SNS topic"
  type        = string
  default     = "User Updates Topic"
}

variable "tags" {
  description = "Key-value tags for the SNS topic"
  type        = map(string)
  default = {
    Environment = "Development"
    Project     = "UserUpdates"
  }
}

variable "aws_region" {
  description = "AWS region for the SNS topic"
  type        = string
  //default     = "us-central-1"
}


variable "sqs_queue_name" {
  description = "Name of the SQS queue."
  type        = string
  default     = "user-updates-queue"
}


# SQS Queue Name
variable "queue_name" {
  description = "Name of the SQS queue for S3 notifications."
  type        = string
  default     = "s3-event-notification-queue"
}


variable "sns_topic_name" {
  description = "The name of the SNS topic."
  type        = string
  default     = "my-topic-with-policy"
}


variable "account_id" {
  description = "The AWS account ID for the policy condition."
  type        = string
  default     = null
}




# Monthly spend limit for SMS
variable "monthly_spend_limit" {
  description = "The maximum amount in USD that you are willing to spend each month to send SMS messages"
  type        = number
  default     = 1.00
}

# IAM Role ARN for SMS delivery status logs
variable "delivery_status_iam_role_arn" {
  description = "The ARN of the IAM role that allows Amazon SNS to write SMS delivery status logs in CloudWatch"
  type        = string
  default     = "" # Empty by default, can be set in terraform.tfvars
}

# Delivery status success sampling rate (0 to 100)
variable "delivery_status_success_sampling_rate" {
  description = "The percentage of successful SMS deliveries for which SNS writes logs in CloudWatch"
  type        = number
  default     = 100
}

# Default sender ID for SMS
variable "default_sender_id" {
  description = "The sender ID for SMS messages (e.g., business name)"
  type        = string
  default     = "MyBusiness"
}

# Default SMS type (Promotional or Transactional)
variable "default_sms_type" {
  description = "The type of SMS message to send by default (Promotional or Transactional)"
  type        = string
  default     = "Transactional"
}

# S3 bucket for receiving SMS usage reports
variable "usage_report_s3_bucket" {
  description = "The name of the S3 bucket for receiving daily SMS usage reports"
  type        = string
  default     = "my-sms-usage-report-bucket"
}


//

# variable "name" {
#   description = "The friendly name for the SNS platform application."
#   type        = string
# }

# variable "platform" {
#   description = "The platform that the app is registered with."
#   type        = string
#   default     = "APNS"
# }

# variable "platform_credential" {
#   description = "The application platform credential, such as a private key for APNS."
#   type        = string
# }

# variable "platform_principal" {
#   description = "The application platform principal, such as a certificate for APNS."
#   type        = string
# }

# variable "event_delivery_failure_topic_arn" {
#   description = "The ARN of the SNS Topic triggered for delivery failures."
#   type        = string
#   default     = null
# }

# variable "event_endpoint_created_topic_arn" {
#   description = "The ARN of the SNS Topic triggered when a new endpoint is created."
#   type        = string
#   default     = null
# }

# variable "event_endpoint_deleted_topic_arn" {
#   description = "The ARN of the SNS Topic triggered when an endpoint is deleted."
#   type        = string
#   default     = null
# }

# variable "event_endpoint_updated_topic_arn" {
#   description = "The ARN of the SNS Topic triggered when an endpoint is updated."
#   type        = string
#   default     = null
# }

# variable "failure_feedback_role_arn" {
#   description = "The IAM role ARN for receiving failure feedback."
#   type        = string
#   default     = null
# }

# variable "success_feedback_role_arn" {
#   description = "The IAM role ARN for receiving success feedback."
#   type        = string
#   default     = null
# }

# variable "success_feedback_sample_rate" {
#   description = "The sample rate percentage (0-100) for success feedback."
#   type        = number
#   default     = 100
# }

# variable "apple_platform_team_id" {
#   description = "The identifier for your Apple developer account team (10 alphanumeric characters)."
#   type        = string
# }

# variable "apple_platform_bundle_id" {
#   description = "The bundle identifier for your iOS app."
#   type        = string
# }
