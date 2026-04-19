variable "location" {
  description = "Localização dos recursos no Azure"
  type        = string
  #default     = "eastus2" # Valor padrão caso não seja preenchido
}

variable "resource_group_name" {
  type = string
}
