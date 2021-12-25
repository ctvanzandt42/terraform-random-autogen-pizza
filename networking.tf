resource "azurerm_virtual_network" "vnet" {
  address_space       = ["10.0.0.0/16"]
  location            = "eastus2"
  name                = "cvzeu2-vnet-hosting"
  resource_group_name = azurerm_resource_group.rsg.name

  ddos_protection_plan {
    enable = true
    id     = azurerm_network_ddos_protection_plan.ddos_plan.id
  }
}

resource "azurerm_network_ddos_protection_plan" "ddos_plan" {
  location            = "eastus2"
  name                = "cvzeu2-ddos-plan"
  resource_group_name = azurerm_resource_group.rsg.name
}

resource "azurerm_subnet" "snet" {
  name                 = "cvzeu2-vnet-hosting-snet"
  resource_group_name  = azurerm_resource_group.rsg.name
  virtual_network_name = azurerm_virtual_network.vnet.name

  address_prefixes = ["10.0.1.0/16"]

  service_endpoints = ["Microsoft.KeyVault"]
}