resource "google_secret_manager_secret" "secret-basic" {
  secret_id = "secret1"

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
        location = "us-central1"
        customer_managed_encryption {
          kms_key_name = google_kms_crypto_key.crypto_key.id
        }
      }
      replicas {
        location = "us-east1"
      }
    }
  }
}


resource "google_secret_manager_secret" "secret-basic-2" {
  secret_id = "secret2"

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
        location = "us-central1"
        customer_managed_encryption {
          kms_key_name = "projects/projectId/locations/region/keyRings/keyRingName/cryptoKeys/keyName"
        }
      }
    }
  }

}

resource "google_secret_manager_secret" "secret-basic-3" {
  secret_id = "secret2"

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
        location = "us-central1"
      }
    }
  }

}