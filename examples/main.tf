module "log_analytics" {
  source = "../terraform-log-analytics"
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
