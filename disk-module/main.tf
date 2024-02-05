terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
      version = "0.7.6"
    }
}
}

data "template_file" "user_data" {
    template = file("${path.module}/cloud_init.cfg")
    vars = {
        VM_USER = var.VM_USER
    }
}

data "template_file" "network_config"{
    template = file("${path.module}/network_config.cfg")
}

resource "libvirt_pool" "vm" {
    name = "${var.VM_HOSTNAME}_pool"
    type = "dir"
    path = "/tmp/terraform-provider-libvirt-pool-ubuntu"
}

resource "libvirt_volume" "vm" {
    count = var.VM_COUNT
    name = "${var.VM_HOSTNAME}-${count.index}_volume.${var.VM_IMG_FORMAT}"
    pool = libvirt_pool.vm.name
    source = var.VM_IMG_URL
    format = var.VM_IMG_FORMAT
}


resource "libvirt_cloudinit_disk" "cloudinit" {
    name = "${var.VM_HOSTNAME}_cloudinit.iso"
    user_data = data.template_file.user_data.rendered
    network_config = data.template_file.network_config.rendered
    pool = libvirt_pool.vm.name
}