terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.104.0"
    }
  }
}
# Provider
provider "azurerm" {
  features {}
}
