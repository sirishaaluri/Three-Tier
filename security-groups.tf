# Web layer subnet - NSG - NSG Association
resource "azurerm_network_security_group" "web_nsg" {
  name                = "web-nsg-${var.name}"
  location            = var.location
  resource_group_name = local.resource_group_name
}

resource "azurerm_network_security_rule" "web_nsg_rules" {
  for_each = var.web_nsg_rules
  #  count = "${length(var.web_nsg_rules)}"

  name                        = each.value.name
  priority                    = each.value.priority
  direction                   = each.value.direction
  access                      = each.value.access
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = local.resource_group_name
  network_security_group_name = azurerm_network_security_group.web_nsg.name
}

resource "azurerm_subnet_network_security_group_association" "web_nsg_subnet" {
  subnet_id                 = azurerm_subnet.web_subnet.id
  network_security_group_id = azurerm_network_security_group.web_nsg.id
}


# App/Business layer subnet - NSG - NSG Association
resource "azurerm_network_security_group" "app_nsg" {
  name                = "app-nsg-${var.name}"
  location            = var.location
  resource_group_name = local.resource_group_name
}

resource "azurerm_network_security_rule" "app_nsg_rules" {
  for_each = var.app_nsg_rules

  name                        = each.value.name
  priority                    = each.value.priority
  direction                   = each.value.direction
  access                      = each.value.access
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = local.resource_group_name
  network_security_group_name = azurerm_network_security_group.app_nsg.name
}

resource "azurerm_subnet_network_security_group_association" "app_nsg_subnet" {
  subnet_id                 = azurerm_subnet.app_subnet.id
  network_security_group_id = azurerm_network_security_group.app_nsg.id
}


# DB layer subnet - NSG - NSG Association
resource "azurerm_network_security_group" "db_nsg" {
  name                = "db-nsg-${var.name}"
  location            = var.location
  resource_group_name = local.resource_group_name
}

resource "azurerm_network_security_rule" "db_nsg_rules" {
  for_each = var.db_nsg_rules

  name                        = each.value.name
  priority                    = each.value.priority
  direction                   = each.value.direction
  access                      = each.value.access
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = local.resource_group_name
  network_security_group_name = azurerm_network_security_group.db_nsg.name
}

resource "azurerm_subnet_network_security_group_association" "db_nsg_subnet" {
  subnet_id                 = azurerm_subnet.db_subnet.id
  network_security_group_id = azurerm_network_security_group.db_nsg.id
}
