# Create New FSS
resource "oci_file_storage_file_system" "file_system" {
  availability_domain = "${var.availability_domain}"
  compartment_id = "${var.compartment_ocid}"
  display_name = "${var.display_name}"
}
