output "log_analytics_workspace" {
  description = "Outputs all attributes of resource_type."
  value = {
    for log_analytics_workspace in keys(azurerm_log_analytics_workspace.log_analytics_workspace) :
    log_analytics_workspace => {
      for key, value in azurerm_log_analytics_workspace.log_analytics_workspace[log_analytics_workspace] :
      key => value
    }
  }
}

output "log_analytics_solution" {
  description = "Outputs all attributes of resource_type."
  value = {
    for log_analytics_solution in keys(azurerm_log_analytics_solution.log_analytics_solution) :
    log_analytics_solution => {
      for key, value in azurerm_log_analytics_solution.log_analytics_solution[log_analytics_solution] :
      key => value
    }
  }
}

output "variables" {
  description = "Displays all configurable variables passed by the module. __default__ = predefined values per module. __merged__ = result of merging the default values and custom values passed to the module"
  value = {
    default = {
      for variable in keys(local.default) :
      variable => local.default[variable]
    }
    merged = {
      log_analytics_workspace = {
        for key in keys(var.log_analytics_workspace) :
        key => local.log_analytics_workspace[key]
      }
      log_analytics_solution = {
        for key in keys(var.log_analytics_solution) :
        key => local.log_analytics_solution[key]
      }
    }
  }
}
