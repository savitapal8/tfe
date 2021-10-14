provider "google"{
    region = var.region
}

resource "google_compute_router" "foobar" {
  name    = "router"
  project = var.project_id
  #region  = "us-central1"
  network = google_compute_network.foobar.name
  bgp {
    asn = 16550
  }
}

resource "google_compute_network" "vpc_network" {
  name     = "network"
  project  = var.project_id
  auto_create_subnetworks = false  
}

resource "google_compute_interconnect_attachment" "on_prem" {
  name                     = "on-prem-attachment"
  project                  = var.project_id
  edge_availability_domain = "AVAILABILITY_DOMAIN_1"
  type                     = "PARTNER"
  router                   = google_compute_router.foobar.id
  mtu                      = 1500
}
