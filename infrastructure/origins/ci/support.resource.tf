# This is the Interconnection layer.
# Its sole purpose is to connect modules and resources at the project level.

# This main file belongs to the CI *origin*.
# An *origin* is a way to describe a root module when your project does not
# have one but multiple connecting to the same underlying modules and resources.

# This file contains the support resources behind the Functions and their
# dependencies: roles, databases, API proxies, etc.

module "glb-role" {
  source = "../../modules/project/role_function"

  name = "Demo-FaaSPawn-LambdaExecution"

  # INFO::[Magic Strings] These policies are managed by AWS
  policies = [
    # In an actual CI/CD setting, you would put restrictive policies, here
    "arn:aws:iam::aws:policy/service-role/AWSLambdaDynamoDBExecutionRole",
    "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
  ]
}

module "ddb" {
  source = "../../modules/project/database_nosql"

  name = "users"
  pk   = "uid"

  # INFO::[Behaviour] The PK must be an attribute
  attributes = [{
    name = "uid"
    type = "S"
  }]
}

module "api" {
  source = "../../modules/project/api-gateway"

  # INFO::[Convention] Uses the OpenAPI 3.0 API template located in
  # /api/employee.json
  domain = "employee"

  # INFO::[Convention] This defines both the Invoke authorizations between
  # AWS API Gateway and AWS Lambda and the variables that will be passed to the
  # template engine. These variables will be named "lbd-" followed by the name
  # of the Lambda function
  lambdas = [module.lbd-employee]
}
