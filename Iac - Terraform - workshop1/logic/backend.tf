resource "azurerm_public_ip" "application_public_ip" {
  name                = "${local.naming_convention}-application-public-ip"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "back_nic" {
  name                = "${local.naming_convention}-back-nic"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name

  ip_configuration {
    name                          = "public"
    subnet_id                     = azurerm_subnet.subnet_backend.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine_scale_set" "vm_escale_set" {
  name                            = "${local.naming_convention}-vm-escale-set"
  resource_group_name             = azurerm_resource_group.resource_group.name
  location                        = azurerm_resource_group.resource_group.location
  sku                             = "Standard_F2"
  instances                       = 1
  admin_username                  = "camilo"
  admin_password                  = "#Camilo123"
  disable_password_authentication = false

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "${local.naming_convention}-net-inter"
    primary = true

    ip_configuration {
      name                                         = "internal"
      primary                                      = true
      subnet_id                                    = azurerm_subnet.subnet_backend.id
      application_gateway_backend_address_pool_ids = azurerm_application_gateway.application_gateway.backend_address_pool[*].id
    }
  }

}

resource "azurerm_application_gateway" "application_gateway" {
  name                = "${local.naming_convention}-app-gtw"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location

  sku {
    name     = "Standard_Small"
    tier     = "Standard"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "my-gateway-ip-configuration"
    subnet_id = azurerm_subnet.subnet_aplication_gateway.id
  }

  frontend_port {
    name = "App-gtw-frontend-port"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "App-gtw-front-ip-configuration"
    public_ip_address_id = azurerm_public_ip.application_public_ip.id
  }

  backend_address_pool {
    name = "App-gtw-backend-address-pool"
  }

  backend_http_settings {
    name                  = "App-gtw-backend-http-settings"
    cookie_based_affinity = "Disabled"
    path                  = "/path1/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = "App-gtw-backend-http-settings"
    frontend_ip_configuration_name = "App-gtw-front-ip-configuration"
    frontend_port_name             = "App-gtw-frontend-port"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "App-gtw-backend-routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "App-gtw-backend-http-settings"
    backend_address_pool_name  = "App-gtw-backend-address-pool"
    backend_http_settings_name = "App-gtw-backend-http-settings"
  }
}