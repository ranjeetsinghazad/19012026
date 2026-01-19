terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.57.0"
    }
  }
   backend "azurerm" {
    resource_group_name  = "azadrg"
    storage_account_name = "azadstgs"
    container_name       = "azadcontainer"
    key                  = "update.terraform.tfstate"
  }

}

provider "azurerm" {
  features {}

  subscription_id = "cb0d4d41-c138-403e-a809-9f49c32a3b51"
}