resource "azurerm_virtual_network" "this" {
  name                = "vnet-${var.name}"
  resource_group_name = local.resource_group_name
  location            = var.location
  address_space       = [var.vnet_cidr_range]
}

resource "azurerm_subnet" "web_subnet" {
  name                 = "web-subnet-${var.name}"
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [var.websubnet_cidr_range]
}

resource "azurerm_subnet" "app_subnet" {
  name                 = "app-subnet-${var.name}"
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [var.appsubnet_cidr_range]
}

resource "azurerm_subnet" "db_subnet" {
  name                 = "db-subnet-${var.name}"
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [var.dbsubnet_cidr_range]
}
