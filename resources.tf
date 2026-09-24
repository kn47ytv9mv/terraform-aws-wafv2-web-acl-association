resource "aws_wafv2_web_acl_association" "resource" {
  resource_arn = var.resource_arn
  web_acl_arn  = var.web_acl_arn
}

output "id" {
  description = "The ID of the association."
  value       = aws_wafv2_web_acl_association.resource.id
}
