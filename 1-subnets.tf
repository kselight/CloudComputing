resource "google_compute_subnetwork" "private_subnetwork" {
  name          = "argocd-subnetwork"
  ip_cidr_range = "10.2.0.0/16"
  network       = google_compute_network.private_network.id
  secondary_ip_range {
    range_name    = "services-range"
    ip_cidr_range = "192.168.1.0/24"
  }

  secondary_ip_range {
    range_name    = "pod-ranges"
    ip_cidr_range = "192.168.64.0/22"
  }
}

resource "google_compute_network" "private_network" {
  name                    = "argocd-network"
  auto_create_subnetworks = false
}