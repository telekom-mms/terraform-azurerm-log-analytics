output "log_analytics_workspace" {
  description = "azurerm_log_analytics_workspace results"
  value = {
    for log_analytics_workspace in keys(azurerm_log_analytics_workspace.log_analytics_workspace) :
    log_analytics_workspace => {
      id   = azurerm_log_analytics_workspace.log_analytics_workspace[log_analytics_workspace].id
      name = azurerm_log_analytics_workspace.log_analytics_workspace[log_analytics_workspace].name
    }
  }
}
