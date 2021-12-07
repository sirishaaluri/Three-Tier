# Three Tier Architecture

## Instructions
Implementation of three tier architecture with physical separation of of three sub-nets with in a virtual network.
Would preper to provision Database in a Back-end layer and couple of VMs can be bounded to a Load balancer in app_layer or Business_layer. Third portion of the sub-net could be used for hosting front end web applications for customer facing.


## Pre-Requesites
1. Terraform to be available in the machine running code (preffered latest version - 1.0.11)
2. An azure account to provision resources


## Implemented Parts of the Three tier architecture
- Structured with a virtual network of defined CIDR range.
- Three individual sub partitions of Subnets for Web, App and DB layer. 
- Each sub net associated with an NSG through specified inboud and outbound rules.
- App_sub net had three VM creates with default values and naming conventions.
- Created a SQL-Server and SQL-db for back-end purpose.
- Can be extended further with load balancers at App layer and private end point to SQL Server.
- All inputs were framed as default values, which can be overridden through autovars file.
- VM inputs were takes static in the interest of time, hence all three VMs will be created with same configuration.
- Do not have any Limit on the Number of VMs can be created, is based on number of inputs values we pass for vm_list.
- All validation been taken care - eg:- resource group can be created OR can take the existed value, based on inputs provided.


## Execution Flow
- Download the code to a local folder
- Use command promt or any terminal
- Navigate to the folder of code
- Make "az login" success before running terraform code.
- Initialize all the modules reffered in code through "terraform init"
- terraform plan
- terraform apply


## Resources Clean-up
- terraform destroy


## Architecture
Basic Architecture planned and provisioned for three tier architecture.
![architecture](threetierarchitecture.png)
