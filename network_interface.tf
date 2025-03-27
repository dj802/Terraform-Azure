resource "azurerm_network_interface" "elastic01" {
  name                = "elastic01-nic"
  location            = azurerm_resource_group.production_vnet.location
  resource_group_name = azurerm_resource_group.production_vnet.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.elastic.id
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_network_interface" "elastic02" {
  name                = "elastic02-nic"
  location            = azurerm_resource_group.production_vnet.location
  resource_group_name = azurerm_resource_group.production_vnet.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.elastic.id
    private_ip_address_allocation = "Dynamic"
  }
}



resource "azurerm_network_interface" "nsc01" {
  name                = "nsc01-nic"
  location            = azurerm_resource_group.production_vnet.location
  resource_group_name = azurerm_resource_group.production_vnet.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.management.id
    private_ip_address_allocation = "Dynamic"
  }
}


