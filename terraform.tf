terraform {
  required_version = "~>1.13"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.47"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~>6.0"
    }
  }
}
