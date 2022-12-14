terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
    backend "azurerm" {
  }
}

provider "azurerm" {
  features {}
}

provider "random" {
  # Configuration options
}

resource "random_string" "random" {
  length           = 10
  special          = false
  upper   = false
}



data "azurerm_container_registry" "myacr" {
  name = "containerregistrytp0001"
  resource_group_name = "containerregistrytalentpool-rg"

}


module "tf-azure-resource_group" {
  source   = "./modules/tf-azure-resource_group"
  name     = var.name
  location = var.location
}

module "tf-azure-app_service_plan" {
  source              = "./modules/tf-azure-app_service_plan"
  resource_group_name = module.tf-azure-resource_group.name
  name                = var.name
  location            = var.location
}

module "tf-azure-app_insights" {
  source              = "./modules/tf-azure-app_insights"
  resource_group_name = module.tf-azure-resource_group.name
  name                = var.name
  location            = var.location
}

module "tf-azure-app_services" {
   source = "./modules/tf-azure-app_service"
   name = "${var.name}"
   resource_group_name = module.tf-azure-resource_group.name
   location = var.location
   app_service_plan_id = module.tf-azure-app_service_plan.app_service-out

   acr_password = data.azurerm_container_registry.myacr.admin_password
   acr_url = data.azurerm_container_registry.myacr.login_server
   acr_username = data.azurerm_container_registry.myacr.admin_username

   docker_image_name = "web01_image"

}