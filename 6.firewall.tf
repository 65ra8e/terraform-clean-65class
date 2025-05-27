resource "google_compute_firewall" "allow-ssh" {
  name                   = "allow-ssh"
  network                = google_compute_network.main.id
  
  allow {
    protocol       = "tcp"
    ports          = ["22"]
  }
    source_ranges  = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow-http" {
  name                   = "allow-web"
  network                = google_compute_network.main.id

  allow {
    protocol       = "tcp"
    ports          = ["80", "443"]
  }

  source_ranges    = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow-icmp" {
  name                   = "allow-icmp"
  network                = google_compute_network.main.id

  allow {
    protocol        = "icmp"
  }

  source_ranges     = ["0.0.0.0/0"]
}

 