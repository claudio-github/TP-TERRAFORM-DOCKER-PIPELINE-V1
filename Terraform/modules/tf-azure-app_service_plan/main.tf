resource "azurerm_app_service_plan" "app_service_plan" {
  resource_group_name = var.resource_group_name
  name     = "${var.name}serviceplan"
  location = "${var.location}"
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "BasicV1"
    size = "B1"
  }
}