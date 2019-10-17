output "table-name" {
  value       = aws_dynamodb_table.table.id
  description = "DynamoDB table name"
}
