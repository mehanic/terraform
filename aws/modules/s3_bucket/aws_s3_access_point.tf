resource "aws_s3_access_point" "example-access-point" {
  bucket = aws_s3_bucket.example.id
  name   = var.access_point_name
}