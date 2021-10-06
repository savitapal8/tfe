
resource "google_compute_router" "foobar" {
  name    = "router"
  network = google_compute_network.foobar.name
  bgp {
    asn = 16550
  }
}

resource "google_compute_network" "foobar" {
  name                    = "network"
  auto_create_subnetworks = false
}

resource "google_compute_interconnect_attachment" "on_prem_1" {
  name                     = "on-prem-attachment"
  edge_availability_domain = "AVAILABILITY_DOMAIN_1"
  type                     = "PARTNER"
  router                   = google_compute_router.foobar.id
}

resource "google_compute_interconnect_attachment" "on_prem_2" {
  name                     = "on-prem-attachment"
  edge_availability_domain = "AVAILABILITY_DOMAIN_1"
  type                     = "PARTNER"
  router                   = google_compute_router.foobar.id
  mtu                      = 1500
  region = "eu-central-1"
}