data "aws_region" "current" {}

locals {
  input-dir = "../../../application/lambdas/${var.name}"
  output-package = ".out/${var.name}.zip"
  tpl-vars = {
    region = data.aws_region.current.name
    lambda_arn = module.resource.arn
  }
}

data "archive_file" "package" {
  type = "zip"
  source_dir = local.input-dir
  output_path = local.output-package
}

module "resource" {
  source = "../../global/aws_lambda"

  name = var.name
  package-location = data.archive_file.package.output_path

  execution-role = var.execution-role
  handler = "index.handler"
  runtime = "nodejs10.x"

  layers = var.layers
  environment = var.environment
}
