output "sql_server_id" {
  description = "SQl Server resource ID"
  value       = "azurerm_sql_server.this.id"
}

output "sql_database_name" {
  description = "SQl Database name"
  value       = "azurerm_sql_database.this.name"
}