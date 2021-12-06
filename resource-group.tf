resource "azurerm_resource_group" "this" {
  count = var.create_resource_group ? 1 : 0

  name     = length(var.resource_group_name) > 0 ? var.resource_group_name : "rg-${var.name}"
  location = var.location
}
