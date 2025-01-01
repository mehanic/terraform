variable "lambda_zip_file" {
  description = "Path to the Lambda function ZIP file"
  type        = string
  default     = ""
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
  default     = "example-lambda-function"
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
  default     = "python"
}

variable "lambda_alias_name" {
  description = "Name of the Lambda alias"
  type        = string
}

variable "lambda_alias_description" {
  description = "Description for the Lambda alias"
  type        = string
}

variable "lambda_function_version" {
  description = "Version of the Lambda function"
  type        = string
  default     = "1"
}

variable "additional_version_weights" {
  description = "Map defining the proportion of events sent to different versions of the Lambda function"
  type        = map(number)
  default = {
    "2" = 0.5
  }
}
