# https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_zones
# Datasource: Get a list of Google Compute zones that are UP in a region
data "google_compute_zones" "available" {
  status = "UP"
  #region = "" (optional if provider default is set)
  region = var.region1
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_instance_group_manager
# Resource: Managed Instance Group
resource "google_compute_region_instance_group_manager" "app" {
  depends_on         = [google_compute_router_nat.nat1-new]
  name               = "app-mig"
  base_instance_name = "app"
  target_size = 2
   
   named_port {
    name = "http"
    port = 80
   }
  #region = "" (optional if provider default is set)

  # Compute zones to be used for VM creation
  distribution_policy_zones = data.google_compute_zones.available.names
  

  # Instance Template
  version {
    instance_template = google_compute_region_instance_template.seattle-app.id
  }

  # Named Port
  named_port {
    name = "webserver"
    port = 80
  }

  # Autohealing Config
  auto_healing_policies {
    health_check      = google_compute_health_check.hqseattle-health-check.id
    initial_delay_sec = 300
  }
}