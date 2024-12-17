# Get the current caller's identity
data "aws_caller_identity" "current" {}

# Fetch IAM session context for assumed role
data "aws_iam_session_context" "example" {
  arn = data.aws_caller_identity.current.arn
}
