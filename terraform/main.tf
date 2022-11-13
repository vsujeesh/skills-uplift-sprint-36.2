terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      Version = "~>3.27"
    }
  }

  required_version = ">=0.14.9"
#   backend "s3" {
#        bucket = "aws-terraform-practice-vsujeesh"
#        key    = "[Remote_State_S3_Bucket_Key]"
#        region = "ap-southeast-1"
#    }

}

provider "aws" {
  version = "~>3.0"
  region  = "ap-southeast-1"
}

resource "aws_s3_bucket" "s3Bucket" {
     bucket = "aws-terraform-practice-vsujeesh"
     acl       = "public-read"

     policy  = <<EOF
{
     "id" : "MakePublic",
   "version" : "2012-10-17",
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
