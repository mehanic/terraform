# resource "null_resource" "create_lambda_zip" {
#   provisioner "local-exec" {
#     command = "zip -r your-function.zip your_lambda_code.py"
#   }

#   triggers = {
#     always_run = "${timestamp()}"
#   }
# }

# # Data: Existing S3 Bucket
# data "aws_s3_bucket" "selected" {
#   bucket = var.bucket_name
# }

# # Data: Existing Route 53 Zone
# data "aws_route53_zone" "test_zone" {
#   name = var.route53_zone_name
# }

# # Route 53 Record for S3 Bucket Website
# resource "aws_route53_record" "bucket_record" {
#   zone_id = data.aws_route53_zone.test_zone.id
#   name    = var.route53_record_name
#   type    = "A"

#   alias {
#     name    = data.aws_s3_bucket.selected.website_domain
#     zone_id = data.aws_s3_bucket.selected.hosted_zone_id
#     evaluate_target_health = false
#   }
# }

# # CloudFront Distribution
# resource "aws_cloudfront_distribution" "test" {
#   origin {
#     domain_name = data.aws_s3_bucket.selected.bucket_domain_name
#     origin_id   = "s3-selected-bucket"
#   }

#   enabled             = true
#   default_root_object = "index.html"

#   default_cache_behavior {
#     allowed_methods  = ["GET", "HEAD"]
#     cached_methods   = ["GET", "HEAD"]
#     target_origin_id = "s3-selected-bucket"

#     forwarded_values {
#       query_string = false
#       cookies {
#         forward = "none"
#       }
#     }

#     viewer_protocol_policy = "redirect-to-https"
#   }

#   viewer_certificate {
#     cloudfront_default_certificate = true
#   }

#   restrictions {
#     geo_restriction {
#       restriction_type = "none"
#     }
#   }

#   tags = {
#     Environment = var.environment
#     Project     = var.project_name
#   }
# }
# //

# # Route 53 Zone Name
# variable "route53_zone_name" {
#   description = "Name of the Route 53 hosted zone."
#   type        = string
#   default     = "test.com."
# }

# # Route 53 Record Name
# variable "route53_record_name" {
#   description = "Name of the Route 53 record to create."
#   type        = string
#   default     = "bucket"
# }

# # Environment Tag
# # variable "environment" {
# #   description = "Environment for tagging purposes."
# #   type        = string
# #   default     = "production"
# # }

# # Project Name Tag
# variable "project_name" {
#   description = "Project name for tagging purposes."
#   type        = string
#   default     = "s3-website"
# }