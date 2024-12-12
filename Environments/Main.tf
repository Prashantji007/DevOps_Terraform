module "modrg" {
  source = "../Modules/Azurerm_Resource_Group"
  resource_group = var.module_rg
}


module "vnmod" {
    depends_on = [ module.modrg ]
  source = "../Modules/Azurerm_Vnet"
    vn = var.vnmod
}

module "snmod" {
    depends_on = [module.modrg,  module.vnmod ]
  source = "../Modules/Azurerm_Subnet"
  sn = var.snmod
}

module "vmnod" {
  depends_on = [module.modrg, module.vnmod , module.snmod]
    source = "../Modules/Azurerm_VM"
    ni = var.vmmod
}

module "nsgmod" {
  depends_on = [ module.vmnod, module.rgmod ]
  source = "../Modules/Azurerm_NSG"
  nsg = var.nsgmod
  
}