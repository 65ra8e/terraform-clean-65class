# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_instance_template
# https://developer.hashicorp.com/terraform/language/functions/file
# Google Compute Engine: Regional Instance Template
resource "google_compute_region_instance_template" "tokyo-app" {
  name         = "tokyo-app"
  description  = "This template is used to clone lizzo"
  machine_type = "e2-medium"
  region = var.region2 

  # Create a new disk from an image and set as boot disk
  disk {
    source_image = "debian-cloud/debian-12"
    boot         = true
  }

  # Network Configurations 
  network_interface {
    subnetwork = google_compute_subnetwork.tokyo-proxy.id
    /*access_config {
      # Include this section to give the VM an external IP address
    } */
  }

  # Install Webserver using file() function
  metadata_startup_script = file("./startup.sh")
}


 
resource "google_compute_region_instance_template" "seattle-app" {
  name         = "seattle-app"
  description  = "This template is used to clone lizzo"
  machine_type = "e2-medium"
  region = var.region1 

   
  disk {
    source_image = "debian-cloud/debian-12"
    boot         = true
  }

  
  network_interface {
    subnetwork = google_compute_subnetwork.hqseattle.id
    
  }


  metadata_startup_script = file("./startup.sh")
}


# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_instance_template
# https://developer.hashicorp.com/terraform/language/functions/file
# Google Compute Engine: Regional Instance Template
resource "google_compute_region_instance_template" "tokyo2-app" {
  name         = "tokyo2-app"
  description  = "This template is used to clone lizzo"
  machine_type = "e2-medium"
  region = var.region2 

  # Create a new disk from an image and set as boot disk
  disk {
    source_image = "debian-cloud/debian-12"
    boot         = true
  }

  # Network Configurations 
  network_interface {
    subnetwork = google_compute_subnetwork.tokyo2-proxy.id
    /*access_config {
      # Include this section to give the VM an external IP address
    } */
  }

  # Install Webserver using file() function
  metadata_startup_script = file("./startup.sh")
}