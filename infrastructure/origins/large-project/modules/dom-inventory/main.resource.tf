# This is the Interconnection layer of this domain.
# Its sole purpose is to connect modules and resources at the domain level.

module "dependencies" {
    source = "../soft-dependencies"
}

module "dependents" {
    source = "../soft-dependents"
    functions = local.functions
}
