provider "azurerm" {
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  environment     = var.cloud_name

  version = "~> 2.5"
  features {}
}

terraform {
  required_version = ">= 0.12.0"
}