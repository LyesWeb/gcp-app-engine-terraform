provider "google" {
  project = var.project_id
  region  = var.region
}

# Enable required APIs
resource "google_project_service" "appengine" {
  project = var.project_id
  service = "appengine.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "cloudbuild" {
  project = var.project_id
  service = "cloudbuild.googleapis.com"
  disable_on_destroy = false
}

# Create App Engine application
resource "google_app_engine_application" "app" {
  project     = var.project_id
  location_id = var.app_location
  depends_on  = [google_project_service.appengine]
}

# Output the URL of the deployed app
output "app_url" {
  value = "https://${var.project_id}.appspot.com"
}