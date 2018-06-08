# Log on to database instance and run script that is already on database
resource "null_resource" "compute_config" {
  # Make sure to update the below inline command to run specified script
  provisioner "remote-exec" {
    connection {
      host="${var.database_ip}"
      user = "opc"
      private_key = "${var.ssh_private_key}"
    }

    inline = [
      "sudo PATH_TO_SCRIPT_ON_DB",
    ]
  }
}
