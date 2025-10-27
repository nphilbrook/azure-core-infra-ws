output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "resource_group_location" {
  value = azurerm_resource_group.rg.location
}

output "environment_info" {
  value = {
    environment         = var.environment
    location            = var.location
    resource_group_name = azurerm_resource_group.rg.name
    zone_name           = azurerm_dns_zone.zone.name
  }
}
