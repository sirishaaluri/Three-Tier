variable "name" {
    description = "Base name used to frame all resource names in the project"
    type = string
}

variable "location" {
    description = "Location for the resources to be provisioned"
    type = string
    default = "Australia East"
}

variable "resource_group_name" {
    description = "resource group name under which all resource will be provisioned"
    type = string
}

variable "tags" {
    description = "Tags for segregation"
    type = map(any)
    default = {}
}

variable "private_ip_allocation" {
    description = "Private IP allocation type Static / Dynamic"
    type = string
    default = "Dynamic"
}

variable "subnet_id" {
    description = "Subnet Id from which NIC IP to be allocated"
    type = string
}

variable "private_ip_address" {
    description = "Private IP address if the allocation type is Static"
    type = string
}
