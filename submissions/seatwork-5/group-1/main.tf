provider "aws" {
  region = "ap-southeast-1"
}

# The Lab 4 messages table
resource "aws_dynamodb_table" "messages" {
  name         = "umak-elec3-ccsad-g01-messages"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    course = "elec3"
    group  = "ccsad-g01"
  }
}

# The Seatwork 3 static website bucket
resource "aws_s3_bucket" "site" {
  bucket = "umak-elec3-ccsad-g01-linktree"

  tags = {
    course = "elec3"
    group  = "ccsad-g01"
  }
}

resource "aws_s3_bucket_website_configuration" "site" {
  bucket = aws_s3_bucket.site.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_public_access_block" "site" {
  bucket = aws_s3_bucket.site.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "site" {
  bucket = aws_s3_bucket.site.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.site.arn}/*"
      }
    ]
  })

  depends_on = [aws_s3_bucket_public_access_block.site]
}