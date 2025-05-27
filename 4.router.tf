resource "google_compute_router" "router" {
  description = "seattle-router"
  name    = "router"
  network = google_compute_network.main.id
  region  = var.region1
  
}

 