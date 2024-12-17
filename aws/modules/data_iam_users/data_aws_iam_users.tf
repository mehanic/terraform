# Fetch All IAM Users (No Filters)
data "aws_iam_users" "all_users" {}

# Fetch IAM Users Matching a Regex in their Names
data "aws_iam_users" "filtered_users_by_name" {
  name_regex = var.name_regex
}

# Fetch IAM Users Under a Specific Path Prefix
data "aws_iam_users" "filtered_users_by_path" {
  path_prefix = var.path_prefix
}
