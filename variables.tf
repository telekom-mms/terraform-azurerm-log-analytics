variable "resource_name" {
  type        = set(string)
  default     = []
  description = "Azure Log Analytics Workspace"
}
variable "location" {
  type        = string
  description = "location where the resource should be created"
}
variable "resource_group_name" {
  type        = string
  description = "resource_group whitin the resource should be created"
}
variable "tags" {
  type        = any
  default     = {}
  description = "mapping of tags to assign, default settings are defined within locals and merged with var settings"
}
# resource definition
variable "log_analytics_workspace" {
  type        = any
  default     = {}
  description = "resource definition, default settings are defined within locals and merged with var settings"
}

locals {
  default = {
    tags = {}
    # resource definition
    log_analytics_workspace = {
      sku               = "PerGB2018"
      retention_in_days = 30
    }
  }

  # merge custom and default values
  tags                    = merge(local.default.tags, var.tags)
  log_analytics_workspace = merge(local.default.log_analytics_workspace, var.log_analytics_workspace)
}
