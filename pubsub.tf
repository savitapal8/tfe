resource "google_pubsub_topic" "example" {
  name = "example-topic"

  message_storage_policy { 
    allowed_persistence_regions = ["us-central1","us-central2"]
  }

  labels = {
    gcp_region = "US"
    owner = "hybridenv"
    application_division = "pci"
    application_name = "demo"
    application_role = "app"
    environment = "dev"
    au = "0223092"
    data_confidentiality = "pub"
    data_compliance = "pci"
    data_type = "test"
    created = "YYYYMMDD"
  }
}