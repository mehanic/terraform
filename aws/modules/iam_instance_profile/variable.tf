variable "aws_region" {
  description = "The AWS region where resources will be created."
  type        = string
  default     = "us-east-1"
}

variable "role_name" {
  description = "The name of the IAM Role."
  type        = string
  default     = "test_role"
}

variable "role_path" {
  description = "The path for the IAM Role."
  type        = string
  default     = "/"
}

variable "role_tags" {
  description = "Tags for the IAM Role."
  type        = map(string)
  default     = {}
}

variable "instance_profile_name" {
  description = "The name of the IAM Instance Profile."
  type        = string
  default     = "test_profile"
}

variable "instance_profile_path" {
  description = "The path for the IAM Instance Profile."
  type        = string
  default     = "/"
}

variable "instance_profile_tags" {
  description = "Tags for the IAM Instance Profile."
  type        = map(string)
  default     = {}
}
