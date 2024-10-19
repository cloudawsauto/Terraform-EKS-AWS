provider "aws" {
  region = "us-east-1"
}
resource "aws_s3_bucket" "dev-infra-s3" {
   bucket = "dev-infra-s3" 
}