terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
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
   name = "${var.name}${random_string.random.result}"
   resource_group_name = module.tf-azure-resource_group.name
   location = var.location
   app_service_plan_id = module.tf-azure-app_service_plan.app_service-out
}