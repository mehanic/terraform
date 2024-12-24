resource "aws_lambda_function" "example" {
  filename         = var.lambda_zip_file
  function_name    = var.lambda_function_name
  //role             = var.lambda_execution_role
role          = aws_iam_role.lambda_execution_role.arn
  handler          = var.lambda_handler
  runtime          = var.lambda_runtime
 // source_code_hash = filebase64sha256(var.lambda_zip_file)
  publish          = true
}


resource "aws_lambda_alias" "example" {
  name             = var.lambda_alias_name
  description      = var.lambda_alias_description
  function_name    = aws_lambda_function.example.arn
  function_version = aws_lambda_function.example.version
}

resource "aws_lambda_provisioned_concurrency_config" "example" {
  function_name                     = aws_lambda_alias.example.function_name
  provisioned_concurrent_executions = var.provisioned_concurrent_executions
  qualifier                         = aws_lambda_alias.example.name
}
