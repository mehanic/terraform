# Create an AWS Organization
resource "aws_organizations_organization" "example" {
  aws_service_access_principals = ["iam.amazonaws.com"]
  feature_set                   = "ALL"
}

# Enable IAM Organizations Features
resource "aws_iam_organizations_features" "example" {
  enabled_features = var.enabled_features
}
