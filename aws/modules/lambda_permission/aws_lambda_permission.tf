# Data Sources
data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

# # IAM Role for Lambda Execution
# resource "aws_iam_role" "lambda_execution_role" {
#   name = "iam_for_lambda"
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = "sts:AssumeRole"
#         Effect = "Allow"
#         Principal = {
#           Service = "lambda.amazonaws.com"
#         }
#       },
#     ]
#   })
# }

# # IAM Role Policy
# resource "aws_iam_role_policy" "lambda_execution_policy" {
#   name = "LambdaExecutionPolicy"
#   role = aws_iam_role.lambda_execution_role.id
#   policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Action = [
#         #   "logs:CreateLogGroup",
#         #   "logs:CreateLogStream",
#         #   "logs:PutLogEvents",
#         #   "logs:DescribeLogStreams",
#         #   "lambda:InvokeFunction",
#           "logs:*"  # Full CloudWatch Logs permissions
#         ],
#         Effect = "Allow",
#         Resource = "*"
#       },
#       {
#         Action = [
#           "logs:*"
#         ],
#         Effect = "Allow",
#         Resource = "arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:/custom/logs/processor:*"
#       }
#     ]
#   })
# }


# IAM Role for Lambda Execution
resource "aws_iam_role" "lambda_execution_role" {
  name = "iam_for_lambda"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}

# IAM Role Policy with Full CloudWatch Logs Permissions
resource "aws_iam_role_policy" "lambda_execution_policy" {
  name = "LambdaExecutionPolicy"
  role = aws_iam_role.lambda_execution_role.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "logs:*",  # Full CloudWatch Logs permissions
          "lambda:InvokeFunction"  # Permission to invoke Lambda function
        ],
        Effect = "Allow",
        Resource = [
          "arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:/custom/logs/processor:*",
          "arn:aws:lambda:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:function:${aws_lambda_function.log_processor_lambda.function_name}"
        ]
      }
    ]
  })
}


# CloudWatch Log Groups
resource "aws_cloudwatch_log_group" "custom_logs" {
  name = "/custom/logs/processor"
  retention_in_days = 14
}

# SNS Topic
resource "aws_sns_topic" "sns_topic" {
  name = "lambda_sns_topic"
}

# Lambda Function
resource "aws_lambda_function" "log_processor_lambda" {
  filename         = "../../examples/lambda_permission/log_processor_lambda/log_processor_lambda.zip"
  function_name    = "log_processor_lambda"
  role             = aws_iam_role.lambda_execution_role.arn
  handler          = "log_processor.handler"
  runtime          = "python3.9"
  publish          = true
}

# # Lambda Permissions
# resource "aws_lambda_permission" "cloudwatch_permission" {
#   statement_id  = "AllowExecutionFromCloudWatch"
#   action        = "lambda:InvokeFunction"
#   function_name = aws_lambda_function.log_processor_lambda.function_name
#   principal     = "logs.amazonaws.com"
#   source_arn    = aws_cloudwatch_log_group.custom_logs.arn
# }

resource "aws_lambda_permission" "sns_permission" {
  statement_id  = "AllowExecutionFromSNS"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.log_processor_lambda.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.sns_topic.arn
}

# # CloudWatch Log Subscription Filter
# resource "aws_cloudwatch_log_subscription_filter" "log_subscription" {
#   name            = "log_subscription_filter"
#   log_group_name  = aws_cloudwatch_log_group.custom_logs.name
#   filter_pattern  = var.filter_pattern
#  // destination_arn = aws_lambda_function.log_processor_lambda.arn 
#   destination_arn = "arn:aws:lambda:eu-central-1:476167141852:function:dx-dev-lmbd"

#   depends_on = [
#     aws_lambda_function.log_processor_lambda,
#     aws_lambda_permission.cloudwatch_permission,
#     aws_cloudwatch_log_group.custom_logs
#   ]
# }
