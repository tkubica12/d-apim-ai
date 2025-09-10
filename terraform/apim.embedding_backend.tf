resource "azapi_resource" "embeddings_backend" {
  name      = "embeddings-backend"
  type      = "Microsoft.ApiManagement/service/backends@2024-06-01-preview"
  parent_id = azapi_resource.apim.id

  body = {
    properties = {
      title    = "Embeddings Backend"
      url      = "${azapi_resource.ai_service_p1.output.properties.endpoints["OpenAI Language Model Instance API"]}openai/deployments/${azapi_resource.aiembeddings_p1.name}/embeddings"
      protocol = "http"
      credentials = {
        query  = {}
        header = {}
      }
      tls = {
        validateCertificateChain = true
        validateCertificateName  = true
      }
    }
  }
}
