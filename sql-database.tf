resource "azurerm_sql_server" "this" {
  name                         = "sql-server-${var.name}"
  resource_group_name          = local.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"          # in the interest of time not holding and retreving this from Key vault
  administrator_login_password = "4-v3ry-53cr37-p455w0rd" # in the interest of time not holding and retreving this from Key vault

  tags = var.tags
}

resource "azurerm_sql_database" "this" {
  name                = "sql-database-${var.name}"
  resource_group_name = local.resource_group_name
  location            = var.location
  server_name         = azurerm_sql_server.this.name

  tags = var.tags
}

/* resource "azurerm_sql_virtual_network_rule" "sqlvnetrule" {
  name           = "sql-server-nwrules-${var.name}"
  resource_group_name = local.resource_group_name
  server_name         = azurerm_sql_server.this.name
  subnet_id           = azurerm_subnet.db_subnet.id

  depends_on = [azurerm_subnet_network_security_group_association.db_nsg_subnet]
} */