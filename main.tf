# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }
}

provider "azurerm" {
  features {}
}

#Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "myTFResourceGroup"
  location = "westus2"
}

#Storage account
resource "azurerm_storage_account" "StorAcc1" {
  name = "hwnafvab19962021bub12"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  account_kind = "StorageV2"
  account_tier = "Standard"
  account_replication_type = "LRS"
}

#Container
resource "azurerm_storage_container" "Cont1" {
  name = "iso-folder-12"
  storage_account_name = azurerm_storage_account.StorAcc1.name
  container_access_type = "private"
}