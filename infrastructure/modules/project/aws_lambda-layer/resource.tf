locals {
  dir_path       = "../../../application/layers/${var.name}"
  output_package = ".out/${var.name}.zip"
}

# Generate the archive
data "archive_file" "package" {
  type = "zip"

  source_dir  = local.dir_path
  output_path = local.output_package
}

module "resource" {
  source = "../../global/aws_lambda-layer"

  name                = var.name
  package             = data.archive_file.package.output_path
  compatible_runtimes = ["nodejs10.x"]
}
