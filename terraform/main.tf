terraform {
    required_providers {
        proxmox = {
            source = "telmate/proxmox"
            #latest version as of 2025-07-29
            version = "3.0.2-rc03"
        }
    }
}

provider "proxmox" {
    # Reference vars.tf to plug in the api_url
    pm_api_url = var.api_url
    # References secrets.tfvars to plug in the token_id
    pm_api_token_id = var.token_id
    # References secrets.tfvars to plug in the token_secret
    pm_api_token_secret = var.token_secret
    # Default to `true` unless you have TLS working within your pve setup
    pm_tls_insecure = true
}

# Creates a proxmox_vm_qemu entity named test02
resource "proxmox_vm_qemu" "testvm-02" {
    name = "testvm-02"
    target_node = var.proxmox_host

    # References vars.tf to plug in the template name
    clone = "debian-12-template"
    # Creates a full clone, rather than linked
    # https://pve.proxmox.com/wiki/VM_Templates_and_Clones
    full_clone = "true"

    # VM Settings. `agent = 1` enables qemu-guest-agent
    agent = 1
    os_type = "cloud-init"
    ipconfig0 = "ip=10.10.10.201/24,gw=10.10.10.1"
    memory = 2048
    scsihw = "virtio-scsi-pci"
    bootdisk = "scsi0"

    cpu {
        cores = 2
        sockets = 1
        type = "host"
    }

    disks {
        ide {
            ide0 {
                cloudinit {
                    storage = "local-lvm"
                }
            }
        }
        scsi {
            scsi0 {
                disk {
                    size = "32G"
                    storage = "local-lvm"
                    # Enables SSD emulation
                    emulatessd = true
                    # Enables thin-provisioning
                    discard = true
                }
            }
        }
    }

    network {
        id = 0
        model = "virtio"
        bridge = var.nic_name
    }

    lifecycle {
        ignore_changes = [
            network,
        ]
    }
    #provisioner "local-exec" {
        # Provisioner commands can be run here.
        # We will use provisioner functionality to kick off ansible playbooks in the future
        #command = "touch /home/cory/test.txt"
    #}
}