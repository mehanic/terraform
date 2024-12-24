# Define Lambda Function
resource "aws_lambda_function" "test" {
  function_name = var.function_name
  runtime       = var.runtime
  role          = var.lambda_execution_role
  handler       = var.lambda_handler
  filename      = "../../examples/lambda_function_url/my-go-lambda/function.zip"

  depends_on = [null_resource.zip_go_lambda]

  # Environment Variables (optional)
  environment {
    variables = var.environment_variables
  }
}

# Lambda Function URL for Latest Version
resource "aws_lambda_function_url" "test_latest" {
  function_name      = aws_lambda_function.test.function_name
  authorization_type = "NONE"
}

# Lambda Function URL for Specific Alias or Version
resource "aws_lambda_function_url" "test_live" {
  function_name      = aws_lambda_function.test.function_name
  qualifier          = var.qualifier
  authorization_type = "AWS_IAM"

  cors {
    allow_credentials = true
    allow_origins     = var.cors_allow_origins
    allow_methods     = var.cors_allow_methods
    allow_headers     = var.cors_allow_headers
    expose_headers    = var.cors_expose_headers
    max_age           = var.cors_max_age
  }
}

resource "aws_iam_role" "lambda_execution_role" {
  name               = "my-lambda-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Effect    = "Allow"
        Sid       = ""
      },
    ]
  })
}