output "disk_id" {
  value = [for volume in libvirt_volume.vm : volume.id]
}


output "cloudinit_id"{
    value = libvirt_cloudinit_disk.cloudinit.id
}