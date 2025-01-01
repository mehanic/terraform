
resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name # Use the bucket name defined in variables

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }

  force_destroy       = var.force_destroy
  object_lock_enabled = var.object_lock_enabled
}


# Destination S3 Bucket for Analytics
resource "aws_s3_bucket" "analytics" {
  bucket = var.analytics_bucket_name
}




resource "aws_s3_bucket" "inventory" {
  bucket = var.inventory_bucket_name
}


resource "aws_s3_bucket" "log_bucket" {
  bucket = var.log_bucket_name
}

# Define the destination S3 bucket
resource "aws_s3_bucket" "destination" {
  bucket = var.destination_bucket_name
}

//-----------






# resource "aws_sqs_queue" "queue_with_policy" {
#   //arn     = aws_sqs_queue.queue.arn
#   policy  = data.aws_iam_policy_document.queue.json
# }

# # Lambda Execution Role
# data "aws_iam_policy_document" "assume_role" {
#   statement {
#     effect = "Allow"
#     principals {
#       type        = "Service"
#       identifiers = ["lambda.amazonaws.com"]
#     }
#     actions = ["sts:AssumeRole"]
#   }
# }

# resource "aws_iam_role" "iam_for_lambda" {
#   name               = "iam_for_lambda"
#   assume_role_policy = data.aws_iam_policy_document.assume_role.json
# }

# # Lambda Functions
# resource "aws_lambda_function" "func" {
#   filename      = "your-function.zip"
#   function_name = "example_lambda_name"
#   role          = aws_iam_role.iam_for_lambda.arn
#   handler       = "exports.example"
#   runtime       = "python3.11"
# }

# resource "aws_lambda_function" "func1" {
#   filename      = "your-function1.zip"
#   function_name = "example_lambda_name1"
#   role          = aws_iam_role.iam_for_lambda.arn
#   handler       = "exports.example"
#   runtime       = "python3.11"
# }

# resource "aws_lambda_function" "func2" {
#   filename      = "your-function2.zip"
#   function_name = "example_lambda_name2"
#   role          = aws_iam_role.iam_for_lambda.arn
#   handler       = "exports.example"
#   runtime       = "python3.11"
# }

# # Lambda Permissions
# resource "aws_lambda_permission" "allow_bucket" {
#   statement_id  = "AllowExecutionFromS3Bucket"
#   action        = "lambda:InvokeFunction"
#   function_name = aws_lambda_function.func.arn
#   principal     = "s3.amazonaws.com"
#   source_arn    = aws_s3_bucket.example.arn
# }

# resource "aws_lambda_permission" "allow_bucket1" {
#   statement_id  = "AllowExecutionFromS3Bucket1"
#   action        = "lambda:InvokeFunction"
#   function_name = aws_lambda_function.func1.arn
#   principal     = "s3.amazonaws.com"
#   source_arn    = aws_s3_bucket.example.arn
# }

# resource "aws_lambda_permission" "allow_bucket2" {
#   statement_id  = "AllowExecutionFromS3Bucket2"
#   action        = "lambda:InvokeFunction"
#   function_name = aws_lambda_function.func2.arn
#   principal     = "s3.amazonaws.com"
#   source_arn    = aws_s3_bucket.example.arn
# }

# # S3 Bucket Notification Configurations
# resource "aws_s3_bucket_notification" "bucket_notification" {
#   bucket = aws_s3_bucket.example.id

#   lambda_function {
#     lambda_function_arn = aws_lambda_function.func1.arn
#     events              = ["s3:ObjectCreated:*"]
#     filter_prefix       = "AWSLogs/"
#     filter_suffix       = ".log"
#   }

#   lambda_function {
#     lambda_function_arn = aws_lambda_function.func2.arn
#     events              = ["s3:ObjectCreated:*"]
#     filter_prefix       = "OtherLogs/"
#     filter_suffix       = ".log"
#   }

#   depends_on = [
#     aws_lambda_permission.allow_bucket1,
#     aws_lambda_permission.allow_bucket2,
#   ]
# }

# resource "aws_s3_bucket_notification" "bucket_notification_sns" {
#   bucket = aws_s3_bucket.example.id

#   topic {
#     topic_arn     = aws_sns_topic.topic.arn
#     events        = ["s3:ObjectCreated:*"]
#     filter_suffix = ".log"
#   }
# }

# resource "aws_s3_bucket_notification" "bucket_notification_sqs" {
#   bucket = aws_s3_bucket.example.id

#   queue {
#     queue_arn     = aws_sqs_queue.queue.arn
#     events        = ["s3:ObjectCreated:*"]
#     filter_prefix = "images/"
#   }

#   queue {
#     queue_arn     = aws_sqs_queue.queue.arn
#     events        = ["s3:ObjectCreated:*"]
#     filter_prefix = "videos/"
#   }
# }