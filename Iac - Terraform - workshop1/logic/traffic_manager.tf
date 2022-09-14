resource "azurerm_traffic_manager_profile" "traffic_manager" {

  name                   = "${local.naming_convention}-tf"
  resource_group_name    = azurerm_resource_group.resource_group.name
  traffic_routing_method = var.traffic_routing_method

  dns_config {
    relative_name = "tf-camilo-lb"
    ttl           = 100
  }

  monitor_config {
    protocol                     = "HTTP"
    port                         = 80
    path                         = "/"
    interval_in_seconds          = 30
    timeout_in_seconds           = 9
    tolerated_number_of_failures = 3
  }
}

resource "azurerm_traffic_manager_endpoint" "endpoint" {
  name                = "${local.naming_convention}-tf-endpoint"
  resource_group_name = azurerm_resource_group.resource_group.name
  profile_name        = azurerm_traffic_manager_profile.traffic_manager.name
  type                = var.endpoint_type
  weight              = 100
  target_resource_id  = "/subscriptions/6a80b331-b4e3-4f3a-bd69-c06978f9efd7/resourceGroups/${azurerm_resource_group.resource_group.name}/providers/Microsoft.Network/publicIPAddresses/${azurerm_public_ip.public_ip_lb.name}"
}

