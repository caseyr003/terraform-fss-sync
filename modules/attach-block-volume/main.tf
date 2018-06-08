resource "oci_core_volume_attachment" "attach_block_volume" {
  attachment_type = "iscsi"
  compartment_id = "${var.compartment_ocid}"
  instance_id = "${var.instance_ocid}"
  volume_id = "${var.volume_ocid}"
}
