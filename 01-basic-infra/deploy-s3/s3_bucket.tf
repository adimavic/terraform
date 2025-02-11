resource "aws_s3_bucket" "my_bucket" {
  bucket = "resumehostingamz"


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

resource "aws_s3_object" "upload_manisha" {
  bucket       = aws_s3_bucket.my_bucket.bucket
  key          = "ManishaChoudharyCV.pdf"
  source       = "ManishaChoudharyCV.pdf"
  content_type = "application/pdf"
}

resource "aws_s3_object" "upload_aditya" {
  bucket       = aws_s3_bucket.my_bucket.bucket
  key          = "AdityaKale.pdf"
  source       = "AdityaKale.pdf"
  content_type = "application/pdf"

}

output "manisha_cv_url" {
  value = "http://${aws_s3_bucket.my_bucket.bucket}.s3-${var.aws_region}.amazonaws.com/${aws_s3_object.upload_manisha.key}"
}

output "aditya_cv_url" {
  value = "http://${aws_s3_bucket.my_bucket.bucket}.s3-${var.aws_region}.amazonaws.com/${aws_s3_object.upload_aditya.key}"
}

variable "aws_region" {
  default = "ap-south-1"
}