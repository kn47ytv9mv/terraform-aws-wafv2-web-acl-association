mock_provider "aws" {
}

run "arns_pass_through" {
  command = plan

  variables {
    resource_arn = "arn:aws:elasticloadbalancing:us-east-1:123456789012:loadbalancer/app/example/50dc6c495c0c9188"
    web_acl_arn  = "arn:aws:wafv2:us-east-1:123456789012:regional/webacl/example-acl/abcd1234-ab12-cd34-ef56-abcdef123456"
  }

  assert {
    condition     = aws_wafv2_web_acl_association.resource.resource_arn == "arn:aws:elasticloadbalancing:us-east-1:123456789012:loadbalancer/app/example/50dc6c495c0c9188"
    error_message = "resource_arn should pass through unchanged."
  }

  assert {
    condition     = aws_wafv2_web_acl_association.resource.web_acl_arn == "arn:aws:wafv2:us-east-1:123456789012:regional/webacl/example-acl/abcd1234-ab12-cd34-ef56-abcdef123456"
    error_message = "web_acl_arn should pass through unchanged."
  }
}

run "readme_default_example" {
  command = plan

  variables {
    resource_arn = "arn:aws:elasticloadbalancing:us-east-1:123456789012:loadbalancer/app/example/50dc6c495c0c9188"
    web_acl_arn  = "arn:aws:wafv2:us-east-1:123456789012:regional/webacl/example-acl/abcd1234-ab12-cd34-ef56-abcdef123456"
  }
}
