variable "region" {
    type = string
    default = "ap-northeast-2"
}
variable "profile" {
    type = string
    default = "costnorm"
}
variable "prefix" {
    type = string
    default = "costnorm"
}
variable "lambda_timeout" {
  type = number
  default = 120
}
variable "lambda_memory" {
  type = number
  default = 1024
}
variable "lambda_runtime" {
  type = string
  default = "python3.13"
}
variable "lambda_handler" {
  type = string
  default = "lambda_function.lambda_handler"
}
variable "lambda_architecture" {
  type = string
  default = "x86_64"
}
variable "environment" {
  type = map(string)
  default = {
    "dev" = "dev"
    "prod" = "prod"
  }
}
variable "attach_ec2_policy" {
  type = bool
  default = false
}
variable "attach_s3_policy" {
  type = bool
  default = false
}
variable "attach_pricing_policy" {
  type = bool
  default = false
}
variable "attach_cloudwatch_policy" {
  type = bool
  default = false
}
variable "attach_iam_policy" {
  type = bool
  default = false
}
variable "attach_cloudfront_policy" {
  type = bool
  default = false
}
variable "attach_vpc_policy" {
  type = bool
  default = false
}
variable "attach_rds_policy" {
  type = bool
  default = false
}
variable "attach_lambda_policy" {
  type = bool
  default = false
}
variable "attach_ssm_policy" {
  type = bool
  default = false
}