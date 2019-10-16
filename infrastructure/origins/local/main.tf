# This is the Interconnection layer.
# Its sole purpose is to connect modules and resources at the project level.

# This main file belongs to the local *origin*.
# An *origin* is a way to describe a root module when your project does not have one but multiple connecting to the same underlying modules and resources.

module "glb-role" {
  source = "../../modules/project/role_function"

  name = "Demo-FaaSPawn-LambdaExecution"

  # INFO::[Magic Strings] These policies are managed by AWS
  policies = [
    "arn:aws:iam::aws:policy/service-role/AWSLambdaDynamoDBExecutionRole",
    "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
  ]
}

module "ddb" {
  source = "../../modules/project/database_nosql"

  name = "users"
  pk = "uid"

  # INFO::[Behaviour] The PK must be an attribute
  attributes = [{
    name = "uid"
    type = "S"
  }]
}

module "lay-crud" {
  source = "../../modules/project/function_dependency"

  # INFO::[Convention] Packages and publishes the directory /application/layers/crud
  name = "crud"
}

module "lbd-employee" {
  source = "../../modules/project/function"

  # INFO::[Convention] Packages and publishes the directory /application/lambdas/employee
  name = "employee"
  execution-role = module.glb-role.arn

  # INFO::[Limit] Max 5 layers
  layers = [
    module.lay-crud.arn
  ]

  environment = {
    TABLE_NAME = module.ddb.table-name
  }
}

module "api" {
  source = "../../modules/project/api-gateway"

  # INFO::[Convention] Uses the OpenAPI 3.0 API template located in /api/employee.json
  domain = "employee"

  # INFO::[Convention] This defines both the Invoke authorizations between AWS API Gateway and AWS Lambda and the variables that will be passed to the template engine. These variables will be named "lbd-" followed by the name of the Lambda
  lambdas = [module.lbd-employee]
}
