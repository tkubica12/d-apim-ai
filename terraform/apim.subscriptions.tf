// API Management subscriptions (products: silver, gold, caching)
// Assumption: using built-in administrator user (user id '1') as owner. Adjust ownerId if you create a dedicated user.

resource "azapi_resource" "subscription_silver" {
  type      = "Microsoft.ApiManagement/service/subscriptions@2024-06-01-preview"
  name      = "sub-silver"
  parent_id = azapi_resource.apim.id

  body = {
    properties = {
      displayName = "Silver subscription"
      scope       = azapi_resource.product_silver.id
      ownerId     = "${azapi_resource.apim.id}/users/1"
      state       = "active" // other values: suspended, expired, submitted, rejected, cancelled
    }
  }
}

resource "azapi_resource" "subscription_gold" {
  type      = "Microsoft.ApiManagement/service/subscriptions@2024-06-01-preview"
  name      = "sub-gold"
  parent_id = azapi_resource.apim.id

  body = {
    properties = {
      displayName = "Gold subscription"
      scope       = azapi_resource.product_gold.id
      ownerId     = "${azapi_resource.apim.id}/users/1"
      state       = "active"
    }
  }
}

resource "azapi_resource" "subscription_caching" {
  type      = "Microsoft.ApiManagement/service/subscriptions@2024-06-01-preview"
  name      = "sub-caching"
  parent_id = azapi_resource.apim.id

  body = {
    properties = {
      displayName = "Caching subscription"
      scope       = azapi_resource.product_caching.id
      ownerId     = "${azapi_resource.apim.id}/users/1"
      state       = "active"
    }
  }
}


