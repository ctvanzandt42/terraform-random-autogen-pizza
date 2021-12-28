data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_vault" {
  location            = var.location
  name                = "${var.domain_prefix}-akv"
  resource_group_name = azurerm_resource_group.rsg.name
  sku_name            = var.kv_sku
  tenant_id           = data.azurerm_client_config.current.tenant_id
}

resource "azurerm_key_vault_access_policy" "default" {
  key_vault_id       = azurerm_key_vault.key_vault.id
  object_id          = data.azurerm_client_config.current.object_id
  tenant_id          = data.azurerm_client_config.current.tenant_id
  secret_permissions = ["get", "list"]
}

data "azurerm_key_vault_secret" "cc_num" {
  name         = var.cc_secret
  key_vault_id = azurerm_key_vault.key_vault.id
}