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
    }
    workerNode1 = {
        count   = 1
        index   = 0
        name    = "workerNode1"
        cpu     = 1
        ram     = 2048
       source   = "https://cloud-images.ubuntu.com/releases/bionic/release/ubuntu-18.04-server-cloudimg-amd64.img"
        user     = "workernodeuser"
        format   = "qcow2"
    }
    workerNode2 = {
        count   = 1
        index   = 0
        name    = "workerNode2"
        cpu     = 1
        ram     = 2048
       source   = "https://cloud-images.ubuntu.com/releases/bionic/release/ubuntu-18.04-server-cloudimg-amd64.img"
        user     = "workernodeuser"
        format   = "qcow2"
    }
}