#variable "vm_main_configs" {
#  type = map(object({
#   count   = number
#    index   = number
#    name    = string
#    cpu     = number
#    ram     = number
#    cidr    = string
#    netmode = string
#    dhcp    = bool
#    dns     = bool
#    source   = string
#   user     = string
#   format   = string
#  }))
#  default = {
#    masterNode = {
#        count   = 1
#        index   = 0
#        name    = "masterNode"
#        cpu     = 1
#        ram     = 1024
#       cidr    = "10.10.10.10/24"
#        netmode = "nat"
#        dhcp    = true
#        dns     = true
#       source   = "https://cloud-images.ubuntu.com/releases/bionic/release/ubuntu-18.04-server-cloudimg-amd64.img"
#        user     = "masternodeuser"
#        format   = "qcow2"
#    }
#  }
#}