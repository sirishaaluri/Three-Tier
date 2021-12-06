resource "azurerm_network_interface" "this" {
  name                = "${var.name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags = var.tags

  dynamic "ip_configuration" {
    for_each = var.private_ip_allocation == "Dynamic" ? [1] : []

    content {
        name                          = "${var.name}-nic-ip"
        subnet_id                     = var.subnet_id #azurerm_subnet.example.id
        private_ip_address_allocation = "Dynamic"
    }
  }

  dynamic "ip_configuration" {
    for_each = var.private_ip_allocation == "Static" ? [1] : []

    content {
        name                          = "${var.name}-nic-ip"
        subnet_id                     = var.subnet_id #azurerm_subnet.example.id
        private_ip_address_allocation = "Static"
        private_ip_address            = var.private_ip_address  
    }
  }

}

resource "azurerm_virtual_machine" "this" {
  name                  = var.name
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.this.id]
  vm_size               = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name                = "${var.name}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = var.tags
}