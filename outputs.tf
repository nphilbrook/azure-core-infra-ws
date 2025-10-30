output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "resource_group_location" {
  value = azurerm_resource_group.rg.location
}

output "environment_info" {
  value = {
    (var.location) = {
      environment         = var.environment
      location            = var.location
      resource_group_name = azurerm_resource_group.rg.name
      zone_name           = azurerm_dns_zone.zone.name
    },
    "eastus2" = {
      environment         = var.environment
      location            = "eastus2"
      resource_group_name = azurerm_resource_group.rg_east.name
      zone_name           = azurerm_dns_zone.zone_east.name
    }
    "global" = {
      environment         = var.environment
      resource_group_name = azurerm_resource_group.rg_global.name
      zone_name           = azurerm_dns_zone.zone_global.name
    }
  }
}
