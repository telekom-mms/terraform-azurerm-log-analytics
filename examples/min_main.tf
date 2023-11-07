module "log_analytics" {
  source = "registry.terraform.io/telekom-mms/log-analytics/azurerm"
  log_analytics_workspace = {
    logmms = {
      location            = "westeurope"
      resource_group_name = "rg-mms-github"
    }
  }
  log_analytics_solution = {
    container = {
      solution_name         = "ContainerInsights"
      resource_group_name   = "rg-mms-github"
      location              = "westeurope"
      workspace_resource_id = module.log_analytics.log_analytics_workspace["logmms"].id
      workspace_name        = module.log_analytics.log_analytics_workspace["logmms"].name
      plan = {
        product = "OMSGallery/ContainerInsights"
      }
    }
  }
}
