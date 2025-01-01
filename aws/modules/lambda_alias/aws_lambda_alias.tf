resource "aws_lambda_alias" "test_lambda_alias" {
  name          = var.lambda_alias_name
  description   = var.lambda_alias_description
  function_name = aws_lambda_function.lambda_function_test.arn
  // function_version = aws_lambda_function.lambda_function_test.version
  function_version = var.lambda_function_version

  routing_config {
    additional_version_weights = var.additional_version_weights
  }
}

//aws lambda list-functions --region us-east-1