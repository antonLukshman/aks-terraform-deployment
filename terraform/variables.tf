variable "resource_group_name" {
  description = "Name of the resource group"
  default     = "aks-terraform-deployment"
}

variable "location" {
  description = "Azure region for resources"
  default     = "eastus"  # Choose your region
}

variable "cluster_name" {
  description = "Name of the AKS cluster"
  default     = "aks-demo-cluster"
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster"
  type        = string
  default     = "aks-assignment"
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  default     = "1.30.10"  # Stable version
}

variable "node_count" {
  description = "Number of nodes in the cluster"
  default     = 1  # Minimum for cost savings
}

variable "vm_size" {
  description = "Size of the VMs"
  default     = "Standard_B2s"  # Budget-friendly size
}