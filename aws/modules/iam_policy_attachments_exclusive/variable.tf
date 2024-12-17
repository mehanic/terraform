# Variable for IAM User Name
variable "user_name" {
  description = "The name of the IAM user."
  type        = string
  default     = "example-user"
}

# Variable for IAM Policy Name
variable "policy_name" {
  description = "The name of the managed IAM policy."
  type        = string
  default     = "example-policy"
}

# Variable to Control Policy Attachments
variable "attach_policies" {
  description = "A flag to determine whether policies should be attached."
  type        = bool
  default     = true
}
