variable "subscription_id" {
  type = string
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "resource_group_name" {
  default = "jumpbox-resource-group"
  type = string
}

variable "location" {
  default = "centralus"
  type = string
}

variable "vm_machine_name" {
  default = "jumpbox-machine"
  type = string
}

variable "vm_username" {
  default = "admin"
  type = string
}

variable "vm_size" {
  default = "Standard_D4s_v3"
  type = string
}

variable "vm_priority" {
  default = "Spot"
  type = string
}

variable "cloud_name" {
  description = "The Azure cloud environment to use. Available values at https://www.terraform.io/docs/providers/azurerm/#environment"
  default = "public"
  type = string
}

variable "path_to_ssh_public_key" {
  default = "~/.ssh/id_rsa.pub"
  type = string
}