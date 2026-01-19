module "rsgs" {
  source = "../module/resource_group_01"
  rgs    = var.rgs
}
module "azads" {
  depends_on = [module.rsgs]
  source     = "../module/storage_account_02"
  azads      = var.azads

}
module "vnet" {
  depends_on = [module.rsgs]
  source     = "../module/virtual_network_03"
  vnet5      = var.vnet5
}
module "subnet" {
  depends_on = [module.vnet]
  source     = "../module/subnet_04"
  subnet5    = var.subnet5
}

module "pip" {
  depends_on = [module.subnet]
  source     = "../module/azurerm_pip_4"
  PIP5       = var.PIP5
}
module "vm" {
  depends_on = [module.subnet, module.pip]
  source     = "../module/virtual_matchine_05"
}

