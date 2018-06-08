# Copy script to instance and then run script
resource "null_resource" "compute_config" {
  # Copy file userdata folder contents into tmp folder on instance
  provisioner "file" {
    connection {
      host = "${var.public_ip}"
      user = "opc"
      private_key = "${var.ssh_private_key}"
    }
    source     = "userdata/"
    destination = "/tmp/"
  }
  # Run the script on the instance
  provisioner "remote-exec" {
    connection {
      host="${var.public_ip}"
      user = "opc"
      private_key = "${var.ssh_private_key}"
    }

    inline = [
      "chmod +x /tmp/rsync.sh",
      "sudo /tmp/rsync.sh ",
    ]
  }
}
