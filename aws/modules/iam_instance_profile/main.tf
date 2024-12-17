provider "aws" {
  region = var.aws_region
}

# Data resource for assume role policy document
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

# IAM Role
resource "aws_iam_role" "role" {
  name               = var.role_name
  path               = var.role_path
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  tags               = var.role_tags
}

# IAM Instance Profile
resource "aws_iam_instance_profile" "test_profile" {
  name = var.instance_profile_name
  path = var.instance_profile_path
  role = aws_iam_role.role.name
  tags = var.instance_profile_tags
}
