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
  source = "./disk-module"
}

module "network_module" {
    source = "./network-module"
    depends_on = [module.disk_module]
}

module "vms_module" {
    source = "./vms-module"
    depends_on = [module.network_module]
}

