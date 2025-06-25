resource "google_storage_bucket" "bucket1" {
  name          = "${var.project_id}-bucket-region1"
  location      = var.region1
  force_destroy = true

  versioning {
    enabled = true
  }
}

resource "google_storage_bucket" "bucket2" {
  name          = "${var.project_id}-bucket-region2"
  location      = var.region2
  force_destroy = true

  versioning {
    enabled = true
  }
}

resource "google_storage_bucket" "testbucket" {
  name          = "test-bucket"
  location      = var.region2
  force_destroy = true

  versioning {
    enabled = true
  }
}
resource "google_firestore_database" "multidata" {
  name        = "multidata" # This is the database ID
  project     = var.project_id
  location_id = "nam5" # Multi-region US
  type        = "FIRESTORE_NATIVE"
}
