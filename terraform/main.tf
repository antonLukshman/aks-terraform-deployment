terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}  # Required for Azure provider
}

# Create a resource group to organize all Azure resources
resource "azurerm_resource_group" "aks_rg" {
  name     = var.resource_group_name
  location = var.location
}

# Create the Azure Kubernetes Service cluster
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name       = "default"
    node_count = var.node_count  # Number of VMs to run Kubernetes
    vm_size    = var.vm_size     # Size/type of the VMs
  }

  identity {
    type = "SystemAssigned"  # Secure identity management
  }

  network_profile {
    network_plugin    = "kubenet"    # Basic networking
    load_balancer_sku = "standard"
  }

  tags = {
    Environment = "Demo"
    Project     = "AKS-Assignment"
  }
}

# Save cluster credentials to a local file
resource "local_file" "kubeconfig" {
  depends_on = [azurerm_kubernetes_cluster.aks]
  filename   = "kubeconfig"
  content    = azurerm_kubernetes_cluster.aks.kube_config_raw
}