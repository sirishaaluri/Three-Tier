<!--  BEGIN_TF_DOCS -->
<!--
   ** This is an auto generated documentation using terraform docs
-->

# Three Tier Architecture

## Instructions
Implementation of three tier architecture with physical separation of of three sub-nets with in a virtual network.
Would preper to provision Database in a Back-end layer and couple of VMs can be bounded to a Load balancer in app\_layer or Business\_layer. Third portion of the sub-net could be used for hosting front end web applications for customer facing.

## Pre-Requesites
1. Terraform to be available in the machine running code (preffered latest version - 1.0.11)
2. An azure account to provision resources

## Implemented Parts of the Three tier architecture
- Structured with a virtual network of defined CIDR range.
- Three individual sub partitions of Subnets for Web, App and DB layer.
- Each sub net associated with an NSG through specified inboud and outbound rules.
- App\_sub net had three VM creates with default values and naming conventions.
- Created a SQL-Server and SQL-db for back-end purpose.
- Can be extended further with load balancers at App layer and private end point to SQL Server.
- All inputs were framed as default values, which can be overridden through autovars file.
- VM inputs were takes static in the interest of time, hence all three VMs will be created with same configuration.
- Do not have any Limit on the Number of VMs can be created, is based on number of inputs values we pass for vm\_list.
- All validation been taken care - eg:- resource group can be created OR can take the existed value, based on inputs provided.

