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

#   # You can add specific policies as needed
#   # For example, attaching the AWSLambdaBasicExecutionRole policy to allow Lambda to write logs
#   managed_policy_arns = [
#     "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
#   ]
}
