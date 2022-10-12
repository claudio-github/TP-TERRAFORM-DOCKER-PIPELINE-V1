resource "azurerm_app_service" "app_service" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = var.app_service_plan_id

  site_config {

    linux_fx_version  = "DOCKER|${var.acr_url}/web01_image:latest"
    
  }
  
  /*
   identity {
   type         = "SystemAssigned"
   }
*/
    app_settings = {
      "DOCKER_REGISTRY_SERVER_PASSWORD" = var.acr_password
      "DOCKER_REGISTRY_SERVER_URL" = var.acr_url
      "DOCKER_REGISTRY_SERVER_USERNAME" = var.acr_username
  }

}
