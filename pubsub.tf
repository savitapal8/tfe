resource "google_pubsub_topic" "kms_topic" {
  name = "example-topic"
  kms_key_name = google_kms_crypto_key.crypto_key.id

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

resource "google_pubsub_topic" "kms_topic_1" {
  name = "example-topic"
  kms_key_name = "projects/project-01/locations/us-central1/keyRings/uskeyring/cryptoKeys/pubsub"

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

resource "google_pubsub_topic" "example1" {
  name = "example-topic-no-labels"
}