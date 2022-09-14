//Archivo para la creación de la database que usaremos. En este caso es Redis

resource "azurerm_redis_cache" "redis" {
  name                = "${local.naming_convention}-redisdb"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  capacity            = 2
  family              = "C"
  sku_name            = "Standard"
  enable_non_ssl_port = false
  minimum_tls_version = "1.2"

  redis_configuration {
  }
}
