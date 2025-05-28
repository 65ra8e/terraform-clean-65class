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


resource "google_compute_subnetwork" "tokyo2-proxy" {
  description = "regional-proxy"
  name                     = var.subnetwork.tokyo2-proxy.name
  ip_cidr_range            = var.subnetwork.tokyo2-proxy.ip_cidr_range
  region                   = var.subnetwork.tokyo2-proxy.region
  network                  = google_compute_network.main.id
  private_ip_google_access = true

}


# Regional Proxy-Only Subnet 
# Required for Regional Application Load Balancer for traffic offloading
resource "google_compute_subnetwork" "regional_proxy_subnet" {
  name          = "regional-proxy-subnet"
  region        = "us-west1"
  ip_cidr_range = "192.168.206.0/24"
  # This purpose reserves this subnet for regional Envoy-based load balancers
  purpose       = "REGIONAL_MANAGED_PROXY"
  network       = google_compute_network.main.id
  role          = "ACTIVE"
}


 


 
