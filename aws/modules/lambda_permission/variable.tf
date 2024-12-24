# Lambda Function Variables
variable "lambda_zip_file" {
  description = "Path to the Lambda function ZIP file"
  type        = string
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "lambda_handler" {
  description = "Handler for the Lambda function"
  type        = string
  default     = "exports.handler"
}

variable "lambda_runtime" {
  description = "Runtime environment for the Lambda function"
  type        = string
  default     = "python3.9"
}

variable "lambda_alias_name" {
  description = "Name of the Lambda alias"
  type        = string
}

variable "lambda_alias_description" {
  description = "Description for the Lambda alias"
  type        = string
}

# Provisioned Concurrency
variable "provisioned_concurrent_executions" {
  description = "Provisioned concurrency for the Lambda function"
  type        = number
  default     = 2
}

# CloudWatch Variables
variable "cloudwatch_rule_arn" {
  description = "ARN of the CloudWatch rule for Lambda invocation"
  type        = string
}

variable "cloudwatch_log_group_name" {
  description = "Name of the CloudWatch log group"
  type        = string
  default     = "/default"
}

variable "filter_pattern" {
  description = "Filter pattern for log subscription"
  type        = string
  default     = ""
}

# SNS Variables
variable "sns_topic_name" {
  description = "Name of the SNS topic"
  type        = string
}

# Lambda URL Variables
variable "url_permission_principal" {
  description = "Principal for Lambda URL permission"
  type        = string
}

variable "source_account" {
  description = "Source account for Lambda URL permission"
  type        = string
}
