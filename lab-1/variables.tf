variable "aws_region" {
  type    = string
  default = "ap-south-1"
}
 
variable "environment" {
  type = string
}
 
variable "bucket_prefix" {
  type    = string
  default = testing
}