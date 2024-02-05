terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
      version = "0.7.6"
    }
}
}

data "terraform_remote_state" "network_details" {
  backend = "local"
  config = {
    path = "terraform.tfstate"
  }
}

data "terraform_remote_state" "disk_details" {
  backend = "local"
  config = {
    path = "terraform.tfstate"
  }
}

locals {
  cloudinit_parts = split(";", data.terraform_remote_state.disk_details.outputs.cloudinit_id)
}

resource "libvirt_domain" "vm" {
    count = var.VM_COUNT
    name = "${var.VM_HOSTNAME}-${count.index}"
    memory = var.VM_RAM
    vcpu = var.VM_CPU

    cloudinit = data.terraform_remote_state.disk_details.outputs.cloudinit_id  


network_interface {
    network_name = "${data.terraform_remote_state.network_details.outputs.vm_network_name}"    
}

console {
    type = "pty"
    target_port = "0"
    target_type = "serial"
}

console {
    type = "pty"
    target_type = "virtio"
    target_port = "1"
}

disk {
    volume_id = "${data.terraform_remote_state.disk_details.outputs.disk_id[count.index]}"
}

graphics {
    type = "spice"
    listen_type = "address"
    autoport = "true"
}
}