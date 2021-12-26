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

#provider "azurerm" {
#  features {}
#}
#
#resource "azurerm_resource_group" "rsg" {
#  location = "eastus2"
#  name     = "cvzeu2-random-pizza"
#}

resource "random_integer" "rng" {
  min = var.min_val
  max = var.max_val
}

output "rng" {
  value = random_integer.rng.result
}

resource "random_id" "something" {
  count       = random_integer.rng.result % 9 == 0 ? 1 : 0
  byte_length = 8
}




