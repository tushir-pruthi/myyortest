terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
### Temporary Credentials, uploaded on git, making sure that its expired already.
provider "aws" {
  region = "us-east-1"
  access_key = "Key ID"
  secret_key = "Secret Key"
}
resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket-tushir-panw"

  tags = {
    owner     = "tpruthi"
    customer  = "MMS"
    yor_name  = "example"
    yor_trace = "492ae1ff-a6f3-41eb-8b6f-241782ff2bab"
  }
}


resource "aws_s3_bucket_versioning" "example" {
  bucket = aws_s3_bucket.example.id

  versioning_configuration {
    status = "Enabled"
  }
}