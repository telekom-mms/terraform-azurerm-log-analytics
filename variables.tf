variable "log_analytics_workspace" {
  type        = any
  default     = {}
  description = "resource definition, default settings are defined within locals and merged with var settings"
}
variable "log_analytics_solution" {
  type        = any
  default     = {}
  description = "resource definition, default settings are defined within locals and merged with var settings"
}

locals {
  default = {
    // resource definition
    log_analytics_workspace = {
      name                               = ""
      allow_resource_only_permissions    = null
      local_authentication_disabled      = null
      sku                                = null
      retention_in_days                  = 30 // defined default
      daily_quota_gb                     = null
      cmk_for_query_forced               = null
      internet_ingestion_enabled         = null
      internet_query_enabled             = null
      reservation_capacity_in_gb_per_day = null
      data_collection_rule_id            = null
      tags                               = {}
    }
    log_analytics_solution = {
      plan = {
        publisher      = "Microsoft" // defined default
        promotion_code = null
      }
      tags = {}
    }
  }

  // compare and merge custom and default values
  log_analytics_solution_values = {
    for log_analytics_solution in keys(var.log_analytics_solution) :
    log_analytics_solution => merge(local.default.log_analytics_solution, var.log_analytics_solution[log_analytics_solution])
  }

  // deep merge of all custom and default values
  log_analytics_workspace = {
    for log_analytics_workspace in keys(var.log_analytics_workspace) :
    log_analytics_workspace => merge(local.default.log_analytics_workspace, var.log_analytics_workspace[log_analytics_workspace])
  }
  log_analytics_solution = {
    for log_analytics_solution in keys(var.log_analytics_solution) :
    log_analytics_solution => merge(
      local.log_analytics_solution_values[log_analytics_solution],
      {
        for config in ["plan"] :
        config => merge(local.default.log_analytics_solution[config], local.log_analytics_solution_values[log_analytics_solution][config])
      }
    )
  }
}
