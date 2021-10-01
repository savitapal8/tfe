provider "google" {
  user_project_override = true
  access_token          = var.access_token
}
resource "google_service_account" "default" {
  account_id   = "service-account-id"
  display_name = "Service Account"
}