## Execution Flow
- Download the code to a local folder
- Use command promt or any terminal
- Navigate to the folder of code
- Make "az login" success before running terraform code.
- Initialize all the modules reffered in code through "terraform init"
- terraform plan
- terraform apply

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.88.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_virtual_machine"></a> [virtual\_machine](#module\_virtual\_machine) | ./modules/vm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_nsg_rules"></a> [app\_nsg\_rules](#input\_app\_nsg\_rules) | Inbound and outbound rules for network security group applied to subnet created fro Web layer | <pre>map(object({<br>        name = string,<br>        priority = number,<br>        direction = string,<br>        access = string,<br>        protocol = string,<br>        source_address_prefix = string,<br>        source_port_range = string,<br>        destination_address_prefix = string,<br>        destination_port_range = string<br>    }))</pre> | <pre>{<br>  "rule001": {<br>    "access": "Allow",<br>    "destination_address_prefix": "*",<br>    "destination_port_range": "22",<br>    "direction": "Inbound",<br>    "name": "ssh-rule-1",<br>    "priority": 100,<br>    "protocol": "Tcp",<br>    "source_address_prefix": "192.168.1.0/24",<br>    "source_port_range": "*"<br>  },<br>  "rule002": {<br>    "access": "Allow",<br>    "destination_address_prefix": "*",<br>    "destination_port_range": "22",<br>    "direction": "Outbound",<br>    "name": "ssh-rule-2",<br>    "priority": 101,<br>    "protocol": "Tcp",<br>    "source_address_prefix": "192.168.1.0/24",<br>    "source_port_range": "*"<br>  }<br>}</pre> | no |
| <a name="input_appsubnet_cidr_range"></a> [appsubnet\_cidr\_range](#input\_appsubnet\_cidr\_range) | IP range of subnet for Business/App layer | `string` | `"192.168.2.0/24"` | no |
| <a name="input_create_resource_group"></a> [create\_resource\_group](#input\_create\_resource\_group) | Do we need resource group to be created or already existed. Provide false if resource group already available. | `bool` | `true` | no |
| <a name="input_db_nsg_rules"></a> [db\_nsg\_rules](#input\_db\_nsg\_rules) | Inbound and outbound rules for network security group applied to subnet created fro Web layer | <pre>map(object({<br>        name = string,<br>        priority = number,<br>        direction = string,<br>        access = string,<br>        protocol = string,<br>        source_address_prefix = string,<br>        source_port_range = string,<br>        destination_address_prefix = string,<br>        destination_port_range = string<br>    }))</pre> | <pre>{<br>  "rule001": {<br>    "access": "Allow",<br>    "destination_address_prefix": "*",<br>    "destination_port_range": "3306",<br>    "direction": "Inbound",<br>    "name": "ssh-rule-1",<br>    "priority": 101,<br>    "protocol": "Tcp",<br>    "source_address_prefix": "192.168.2.0/24",<br>    "source_port_range": "*"<br>  },<br>  "rule002": {<br>    "access": "Deny",<br>    "destination_address_prefix": "*",<br>    "destination_port_range": "3306",<br>    "direction": "Outbound",<br>    "name": "ssh-rule-3",<br>    "priority": 100,<br>    "protocol": "Tcp",<br>    "source_address_prefix": "192.168.1.0/24",<br>    "source_port_range": "*"<br>  }<br>}</pre> | no |
| <a name="input_dbsubnet_cidr_range"></a> [dbsubnet\_cidr\_range](#input\_dbsubnet\_cidr\_range) | IP range of subnet for DB layer | `string` | `"192.168.3.0/24"` | no |
| <a name="input_location"></a> [location](#input\_location) | Location for the resources to be provisioned | `string` | `"Australia East"` | no |
| <a name="input_name"></a> [name](#input\_name) | Base name used to frame all resource names in the project | `string` | `"tc"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | resource group name under which all resource will be provisioned | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for segregation | `map(any)` | `{}` | no |
| <a name="input_vm_list"></a> [vm\_list](#input\_vm\_list) | List of VMs | <pre>map(object({<br>        name = string<br>        private_ip_allocation = string<br>        private_ip_address = string<br>    }))</pre> | <pre>{<br>  "one": {<br>    "name": "vm001",<br>    "private_ip_address": "",<br>    "private_ip_allocation": "Dynamic"<br>  },<br>  "three": {<br>    "name": "vm003",<br>    "private_ip_address": "",<br>    "private_ip_allocation": "Dynamic"<br>  },<br>  "two": {<br>    "name": "vm002",<br>    "private_ip_address": "",<br>    "private_ip_allocation": "Dynamic"<br>  }<br>}</pre> | no |
| <a name="input_vnet_cidr_range"></a> [vnet\_cidr\_range](#input\_vnet\_cidr\_range) | CIDR range as input to vNet | `string` | `"192.168.0.0/16"` | no |
| <a name="input_web_nsg_rules"></a> [web\_nsg\_rules](#input\_web\_nsg\_rules) | Inbound and outbound rules for network security group applied to subnet created fro Web layer | <pre>map(object({<br>        name = string,<br>        priority = number,<br>        direction = string,<br>        access = string,<br>        protocol = string,<br>        source_address_prefix = string,<br>        source_port_range = string,<br>        destination_address_prefix = string,<br>        destination_port_range = string<br>    }))</pre> | <pre>{<br>  "rule001": {<br>    "access": "Allow",<br>    "destination_address_prefix": "*",<br>    "destination_port_range": "22",<br>    "direction": "Inbound",<br>    "name": "ssh-rule-1",<br>    "priority": 101,<br>    "protocol": "Tcp",<br>    "source_address_prefix": "*",<br>    "source_port_range": "*"<br>  },<br>  "rule002": {<br>    "access": "Deny",<br>    "destination_address_prefix": "*",<br>    "destination_port_range": "22",<br>    "direction": "Inbound",<br>    "name": "ssh-rule-2",<br>    "priority": 100,<br>    "protocol": "Tcp",<br>    "source_address_prefix": "192.168.3.0/24",<br>    "source_port_range": "*"<br>  }<br>}</pre> | no |
| <a name="input_websubnet_cidr_range"></a> [websubnet\_cidr\_range](#input\_websubnet\_cidr\_range) | IP range of subnet for Web layer | `string` | `"192.168.1.0/24"` | no |

## Outputs

No outputs.

## About the Usage of autovars

Execution Apply success outcome reference.

Resources provisioned post Terraform Apply.

Terraform Auto Documentation Generation process.
![document generated](./docs/terraform\_auto\_documentation.png)
<!--  END_IF_DOCS -->