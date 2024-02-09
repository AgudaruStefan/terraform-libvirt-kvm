output "vm_network_name"{
  value = "${{ for key, network in libvirt_network.vm_public_network : key => network.name }}"
}