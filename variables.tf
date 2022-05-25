variable "log_analytics_workspace" {
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
  }

  # compare and merge custom and default values
  # merge all custom and default values
  log_analytics_workspace = {
    for log_analytics_workspace in keys(var.log_analytics_workspace) :
    log_analytics_workspace => merge(local.default.log_analytics_workspace, var.log_analytics_workspace[log_analytics_workspace])
  }
}
