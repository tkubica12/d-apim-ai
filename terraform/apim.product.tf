resource "azapi_resource" "product_gold" {
  type      = "Microsoft.ApiManagement/service/products@2024-06-01-preview"
  name      = "gold"
  parent_id = azapi_resource.apim.id
  body = {
    properties = {
      displayName          = "Gold tier"
      description          = "Gold tier subscription includes unlimited access to the OpenAI API."
      subscriptionRequired = true
      approvalRequired     = false
      state                = "published"
    }
  }
}

resource "azapi_resource" "product_silver" {
  type      = "Microsoft.ApiManagement/service/products@2024-06-01-preview"
  name      = "silver"
  parent_id = azapi_resource.apim.id
  body = {
    properties = {
      displayName          = "Silver tier"
      description          = "Silver tier subscription includes 1000 tokens per minute to the OpenAI API."
      subscriptionRequired = true
      approvalRequired     = false
      state                = "published"
    }
  }
}

resource "azapi_resource" "product_caching" {
  type      = "Microsoft.ApiManagement/service/products@2024-06-01-preview"
  name      = "caching"
  parent_id = azapi_resource.apim.id
  body = {
    properties = {
      displayName          = "Caching tier"
      description          = "Caching tier subscription includes caching capabilities for the OpenAI API."
      subscriptionRequired = true
      approvalRequired     = false
      state                = "published"
    }
  }
}

# Associate API with products (product/apis child resource)
resource "azapi_resource" "product_gold_api_openai" {
  type      = "Microsoft.ApiManagement/service/products/apiLinks@2024-06-01-preview"
  name      = "openai-gold"
  parent_id = azapi_resource.product_gold.id
  body = {
    properties = {
      apiId = azapi_resource.openai_api.id
    }
  }
}

resource "azapi_resource" "product_silver_api_openai" {
  type      = "Microsoft.ApiManagement/service/products/apiLinks@2024-06-01-preview"
  name      = "openai-silver"
  parent_id = azapi_resource.product_silver.id
  body = {
    properties = {
      apiId = azapi_resource.openai_api.id
    }
  }
}

resource "azapi_resource" "product_caching_api_openai" {
  type      = "Microsoft.ApiManagement/service/products/apiLinks@2024-06-01-preview"
  name      = "openai-caching"
  parent_id = azapi_resource.product_caching.id
  body = {
    properties = {
      apiId = azapi_resource.openai_api.id
    }
  }
}
