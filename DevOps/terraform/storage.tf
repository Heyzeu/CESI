resource "google_storage_bucket" "app_bucket" {
  name          = var.bucket_name
  location      = var.region
  force_destroy = true

  uniform_bucket_level_access = true

  versioning {
    enabled = false
  }
}

# (Optionnel) Exemple d'objet à uploader
resource "google_storage_bucket_object" "example_object" {
  name   = "example.txt"
  bucket = google_storage_bucket.app_bucket.name
  content = "Fichier stocké via Terraform."
}
