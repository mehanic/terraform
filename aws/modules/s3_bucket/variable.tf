variable "bucket_name" {
  description = "The name of the S3 bucket."
  type        = string
}

variable "environment" {
  description = "The environment the bucket is associated with."
  type        = string
  default     = "Dev"
}

variable "force_destroy" {
  description = "Boolean that indicates whether to delete all objects from the bucket when the bucket is destroyed."
  type        = bool
  default     = false
}

variable "object_lock_enabled" {
  description = "Whether the S3 bucket has object lock enabled."
  type        = bool
  default     = false
}

variable "acceleration_status" {
  description = "The transfer acceleration state of the bucket"
  type        = string
  default     = "Enabled" # Options: Enabled, Suspended
}


variable "block_public_acls" {
  description = "Whether to block public ACLs"
  type        = bool
  default     = false
}

variable "block_public_policy" {
  description = "Whether to block public policies"
  type        = bool
  default     = false
}

variable "ignore_public_acls" {
  description = "Whether to ignore public ACLs"
  type        = bool
  default     = false
}

variable "restrict_public_buckets" {
  description = "Whether to restrict public bucket access"
  type        = bool
  default     = false
}

variable "bucket_acl" {
  description = "The canned ACL for the S3 bucket"
  type        = string
  default     = "public-read"
}


variable "analytics_bucket_name" {
  description = "The name of the destination S3 bucket for analytics"
  type        = string
  default     = "analytics-destination-analytics-destination"
}

//


variable "deep_archive_days" {
  description = "Number of days before moving to DEEP_ARCHIVE_ACCESS."
  type        = number
  default     = 180
}

variable "archive_days" {
  description = "Number of days before moving to ARCHIVE_ACCESS."
  type        = number
  default     = 125
}

variable "filtered_status" {
  description = "The status for the filtered configuration."
  type        = string
  default     = "Disabled" # Options: Enabled, Disabled
}

variable "filtered_prefix" {
  description = "Prefix for the filtered configuration."
  type        = string
  default     = "documents/"
}

variable "filtered_tags" {
  description = "Tags for the filtered configuration."
  type        = map(string)
  default = {
    priority = "high"
    class    = "blue"
  }
}



variable "inventory_bucket_name" {
  description = "The name of the destination S3 bucket for inventory results."
  type        = string
  default     = "my-tf-inventory-inventory-bucket"
}

variable "included_object_versions" {
  description = "Object versions to include in the inventory list. Valid values: All, Current."
  type        = string
  default     = "All"
}

variable "entire_bucket_frequency" {
  description = "Frequency for generating inventory results for the entire bucket. Valid values: Daily, Weekly."
  type        = string
  default     = "Daily"
}

variable "prefix_frequency" {
  description = "Frequency for generating inventory results for the filtered bucket. Valid values: Daily, Weekly."
  type        = string
  default     = "Daily"
}

variable "filter_prefix" {
  description = "Prefix that an object must have to be included in the inventory results."
  type        = string
  default     = "documents/"
}

variable "inventory_format" {
  description = "Specifies the output format of the inventory results. Valid values: CSV, ORC, Parquet."
  type        = string
  default     = "ORC"
}

variable "destination_prefix" {
  description = "Prefix that is prepended to all inventory results in the destination bucket."
  type        = string
  default     = "inventory"
}
//---

variable "log_bucket_name" {
  description = "The name of the S3 bucket for storing logs."
  type        = string
  default     = "my-tf-log-bucket-log-bucket"
}

variable "log_bucket_acl" {
  description = "The canned ACL for the log bucket."
  type        = string
  default     = "log-delivery-write"
}

variable "target_prefix" {
  description = "The prefix for log object keys in the log bucket."
  type        = string
  default     = "log/"
}

variable "access_point_name" {
  description = "The name of the S3 Access Point."
  type        = string
  default     = "example-access-point"
}

variable "metric_name" {
  description = "The name of the metric configuration for the bucket."
  type        = string
  default     = "ImportantBlueDocuments"
}

variable "object_lock_mode" {
  type        = string
  default     = "COMPLIANCE"
  description = "description"
}

variable "retention_days" {
  type        = number
  default     = "5"
  description = "description"
}

# Variable for object ownership setting
variable "object_ownership" {
  description = "Object ownership for the S3 bucket"
  type        = string
  default     = "BucketOwnerPreferred" # Default ownership setting
}



# Variable for allowed AWS account IDs
variable "allowed_account_ids" {
  description = "List of AWS account IDs allowed to access the bucket"
  type        = list(string)
  default     = ["476167141852"] # Replace with the AWS account ID you want to allow
}

//---

# # Variable for the source S3 bucket name
# variable "source_bucket_name" {
#   description = "The name of the source S3 bucket for replication"
#   type        = string
# }

# Variable for the destination S3 bucket name
variable "destination_bucket_name" {
  description = "The name of the destination S3 bucket for replication"
  type        = string
  default     = "destination-bucket-name-destination-bucket-name"
}



# SNS Topic Name
variable "sns_topic_name" {
  description = "Name of the SNS topic for S3 notifications."
  type        = string
  default     = "s3-event-notification-topic"
}

# S3 Event Types
variable "s3_event_types" {
  description = "List of S3 event types to trigger notifications."
  type        = list(string)
  default     = ["s3:ObjectCreated:*"]
}

# S3 Filter Suffix
variable "s3_filter_suffix" {
  description = "Suffix filter for S3 bucket events."
  type        = string
  default     = ".log"
}

# SQS Queue Name
variable "sqs_queue_name" {
  description = "Name of the SQS queue for S3 notifications."
  type        = string
  default     = "s3-event-notification-queue"
}
