resource "aws_lambda_function" "lambda_function_test" {
  filename         = var.lambda_zip_file
  function_name    = var.lambda_function_name
  role             = var.lambda_execution_role
  handler          = var.lambda_handler
  runtime          = var.lambda_runtime
  //source_code_hash = filebase64sha256(var.lambda_zip_file)
  source_code_hash = var.lambda_zip_file
   publish          = true
}
