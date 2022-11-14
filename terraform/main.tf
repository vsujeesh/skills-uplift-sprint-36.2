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
required_version = ">=0.14.9" 

   backend "s3" {
       bucket = "aws-terraform-practice-vsujeesh"
       # key    = "[Remote_State_S3_Bucket_Key]"
       region = "ap-southeast-1"
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
}
