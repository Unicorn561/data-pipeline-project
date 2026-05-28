# 1. Create a Resource Group (a logical container for Azure resources)
resource "azurerm_resource_group" "rg" {
  name     = "data-pipeline-rg"
  location = var.location
}

# 2. Create the Kubernetes Cluster (AKS)
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "datapipeline"

  # Define the worker nodes (the virtual machines running your containers)
  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s" # A smaller, cheaper VM size for practice
  }

  # Automatically manage security credentials
  identity {
    type = "SystemAssigned"
  }
}
