output "virtual_machine_id" {
    description = "ID of the virtual machine created"
    value = azurerm_virtual_machine.this.id
}