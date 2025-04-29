variable "project_id" {
  description = "The GCP Project ID"
  type        = string
}

variable "region" {
  description = "The GCP region to deploy resources"
  type        = string
  default     = "us-central1"
}

variable "app_location" {
  description = "The App Engine location"
  type        = string
  default     = "us-central"
}