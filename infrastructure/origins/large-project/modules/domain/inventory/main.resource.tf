# This is the Interconnection layer of this domain.
# Its sole purpose is to connect modules and resources at the domain level.

module "dependencies" {
  source = "../../stack/node-lambda/dependencies"
}

module "dependents" {
  source    = "../../stack/node-lambda/dependents"
  functions = local.functions
}
