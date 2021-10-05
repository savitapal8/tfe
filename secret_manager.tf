resource "google_secret_manager_secret" "secret-basic" {
  secret_id = "secret"

  labels = {
    gcp_region           = "US"
    owner                = "hybridenv"
    application_division = "pci"
    application_name     = "demo"
    application_role     = "app"
    environment          = "dev"
    au                   = "0223092"
    data_confidentiality = "pub"
    data_compliance      = "pci"
    data_type            = "test"
    created              = "YYYYMMDD"
  }

  replication {
    user_managed {
      replicas {
        location = "eu-central1"
      }
      replicas {
        location = "us-east1"
      }
    }
  }
}