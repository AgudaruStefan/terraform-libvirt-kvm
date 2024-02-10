variable "VM_CIDR_RANGE"{
    default = "10.10.10.10/24"
    type = string
}

variable "VM_HOSTNAME"{
    default = "vm"
    type = string
}

variable "VM_NETMODE"{
    default = "nat"
    type = string
}

variable "VM_DHCP"{
    default = true
    type = bool
}

variable "VM_DNS"{
    default = true
    type = bool
}