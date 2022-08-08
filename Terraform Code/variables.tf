### GKE Cluster and Nodepool Specific Variables ###

variable "cluster_name" {
  description = "The name for the GKE cluster"
  type        = string
}
variable "env_name" {
  description = "The environment for the GKE cluster"
  type        = string
}
variable "region" {
  description = "The region to host the cluster in"
  type        = string
}
variable "zones" {
  description = "Cluster zone"
  type        = string
}
variable "minnode" {
  description = "Minimum number of node pool"
  type        = number
}
variable "maxnode" {
  description = "Maximum number of node pool"
  type        = number
}
variable "disksize" {
  description = "Disk Size in GB"
  type        = number
}
variable "poolname" {
  description = "Name of the pool"
  type        = string
}
variable "machine_type" {
  description = "Type of the node"
  type        = string
}
variable "preemptible" {
  description = "Can node be preemptible?"
  type        = string
}
variable "auto_repair" {
  description = "Can node be auto repaired?"
  type        = string
}
variable "auto_upgrade" {
  description = "Can node be auto upgraded?"
  type        = string
}
variable "project_id" {
  description = "Project ID"
  type        = string
}
variable "service-account-id" {
  description = "The ID of service account of GCP"
  type        = string
}

##### VPC & Subnet specific variables #####

variable "ip_range_pods_name" {
  description = "Pods IP range"
  type        = string
}
variable "ip_range_services_name" {
  description = "Services IP range"
  type        = string
}
variable "network" {
  description = "gcp network name"
  type        = string
}
variable "subnetwork" {
  description = "gcp subnet name"
  type        = string
}