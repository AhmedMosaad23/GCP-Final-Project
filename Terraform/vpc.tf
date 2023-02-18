resource "google_compute_network" "vpc_network" {
  name = "vpc-network"
  auto_create_subnetworks = false
}
#--------------mangment-subnet-------------
resource "google_compute_subnetwork" "management" {
    name="management"
    ip_cidr_range = "10.0.0.0/24"
    region = "us-central1"
    network = google_compute_network.vpc_network.id
    private_ip_google_access = "false"
    

  
}
#--------------restricted-subnet-------------
resource "google_compute_subnetwork" "restricted" {
  name = "restricted"
  ip_cidr_range = "10.0.1.0/24"
  region = "us-central1"
  network = google_compute_network.vpc_network.id
  private_ip_google_access = "true"
  

}
#---------------