module "log-analytics" {
  source              = "../terraform-log-analytics"
  location            = "westeurope"
  resource_group_name = "service-mgmt-rg"
  resource_name       = ["service-monitor-loganalytics-workspace"]
  tags = {
    service = "service_name"
  }
}
