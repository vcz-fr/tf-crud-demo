# This is the Interconnection layer.
# Its sole purpose is to connect modules and resources at the project level.

# This main file belongs to the moduled *origin*.
# An *origin* is a way to describe a root module when your project does not
# have one but multiple connecting to the same underlying modules and resources.

# This origin will take the project assumptions further by considering the
# core of the project is the software. Following this, some of the support
# modules are dependencies like a database while some others are dependent of
# the software stack like the API.

module "dependencies" {
    source = "./dependencies"
}

module "dependents" {
    source = "./dependents"
    functions = local.functions
}
