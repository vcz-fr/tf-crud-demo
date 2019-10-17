# The following resources will be provisioned before the software is provisioned

module "glb-role" {
  source = "../../../modules/project/role_function"

  name = "Demo-FaaSPawn-LambdaExecution"

  # INFO::[Magic Strings] These policies are managed by AWS
  policies = [
    # In an actual CI/CD setting, you would put restrictive policies, here
    "arn:aws:iam::aws:policy/service-role/AWSLambdaDynamoDBExecutionRole",
    "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
  ]
}

module "db" {
  source = "../../../modules/project/database_nosql"

  name = "users"
  pk   = "uid"

  # INFO::[Behaviour] The PK must be an attribute
  attributes = [{
    name = "uid"
    type = "S"
  }]
}
