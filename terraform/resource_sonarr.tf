resource "proxmox_lxc" "sonarr" {
    hostname = "sonarr"
    target_node = var.proxmox_host
    ostemplate = "local:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst"
    password = "changeme123"
    unprivileged = true
    tags = "ansible;media;starr;terraform"
    cores = 2
    memory = 2048

    // Terraform will crash without rootfs defined
    rootfs {
        storage = "local-lvm"
        size = "16G"
    }

    // mergerfs mounts
    mountpoint {
        key = "0"
        slot = 0
        storage = "/mnt/storage"
        mp = "/mnt/storage
        size = "88T"
    }

    network {
        name = "eth0"
        bridge = var.nic_name
        ip = "10.10.10.50/24"
        gw = "10.10.10.1"
    }
}
