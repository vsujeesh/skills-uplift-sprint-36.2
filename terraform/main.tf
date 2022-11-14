terraform {

  required_version = ">=0.14.9"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version = "~>3.27"
    }
  }


}

provider "aws" {
  region  = "ap-southeast-1"
  version = "~>3.0"
}

resource "aws_s3_bucket" "s3Bucket" {
     bucket = "aws-terraform-practice-vsujeesh"
     acl       = "public-read"

     policy  = <<EOF
{
   "statement" : [
      {
         "action" : [
             "s3:GetObject"
          ],
         "effect" : "Allow",
         "resource" : "arn:aws:s3:::aws-terraform-practice-vsujeesh/*",
         "principal" : "*"
      }
    ]
  }
EOF

   website {
       index_document = "index.html"
   }
}
