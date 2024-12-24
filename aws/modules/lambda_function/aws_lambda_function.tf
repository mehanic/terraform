resource "aws_cloudwatch_log_group" "example" {
  name              = "/aws/lambda/${var.lambda_function_name}"
  retention_in_days = var.log_retention_days
}

resource "aws_lambda_function" "test_lambda" {
  function_name    = var.lambda_function_name
  filename         = data.archive_file.lambda.output_path
  role             = aws_iam_role.iam_for_lambda.arn
  handler          = var.lambda_handler
  runtime          = var.lambda_runtime
  source_code_hash = data.archive_file.lambda.output_base64sha256

  environment {
    variables = var.lambda_environment_variables
  }

  vpc_config {
    subnet_ids         = var.subnet_ids
    security_group_ids = var.security_group_ids
  }

  timeout = var.lambda_timeout
  memory_size = var.lambda_memory_size

  depends_on = [
    aws_iam_role_policy_attachment.lambda_logs,
    aws_cloudwatch_log_group.example,
  ]
}




resource "aws_lambda_function_url" "test_live" {
  function_name      = aws_lambda_function.test_lambda.function_name
  qualifier          = var.lambda_qualifier
  authorization_type = "AWS_IAM"

#   cors {
#     allow_credentials = var.cors_allow_credentials
#     allow_origins     = var.cors_allow_origins
#     allow_methods     = var.cors_allow_methods
#     allow_headers     = var.cors_allow_headers
#     expose_headers    = var.cors_expose_headers
#     max_age           = var.cors_max_age
#   }
}


# Lambda Invocation
resource "aws_lambda_invocation" "example" {
  function_name = aws_lambda_function.test_lambda.function_name

  triggers = {
    redeployment = sha1(jsonencode([
      aws_lambda_function.test_lambda.environment
    ]))
  }

  input = jsonencode({
    key1 = var.lambda_invocation_key1
    key2 = var.lambda_invocation_key2
  })
}