resource "azapi_resource" "aimodel_p1" {
  type      = "Microsoft.CognitiveServices/accounts/deployments@2024-10-01"
  name      = "gpt-4.1"
  parent_id = azapi_resource.ai_service_p1.id

  body = {
    sku = {
      name     = "GlobalStandard"
      capacity = 5
    }
    properties = {
      model = {
        name    = "gpt-4.1"
        format  = "OpenAI"
        version = "2025-04-14"
      }
    }
  }
}

resource "azapi_resource" "aimodel_p2" {
  type      = "Microsoft.CognitiveServices/accounts/deployments@2024-10-01"
  name      = "gpt-4.1"
  parent_id = azapi_resource.ai_service_p2.id

  body = {
    sku = {
      name     = "GlobalStandard"
      capacity = 5
    }
    properties = {
      model = {
        name    = "gpt-4.1"
        format  = "OpenAI"
        version = "2025-04-14"
      }
    }
  }
}

resource "azapi_resource" "aiembeddings_p1" {
  type      = "Microsoft.CognitiveServices/accounts/deployments@2024-10-01"
  name      = "text-embedding-3-large"
  parent_id = azapi_resource.ai_service_p1.id

  body = {
    sku = {
      name     = "Standard"
      capacity = 50
    }
    properties = {
      model = {
        name    = "text-embedding-3-large"
        format  = "OpenAI"
        version = "1"
      }
    }
  }
}
