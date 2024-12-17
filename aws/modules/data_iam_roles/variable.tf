# Variable for AWS region
variable "aws_region" {
  description = "The AWS region where resources will be queried."
  type        = string
  default     = "us-east-1"
}

# Variable for filtering roles by regex
variable "name_regex" {
  description = "Regex pattern to filter IAM roles by name."
  type        = string
  default     = ".*project.*"
}

# Variable for filtering roles by path
variable "path_prefix" {
  description = "Path prefix to filter IAM roles."
  type        = string
  default     = "/custom-path"
}

# Variable for filtering SSO roles by name
variable "sso_name_regex" {
  description = "Regex pattern to filter SSO-related IAM roles by name."
  type        = string
  default     = "AWSReservedSSO_permission_set_name_.*"
}
