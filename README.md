
# Terraform-Clone-snapshot into a new File System of OCI

## This terraform script/modules will replicate data from two OCI File Storage Service(FSS) shared File Systems. This will launch a OCI instance and copies the data from Source FSS to destination FSS using rsync cron job.


# Software Requirements

To run this you must have installed the Terraform binary (at least 0.9.x) and configured it per instruction.

You must also have installed the Oracle Cloud Infrastructure Terraform provider.

You will also, of course, need access to an Oracle Cloud Infrastructure (OCI) account. If you do not have access, you can request a free trial. To learn more about Oracle OCI, read the Getting Started guide.


# Environment Requirements

Please follow all instructions for installing the Terraform and Oracle Cloud Infrastructure Provider executables.

https://github.com/oracle/terraform-provider-oci


# Running

* The env.sh file needs to be updated with your: 
  * Tenancy specific information
  * Mount Target OCID 
  * Golden Image Mount Target IP
  * Backup Block Volume OCID
  * Database Server Private IP

* The first step is to spin off a background job in the database server provided. The script(rman.sh) inside the database server will be kicked off to restore a backup database.

* In the `modules/config-database/main.tf` file kindly mention the path to the rman.sh script.

* The rsync Module is the part where we have the script to sync data between two FSS mounted. The script is in `modules/rsync/rsync.tpl`.

Once you understand the code, have all the software requirements, and have satisfied the environmental requirements you can build your environment.

The first step is to parse all the modules by typing terraform get. This will build out a .terraform directory in your project root. This needs to be done only once.

The next step is to run terraform plan from the command line to generate an execution plan. Examine this plan to see what will be built and that there are no errors.

If you are satisfied, you can build the configuration by typing terraform apply. This will build all of the dependencies and construct an environment to match the project.

Note that Terraform generates a terraform.tfstate and terraform.tfstate.backup file which manage the state of your environment. These files should not be hand edited.

If you want to tear down your environment, you can do that by running terraform destroy

To find more information on where to find the needed values please visit: https://docs.us-phoenix-1.oraclecloud.com/Content/API/Concepts/apisigningkey.htm

Commands:

[opc@orchestration demo]$	terraform init

[opc@orchestration demo]$	. ./env.sh

[opc@orchestration demo]$	terraform plan

[opc@orchestration demo]$	terraform apply

[opc@orchestration demo]$	terraform destroy

