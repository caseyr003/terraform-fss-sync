#!/bin/sh
sudo mount ${src_mount_target_private_ip}:${src_export_path} ${src_mount_path}
sudo mount ${dst_mount_target_private_ip}:${dst_export_path} ${dst_mount_path}
