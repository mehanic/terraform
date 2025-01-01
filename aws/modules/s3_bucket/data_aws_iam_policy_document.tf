# IAM Policy Document for SNS Topic
data "aws_iam_policy_document" "topic" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["s3.amazonaws.com"]
    }

    actions   = ["SNS:Publish"]
    resources = ["arn:aws:sns:*:*:${var.sns_topic_name}"]

    condition {
      test     = "ArnLike"
      variable = "aws:SourceArn"
      values   = [aws_s3_bucket.example.arn]
    }
  }
}

# Attach the IAM Policies to SNS and SQS Resources
resource "aws_sns_topic" "topic_with_policy" {
  //arn     = aws_sns_topic.topic.arn
  policy = data.aws_iam_policy_document.topic.json
}



# IAM Policy Document for SQS Queue
data "aws_iam_policy_document" "queue" {
  statement {
    effect = "Allow"

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions   = ["sqs:SendMessage"]
    resources = ["arn:aws:sqs:*:*:${var.sqs_queue_name}"]

    condition {
      test     = "ArnEquals"
      variable = "aws:SourceArn"
      values   = [aws_s3_bucket.example.arn]
    }
  }
}

resource "aws_sqs_queue" "queue_with_policy" {
  //arn     = aws_sqs_queue.queue.arn
  policy = data.aws_iam_policy_document.queue.json
}

# # S3 Event Types
# variable "s3_event_types" {
#   description = "List of S3 event types to trigger notifications."
#   type        = list(string)
#   default     = ["s3:ObjectCreated:*"]
# }

# # S3 Filter Suffix
# variable "s3_filter_suffix" {
#   description = "Suffix filter for S3 bucket events."
#   type        = string
#   default     = ".log"
# }