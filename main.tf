

provider "azurerm" {
  features {}
  subscription_id = "0f940492-38a4-4a54-8b05-73bbe278283a"
  client_id       = "ef732b10-ca18-4a90-a02b-9887674dfa59"
  client_secret   = "UM68Q~x1le_HWO.DtWHgcHQV3ym-Btsl.9Er_aW3"
  tenant_id       = "15e7e95e-9593-4b09-93e6-886dee7ef854"
}

resource "azurerm_service_plan" "plan-app" {
  name = var.service_plan_name
  location = var.location
  resource_group_name = var.resource_group_name
  os_type = "Linux"
  sku_name = "B1"
}

resource "random_string" "str" {
  length = 4
  special = false
  upper = false
}

resource "azurerm_linux_web_app" "app" {
    name = "${var.app_name}-${random_string.str.result}"
    location = var.location
    resource_group_name = var.resource_group_name
    service_plan_id = azurerm_service_plan.plan-app.id
    site_config {}
}
