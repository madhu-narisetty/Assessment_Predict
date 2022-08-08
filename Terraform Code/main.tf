terraform {
  required_providers {
    google = {
      source  = "registry.terraform.io/hashicorp/google"
      version = "~> 4.29.0"
    }
  }
}
provider "google" {

  credentials = file("originalkeyfilename.json")
  project     = "my-new-project-306618"
  region      = "europe-west2"
  zone        = "europe-west2-c"
}

provider "google-beta" {
  credentials = file("originalkeyfilename.json")
  project     = "my-new-project-306618"
}

terraform {
    backend gcs {
        bucket = "predictx-interview-004-bucket2"
        prefix = "terraform/gkecreationstate"
        credentials = "originalkeyfilename.json"

    }
}

module "gke_cluster_interview" {
  source            = "./terraform-google-kubernetes-engine-master"
  name              = "${var.cluster_name}-${var.env_name}"
  project_id        = var.project_id
  regional          = "false"
  region            = var.region
  zones             = ["europe-west2-c"]
  network           = module.gcp-network-interview.network_name
  subnetwork        = module.gcp-network-interview.subnets_names[0]
  ip_range_pods     = var.ip_range_pods_name
  ip_range_services = var.ip_range_services_name
  node_pools = [
    {
      name           = var.poolname
      machine_type   = var.machine_type
      node_locations = var.zones
      min_count      = var.minnode
      max_count      = var.maxnode
      disk_size_gb   = var.disksize
      preemptible    = var.preemptible
      auto_repair    = var.auto_repair
      auto_upgrade   = var.auto_upgrade
    },
  ]
}
module "gcp-network-interview" {
  source       = "./terraform-google-network-master"
  project_id   = var.project_id
  network_name = "${var.network}-${var.env_name}"
  subnets = [
    {
      subnet_name   = "${var.subnetwork}-${var.env_name}"
      subnet_ip     = "192.168.0.0/16"
      subnet_region = var.region
    },
  ]
  secondary_ranges = {
    "${var.subnetwork}-${var.env_name}" = [
      {
        range_name    = var.ip_range_pods_name
        ip_cidr_range = "10.0.1.0/24"
      },
      {
        range_name    = var.ip_range_services_name
        ip_cidr_range = "10.0.2.0/24"
      },
    ]
  }
}