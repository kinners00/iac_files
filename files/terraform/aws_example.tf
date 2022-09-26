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
  acl    = "public-read"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

#resource "aws_s3_bucket_acl" "example" {
#  bucket = aws_s3_bucket.b.id
#  acl    = "private"
#}
