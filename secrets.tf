data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_vault" {
  location            = "eastus2"
  name                = "cvzeu2-akv"
  resource_group_name = azurerm_resource_group.rsg.name
  sku_name            = "standard"
  tenant_id           = data.azurerm_client_config.current.tenant_id
}