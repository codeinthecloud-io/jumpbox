locals {
  jumpbox = {
    cloud_name = var.cloud_name
    location = var.location
    path_to_ssh_public_key = var.path_to_ssh_public_key
    public_ip = azurerm_public_ip.jumpbox.ip_address
    resource_group_name = var.resource_group_name
    vm_priority = var.vm_priority
    vm_size = var.vm_size
    vm_username = var.vm_username
  }
}

output "jumpbox" {
  value = jsonencode(local.jumpbox)
  sensitive = false
}