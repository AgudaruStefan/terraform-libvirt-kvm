variable "vm_network_configs" {
  type = map(object({
    name    = string
    cidr    = string
    netmode = string
    dhcp    = bool
    dns     = bool
  }))
  default = {
    masterNode = {
        name    = "masterNode"
        cidr    = "10.10.10.10/24"
        netmode = "nat"
        dhcp    = true
        dns     = true
    }
  }
}