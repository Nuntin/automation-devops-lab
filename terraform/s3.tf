resource "aws_s3_bucket" "devops_bucket" {
  bucket = "devops-lab-bucket-${random_id.bucket_id.hex}"
  acl    = "private"

  tags = {
    Name        = "DevOpsLabBucket"
    Environment = "Dev"
  }
}

resource "random_id" "bucket_id" {
  byte_length = 4
}