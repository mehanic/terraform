# Variable for IAM User Name Regex
variable "name_regex" {
  description = "Regex to filter IAM users by their name."
  type        = string
  default     = ".*abc.*"
}

# Variable for IAM User Path Prefix
variable "path_prefix" {
  description = "Path prefix to filter IAM users."
  type        = string
  default     = "/custom-path"
}
