output "bucket_name" {
  description = "The name of the S3 bucket."
  value       = aws_s3_bucket.example.bucket
}

output "bucket_arn" {
  description = "The ARN of the S3 bucket."
  value       = aws_s3_bucket.example.arn
}


output "acceleration_status" {
  description = "The acceleration status of the S3 bucket"
  value       = aws_s3_bucket_accelerate_configuration.example.status
}

output "bucket_acl" {
  description = "The ACL applied to the S3 bucket"
  value       = aws_s3_bucket_acl.example.acl
}

output "bucket_ownership_controls" {
  description = "The ownership controls applied to the S3 bucket"
  value       = aws_s3_bucket_ownership_controls.example.rule[0].object_ownership
}


output "analytics_bucket_name" {
  description = "The name of the analytics destination bucket"
  value       = aws_s3_bucket.analytics.bucket
}

output "entire_bucket_analytics_name" {
  description = "The name of the analytics configuration for the entire bucket"
  value       = aws_s3_bucket_analytics_configuration.example_entire_bucket.name
}

output "filtered_analytics_name" {
  description = "The name of the analytics configuration for filtered data"
  value       = aws_s3_bucket_analytics_configuration.example_filtered.name
}

output "cors_configuration" {
  description = "The CORS configuration rules applied to the bucket"
  value = aws_s3_bucket_cors_configuration.example.cors_rule
}

output "intelligent_tiering_entire_bucket" {
  description = "The intelligent tiering configuration for the entire bucket."
  value       = aws_s3_bucket_intelligent_tiering_configuration.example_entire_bucket.name
}

output "intelligent_tiering_filtered" {
  description = "The intelligent tiering configuration for filtered objects."
  value       = aws_s3_bucket_intelligent_tiering_configuration.example_filtered.name
}


output "inventory_bucket_name" {
  description = "The name of the destination S3 bucket for inventory results."
  value       = aws_s3_bucket.inventory.bucket
}

output "inventory_entire_bucket_name" {
  description = "The name of the inventory configuration for the entire bucket."
  value       = aws_s3_bucket_inventory.test_entire_bucket.name
}

output "inventory_prefix_name" {
  description = "The name of the inventory configuration for objects with the specified prefix."
  value       = aws_s3_bucket_inventory.test_prefix.name
}

output "log_bucket_name" {
  description = "The name of the log S3 bucket."
  value       = aws_s3_bucket.log_bucket.bucket
}

output "logging_configuration" {
  description = "The logging configuration for the example bucket."
  value = {
    target_bucket = aws_s3_bucket_logging.example_logging.target_bucket
    target_prefix = aws_s3_bucket_logging.example_logging.target_prefix
  }
}

output "access_point_name" {
  description = "The name of the S3 Access Point."
  value       = aws_s3_access_point.example-access-point.name
}

output "metric_name" {
  description = "The name of the metric configuration."
  value       = aws_s3_bucket_metric.example-filtered.name
}

//--

# output "sns_topic_arn" {
#   description = "The ARN of the SNS topic."
#   value       = aws_sns_topic.topic.arn
# }

# output "sqs_queue_arn" {
#   description = "The ARN of the SQS queue."
#   value       = aws_sqs_queue.queue.arn
# }

# output "lambda_function_arn" {
#   description = "The ARN of the Lambda function."
#   value       = aws_lambda_function.func.arn
# }


# Output the bucket policy
output "bucket_policy" {
  description = "Bucket policy applied to the S3 bucket"
  value       = aws_s3_bucket_policy.allow_access_from_another_account.policy
}


# Output the ARN of the source bucket
output "source_bucket_arn" {
  description = "The ARN of the source S3 bucket"
  value       = aws_s3_bucket.example.arn
}

# Output the ARN of the destination bucket
output "destination_bucket_arn" {
  description = "The ARN of the destination S3 bucket"
  value       = aws_s3_bucket.destination.arn
}

# Output the IAM role ARN used for replication
output "replication_role_arn" {
  description = "The ARN of the IAM role used for replication"
  value       = aws_iam_role.replication.arn
}
//--

output "replication_configuration_id" {
  description = "ID of the replication configuration"
  value       = aws_s3_bucket_replication_configuration.replication.id
}

output "delete_marker_replication_status" {
  description = "The status of delete marker replication"
  value       = aws_s3_bucket_replication_configuration.replication.rule[0].delete_marker_replication[0].status
}



//--

output "sns_topic_arn" {
  value = aws_sns_topic.topic.arn
  description = "ARN of the SNS topic for S3 notifications."
}

output "sns_topic_name" {
  value = aws_sns_topic.topic.name
  description = "Name of the SNS topic for S3 notifications."
}


output "sqs_queue_name" {
  value       = aws_sqs_queue.queue.name
  description = "Name of the SQS queue for S3 notifications."
}

output "sqs_queue_arn" {
  value       = aws_sqs_queue.queue.arn
  description = "ARN of the SQS queue for S3 notifications."
}

output "sqs_queue_url" {
  value       = aws_sqs_queue.queue.url
  description = "URL of the SQS queue for S3 notifications."
}