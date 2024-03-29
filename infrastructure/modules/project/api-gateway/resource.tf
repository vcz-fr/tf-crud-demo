locals {
  spec-location = "../../../api/${var.domain}.json"
  tpl-vars = merge(
    # Generates "${lbd-}" variables for use in the API specification template
    { for lambda in var.lambdas : "lbd-${lambda.name}" => lambda.api-integration },
    # CORS requests handling
    { glob-preflight = file("${path.module}/templates/swagger-options.tpl") }
  )
}

module "resource" {
  source = "../../global/aws_api-gateway"

  name          = var.domain
  specification = templatefile(local.spec-location, local.tpl-vars)
  lambdas       = var.lambdas[*].name
}
