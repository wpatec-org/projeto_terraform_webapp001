# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "rg-tf" {
  name     = var.resource_group_name
  location = var.location

  tags = { 
    provisioner = "terraform"
    ambiente = "Dev"

   }

}

## Criação do service_plan
resource "azurerm_service_plan" "plan-app" {
  name                = "plan-tf-webapp"
  location            = azurerm_resource_group.rg-tf.location
  resource_group_name = azurerm_resource_group.rg-tf.name
  os_type = "Linux"
  sku_name = "B1"

  tags = { 
    provisioner = "terraform"
    ambiente = "Dev"

   }

}


## Criação do web_app
resource "azurerm_linux_web_app" "web-app" {
  name                = "teste-webapp001"
  resource_group_name = azurerm_resource_group.rg-tf.name
  location            = azurerm_resource_group.rg-tf.location
  service_plan_id     = azurerm_service_plan.plan-app.id


  ###
  
site_config {
    application_stack {
      docker_image_name = "nginx:latest"
      
    }
  }

  app_settings = {
    WEBSITES_PORT = "80"
  }


   tags = { 
    provisioner = "terraform"
    ambiente = "Dev"
    app = "tf001"
   }


}