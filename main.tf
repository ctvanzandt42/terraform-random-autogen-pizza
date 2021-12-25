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
  location = "eastus2"
  name     = "cvzeu2-random-pizza"
}

resource "random_id" "rng" {
  byte_length = 8
  keepers = {
    first = timestamp()
  }
}

output "rng" {
  value = random_id.rng.hex
}




