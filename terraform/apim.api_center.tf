resource "azapi_resource" "api_center" {
	type      = "Microsoft.ApiCenter/services@2024-06-01-preview"
	name      = "apic-${local.base_name}"
	parent_id = azurerm_resource_group.main.id
	location  = azurerm_resource_group.main.location
	schema_validation_enabled = false

	body = {
		properties = {
			displayName = "API Center ${local.base_name}"
		}
		sku = {
			name = "Free"
		}
	}
}

output "api_center_name" {
	value = azapi_resource.api_center.name
}

output "api_center_id" {
	value = azapi_resource.api_center.id
}
