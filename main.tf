locals {
  default_tags = {
    "created-by"       = "terraform"
    "source-workspace" = var.TFC_WORKSPACE_SLUG
  }
  r53_zone = "${var.username}.sbx.hashidemos.io"
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.environment}-${var.location}"
  location = var.location

  tags = local.default_tags
}

resource "azurerm_dns_zone" "zone" {
  name                = "${var.location}.${var.environment}.azure.${local.r53_zone}"
  resource_group_name = azurerm_resource_group.rg.name

  tags = local.default_tags
}

data "aws_route53_zone" "public_zone" {
  name = local.r53_zone
}

resource "aws_route53_record" "ns" {
  zone_id = data.aws_route53_zone.public_zone.zone_id
  name    = azurerm_dns_zone.zone.name
  type    = "NS"
  ttl     = 300
  records = azurerm_dns_zone.zone.name_servers
}

resource "azurerm_resource_group" "rg_east" {
  name     = "${var.environment}-eastus2"
  location = "eastus2"

  tags = local.default_tags
}

resource "azurerm_dns_zone" "zone_east" {
  name                = "eastus2.${var.environment}.azure.${local.r53_zone}"
  resource_group_name = azurerm_resource_group.rg_east.name

  tags = local.default_tags
}

resource "aws_route53_record" "ns_east" {
  zone_id = data.aws_route53_zone.public_zone.zone_id
  name    = azurerm_dns_zone.zone_east.name
  type    = "NS"
  ttl     = 300
  records = azurerm_dns_zone.zone_east.name_servers
}
