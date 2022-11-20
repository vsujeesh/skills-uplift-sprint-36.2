terraform {

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

  website {
    index_document = "index.html"

    routing_rules = <<EOF
[{
    "Condition": {
        "KeyPrefixEquals": "docs/"
    },
    
    "Redirect": {
        "ReplaceKeyPrefixWith": "documents/"
    }
}]
EOF
  }
  policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "PublicReadForGetBucketObjects",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::aws-terraform-practice-vsujeesh/*"
    }
  ]
}
EOF

}
