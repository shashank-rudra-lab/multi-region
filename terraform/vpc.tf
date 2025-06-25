resource "google_compute_network" "vpc1" {
  name                    = "vpc-region1"
  auto_create_subnetworks = false
}

resource "google_compute_network" "vpc2" {
  name                    = "vpc-region2"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet1" {
  name          = "subnet-region1"
  ip_cidr_range = "10.10.0.0/16"
  region        = var.region1
  network       = google_compute_network.vpc1.id
}

resource "google_compute_subnetwork" "subnet2" {
  name          = "subnet-region2"
  ip_cidr_range = "10.20.0.0/16"
  region        = var.region2
  network       = google_compute_network.vpc2.id
}

resource "google_compute_firewall" "allow-internet-vpc1" {
  name    = "allow-internet-vpc1"
  network = google_compute_network.vpc1.name

  allow {
    protocol = "tcp"
    ports    = ["80", "443", "22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow-internet-vpc2" {
  name    = "allow-internet-vpc2"
  network = google_compute_network.vpc2.name

  allow {
    protocol = "tcp"
    ports    = ["80", "443", "22"]
  }

  source_ranges = ["0.0.0.0/0"]
}
