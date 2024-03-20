terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.96.0"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = true
  features {}
}

module "resource_group" {
  source              = "./modules/resource_group"
  resource_group_name = "lakshya02"
  location            = "East US"
}

module "storage_account" {
  source = "./modules/storage_account"
  sname = "lakshya02"
  resource_group_name = module.resource_group.rg_name
  location = "East US"
}

module "vm" {
  source = "./modules/vm"
  vmname = "lakshya01"
  resource_group_name = module.resource_group.rg_name
  location = "East US"

}