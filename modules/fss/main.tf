# Create New FSS
resource "oci_file_storage_file_system" "file_system" {
  availability_domain = "${var.availability_domain}"
  compartment_id = "${var.compartment_ocid}"
  display_name = "${var.display_name}"
}

# Create Mount Target on FSS
resource "oci_file_storage_mount_target" "mount_target" {
  availability_domain = "${var.availability_domain}"
  compartment_id = "${var.compartment_ocid}"
  display_name = "${var.display_name}"
  subnet_id = "${var.subnet_ocid}"
}

# Create export on FSS
resource "oci_file_storage_export" "fss_export" {
  export_set_id = "${oci_file_storage_mount_target.mount_target.export_set_id}"
  file_system_id = "${oci_file_storage_file_system.file_system.id}"
  path = "${var.export_path}"
}
