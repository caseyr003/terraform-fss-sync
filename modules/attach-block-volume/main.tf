# Attach block volume to instance. Will still need to run commands on instance.
resource "oci_core_volume_attachment" "attach_block_volume" {
  attachment_type = "iscsi"
  instance_id = "${var.instance_ocid}"
  volume_id = "${var.volume_ocid}"
}
