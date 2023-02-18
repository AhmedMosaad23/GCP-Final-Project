resource "google_container_cluster" "primary" {
  name     = "primary"
  location = "us-central1"
  remove_default_node_pool = true
  initial_node_count       = 1
  network = google_compute_network.vpc_network.id
  subnetwork = google_compute_subnetwork.restricted.id
  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes = true
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }

}

resource "google_container_node_pool" "node-pool" {
  name       = "node-pool"
  location   = "us-central1"
  cluster    = google_container_cluster.primary.id
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-small"
    service_account = google_service_account.gcp-my-service.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}