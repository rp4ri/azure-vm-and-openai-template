resource "azurerm_storage_account" "terraform_state" {
  name                     = "tfstate${random_string.storage_name.result}"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"

  blob_properties {
    versioning_enabled = true
  }
}

resource "azurerm_storage_container" "terraform_state" {
  name                  = "global"
  storage_account_name  = azurerm_storage_account.terraform_state.name
  container_access_type = "private"
}

resource "random_string" "storage_name" {
  length  = 8
  special = false
  upper   = false
}
