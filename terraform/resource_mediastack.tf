resource "proxmox_lxc" "mediastack" {
    hostname = "mediastack"
    target_node = var.proxmox_host
    ostemplate = "local:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst"
    password = "changeme123"
    tags = "ansible;terraform"
    cores = 8
    memory = 8192

    // Terraform will crash without rootfs defined
    rootfs {
        storage = "local-lvm"
        size = "16G"
    }

    network {
        name = "eth0"
        bridge = var.nic_name
        ip = "10.10.10.52/24"
        gw = "10.10.10.1"
    }
}
