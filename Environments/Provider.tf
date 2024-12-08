terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.13.0"
    }
  }

   backend "azurerm" {
    resource_group_name  = ""  # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = ""                      # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = ""                       # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = ""        # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}

provider "azurerm" {
  features {
    
  }

  subscription_id = "8ddfe29c-6383-412d-865c-46457d64e3d6"
}