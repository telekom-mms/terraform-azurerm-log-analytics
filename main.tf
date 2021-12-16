/**
 * # log analytics
 *
 * This module manages Azure Log Analytics Workspace.
 *
*/
resource "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  for_each = var.resource_name

  name                = each.value
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = local.log_analytics_workspace.sku
  retention_in_days   = local.log_analytics_workspace.retention_in_days

  tags = {
    for tag in keys(local.tags) :
    tag => local.tags[tag]
  }
}
