resource "google_compute_global_forwarding_rule" "hqseattle-entry-point" {
  name                  = "hqseattle-entry-point"
  ip_protocol           = "TCP"
  target                = google_compute_target_http_proxy.hqseattle-proxy.id
  load_balancing_scheme = "EXTERNAL_MANAGED"
  port_range            = "80"
  depends_on            = [ google_compute_subnetwork.hqseattle ]
}

resource "google_compute_target_http_proxy" "hqseattle-proxy" {
  name                  = "hqseattle-proxy"
  url_map               = google_compute_url_map.hqseattle-url.id
}

resource "google_compute_url_map" "hqseattle-url" {
  name                  = "hqseattle-url"
  default_service       = google_compute_backend_service.hqseattle-backend.id
}

resource "google_compute_backend_service" "hqseattle-backend" {
  name                  = "hqseattle-backend"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  protocol              = "HTTP"
  timeout_sec           = 10
  health_checks         = [google_compute_health_check.hqseattle-health-check.id]
  enable_cdn            = true

    backend {
        group = google_compute_region_instance_group_manager.app.instance_group
        balancing_mode  = "UTILIZATION"
        capacity_scaler = 1.0
    }
}

resource "google_compute_health_check" "hqseattle-health-check" {
  name                  = "hqseattle-health-check"
  http_health_check {
     port_specification = "USE_SERVING_PORT"
     request_path        = "/"
     
  }

   
}