# Runtime Management Configuration
resource "aws_lambda_runtime_management_config" "example" {
  function_name     = aws_lambda_function.test.function_name
  update_runtime_on = var.update_runtime_on

  # Only set if manual update is selected
  //  runtime_version_arn = var.runtime_version_arn
}