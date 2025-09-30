terraform {
  backend "azurerm" {
    resource_group_name  = "w5d1-ali-storage-rg"
    storage_account_name = "alistorage20"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.44.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  subscription_id = var.ARM_SUBSCRIPTION_ID
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}
