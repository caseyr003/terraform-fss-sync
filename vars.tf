# Variables Exported from env.sh
variable "tenancy_ocid" {
  description = "Tenancy OCID for your Oracle Cloud Infrastructure account."
}
variable "user_ocid" {
  description = "User OCID for your Oracle Cloud Infrastructure account. API key must be uploaded to user account and match the below fingerprint."
}
variable "fingerprint" {
  description = "Fingerprint of the API key uploaded to user account."
}
variable "private_key_path" {
  description = "API private key that is associated with your Oracle Cloud Infrastructure user."
}
variable "compartment_ocid" {
  description = "Compartment OCID where you want to provision resources in your Oracle Cloud Infrastructure account."
}
variable "region" {
  description = "The SSH private key path which Terraform will added to SSH authorized_keys on Oracle Cloud Infrastructure Compute Instance."
}
variable "subnet_ocid" {
  description = "The OCID of the Oracle Cloud Infrastructure Subnet where rsync instance will be created."
}
variable "ssh_public_key" {}
variable "instance_shape" {}
variable "image_ocid" {}
variable "ssh_authorized_private_key" {}
variable "volume_ocid" {}
variable "database_ip" {}
# Uses Default Value
variable "instance_count" {
  default="1"
}
variable "compute_display_name" {
  default="FSS_Sync_Server"
}
variable "availability_domain" {
  description = "Number of which availability domain you want to use."
  default="1"
}
variable "file_system_display_name" {
  default="fss"
}
variable "mount_target_display_name" {
  default="mnt"
}
variable "ssh_private_key_path" {
  description = "The SSH private key path which Terraform will added to SSH authorized_keys on Oracle Cloud Infrastructure Compute Instance."
}
variable "public_ip" {
  description = "The public IP addresss of the instance where you want to mount the FSS."
}
variable "src_export_path" {
  description = "Source Export Path specified in the file system. Export path is appended to the mount target IP address and is used to mount to the file system. Example: `/src_fs_demo-iad-ad1` "
  default = ""
}
variable "src_mount_target_private_ip" {
  description = "IP address of the FSS Mount Target where the data will be copied from. Example: 10.0.0.5 , Mount Target IP and Export path are used to mount the file system. Example: 10.0.0.5:/mnt/src_fs_demo-iad-ad1"
}
variable "dst_export_path" {
  description = "Destination Export Path specified in the file system. Export path is appended to the mount target IP address and is used to mount to the file system. Example: `/dst_fs_demo-iad-ad2` "
  default = "/mnt"
}
variable "dst_mount_target_private_ip" {
  description = "IP address of the FSS Mount Target where the data will be copied to. Example: 10.0.1.5 , Mount Target IP and Export path are used to mount the file system. Example: 10.0.1.5:/mnt/dst_fs_demo-iad-ad2"
}
variable "mount_point_path" {
  description = "Path within the rsync instance to a locally accessible directory to which the remote file system is monted. Example: /mnt"
  default = "/mnt"
}
variable "export_path" {
    default = "/u01/apps"
}
