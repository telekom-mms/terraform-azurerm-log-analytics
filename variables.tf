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
    # resource definition
    log_analytics_workspace = {
      name                               = ""
      sku                                = "PerGB2018"
      retention_in_days                  = 30
      daily_quota_gb                     = -1
      internet_ingestion_enabled         = null
      internet_query_enabled             = null
      reservation_capacity_in_gb_per_day = null
      tags                               = {}
    }
    log_analytics_solution = {
      solution_name = ""
      plan = {
        publisher      = "Microsoft"
        promotion_code = null
      }
    }
  }

  # compare and merge custom and default values
  log_analytics_solution_values = {
    for log_analytics_solution in keys(var.log_analytics_solution) :
    log_analytics_solution => merge(local.default.log_analytics_solution, var.log_analytics_solution[log_analytics_solution])
  }

  # merge all custom and default values
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
