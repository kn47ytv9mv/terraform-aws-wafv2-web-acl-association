variable "resource_arn" {
  default     = null
  description = "The ARN of the regional resource to associate — an ALB, API Gateway stage, AppSync GraphQL API, or Cognito user pool."
}

variable "web_acl_arn" {
  default     = null
  description = "The ARN of the web ACL to associate, from terraform-aws-wafv2-web-acl's arn output."
}
