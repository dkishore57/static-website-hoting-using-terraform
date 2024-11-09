provider "aws" {
  region=var.region_name
}
resource "aws_s3_bucket" "s3" {
  bucket = var.bucket_name
}
resource "aws_s3_bucket_public_access_block" "s3-public-access-block" {
  bucket = aws_s3_bucket.s3.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
resource "aws_s3_bucket_ownership_controls" "s3-ownership-control" {
  bucket = aws_s3_bucket.s3.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.s3.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${aws_s3_bucket.s3.arn}/*"
      }
    ]
  })
}
resource "aws_s3_bucket_acl" "s3-bucket-acl" {
  bucket = aws_s3_bucket.s3.id
  acl    = "public-read"
}
resource "aws_s3_object" "s3_object" {
  bucket = aws_s3_bucket.s3.id
  key    = "index.html"
  source = "./index.html"
  content_type = "text/html"
  acl="public-read"
  etag = filemd5("./index.html")
}
resource "aws_s3_bucket_website_configuration" "website-configuration" {
  bucket = aws_s3_bucket.s3.id

  index_document {
    suffix = "index.html"
  }
}
