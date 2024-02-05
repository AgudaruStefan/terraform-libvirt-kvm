output "vm_network_name"{
    value = module.network_module.vm_network_name
}

output "disk_id"{
    value = module.disk_module.disk_id
}

output "cloudinit_id"{
    value = module.disk_module.cloudinit_id
}