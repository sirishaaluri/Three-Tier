name                 = "TC"
location             = "Australia East"
vnet_cidr_range      = "192.168.0.0/16"
websubnet_cidr_range = "192.168.1.0/24"
appsubnet_cidr_range = "192.168.2.0/24"
dbsubnet_cidr_range  = "192.168.3.0/24"

############ Yet to use
web_host_name             = "webserver"
web_username              = "web_user"
web_os_password           = "@Webuser1"
app_host_name             = "appserver"
app_username              = "app_user"
app_os_password           = "@Appuser1"
primary_database          = "sql-primary-database"
primary_database_admin    = "sqladmin"
primary_database_password = "pa$$w0rd"
primary_database_version  = "12.0"

security_rule {
  name                       = "ssh-rule-1"
  priority                   = 101
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_address_prefix      = "*"
  source_port_range          = "*"
  destination_address_prefix = "*"
  destination_port_range     = "22"
}

security_rule {
  name                       = "ssh-rule-2"
  priority                   = 100
  direction                  = "Inbound"
  access                     = "Deny"
  protocol                   = "Tcp"
  source_address_prefix      = "192.168.3.0/24"
  source_port_range          = "*"
  destination_address_prefix = "*"
  destination_port_range     = "22"
}
