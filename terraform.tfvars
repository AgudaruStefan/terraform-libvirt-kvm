vm_main_configs={
    masterNode = {
        count   = 1
        index   = 0
        name    = "masterNode"
        cpu     = 2
        ram     = 2048
       source   = "/home/beardedsam/Projects/PoC/terraform-libvirt-kvm/jammy-server-cloudimg-amd64-disk-kvm.img"
        user     = "ansible"
        format   = "qcow2"
        ip       = "10.10.10.20"
        is_master = true
    }
    workerNode1 = {
        count   = 1
        index   = 0
        name    = "workerNode1"
        cpu     = 1
        ram     = 2048
       source   = "/home/beardedsam/Projects/PoC/terraform-libvirt-kvm/jammy-server-cloudimg-amd64-disk-kvm.img"
        user     = "ansible"
        format   = "qcow2"
        ip       = "10.10.10.30"
        is_master = false
    }
    workerNode2 = {
        count   = 1
        index   = 0
        name    = "workerNode2"
        cpu     = 1
        ram     = 2048
       source   = "/home/beardedsam/Projects/PoC/terraform-libvirt-kvm/jammy-server-cloudimg-amd64-disk-kvm.img"
        user     = "ansible"
        format   = "qcow2"
        ip       = "10.10.10.40"
        is_master = false
    }
}