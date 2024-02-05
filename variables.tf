variable "VM_COUNT" {
    default = 1
    type = number
}

variable "VM_RAM" {
    default = 1024
    type = number
}

variable "VM_CPU" {
    default = 1
    type = number
}

variable "VM_HOSTNAME"{
    default = "vm"
    type = string
}