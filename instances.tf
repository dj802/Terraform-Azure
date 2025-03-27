#INSTANCES
#https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine
#https://wiki.debian.org/Cloud/MicrosoftAzure

resource "azurerm_linux_virtual_machine" "elastic01" {
  name                = "elastic01"
  resource_group_name = azurerm_resource_group.production_vnet.name
  location            = azurerm_resource_group.production_vnet.location
  size                = "Standard_B1s"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.elastic01.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }


  source_image_reference {
    publisher = "debian"
    offer     = "debian-12"
    sku       = "12-gen2"
    version   = "latest"
  }

  tags = {
    environment = var.environment
  }

}

resource "azurerm_linux_virtual_machine" "elastic02" {
  name                = "elastic02"
  resource_group_name = azurerm_resource_group.production_vnet.name
  location            = azurerm_resource_group.production_vnet.location
  size                = "Standard_B1s"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.elastic02.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }


  source_image_reference {
    publisher = "debian"
    offer     = "debian-12"
    sku       = "12-gen2"
    version   = "latest"
  }

  tags = {
    environment = var.environment
  }

}

resource "azurerm_linux_virtual_machine" "nsc01" {
  name                = "nsc01"
  resource_group_name = azurerm_resource_group.production_vnet.name
  location            = azurerm_resource_group.production_vnet.location
  size                = "Standard_B1s"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.nsc01.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }


  source_image_reference {
    publisher = "debian"
    offer     = "debian-12"
    sku       = "12-gen2"
    version   = "latest"
  }

  tags = {
    environment = var.environment
  }
}




