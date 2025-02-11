# resource "aws_instance" "myec2" {
#     ami = "ami-053b12d3152c0cc71"
#     instance_type = "t2.micro"
# }

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unm-bucket-12345"

  website {
    index_document = "index.html"
  }

  tags = {
    Name        = "Terraform S3 Bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket                  = aws_s3_bucket.my_bucket.id
  block_public_acls       = false
  block_public_policy     = false
  restrict_public_buckets = false
  ignore_public_acls      = false
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.my_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = "s3:GetObject"
        Effect   = "Allow"
        Resource = "${aws_s3_bucket.my_bucket.arn}/*"
        Principal = "*"
      }
    ]
  })
}

resource "aws_s3_object" "upload_file" {
  bucket       = aws_s3_bucket.my_bucket.bucket
  key          = "index.html"
  source       = "index.html"
  content_type = "text/html"
}

output "s3_file_url" {
  value = "http://${aws_s3_bucket.my_bucket.bucket}.s3-website-${var.aws_region}.amazonaws.com/${aws_s3_object.upload_file.key}"
}

variable "aws_region" {
  default = "ap-south-1"
}