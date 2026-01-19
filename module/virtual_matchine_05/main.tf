resource "azurerm_network_interface" "vm1" {
  name                ="nic1"
  location            = "west europe"
  resource_group_name = "rg_ranjeet2"

  ip_configuration {
    public_ip_address_id = data.azurerm_public_ip.public_data.id
    name                          = "PIPrs1"
    subnet_id                     = data.azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vms" {
  name                = "VM2"
  resource_group_name = "rg_ranjeet2"
  location            = "west europe"
  size                = "Standard_D2s_v5"
  admin_username      = "adminuser"
  admin_password = "Ranjeet@1234"
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.vm1.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
data "azurerm_public_ip" "public_data" {
  name                = "PIPrs1"
  resource_group_name = "rg_ranjeet2"
}


data "azurerm_subnet" "subnet1" {
  name                 = "subnet_r"
  virtual_network_name = "azadvnet"
  resource_group_name  = "rg_ranjeet2"
}
