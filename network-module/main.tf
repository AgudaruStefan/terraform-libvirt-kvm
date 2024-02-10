terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
      version = "0.7.6"
    }
}
}
resource "libvirt_network" "vm_public_network"{
    name = "${var.VM_HOSTNAME}_network"
    mode = "${var.VM_NETMODE}"
    domain = "${var.VM_HOSTNAME}.local"
    addresses = ["${var.VM_CIDR_RANGE}"]
    dhcp {
        enabled = var.VM_DHCP
    }
    dns {
        enabled = var.VM_DNS
    }
}

