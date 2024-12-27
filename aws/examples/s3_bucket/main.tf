module "s3_backet" {
source = "../../modules/s3_bucket"
bucket_name = "my-bucket-especially-for-test-2024"
environment = "Production"
force_destroy         = false
object_lock_enabled   = false
acceleration_status   = "Enabled"
block_public_acls     = false
block_public_policy   = false
ignore_public_acls    = false
restrict_public_buckets = false
bucket_acl            = "public-read"
analytics_bucket_name = "analytics-destination-analytics-destination"
}
