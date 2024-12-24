# Variables for Lambda Function and URLs
variable "function_name" {
  description = "The name or ARN of the Lambda function"
  type        = string
}

variable "runtime" {
  description = "Runtime for the Lambda function"
  type        = string
}

variable "lambda_execution_role" {
  description = "IAM role ARN for Lambda function execution"
  type        = string
}

variable "lambda_handler" {
  description = "Handler for the Lambda function"
  type        = string
}

variable "environment_variables" {
  description = "Environment variables for the Lambda function"
  type        = map(string)
  default     = {}
}

variable "qualifier" {
  description = "The alias name or version qualifier for the Lambda function"
  type        = string
  default     = "$LATEST"
}

variable "cors_allow_origins" {
  description = "List of allowed origins for CORS configuration"
  type        = list(string)
  default     = ["*"]
}

variable "cors_allow_methods" {
  description = "List of allowed methods for CORS configuration"
  type        = list(string)
  default     = ["GET", "POST", "OPTIONS"]
}

variable "cors_allow_headers" {
  description = "List of allowed headers for CORS configuration"
  type        = list(string)
  default     = ["date", "keep-alive"]
}

variable "cors_expose_headers" {
  description = "List of headers to expose for CORS configuration"
  type        = list(string)
  default     = ["keep-alive", "date"]
}

variable "cors_max_age" {
  description = "Max age for CORS preflight caching"
  type        = number
  default     = 86400
}
