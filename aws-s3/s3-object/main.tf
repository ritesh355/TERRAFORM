# firstly create a bucket

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "ritesh-terraform-day8-demo"
  tags = {
    Name        = "MyBucket"
    Environment = "Dev"
  }
 } 
  #upload a single file 
  
  resource "aws_s3_object" "single_file" {
  bucket = aws_s3_bucket.my_bucket.id
  key    = "hello.txt"         # Name in S3
  source = "hello.txt"         # Local file path
  etag   = filemd5("hello.txt")
            # Secure by default
}

#uplod folder or static folder 

resource "aws_s3_object" "website_files" {
  for_each = fileset("website", "**")  # Loop through all files

  bucket = aws_s3_bucket.my_bucket.id
  key    = each.value
  source = "website/${each.value}"
  etag   = filemd5("website/${each.value}")
  acl    = "private"
  content_type = lookup(
    {
      html = "text/html"
      css  = "text/css"
      js   = "application/javascript"
    },
    split(".", each.value)[length(split(".", each.value)) - 1],
    "binary/octet-stream"
  )
}


