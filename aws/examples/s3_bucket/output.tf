output "bucket_name" {
  value       = module.s3_backet.bucket_name
}

output "bucket_arn" {
  value       = module.s3_backet.bucket_arn
}


output "acceleration_status" {
  value       = module.s3_backet.acceleration_status
}

output "bucket_acl" {
  value       = module.s3_backet.bucket_acl
}

output "bucket_ownership_controls" {
  value       = module.s3_backet.bucket_ownership_controls
}


output "analytics_bucket_name" {
  value       = module.s3_backet.analytics_bucket_name
}

output "entire_bucket_analytics_name" {
  value       = module.s3_backet.entire_bucket_analytics_name
}

output "filtered_analytics_name" {
  value       = module.s3_backet.filtered_analytics_name
}

output "cors_configuration" {
  value = module.s3_backet.cors_configuration
}

output "intelligent_tiering_entire_bucket" {
  value       = module.s3_backet.intelligent_tiering_entire_bucket
}

output "intelligent_tiering_filtered" {
  value       = module.s3_backet.intelligent_tiering_filtered
}


output "inventory_bucket_name" {
  description = "The name of the destination S3 bucket for inventory results."
  value       = module.s3_backet.inventory_bucket_name
}

output "inventory_entire_bucket_name" {
  value       = module.s3_backet.inventory_entire_bucket_name
}

output "inventory_prefix_name" {
  value       = module.s3_backet.inventory_prefix_name
}

output "log_bucket_name" {
  value       = module.s3_backet.log_bucket_name
}

output "logging_configuration" {
  value = module.s3_backet.logging_configuration
}

output "bucket_policy" {
  value       = module.s3_backet.bucket_policy
}
//

# Output the ARN of the source bucket
output "source_bucket_arn" {
  value       = module.s3_backet.source_bucket_arn
}

# Output the ARN of the destination bucket
output "destination_bucket_arn" {
  value       = module.s3_backet.destination_bucket_arn
}

# Output the IAM role ARN used for replication
output "replication_role_arn" {
  value       = module.s3_backet.replication_role_arn
}


output "replication_configuration_id" {
  value       = module.s3_backet.replication_configuration_id
}

output "delete_marker_replication_status" {
  value       = module.s3_backet.delete_marker_replication_status
}

//--

output "sns_topic_arn" {
  value = module.s3_backet.sns_topic_arn
}

output "sns_topic_name" {
  value = module.s3_backet.sns_topic_name
}

output "sqs_queue_name" {
  value       = module.s3_backet.sqs_queue_name
}

output "sqs_queue_arn" {
  value       = module.s3_backet.sqs_queue_arn
}

output "sqs_queue_url" {
  value       = module.s3_backet.sqs_queue_url
}