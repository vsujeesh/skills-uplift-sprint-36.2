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

  {
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::1234567890:root"
      },
      "Action": "s3:ListBucket",
      "Resource": "arn:aws:s3:::yourdomain-terraform"
    },
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::1234567890:root"
      },
      "Action": ["s3:GetObject", "s3:PutObject"],
      "Resource": "arn:aws:s3:::yourdomain-terraform/*"
    }
  ]
}
}
