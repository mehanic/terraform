# Data source to fetch details of an IAM user
data "aws_iam_user" "example" {
  user_name = var.user_name
}