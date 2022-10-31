# variable "oidc_token" {}
variable "oidc_request_token" {}
variable "oidc_request_url" {}



provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id = "ea757669-674b-44c1-bf87-bd0fd0880294"
  client_id       = "04b07795-8ddb-461a-bbee-02f9e1bf7b46"
  tenant_id       = "e2a4b012-36ad-45f2-8c5c-169f06c2f970"
  use_oidc        = true
  oidc_request_token = var.oidc_request_token
  oidc_request_url   = var.oidc_request_url
  
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



# token=$(az account get-access-token| jq -r ".accessToken")

# terraform apply -var="oidc_token=$token"

# https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-cloud-providers#using-custom-actions


