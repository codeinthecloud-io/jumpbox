resource "azurerm_resource_group" "jumpbox" {
  name = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "jumpbox" {
  name = "jumpbox-network"
  address_space = [
    "10.0.0.0/16"]
  location = azurerm_resource_group.jumpbox.location
  resource_group_name = azurerm_resource_group.jumpbox.name
}

resource "azurerm_subnet" "jumpbox" {
  name = "internal"
  resource_group_name = azurerm_resource_group.jumpbox.name
  virtual_network_name = azurerm_virtual_network.jumpbox.name
  address_prefix = "10.0.2.0/24"
}

resource "azurerm_public_ip" "jumpbox" {
  name = azurerm_resource_group.jumpbox.name
  location = azurerm_resource_group.jumpbox.location
  resource_group_name = azurerm_resource_group.jumpbox.name
  allocation_method = "Dynamic"
}

resource "azurerm_network_interface" "jumpbox" {
  name = "jumpbox-nic"
  location = azurerm_resource_group.jumpbox.location
  resource_group_name = azurerm_resource_group.jumpbox.name

  ip_configuration {
    name = "internal"
    subnet_id = azurerm_subnet.jumpbox.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.jumpbox.id
  }

}

resource "azurerm_linux_virtual_machine" "jumpbox" {
  name = var.vm_machine_name
  resource_group_name = azurerm_resource_group.jumpbox.name
  location = azurerm_resource_group.jumpbox.location
  size = var.vm_size
  admin_username = var.vm_username
  priority = var.vm_priority
  eviction_policy = "Deallocate"
  network_interface_ids = [
    azurerm_network_interface.jumpbox.id,
  ]

  admin_ssh_key {
    username = var.vm_username
    public_key = file(var.path_to_ssh_public_key)
  }

  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer = "UbuntuServer"
    sku = "18.04-LTS"
    version = "latest"
  }
}
