terraform {
  backend "azurerm" {
    resource_group_name  = "rgwpa-tfstate001"
    storage_account_name = "stwpatfstate1408141216"
    container_name       = "ctwpa-tfstate001"
    key                  = "webapp_teste.tfstate"
  }
}