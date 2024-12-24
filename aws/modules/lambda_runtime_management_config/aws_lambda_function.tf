resource "aws_lambda_function" "test" {
  function_name = var.function_name
  runtime       = var.runtime
  role          = var.lambda_execution_role
  handler       = var.lambda_handler
  filename      = "../../examples/lambda_runtime_management_config/my-go-lambda/function.zip"

  depends_on = [null_resource.zip_go_lambda]

  # Environment Variables (optional)
  environment {
    variables = var.environment_variables
  }
}
