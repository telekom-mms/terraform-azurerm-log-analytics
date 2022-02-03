/**
 * # log analytics
 *
 * This module manages Azure Log Analytics Workspace.
 *
*/
resource "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  for_each = var.log_analytics_workspace

  name                = local.log_analytics_workspace[each.key].name == "" ? each.key : local.log_analytics_workspace[each.key].name
  location            = local.log_analytics_workspace[each.key].location
  resource_group_name = local.log_analytics_workspace[each.key].resource_group_name
  sku                 = local.log_analytics_workspace[each.key].sku
  retention_in_days   = local.log_analytics_workspace[each.key].retention_in_days

  tags = local.log_analytics_workspace[each.key].tags
}
