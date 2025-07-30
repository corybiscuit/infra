#Set your public SSH key here
variable "ssh_key" {
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOTb4Sm7gktTXaIj2AKtrwk+9QLHuHOKFTS/bNrXac4J cory@bsct.io"
}
#Establish which Proxmox host you'd like to spin a VM up on
variable "proxmox_host" {
    default = "nimbus01"
}
#Specify which template name you'd like to use
variable "template_name" {
    default = "debian-12-template"
}
#Establish which nic you would like to utilize
variable "nic_name" {
    default = "vmbr0"
}
#Establish the VLAN you'd like to use
variable "vlan_num" {
    default = ""
}
#Provide the url of the host you would like the API to communicate on.
#It is safe to default to setting this as the URL for what you used
#as your `proxmox_host`, although they can be different
variable "api_url" {
    default = "https://10.10.10.99:8006/api2/json"
}
#Blank var for use by terraform.tfvars
variable "token_secret" {
}
#Blank var for use by terraform.tfvars
variable "token_id" {
}