variable "user_name" {
  description = "Name of the IAM user"
  type        = string
  default     = "test-user"
}

variable "role_name" {
  description = "Name of the IAM role"
  type        = string
  default     = "test-role"
}

variable "group_name" {
  description = "Name of the IAM group"
  type        = string
  default     = "test-group"
}

variable "policy_name" {
  description = "Name of the IAM policy"
  type        = string
  default     = "test-policy"
}

variable "policy_description" {
  description = "Description of the IAM policy"
  type        = string
  default     = "A test policy"
}

variable "attachment_name" {
  description = "Name of the IAM policy attachment"
  type        = string
  default     = "test-attachment"
}