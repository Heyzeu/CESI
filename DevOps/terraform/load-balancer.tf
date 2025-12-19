# IP globale pour le Load Balancer
resource "google_compute_global_address" "lb_ip" {
  name = "http-lb-ip"
}

# Backend service utilisant le MIG
resource "google_compute_backend_service" "web_backend" {
  name        = "web-backend-service"
  protocol    = "HTTP"
  port_name   = "http"
  timeout_sec = 30

  health_checks = [
    google_compute_health_check.http_healthcheck.self_link
  ]

  backend {
    group = google_compute_instance_group_manager.web_igm.instance_group
  }
}

# URL Map
resource "google_compute_url_map" "web_url_map" {
  name            = "web-url-map"
  default_service = google_compute_backend_service.web_backend.self_link
}

# HTTP Proxy
resource "google_compute_target_http_proxy" "web_http_proxy" {
  name    = "web-http-proxy"
  url_map = google_compute_url_map.web_url_map.self_link
}

# Forwarding Rule globale (HTTP)
resource "google_compute_global_forwarding_rule" "http_forwarding_rule" {
  name                  = "http-forwarding-rule"
  ip_protocol           = "TCP"
  port_range            = "${var.lb_port}"
  target                = google_compute_target_http_proxy.web_http_proxy.self_link
  load_balancing_scheme = "EXTERNAL"
  ip_address            = google_compute_global_address.lb_ip.address
}
