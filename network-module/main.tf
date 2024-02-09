terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
      version = "0.7.6"
    }
}
}

resource "libvirt_network" "vm_public_network"{
    for_each = var.vm_network_configs
    name = "${each.value.name}_network"
    mode = "${each.value.netmode}"
    domain = "${each.value.name}.local"
    addresses = ["${each.value.cidr}"]
    dhcp {
        enabled = each.value.dhcp
    }
    dns {
        enabled = each.value.dns
    }
}

