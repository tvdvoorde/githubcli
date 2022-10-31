provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }

  # subscription_id = "00000000-0000-0000-0000-000000000000"
  # client_id       = "00000000-0000-0000-0000-000000000000"
  # client_secret   = var.client_secret
  # tenant_id       = "00000000-0000-0000-0000-000000000000"

}

resource "azurerm_resource_group" "hub" {
  name     = "rg-123"
  location = "West Europe"
}

resource "azurerm_resource_group" "hub2" {
  name     = "rg-456"
  location = "West Europe"
}

terraform {
  cloud {
    organization = "tedv"
    workspaces {
      name = "workspace1"
    }
  }
}

resource "random_id" "server" {
  byte_length = 8
}
