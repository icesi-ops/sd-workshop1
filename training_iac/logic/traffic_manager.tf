resource "azurerm_traffic_manager_profile" "traffic_manager" {
  name                   = "${local.naming_convention}-tf"
  resource_group_name    = azurerm_resource_group.resource_group.name
  traffic_routing_method = var.traffic_routing_method

  dns_config {
    relative_name = "tf-jhonnier-lb"
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
  //provider = azurerm.tfprovider
  name                = "${local.naming_convention}-tf-endpoint"
  resource_group_name = azurerm_resource_group.resource_group.name
  profile_name        = azurerm_traffic_manager_profile.traffic_manager.name
  type                = "azureEndpoints"
  target_resource_id = "/subscriptions/15f19f56-2173-49e3-93a0-832503a55689/resourceGroups/${azurerm_resource_group.resource_group.name}/providers/Microsoft.Network/publicIPAddresses/${azurerm_public_ip.public_ip_lb.name}"
  //target_resource_id  = azurerm_public_ip.public_ip_lb.id
  weight              = 100
}