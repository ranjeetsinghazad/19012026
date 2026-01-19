resource "azurerm_storage_account" "rstorage" {
    for_each = var.azads
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  }

