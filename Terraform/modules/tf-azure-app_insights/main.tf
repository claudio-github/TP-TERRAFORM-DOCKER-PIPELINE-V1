resource "azurerm_log_analytics_workspace" "workspace" {
  name                = "${var.name}workspace"
  location            = "${var.location}"
  resource_group_name = var.resource_group_name
  retention_in_days   = 30
}

resource "azurerm_application_insights" "insights" {
  resource_group_name = var.resource_group_name
  name     = "${var.name}appinsights"
  location = "${var.location}"
  workspace_id        = azurerm_log_analytics_workspace.workspace.id
  application_type    = "web"

}