variable "lambda_zip_file" {
  description = "Path to the Lambda function ZIP file"
  type        = string
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "lambda_execution_role" {
  description = "IAM role ARN for the Lambda function"
  type        = string
}

variable "lambda_handler" {
  description = "Handler for the Lambda function"
  type        = string
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

variable "provisioned_concurrent_executions" {
  description = "Amount of provisioned concurrency to allocate for the Lambda function"
  type        = number
  default     = 1
}
