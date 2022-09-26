terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-west-1"
  profile = "default"
}

resource "aws_s3_bucket" "b" {
  bucket = "demo-test"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.b.id
  acl    = "public-read"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.b.id
  versioning_configuration {
    status = "Enabled"
    mfa_delete = "Enabled"
  }
  
 resource "aws_kms_key" "mykey" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket" "mybucket" {
  bucket = "mybucket"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.b.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.7f39f2ee-61c2-489a-89bf-586a890ee2b9.arn:aws:kms:us-east-1:487527143985:key/7f39f2ee-61c2-489a-89bf-586a890ee2b9
      sse_algorithm     = "aws:kms"
    }
  }
}
