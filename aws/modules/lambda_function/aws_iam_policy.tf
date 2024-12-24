resource "aws_iam_policy" "lambda_logging" {
  name        = "lambda_logging"
  path        = "/"
  description = "IAM policy for logging from a lambda"
  policy      = data.aws_iam_policy_document.lambda_logging.json
}


resource "aws_iam_policy" "lambda_vpc_permissions" {
  name        = "LambdaVpcPermissions"
  description = "Permissions required for Lambda to run in a VPC"
  policy      = data.aws_iam_policy_document.lambda_vpc_permissions.json
}
