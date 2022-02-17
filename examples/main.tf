module "log_analytics" {
  source = "registry.terraform.io/T-Systems-MMS/log-analytics/azurerm"
  log_analytics_workspace = {
    service-monitor-loganalytics-workspace = {
      location            = "westeurope"
      resource_group_name = "service-mgmt-rg"
      tags = {
        service = "service_name"
      }
    }
  }
}
