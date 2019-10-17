# This is the Interconnection layer.
# Its sole purpose is to connect modules and resources at the project level.

# This main file belongs to the large-project *origin*.
# An *origin* is a way to describe a root module when your project does not
# have one but multiple connecting to the same underlying modules and resources.

# This origin will take the project assumptions further again by taking the
# deployment steps and the isolation of the software stack of the moduled
# origin and applies it to multiple business domains, represented as modules.

# As such, this file can serve multiple purposes:
# - Creating and linking inter-domain resources;
# - Indexing the different domains managed by this specific application;
# - Opening up global configuration oppurtunities.

module "employee" {
  source = "./modules/domain/employee"
}

module "inventory" {
  source = "./modules/domain/inventory"
}
