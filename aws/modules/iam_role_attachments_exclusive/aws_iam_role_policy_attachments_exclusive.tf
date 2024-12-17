provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

# IAM Role
resource "aws_iam_role" "example" {
  name               = var.role_name
  assume_role_policy = var.assume_role_policy_json
  tags               = var.role_tags
}

# Managed IAM Policy
resource "aws_iam_policy" "example" {
  name        = var.managed_policy_name
  description = var.managed_policy_description
  policy      = var.managed_policy_json
}

# Attach Managed IAM Policy Exclusively to Role
resource "aws_iam_role_policy_attachments_exclusive" "role_policy_attachments_exclusive_example" {
  role_name   = aws_iam_role.example.name
  policy_arns = [aws_iam_policy.example.arn]
}
