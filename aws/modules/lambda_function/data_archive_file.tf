data "archive_file" "lambda" {
  type        = "zip"
  source_file = var.lambda_source_file
  output_path = var.lambda_output_path
}