resource "google_compute_instance" "hqseattle-vm" {
  description = "hqseattle-vm"
  name                         = var.subnetwork.hqseattle.name
  machine_type                 = "e2-micro"
  zone                         = var.subnetwork.hqseattle.zone


  boot_disk {
    initialize_params {
      image                    = "debian-cloud/debian-11"
      size                     = 10   
    }
  }

  network_interface {
    network                    = google_compute_network.main.id
    subnetwork                 = google_compute_subnetwork.hqseattle.id
    access_config {

      // Ephemeral IP
    }
  }

  metadata_startup_script      = file("./startup.sh")
#  file("${path.module}/startup.sh")
 
 }

 