terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0.1"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.6"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.7.1"
    }
  }
  backend "azurerm" {
    resource_group_name  = var.resource_group_name
    storage_account_name = "tfstateu7deqa3h"
    container_name       = "global"
    key                  = "terraform.tfstate"
  }
}


provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
#   client_id       = var.client_id
#   client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

module "personal-vm" {
  source              = "./modules/personal-vm"
  vm_name             = var.vm_name
  admin_username      = var.admin_username
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = azurerm_subnet.main.id
  public_key          = tls_private_key.ssh.public_key_openssh
}

resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}