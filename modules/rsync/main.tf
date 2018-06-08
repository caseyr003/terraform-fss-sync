data "template_file" "rsync_file" {
  template = "${file("${path.module}/rsync.tpl")}"

  vars {
    src_export_path             = "${var.src_export_path}"
    src_mount_target_private_ip = "${var.src_mount_target_private_ip}"
    src_mount_path              = "${var.mount_point_path}${var.src_export_path}/"

    dst_export_path             = "${var.dst_export_path}"
    dst_mount_target_private_ip = "${var.dst_mount_target_private_ip}"
    dst_mount_path              = "${var.mount_point_path}${var.dst_export_path}/"
  }
}

resource "null_resource" "rsync" {

  connection {
    agent       = false
    timeout     = "30m"
    host        = "${var.public_ip}"
    user        = "opc"
    private_key = "${file(var.ssh_private_key_path)}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo . ${data.template_file.rsync_file.rendered}"
    ]
  }
}
