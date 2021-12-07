module "virtual_machine" {
  for_each = var.vm_list

  source = "./modules/vm"

  name                = "vm-${each.value.name}"
  resource_group_name = local.resource_group_name
  subnet_id           = azurerm_subnet.app_subnet.id

  location              = var.location
  private_ip_allocation = each.value.private_ip_allocation
  private_ip_address    = each.value.private_ip_address

  tags = var.tags

  depends_on = [azurerm_subnet_network_security_group_association.app_nsg_subnet]
}