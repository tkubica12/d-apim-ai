// Azure API Management Standard v2 (no VNet integration)
// Deployed using AzAPI because StandardV2 currently requires latest API version.

resource "azapi_resource" "apim" {
  # Using latest version supported by current azapi provider (2024-06-01-preview) instead of 2024-10-01-preview which failed schema validation
  type      = "Microsoft.ApiManagement/service@2024-06-01-preview"
  name      = "apim-${local.base_name}"
  parent_id = azurerm_resource_group.main.id
  location  = azurerm_resource_group.main.location

  identity {
    type = "SystemAssigned"
  }

  body = {
    properties = {
      publisherName       = "Contoso"
      publisherEmail      = "admin@contoso.com"
      publicNetworkAccess = "Enabled"
      virtualNetworkType  = "None"
    }
    sku = {
      name     = "StandardV2"
      capacity = 1
    }
  }
}

# APIM Logger (Application Insights) via AzAPI
resource "azapi_resource" "apim_logger_ai" {
  type      = "Microsoft.ApiManagement/service/loggers@2024-05-01"
  name      = "appinsights"
  parent_id = azapi_resource.apim.id

  body = {
    properties = {
      loggerType  = "applicationInsights"
      description = "Application Insights logger with system-assigned identity"
      resourceId  = azurerm_application_insights.main.id
      credentials = {
        connectionString = azurerm_application_insights.main.connection_string
        identityClientId = "SystemAssigned"
      }
    }
  }
}

# APIM External Cache (Redis Enterprise) via AzAPI
resource "azapi_resource" "apim_cache_default" {
  type      = "Microsoft.ApiManagement/service/caches@2024-06-01-preview"
  name      = "default"
  parent_id = azapi_resource.apim.id
  body = {
    properties = {
      connectionString = local.redis_connection_string
      description       = "External Redis Enterprise cache"
      useFromLocation   = "default"
    }
  }
}

output "apim_logger_name" {
  value = azapi_resource.apim_logger_ai.name
}

output "apim_name" {
  value = azapi_resource.apim.name
}

output "apim_id" {
  value = azapi_resource.apim.id
}
