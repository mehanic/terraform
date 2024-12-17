variable "region" {
  description = "The AWS region to use"
  type        = string
  default     = "us-east-1"
}

variable "iam_user_name" {
  description = "The name of the IAM user"
  type        = string
  default     = "example"
}

variable "service_name" {
  description = "The name of the AWS service to associate with the credential"
  type        = string
  default     = "codecommit.amazonaws.com"
}

variable "status" {
  description = "The status of the service-specific credential (Active or Inactive)"
  type        = string
  default     = "Active"
}
