# The following resources will be provisioned after the software is provisioned

module "api" {
  source = "../../../modules/project/api-gateway"

  # INFO::[Convention] Uses the OpenAPI 3.0 API template located in
  # /api/employee.json
  domain = "employee"

  # INFO::[Convention] This defines both the Invoke authorizations between
  # AWS API Gateway and AWS Lambda and the variables that will be passed to the
  # template engine. These variables will be named "lbd-" followed by the name
  # of the Lambda function
  lambdas = var.functions
}
