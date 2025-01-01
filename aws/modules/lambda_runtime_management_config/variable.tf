variable "function_name" {
  description = "The name of the Lambda function."
  type        = string
}

variable "runtime" {
  description = "The runtime environment for the Lambda function."
  type        = string
  default     = "go1.x" # Default runtime for Go
}

variable "lambda_execution_role" {
  description = "The IAM role ARN that the Lambda function assumes."
  type        = string
}

variable "lambda_handler" {
  description = "The function handler in your Lambda code."
  type        = string
  default     = "main" # Go function handler
}

variable "lambda_zip_path" {
  description = "The path to the Lambda deployment package."
  type        = string
  default     = "../../examples/lambda_runtime_management_config/my-go-lambda/function.zip"
}

variable "update_runtime_on" {
  description = "Runtime update mode for the Lambda function."
  type        = string
  default     = "FunctionUpdate" # Options: Auto, FunctionUpdate, Manual
}

# variable "runtime_version_arn" {
#   description = "The ARN of the runtime version (required if update_runtime_on is Manual)."
#   type        = string
#   default     = ""
# }

variable "environment_variables" {
  description = "Environment variables for the Lambda function."
  type        = map(string)
  default     = {}
}
