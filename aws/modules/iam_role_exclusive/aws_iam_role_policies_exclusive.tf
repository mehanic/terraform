# IAM Role
resource "aws_iam_role" "iam_role_example" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json

  tags = {
    Environment = "Production"
    ManagedBy   = "Terraform"
  }
}

# Assume Role Policy Document (Trust Policy)
data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

# Example Inline IAM Policy
resource "aws_iam_role_policy" "example" {
  name   = var.policy_names[0]
  role   = aws_iam_role.iam_role_example.id
  policy = data.aws_iam_policy_document.example_inline_policy.json
}

# IAM Policy Document for Inline Policy
data "aws_iam_policy_document" "example_inline_policy" {
  statement {
    effect = "Allow"

    actions   = ["s3:ListBucket", "s3:GetObject"]
    resources = ["*"]
  }
}