terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.69.0"
    }
  }
}

provider "azurerm" {
  features{}
  
  client_id = var.secret1_value
  client_secret = var.secret2_value
  tenant_id = var.secret3_value
  subscription_id = var.secret4_value

}

module "RG" {
    source = "./Modules/RG"

    resource_group_name       = var.resource_group_name
    resource_group_location   = var.resource_group_location
}


module "Compute" {
    source = "./Modules/Compute"

     resource_group_name            = var.resource_group_name
     resource_group_location        = var.resource_group_location

     acr_name                       = var.acr_name
    acr_sku                        = var.acr_sku
    acr_admin_enabled              = var.acr_admin_enabled
    
     cluster_name                   = var.cluster_name
     kubernetes_version             = var.kubernetes_version
     dns_prefix                     = var.dns_prefix

     node_pool_name                  = var.node_pool_name
     node_count                      = var.node_count
     node_pool_vm_size               = var.node_pool_vm_size
     node_pool_type                  = var.node_pool_type
     node_pool_zones                 = var.node_pool_zones
     node_pool_scaling               = var.node_pool_scaling

     identity_type                   = var.identity_type

     lb_sku                          = var.lb_sku
     network_plugin                  = var.network_plugin
     depends_on                      =[module.RG] 
}

module "Security" {

  source = "./Modules/Security"

  resource_group_name                   = var.resource_group_name
  resource_group_location               = var.resource_group_location
  key_vault_name                        = var.key_vault_name
  soft_delete_retention_days            = var.soft_delete_retention_days
  purge_protection_enabled              = var.purge_protection_enabled
  sku_name                              = var.sku_name
  key_permissions                       = var.key_permissions
  secret_permissions                    = var.secret_permissions
  storage_permissions                   = var.storage_permissions
  secret1_name                          = var.secret1_name
  secret1_value                         = var.secret1_value
  secret2_name                          = var.secret2_name
  secret2_value                         = var.secret2_value
  secret3_name                          = var.secret3_name
  secret3_value                         = var.secret3_value
  secret4_name                          = var.secret4_name
  secret4_value                         = var.secret4_value
  object_id                             = var.object_id 
  depends_on                            = [module.RG]
 

}

module "ManagementGroup" {
  source                                = "./Modules/ManagementGroup"

  display_name                          = var.display_name

  depends_on                            = [module.RG]
}



  


