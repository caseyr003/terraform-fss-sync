# ------------------------------------------------------------------------------------------------------------------------
# RSYNC MODULE VARIABLES
# ------------------------------------------------------------------------------------------------------------------------

variable "ssh_private_key" {
  description = "The SSH private key path which Terraform will added to SSH authorized_keys on Oracle Cloud Infrastructure Compute Instance."
}

variable "public_ip" {
  description = "The public IP addresss of the instance where you want to mount the FSS."
}

variable "src_export_path" {
  description = "Source Export Path specified in the file system. Export path is appended to the mount target IP address and is used to mount to the file system. Example: `/src_fs_demo-iad-ad1` "
}

variable "src_mount_target_private_ip" {
  description = "IP address of the FSS Mount Target where the data will be copied from. Example: 10.0.0.5 , Mount Target IP and Export path are used to mount the file system. Example: 10.0.0.5:/mnt/src_fs_demo-iad-ad1"
}

variable "dst_export_path" {
  description = "Destination Export Path specified in the file system. Export path is appended to the mount target IP address and is used to mount to the file system. Example: `/dst_fs_demo-iad-ad2` "
}

variable "dst_mount_target_private_ip" {
  description = "IP address of the FSS Mount Target where the data will be copied to. Example: 10.0.1.5 , Mount Target IP and Export path are used to mount the file system. Example: 10.0.1.5:/mnt/dst_fs_demo-iad-ad2"
}

variable "mount_point_path" {
  description = "Path within the rsync instance to a locally accessible directory to which the remote file system is monted. Example: /mtn"
}
