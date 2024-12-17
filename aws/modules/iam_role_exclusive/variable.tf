# Variables
variable "role_name" {
  description = "The name of the IAM role."
  type        = string
  default     = "example-role"
}

variable "policy_names" {
  description = "A list of inline policy names to be assigned to the IAM role."
  type        = list(string)
  default     = ["example-inline-policy"]
}
