locals {
  fe_app_name          = "${lower(var.resource_prefix)}-fe-app-${lower(replace(var.author, " ", "-"))}"
  be_app_name          = "${lower(var.resource_prefix)}-be-app-${lower(replace(var.author, " ", "-"))}"
  service_plan_name_fe = "${lower(var.resource_prefix)}-fe-service-plan-${lower(replace(var.author, " ", "-"))}"
  service_plan_name_be = "${lower(var.resource_prefix)}-be-service-plan-${lower(replace(var.author, " ", "-"))}"
  public_access        = true
  be_sku               = "B1" # B1 for basic with manual scaling, P1v3 for autoscaling with rules
  fe_sku               = "B1"
  fe_hostname          = "${local.fe_app_name}.azurewebsites.net"
  be_hostname          = "${local.be_app_name}.azurewebsites.net"
}

resource "azurerm_linux_web_app" "fe_app" {
  name                          = local.fe_app_name
  location                      = var.rg_location
  resource_group_name           = var.rg_name
  service_plan_id               = azurerm_service_plan.service_plan[local.service_plan_name_fe]
  virtual_network_subnet_id     = var.subnet_fe_id
  public_network_access_enabled = local.public_access

  depends_on = [var.subnet_fe_id]

  site_config {
    always_on = true
    application_stack {
      docker_image_name = "${var.fe_image_name}:${var.fe_tag}"
    }
    health_check_path                 = "/health"
    health_check_eviction_time_in_min = 5
  }
  app_settings = {
    "REACT_APP_API_URL" = "https://${local.be_hostname}/api"
  }

}
resource "azurerm_linux_web_app" "be_app" {
  name                          = local.be_app_name
  location                      = var.rg_location
  resource_group_name           = var.rg_name
  service_plan_id               = azurerm_service_plan.service_plan[local.service_plan_name_be]
  virtual_network_subnet_id     = var.subnet_be_id
  depends_on                    = [var.subnet_be_id]
  vnet_image_pull_enabled       = true
  public_network_access_enabled = local.public_access

  site_config {
    application_stack {
      docker_image_name   = "${var.be_image_name}:${var.be_tag}"
      docker_registry_url = "https://index.docker.io"
    }
    cors {
      allowed_origins = ["https://${local.fe_hostname}"]
    }
    health_check_path                 = "/health"
    health_check_eviction_time_in_min = 5

  }

  app_settings = {
    PORT                        = var.be_port
    NODE_ENV                    = "development"
    DB_SERVER                   = var.db_server
    DB_USER                     = var.db_user
    DB_PASSWORD                 = var.db_password
    DB_NAME                     = var.db_name
    CORS_ORIGIN                 = "https://${local.fe_hostname}"
    DB_ENCRYPT                  = "true"
    DB_TRUST_SERVER_CERTIFICATE = "false"
    DB_CONNECTION_TIMEOUT       = "30000"
    JWT_EXPIRES_IN              = "7d"
    RATE_LIMIT_WINDOW_MS        = "900000"
    RATE_LIMIT_MAX_REQUESTS     = "100"
    JWT_SECRET                  = "here-is-some-random-bs-long-text-string"
  }

}

resource "azurerm_service_plan" "service_plan" {
  for_each            = toset([local.service_plan_name_fe, local.service_plan_name_be])
  name                = each.value
  resource_group_name = var.rg_name
  location            = var.rg_location
  os_type             = "Linux"
  sku_name            = local.be_sku
}

