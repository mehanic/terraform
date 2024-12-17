variable "aws_region" {
  description = "The AWS region where resources will be created."
  type        = string
  default     = "us-east-1"
}

variable "group_name" {
  description = "The name of the IAM group."
  type        = string
}

variable "policy_name" {
  description = "The name of the IAM policy."
  type        = string
}

variable "policy_description" {
  description = "The description of the IAM policy."
  type        = string
  default     = "Managed IAM policy for the example group."
}

variable "policy_document" {
  description = "The JSON policy document for the IAM policy."
  type        = string
}
