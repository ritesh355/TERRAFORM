provider "aws" {
  region = "us-east-1"   # Change region if needed
}

# Create an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "ritesh-terraform-demo"
  
  #you can skip tag part
   tags = {
    Name        = "MyBucket"
    Environment = "Dev"
  }
}

# Optional: Enable Versioning
resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.my_bucket.id # you also use .bucket in place of .id  | .id and .bucket often give the same result for S3, but .id is a Terraform standard practice for referencing a resource's unique identifier.

  versioning_configuration {
    status = "Enabled"
  }
}

# Optional: Block Public Access
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
