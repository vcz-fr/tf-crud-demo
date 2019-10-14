module "glb-role" {
  source = "../../modules/global/aws_role"

  role_assumption = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF

  name = "Demo-FaaSPawn-LambdaExecution"
  policies = [
    "arn:aws:iam::aws:policy/service-role/AWSLambdaDynamoDBExecutionRole",
    "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
  ]
}

module "ddb" {
  source = "../../modules/global/aws_dynamodb"

  name = "users"
  hash-key = "cid"
  
  attributes = [{
    name = "cid"
    type = "S"
  }]
}

module "lay-crud" {
  source = "../../modules/project/aws_lambda-layer"

  name = "crud"
}

module "lbd-employee" {
  source = "../../modules/project/aws_lambda"

  name = "employee"
  execution-role = module.glb-role.arn

  layers = [
    module.lay-crud.arn
  ]

  environment = {
    TABLE_NAME = module.ddb.table-name
  }
}

module "api" {
  source = "../../modules/global/aws_api-gateway"

  name = "CRUD"
  lambdas = [module.lbd-employee]
}

module "api-employee" {
  source = "../../modules/global/aws_api-gateway-resource"

  methods = {
    GET = module.lbd-employee
    POST = module.lbd-employee
    PUT = module.lbd-employee
    DELETE = module.lbd-employee
  }

  parent-resource = module.api.root-resource
  api-id = module.api.id
  path-fragment = "employee"
}
