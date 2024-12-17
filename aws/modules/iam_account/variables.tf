

variable "aws_iam_access_user_name" {
  description = "Name of the IAM user for the load balancer."
  type        = string
  default     = "loadbalancer"
}

variable "aws_iam_access_user_path" {
  description = "Path for the IAM user for the load balancer."
  type        = string
  default     = "/system/"
}

variable "aws_iam_access_pgp_key" {
  description = "PGP key or keybase username for encrypting the access key secret for the load balancer."
  type        = string
  default     = "keybase:some_person_that_exists"
}

variable "aws_iam_access_policy_name" {
  description = "Name of the IAM user policy for the load balancer."
  type        = string
  default     = "test"
}

variable "test_user_name" {
  description = "Name of the IAM user for testing."
  type        = string
  default     = "test"
}

variable "test_user_path" {
  description = "Path for the IAM user for testing."
  type        = string
  default     = "/test/"
}

variable "account_alias" {
  description = "Alias for the AWS account."
  type        = string
  default     = "my-account-alias"
}

variable "minimum_password_length" {
  description = "Minimum length to require for user passwords."
  type        = number
  default     = 8
}

variable "require_lowercase_characters" {
  description = "Whether to require lowercase characters for user passwords."
  type        = bool
  default     = true
}

variable "require_numbers" {
  description = "Whether to require numbers for user passwords."
  type        = bool
  default     = true
}

variable "require_uppercase_characters" {
  description = "Whether to require uppercase characters for user passwords."
  type        = bool
  default     = true
}

variable "require_symbols" {
  description = "Whether to require symbols for user passwords."
  type        = bool
  default     = true
}

variable "allow_users_to_change_password" {
  description = "Whether to allow users to change their own password."
  type        = bool
  default     = true
}

variable "max_password_age" {
  description = "The number of days that a user password is valid."
  type        = number
  default     = 0
}

variable "password_reuse_prevention" {
  description = "The number of previous passwords that users are prevented from reusing."
  type        = number
  default     = 5
}