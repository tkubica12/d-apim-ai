# GenAI demos with Azure API Management

## GenAI Gateway in Azure API Management
- Two Azure AI Foundry instances with separate model deployments
- API Management providing OpenAI-compatible REST API to access the models with ability to manage subscriptions, apply policies, etc.
- Base policy to implement spillover from one Foundry instance to another when rate limit is hit.
- Gold product with no restrictions
- Silver product with rate limit and quota applied
- Caching policy to cache responses for highly similar prompts with Azure Managed Redis
- Metrics and logging
  
## MCP features in Azure API Management
- Simplistic "Say Hello" REST API built with FastAPI and containerized with Docker.
- Simplistic "Say Hello" MCP server built with FastMCP and containerized with Docker.
- Terraform to deploy Azure API Management Standard v2 and Say Hello API and MCP container apps in a Container Apps environment.

Demo flow:
- Deploy infrastructure with Terraform.
- Go to API version on `/docs` path, show how API works, copy link for OpenAPI definition.
- Go to API Management, create API from OpenAPI definition and disable subscription key requirement in Settings (for now).
- Go to MCP servers in API Management and create MCP server by exposing API as MCP
- Go to MCP servers in API Management and create API from existing MCP server pointing to one deployed in container app.
- In Visual Studio Code use GitHub Copilot, connect to both versions of MCP server on APIM and test out the chat experience.
- Explain policies and protect MCP better with rate limits, quotas, etc. 