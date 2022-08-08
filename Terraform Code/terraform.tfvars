### GKE Cluster & Nodepool Specific ###

env_name     = "interview"
cluster_name = "gke-terraform"
region       = "europe-west2"
zones        = "europe-west2-c"
minnode      = 1
maxnode      = 3
disksize     = 10
poolname     = "temp-node-pool"
machine_type = "n2-standard-2"
preemptible  = "false"
auto_repair  = "false"
auto_upgrade = "true"
project_id             = "my-new-project-306618"
service-account-id     = "terraform@my-new-project-306618.iam.gserviceaccount.com"

### VPC & Subnet specific Variables ####

ip_range_pods_name     = "europe-west2-01"
ip_range_services_name = "europe-west2-02"
network                = "gcp-network"
subnetwork             = "gcp-subnet"