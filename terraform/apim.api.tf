resource "azapi_resource" "openai_api" {
  type      = "Microsoft.ApiManagement/service/apis@2024-06-01-preview"
  name      = "openai-api"
  parent_id = azapi_resource.apim.id
  body = {
    properties = {
      displayName = "OpenAI API"
      path        = "openai"
      protocols   = ["https"]
      format      = "openapi+json"
      value       = file("${path.module}/openai_api_spec.json")
      apiRevision = "1"
      type        = "http"
    }
  }
}

resource "azapi_resource" "openai_api_diagnostics" {
  type      = "Microsoft.ApiManagement/service/apis/diagnostics@2024-06-01-preview"
  name      = "applicationinsights"
  parent_id = azapi_resource.openai_api.id
  body      = {
    properties = {
      alwaysLog               = "allErrors"
      loggerId                = azapi_resource.apim_logger_ai.id
      metrics                 = true
      httpCorrelationProtocol = "W3C"
      sampling = {
        percentage   = 100
        samplingType = "fixed"
      }
      verbosity = "information"
      frontend = {
        request = {
          body    = { bytes = 32 }
          headers = [ "content-type", "accept", "origin" ]
        }
        response = {
          body    = { bytes = 32 }
          headers = [ "content-type", "content-length", "origin" ]
        }
      }
      backend = {
        request = {
          body    = { bytes = 32 }
          headers = [ "content-type", "accept", "origin" ]
        }
        response = {
          body    = { bytes = 32 }
          headers = [ "content-type", "content-length", "origin" ]
        }
      }
    }
  }
}
