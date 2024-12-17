provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

# AWS STS Global Endpoint Token Preferences
resource "aws_iam_security_token_service_preferences" "security_token_service_preferences_example" {
  global_endpoint_token_version = var.global_endpoint_token_version
}
