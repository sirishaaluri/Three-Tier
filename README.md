# Three-Tier
1.
Readme

Implemented Parts of the Three tier architecture

- Structured with a virtual network of defined CIDR range.
- Three individual sub partitions of Subnets for Web, App and DB layer. 
- Each sub net associated with an NSG through specified inboud and outbound rules.
- App_sub net had three VM creates with default values and naming conventions.
- Created a SQL-Server and SQL-db for back-end purpose.
- Can be extended further with load balancers at App layer and private end point to SQL Server.
- All inputs were framed as default values, which can be overridden through autovars file.
- VM inputs were takes static in the interest of time, hence all three VMs will be created with same configuration.
- Number of VMs can be created do not have a limit, is based on number of inputs values we pass for vm_list.
- All validation been taken care - eg:- resource group can be created OR can take the existed value, based on inputs provided.

Pre-requisites:-
1. Terraform to be available in the machine running code (preffered latest version - 1.0.11)
2. An azure account to provision resources

Execution Flow:-
1. Download the code to a local folder
2. Use command promt or any terminal
3. Navigate to the folder of code
4. make "az login" success before running terraform code.
5. initialize all the modules reffered in code through "terraform init"
6. terraform plan
7. terraform apply




-------------------------------------
2.


AWS Instance Metadata can be retrieved through:

curl http://169.254.169.254/latest/meta-data/
curl http://169.254.169.254/latest/meta-data/public-hostname
curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/local-hostname

Azure Instance Metadata:

curl -H Metadata:true --noproxy "*" "http://169.254.169.254/metadata/instance?api-version=2021-02-01" | jq
curl -H Metadata:true --noproxy "*" "http://169.254.169.254/metadata/instance/compute/vmId?api-version=2017-08-01&format=text"
curl -H Metadata:true --noproxy "*" "http://169.254.169.254/metadata/instance/compute/tags?api-version=2017-08-01&format=text"

-------------------------------------
3.
Sample Code to get values from Dict, might not be serving the excercise purpose , in the interest of time just ensuring to present here.

def print_nested_keys(dic,path=''):
    for k,v in dic.items():
        if isinstance(v,dict):
            path+=k+"."
            yield from print_nested_keys(v,path)
        else:
            path+=k
            yield path
