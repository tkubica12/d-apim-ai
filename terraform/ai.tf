// Foundry resources
resource "azapi_resource" "ai_service_p1" {
  type      = "Microsoft.CognitiveServices/accounts@2025-04-01-preview"
  name      = "aidemo-p1-resource-${local.base_name}"
  location  = azurerm_resource_group.main.location
  parent_id = azurerm_resource_group.main.id

  identity {
    type = "SystemAssigned"
  }

  body = {
    name = "aidemo-p1-resource-${local.base_name}"
    properties = {
      allowProjectManagement = true
      customSubDomainName    = "p1-${local.base_name}"
    }
    kind = "AIServices"
    sku = {
      name = "S0"
    }
  }
  response_export_values = ["*"]
}

resource "azapi_resource" "ai_service_p2" {
  type      = "Microsoft.CognitiveServices/accounts@2025-04-01-preview"
  name      = "aidemo-p2-resource-${local.base_name}"
  location  = azurerm_resource_group.main.location
  parent_id = azurerm_resource_group.main.id

  identity {
    type = "SystemAssigned"
  }

  body = {
    name = "aidemo-p2-resource-${local.base_name}"
    properties = {
      allowProjectManagement = true
      customSubDomainName    = "p2-${local.base_name}"
    }
    kind = "AIServices"
    sku = {
      name = "S0"
    }
  }
  response_export_values = ["*"]
}

// Foundry projects
resource "azapi_resource" "ai_project_p1" {
  type      = "Microsoft.CognitiveServices/accounts/projects@2025-04-01-preview"
  name      = "aidemo-p1-${local.base_name}"
  location  = azurerm_resource_group.main.location
  parent_id = azapi_resource.ai_service_p1.id

  identity {
    type = "SystemAssigned"
  }

  body = {
    properties = {}
  }
}

resource "azapi_resource" "ai_project_p2" {
  type      = "Microsoft.CognitiveServices/accounts/projects@2025-04-01-preview"
  name      = "aidemo-p2-${local.base_name}"
  location  = azurerm_resource_group.main.location
  parent_id = azapi_resource.ai_service_p2.id

  identity {
    type = "SystemAssigned"
  }

  body = {
    properties = {}
  }
}

