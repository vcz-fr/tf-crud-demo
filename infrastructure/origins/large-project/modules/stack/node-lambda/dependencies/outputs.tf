output "db-table-name" {
  value       = module.db.table-name
  description = "NoSQL table name"
}

output "role-id" {
  value       = module.glb-role.arn
  description = "Function execution role resource ID"
}
