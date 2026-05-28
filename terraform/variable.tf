variable "location" {
    description = "The Azure Region to deploy resources"
    type = string
    default = "Central India"
}

variable "cluster_name" {
    description = "The name of the AKS cluster"
    type        = string
    default     = "data-pipeline-aks"
}
