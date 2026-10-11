resource "random_id" "suffix" {
  byte_length = 3
}
 
resource "aws_s3_bucket" "demo" {
  bucket = "${var.bucket_prefix}-${var.environment}-${random_id.suffix.hex}"
  tags = {
    Environment = var.environment
    ManagedBy   = "terraform-cloud"
    Org        = "DevOps"
    Dep        = "Engineering"
  }
}
 
resource "aws_s3_bucket_public_access_block" "demo" {
  bucket                  = aws_s3_bucket.demo.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
