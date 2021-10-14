resource "google_compute_router" "foobar" {
  name    = "router"
  project = var.project_id
  region  = var.region
  network = google_compute_network.vpc_network.name
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
  region                   = var.region
  mtu                      = 1500
  edge_availability_domain = "AVAILABILITY_DOMAIN_1"
  type                     = "PARTNER"
  router                   = google_compute_router.foobar.id
}
