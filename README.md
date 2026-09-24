# terraform-aws-wafv2-web-acl-association

Terraform module associating a WAFv2 web ACL with a regional resource
— an ALB, API Gateway stage, AppSync GraphQL API, or Cognito user
pool.

## Cost

This association carries no charge of its own — WAF's per-ACL,
per-rule, and per-request charges originate on
[`terraform-aws-wafv2-web-acl`](https://github.com/kn47ytv9mv/terraform-aws-wafv2-web-acl)
itself, not here.

## Design

Only needed for a `"REGIONAL"`-scope ACL. A `"CLOUDFRONT"`-scope ACL
needs no separate association — pass its `arn` output straight to
[`terraform-aws-cloudfront`](https://github.com/kn47ytv9mv/terraform-aws-cloudfront)'s
`web_acl_id`, since CloudFront takes the ACL directly on the
distribution itself.

## Usage

```hcl
module "web_acl_association" {
  source = "kn47ytv9mv/wafv2-web-acl-association/aws"

  resource_arn = module.alb.arn
  web_acl_arn  = module.web_acl.arn
}
```

Or directly from this repository:

```hcl
module "web_acl_association" {
  source = "github.com/kn47ytv9mv/terraform-aws-wafv2-web-acl-association"

  resource_arn = module.alb.arn
  web_acl_arn  = module.web_acl.arn
}
```

## Requirements

| Name | Version |
|---|---|
| terraform | >= 1.0 |
| aws | ~> 6.61 |

## Providers

| Name | Version |
|---|---|
| aws | ~> 6.61 |

## Inputs

| Name | Description | Default | Required |
|---|---|---|---|
| resource_arn | The ARN of the regional resource to associate — an ALB, API Gateway stage, AppSync GraphQL API, or Cognito user pool. | `null` | no |
| web_acl_arn | The ARN of the web ACL to associate, from terraform-aws-wafv2-web-acl's arn output. | `null` | no |

## Outputs

| Name | Description |
|---|---|
| id | The ID of the association. |

## License

MIT — see [LICENSE.md](LICENSE.md).
