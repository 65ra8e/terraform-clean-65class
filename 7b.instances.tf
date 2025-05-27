resource "google_compute_instance" "tokyo-proxy-vm" {
  description = "app-templet-terraform"
  name                         = var.subnetwork.tokyo-proxy.name
  machine_type                 = "e2-micro"
  zone                         = var.subnetwork.tokyo-proxy.zone


  boot_disk {
    initialize_params {
      image                    = "debian-cloud/debian-11"
      size                     = 10   
    }
  }

  network_interface {
    network                    = google_compute_network.main.id
    subnetwork                 = google_compute_subnetwork.tokyo-proxy.id
    access_config {

      // Ephemeral IP
    }
  }

  metadata_startup_script      = file("./startup.sh")

 
}