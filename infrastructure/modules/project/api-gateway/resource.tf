locals {
  spec-location = "../../../api/${var.domain}.json"
  tpl-vars = merge(
    { for lambda in var.lambdas : "lbd-${lambda.name}" => lambda.api-integration },
    { glob-preflight = file("${path.module}/templates/swagger-options.tpl") }
  )
}

module "resource" {
  source = "../../global/aws_api-gateway"

  name          = var.domain
  specification = templatefile(local.spec-location, local.tpl-vars)
  lambdas       = var.lambdas[*].name
}
