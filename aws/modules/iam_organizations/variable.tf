variable "aws_region" {
  description = "The AWS region where resources will be created."
  type        = string
  default     = "us-east-1"
}

variable "enabled_features" {
  description = "The list of IAM Organizations features to enable for the root account."
  type        = list(string)
  default = [
    "RootCredentialsManagement",
    "RootSessions"
  ]
}
