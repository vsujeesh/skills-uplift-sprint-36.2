terraform {

// backend ensures that the state is stored, so terraform doesn't try to create something that alr exists
  backend "s3" {
    bucket = "vsujeesh-terraform-state-storage"
    key    = "terraform.tfstate"
    region = "ap-southeast-1"

  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.27"
    }
  }


}



provider "aws" {
  region  = "ap-southeast-1"
  version = "~>3.0"
}



resource "aws_s3_bucket" "s3" {
  bucket = "aws-terraform-practice-vsujeesh"
  acl    = "public-read"
  policy = file("policy.json")

  website {
    index_document = "index.html"


  }
}

resource "aws_s3_bucket_object" "object" {
  bucket = "aws-terraform-practice-vsujeesh"
  key    = "index.html"
  source = "src/index.html"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = filemd5("src/index.html")
}