vm_main_configs={
    masterNode = {
        count   = 1
        index   = 0
        name    = "masterNode"
        cpu     = 1
        ram     = 1024
       source   = "https://cloud-images.ubuntu.com/releases/bionic/release/ubuntu-18.04-server-cloudimg-amd64.img"
        user     = "masternodeuser"
        format   = "qcow2"
        ip       = "192.168.100.20"
        is_master = true
    }
    workerNode1 = {
        count   = 1
        index   = 0
        name    = "workerNode1"
        cpu     = 1
        ram     = 2048
       source   = "https://cloud-images.ubuntu.com/releases/bionic/release/ubuntu-18.04-server-cloudimg-amd64.img"
        user     = "workernodeuser1"
        format   = "qcow2"
        ip       = "192.168.100.30"
        is_master = false
    }
    workerNode2 = {
        count   = 1
        index   = 0
        name    = "workerNode2"
        cpu     = 1
        ram     = 2048
       source   = "https://cloud-images.ubuntu.com/releases/bionic/release/ubuntu-18.04-server-cloudimg-amd64.img"
        user     = "workernodeuser2"
        format   = "qcow2"
        ip       = "192.168.100.40"
        is_master = false
    }
}