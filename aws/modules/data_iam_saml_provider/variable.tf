# AWS Region
variable "aws_region" {
  description = "The AWS region where the SAML provider is configured."
  type        = string
  default     = "us-east-1"
}

# ARN of the SAML Provider
variable "saml_provider_arn" {
  description = "The ARN of the SAML provider to fetch details for."
  type        = string
}
