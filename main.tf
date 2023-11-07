/**
* # log_analytics
*
* This module manages the hashicorp/azurerm log analytics resources.
* For more information see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs > log analytics
*
*/

resource "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  for_each = var.log_analytics_workspace

  name                               = local.log_analytics_workspace[each.key].name == "" ? each.key : local.log_analytics_workspace[each.key].name
  location                           = local.log_analytics_workspace[each.key].location
  resource_group_name                = local.log_analytics_workspace[each.key].resource_group_name
  allow_resource_only_permissions    = local.log_analytics_workspace[each.key].allow_resource_only_permissions
  local_authentication_disabled      = local.log_analytics_workspace[each.key].local_authentication_disabled
  sku                                = local.log_analytics_workspace[each.key].sku
  retention_in_days                  = local.log_analytics_workspace[each.key].retention_in_days
  daily_quota_gb                     = local.log_analytics_workspace[each.key].daily_quota_gb
  cmk_for_query_forced               = local.log_analytics_workspace[each.key].cmk_for_query_forced
  internet_ingestion_enabled         = local.log_analytics_workspace[each.key].internet_ingestion_enabled
  internet_query_enabled             = local.log_analytics_workspace[each.key].internet_query_enabled
  reservation_capacity_in_gb_per_day = local.log_analytics_workspace[each.key].reservation_capacity_in_gb_per_day
  data_collection_rule_id            = local.log_analytics_workspace[each.key].data_collection_rule_id
  tags                               = local.log_analytics_workspace[each.key].tags
}

resource "azurerm_log_analytics_solution" "log_analytics_solution" {
  for_each = var.log_analytics_solution

  solution_name         = local.log_analytics_solution[each.key].solution_name
  location              = local.log_analytics_solution[each.key].location
  resource_group_name   = local.log_analytics_solution[each.key].resource_group_name
  workspace_resource_id = local.log_analytics_solution[each.key].workspace_resource_id
  workspace_name        = local.log_analytics_solution[each.key].workspace_name

  plan {
    publisher      = local.log_analytics_solution[each.key].plan.publisher
    product        = local.log_analytics_solution[each.key].plan.product
    promotion_code = local.log_analytics_solution[each.key].plan.promotion_code
  }

  tags = local.log_analytics_solution[each.key].tags
}
