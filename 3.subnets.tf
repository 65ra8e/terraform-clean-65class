resource "google_compute_subnetwork" "hqseattle" {
  description = "hqinternal"
  name                     = var.subnetwork.hqseattle.name
  ip_cidr_range            = var.subnetwork.hqseattle.ip_cidr_range
  region                   = var.subnetwork.hqseattle.region           
  network                  = google_compute_network.main.id
  private_ip_google_access = true
   

}

resource "google_compute_subnetwork" "tokyo-proxy" {
  description = "regional-proxy"
  name                     = var.subnetwork.tokyo-proxy.name
  ip_cidr_range            = var.subnetwork.tokyo-proxy.ip_cidr_range
  region                   = var.subnetwork.tokyo-proxy.region
  network                  = google_compute_network.main.id
  private_ip_google_access = true

}

 


 
