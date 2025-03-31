output "resource_group_name" {
  value = azurerm_resource_group.aks_rg.name  # Name of the created resource group
}

output "kubernetes_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name  # Name of the created AKS cluster
}

output "host" {
  value     = azurerm_kubernetes_cluster.aks.kube_config.0.host  # Kubernetes API server address
  sensitive = true  # Hidden in output for security
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate
  sensitive = true  # Contains sensitive authentication data
}

output "client_key" {
  value     = azurerm_kubernetes_cluster.aks.kube_config.0.client_key
  sensitive = true  # Contains sensitive authentication data
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw  # Complete configuration for kubectl
  sensitive = true  # Contains all authentication details
}

output "kubeconfig_path" {
  value = local_file.kubeconfig.filename  # Location of the saved kubeconfig file
}