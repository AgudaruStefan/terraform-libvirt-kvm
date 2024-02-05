variable "VM_HOSTNAME"{
    default = "vm"
    type = string
}

variable "VM_IMG_URL" {
    default = "https://cloud-images.ubuntu.com/releases/bionic/release/ubuntu-18.04-server-cloudimg-amd64.img"
    type = string
}

variable "VM_IMG_FORMAT"{
    default = "qcow2"
    type = string
}

variable "VM_COUNT" {
    default = 1
    type = number
}

variable "VM_USER" {
    default = "developer"
    type = string
}
