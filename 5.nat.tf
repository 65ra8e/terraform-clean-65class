# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat
resource "google_compute_router_nat" "nat1-new" {
  name                               = "nat1-new"
  router                             = google_compute_router.router.name
  region                             = var.region1

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option             = "MANUAL_ONLY"

  subnetwork {
    name                             = google_compute_subnetwork.hqseattle.id
    source_ip_ranges_to_nat          = ["ALL_IP_RANGES"]
  }

  nat_ips = [google_compute_address.nat1-new.self_link]
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address
resource "google_compute_address" "nat1-new" {
  description = "seattle-nat1"
  name                               = "nat1-new"
  address_type                       = "EXTERNAL"
  network_tier                       = "PREMIUM"
  region                             = var.region1

  
}


 