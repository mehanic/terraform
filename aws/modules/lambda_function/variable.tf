variable "lambda_function_name" {
  description = "Unique name for your Lambda Function"
  type        = string
  default     = "lambda_function_name"
}

variable "lambda_handler" {
  description = "Function entrypoint in your code"
  type        = string
  default     = "index.handler"
}

variable "lambda_runtime" {
  description = "Runtime environment for your Lambda function"
  type        = string
  default     = "nodejs18.x"
}

variable "lambda_environment_variables" {
  description = "Environment variables for the Lambda function"
  type        = map(string)
  default     = {
    foo = "bar"
  }
}

variable "subnet_ids" {
  description = "List of subnet IDs for the Lambda function"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs for the Lambda function"
  type        = list(string)
}

variable "lambda_timeout" {
  description = "Timeout for the Lambda function (in seconds)"
  type        = number
  default     = 3
}

variable "lambda_memory_size" {
  description = "Amount of memory for the Lambda function (in MB)"
  type        = number
  default     = 128
}

variable "log_retention_days" {
  description = "Number of days to retain CloudWatch logs"
  type        = number
  default     = 14
}



# Lambda Function URL Variables
variable "lambda_qualifier" {
  description = "Alias or version of the Lambda function for the function URL"
  type        = string
  default     = ""
}

# CORS Variables
variable "cors_allow_credentials" {
  description = "Allow cookies or other credentials in requests to the function URL"
  type        = bool
  default     = true
}

variable "cors_allow_origins" {
  description = "Origins allowed to access the function URL"
  type        = list(string)
  default     = ["*"]
}

variable "cors_allow_methods" {
  description = "HTTP methods allowed for the function URL"
  type        = list(string)
  default     = ["GET", "POST", "DELETE", "PUT", "PATCH", "*"]
}

variable "cors_allow_headers" {
  description = "HTTP headers allowed in requests to the function URL"
  type        = list(string)
  default     = ["date", "keep-alive", "x-custom-header"]
}

variable "cors_expose_headers" {
  description = "HTTP headers exposed to origins that call the function URL"
  type        = list(string)
  default     = ["keep-alive", "date"]
}

variable "cors_max_age" {
  description = "Maximum time (in seconds) for browsers to cache preflight request results"
  type        = number
  default     = 86400
}

variable "lambda_source_file" {
  description = "Path to the Lambda function source file"
  type        = string
}

variable "lambda_output_path" {
  description = "Path to the output zip file for the Lambda function"
  type        = string
}


//--

# Lambda Invocation Variables
variable "lambda_invocation_key1" {
  description = "Value for key1 in Lambda invocation input"
  type        = string
  default     = "value1"
}

variable "lambda_invocation_key2" {
  description = "Value for key2 in Lambda invocation input"
  type        = string
  default     = "value2"
}