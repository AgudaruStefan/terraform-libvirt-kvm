terraform {
    backend "local" {
    path = "terraform.tfstate"
  }
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
      version = "0.7.6"
    }
  }
}

provider "libvirt" {
    uri = "qemu:///system"
}

module "disk_module" {
    for_each = var.vm_main_configs
    source = "./disk-module"
    vm_disk_configs = {
      "${each.key}" = {
          name     = each.value.name
          source   = each.value.source
          user     = each.value.user
          format   = each.value.format
          ip       = each.value.ip
      }
    }
}

module "network_module" {
    source = "./network-module"
    depends_on = [module.disk_module]
}

module "vms_module" {
    for_each = var.vm_main_configs
    source = "./vms-module"
    depends_on = [module.network_module]
    vm_vms_configs = {
      "${each.key}" = {
          count   = each.value.count
          index   = each.value.index
          name    = each.value.name
          cpu     = each.value.cpu
          ram     = each.value.ram
      }
    }
}

locals {
  master_hosts = [for key, value in var.vm_main_configs : value.ip if value.is_master]
  worker_hosts = [for key, value in var.vm_main_configs : value.ip if !value.is_master]
}

resource "local_file" "ansible_hosts_file" {
  filename = "${path.module}/ansible_hosts.ini"
  content = <<-EOT
[masters]
${join("\n", local.master_hosts)}

[workers]
${join("\n", local.worker_hosts)}
EOT
}