resource_group_name                                 = "My-Rg"
resource_group_location                             = "East US"
acr_name                                            = "myyycrvv20768"
acr_sku                                             = "Standard"
acr_admin_enabled                                   =  false
cluster_name                                        = "my-aks-cluster"
kubernetes_version                                  = "1.27.7"
node_pool_name                                      = "system"
node_count                                          =  2
node_pool_vm_size                                   = "standard_a2_v2"
node_pool_type                                      = "VirtualMachineScaleSets"
node_pool_scaling                                   = false
node_pool_zones                                     = [ 1,2,3 ]
identity_type                                       = "SystemAssigned"
lb_sku                                              = "standard"
network_plugin                                      = "kubenet"
dns_prefix                                          = "my-aks-cluster"
  key_vault_name                                    = "vr5467keyvault"

  soft_delete_retention_days                        = 7

  purge_protection_enabled                          = false

  sku_name                                          = "standard"

 

 

  key_permissions                                  =["Get",]

  secret_permissions                               = [
      "Get", "Backup", "Delete", "List", "Purge", "Recover", "Restore", "Set",
    ]

  storage_permissions                              =  [
      "Get",
    ]
  

 

  secret1_name                          = "clientID"

  secret1_value                         = "21813310-5b23-4500-9050-c99a2594cf40"

  secret2_name                          = "clientsecret"

  secret2_value                         = "Zx88Q~9xcvhOUoN9l6DlM3H6ctv4hX~G64xFMb6M"

  secret3_name                          = "tenantID"

  secret3_value                         = "750f2040-ab7f-42ed-8001-36ba05e30750"

  secret4_name                          = "subscriptionID"

  secret4_value                         = "a1085f45-3c41-4277-b3a7-cd100aaffb99"

  object_id                             = "86f26d22-6fce-4ecc-96bf-d649be38af13"

  display_name                          = "VARSHparentgroup"
