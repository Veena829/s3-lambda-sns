resource "aws_s3_bucket" "image_bucket" {
  bucket = var.bucket_name
  #acl    = "private"
}

output "bucket_name" {
  value = aws_s3_bucket.image_bucket.bucket
}
