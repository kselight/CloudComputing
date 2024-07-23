resource "google_container_cluster" "cluster1" {
  name                     = var.cluster_name
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = google_compute_network.private_network.id
  subnetwork               = google_compute_subnetwork.private_subnetwork.id

  ip_allocation_policy {
    cluster_secondary_range_name  = "pod-ranges"
    services_secondary_range_name = google_compute_subnetwork.private_subnetwork.secondary_ip_range.0.range_name
  }
}
