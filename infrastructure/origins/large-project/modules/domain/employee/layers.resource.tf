# You would describe your collection of Function dependencies in this file
# In our current setting, we only have one

module "dep-crud" {
  source = "../../../../../modules/project/function_dependency"

  # INFO::[Convention] Packages and publishes the directory
  # /application/layers/crud
  name = "crud"
}
