terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "cvz-tf-cloud"

    workspaces {
      name = "cvz_macbook_tf_jobs"
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.90.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rsg" {
  location = var.location
  name     = "${var.domain_prefix}-random-pizza"
}

resource "random_integer" "rng" {
  min = var.min_val
  max = var.max_val
}

output "num" {
  value     = data.azurerm_key_vault_secret.cc_num.value
  sensitive = true
}




