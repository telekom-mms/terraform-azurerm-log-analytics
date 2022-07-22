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

output "log_analytics_solution" {
  description = "azurerm_log_analytics_solution"
  value = {
    for log_analytics_solution in keys(azurerm_log_analytics_solution.log_analytics_solution) :
    log_analytics_solution => {
      id   = azurerm_log_analytics_solution.log_analytics_solution[log_analytics_solution].id
      name = azurerm_log_analytics_solution.log_analytics_solution[log_analytics_solution].name
    }
  }
}
