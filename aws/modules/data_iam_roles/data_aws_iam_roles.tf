# Data Source: Fetch all IAM roles
data "aws_iam_roles" "all_roles" {}

# Data Source: Fetch IAM roles matching a regex
data "aws_iam_roles" "project_roles" {
  name_regex = var.name_regex
}

# Data Source: Fetch IAM roles under a specific path
data "aws_iam_roles" "custom_path_roles" {
  path_prefix = var.path_prefix
}

# Data Source: Fetch SSO-related IAM roles
data "aws_iam_roles" "sso_roles" {
  path_prefix = "/aws-reserved/sso.amazonaws.com/"
}

# Data Source: Fetch specific SSO roles by name and path
data "aws_iam_roles" "specific_sso_roles" {
  name_regex  = var.sso_name_regex
  path_prefix = "/aws-reserved/sso.amazonaws.com/"
}
