variable "region" {
  description = "region"
  type        = string
  default = "us-east-1"
}

variable "ami_id" {
  description = "ami_id"
  type = string
  default = "ami-0261755bbcb8c4a84"
  }

variable "instance_type" {
  type = string
  default = "t2.micro"
}
variable "stg_cidr" {
  type = string
  default = "10.0.0.0/16"
}
variable "bucket_name" {
  default = "stg-infra-s3"
  
}