output "bucket_name" {
  description = "Nom du bucket Cloud Storage"
  value       = google_storage_bucket.app_bucket.name
}

output "db_instance_connection_name" {
  description = "Connection name de l'instance Cloud SQL"
  value       = google_sql_database_instance.db_instance.connection_name
}

output "lb_ip_address" {
  description = "Adresse IP globale du load balancer"
  value       = google_compute_global_address.lb_ip.address
}
