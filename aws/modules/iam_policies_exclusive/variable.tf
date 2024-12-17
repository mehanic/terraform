# IAM User Name
variable "user_name" {
  description = "The name of the IAM user to assign exclusive inline policies."
  type        = string
}

# IAM Inline Policy Names
variable "policy_names" {
  description = "A list of inline policy names to be exclusively assigned to the user."
  type        = list(string)
  default     = [] # Default is an empty list
}
