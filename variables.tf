variable "name" {
    description = "Base name used to frame all resource names in the project"
    type = string
    default = "tc"
}

variable "location" {
    description = "Location for the resources to be provisioned"
    type = string
    default = "Australia East"
}

variable "create_resource_group" {
    description = "Do we need resource group to be created or already existed. Provide false if resource group already available."
    type = bool
    default = true
}


variable "resource_group_name" {
    description = "resource group name under which all resource will be provisioned"
    type = string
    default = ""
}

variable "vnet_cidr_range" {
    description = "CIDR range as input to vNet"
    type = string
    default = "192.168.0.0/16"
}

variable "websubnet_cidr_range" {
    description = "IP range of subnet for Web layer"
    type = string
    default = "192.168.1.0/24"
}

variable "appsubnet_cidr_range" {
    description = "IP range of subnet for Business/App layer"
    type = string
    default = "192.168.2.0/24"
}

variable "dbsubnet_cidr_range" {
    description = "IP range of subnet for DB layer"
    type = string
    default = "192.168.3.0/24"
}

variable "web_nsg_rules" {
    description = "Inbound and outbound rules for network security group applied to subnet created fro Web layer"
    type = map(object({
        name = string,
        priority = number,
        direction = string,
        access = string,
        protocol = string,
        source_address_prefix = string,
        source_port_range = string,
        destination_address_prefix = string,
        destination_port_range = string
    }))
    default = {
     "rule001" = {
        name                       = "ssh-rule-1"
        priority                   = 101
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_address_prefix      = "*"
        source_port_range          = "*"
        destination_address_prefix = "*"
        destination_port_range     = "22"
     },
     "rule002" = {
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
    }
}

variable "app_nsg_rules" {
    description = "Inbound and outbound rules for network security group applied to subnet created fro Web layer"
    type = map(object({
        name = string,
        priority = number,
        direction = string,
        access = string,
        protocol = string,
        source_address_prefix = string,
        source_port_range = string,
        destination_address_prefix = string,
        destination_port_range = string
    }))
    default = {
     "rule001" = {
        name = "ssh-rule-1"
        priority = 100
        direction = "Inbound"
        access = "Allow"
        protocol = "Tcp"
        source_address_prefix = "192.168.1.0/24"
        source_port_range = "*"
        destination_address_prefix = "*"
        destination_port_range = "22"
     },
     "rule002" = {
        name = "ssh-rule-2"
        priority = 101
        direction = "Outbound"
        access = "Allow"
        protocol = "Tcp"
        source_address_prefix = "192.168.1.0/24"
        source_port_range = "*"
        destination_address_prefix = "*"
        destination_port_range = "22"
     }
    }
}

variable "db_nsg_rules" {
    description = "Inbound and outbound rules for network security group applied to subnet created fro Web layer"
    type = map(object({
        name = string,
        priority = number,
        direction = string,
        access = string,
        protocol = string,
        source_address_prefix = string,
        source_port_range = string,
        destination_address_prefix = string,
        destination_port_range = string
    }))
    default = {
     "rule001" = {
        name = "ssh-rule-1"
        priority = 101
        direction = "Inbound"
        access = "Allow"
        protocol = "Tcp"
        source_address_prefix = "192.168.2.0/24"
        source_port_range = "*"
        destination_address_prefix = "*"
        destination_port_range = "3306"
     },
     "rule002" = {
        name = "ssh-rule-2"
        priority = 102
        direction = "Outbound"
        access = "Allow"
        protocol = "Tcp"
        source_address_prefix = "192.168.2.0/24"
        source_port_range = "*"
        destination_address_prefix = "*"
        destination_port_range = "3306"
     },
     "rule002" = {
        name = "ssh-rule-3"
        priority = 100
        direction = "Outbound"
        access = "Deny"
        protocol = "Tcp"
        source_address_prefix = "192.168.1.0/24"
        source_port_range = "*"
        destination_address_prefix = "*"
        destination_port_range = "3306"
     }
    }
}

variable "tags" {
    description = "Tags for segregation"
    type = map(any)
    default = {}
}

variable "vm_list" {
    description = "List of VMs"
    type = map(object({
        name = string
        private_ip_allocation = string
        private_ip_address = string
    }))
    default = {
        "one" = {
            name = "vm001"
            private_ip_allocation = "Dynamic"
            private_ip_address = ""
        },
        "two" = {
            name = "vm002"
            private_ip_allocation = "Dynamic"
            private_ip_address = ""
        },
        "three" = {
            name = "vm003"
            private_ip_allocation = "Dynamic"
            private_ip_address = ""
        }
    }
}
