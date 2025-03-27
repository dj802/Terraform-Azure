resource "azurerm_virtual_network" "production_vnet" {
  name                = "production_vnet"
  location            = azurerm_resource_group.production_vnet.location
  resource_group_name = azurerm_resource_group.production_vnet.name
  address_space       = ["10.1.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

} 

resource "azurerm_subnet" "web" {
  name                 = "web"
  resource_group_name  = azurerm_resource_group.production_vnet.name
  virtual_network_name = azurerm_virtual_network.production_vnet.name
  address_prefixes     = ["10.1.1.0/24"]
}

resource "azurerm_subnet" "elastic" {
  name                 = "elastic"
  resource_group_name  = azurerm_resource_group.production_vnet.name
  virtual_network_name = azurerm_virtual_network.production_vnet.name
  address_prefixes     = ["10.1.3.0/24"]
}

resource "azurerm_subnet" "management" {
  name                 = "management"
  resource_group_name  = azurerm_resource_group.production_vnet.name
  virtual_network_name = azurerm_virtual_network.production_vnet.name
  address_prefixes     = ["10.1.0.0/24"]
}

