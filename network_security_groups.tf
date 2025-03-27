# Create a Network Security Group (NSG) for SSH Access
resource "azurerm_network_security_group" "elastic_nsg" {
  name                = "elastic-nsg"
  location            = azurerm_resource_group.production_vnet.location
  resource_group_name = azurerm_resource_group.production_vnet.name

  security_rule {
    name                       = "allow-ssh"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

    security_rule {
    name                       = "allow-elastic"
    priority                   = 1010  
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "9200"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Associate NSG with the Elastic Subnet
resource "azurerm_subnet_network_security_group_association" "elastic_subnet_nsg" {
  subnet_id                 = azurerm_subnet.elastic.id
  network_security_group_id = azurerm_network_security_group.elastic_nsg.id
}