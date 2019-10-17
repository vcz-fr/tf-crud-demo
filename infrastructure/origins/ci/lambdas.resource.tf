# You would describe your collection of Functions in this file
# In our current setting, we only have one

module "fun-employee" {
  source = "../../modules/project/function"

  # INFO::[Convention] Packages and publishes the directory
  # /application/lambdas/employee
  name           = "employee"
  execution-role = module.glb-role.arn

  # INFO::[Limit] Max 5 layers
  layers = [
    module.dep-crud.arn
  ]

  environment = {
    TABLE_NAME = module.ddb.table-name
  }
}
