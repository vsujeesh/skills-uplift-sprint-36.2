terraform {

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>3.27"
    }
  }


}

provider "aws" {
  region  = "ap-southeast-1"
  version = "~>3.0"
}

resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.example.bucket

  index_document {
    suffix = "index.html"
  }

}
