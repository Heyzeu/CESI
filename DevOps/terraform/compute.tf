# Compte de service
resource "google_service_account" "default_sa" {
  account_id   = "compute-default-sa"
  display_name = "Default Compute Service Account"
}

# Template d'instance avec script startup
resource "google_compute_instance_template" "web_template" {
  name_prefix  = "web-tpl-"
  machine_type = var.instance_machine_type

  service_account {
    email  = google_service_account.default_sa.email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  disk {
    source_image = "projects/debian-cloud/global/images/family/debian-12"
    auto_delete  = true
    boot         = true
  }

  network_interface {
    network    = google_compute_network.vpc.id
    subnetwork = google_compute_subnetwork.subnet.id

    # Pas d'IP publique; l'accès sortant passe par le NAT
  }

  metadata = {
    startup-script = file("${path.module}/scripts/startup.sh")
  }

  tags = ["web-server"]
}

# Health Check (HTTP)
resource "google_compute_health_check" "http_healthcheck" {
  name = "web-http-healthcheck"

  http_health_check {
    port = 80
  }

  check_interval_sec  = 10
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 2
}

# Instance Group (groupe d'instances géré)
resource "google_compute_instance_group_manager" "web_igm" {
  name               = "web-igm"
  base_instance_name = "web"
  zone               = var.zone

  version {
    instance_template = google_compute_instance_template.web_template.self_link
  }

  target_size = var.instance_group_size_min

  named_port {
    name = "http"
    port = 80
  }
}

# Autoscaler
resource "google_compute_autoscaler" "web_autoscaler" {
  name   = "web-autoscaler"
  zone   = var.zone
  target = google_compute_instance_group_manager.web_igm.id

  autoscaling_policy {
    min_replicas = var.instance_group_size_min
    max_replicas = var.instance_group_size_max

    cpu_utilization {
      target = 0.6
    }

    cooldown_period = 60
  }
}
