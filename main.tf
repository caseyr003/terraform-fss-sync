# This Terraform script creates a virtual cloud network, provisions a compute
# instance, runs a script to configure server, and creates a custom image
# from the compute instance.

# Create File Storage
module "fss" {
  source = "./modules/fss"
  availability_domain = "${var.availability_domain}"
  display_name = "${var.file_system_display_name}"
  compartment_ocid = "${var.compartment_ocid}"
  subnet_ocid = "${var.subnet_ocid}"
  export_path = "${var.export_path}"
}

# Create Compute Instance
module "compute" {
  source = "./modules/compute-instance"
  tenancy_ocid = "${var.tenancy_ocid}"
  compartment_ocid = "${var.compartment_ocid}"
  ssh_public_key = "${var.ssh_public_key}"
  instance_name = "compute_image"
  subnet_ocid = "${var.subnet_ocid}"
  instance_count = "${var.instance_count}"
  instance_shape = "${var.instance_shape}"
  image_ocid = "${var.image_ocid}"
  display_name = "${var.compute_display_name}"
  availability_domain = "${var.availability_domain}"
}

# Attach Block Volume
module "attach_block_volume" {
  source = "./modules/attach-block-volume"
  instance_ocid = "${module.compute.instance_ocid}"
  volume_ocid = "${var.volume_ocid}"
}

# Configure Instance with FSS
module "rsync" {
  source = "./modules/rsync"
  ssh_private_key = "${var.ssh_authorized_private_key}"
  public_ip = "${module.compute.public_ip}"
  src_export_path = "${var.src_export_path}"
  src_mount_target_private_ip = "${var.src_mount_target_private_ip}"
  dst_export_path = "${var.dst_export_path}"
  dst_mount_target_private_ip = "${var.dst_mount_target_private_ip}"
  mount_point_path = "${var.mount_point_path}"
}

# Configure Database Instance
module "config_database" {
  source = "./modules/config-database"
  ssh_private_key = "${var.ssh_authorized_private_key}"
  database_ip = "${var.database_ip}"
}
