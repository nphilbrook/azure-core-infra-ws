provider "azurerm" {
  use_cli                         = false
  resource_provider_registrations = "none"

  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

provider "aws" {
  # hardcoded, just Route 53 resources
  region = "us-east-1"
  default_tags {
    tags = local.default_tags
  }
}
