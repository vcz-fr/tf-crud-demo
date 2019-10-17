resource "aws_iam_role" "role" {
  name               = var.name
  assume_role_policy = var.role_assumption
}

# Attach policies to the newly created role
resource "aws_iam_role_policy_attachment" "policy-attachment" {
  count = length(var.policies)
  role  = aws_iam_role.role.name

  policy_arn = var.policies[count.index]
}
